Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EBF21A45B
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205566; cv=none; b=plNSm/zUcP4HCGGqsPFW3X49WX9TtLbDV21sFMJYOxvXXfuhFb3lOm45Wf72XWjVROZiPBAqjF2yjBReJPgCBuiBbu82jHk+LNwfjLNAqWatsTGAPbo1pWRGAK/XANWr20IUWUHKtME+9G28G50U7+PTQu69/vvUV5+7gbw1KO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205566; c=relaxed/simple;
	bh=rUq1Hl6OargQ5lOB1EH5RQ09JPFdrap1GY/4liWuF6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYFKbArNPODU3pk8AFYgeOCfNuS6sdps3UuQU9VQZiaE1V4l0V8arrul3r4NmPGr6hkfHe4T/dWq9+cvKMBEqhzzDTC3Xmgayp11Z3E2/lSnXislv0KPiMXFfiAt84Ka+VWpkyww7wLlO3n9WeDZTUcmcUyhhTc46N2uB2Fs/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qUtBQgMI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=47rF2Mdu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qUtBQgMI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=47rF2Mdu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qUtBQgMI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="47rF2Mdu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qUtBQgMI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="47rF2Mdu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDD8E20239;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaBAIbW155jbXLJIy9bsjYHk9xklqJuy92UeQuHMQ8Q=;
	b=qUtBQgMINqodDtilkmR7BAhOsWcQUZ6DuoTf04xzzOe91cBiUD2/kROoiMZ7wL6npXgtSC
	ahCaWNIb4sQQ97ztI4pj22eHfqk5mGd4MpqLMSNZbVDVeHREvskRuSgOAbYPKGDoIxPMwT
	OwULGuNYdxy+nes+s1CllXfdqweapL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaBAIbW155jbXLJIy9bsjYHk9xklqJuy92UeQuHMQ8Q=;
	b=47rF2MdukH8IpgSWBKZXF5VdBJpwjSU4yQQHlA8hlDa9fn/lzb6sjGt5mUBdFDkbt0MOGi
	dnfEi9pcWpsQtXCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaBAIbW155jbXLJIy9bsjYHk9xklqJuy92UeQuHMQ8Q=;
	b=qUtBQgMINqodDtilkmR7BAhOsWcQUZ6DuoTf04xzzOe91cBiUD2/kROoiMZ7wL6npXgtSC
	ahCaWNIb4sQQ97ztI4pj22eHfqk5mGd4MpqLMSNZbVDVeHREvskRuSgOAbYPKGDoIxPMwT
	OwULGuNYdxy+nes+s1CllXfdqweapL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaBAIbW155jbXLJIy9bsjYHk9xklqJuy92UeQuHMQ8Q=;
	b=47rF2MdukH8IpgSWBKZXF5VdBJpwjSU4yQQHlA8hlDa9fn/lzb6sjGt5mUBdFDkbt0MOGi
	dnfEi9pcWpsQtXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DC0F132CF;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cPJ+Gcfx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 59/88] ASoC: fsl: Convert to RUNTIME_PM_OPS() and co
Date: Mon, 17 Mar 2025 10:55:21 +0100
Message-ID: <20250317095603.20073-60-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,suse.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -5.30
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr()

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl_aud2htx.c | 3 +--
 sound/soc/fsl/fsl_esai.c    | 9 +++------
 sound/soc/fsl/fsl_micfil.c  | 9 +++------
 sound/soc/fsl/fsl_sai.c     | 8 +++-----
 sound/soc/fsl/fsl_xcvr.c    | 3 +--
 5 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index bde642318835..da401561e2de 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -290,8 +290,7 @@ static int fsl_aud2htx_runtime_resume(struct device *dev)
 static const struct dev_pm_ops fsl_aud2htx_pm_ops = {
 	RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend, fsl_aud2htx_runtime_resume,
 		       NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_aud2htx_driver = {
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 0b247f16a163..cde0b0c6c1ef 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1189,11 +1189,8 @@ static int fsl_esai_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_esai_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_esai_runtime_suspend,
-			   fsl_esai_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_esai_runtime_suspend, fsl_esai_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_esai_driver = {
@@ -1201,7 +1198,7 @@ static struct platform_driver fsl_esai_driver = {
 	.remove = fsl_esai_remove,
 	.driver = {
 		.name = "fsl-esai-dai",
-		.pm = &fsl_esai_pm_ops,
+		.pm = pm_ptr(&fsl_esai_pm_ops),
 		.of_match_table = fsl_esai_dt_ids,
 	},
 };
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 73d8910a6188..aabd90a8b3ec 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -1512,11 +1512,8 @@ static int fsl_micfil_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_micfil_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_micfil_runtime_suspend,
-			   fsl_micfil_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_micfil_runtime_suspend, fsl_micfil_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_micfil_driver = {
@@ -1524,7 +1521,7 @@ static struct platform_driver fsl_micfil_driver = {
 	.remove = fsl_micfil_remove,
 	.driver = {
 		.name = "fsl-micfil-dai",
-		.pm = &fsl_micfil_pm_ops,
+		.pm = pm_ptr(&fsl_micfil_pm_ops),
 		.of_match_table = fsl_micfil_dt_ids,
 	},
 };
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 9f33dd11d47f..ed2b4780c470 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1817,10 +1817,8 @@ static int fsl_sai_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_sai_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_sai_runtime_suspend,
-			   fsl_sai_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_sai_runtime_suspend, fsl_sai_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_sai_driver = {
@@ -1828,7 +1826,7 @@ static struct platform_driver fsl_sai_driver = {
 	.remove = fsl_sai_remove,
 	.driver = {
 		.name = "fsl-sai",
-		.pm = &fsl_sai_pm_ops,
+		.pm = pm_ptr(&fsl_sai_pm_ops),
 		.of_match_table = fsl_sai_ids,
 	},
 };
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c59c1af5a98a..83aea341c1b6 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1821,8 +1821,7 @@ static int fsl_xcvr_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops fsl_xcvr_pm_ops = {
 	RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend, fsl_xcvr_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_xcvr_driver = {
-- 
2.43.0

