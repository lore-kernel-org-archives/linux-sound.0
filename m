Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B77A38D3F4
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314300; cv=none; b=nvlSlvF3zcxEJ6pfTTBbLIhUwXSlW7INLsQVKM3kbChJT9w3O9y5LRp4+/K3HFvRK3qaU+wCMMC2N7mgfETsHsxL31wFFDwV8d22GyrMKoQvmV0hNGu2N5e6CB64Sr4P6CF/CRboItlZrZJQjiPchv2nZDTiFPcsR8uaCHFU0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314300; c=relaxed/simple;
	bh=w8zLYRWcl8Gvgt5IhWpD52zl6GBlgMJkozAPgIDVXIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pp4qd1dqTyrYP9//jaS29H2KfG0vJoE3hi9S/THXEUOkziWKEZ+eeGT/5uC5opxTQRpD8VIry6LExByxh71qKIWUQ5JhJUx5LpQR+nCQHt1CR+0br2vMeEsbcOoFHwtwsEuBQc/9f2Ne08wLX0d3wyfTxOhU17MN3VZg3H4l58I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cMitVa3h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8H9BfRRf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jxyrQSso; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZG2qwtdz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cMitVa3h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8H9BfRRf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jxyrQSso";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZG2qwtdz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B86243E22;
	Wed, 29 Jul 2026 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abHkTYTcAXMYFe25oxm8wv39VCTN/YWC+HT9rVtAPNs=;
	b=cMitVa3hF9sVnethRwrZPYs4VNCDpvja2Y5UZ1ViH1vslK3zpH1DYtM6FrBID38iC9h4vT
	2d4VE6aGdaZe2X4ZM1mYBMiO6HWoaD9uhDspcgC3znl7AdxD12bd1a6881a0mHtMycOUR9
	zwCkLeZ+1puY+jtwi2aGMw+qPKOtSfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abHkTYTcAXMYFe25oxm8wv39VCTN/YWC+HT9rVtAPNs=;
	b=8H9BfRRfgC+OuYw1FlDlX9/Sapmv1/FbjmpcNVsRsNZHI0ZRAx23fZIGGqtwxEF/rd48tN
	h74Nm4XGs3yz82Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jxyrQSso;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZG2qwtdz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abHkTYTcAXMYFe25oxm8wv39VCTN/YWC+HT9rVtAPNs=;
	b=jxyrQSsogLXxICMkCE2HdnBUJsw8QXLFoGOcm1VrCUW04lV5D+ePoDjrbqIQ6eRF+tSD8/
	XQGBNkJp9FRjHNvt/8IehB9ttoca7ei0ZlL3Y7IxJ8t8bqmztsUqgPvWrUOd3cZUgWeen1
	uLpdltegMdrBwqHKLi1zoEe2Y1cwY6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abHkTYTcAXMYFe25oxm8wv39VCTN/YWC+HT9rVtAPNs=;
	b=ZG2qwtdzDysgGQ2dRfcLgwYSb+nZYM1KJ03Frm/YRPKTk/kt2fofXeAKvaH9c+pugvTuB3
	PjukR84CmPhSnFCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35E20779BF;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KOvqC9i7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Subject: [PATCH 06/14] ALSA: hda: cs35l56: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:24 +0200
Message-ID: <20260729083735.120219-7-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B86243E22
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with auto-cleanup.
By the use of __free(firmware), we can replace the manual mutex locks
with guard() gracefully, too.

Only the code refactoring, no functional changes.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 35 ++++++----------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index 78c2cf387a00..bc207ab5b020 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -527,18 +527,6 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 						  base_name, NULL, NULL, "bin");
 }
 
-static void cs35l56_hda_release_firmware_files(const struct firmware *wmfw_firmware,
-					       char *wmfw_filename,
-					       const struct firmware *coeff_firmware,
-					       char *coeff_filename)
-{
-	release_firmware(wmfw_firmware);
-	kfree(wmfw_filename);
-
-	release_firmware(coeff_firmware);
-	kfree(coeff_filename);
-}
-
 static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
 {
 	int ret;
@@ -561,10 +549,10 @@ static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
 
 static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 {
-	const struct firmware *coeff_firmware = NULL;
-	const struct firmware *wmfw_firmware = NULL;
-	char *coeff_filename = NULL;
-	char *wmfw_filename = NULL;
+	const struct firmware *coeff_firmware __free(firmware) = NULL;
+	const struct firmware *wmfw_firmware __free(firmware) = NULL;
+	char *coeff_filename __free(kfree) = NULL;
+	char *wmfw_filename __free(kfree) = NULL;
 	unsigned int preloaded_fw_ver;
 	bool firmware_missing;
 	int ret;
@@ -606,14 +594,14 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (firmware_missing) {
 		if (!wmfw_firmware) {
 			dev_err(cs35l56->base.dev, ".%s file required but not found\n", "wmfw");
-			goto err_fw_release;
+			return;
 		} else if (!coeff_firmware) {
 			dev_err(cs35l56->base.dev, ".%s file required but not found\n", "bin");
-			goto err_fw_release;
+			return;
 		}
 	}
 
-	mutex_lock(&cs35l56->base.irq_lock);
+	guard(mutex)(&cs35l56->base.irq_lock);
 
 	/*
 	 * If the firmware hasn't been patched it must be shutdown before
@@ -624,14 +612,14 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
 		ret = cs35l56_firmware_shutdown(&cs35l56->base);
 		if (ret)
-			goto err;
+			return;
 	}
 
 	ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
 			      coeff_firmware, coeff_filename, "misc");
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
-		goto err;
+		return;
 	}
 
 	if (wmfw_filename)
@@ -679,11 +667,6 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 err_powered_up:
 	if (!cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
-err:
-	mutex_unlock(&cs35l56->base.irq_lock);
-err_fw_release:
-	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
-					   coeff_firmware, coeff_filename);
 }
 
 static void cs35l56_hda_dsp_work(struct work_struct *work)
-- 
2.55.0

