Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93525FA10
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894336; cv=none; b=ug28BlE9UkFWK/aZ0HTleBR7ooG0GkGVjzwDGU3fwNJ/VL9RtQuknyJz70+jodt0DCgNP6OBPk/tHqmBKQn00nh4/NNhltD8QF637+OG3J3jlTX5Trcc4UUiVjZaD/CrHK/zAWpZed0TYrmcqktyFnO+91S3y3vnSo//sXgwg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894336; c=relaxed/simple;
	bh=LiyZklIk1sX5Tre4zALU6yMIcEHPCRhrO1Gxo8nAzOM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uaXD97Z1rBwTFPVr9X55G2uTvcuLXqf9v9vwFA0DKmhtj1dEngZiMoUzEK5DROigRojVRVIM+uAmjcXCLX9z21VR9jVT32nYT0C0yCmMM58yrVqX5rVhl6LS5a19Q01qhhxYXQWMtW63Y5Ispd9bO6J0ZVkggpzPqGPcSujqssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ew/WPtKG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DbfBEkO4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ew/WPtKG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DbfBEkO4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ew/WPtKG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DbfBEkO4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ew/WPtKG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DbfBEkO4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 61B3E5BCE1;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/RRgZWEKwHZ6WIHE1mcQj/kzvo9OU1wB7sxVE7nL5Y=;
	b=ew/WPtKGzn1qC38URHD8+AnDoq/+jLt6dRdNbmMOsTBucIgd4CY3w+3reKYvY/ISzK7PAy
	AkRc7jHUV0hb7djGpvyEHQfFT61VeQprtU3Vs1dorRe1hlkdtciCJreB9aUC66I1bxd1bZ
	O4AIB1+/xdxfXzqppOe4fnQ5lSzxsqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/RRgZWEKwHZ6WIHE1mcQj/kzvo9OU1wB7sxVE7nL5Y=;
	b=DbfBEkO4w4/tn94FImbNg0/QQ4TMRnyCddcI2QBBAQFTvtW6YIj4kN9J4ydccCXnpWI6qr
	aAl6a8WDOugUEsDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/RRgZWEKwHZ6WIHE1mcQj/kzvo9OU1wB7sxVE7nL5Y=;
	b=ew/WPtKGzn1qC38URHD8+AnDoq/+jLt6dRdNbmMOsTBucIgd4CY3w+3reKYvY/ISzK7PAy
	AkRc7jHUV0hb7djGpvyEHQfFT61VeQprtU3Vs1dorRe1hlkdtciCJreB9aUC66I1bxd1bZ
	O4AIB1+/xdxfXzqppOe4fnQ5lSzxsqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/RRgZWEKwHZ6WIHE1mcQj/kzvo9OU1wB7sxVE7nL5Y=;
	b=DbfBEkO4w4/tn94FImbNg0/QQ4TMRnyCddcI2QBBAQFTvtW6YIj4kN9J4ydccCXnpWI6qr
	aAl6a8WDOugUEsDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 217573EA66;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ABqiB7ZoQWk7OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:12:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ALSA: hda/cs35l56: Clean up with PM_RUNTIME_ACQUIRE*() macros
Date: Tue, 16 Dec 2025 15:11:47 +0100
Message-ID: <20251216141154.172218-3-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216141154.172218-1-tiwai@suse.de>
References: <20251216141154.172218-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.77
X-Spam-Level: 
X-Spamd-Result: default: False [-2.77 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.17)[-0.872];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

Use PM_RUNTIME_ACQUIRE*() macros for replacing the manual
pm_runtime_resume_and_get() and pm_runtime_put_*() calls.

Merely code cleanups and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 36 +++++++++-------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index f7ba92e11957..cfc8de2ae499 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -588,7 +588,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 
 	cs35l56->base.fw_patched = false;
 
-	ret = pm_runtime_resume_and_get(cs35l56->base.dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56->base.dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret < 0) {
 		dev_err(cs35l56->base.dev, "Failed to resume and get %d\n", ret);
 		return;
@@ -601,7 +602,7 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	 */
 	ret = cs35l56_read_prot_status(&cs35l56->base, &firmware_missing, &preloaded_fw_ver);
 	if (ret)
-		goto err_pm_put;
+		return;
 
 	if (firmware_missing)
 		preloaded_fw_ver = 0;
@@ -690,8 +691,6 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 err_fw_release:
 	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
 					   coeff_firmware, coeff_filename);
-err_pm_put:
-	pm_runtime_put(cs35l56->base.dev);
 }
 
 static void cs35l56_hda_dsp_work(struct work_struct *work)
@@ -708,14 +707,12 @@ static ssize_t cs35l56_hda_debugfs_calibrate_write(struct file *file,
 	struct cs35l56_base *cs35l56_base = file->private_data;
 	ssize_t ret;
 
-	ret = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(cs35l56_base->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
 
-	ret = cs35l56_calibrate_debugfs_write(cs35l56_base, from, count, ppos);
-	pm_runtime_autosuspend(cs35l56_base->dev);
-
-	return ret;
+	return cs35l56_calibrate_debugfs_write(cs35l56_base, from, count, ppos);
 }
 
 static ssize_t cs35l56_hda_debugfs_cal_temperature_write(struct file *file,
@@ -725,14 +722,12 @@ static ssize_t cs35l56_hda_debugfs_cal_temperature_write(struct file *file,
 	struct cs35l56_base *cs35l56_base = file->private_data;
 	ssize_t ret;
 
-	ret = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(cs35l56_base->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
 
-	ret = cs35l56_cal_ambient_debugfs_write(cs35l56_base, from, count, ppos);
-	pm_runtime_autosuspend(cs35l56_base->dev);
-
-	return ret;
+	return cs35l56_cal_ambient_debugfs_write(cs35l56_base, from, count, ppos);
 }
 
 static ssize_t cs35l56_hda_debugfs_cal_data_read(struct file *file,
@@ -742,14 +737,12 @@ static ssize_t cs35l56_hda_debugfs_cal_data_read(struct file *file,
 	struct cs35l56_base *cs35l56_base = file->private_data;
 	ssize_t ret;
 
-	ret = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(cs35l56_base->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
 
-	ret = cs35l56_cal_data_debugfs_read(cs35l56_base, to, count, ppos);
-	pm_runtime_autosuspend(cs35l56_base->dev);
-
-	return ret;
+	return cs35l56_cal_data_debugfs_read(cs35l56_base, to, count, ppos);
 }
 
 static ssize_t cs35l56_hda_debugfs_cal_data_write(struct file *file,
@@ -767,7 +760,8 @@ static ssize_t cs35l56_hda_debugfs_cal_data_write(struct file *file,
 	if (ret < 0)
 		return ret;
 
-	ret = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(cs35l56_base->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
 
@@ -777,8 +771,6 @@ static ssize_t cs35l56_hda_debugfs_cal_data_write(struct file *file,
 	else
 		count = -EIO;
 
-	pm_runtime_autosuspend(cs35l56_base->dev);
-
 	return count;
 }
 
-- 
2.52.0

