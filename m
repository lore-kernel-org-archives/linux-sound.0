Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0592135CE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480078; cv=none; b=qc/LytuNei7x70BtTk6jXb+egIl3raRkADRaJ6DeHAALdJZEEyQ9IE0aC+8pc8iyaxF/8Tm/beekNRL9xSD5JdpTBp23+RdJvLR99gnuRZsYgbGBsUNfoZgOHUVV3Ak/bsGi8E9lcAe54+w821P2sbrd1ng0Idl7nDTZrf+RDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480078; c=relaxed/simple;
	bh=tw4gGjqjBFQOhC1/vRiydgJGS6aHOK1gGQrl7MjOvs0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTxKH4CNZtK4jCCtsH8LAHUyxt9RpwKuS4vdbP3BjcY7sIPA0A1utv+973A6YAAb4+sYlsnrFz3uP9oP+MN5qL/CklRgpdz4ucwk/fh14noXUdKYtP8lJXm8kIopfv755UAPk4Bl1YG70TXLx6dx6k1nOYDbgbmx4dNPm9C1TAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sbVzMvDC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JzLhpy4q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sbVzMvDC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JzLhpy4q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sbVzMvDC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JzLhpy4q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sbVzMvDC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JzLhpy4q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 396AB5C24E;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW66dDlzmBKPf4lbZwqaHlmtzrEalCtyCEc5vDkbciM=;
	b=sbVzMvDCNNJ8Yp+4uMaDZjdWchjJmrk3+I4lElK1Le3o1lO3p+cdBsSMqfpJnf2qltD2kE
	AWzrWN1G3+M12t6dOr2kDLU3uigKpMi7rU6F8UghMTRad1Sx4FEeLCkbEgreHd6tMuH7v4
	sbvSqg684PqbxZFTYYXQfyDTOmLMt0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW66dDlzmBKPf4lbZwqaHlmtzrEalCtyCEc5vDkbciM=;
	b=JzLhpy4qUUNp4ii8aSQXfM+GmmvA+3zfyh+VNSb+BWPaNs3AE6O5+LfZIStPJ17gXJuIHC
	4nCCKus7FbT6EPBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW66dDlzmBKPf4lbZwqaHlmtzrEalCtyCEc5vDkbciM=;
	b=sbVzMvDCNNJ8Yp+4uMaDZjdWchjJmrk3+I4lElK1Le3o1lO3p+cdBsSMqfpJnf2qltD2kE
	AWzrWN1G3+M12t6dOr2kDLU3uigKpMi7rU6F8UghMTRad1Sx4FEeLCkbEgreHd6tMuH7v4
	sbvSqg684PqbxZFTYYXQfyDTOmLMt0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW66dDlzmBKPf4lbZwqaHlmtzrEalCtyCEc5vDkbciM=;
	b=JzLhpy4qUUNp4ii8aSQXfM+GmmvA+3zfyh+VNSb+BWPaNs3AE6O5+LfZIStPJ17gXJuIHC
	4nCCKus7FbT6EPBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F05413A6A;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMZQBjfCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 7/9] ALSA: usb: qcom: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:07:15 +0200
Message-ID: <20250829150724.6886-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

The manual mutex lock/unlock are still left in
handle_uaudio_stream_req() and its callee as they have a bit complex
locking patterns.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/qcom/qc_audio_offload.c | 69 ++++++++++---------------------
 1 file changed, 22 insertions(+), 47 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 965ddc792acc..a17fb63f605e 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -744,7 +744,7 @@ static void qmi_stop_session(void)
 	int if_idx;
 	int idx;
 
-	mutex_lock(&qdev_mutex);
+	guard(mutex)(&qdev_mutex);
 	/* find all active intf for set alt 0 and cleanup usb audio dev */
 	for (idx = 0; idx < SNDRV_CARDS; idx++) {
 		if (!atomic_read(&uadev[idx].in_use))
@@ -780,11 +780,9 @@ static void qmi_stop_session(void)
 			disable_audio_stream(subs);
 		}
 		atomic_set(&uadev[idx].in_use, 0);
-		mutex_lock(&chip->mutex);
+		guard(mutex)(&chip->mutex);
 		uaudio_dev_cleanup(&uadev[idx]);
-		mutex_unlock(&chip->mutex);
 	}
-	mutex_unlock(&qdev_mutex);
 }
 
 /**
@@ -810,8 +808,8 @@ static int uaudio_sideband_notifier(struct usb_interface *intf,
 
 	chip = usb_get_intfdata(intf);
 
-	mutex_lock(&qdev_mutex);
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&qdev_mutex);
+	guard(mutex)(&chip->mutex);
 
 	dev = &uadev[chip->card->number];
 
@@ -825,9 +823,6 @@ static int uaudio_sideband_notifier(struct usb_interface *intf,
 		}
 	}
 
-	mutex_unlock(&chip->mutex);
-	mutex_unlock(&qdev_mutex);
-
 	return 0;
 }
 
@@ -1577,17 +1572,15 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		goto response;
 	}
 
-	mutex_lock(&chip->mutex);
-	if (req_msg->enable) {
-		if (info_idx < 0 || chip->system_suspend || subs->opened) {
-			ret = -EBUSY;
-			mutex_unlock(&chip->mutex);
-
-			goto response;
+	scoped_guard(mutex, &chip->mutex) {
+		if (req_msg->enable) {
+			if (info_idx < 0 || chip->system_suspend || subs->opened) {
+				ret = -EBUSY;
+				goto response;
+			}
+			subs->opened = 1;
 		}
-		subs->opened = 1;
 	}
-	mutex_unlock(&chip->mutex);
 
 	if (req_msg->service_interval_valid) {
 		ret = get_data_interval_from_si(subs,
@@ -1610,9 +1603,8 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 			ret = prepare_qmi_response(subs, req_msg, &resp,
 						   info_idx);
 		if (ret < 0) {
-			mutex_lock(&chip->mutex);
+			guard(mutex)(&chip->mutex);
 			subs->opened = 0;
-			mutex_unlock(&chip->mutex);
 		}
 	} else {
 		info = &uadev[pcm_card_num].info[info_idx];
@@ -1643,14 +1635,13 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		}
 
 		disable_audio_stream(subs);
-		mutex_lock(&chip->mutex);
+		guard(mutex)(&chip->mutex);
 		subs->opened = 0;
-		mutex_unlock(&chip->mutex);
 	}
 
 response:
 	if (!req_msg->enable && ret != -EINVAL && ret != -ENODEV) {
-		mutex_lock(&chip->mutex);
+		guard(mutex)(&chip->mutex);
 		if (info_idx >= 0) {
 			info = &uadev[pcm_card_num].info[info_idx];
 			uaudio_dev_intf_cleanup(uadev[pcm_card_num].udev,
@@ -1659,7 +1650,6 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		if (atomic_read(&uadev[pcm_card_num].in_use))
 			kref_put(&uadev[pcm_card_num].kref,
 				 uaudio_dev_release);
-		mutex_unlock(&chip->mutex);
 	}
 	mutex_unlock(&qdev_mutex);
 
@@ -1762,12 +1752,12 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	    !usb_qmi_get_pcm_num(chip, 0))
 		return;
 
-	mutex_lock(&qdev_mutex);
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&qdev_mutex);
+	guard(mutex)(&chip->mutex);
 	if (!uadev[chip->card->number].chip) {
 		sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
 		if (!sdev)
-			goto exit;
+			return;
 
 		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
 					    uaudio_sideband_notifier);
@@ -1806,9 +1796,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		snd_soc_usb_connect(uaudio_qdev->auxdev->dev.parent, sdev);
 	}
 
-	mutex_unlock(&chip->mutex);
-	mutex_unlock(&qdev_mutex);
-
 	return;
 
 unreg_xhci:
@@ -1818,9 +1805,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	kfree(sdev);
 	uadev[chip->card->number].sdev = NULL;
 	uadev[chip->card->number].chip = NULL;
-exit:
-	mutex_unlock(&chip->mutex);
-	mutex_unlock(&qdev_mutex);
 }
 
 /**
@@ -1856,16 +1840,13 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 	if (card_num >= SNDRV_CARDS)
 		return;
 
-	mutex_lock(&qdev_mutex);
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&qdev_mutex);
+	guard(mutex)(&chip->mutex);
 	dev = &uadev[card_num];
 
 	/* Device has already been cleaned up, or never populated */
-	if (!dev->chip) {
-		mutex_unlock(&chip->mutex);
-		mutex_unlock(&qdev_mutex);
+	if (!dev->chip)
 		return;
-	}
 
 	/* cleaned up already */
 	if (!dev->udev)
@@ -1886,9 +1867,6 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 		kfree(dev->sdev);
 		dev->sdev = NULL;
 	}
-	mutex_unlock(&chip->mutex);
-
-	mutex_unlock(&qdev_mutex);
 }
 
 /**
@@ -1913,13 +1891,10 @@ static void qc_usb_audio_offload_suspend(struct usb_interface *intf,
 	if (card_num >= SNDRV_CARDS)
 		return;
 
-	mutex_lock(&qdev_mutex);
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&qdev_mutex);
+	guard(mutex)(&chip->mutex);
 
 	uaudio_send_disconnect_ind(chip);
-
-	mutex_unlock(&chip->mutex);
-	mutex_unlock(&qdev_mutex);
 }
 
 static struct snd_usb_platform_ops offload_ops = {
-- 
2.50.1

