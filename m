Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3F221730
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205612; cv=none; b=eaGUJ5RdUEMV4qr7DVVceF47osiAhFgWMFsXQB5oLaBfZI/asnqIQC7Xq5aJE3XBNvlrxlefOHjCv9vOfsBWry8k3yUrq4C+t4QMVQ0Kce7+xhA16jX5qeDCjTLnuSMHS4fwLWG7x9o4LsgbgIKGt3Miiz8a0IZdVLW2MMDMaKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205612; c=relaxed/simple;
	bh=RseBT03S6yUU+JHOqdrWQsdNujRsRZomrQRXEMYzKxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuHdArj0CGo0XO416HRDIM+lxcF5/80fnmGi+9vj89cIPZlrSFuaH+esj24I2Y7/YpqPfXhS3IB6bHJj2ajNvqZ1DaBmiSx+A3mIW7PvHy8+vMFpTufqrzWbzNt12wLY+q8KQUJPPqaf+HrY5lfS/GorIAGLMpkLwNZvI2UOD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vE/YlOSj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xDZNE8Oc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vE/YlOSj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xDZNE8Oc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vE/YlOSj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDZNE8Oc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vE/YlOSj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDZNE8Oc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CBB82213A;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wbaxwwcrhdc8xhlBIVxY5WZAu5NNK5kYY56GFlS/e9I=;
	b=vE/YlOSjzJR9xwP/uV+01fr6Th88Sq550tRC+wb7GQiMhfC5j7dMVpxSOoJrmYoZKm50jE
	eYhb/xMkg9TPSk/uEwBR86rentOxGfiy+vpMZmAdLYJcf83177gJNDQOGrtLORz8T5+P33
	stUPAXvFgh3513Subh3E0wALKDKQO8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wbaxwwcrhdc8xhlBIVxY5WZAu5NNK5kYY56GFlS/e9I=;
	b=xDZNE8OcaCZp0Hs4fiRdSwGjEtHwZa/IF0jJu3QXr94EOG4gDoEhthJZNKYhB5CGUQz/qN
	tDbAs4GK+aIPcPDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wbaxwwcrhdc8xhlBIVxY5WZAu5NNK5kYY56GFlS/e9I=;
	b=vE/YlOSjzJR9xwP/uV+01fr6Th88Sq550tRC+wb7GQiMhfC5j7dMVpxSOoJrmYoZKm50jE
	eYhb/xMkg9TPSk/uEwBR86rentOxGfiy+vpMZmAdLYJcf83177gJNDQOGrtLORz8T5+P33
	stUPAXvFgh3513Subh3E0wALKDKQO8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wbaxwwcrhdc8xhlBIVxY5WZAu5NNK5kYY56GFlS/e9I=;
	b=xDZNE8OcaCZp0Hs4fiRdSwGjEtHwZa/IF0jJu3QXr94EOG4gDoEhthJZNKYhB5CGUQz/qN
	tDbAs4GK+aIPcPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33A87132CF;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iOhWC8vx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 79/88] ASoC: SOF: of: Convert to EXPORT_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:41 +0100
Message-ID: <20250317095603.20073-80-tiwai@suse.de>
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
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer EXPORT_DEV_PM_OPS() macro together with pm_ptr().

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

