Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2B215789
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907418; cv=none; b=dGjeEOawCK1EA6pvcHYEUyL0utuk289Z14T2tgo3jWBl4IwlijY1cJdq+55yyYslI30wlT1C4sp27/VgIu0LwVt9EyC22Z+lHRFw6+XaRYpfOpMbL73Oh3dxixryva/VH4ChXQRsEo/b6U3NFR9o6SyT9UdLIPrjqy6B9t/aogs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907418; c=relaxed/simple;
	bh=H3H1dhWyV9ofxXW3AdSfJC7E0wgsGMzUs7/CeV1y6hw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=auHbmORw3rAH9MWDccyxZZ4PDCjjReK1HtM9itZTXFE4yuK5oHO3+klv+yUjqFqMvmTheuS53xeRO1M99TGORaYcXcK4MDBhb2+jjIUt/w39vdxH1gTV++JGKeKY30lDBrsIo1CjeENf7y/a+lWQEX0T0H3/TrGToqbDM6dsdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pZcRCjTI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RtguyaAA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pZcRCjTI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RtguyaAA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pZcRCjTI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RtguyaAA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pZcRCjTI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RtguyaAA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B6B6D5BDE7;
	Mon, 11 Aug 2025 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754907413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iU1mS6WqQfnH9YtzDsokCShCfRSSypdwtXdQb5+Sw7w=;
	b=pZcRCjTI9fT4y0KVNax9dYhh2XfsXfSyn6wLJ8vzZbpY7Fd+0XLh0BDNJGDTedxsH2EqMY
	jjulD9kviM7/ILV+N6qaCVTUpckdkInb/9ZugnqaRmuCo3VZDycXIzUHH0nLlyioPQ7wv8
	p8HOCsvhlSoJIPX1JVtRJuvu4jvc1aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754907413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iU1mS6WqQfnH9YtzDsokCShCfRSSypdwtXdQb5+Sw7w=;
	b=RtguyaAAGAXD0fhLOzGZTHb9bVNcJE2eK5kMimVmeD1bB2mAjvD4YK57CrwZaovEVeSsYF
	aJ6bttcIfaqHxrDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754907413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iU1mS6WqQfnH9YtzDsokCShCfRSSypdwtXdQb5+Sw7w=;
	b=pZcRCjTI9fT4y0KVNax9dYhh2XfsXfSyn6wLJ8vzZbpY7Fd+0XLh0BDNJGDTedxsH2EqMY
	jjulD9kviM7/ILV+N6qaCVTUpckdkInb/9ZugnqaRmuCo3VZDycXIzUHH0nLlyioPQ7wv8
	p8HOCsvhlSoJIPX1JVtRJuvu4jvc1aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754907413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iU1mS6WqQfnH9YtzDsokCShCfRSSypdwtXdQb5+Sw7w=;
	b=RtguyaAAGAXD0fhLOzGZTHb9bVNcJE2eK5kMimVmeD1bB2mAjvD4YK57CrwZaovEVeSsYF
	aJ6bttcIfaqHxrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94A5A13479;
	Mon, 11 Aug 2025 10:16:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mzzeIhXDmWg1CgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:16:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Use auto-cleanup for shutdown locks
Date: Mon, 11 Aug 2025 12:13:55 +0200
Message-ID: <20250811101647.8637-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Introduce an auto-cleanup macro for the temporary shutdown locks for
USB-audio, and replace the manual lock/unlock pairs with it.

Namely, the former

	err = snd_usb_lock_shutdown(chip);
	if (err < 0)
		return err;
	....
	snd_usb_unlock_shutdown(chip);

is replaced with

	CLASS(snd_usb_lock, pm)(chip);
	if (pm.err < 0)
		return pm.err;
	....

with the automatic unlocking.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c                 |  59 +++--
 sound/usb/mixer_quirks.c          | 348 ++++++++++++------------------
 sound/usb/pcm.c                   |  31 ++-
 sound/usb/qcom/qc_audio_offload.c |  15 +-
 sound/usb/usbaudio.h              |  23 ++
 5 files changed, 209 insertions(+), 267 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 63b300bc67ba..5fcf1117777d 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -313,8 +313,8 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 	int timeout = 10;
 	int idx = 0, err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
 		return -EIO;
 
 	while (timeout-- > 0) {
@@ -324,20 +324,15 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 				      validx, idx, buf, val_len);
 		if (err >= val_len) {
 			*value_ret = convert_signed_value(cval, snd_usb_combine_bytes(buf, val_len));
-			err = 0;
-			goto out;
+			return 0;
 		} else if (err == -ETIMEDOUT) {
-			goto out;
+			return err;
 		}
 	}
 	usb_audio_dbg(chip,
 		"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 		request, validx, idx, cval->val_type);
-	err = -EINVAL;
-
- out:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return -EINVAL;
 }
 
 static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
@@ -362,14 +357,16 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	memset(buf, 0, sizeof(buf));
 
-	if (snd_usb_lock_shutdown(chip))
-		return -EIO;
+	{
+		CLASS(snd_usb_lock, pm)(chip);
+		if (pm.err)
+			return -EIO;
 
-	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
-	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
-			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-			      validx, idx, buf, size);
-	snd_usb_unlock_shutdown(chip);
+		idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
+		ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
+				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+				      validx, idx, buf, size);
+	}
 
 	if (ret < 0) {
 		usb_audio_dbg(chip,
@@ -484,8 +481,8 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 	buf[2] = (value_set >> 16) & 0xff;
 	buf[3] = (value_set >> 24) & 0xff;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
 		return -EIO;
 
 	while (timeout-- > 0) {
@@ -494,20 +491,14 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 				      usb_sndctrlpipe(chip->dev, 0), request,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
 				      validx, idx, buf, val_len);
-		if (err >= 0) {
-			err = 0;
-			goto out;
-		} else if (err == -ETIMEDOUT) {
-			goto out;
-		}
+		if (err >= 0)
+			return 0;
+		else if (err == -ETIMEDOUT)
+			return err;
 	}
 	usb_audio_dbg(chip, "cannot set ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d, data = %#x/%#x\n",
 		      request, validx, idx, cval->val_type, buf[0], buf[1]);
-	err = -EINVAL;
-
- out:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return -EINVAL;
 }
 
 static int set_cur_ctl_value(struct usb_mixer_elem_info *cval,
@@ -1494,9 +1485,11 @@ static int get_connector_value(struct usb_mixer_elem_info *cval,
 
 	validx = cval->control << 8 | 0;
 
-	ret = snd_usb_lock_shutdown(chip) ? -EIO : 0;
-	if (ret)
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err) {
+		ret = -EIO;
 		goto error;
+	}
 
 	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
 	if (cval->head.mixer->protocol == UAC_VERSION_2) {
@@ -1517,8 +1510,6 @@ static int get_connector_value(struct usb_mixer_elem_info *cval,
 			*val = !!uac3_conn.bmConInserted;
 	}
 
-	snd_usb_unlock_shutdown(chip);
-
 	if (ret < 0) {
 		if (name && strstr(name, "Speaker")) {
 			if (val)
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 7cc27ae5512f..afeea297e10f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -307,9 +307,9 @@ static int snd_audigy2nx_led_update(struct usb_mixer_interface *mixer,
 	struct snd_usb_audio *chip = mixer->chip;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	if (chip->usb_id == USB_ID(0x041e, 0x3042))
 		err = snd_usb_ctl_msg(chip->dev,
@@ -327,7 +327,6 @@ static int snd_audigy2nx_led_update(struct usb_mixer_interface *mixer,
 				      usb_sndctrlpipe(chip->dev, 0), 0x24,
 				      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
 				      value, index + 2, NULL, 0);
-	snd_usb_unlock_shutdown(chip);
 	return err;
 }
 
@@ -438,15 +437,14 @@ static void snd_audigy2nx_proc_read(struct snd_info_entry *entry,
 
 	for (i = 0; jacks[i].name; ++i) {
 		snd_iprintf(buffer, "%s: ", jacks[i].name);
-		err = snd_usb_lock_shutdown(mixer->chip);
-		if (err < 0)
+		CLASS(snd_usb_lock, pm)(mixer->chip);
+		if (pm.err < 0)
 			return;
 		err = snd_usb_ctl_msg(mixer->chip->dev,
 				      usb_rcvctrlpipe(mixer->chip->dev, 0),
 				      UAC_GET_MEM, USB_DIR_IN | USB_TYPE_CLASS |
 				      USB_RECIP_INTERFACE, 0,
 				      jacks[i].unitid << 8, buf, 3);
-		snd_usb_unlock_shutdown(mixer->chip);
 		if (err == 3 && (buf[0] == 3 || buf[0] == 6))
 			snd_iprintf(buffer, "%02x %02x\n", buf[1], buf[2]);
 		else
@@ -474,21 +472,18 @@ static int snd_emu0204_ch_switch_update(struct usb_mixer_interface *mixer,
 					int value)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	int err;
 	unsigned char buf[2];
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	buf[0] = 0x01;
 	buf[1] = value ? 0x02 : 0x01;
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0), UAC_SET_CUR,
-			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
-			      0x0400, 0x0e00, buf, 2);
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0), UAC_SET_CUR,
+			       USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
+			       0x0400, 0x0e00, buf, 2);
 }
 
 static int snd_emu0204_ch_switch_put(struct snd_kcontrol *kcontrol,
@@ -804,17 +799,14 @@ static int snd_xonar_u1_switch_update(struct usb_mixer_interface *mixer,
 				      unsigned char status)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0), 0x08,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-			      50, 0, &status, 1);
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0), 0x08,
+			       USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+			       50, 0, &status, 1);
 }
 
 static int snd_xonar_u1_switch_put(struct snd_kcontrol *kcontrol,
@@ -945,20 +937,17 @@ static int snd_mbox1_clk_switch_get(struct snd_kcontrol *kctl,
 	struct snd_usb_audio *chip = list->mixer->chip;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		goto err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	err = snd_mbox1_is_spdif_synced(chip);
 	if (err < 0)
-		goto err;
+		return err;
 
 	kctl->private_value = err;
-	err = 0;
 	ucontrol->value.enumerated.item[0] = kctl->private_value;
-err:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return 0;
 }
 
 static int snd_mbox1_clk_switch_update(struct usb_mixer_interface *mixer, int is_spdif_sync)
@@ -966,27 +955,24 @@ static int snd_mbox1_clk_switch_update(struct usb_mixer_interface *mixer, int is
 	struct snd_usb_audio *chip = mixer->chip;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	err = snd_mbox1_is_spdif_input(chip);
 	if (err < 0)
-		goto err;
+		return err;
 
 	err = snd_mbox1_is_spdif_synced(chip);
 	if (err < 0)
-		goto err;
+		return err;
 
 	/* FIXME: hardcoded sample rate */
 	err = snd_mbox1_set_clk_source(chip, is_spdif_sync ? 0 : 48000);
 	if (err < 0)
-		goto err;
+		return err;
 
-	err = snd_mbox1_is_spdif_synced(chip);
-err:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_mbox1_is_spdif_synced(chip);
 }
 
 static int snd_mbox1_clk_switch_put(struct snd_kcontrol *kctl,
@@ -1037,26 +1023,23 @@ static int snd_mbox1_src_switch_update(struct usb_mixer_interface *mixer, int is
 	struct snd_usb_audio *chip = mixer->chip;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	err = snd_mbox1_is_spdif_input(chip);
+	if (err < 0)
+		return err;
+
+	err = snd_mbox1_set_input_source(chip, is_spdif_input);
 	if (err < 0)
 		return err;
 
 	err = snd_mbox1_is_spdif_input(chip);
 	if (err < 0)
-		goto err;
+		return err;
 
-	err = snd_mbox1_set_input_source(chip, is_spdif_input);
-	if (err < 0)
-		goto err;
-
-	err = snd_mbox1_is_spdif_input(chip);
-	if (err < 0)
-		goto err;
-
-	err = snd_mbox1_is_spdif_synced(chip);
-err:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_mbox1_is_spdif_synced(chip);
 }
 
 static int snd_mbox1_src_switch_put(struct snd_kcontrol *kctl,
@@ -1167,17 +1150,14 @@ static int snd_ni_update_cur_val(struct usb_mixer_elem_list *list)
 {
 	struct snd_usb_audio *chip = list->mixer->chip;
 	unsigned int pval = list->kctl->private_value;
-	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
-	err = usb_control_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
-			      (pval >> 16) & 0xff,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      pval >> 24, pval & 0xffff, NULL, 0, 1000);
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	return usb_control_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
+			       (pval >> 16) & 0xff,
+			       USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			       pval >> 24, pval & 0xffff, NULL, 0, 1000);
 }
 
 static int snd_nativeinstruments_control_put(struct snd_kcontrol *kcontrol,
@@ -1329,23 +1309,20 @@ static int snd_ftu_eff_switch_update(struct usb_mixer_elem_list *list)
 	struct snd_usb_audio *chip = list->mixer->chip;
 	unsigned int pval = list->kctl->private_value;
 	unsigned char value[2];
-	int err;
 
 	value[0] = pval >> 24;
 	value[1] = 0;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0),
-			      UAC_SET_CUR,
-			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
-			      pval & 0xff00,
-			      snd_usb_ctrl_intf(list->mixer->hostif) | ((pval & 0xff) << 8),
-			      value, 2);
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0),
+			       UAC_SET_CUR,
+			       USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
+			       pval & 0xff00,
+			       snd_usb_ctrl_intf(list->mixer->hostif) | ((pval & 0xff) << 8),
+			       value, 2);
 }
 
 static int snd_ftu_eff_switch_put(struct snd_kcontrol *kctl,
@@ -1908,9 +1885,9 @@ static int snd_microii_spdif_default_get(struct snd_kcontrol *kcontrol,
 	unsigned char data[3];
 	int rate;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	ucontrol->value.iec958.status[0] = kcontrol->private_value & 0xff;
 	ucontrol->value.iec958.status[1] = (kcontrol->private_value >> 8) & 0xff;
@@ -1918,15 +1895,11 @@ static int snd_microii_spdif_default_get(struct snd_kcontrol *kcontrol,
 
 	/* use known values for that card: interface#1 altsetting#1 */
 	iface = usb_ifnum_to_if(chip->dev, 1);
-	if (!iface || iface->num_altsetting < 2) {
-		err = -EINVAL;
-		goto end;
-	}
+	if (!iface || iface->num_altsetting < 2)
+		return -EINVAL;
 	alts = &iface->altsetting[1];
-	if (get_iface_desc(alts)->bNumEndpoints < 1) {
-		err = -EINVAL;
-		goto end;
-	}
+	if (get_iface_desc(alts)->bNumEndpoints < 1)
+		return -EINVAL;
 	ep = get_endpoint(alts, 0)->bEndpointAddress;
 
 	err = snd_usb_ctl_msg(chip->dev,
@@ -1938,16 +1911,13 @@ static int snd_microii_spdif_default_get(struct snd_kcontrol *kcontrol,
 			      data,
 			      sizeof(data));
 	if (err < 0)
-		goto end;
+		return err;
 
 	rate = data[0] | (data[1] << 8) | (data[2] << 16);
 	ucontrol->value.iec958.status[3] = (rate == 48000) ?
 			IEC958_AES3_CON_FS_48000 : IEC958_AES3_CON_FS_44100;
 
-	err = 0;
- end:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return 0;
 }
 
 static int snd_microii_spdif_default_update(struct usb_mixer_elem_list *list)
@@ -1957,9 +1927,9 @@ static int snd_microii_spdif_default_update(struct usb_mixer_elem_list *list)
 	u8 reg;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	reg = ((pval >> 4) & 0xf0) | (pval & 0x0f);
 	err = snd_usb_ctl_msg(chip->dev,
@@ -1971,7 +1941,7 @@ static int snd_microii_spdif_default_update(struct usb_mixer_elem_list *list)
 			      NULL,
 			      0);
 	if (err < 0)
-		goto end;
+		return err;
 
 	reg = (pval & IEC958_AES0_NONAUDIO) ? 0xa0 : 0x20;
 	reg |= (pval >> 12) & 0x0f;
@@ -1983,11 +1953,6 @@ static int snd_microii_spdif_default_update(struct usb_mixer_elem_list *list)
 			      3,
 			      NULL,
 			      0);
-	if (err < 0)
-		goto end;
-
- end:
-	snd_usb_unlock_shutdown(chip);
 	return err;
 }
 
@@ -2042,23 +2007,19 @@ static int snd_microii_spdif_switch_update(struct usb_mixer_elem_list *list)
 {
 	struct snd_usb_audio *chip = list->mixer->chip;
 	u8 reg = list->kctl->private_value;
-	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0),
-			      UAC_SET_CUR,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-			      reg,
-			      9,
-			      NULL,
-			      0);
-
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0),
+			       UAC_SET_CUR,
+			       USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+			       reg,
+			       9,
+			       NULL,
+			       0);
 }
 
 static int snd_microii_spdif_switch_put(struct snd_kcontrol *kcontrol,
@@ -2137,21 +2098,18 @@ static int snd_soundblaster_e1_switch_update(struct usb_mixer_interface *mixer,
 					     unsigned char state)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	int err;
 	unsigned char buff[2];
 
 	buff[0] = 0x02;
 	buff[1] = state ? 0x02 : 0x00;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0), HID_REQ_SET_REPORT,
-			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			      0x0202, 3, buff, 2);
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0), HID_REQ_SET_REPORT,
+			       USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_OUT,
+			       0x0202, 3, buff, 2);
 }
 
 static int snd_soundblaster_e1_switch_put(struct snd_kcontrol *kcontrol,
@@ -2273,32 +2231,28 @@ static int realtek_ctl_connector_get(struct snd_kcontrol *kcontrol,
 	bool presence;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 	err = realtek_hda_get(chip,
 			      HDA_VERB_CMD(AC_VERB_GET_PIN_SENSE, node_id, 0),
 			      &sense);
 	if (err < 0)
-		goto err;
+		return err;
 	if (pv & REALTEK_MIC_FLAG) {
 		err = realtek_hda_set(chip,
 				      HDA_VERB_CMD(AC_VERB_SET_COEF_INDEX,
 						   REALTEK_VENDOR_REGISTERS,
 						   REALTEK_CBJ_CTRL2));
 		if (err < 0)
-			goto err;
+			return err;
 		err = realtek_hda_get(chip,
 				      HDA_VERB_CMD(AC_VERB_GET_PROC_COEF,
 						   REALTEK_VENDOR_REGISTERS, 0),
 				      &cbj_ctrl2);
 		if (err < 0)
-			goto err;
+			return err;
 	}
-err:
-	snd_usb_unlock_shutdown(chip);
-	if (err < 0)
-		return err;
 
 	presence = sense & AC_PINSENSE_PRESENCE;
 	if (pv & REALTEK_MIC_FLAG)
@@ -2485,14 +2439,11 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
 	struct snd_usb_audio *chip = list->mixer->chip;
-	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
-	err = snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
 }
 
 static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
@@ -2609,22 +2560,19 @@ static int snd_rme_current_freq_get(struct snd_kcontrol *kcontrol,
 	unsigned int freq;
 	int err;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 	err = snd_rme_read_value(chip, SND_RME_GET_STATUS1, &status1);
 	if (err < 0)
-		goto end;
+		return err;
 	err = snd_rme_read_value(chip, SND_RME_GET_CURRENT_FREQ, &den);
 	if (err < 0)
-		goto end;
+		return err;
 	freq = (den == 0) ? 0 : div64_u64(num, den);
 	freq <<= SND_RME_CLK_FREQMUL(status1);
 	ucontrol->value.integer.value[0] = freq;
-
-end:
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return 0;
 }
 
 static int snd_rme_rate_info(struct snd_kcontrol *kcontrol,
@@ -2831,13 +2779,12 @@ enum {
 static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
 				 u8 index, u8 value)
 {
-	int err;
 	u16 usb_req, usb_idx, usb_val;
 	struct snd_usb_audio *chip = mixer->chip;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	if (reg == SND_BBFPRO_CTL_REG1) {
 		usb_req = SND_BBFPRO_USBREQ_CTL_REG1;
@@ -2854,13 +2801,10 @@ static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
 		usb_val = value ? usb_idx : 0;
 	}
 
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0), usb_req,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      usb_val, usb_idx, NULL, 0);
-
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0), usb_req,
+			       USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			       usb_val, usb_idx, NULL, 0);
 }
 
 static int snd_bbfpro_ctl_get(struct snd_kcontrol *kcontrol,
@@ -2975,7 +2919,6 @@ static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
 static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
 				  u8 channel, u8 gain)
 {
-	int err;
 	struct snd_usb_audio *chip = mixer->chip;
 
 	if (channel < 2) {
@@ -2986,18 +2929,15 @@ static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
 			gain = ((gain % 6) << 5) | (60 / 3);
 	}
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0),
-			      SND_BBFPRO_USBREQ_GAIN,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      gain, channel, NULL, 0);
-
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0),
+			       SND_BBFPRO_USBREQ_GAIN,
+			       USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			       gain, channel, NULL, 0);
 }
 
 static int snd_bbfpro_gain_get(struct snd_kcontrol *kcontrol,
@@ -3084,14 +3024,13 @@ static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
 				 u32 value)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	int err;
 	u16 idx;
 	u16 usb_idx, usb_val;
 	u32 v;
 
-	err = snd_usb_lock_shutdown(chip);
-	if (err < 0)
-		return err;
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
 
 	idx = index & SND_BBFPRO_MIXER_IDX_MASK;
 	// 18 bit linear volume, split so 2 bits end up in index.
@@ -3099,15 +3038,12 @@ static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
 	usb_idx = idx | (v & 0x3) << 14;
 	usb_val = (v >> 2) & 0xffff;
 
-	err = snd_usb_ctl_msg(chip->dev,
-			      usb_sndctrlpipe(chip->dev, 0),
-			      SND_BBFPRO_USBREQ_MIXER,
-			      USB_DIR_OUT | USB_TYPE_VENDOR |
-			      USB_RECIP_DEVICE,
-			      usb_val, usb_idx, NULL, 0);
-
-	snd_usb_unlock_shutdown(chip);
-	return err;
+	return snd_usb_ctl_msg(chip->dev,
+			       usb_sndctrlpipe(chip->dev, 0),
+			       SND_BBFPRO_USBREQ_MIXER,
+			       USB_DIR_OUT | USB_TYPE_VENDOR |
+			       USB_RECIP_DEVICE,
+			       usb_val, usb_idx, NULL, 0);
 }
 
 static int snd_bbfpro_vol_get(struct snd_kcontrol *kcontrol,
@@ -4212,26 +4148,22 @@ static int snd_djm_controls_info(struct snd_kcontrol *kctl,
 static int snd_djm_controls_update(struct usb_mixer_interface *mixer,
 				   u8 device_idx, u8 group, u16 value)
 {
-	int err;
 	const struct snd_djm_device *device = &snd_djm_devices[device_idx];
 
 	if (group >= device->ncontrols || value >= device->controls[group].noptions)
 		return -EINVAL;
 
-	err = snd_usb_lock_shutdown(mixer->chip);
-	if (err)
-		return err;
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err)
+		return pm.err;
 
-	err = snd_usb_ctl_msg(mixer->chip->dev,
-			      usb_sndctrlpipe(mixer->chip->dev, 0),
-			      USB_REQ_SET_FEATURE,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      device->controls[group].options[value],
-			      device->controls[group].wIndex,
-			      NULL, 0);
-
-	snd_usb_unlock_shutdown(mixer->chip);
-	return err;
+	return snd_usb_ctl_msg(mixer->chip->dev,
+			       usb_sndctrlpipe(mixer->chip->dev, 0),
+			       USB_REQ_SET_FEATURE,
+			       USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			       device->controls[group].options[value],
+			       device->controls[group].wIndex,
+			       NULL, 0);
 }
 
 static int snd_djm_controls_get(struct snd_kcontrol *kctl,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index c52fd0989c93..97e7c3b62c8e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -614,11 +614,11 @@ int snd_usb_hw_free(struct snd_usb_substream *subs)
 	scoped_guard(mutex, &chip->mutex) {
 		subs->cur_audiofmt = NULL;
 	}
-	if (!snd_usb_lock_shutdown(chip)) {
+	CLASS(snd_usb_lock, pm)(chip);
+	if (!pm.err) {
 		if (stop_endpoints(subs, false))
 			sync_pending_stops(subs);
 		close_endpoints(chip, subs);
-		snd_usb_unlock_shutdown(chip);
 	}
 
 	return 0;
@@ -675,28 +675,26 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	int retry = 0;
 	int ret;
 
-	ret = snd_usb_lock_shutdown(chip);
-	if (ret < 0)
-		return ret;
-	if (snd_BUG_ON(!subs->data_endpoint)) {
-		ret = -EIO;
-		goto unlock;
-	}
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	if (snd_BUG_ON(!subs->data_endpoint))
+		return -EIO;
 
 	ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D0);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 
  again:
 	if (subs->sync_endpoint) {
 		ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 		if (ret < 0)
-			goto unlock;
+			return ret;
 	}
 
 	ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 	else if (ret > 0)
 		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
 	ret = 0;
@@ -722,8 +720,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 			goto again;
 		}
 	}
- unlock:
-	snd_usb_unlock_shutdown(chip);
+
 	return ret;
 }
 
@@ -1296,9 +1293,11 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_media_stop_pipeline(subs);
 
-	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
+	{
+		CLASS(snd_usb_lock, pm)(subs->stream->chip);
+		if (pm.err)
+			return pm.err;
 		ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D1);
-		snd_usb_unlock_shutdown(subs->stream->chip);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a25c5a531690..965ddc792acc 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -961,21 +961,21 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 		goto put_suspend;
 
 	if (!atomic_read(&chip->shutdown)) {
-		ret = snd_usb_lock_shutdown(chip);
-		if (ret < 0)
+		CLASS(snd_usb_lock, pm)(chip);
+		if (pm.err < 0) {
+			ret = pm.err;
 			goto detach_ep;
+		}
 
 		if (subs->sync_endpoint) {
 			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (ret < 0)
-				goto unlock;
+				goto detach_ep;
 		}
 
 		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 		if (ret < 0)
-			goto unlock;
-
-		snd_usb_unlock_shutdown(chip);
+			goto detach_ep;
 
 		dev_dbg(uaudio_qdev->data->dev,
 			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
@@ -989,9 +989,6 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
-unlock:
-	snd_usb_unlock_shutdown(chip);
-
 detach_ep:
 	snd_usb_hw_free(subs);
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 158ec053dc44..7521098ba391 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -139,6 +139,29 @@ struct snd_usb_audio_quirk {
 int snd_usb_lock_shutdown(struct snd_usb_audio *chip);
 void snd_usb_unlock_shutdown(struct snd_usb_audio *chip);
 
+/* auto-cleanup */
+struct __snd_usb_lock {
+	struct snd_usb_audio *chip;
+	int err;
+};
+
+static inline struct __snd_usb_lock __snd_usb_lock_shutdown(struct snd_usb_audio *chip)
+{
+	struct __snd_usb_lock T = { .chip = chip };
+	T.err = snd_usb_lock_shutdown(chip);
+	return T;
+}
+
+static inline void __snd_usb_unlock_shutdown(struct __snd_usb_lock *lock)
+{
+	if (!lock->err)
+		snd_usb_unlock_shutdown(lock->chip);
+}
+
+DEFINE_CLASS(snd_usb_lock, struct __snd_usb_lock,
+	     __snd_usb_unlock_shutdown(&(_T)), __snd_usb_lock_shutdown(chip),
+	     struct snd_usb_audio *chip)
+
 extern bool snd_usb_use_vmalloc;
 extern bool snd_usb_skip_validation;
 
-- 
2.50.1

