Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PmfACO10"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D834213A;
	Sat,  9 Dec 2023 12:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702153981;
	bh=3an5VNl71NRgnt3gpyTrGYWNJfJ93WLbctgGf4WYCz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PmfACO109Y5TY6iCrr1Oa8UfTCGGEqwV8cQ+ljhQU58GlJffxvQQuI5xeSZ9hANUm
	 onEzuuNsDY+fp4PcEW2mtRXy2q4ySg1qXmnNASZlfraVH3KYdsj+jiKTaX9nt744Ik
	 9PhiIT4a6RAJYuUFhx8R9gA9JASWXTpOD5mcm+Urq32L+4+hr+D+XXOfIgototSLYK
	 RL8SrGnYiRpfBMo+4CsxwkRWkAhIxPUnw1etJncWgv6eLI50e/PXmJdjMDOejEzUff
	 CqvBccn4qyfMwivdANMAMFO2sIRPZCF8tijZ+NrYYNeOhYYvnecLKQgm6aiML5umys
	 7NJijbbMsKccw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5381937813DD;
	Sat,  9 Dec 2023 20:33:01 +0000 (UTC)
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
Subject: [PATCH 3/5] ASoC: amd: vangogh: Switch to {RUNTIME,SYSTEM_SLEEP}_PM_OPS
Date: Sat,  9 Dec 2023 22:32:21 +0200
Message-ID: <20231209203229.878730-4-cristian.ciocaltea@collabora.com>
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

Replace the old SET_{RUNTIME,SYSTEM_SLEEP}_PM_OPS() helpers with their
modern alternatives and drop the now unnecessary __maybe_unused
qualifier in the suspend and resume functions.

Additionally, make use of pm_ptr() to ensure the PM ops are dropped when
building with CONFIG_PM disabled.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/vangogh/pci-acp5x.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 10755c07949c..af56ff09f02a 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -264,7 +264,7 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	return ret;
 }
 
-static int __maybe_unused snd_acp5x_suspend(struct device *dev)
+static int snd_acp5x_suspend(struct device *dev)
 {
 	int ret;
 	struct acp5x_dev_data *adata;
@@ -279,7 +279,7 @@ static int __maybe_unused snd_acp5x_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused snd_acp5x_resume(struct device *dev)
+static int snd_acp5x_resume(struct device *dev)
 {
 	int ret;
 	struct acp5x_dev_data *adata;
@@ -294,9 +294,8 @@ static int __maybe_unused snd_acp5x_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp5x_pm = {
-	SET_RUNTIME_PM_OPS(snd_acp5x_suspend,
-			   snd_acp5x_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume)
+	RUNTIME_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume)
 };
 
 static void snd_acp5x_remove(struct pci_dev *pci)
@@ -332,7 +331,7 @@ static struct pci_driver acp5x_driver  = {
 	.probe = snd_acp5x_probe,
 	.remove = snd_acp5x_remove,
 	.driver = {
-		.pm = &acp5x_pm,
+		.pm = pm_ptr(&acp5x_pm),
 	}
 };
 
-- 
2.43.0

