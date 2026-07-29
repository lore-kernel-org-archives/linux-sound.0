Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797C372EF5
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314307; cv=none; b=nk9vjd1hgE2JmEZfN02qZiGu96GgUMbsIDEKJARoCQQ8YryCStHRHYc+w5kFJF7UoaMnOpQamvhPYf+WZg2PiXam9sJb7eLaW/TneZ8CBUpnnfaEPvBQFG0VMAjAGeJHxhKOhAneQ46hj7xbuIGCel/c2r56dUTwkD153lrWRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314307; c=relaxed/simple;
	bh=6/QzOuLEZw5pU2OZ2YPI+PB0GHUia5owZfFWC3eYbL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmbgswgGwSX16TG1lGUSFvNxhxK8uLH/nIAiOJ/xOqXd28mLr04oosTi1vFj+LX4sdCaUSp9o3PU4eni1bXAVfSV9NdOHK8eJDgT8drQZry6Ug89FCjYsM1R2pZi84pNlwyRSOJmpnTyleijzDV09vU1gyfV+pMxZWDfAclxeUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQ5hF4qi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m1MFi0Qy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZS5oJRYX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TycldDQu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQ5hF4qi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m1MFi0Qy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZS5oJRYX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TycldDQu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D8A93E24;
	Wed, 29 Jul 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn3H2r9gyyM+YptUH0PqeF3Ha6ESZDEzTmHktywyVHk=;
	b=YQ5hF4qiqfd+M/9bEkRSZcSrzUq9NYVG48HszS0BKnkJ34BTSq3EA0gV1gC2KSe8gJGxtn
	3cLRk8Fd24ejre0nGFH7xGSuwxaMXpj5kwGzh9vVJMm6IhBKa0EncGGStFiCVK+DKo7tbr
	I+LUd1MhtJmTP2q1/UKLLeKHjhS1RvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn3H2r9gyyM+YptUH0PqeF3Ha6ESZDEzTmHktywyVHk=;
	b=m1MFi0QyZ1g5bMc96a5Ynrnbjn+kwIzyIxoFiOOgEYh6jKBJ5KoPwkEVX5MXSyhen6LLbx
	QHkdYBtWF3tjG7Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn3H2r9gyyM+YptUH0PqeF3Ha6ESZDEzTmHktywyVHk=;
	b=ZS5oJRYXy4vT6WFVfKejx0bVdQrJZnfmwBJxw264uBJSjCntWvWO+zG+vB2fsEPpFlOUU/
	CQypbSoMRlE7aXt1SIVpBlo+m5g3fGhkpSxgf+bnZkG389/yIaHcKCV3A5fvt2d/xNA2WI
	3sgUk8BIaYMBazbeUpmBqI1Ay2qlDgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn3H2r9gyyM+YptUH0PqeF3Ha6ESZDEzTmHktywyVHk=;
	b=TycldDQuZ/0PIrGUVL287jd3sZNMl4yvs+cEghKUuMNwNgOGsxZxmF9NNfoxudY6//ZVNa
	cbGBlNzYXJrdkuDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E29B779C2;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MPG0JNi7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/14] ALSA: asihpi: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:27 +0200
Message-ID: <20260729083735.120219-10-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/hpidspcd.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/pci/asihpi/hpidspcd.c b/sound/pci/asihpi/hpidspcd.c
index b1b5a131f626..6d2c27e47d07 100644
--- a/sound/pci/asihpi/hpidspcd.c
+++ b/sound/pci/asihpi/hpidspcd.c
@@ -23,7 +23,7 @@ struct dsp_code_private {
 short hpi_dsp_code_open(u32 adapter, void *os_data, struct dsp_code *dsp_code,
 	u32 *os_error_code)
 {
-	const struct firmware *firmware;
+	const struct firmware *firmware __free(firmware) = NULL;
 	struct pci_dev *dev = os_data;
 	struct code_header header;
 	char fw_name[20];
@@ -37,11 +37,11 @@ short hpi_dsp_code_open(u32 adapter, void *os_data, struct dsp_code *dsp_code,
 	if (err || !firmware) {
 		dev_err(&dev->dev, "%d, request_firmware failed for %s\n",
 			err, fw_name);
-		goto error1;
+		goto error;
 	}
 	if (firmware->size < sizeof(header)) {
 		dev_err(&dev->dev, "Header size too small %s\n", fw_name);
-		goto error2;
+		goto error;
 	}
 	memcpy(&header, firmware->data, sizeof(header));
 
@@ -51,7 +51,7 @@ short hpi_dsp_code_open(u32 adapter, void *os_data, struct dsp_code *dsp_code,
 		dev_err(&dev->dev,
 			"Invalid firmware header size %d != file %zd\n",
 			header.size, firmware->size);
-		goto error2;
+		goto error;
 	}
 
 	if (HPI_VER_MAJOR(header.version) != HPI_VER_MAJOR(HPI_VER)) {
@@ -59,7 +59,7 @@ short hpi_dsp_code_open(u32 adapter, void *os_data, struct dsp_code *dsp_code,
 		dev_err(&dev->dev,
 			"Incompatible firmware version DSP image %X != Driver %X\n",
 			header.version, HPI_VER);
-		goto error2;
+		goto error;
 	}
 
 	if (header.version != HPI_VER) {
@@ -72,19 +72,17 @@ short hpi_dsp_code_open(u32 adapter, void *os_data, struct dsp_code *dsp_code,
 	dsp_code->pvt = kmalloc_obj(*dsp_code->pvt);
 	if (!dsp_code->pvt) {
 		err_ret = HPI_ERROR_MEMORY_ALLOC;
-		goto error2;
+		goto error;
 	}
 
 	dsp_code->pvt->dev = dev;
-	dsp_code->pvt->firmware = firmware;
+	dsp_code->pvt->firmware = no_free_ptr(firmware);
 	dsp_code->header = header;
 	dsp_code->block_length = header.size / sizeof(u32);
 	dsp_code->word_count = sizeof(header) / sizeof(u32);
 	return 0;
 
-error2:
-	release_firmware(firmware);
-error1:
+error:
 	dsp_code->block_length = 0;
 	return err_ret;
 }
-- 
2.55.0

