Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nlHLkOkF"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AD81A1;
	Sat,  9 Dec 2023 12:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702153980;
	bh=sIlCWiBKcvvpf7yqKhWxYi3/+vptlEShe0kQnwJBPzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nlHLkOkFNVgGOwNF9ebHckGuk+HGEseeWGdr82SOBTEo9ncTuQ3tSZN3nmJAxt69u
	 eLFVouyG9kBlerm5fP1CS4Iia9tOtxPtALoL9PYxXmocwLixkOCI9WakBILb6/mkd4
	 UIOsDT2RHppq0dwft8P4dSIe60qaPcCldIPA5rNzlnsezW0nfyxUn1IML7wEhek64M
	 MdlgI7DBq07cjpSnT+lF4eq5UmXcwBWr6cVFNdEnL7adUgCTeGSf6K5g8Xg0f8pUvW
	 XKmqOZ+Qf91kjNvRN8VNbw2rcyuzns/VR1ETO6SoxHqZ0Vi3qxO67nCUAZuiRs64V6
	 u1ZXjX++YqPUw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2A35B37813DB;
	Sat,  9 Dec 2023 20:33:00 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Marian Postevca <posteuca@mutex.one>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Bard Liao <bard.liao@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/5] ASoC: amd: vangogh: Allow probing ACP PCI when SOF is disabled
Date: Sat,  9 Dec 2023 22:32:20 +0200
Message-ID: <20231209203229.878730-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231209203229.878730-1-cristian.ciocaltea@collabora.com>
References: <20231209203229.878730-1-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit e89f45edb747 ("ASoC: amd: vangogh: Add check for acp config
flags in vangogh platform"), the Vangogh ACP PCI driver could not be used
anymore for boards which happen to have a matching entry in acp-config
list.

Commit f18818eb0dbe ("ASoC: amd: vangogh: Add condition check for acp
config flag") slightly changed the behaviour to permit loading the
driver if AMD_LEGACY flag is set.  However, for AMD_SOF flag the probing
is still denied, even if SOF support is disabled in kernel
configuration.

While this helps preventing conflicts between SOF and generic ACP
drivers, there are cases where a fallback to the generic non-SOF support
would still be needed or useful, e.g. SOF firmware is not available or
doesn't work properly, SOF driver is broken or doesn't provide full
support for a particular hardware, or simply for testing/debugging the
alternative solution.  A real-life example is Steam Deck OLED, which
works with both drivers.

Prevent returning from probe() when ACP config indicates SOF support for
the current board *and* the Vangogh SOF driver is not enabled in kernel
configuration.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/vangogh/pci-acp5x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 3826443d77b9..10755c07949c 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -130,9 +130,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	int ret, i;
 	u32 addr, val;
 
-	/* Return if acp config flag is defined */
+	/*
+	 * Return if ACP config flag is defined, except when board
+	 * supports SOF while it is not being enabled in kernel config.
+	 */
 	flag = snd_amd_acp_find_config(pci);
-	if (flag != FLAG_AMD_LEGACY)
+	if (flag != FLAG_AMD_LEGACY &&
+	    (flag != FLAG_AMD_SOF || IS_ENABLED(CONFIG_SND_SOC_SOF_AMD_VANGOGH)))
 		return -ENODEV;
 
 	irqflags = IRQF_SHARED;
-- 
2.43.0

