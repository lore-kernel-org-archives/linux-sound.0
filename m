Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D4219E8C
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900110; cv=none; b=ktqo3egLyYGUY/F4plIqLz56jni4EkHZRUlHPNiBSwZw7hLeRf7HdZWt82ZnaF+PSfWLdEPCJ4baNyawpS/e8udGo8pEtYKxSvTHb6FjXwTDBcdKb08dSAYoaZm+StYjMIVLHXzlRvIpz+bKbMbjHZ+Px5FejX60RLDoa49e80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900110; c=relaxed/simple;
	bh=1TjM4qsz9cjzUVKmh2Qcd7BXcUPZeLAsGkFM436GNVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7If5XR+lF6oe/YRJiksWZe5cnr2gj98LxHpfNGeyG24RhDAeXqIpWr5mdqKC2BfNKArFULevR4c6nXQSPd6Q6p+OF47cmFcyhB2ziqE2kH5cTE00bnPTHqBjdHfpb8agUDZE2YoNOKOp8wlqjm86KztgyicQmyBwFBq86K02Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W79CdDEy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pxY4BVoR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E+m77o72; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cMVgl/kV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W79CdDEy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pxY4BVoR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E+m77o72";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cMVgl/kV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4AB920B1B;
	Mon, 11 Aug 2025 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754900104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hwbaZB7/6T0BtmVvhT5FSCoOVfJq2qnE0vAjdbMBwwM=;
	b=W79CdDEy97dcME0x7kLi2saHuUcJiDD6wnTMY9Js2yN3ghG1Asm2RcSYwCFH9IHqkr3d9u
	/YTuVVuV8KICNUT4v+A8pF7JV2xGKLPoKAa0Nzf5I6N34e6FPxgY4BmP1mxIdSBGKfdh/M
	jyxrT+3+i3yeHa/0DLVmS1gahB+aLTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754900104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hwbaZB7/6T0BtmVvhT5FSCoOVfJq2qnE0vAjdbMBwwM=;
	b=pxY4BVoRmWEJoVVDKBUp84gQZSFGygrPYa4OaJP5VDtQ85IZl58M+QPz8X/otAnd4Ly/c2
	kkDMFlFSxL9MMeBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E+m77o72;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="cMVgl/kV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754900103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hwbaZB7/6T0BtmVvhT5FSCoOVfJq2qnE0vAjdbMBwwM=;
	b=E+m77o72rxvgxhvS++sPCGSU6zxk0OlPSujzs5kJr6wRN4IomEWmYMgHtg8jLZz8Uptsd3
	bLiTCM5NDXqF/DoHHgoeVxcY+bJ40h4Yw9YbOuJew1572urh8LgV+HQocd+gb8YHxR8Sbv
	5JQh29OyIMZN8I8cZcYpyAwk0p4shW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754900103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hwbaZB7/6T0BtmVvhT5FSCoOVfJq2qnE0vAjdbMBwwM=;
	b=cMVgl/kVi+IhlOmxXulNfaz3dDrRgEc32avT/47AM5SxV+NbvR6oegqL34TK0aT/TTGZaY
	r3mQWIXY3iTkD6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B593513479;
	Mon, 11 Aug 2025 08:15:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LzcOK4emmWgZZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 08:15:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH] ALSA: usb: scarlett2: Clean ups with guard() and __free()
Date: Mon, 11 Aug 2025 10:15:00 +0200
Message-ID: <20250811081502.30768-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E4AB920B1B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

There are lots of manual mutex lock/unlock and temporary kmalloc/kfree
patterns found in mixer_scalett2.c.  Let's simplify the code with the
recent lock guard() and auto cleanup with __free().

Only code refactoring, and there should be no actual behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett2.c | 1317 ++++++++++++-----------------------
 1 file changed, 437 insertions(+), 880 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1ec203cbbd94..e762d6110b1a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2348,7 +2348,8 @@ static int scarlett2_usb(
 {
 	struct scarlett2_data *private = mixer->private_data;
 	struct usb_device *dev = mixer->chip->dev;
-	struct scarlett2_usb_packet *req, *resp = NULL;
+	struct scarlett2_usb_packet *req __free(kfree) = NULL;
+	struct scarlett2_usb_packet *resp __free(kfree) = NULL;
 	size_t req_buf_size = struct_size(req, data, req_size);
 	size_t resp_buf_size = struct_size(resp, data, resp_size);
 	int retries = 0;
@@ -2356,18 +2357,14 @@ static int scarlett2_usb(
 	int err;
 
 	req = kmalloc(req_buf_size, GFP_KERNEL);
-	if (!req) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!req)
+		return -ENOMEM;
 
 	resp = kmalloc(resp_buf_size, GFP_KERNEL);
-	if (!resp) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!resp)
+		return -ENOMEM;
 
-	mutex_lock(&private->usb_mutex);
+	guard(mutex)(&private->usb_mutex);
 
 	/* build request message and send it */
 
@@ -2389,8 +2386,7 @@ static int scarlett2_usb(
 			mixer->chip,
 			"%s USB request result cmd %x was %d\n",
 			private->series_name, cmd, err);
-		err = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	if (!wait_for_completion_timeout(&private->cmd_done,
@@ -2400,8 +2396,7 @@ static int scarlett2_usb(
 			"%s USB request timed out, cmd %x\n",
 			private->series_name, cmd);
 
-		err = -ETIMEDOUT;
-		goto unlock;
+		return -ETIMEDOUT;
 	}
 
 	/* send a second message to get the response */
@@ -2418,17 +2413,14 @@ static int scarlett2_usb(
 		 * reboot request
 		 */
 		if (cmd == SCARLETT2_USB_REBOOT &&
-		    (err == -ESHUTDOWN || err == -EPROTO)) {
-			err = 0;
-			goto unlock;
-		}
+		    (err == -ESHUTDOWN || err == -EPROTO))
+			return 0;
 
 		usb_audio_err(
 			mixer->chip,
 			"%s USB response result cmd %x was %d expected %zu\n",
 			private->series_name, cmd, err, resp_buf_size);
-		err = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	/* cmd/seq/size should match except when initialising
@@ -2451,18 +2443,12 @@ static int scarlett2_usb(
 			resp_size, le16_to_cpu(resp->size),
 			le32_to_cpu(resp->error),
 			le32_to_cpu(resp->pad));
-		err = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	if (resp_data && resp_size > 0)
 		memcpy(resp_data, resp->data, resp_size);
 
-unlock:
-	mutex_unlock(&private->usb_mutex);
-error:
-	kfree(req);
-	kfree(resp);
 	return err;
 }
 
@@ -3321,25 +3307,20 @@ static int scarlett2_sync_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->sync_updated) {
 		err = scarlett2_update_sync(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->sync;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static const struct snd_kcontrol_new scarlett2_sync_ctl = {
@@ -3589,17 +3570,13 @@ static int scarlett2_autogain_switch_ctl_info(
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
 	err = scarlett2_check_input_phantom_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
-	err = snd_ctl_boolean_mono_info(kctl, uinfo);
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return snd_ctl_boolean_mono_info(kctl, uinfo);
 }
 
 static int scarlett2_autogain_switch_ctl_get(
@@ -3610,23 +3587,18 @@ static int scarlett2_autogain_switch_ctl_get(
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	ucontrol->value.enumerated.item[0] =
 		private->autogain_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_autogain_status_ctl_get(
@@ -3637,23 +3609,18 @@ static int scarlett2_autogain_status_ctl_get(
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	ucontrol->value.enumerated.item[0] =
 		private->autogain_status[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_autogain_switch_ctl_put(
@@ -3662,46 +3629,37 @@ static int scarlett2_autogain_switch_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_input_phantom_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
-	if (scarlett2_phantom_is_switching(private, index)) {
-		err = -EPERM;
-		goto unlock;
-	}
+	if (scarlett2_phantom_is_switching(private, index))
+		return -EPERM;
 
 	oval = private->autogain_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->autogain_switch[index] = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_AUTOGAIN_SWITCH, index, val);
-	if (err == 0)
-		err = 1;
 
 	scarlett2_autogain_update_access(mixer);
 	scarlett2_autogain_notify_access(mixer);
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_autogain_status_ctl_info(
@@ -3742,16 +3700,14 @@ static int scarlett2_ag_target_ctl_info(
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
@@ -3759,9 +3715,7 @@ static int scarlett2_ag_target_ctl_info(
 	uinfo->value.integer.max = 0;
 	uinfo->value.integer.step = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_ag_target_ctl_get(
@@ -3770,26 +3724,21 @@ static int scarlett2_ag_target_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->autogain_updated) {
 		err = scarlett2_update_autogain(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 
 	ucontrol->value.integer.value[0] = private->ag_targets[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_ag_target_ctl_put(
@@ -3798,39 +3747,32 @@ static int scarlett2_ag_target_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->ag_targets[index];
 	val = clamp(ucontrol->value.integer.value[0],
 		    (long)SCARLETT2_AG_TARGET_MIN, 0L);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->ag_targets[index] = val;
 
 	/* Send new value to the device */
 	err = scarlett2_usb_set_config(
 		mixer, scarlett2_ag_target_configs[index], 1, -val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const DECLARE_TLV_DB_MINMAX(
@@ -3885,25 +3827,20 @@ static int scarlett2_input_select_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_select_updated) {
 		err = scarlett2_update_input_select(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->input_select_switch;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_input_select_ctl_put(
@@ -3913,19 +3850,16 @@ static int scarlett2_input_select_ctl_put(
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->input_select_switch;
 	val = ucontrol->value.integer.value[0];
@@ -3936,7 +3870,7 @@ static int scarlett2_input_select_ctl_put(
 		val = info->gain_input_count - 1;
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->input_select_switch = val;
 
@@ -3944,12 +3878,8 @@ static int scarlett2_input_select_ctl_put(
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_INPUT_SELECT_SWITCH,
 		0, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_input_select_ctl_info(
@@ -3958,43 +3888,38 @@ static int scarlett2_input_select_ctl_info(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int inputs = private->info->gain_input_count;
 	int i, err;
-	char **values = kcalloc(inputs, sizeof(char *), GFP_KERNEL);
+	char **values __free(kfree) = NULL;
 
+	values = kcalloc(inputs, sizeof(char *), GFP_KERNEL);
 	if (!values)
 		return -ENOMEM;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* Loop through each input */
 	for (i = 0; i < inputs; i++) {
 		values[i] = kasprintf(GFP_KERNEL, "Input %d", i + 1);
 		if (!values[i]) {
 			err = -ENOMEM;
-			goto unlock;
+			goto clear;
 		}
 	}
 
 	err = snd_ctl_enum_info(uinfo, 1, i,
 				(const char * const *)values);
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-
+clear:
 	for (i = 0; i < inputs; i++)
 		kfree(values[i]);
-	kfree(values);
 
 	return err;
 }
@@ -4020,22 +3945,16 @@ static int scarlett2_autogain_disables_ctl_info(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
-	err = snd_ctl_boolean_mono_info(kctl, uinfo);
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return snd_ctl_boolean_mono_info(kctl, uinfo);
 }
 
 static int scarlett2_input_link_ctl_get(
@@ -4044,26 +3963,21 @@ static int scarlett2_input_link_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_select_updated) {
 		err = scarlett2_update_input_select(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] =
 		private->input_link_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_input_link_ctl_put(
@@ -4072,37 +3986,30 @@ static int scarlett2_input_link_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->input_link_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->input_link_switch[index] = val;
 
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_INPUT_LINK_SWITCH, index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_input_link_ctl = {
@@ -4138,16 +4045,14 @@ static int scarlett2_input_gain_ctl_info(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = elem->channels;
@@ -4155,9 +4060,7 @@ static int scarlett2_input_gain_ctl_info(struct snd_kcontrol *kctl,
 	uinfo->value.integer.max = SCARLETT2_MAX_GAIN_VALUE;
 	uinfo->value.integer.step = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_input_gain_ctl_get(struct snd_kcontrol *kctl,
@@ -4166,26 +4069,21 @@ static int scarlett2_input_gain_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_gain_updated) {
 		err = scarlett2_update_input_gain(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] =
 		private->gain[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
@@ -4194,38 +4092,31 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->gain[index];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->gain[index] = val;
 
 	/* Send gain change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_INPUT_GAIN,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_input_gain_ctl = {
@@ -4262,26 +4153,21 @@ static int scarlett2_safe_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_safe_updated) {
 		err = scarlett2_update_input_safe(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] =
 		private->safe_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_safe_ctl_put(struct snd_kcontrol *kctl,
@@ -4290,38 +4176,31 @@ static int scarlett2_safe_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->safe_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->safe_switch[index] = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_SAFE_SWITCH,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_safe_ctl = {
@@ -4356,20 +4235,17 @@ static int scarlett2_pcm_input_switch_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
 	if (private->pcm_input_switch_updated) {
 		err = scarlett2_update_pcm_input_switch(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->pcm_input_switch;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_pcm_input_switch_ctl_put(
@@ -4378,21 +4254,18 @@ static int scarlett2_pcm_input_switch_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err;
 
-	int oval, val, err = 0;
+	guard(mutex)(&private->data_mutex);
 
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->pcm_input_switch;
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->pcm_input_switch = val;
 
@@ -4400,12 +4273,8 @@ static int scarlett2_pcm_input_switch_ctl_put(
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_PCM_INPUT_SWITCH,
 		0, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_pcm_input_switch_ctl_info(
@@ -4492,25 +4361,20 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->master_vol;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_headphone_volume_ctl_get(
@@ -4520,25 +4384,20 @@ static int scarlett2_headphone_volume_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->headphone_vol;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int line_out_remap(struct scarlett2_data *private, int index)
@@ -4561,25 +4420,20 @@ static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->vol[index];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
@@ -4589,30 +4443,24 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->vol[index];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->vol[index] = val;
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
 				       index, val - SCARLETT2_VOLUME_BIAS);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const DECLARE_TLV_DB_MINMAX(
@@ -4691,25 +4539,20 @@ static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->dim_mute_updated) {
 		err = scarlett2_update_dim_mute(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->mute_switch[index];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
@@ -4719,32 +4562,26 @@ static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->mute_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->mute_switch[index] = val;
 
 	/* Send mute change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_mute_ctl = {
@@ -4863,28 +4700,22 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 	int ctl_index = elem->control;
 	int index = line_out_remap(private, ctl_index);
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->vol_sw_hw_switch[index];
 	val = !!ucontrol->value.enumerated.item[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	err = scarlett2_sw_hw_change(mixer, ctl_index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_sw_hw_enum_ctl = {
@@ -4924,22 +4755,16 @@ static int scarlett2_level_enum_ctl_info(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
-	err = snd_ctl_enum_info(uinfo, 1, 2, values);
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return snd_ctl_enum_info(uinfo, 1, 2, values);
 }
 
 static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
@@ -4949,28 +4774,22 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-
 	int index = elem->control + info->level_input_first;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_level_updated) {
 		err = scarlett2_update_input_level(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = scarlett2_decode_muteable(
 		private->level_switch[index]);
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
@@ -4980,26 +4799,23 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-
 	int index = elem->control + info->level_input_first;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->level_switch[index];
 	val = !!ucontrol->value.enumerated.item[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->level_switch[index] = val;
 
@@ -5010,12 +4826,8 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_level_enum_ctl = {
@@ -5049,26 +4861,21 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_pad_updated) {
 		err = scarlett2_update_input_pad(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] =
 		private->pad_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
@@ -5077,34 +4884,27 @@ static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->pad_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->pad_switch[index] = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PAD_SWITCH,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_pad_ctl = {
@@ -5138,25 +4938,20 @@ static int scarlett2_air_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_air_updated) {
 		err = scarlett2_update_input_air(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->air_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
@@ -5165,38 +4960,31 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->air_switch[index];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->air_switch[index] = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_AIR_SWITCH,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_air_with_drive_ctl_info(
@@ -5210,22 +4998,16 @@ static int scarlett2_air_with_drive_ctl_info(
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_autogain_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
-	err = snd_ctl_enum_info(uinfo, 1, 3, values);
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return snd_ctl_enum_info(uinfo, 1, 3, values);
 }
 
 static const struct snd_kcontrol_new scarlett2_air_ctl[2] = {
@@ -5268,25 +5050,20 @@ static int scarlett2_dsp_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_dsp_updated) {
 		err = scarlett2_update_input_dsp(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->dsp_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_dsp_ctl_put(struct snd_kcontrol *kctl,
@@ -5295,38 +5072,31 @@ static int scarlett2_dsp_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->dsp_switch[index];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->dsp_switch[index] = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_DSP_SWITCH,
 				       index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_dsp_ctl = {
@@ -5389,30 +5159,26 @@ static int scarlett2_compressor_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int channel = index / SCARLETT2_COMPRESSOR_PARAM_COUNT;
 	int param_index = index % SCARLETT2_COMPRESSOR_PARAM_COUNT;
 	const struct compressor_param *param = &compressor_params[param_index];
-
 	int oval, val, err;
 	s32 scaled_val;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->compressor_values[index];
 	val = ucontrol->value.integer.value[0];
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->compressor_values[index] = val;
 
@@ -5427,19 +5193,12 @@ static int scarlett2_compressor_ctl_put(
 	err = scarlett2_usb_set_data(
 		mixer, private->config_set->param_buf_addr + 1, 1, channel);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_COMPRESSOR_PARAMS, index, scaled_val);
-	if (err < 0)
-		goto unlock;
 
-	if (err == 0)
-		err = 1;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_compressor_ctl_info(
@@ -5495,20 +5254,18 @@ static int scarlett2_precomp_flt_switch_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->precomp_flt_switch[elem->control];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->precomp_flt_switch[elem->control] = val;
 
@@ -5516,12 +5273,8 @@ static int scarlett2_precomp_flt_switch_ctl_put(
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_PRECOMP_FLT_SWITCH,
 		elem->control, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_peq_flt_switch_ctl_put(
@@ -5530,20 +5283,18 @@ static int scarlett2_peq_flt_switch_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->peq_flt_switch[elem->control];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->peq_flt_switch[elem->control] = val;
 
@@ -5551,12 +5302,8 @@ static int scarlett2_peq_flt_switch_ctl_put(
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_PEQ_FLT_SWITCH,
 		elem->control, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_precomp_flt_switch_ctl = {
@@ -5677,20 +5424,17 @@ static int scarlett2_precomp_flt_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control * SCARLETT2_BIQUAD_COEFFS;
 	int i, oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* Check if any of the values have changed; if not, return */
 	for (i = 0; i < SCARLETT2_BIQUAD_COEFFS; i++) {
@@ -5701,7 +5445,7 @@ static int scarlett2_precomp_flt_ctl_put(
 	}
 
 	if (i == SCARLETT2_BIQUAD_COEFFS)
-		goto unlock;
+		return 0;
 
 	/* Update the values */
 	for (i = 0; i < SCARLETT2_BIQUAD_COEFFS; i++)
@@ -5712,19 +5456,14 @@ static int scarlett2_precomp_flt_ctl_put(
 	err = scarlett2_usb_set_data(
 		mixer, private->config_set->param_buf_addr, 1, index);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	err = scarlett2_usb_set_config_buf(
 		mixer, SCARLETT2_CONFIG_PRECOMP_FLT_PARAMS,
 		index, SCARLETT2_BIQUAD_COEFFS,
 		&private->precomp_flt_values[index]);
 
-	if (err == 0)
-		err = 1;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_peq_flt_ctl_put(
@@ -5734,7 +5473,6 @@ static int scarlett2_peq_flt_ctl_put(
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-
 	int src_index = elem->control * SCARLETT2_BIQUAD_COEFFS;
 	int dst_index = (
 		elem->control /
@@ -5744,16 +5482,14 @@ static int scarlett2_peq_flt_ctl_put(
 	) * SCARLETT2_BIQUAD_COEFFS;
 	int i, oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* Check if any of the values have changed; if not, return */
 	for (i = 0; i < SCARLETT2_BIQUAD_COEFFS; i++) {
@@ -5764,7 +5500,7 @@ static int scarlett2_peq_flt_ctl_put(
 	}
 
 	if (i == SCARLETT2_BIQUAD_COEFFS)
-		goto unlock;
+		return 0;
 
 	/* Update the values */
 	for (i = 0; i < SCARLETT2_BIQUAD_COEFFS; i++)
@@ -5775,19 +5511,14 @@ static int scarlett2_peq_flt_ctl_put(
 	err = scarlett2_usb_set_data(
 		mixer, private->config_set->param_buf_addr, 1, dst_index);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	err = scarlett2_usb_set_config_buf(
 		mixer, SCARLETT2_CONFIG_PEQ_FLT_PARAMS,
 		dst_index, SCARLETT2_BIQUAD_COEFFS,
 		&private->peq_flt_values[src_index]);
 
-	if (err == 0)
-		err = 1;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_flt_ctl_info(
@@ -5840,26 +5571,21 @@ static int scarlett2_input_mute_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->input_mute_updated) {
 		err = scarlett2_update_input_mute(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] =
 		private->input_mute_switch[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_input_mute_ctl_put(struct snd_kcontrol *kctl,
@@ -5868,26 +5594,23 @@ static int scarlett2_input_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->input_mute_switch[index];
 	val = ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->input_mute_switch[index] = val;
 
@@ -5895,12 +5618,8 @@ static int scarlett2_input_mute_ctl_put(struct snd_kcontrol *kctl,
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_INPUT_MUTE_SWITCH,
 			index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_input_mute_ctl = {
@@ -6011,23 +5730,18 @@ static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_input_phantom_updated(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	ucontrol->value.integer.value[0] = scarlett2_decode_muteable(
 		private->phantom_switch[elem->control]);
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
@@ -6037,26 +5751,23 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-
 	int index = elem->control;
 	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_check_put_during_autogain(mixer);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	oval = private->phantom_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->phantom_switch[index] = val;
 
@@ -6067,15 +5778,10 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
 				       index + info->phantom_first, val);
-	if (err == 0)
-		err = 1;
-
 	scarlett2_phantom_update_access(mixer);
 	scarlett2_phantom_notify_access(mixer);
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_phantom_ctl = {
@@ -6104,34 +5810,27 @@ static int scarlett2_phantom_persistence_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->phantom_persistence;
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->phantom_persistence = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE, index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_phantom_persistence_ctl = {
@@ -6222,25 +5921,20 @@ static int scarlett2_speaker_switch_enum_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->monitor_other_updated) {
 		err = scarlett2_update_monitor_other(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->speaker_switching_switch;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 /* when speaker switching gets enabled, switch the main/alt speakers
@@ -6306,21 +6000,18 @@ static int scarlett2_speaker_switch_enum_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err;
 
-	int oval, val, err = 0;
+	guard(mutex)(&private->data_mutex);
 
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->speaker_switching_switch;
 	val = min(ucontrol->value.enumerated.item[0], 2U);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->speaker_switching_switch = val;
 
@@ -6329,14 +6020,14 @@ static int scarlett2_speaker_switch_enum_ctl_put(
 		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
 		0, !!val);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* if speaker switching is enabled, select main or alt */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
 		0, val == 2);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* update controls if speaker switching gets enabled or disabled */
 	if (!oval && val)
@@ -6344,12 +6035,7 @@ static int scarlett2_speaker_switch_enum_ctl_put(
 	else if (oval && !val)
 		scarlett2_speaker_switch_disable(mixer);
 
-	if (err == 0)
-		err = 1;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_speaker_switch_enum_ctl = {
@@ -6392,25 +6078,20 @@ static int scarlett2_talkback_enum_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->monitor_other_updated) {
 		err = scarlett2_update_monitor_other(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->talkback_switch;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_talkback_enum_ctl_put(
@@ -6419,21 +6100,18 @@ static int scarlett2_talkback_enum_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err;
 
-	int oval, val, err = 0;
+	guard(mutex)(&private->data_mutex);
 
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->talkback_switch;
 	val = min(ucontrol->value.enumerated.item[0], 2U);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->talkback_switch = val;
 
@@ -6442,18 +6120,14 @@ static int scarlett2_talkback_enum_ctl_put(
 		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
 		1, !!val);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* if talkback is enabled, select main or alt */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
 		1, val == 2);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_talkback_enum_ctl = {
@@ -6484,21 +6158,19 @@ static int scarlett2_talkback_map_ctl_put(
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
-	int oval, val, err = 0, i;
+	int oval, val, err, i;
 	u16 bitmap = 0;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->talkback_map[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->talkback_map[index] = val;
 
@@ -6508,12 +6180,8 @@ static int scarlett2_talkback_map_ctl_put(
 	/* Send updated bitmap to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_TALKBACK_MAP,
 				       0, bitmap);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_talkback_map_ctl = {
@@ -6561,25 +6229,20 @@ static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->dim_mute_updated) {
 		err = scarlett2_update_dim_mute(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->dim_mute[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
@@ -6589,29 +6252,24 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = elem->control;
-	int oval, val, err = 0, i;
+	int oval, val, err, i;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->dim_mute[index];
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->dim_mute[index] = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_DIM_MUTE,
 				       index, val);
-	if (err == 0)
-		err = 1;
-
 	if (index == SCARLETT2_BUTTON_MUTE)
 		for (i = 0; i < private->num_line_out; i++) {
 			int line_index = line_out_remap(private, i);
@@ -6624,9 +6282,7 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 			}
 		}
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_dim_mute_ctl = {
@@ -7038,25 +6694,20 @@ static int scarlett2_mixer_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->mix_updated) {
 		err = scarlett2_update_mix(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->mix[elem->control];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
@@ -7065,15 +6716,13 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int oval, val, mix_num, err = 0;
+	int oval, val, mix_num, err;
 	int index = elem->control;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->mix[index];
 	val = clamp(ucontrol->value.integer.value[0],
@@ -7081,16 +6730,12 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 	mix_num = index / private->num_mix_in;
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->mix[index] = val;
 	err = scarlett2_usb_set_mix(mixer, mix_num);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const DECLARE_TLV_DB_MINMAX(
@@ -7177,25 +6822,20 @@ static int scarlett2_direct_monitor_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->direct_monitor_updated) {
 		err = scarlett2_update_direct_monitor(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->direct_monitor_switch;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_direct_monitor_ctl_put(
@@ -7204,34 +6844,27 @@ static int scarlett2_direct_monitor_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->direct_monitor_switch;
 	val = min(ucontrol->value.enumerated.item[0], 2U);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->direct_monitor_switch = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_DIRECT_MONITOR, index, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_direct_monitor_stereo_enum_ctl_info(
@@ -7281,33 +6914,27 @@ static int scarlett2_monitor_mix_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int oval, val, err = 0;
+	int oval, val, err;
 	int index = elem->control;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->monitor_mix[index];
 	val = clamp(ucontrol->value.integer.value[0],
 		    0L, (long)SCARLETT2_MIXER_MAX_VALUE);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->monitor_mix[index] = val;
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN,
 		index, scarlett2_mixer_values[val]);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_monitor_mix_ctl = {
@@ -7433,25 +7060,20 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->mux_updated) {
 		err = scarlett2_usb_get_mux(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.enumerated.item[0] = private->mux[index];
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
@@ -7461,30 +7083,24 @@ static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	int index = line_out_remap(private, elem->control);
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->mux[index];
 	val = min(ucontrol->value.enumerated.item[0],
 		  private->num_mux_srcs - 1U);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->mux[index] = val;
 	err = scarlett2_usb_set_mux(mixer);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_mux_src_enum_ctl = {
@@ -7561,17 +7177,15 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 	u16 meter_levels[SCARLETT2_MAX_METERS];
 	int i, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	err = scarlett2_usb_get_meter_levels(mixer, elem->channels,
 					     meter_levels);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* copy & translate from meter_levels[] using meter_level_map[] */
 	for (i = 0; i < elem->channels; i++) {
@@ -7586,10 +7200,7 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 		ucontrol->value.integer.value[i] = value;
 	}
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-
-	return err;
+	return 0;
 }
 
 static const struct snd_kcontrol_new scarlett2_meter_ctl = {
@@ -7631,33 +7242,26 @@ static int scarlett2_msd_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err;
 
-	int oval, val, err = 0;
+	guard(mutex)(&private->data_mutex);
 
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->msd_switch;
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->msd_switch = val;
 
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_MSD_SWITCH,
 				       0, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_msd_ctl = {
@@ -7702,21 +7306,18 @@ static int scarlett2_standalone_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	int oval, val, err;
 
-	int oval, val, err = 0;
+	guard(mutex)(&private->data_mutex);
 
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->standalone_switch;
 	val = !!ucontrol->value.integer.value[0];
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->standalone_switch = val;
 
@@ -7724,12 +7325,8 @@ static int scarlett2_standalone_ctl_put(struct snd_kcontrol *kctl,
 	err = scarlett2_usb_set_config(mixer,
 				       SCARLETT2_CONFIG_STANDALONE_SWITCH,
 				       0, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_standalone_ctl = {
@@ -7789,20 +7386,17 @@ static int scarlett2_power_status_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
 	if (private->power_status_updated) {
 		err = scarlett2_update_power_status(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->power_status;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_power_status_ctl_info(
@@ -7864,25 +7458,20 @@ static int scarlett2_bluetooth_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	if (private->bluetooth_updated) {
 		err = scarlett2_update_bluetooth_volume(mixer);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	ucontrol->value.integer.value[0] = private->bluetooth_volume;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return 0;
 }
 
 static int scarlett2_bluetooth_volume_ctl_put(struct snd_kcontrol *kctl,
@@ -7891,32 +7480,26 @@ static int scarlett2_bluetooth_volume_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int oval, val, err = 0;
+	int oval, val, err;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (private->hwdep_in_use)
+		return -EBUSY;
 
 	oval = private->bluetooth_volume;
 	val = clamp(ucontrol->value.integer.value[0],
 		    0L, (long)SCARLETT2_MAX_BLUETOOTH_VOLUME);
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->bluetooth_volume = val;
 	err = scarlett2_usb_set_config(mixer,
 				       SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
 				       0, val);
-	if (err == 0)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static int scarlett2_bluetooth_volume_ctl_info(
@@ -8011,39 +7594,31 @@ static int scarlett2_spdif_mode_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int oval, val, err = 0;
+	int oval, val, err;
 	int i;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 
 	oval = private->spdif_mode;
 	val = ucontrol->value.enumerated.item[0];
 
-	if (val < 0) {
-		err = -EINVAL;
-		goto unlock;
-	}
+	if (val < 0)
+		return -EINVAL;
 
 	for (i = 0; i <= val; i++)
-		if (private->info->spdif_mode_values[i] == 0xff) {
-			err = -EINVAL;
-			goto unlock;
-		}
+		if (private->info->spdif_mode_values[i] == 0xff)
+			return -EINVAL;
 
 	if (oval == val)
-		goto unlock;
+		return 0;
 
 	private->spdif_mode = val;
 
 	err = scarlett2_usb_set_config(
 		mixer, SCARLETT2_CONFIG_SPDIF_MODE, 0,
 		private->info->spdif_mode_values[val]);
-	if (!err)
-		err = 1;
 
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
+	return err < 0 ? err : 1;
 }
 
 static const struct snd_kcontrol_new scarlett2_spdif_mode_ctl = {
@@ -9140,9 +8715,8 @@ static int snd_scarlett2_controls_create(
  */
 static void scarlett2_lock(struct scarlett2_data *private)
 {
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 	private->hwdep_in_use = 1;
-	mutex_unlock(&private->data_mutex);
 }
 
 /* Call SCARLETT2_USB_GET_ERASE to get the erase progress */
@@ -9414,7 +8988,7 @@ static long scarlett2_hwdep_read(struct snd_hwdep *hw,
 		__le32 len;
 	} __packed req;
 
-	u8 *resp;
+	u8 *resp __free(kfree) = NULL;
 
 	/* Flash segment must first be selected */
 	if (private->flash_write_state != SCARLETT2_FLASH_WRITE_STATE_SELECTED)
@@ -9460,20 +9034,14 @@ static long scarlett2_hwdep_read(struct snd_hwdep *hw,
 	err = scarlett2_usb(mixer, SCARLETT2_USB_READ_SEGMENT,
 			    &req, sizeof(req), resp, count);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* Copy the response to userspace */
-	if (copy_to_user(buf, resp, count)) {
-		err = -EFAULT;
-		goto error;
-	}
+	if (copy_to_user(buf, resp, count))
+		return -EFAULT;
 
 	*offset += count;
-	err = count;
-
-error:
-	kfree(resp);
-	return err;
+	return count;
 }
 
 static long scarlett2_hwdep_write(struct snd_hwdep *hw,
@@ -9491,7 +9059,7 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 		__le32 offset;
 		__le32 pad;
 		u8 data[];
-	} __packed *req;
+	} __packed *req __free(kfree) = NULL;
 
 	/* Calculate the maximum permitted in data[] */
 	const size_t max_data_size = SCARLETT2_FLASH_RW_MAX -
@@ -9545,22 +9113,16 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 	req->offset = cpu_to_le32(*offset);
 	req->pad = 0;
 
-	if (copy_from_user(req->data, buf, count)) {
-		err = -EFAULT;
-		goto error;
-	}
+	if (copy_from_user(req->data, buf, count))
+		return -EFAULT;
 
 	err = scarlett2_usb(mixer, SCARLETT2_USB_WRITE_SEGMENT,
 			    req, len, NULL, 0);
 	if (err < 0)
-		goto error;
+		return err;
 
 	*offset += count;
-	err = count;
-
-error:
-	kfree(req);
-	return err;
+	return count;
 }
 
 static int scarlett2_hwdep_release(struct snd_hwdep *hw, struct file *file)
@@ -9610,7 +9172,7 @@ static ssize_t scarlett2_devmap_read(
 	loff_t                 pos)
 {
 	struct usb_mixer_interface *mixer = entry->private_data;
-	u8           *resp_buf;
+	u8           *resp_buf __free(kfree) = NULL;
 	const size_t  block_size = SCARLETT2_DEVMAP_BLOCK_SIZE;
 	size_t        copied = 0;
 
@@ -9649,15 +9211,11 @@ static ssize_t scarlett2_devmap_read(
 		req = cpu_to_le32(pos / block_size);
 		err = scarlett2_usb(mixer, SCARLETT2_USB_GET_DEVMAP,
 				    &req, sizeof(req), resp_buf, read_size);
-		if (err < 0) {
-			kfree(resp_buf);
+		if (err < 0)
 			return copied ? copied : err;
-		}
 
-		if (copy_to_user(buf, resp_buf + offset, copy_size)) {
-			kfree(resp_buf);
+		if (copy_to_user(buf, resp_buf + offset, copy_size))
 			return -EFAULT;
-		}
 
 		buf += copy_size;
 		pos += copy_size;
@@ -9665,7 +9223,6 @@ static ssize_t scarlett2_devmap_read(
 		count -= copy_size;
 	}
 
-	kfree(resp_buf);
 	return copied;
 }
 
-- 
2.50.1

