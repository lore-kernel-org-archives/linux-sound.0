Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDA31D5CD4
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887968; cv=none; b=BNt9phk+p084xepw66+7miPmCIKBbxariYGvrLNG9namwSdZf7XyRDCuTZtQ4abxCY7w/Z59t72xuRAS76YRXx4oqsRNy1J4U3t2ZbWkIQJZXGmoeodvIn4xay/ps6IDNbjxKBckbvlEf7yXl+drpnghAeJqtaLPhLa42Pu1FmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887968; c=relaxed/simple;
	bh=rQBACE/nmNHIJ2J46iPYsanZKBs7gE8Sop5l4HwWN1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPgRgjmiKpHLI5FB/rzDW3nu2BbLMp5WTfCV+jJB+GctCzZU322na86jdE9vEWzufIuYS+xfdHRM/ihrc63wSvx034BZTXTcwGIMSKI4A53cspw6mzE9hecWdJTC6mCgqPYlg0/+9CANNNbaBXe7Ra/uy/1GDRlZh2WqBTm6Z4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BRT66L84; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j9Nds4mA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BRT66L84; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j9Nds4mA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BRT66L84";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j9Nds4mA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BRT66L84";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j9Nds4mA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 970C01F793;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=th0YCbaFHsS59aejZhCj1HnW/u49al+2uQ9froe03EY=;
	b=BRT66L84BYcciXE52d+YoUGhb8ULKCsQwAhcK6u/FY1qm/rywpyiZ2Cs92MKJGTP4VoQFi
	o47u6+8NcF7tPJ0vxRztqXiENj59TaSdcznGww45qC+GgwmczFiMSMCWGtHbIUiemc0ijh
	ktRG5te7gBWCF2x730W8jJ8UpPkLu54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=th0YCbaFHsS59aejZhCj1HnW/u49al+2uQ9froe03EY=;
	b=j9Nds4mAf5roQDoxKGO1zy4vD9gHQKGrpxRfXxGVr8z15MPORFD58BtREL9xFo51EGYIAP
	mHecfY5Vfpg952BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BRT66L84;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=j9Nds4mA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=th0YCbaFHsS59aejZhCj1HnW/u49al+2uQ9froe03EY=;
	b=BRT66L84BYcciXE52d+YoUGhb8ULKCsQwAhcK6u/FY1qm/rywpyiZ2Cs92MKJGTP4VoQFi
	o47u6+8NcF7tPJ0vxRztqXiENj59TaSdcznGww45qC+GgwmczFiMSMCWGtHbIUiemc0ijh
	ktRG5te7gBWCF2x730W8jJ8UpPkLu54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=th0YCbaFHsS59aejZhCj1HnW/u49al+2uQ9froe03EY=;
	b=j9Nds4mAf5roQDoxKGO1zy4vD9gHQKGrpxRfXxGVr8z15MPORFD58BtREL9xFo51EGYIAP
	mHecfY5Vfpg952BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 744B6137BA;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EH/2GvEY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 88/89] ASoC: amd: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:33 +0100
Message-ID: <20250313174139.29942-89-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 970C01F793
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping ugly __maybe_unused attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/amd/acp/acp-pci.c           | 10 +++++-----
 sound/soc/amd/acp/acp-rembrandt.c     |  6 +++---
 sound/soc/amd/acp/acp-renoir.c        |  6 +++---
 sound/soc/amd/acp/acp63.c             |  6 +++---
 sound/soc/amd/acp/acp70.c             |  6 +++---
 sound/soc/amd/ps/pci-ps.c             | 12 ++++++------
 sound/soc/amd/ps/ps-pdm-dma.c         | 12 ++++++------
 sound/soc/amd/ps/ps-sdw-dma.c         |  6 +++---
 sound/soc/amd/rpl/rpl-pci-acp6x.c     | 10 +++++-----
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 11 +++++------
 sound/soc/amd/yc/acp6x-pdm-dma.c      | 12 ++++++------
 sound/soc/amd/yc/pci-acp6x.c          | 10 +++++-----
 12 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 9322379cb36f..de1cdca5ade7 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -221,7 +221,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	return ret;
 };
 
-static int __maybe_unused snd_acp_suspend(struct device *dev)
+static int snd_acp_suspend(struct device *dev)
 {
 	struct acp_chip_info *chip;
 	int ret;
@@ -233,7 +233,7 @@ static int __maybe_unused snd_acp_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused snd_acp_resume(struct device *dev)
+static int snd_acp_resume(struct device *dev)
 {
 	struct acp_chip_info *chip;
 	int ret;
@@ -251,8 +251,8 @@ static int __maybe_unused snd_acp_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp_pm_ops = {
-	SET_RUNTIME_PM_OPS(snd_acp_suspend, snd_acp_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(snd_acp_suspend, snd_acp_resume)
+	RUNTIME_PM_OPS(snd_acp_suspend, snd_acp_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(snd_acp_suspend, snd_acp_resume)
 };
 
 static void acp_pci_remove(struct pci_dev *pci)
@@ -289,7 +289,7 @@ static struct pci_driver snd_amd_acp_pci_driver = {
 	.probe = acp_pci_probe,
 	.remove = acp_pci_remove,
 	.driver = {
-		.pm = &acp_pm_ops,
+		.pm = pm_ptr(&acp_pm_ops),
 	},
 };
 module_pci_driver(snd_amd_acp_pci_driver);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 21614e2e1b6c..746b6ed72029 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -197,7 +197,7 @@ static void rembrandt_audio_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused rmb_pcm_resume(struct device *dev)
+static int rmb_pcm_resume(struct device *dev)
 {
 	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
@@ -227,7 +227,7 @@ static int __maybe_unused rmb_pcm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rmb_dma_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, rmb_pcm_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, rmb_pcm_resume)
 };
 
 static struct platform_driver rembrandt_driver = {
@@ -235,7 +235,7 @@ static struct platform_driver rembrandt_driver = {
 	.remove = rembrandt_audio_remove,
 	.driver = {
 		.name = "acp_asoc_rembrandt",
-		.pm = &rmb_dma_pm_ops,
+		.pm = pm_ptr(&rmb_dma_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index b8ded929d52e..ebf0106fc737 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -144,7 +144,7 @@ static void renoir_audio_remove(struct platform_device *pdev)
 	acp_platform_unregister(dev);
 }
 
-static int __maybe_unused rn_pcm_resume(struct device *dev)
+static int rn_pcm_resume(struct device *dev)
 {
 	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
@@ -171,7 +171,7 @@ static int __maybe_unused rn_pcm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rn_dma_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, rn_pcm_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, rn_pcm_resume)
 };
 
 static struct platform_driver renoir_driver = {
@@ -179,7 +179,7 @@ static struct platform_driver renoir_driver = {
 	.remove = renoir_audio_remove,
 	.driver = {
 		.name = "acp_asoc_renoir",
-		.pm = &rn_dma_pm_ops,
+		.pm = pm_ptr(&rn_dma_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 53c013a64854..52d895e624c7 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -248,7 +248,7 @@ static void acp63_audio_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused acp63_pcm_resume(struct device *dev)
+static int acp63_pcm_resume(struct device *dev)
 {
 	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
@@ -278,7 +278,7 @@ static int __maybe_unused acp63_pcm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp63_dma_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp63_pcm_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, acp63_pcm_resume)
 };
 
 static struct platform_driver acp63_driver = {
@@ -286,7 +286,7 @@ static struct platform_driver acp63_driver = {
 	.remove = acp63_audio_remove,
 	.driver = {
 		.name = "acp_asoc_acp63",
-		.pm = &acp63_dma_pm_ops,
+		.pm = pm_ptr(&acp63_dma_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 1a89f8a3724f..6d5f5ade075c 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -180,7 +180,7 @@ static void acp_acp70_audio_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused acp70_pcm_resume(struct device *dev)
+static int acp70_pcm_resume(struct device *dev)
 {
 	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
@@ -207,7 +207,7 @@ static int __maybe_unused acp70_pcm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp70_dma_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp70_pcm_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, acp70_pcm_resume)
 };
 
 static struct platform_driver acp70_driver = {
@@ -215,7 +215,7 @@ static struct platform_driver acp70_driver = {
 	.remove = acp_acp70_audio_remove,
 	.driver = {
 		.name = "acp_asoc_acp70",
-		.pm = &acp70_dma_pm_ops,
+		.pm = pm_ptr(&acp70_dma_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 221c65ff03c9..8e57f31ef7f7 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -668,24 +668,24 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	return ret;
 }
 
-static int __maybe_unused snd_acp_suspend(struct device *dev)
+static int snd_acp_suspend(struct device *dev)
 {
 	return acp_hw_suspend(dev);
 }
 
-static int __maybe_unused snd_acp_runtime_resume(struct device *dev)
+static int snd_acp_runtime_resume(struct device *dev)
 {
 	return acp_hw_runtime_resume(dev);
 }
 
-static int __maybe_unused snd_acp_resume(struct device *dev)
+static int snd_acp_resume(struct device *dev)
 {
 	return acp_hw_resume(dev);
 }
 
 static const struct dev_pm_ops acp63_pm_ops = {
-	SET_RUNTIME_PM_OPS(snd_acp_suspend, snd_acp_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(snd_acp_suspend, snd_acp_resume)
+	RUNTIME_PM_OPS(snd_acp_suspend, snd_acp_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(snd_acp_suspend, snd_acp_resume)
 };
 
 static void snd_acp63_remove(struct pci_dev *pci)
@@ -727,7 +727,7 @@ static struct pci_driver ps_acp63_driver  = {
 	.probe = snd_acp63_probe,
 	.remove = snd_acp63_remove,
 	.driver = {
-		.pm = &acp63_pm_ops,
+		.pm = pm_ptr(&acp63_pm_ops),
 	}
 };
 
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 7cdeb34e8f73..9cfbe05ad996 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -402,7 +402,7 @@ static void acp63_pdm_audio_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused acp63_pdm_resume(struct device *dev)
+static int acp63_pdm_resume(struct device *dev)
 {
 	struct pdm_dev_data *adata;
 	struct snd_pcm_runtime *runtime;
@@ -423,7 +423,7 @@ static int __maybe_unused acp63_pdm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused acp63_pdm_suspend(struct device *dev)
+static int acp63_pdm_suspend(struct device *dev)
 {
 	struct pdm_dev_data *adata;
 
@@ -432,7 +432,7 @@ static int __maybe_unused acp63_pdm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused acp63_pdm_runtime_resume(struct device *dev)
+static int acp63_pdm_runtime_resume(struct device *dev)
 {
 	struct pdm_dev_data *adata;
 
@@ -442,8 +442,8 @@ static int __maybe_unused acp63_pdm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp63_pdm_pm_ops = {
-	SET_RUNTIME_PM_OPS(acp63_pdm_suspend, acp63_pdm_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(acp63_pdm_suspend, acp63_pdm_resume)
+	RUNTIME_PM_OPS(acp63_pdm_suspend, acp63_pdm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(acp63_pdm_suspend, acp63_pdm_resume)
 };
 
 static struct platform_driver acp63_pdm_dma_driver = {
@@ -451,7 +451,7 @@ static struct platform_driver acp63_pdm_dma_driver = {
 	.remove = acp63_pdm_audio_remove,
 	.driver = {
 		.name = "acp_ps_pdm_dma",
-		.pm = &acp63_pdm_pm_ops,
+		.pm = pm_ptr(&acp63_pdm_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 21b336109c99..1b933a017c06 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -767,7 +767,7 @@ static int acp70_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 	return 0;
 }
 
-static int __maybe_unused acp63_sdw_pcm_resume(struct device *dev)
+static int acp63_sdw_pcm_resume(struct device *dev)
 {
 	struct sdw_dma_dev_data *sdw_data;
 
@@ -779,7 +779,7 @@ static int __maybe_unused acp63_sdw_pcm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp63_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp63_sdw_pcm_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, acp63_sdw_pcm_resume)
 };
 
 static struct platform_driver acp63_sdw_dma_driver = {
@@ -787,7 +787,7 @@ static struct platform_driver acp63_sdw_dma_driver = {
 	.remove = acp63_sdw_platform_remove,
 	.driver = {
 		.name = "amd_ps_sdw_dma",
-		.pm = &acp63_pm_ops,
+		.pm = pm_ptr(&acp63_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pci-acp6x.c
index a8e548ed991b..e3afe9172bdf 100644
--- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
+++ b/sound/soc/amd/rpl/rpl-pci-acp6x.c
@@ -159,7 +159,7 @@ static int snd_rpl_probe(struct pci_dev *pci,
 	return ret;
 }
 
-static int __maybe_unused snd_rpl_suspend(struct device *dev)
+static int snd_rpl_suspend(struct device *dev)
 {
 	struct rpl_dev_data *adata;
 	int ret;
@@ -171,7 +171,7 @@ static int __maybe_unused snd_rpl_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused snd_rpl_resume(struct device *dev)
+static int snd_rpl_resume(struct device *dev)
 {
 	struct rpl_dev_data *adata;
 	int ret;
@@ -184,8 +184,8 @@ static int __maybe_unused snd_rpl_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rpl_pm = {
-	SET_RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
+	RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
 };
 
 static void snd_rpl_remove(struct pci_dev *pci)
@@ -217,7 +217,7 @@ static struct pci_driver rpl_acp6x_driver  = {
 	.probe = snd_rpl_probe,
 	.remove = snd_rpl_remove,
 	.driver = {
-		.pm = &rpl_pm,
+		.pm = pm_ptr(&rpl_pm),
 	}
 };
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index d5965f2b09bc..aa4726899434 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -420,7 +420,7 @@ static void acp5x_audio_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused acp5x_pcm_resume(struct device *dev)
+static int acp5x_pcm_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	struct i2s_stream_instance *rtd;
@@ -473,7 +473,7 @@ static int __maybe_unused acp5x_pcm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused acp5x_pcm_suspend(struct device *dev)
+static int acp5x_pcm_suspend(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 
@@ -482,7 +482,7 @@ static int __maybe_unused acp5x_pcm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused acp5x_pcm_runtime_resume(struct device *dev)
+static int acp5x_pcm_runtime_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 
@@ -492,9 +492,8 @@ static int __maybe_unused acp5x_pcm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp5x_pm_ops = {
-	SET_RUNTIME_PM_OPS(acp5x_pcm_suspend,
-			   acp5x_pcm_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(acp5x_pcm_suspend, acp5x_pcm_resume)
+	RUNTIME_PM_OPS(acp5x_pcm_suspend, acp5x_pcm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(acp5x_pcm_suspend, acp5x_pcm_resume)
 };
 
 static struct platform_driver acp5x_dma_driver = {
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 3eb3e82efb10..ac758b90f441 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -394,7 +394,7 @@ static void acp6x_pdm_audio_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused acp6x_pdm_resume(struct device *dev)
+static int acp6x_pdm_resume(struct device *dev)
 {
 	struct pdm_dev_data *adata;
 	struct snd_pcm_runtime *runtime;
@@ -415,7 +415,7 @@ static int __maybe_unused acp6x_pdm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused acp6x_pdm_suspend(struct device *dev)
+static int acp6x_pdm_suspend(struct device *dev)
 {
 	struct pdm_dev_data *adata;
 
@@ -424,7 +424,7 @@ static int __maybe_unused acp6x_pdm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused acp6x_pdm_runtime_resume(struct device *dev)
+static int acp6x_pdm_runtime_resume(struct device *dev)
 {
 	struct pdm_dev_data *adata;
 
@@ -434,8 +434,8 @@ static int __maybe_unused acp6x_pdm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp6x_pdm_pm_ops = {
-	SET_RUNTIME_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_resume)
+	RUNTIME_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_resume)
 };
 
 static struct platform_driver acp6x_pdm_dma_driver = {
@@ -443,7 +443,7 @@ static struct platform_driver acp6x_pdm_dma_driver = {
 	.remove = acp6x_pdm_audio_remove,
 	.driver = {
 		.name = "acp_yc_pdm_dma",
-		.pm = &acp6x_pdm_pm_ops,
+		.pm = pm_ptr(&acp6x_pdm_pm_ops),
 	},
 };
 
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 7af6a349b1d4..1140ed1cbb3d 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -277,7 +277,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	return ret;
 }
 
-static int __maybe_unused snd_acp6x_suspend(struct device *dev)
+static int snd_acp6x_suspend(struct device *dev)
 {
 	struct acp6x_dev_data *adata;
 	int ret;
@@ -289,7 +289,7 @@ static int __maybe_unused snd_acp6x_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused snd_acp6x_resume(struct device *dev)
+static int snd_acp6x_resume(struct device *dev)
 {
 	struct acp6x_dev_data *adata;
 	int ret;
@@ -302,8 +302,8 @@ static int __maybe_unused snd_acp6x_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops acp6x_pm = {
-	SET_RUNTIME_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume)
+	RUNTIME_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume)
 };
 
 static void snd_acp6x_remove(struct pci_dev *pci)
@@ -339,7 +339,7 @@ static struct pci_driver yc_acp6x_driver  = {
 	.probe = snd_acp6x_probe,
 	.remove = snd_acp6x_remove,
 	.driver = {
-		.pm = &acp6x_pm,
+		.pm = pm_ptr(&acp6x_pm),
 	}
 };
 
-- 
2.43.0

