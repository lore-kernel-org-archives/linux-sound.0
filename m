Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ykwKfFw+"
X-Greylist: delayed 452 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Dec 2023 12:40:33 PST
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA601AD;
	Sat,  9 Dec 2023 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702153982;
	bh=TzyoNuAA4uLPTNaYdysYomHXJCzqvC24wGjdvS+/C1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ykwKfFw+7Sk3oRDc9+FcUiL8Qc4AsZMKQsblOQBvgpko06dMGDX7G17RM34qTwiUd
	 JVJfq5Xe7osvbw9slgibF82/+LgNkkH9oIbt+8ZPWXktngMt8gmDupWCU4r6j0M4qR
	 z99+zgacwo7cqjjyww4pMmHRqwvakGRNMCz9Hs5gdRp0OYwQNkP8nxuiYBwTUbmruD
	 o3jNGNG8LevbPmJ0Ese7lNhHYBNpfjuC0IqkTdaSzDySX2SHdwEcONEYVibbBG92Bw
	 ZH7QpQI8QdpJfHxVks6a1OW1BIz5qvi9v9IRguVH3bsbOcfP+7dGwfdlNQ2kxKlr+w
	 IEtEY/EeuWTKQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 760E137813DC;
	Sat,  9 Dec 2023 20:33:02 +0000 (UTC)
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
Subject: [PATCH 4/5] ASoC: amd: acp-config: Add missing MODULE_DESCRIPTION
Date: Sat,  9 Dec 2023 22:32:22 +0200
Message-ID: <20231209203229.878730-5-cristian.ciocaltea@collabora.com>
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

Add the missing MODULE_DESCRIPTION() to avoid the following warning when
building with W=1:

WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o

Fixes: f1bdd8d385a8 ("ASoC: amd: Add module to determine ACP configuration")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/acp-config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 5c8cf75be009..42c2322cd11b 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -321,4 +321,5 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_machines);
 
+MODULE_DESCRIPTION("AMD ACP Machine Configuration Module");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0

