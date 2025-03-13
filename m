Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE31D5CD4
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887973; cv=none; b=B4buIEK8YXNjDskgAyEjnJhn7tZc2odwKxkQ+pwCVU9YIWJuAbIJzYnnA1oMEo5cDyYe/tf3ThxCn9JXOW4VJK0usIf4UED+rPZ9tBUYP9K7IVMtitRbiq3bxhWgBLs9+MWd3aiy8x/TVc2MLsrO40fg8C1NC6dp/l8HwiOIGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887973; c=relaxed/simple;
	bh=xCb44f2zci3LauGxIYd8Nz5uLPees6xZZNVXTQNFhLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evGFqSYKTBMjQk3FO2Vfm51QNaEUGShXOm2c7zfFvprKrGneMDs2mYIcCzoFca3oGojEHRFikIP4OiNMKUDEByd3JewW1so//vY6rP9t4uvdcXal95yEmiyy73hRWoFhhgvIvHI2OOD4PmZeY26Ews9OkaNJVIubGA00MraBFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QEfHoqvJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wLsWKIFm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QEfHoqvJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wLsWKIFm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QEfHoqvJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wLsWKIFm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QEfHoqvJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wLsWKIFm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 274E92119A;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01CFKrFgC+WmSZuXQTnhxIIdMOsQmM9q/70U6DJUWnA=;
	b=QEfHoqvJbNjBGc0ihKAziXlwTDwmHhVO0n65hSlbJM+exmmzaGee/JoCiLf4tp7sOWU0gC
	+OhfKNubOlSKfrWmbLQxYYKmFFXHhwuD9+W4zvz5blG3059hL8xoHIjEwBI5DTQTX6iSOv
	hRgrxTTu2MJ0QT0+hBPUFFYUggqh7pU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01CFKrFgC+WmSZuXQTnhxIIdMOsQmM9q/70U6DJUWnA=;
	b=wLsWKIFmKfRsqWoYanPDZXVocva5xXuxss5wbklAdX8FjVwoN6vc35VxRGj3cbK0Mtk9B8
	SUhysL0l4ql5ZuCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QEfHoqvJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wLsWKIFm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01CFKrFgC+WmSZuXQTnhxIIdMOsQmM9q/70U6DJUWnA=;
	b=QEfHoqvJbNjBGc0ihKAziXlwTDwmHhVO0n65hSlbJM+exmmzaGee/JoCiLf4tp7sOWU0gC
	+OhfKNubOlSKfrWmbLQxYYKmFFXHhwuD9+W4zvz5blG3059hL8xoHIjEwBI5DTQTX6iSOv
	hRgrxTTu2MJ0QT0+hBPUFFYUggqh7pU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01CFKrFgC+WmSZuXQTnhxIIdMOsQmM9q/70U6DJUWnA=;
	b=wLsWKIFmKfRsqWoYanPDZXVocva5xXuxss5wbklAdX8FjVwoN6vc35VxRGj3cbK0Mtk9B8
	SUhysL0l4ql5ZuCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2B5013A24;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qDgNOu8Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 80/89] ASoC: SOF: of: Convert to EXPORT_NS_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:25 +0100
Message-ID: <20250313174139.29942-81-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 274E92119A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer EXPORT_NS_DEV_PM_OPS() macro together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: sound-open-firmware@alsa-project.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/imx/imx8.c               | 2 +-
 sound/soc/sof/imx/imx9.c               | 2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 sound/soc/sof/sof-of-dev.c             | 8 +++-----
 5 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 4be4c569b583..ab07512e511d 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -456,7 +456,7 @@ static struct platform_driver snd_sof_of_imx8_driver = {
 	.remove = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8",
-		.pm = &sof_of_pm,
+		.pm = pm_ptr(&sof_of_pm),
 		.of_match_table = sof_of_imx8_ids,
 	},
 };
diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
index 598675d4350a..853155d5990a 100644
--- a/sound/soc/sof/imx/imx9.c
+++ b/sound/soc/sof/imx/imx9.c
@@ -126,7 +126,7 @@ static struct platform_driver snd_sof_of_imx9_driver = {
 	.remove = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx9",
-		.pm = &sof_of_pm,
+		.pm = pm_ptr(&sof_of_pm),
 		.of_match_table = sof_of_imx9_ids,
 	},
 };
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 31437fdd4e92..18144d9504e1 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -660,7 +660,7 @@ static struct platform_driver snd_sof_of_mt8186_driver = {
 	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8186",
-		.pm = &sof_of_pm,
+		.pm = pm_ptr(&sof_of_pm),
 		.of_match_table = sof_of_mt8186_ids,
 	},
 };
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 371563d7ce79..821f43a3974a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -616,7 +616,7 @@ static struct platform_driver snd_sof_of_mt8195_driver = {
 	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8195",
-		.pm = &sof_of_pm,
+		.pm = pm_ptr(&sof_of_pm),
 		.of_match_table = sof_of_mt8195_ids,
 	},
 };
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index fb8c8a14d885..3ccfcfb142b7 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -30,14 +30,12 @@ static char *tplg_filename;
 module_param(tplg_filename, charp, 0444);
 MODULE_PARM_DESC(tplg_filename, "deprecated - moved to snd-sof module.");
 
-const struct dev_pm_ops sof_of_pm = {
+EXPORT_DEV_PM_OPS(sof_of_pm) = {
 	.prepare = snd_sof_prepare,
 	.complete = snd_sof_complete,
-	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
-	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume, NULL)
 };
-EXPORT_SYMBOL(sof_of_pm);
 
 static void sof_of_probe_complete(struct device *dev)
 {
-- 
2.43.0

