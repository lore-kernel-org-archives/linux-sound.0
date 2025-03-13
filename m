Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE51D5AB5
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887900; cv=none; b=OjtyVgdTn9duzVAeFoOmyTDJUrVNYhJWCKoh+YMB/nqUkz/CRkot09VY1MNOJ7BtXNbjvWyDtWnk/ZcwyaSj9h4EMHh3C/t0TYoW+6jX4QgGNwwC/V0uEPskyBTBcK20p5p5Tg0XcKChiBCpL19WKLFZWxypatUW+kofgDNjvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887900; c=relaxed/simple;
	bh=FQseqfWqnt7rDGS5tlc3+c9MCbYNXqgX+8LwlCTX+JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvV2FuryaJwLiaiCHYouRjem5Q7dpVwjVmz6Fc117wvdNM1vs1W+emMfOtdCluyvjYJkAnBwXpYsqVjlBQJjAzzRtltnK3XKp8Ul2k+IUpEpzwtGXtIz+BbnlOGT/1WlWdVLnpu/JJ7YxiWYqLcCo7YL2iB2sVg/Vjg9tsNArfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2S/mDp2P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cDPzxuYS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2S/mDp2P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cDPzxuYS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2S/mDp2P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cDPzxuYS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2S/mDp2P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cDPzxuYS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C68C7211EA;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AvhhtmGqBubo8lJlurshI5OeqNn4Rc1lQcmFt2EIIY=;
	b=2S/mDp2PZPqJPhwI3/eAqZbL8U3chzvZG4eHa8uuLNpzvRTM7HqmeMzOHgVbW98yIy3vOc
	/Qfvoxa720cHwZZqOXmx/dsHFUTMBnoW7X2YIqFMhdgz4RVf0ZtmIEmRWyv3wpNGsUqUod
	dpMx4QQFY3Ih0ZsdWrErzDckQsGzF48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AvhhtmGqBubo8lJlurshI5OeqNn4Rc1lQcmFt2EIIY=;
	b=cDPzxuYSsI3J5IdFHJKUZ8rah09YNcR9Oh9UENu2JpNZswNx7WHCOjLjjbFH8wylzNBcSe
	/siqzojr4H4KUjAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AvhhtmGqBubo8lJlurshI5OeqNn4Rc1lQcmFt2EIIY=;
	b=2S/mDp2PZPqJPhwI3/eAqZbL8U3chzvZG4eHa8uuLNpzvRTM7HqmeMzOHgVbW98yIy3vOc
	/Qfvoxa720cHwZZqOXmx/dsHFUTMBnoW7X2YIqFMhdgz4RVf0ZtmIEmRWyv3wpNGsUqUod
	dpMx4QQFY3Ih0ZsdWrErzDckQsGzF48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AvhhtmGqBubo8lJlurshI5OeqNn4Rc1lQcmFt2EIIY=;
	b=cDPzxuYSsI3J5IdFHJKUZ8rah09YNcR9Oh9UENu2JpNZswNx7WHCOjLjjbFH8wylzNBcSe
	/siqzojr4H4KUjAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6BA1139D2;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iLdIJ+wY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 61/89] ASoC: img: Convert to RUNTIME_PM_OPS() and co
Date: Thu, 13 Mar 2025 18:41:06 +0100
Message-ID: <20250313174139.29942-62-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping superfluous CONFIG_PM_SLEEP
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/img/img-i2s-in.c             |  9 +++------
 sound/soc/img/img-i2s-out.c            |  9 +++------
 sound/soc/img/img-parallel-out.c       |  5 ++---
 sound/soc/img/img-spdif-in.c           |  9 +++------
 sound/soc/img/img-spdif-out.c          | 10 ++++------
 sound/soc/img/pistachio-internal-dac.c |  8 +++-----
 6 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 6a988976fb0d..98d2ab68883a 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -539,7 +539,6 @@ static void img_i2s_in_dev_remove(struct platform_device *pdev)
 		img_i2s_in_runtime_suspend(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_i2s_in_suspend(struct device *dev)
 {
 	struct img_i2s_in *i2s = dev_get_drvdata(dev);
@@ -586,7 +585,6 @@ static int img_i2s_in_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id img_i2s_in_of_match[] = {
 	{ .compatible = "img,i2s-in" },
@@ -595,16 +593,15 @@ static const struct of_device_id img_i2s_in_of_match[] = {
 MODULE_DEVICE_TABLE(of, img_i2s_in_of_match);
 
 static const struct dev_pm_ops img_i2s_in_pm_ops = {
-	SET_RUNTIME_PM_OPS(img_i2s_in_runtime_suspend,
-			   img_i2s_in_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(img_i2s_in_suspend, img_i2s_in_resume)
+	RUNTIME_PM_OPS(img_i2s_in_runtime_suspend, img_i2s_in_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(img_i2s_in_suspend, img_i2s_in_resume)
 };
 
 static struct platform_driver img_i2s_in_driver = {
 	.driver = {
 		.name = "img-i2s-in",
 		.of_match_table = img_i2s_in_of_match,
-		.pm = &img_i2s_in_pm_ops
+		.pm = pm_ptr(&img_i2s_in_pm_ops)
 	},
 	.probe = img_i2s_in_probe,
 	.remove = img_i2s_in_dev_remove
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 1211e6184d97..aedcf56a5359 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -539,7 +539,6 @@ static void img_i2s_out_dev_remove(struct platform_device *pdev)
 		img_i2s_out_runtime_suspend(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_i2s_out_suspend(struct device *dev)
 {
 	struct img_i2s_out *i2s = dev_get_drvdata(dev);
@@ -586,7 +585,6 @@ static int img_i2s_out_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id img_i2s_out_of_match[] = {
 	{ .compatible = "img,i2s-out" },
@@ -595,16 +593,15 @@ static const struct of_device_id img_i2s_out_of_match[] = {
 MODULE_DEVICE_TABLE(of, img_i2s_out_of_match);
 
 static const struct dev_pm_ops img_i2s_out_pm_ops = {
-	SET_RUNTIME_PM_OPS(img_i2s_out_runtime_suspend,
-			   img_i2s_out_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(img_i2s_out_suspend, img_i2s_out_resume)
+	RUNTIME_PM_OPS(img_i2s_out_runtime_suspend, img_i2s_out_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(img_i2s_out_suspend, img_i2s_out_resume)
 };
 
 static struct platform_driver img_i2s_out_driver = {
 	.driver = {
 		.name = "img-i2s-out",
 		.of_match_table = img_i2s_out_of_match,
-		.pm = &img_i2s_out_pm_ops
+		.pm = pm_ptr(&img_i2s_out_pm_ops)
 	},
 	.probe = img_i2s_out_probe,
 	.remove = img_i2s_out_dev_remove
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 4ec63119d67c..86b60e6dab38 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -300,15 +300,14 @@ static const struct of_device_id img_prl_out_of_match[] = {
 MODULE_DEVICE_TABLE(of, img_prl_out_of_match);
 
 static const struct dev_pm_ops img_prl_out_pm_ops = {
-	SET_RUNTIME_PM_OPS(img_prl_out_suspend,
-			   img_prl_out_resume, NULL)
+	RUNTIME_PM_OPS(img_prl_out_suspend, img_prl_out_resume, NULL)
 };
 
 static struct platform_driver img_prl_out_driver = {
 	.driver = {
 		.name = "img-parallel-out",
 		.of_match_table = img_prl_out_of_match,
-		.pm = &img_prl_out_pm_ops
+		.pm = pm_ptr(&img_prl_out_pm_ops)
 	},
 	.probe = img_prl_out_probe,
 	.remove = img_prl_out_dev_remove
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 3c513f5b8c54..82295e2508fa 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -817,7 +817,6 @@ static void img_spdif_in_dev_remove(struct platform_device *pdev)
 		img_spdif_in_runtime_suspend(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_spdif_in_suspend(struct device *dev)
 {
 	struct img_spdif_in *spdif = dev_get_drvdata(dev);
@@ -857,7 +856,6 @@ static int img_spdif_in_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id img_spdif_in_of_match[] = {
 	{ .compatible = "img,spdif-in" },
@@ -866,16 +864,15 @@ static const struct of_device_id img_spdif_in_of_match[] = {
 MODULE_DEVICE_TABLE(of, img_spdif_in_of_match);
 
 static const struct dev_pm_ops img_spdif_in_pm_ops = {
-	SET_RUNTIME_PM_OPS(img_spdif_in_runtime_suspend,
-			   img_spdif_in_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(img_spdif_in_suspend, img_spdif_in_resume)
+	RUNTIME_PM_OPS(img_spdif_in_runtime_suspend, img_spdif_in_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(img_spdif_in_suspend, img_spdif_in_resume)
 };
 
 static struct platform_driver img_spdif_in_driver = {
 	.driver = {
 		.name = "img-spdif-in",
 		.of_match_table = img_spdif_in_of_match,
-		.pm = &img_spdif_in_pm_ops
+		.pm = pm_ptr(&img_spdif_in_pm_ops)
 	},
 	.probe = img_spdif_in_probe,
 	.remove = img_spdif_in_dev_remove
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index 402695b5fc41..52f696219ef4 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -409,7 +409,6 @@ static void img_spdif_out_dev_remove(struct platform_device *pdev)
 		img_spdif_out_runtime_suspend(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_spdif_out_suspend(struct device *dev)
 {
 	struct img_spdif_out *spdif = dev_get_drvdata(dev);
@@ -448,7 +447,7 @@ static int img_spdif_out_resume(struct device *dev)
 
 	return 0;
 }
-#endif
+
 static const struct of_device_id img_spdif_out_of_match[] = {
 	{ .compatible = "img,spdif-out" },
 	{}
@@ -456,16 +455,15 @@ static const struct of_device_id img_spdif_out_of_match[] = {
 MODULE_DEVICE_TABLE(of, img_spdif_out_of_match);
 
 static const struct dev_pm_ops img_spdif_out_pm_ops = {
-	SET_RUNTIME_PM_OPS(img_spdif_out_runtime_suspend,
-			   img_spdif_out_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(img_spdif_out_suspend, img_spdif_out_resume)
+	RUNTIME_PM_OPS(img_spdif_out_runtime_suspend, img_spdif_out_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(img_spdif_out_suspend, img_spdif_out_resume)
 };
 
 static struct platform_driver img_spdif_out_driver = {
 	.driver = {
 		.name = "img-spdif-out",
 		.of_match_table = img_spdif_out_of_match,
-		.pm = &img_spdif_out_pm_ops
+		.pm = pm_ptr(&img_spdif_out_pm_ops)
 	},
 	.probe = img_spdif_out_probe,
 	.remove = img_spdif_out_dev_remove
diff --git a/sound/soc/img/pistachio-internal-dac.c b/sound/soc/img/pistachio-internal-dac.c
index fdeceb271e7f..ec4f891295c9 100644
--- a/sound/soc/img/pistachio-internal-dac.c
+++ b/sound/soc/img/pistachio-internal-dac.c
@@ -224,7 +224,6 @@ static void pistachio_internal_dac_remove(struct platform_device *pdev)
 	regulator_disable(dac->supply);
 }
 
-#ifdef CONFIG_PM
 static int pistachio_internal_dac_rt_resume(struct device *dev)
 {
 	struct pistachio_internal_dac *dac = dev_get_drvdata(dev);
@@ -251,11 +250,10 @@ static int pistachio_internal_dac_rt_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops pistachio_internal_dac_pm_ops = {
-	SET_RUNTIME_PM_OPS(pistachio_internal_dac_rt_suspend,
-			pistachio_internal_dac_rt_resume, NULL)
+	RUNTIME_PM_OPS(pistachio_internal_dac_rt_suspend,
+		       pistachio_internal_dac_rt_resume, NULL)
 };
 
 static const struct of_device_id pistachio_internal_dac_of_match[] = {
@@ -268,7 +266,7 @@ static struct platform_driver pistachio_internal_dac_plat_driver = {
 	.driver = {
 		.name = "img-pistachio-internal-dac",
 		.of_match_table = pistachio_internal_dac_of_match,
-		.pm = &pistachio_internal_dac_pm_ops
+		.pm = pm_ptr(&pistachio_internal_dac_pm_ops)
 	},
 	.probe = pistachio_internal_dac_probe,
 	.remove = pistachio_internal_dac_remove
-- 
2.43.0

