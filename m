Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531991FEFA6
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496255; cv=none; b=k9kTcyfyVXJRS/vwrNlm1L+ZXx3kqxH3es1UlPU3kvYw1z/MOJdL9NJvGUCDVXGFKv0f9itjt510q9alUzuhbAz3Ba3gf0GUArS5IVajL9J8jkFzjVNEIPLBKaoHfSA9HKk18Eo3OcINtNRvxByqEQj/da8Hp0XRGcEeGuuVelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496255; c=relaxed/simple;
	bh=n8kk9fAdulkxyo5yiwKDBqWKVID99Q+2VGSJwhUTXCg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DiJdynBCEhEBilNzzh65Qe9PwLS/uG2XK1ZuqfWhXz5OwyUypC7yICGL8YB//Ra2U7ZPFplDxnqeu3mVu5Y+B7+I2oL0QRSynyksZiLFKPze6X6ItAAJtM6Wd2Rnj4kyLTN7nlvOBUmyMKDP3RmFWSqyuoUrd2DFUk+LK0QR+Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CzhjNl1y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F8U76HdI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CzhjNl1y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F8U76HdI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CzhjNl1y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F8U76HdI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CzhjNl1y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F8U76HdI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90247211CF;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EEvaJUTdqv5jMUtdBpCHUSV0Zi1wZ54yuBvEmB8Mi8=;
	b=CzhjNl1yH1htso7898FcZSgzeM4clLcWYil8YjKK5PO/iFX1edkxQqCrNLDCgMnzwP8YgO
	u6uQ7M4uS09cFFLr5wsurnSoaDAAEYSSiRB6UGPyeoJRENg5dEMl5Or90YFdtuURKwY5Vp
	JsMo4u0MfoeRj/H7sU0HcYZ8f3Iy9DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EEvaJUTdqv5jMUtdBpCHUSV0Zi1wZ54yuBvEmB8Mi8=;
	b=F8U76HdIR7l206mpZEeP4Z0sjpkkNmAhh5SBcw+229tqnbLZKTVHlnFBsQSuA/x4n5yV3/
	5rQABDoFRUMe7HBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EEvaJUTdqv5jMUtdBpCHUSV0Zi1wZ54yuBvEmB8Mi8=;
	b=CzhjNl1yH1htso7898FcZSgzeM4clLcWYil8YjKK5PO/iFX1edkxQqCrNLDCgMnzwP8YgO
	u6uQ7M4uS09cFFLr5wsurnSoaDAAEYSSiRB6UGPyeoJRENg5dEMl5Or90YFdtuURKwY5Vp
	JsMo4u0MfoeRj/H7sU0HcYZ8f3Iy9DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EEvaJUTdqv5jMUtdBpCHUSV0Zi1wZ54yuBvEmB8Mi8=;
	b=F8U76HdIR7l206mpZEeP4Z0sjpkkNmAhh5SBcw+229tqnbLZKTVHlnFBsQSuA/x4n5yV3/
	5rQABDoFRUMe7HBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7679313AE3;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +JKaGzaJNGe3UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:10:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ALSA: caiaq: Use snd_card_free_when_closed() at disconnection
Date: Wed, 13 Nov 2024 12:10:38 +0100
Message-ID: <20241113111042.15058-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113111042.15058-1-tiwai@suse.de>
References: <20241113111042.15058-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The USB disconnect callback is supposed to be short and not too-long
waiting.  OTOH, the current code uses snd_card_free() at
disconnection, but this waits for the close of all used fds, hence it
can take long.  It eventually blocks the upper layer USB ioctls, which
may trigger a soft lockup.

An easy workaround is to replace snd_card_free() with
snd_card_free_when_closed().  This variant returns immediately while
the release of resources is done asynchronously by the card device
release at the last close.

This patch also splits the code to the disconnect and the free phases;
the former is called immediately at the USB disconnect callback while
the latter is called from the card destructor.

Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/audio.c  | 10 ++++++++--
 sound/usb/caiaq/audio.h  |  1 +
 sound/usb/caiaq/device.c | 19 +++++++++++++++----
 sound/usb/caiaq/input.c  | 12 +++++++++---
 sound/usb/caiaq/input.h  |  1 +
 5 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 772c0ecb7077..05f964347ed6 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -858,14 +858,20 @@ int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev)
 	return 0;
 }
 
-void snd_usb_caiaq_audio_free(struct snd_usb_caiaqdev *cdev)
+void snd_usb_caiaq_audio_disconnect(struct snd_usb_caiaqdev *cdev)
 {
 	struct device *dev = caiaqdev_to_dev(cdev);
 
 	dev_dbg(dev, "%s(%p)\n", __func__, cdev);
 	stream_stop(cdev);
+}
+
+void snd_usb_caiaq_audio_free(struct snd_usb_caiaqdev *cdev)
+{
+	struct device *dev = caiaqdev_to_dev(cdev);
+
+	dev_dbg(dev, "%s(%p)\n", __func__, cdev);
 	free_urbs(cdev->data_urbs_in);
 	free_urbs(cdev->data_urbs_out);
 	kfree(cdev->data_cb_info);
 }
-
diff --git a/sound/usb/caiaq/audio.h b/sound/usb/caiaq/audio.h
index 869bf6264d6a..07f5d064456c 100644
--- a/sound/usb/caiaq/audio.h
+++ b/sound/usb/caiaq/audio.h
@@ -3,6 +3,7 @@
 #define CAIAQ_AUDIO_H
 
 int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev);
+void snd_usb_caiaq_audio_disconnect(struct snd_usb_caiaqdev *cdev);
 void snd_usb_caiaq_audio_free(struct snd_usb_caiaqdev *cdev);
 
 #endif /* CAIAQ_AUDIO_H */
diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index b5cbf1f195c4..dfd820483849 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -376,6 +376,17 @@ static void setup_card(struct snd_usb_caiaqdev *cdev)
 		dev_err(dev, "Unable to set up control system (ret=%d)\n", ret);
 }
 
+static void card_free(struct snd_card *card)
+{
+	struct snd_usb_caiaqdev *cdev = caiaqdev(card);
+
+#ifdef CONFIG_SND_USB_CAIAQ_INPUT
+	snd_usb_caiaq_input_free(cdev);
+#endif
+	snd_usb_caiaq_audio_free(cdev);
+	usb_reset_device(cdev->chip.dev);
+}
+
 static int create_card(struct usb_device *usb_dev,
 		       struct usb_interface *intf,
 		       struct snd_card **cardp)
@@ -489,6 +500,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 		       cdev->vendor_name, cdev->product_name, usbpath);
 
 	setup_card(cdev);
+	card->private_free = card_free;
 	return 0;
 
  err_kill_urb:
@@ -534,15 +546,14 @@ static void snd_disconnect(struct usb_interface *intf)
 	snd_card_disconnect(card);
 
 #ifdef CONFIG_SND_USB_CAIAQ_INPUT
-	snd_usb_caiaq_input_free(cdev);
+	snd_usb_caiaq_input_disconnect(cdev);
 #endif
-	snd_usb_caiaq_audio_free(cdev);
+	snd_usb_caiaq_audio_disconnect(cdev);
 
 	usb_kill_urb(&cdev->ep1_in_urb);
 	usb_kill_urb(&cdev->midi_out_urb);
 
-	snd_card_free(card);
-	usb_reset_device(interface_to_usbdev(intf));
+	snd_card_free_when_closed(card);
 }
 
 
diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 84f26dce7f5d..a9130891bb69 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -829,15 +829,21 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 	return ret;
 }
 
-void snd_usb_caiaq_input_free(struct snd_usb_caiaqdev *cdev)
+void snd_usb_caiaq_input_disconnect(struct snd_usb_caiaqdev *cdev)
 {
 	if (!cdev || !cdev->input_dev)
 		return;
 
 	usb_kill_urb(cdev->ep4_in_urb);
+	input_unregister_device(cdev->input_dev);
+}
+
+void snd_usb_caiaq_input_free(struct snd_usb_caiaqdev *cdev)
+{
+	if (!cdev || !cdev->input_dev)
+		return;
+
 	usb_free_urb(cdev->ep4_in_urb);
 	cdev->ep4_in_urb = NULL;
-
-	input_unregister_device(cdev->input_dev);
 	cdev->input_dev = NULL;
 }
diff --git a/sound/usb/caiaq/input.h b/sound/usb/caiaq/input.h
index c42891e7be88..fbe267f85d02 100644
--- a/sound/usb/caiaq/input.h
+++ b/sound/usb/caiaq/input.h
@@ -4,6 +4,7 @@
 
 void snd_usb_caiaq_input_dispatch(struct snd_usb_caiaqdev *cdev, char *buf, unsigned int len);
 int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev);
+void snd_usb_caiaq_input_disconnect(struct snd_usb_caiaqdev *cdev);
 void snd_usb_caiaq_input_free(struct snd_usb_caiaqdev *cdev);
 
 #endif
-- 
2.43.0

