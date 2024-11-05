Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1151420A8
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808081; cv=none; b=eyaPaMshKP7R+IkKuSK+/gQ0SM16BoIS9jIaFBUnTTafxRi7VaDij4kqBI3F4A1b56JiodpDnhWYkVXhboS4McEuOpLCo52par3XUkC7n6PV18SrREXYbtuATS/m1BIcho8MstdxlKCP5X0oM/ZjA7lOadkTw/WSBTt8MP5hsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808081; c=relaxed/simple;
	bh=00ibMJiKI1ZHn0eIKpVcP79Zvq6z+J3W6W48lnR5OLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sneBeS2L+PYwZ5pEkyMr7betD5QI6q0tQ4N3zYm7dez6utlMWl4oe0fXgrXPwYPkxXb59AUh6RJAfzBj1QKWFeFSn+snS1uxdxsKnXwTesFEb/jCrKHhjex2O7fnLcOME1TK5bo5MU6Ca157/FywvEC7cSapSpBjLFUqIFYGn3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c6tf7vwG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DLLvEQ8U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c6tf7vwG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DLLvEQ8U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c6tf7vwG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DLLvEQ8U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c6tf7vwG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DLLvEQ8U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 266BF21E11;
	Tue,  5 Nov 2024 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730808077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdr+rbY+b+fikmKgPbyY2w70kOW9XRgixtmND6B+fU=;
	b=c6tf7vwG1kmhfirLf7V0G1OvHbv16rwh7MOHL6rnakkl41Vry3LuHMJKoLrtObUoYXGjOr
	oSF34Fy2N5ZEpIAZBwuy2wXhBQazsVOWxJkdDP3DycecVAJQy2pWmctQ5xjVhAldbbNn+M
	hcP46gAyWZkx5W8vgVGNz4LLDctqou0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730808077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdr+rbY+b+fikmKgPbyY2w70kOW9XRgixtmND6B+fU=;
	b=DLLvEQ8UAUMZoKFkORBpJLDRGS4swgH5jt4rIdZNehfC+Twffn0R5Im7NhL1hv1RE7+AE6
	G2Np2BdKVYfQhoCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c6tf7vwG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DLLvEQ8U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730808077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdr+rbY+b+fikmKgPbyY2w70kOW9XRgixtmND6B+fU=;
	b=c6tf7vwG1kmhfirLf7V0G1OvHbv16rwh7MOHL6rnakkl41Vry3LuHMJKoLrtObUoYXGjOr
	oSF34Fy2N5ZEpIAZBwuy2wXhBQazsVOWxJkdDP3DycecVAJQy2pWmctQ5xjVhAldbbNn+M
	hcP46gAyWZkx5W8vgVGNz4LLDctqou0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730808077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdr+rbY+b+fikmKgPbyY2w70kOW9XRgixtmND6B+fU=;
	b=DLLvEQ8UAUMZoKFkORBpJLDRGS4swgH5jt4rIdZNehfC+Twffn0R5Im7NhL1hv1RE7+AE6
	G2Np2BdKVYfQhoCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17A1713A39;
	Tue,  5 Nov 2024 12:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qGM1BQ0JKmcFcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 Nov 2024 12:01:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usb-audio: Make mic volume workarounds globally applicable
Date: Tue,  5 Nov 2024 13:02:18 +0100
Message-ID: <20241105120220.5740-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105120220.5740-1-tiwai@suse.de>
References: <20241105120220.5740-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 266BF21E11
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

It seems that many webcams have buggy firmware and don't expose the
mic capture volume with the proper resolution.  We have workarounds in
mixer.c, but judging from the numbers, those can be better managed as
global quirk flags.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c    | 58 ++++++++++++--------------------------------
 sound/usb/quirks.c   | 31 +++++++++++++++++++----
 sound/usb/usbaudio.h |  4 +++
 3 files changed, 45 insertions(+), 48 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index bd67027c7677..0591da283926 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1084,6 +1084,21 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 				  struct snd_kcontrol *kctl)
 {
 	struct snd_usb_audio *chip = cval->head.mixer->chip;
+
+	if (chip->quirk_flags & QUIRK_FLAG_MIC_RES_384) {
+		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
+			usb_audio_info(chip,
+				"set resolution quirk: cval->res = 384\n");
+			cval->res = 384;
+		}
+	} else if (chip->quirk_flags & QUIRK_FLAG_MIC_RES_16) {
+		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
+			usb_audio_info(chip,
+				"set resolution quirk: cval->res = 16\n");
+			cval->res = 16;
+		}
+	}
+
 	switch (chip->usb_id) {
 	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
 	case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C600 */
@@ -1168,27 +1183,6 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 		}
 		break;
 
-	case USB_ID(0x046d, 0x0807): /* Logitech Webcam C500 */
-	case USB_ID(0x046d, 0x0808):
-	case USB_ID(0x046d, 0x0809):
-	case USB_ID(0x046d, 0x0819): /* Logitech Webcam C210 */
-	case USB_ID(0x046d, 0x081b): /* HD Webcam c310 */
-	case USB_ID(0x046d, 0x081d): /* HD Webcam c510 */
-	case USB_ID(0x046d, 0x0825): /* HD Webcam c270 */
-	case USB_ID(0x046d, 0x0826): /* HD Webcam c525 */
-	case USB_ID(0x046d, 0x08ca): /* Logitech Quickcam Fusion */
-	case USB_ID(0x046d, 0x0991):
-	case USB_ID(0x046d, 0x09a2): /* QuickCam Communicate Deluxe/S7500 */
-	/* Most audio usb devices lie about volume resolution.
-	 * Most Logitech webcams have res = 384.
-	 * Probably there is some logitech magic behind this number --fishor
-	 */
-		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
-			usb_audio_info(chip,
-				"set resolution quirk: cval->res = 384\n");
-			cval->res = 384;
-		}
-		break;
 	case USB_ID(0x0495, 0x3042): /* ESS Technology Asus USB DAC */
 		if ((strstr(kctl->id.name, "Playback Volume") != NULL) ||
 			strstr(kctl->id.name, "Capture Volume") != NULL) {
@@ -1197,28 +1191,6 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 			cval->res = 1;
 		}
 		break;
-	case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
-		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
-			usb_audio_info(chip,
-				"set resolution quirk: cval->res = 16\n");
-			cval->res = 16;
-		}
-		break;
-	case USB_ID(0x1bcf, 0x2283): /* NexiGo N930AF FHD Webcam */
-	case USB_ID(0x03f0, 0x654a): /* HP 320 FHD Webcam */
-		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
-			usb_audio_info(chip,
-				"set resolution quirk: cval->res = 16\n");
-			cval->res = 16;
-		}
-		break;
-	case USB_ID(0x1bcf, 0x2281): /* HD Webcam */
-		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
-			usb_audio_info(chip,
-				"set resolution quirk: cval->res = 16\n");
-			cval->res = 16;
-		}
-		break;
 	}
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5fd180357d1..cbfbb064a9c2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2115,7 +2115,7 @@ struct usb_audio_quirk_flags_table {
 static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	/* Device matches */
 	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
@@ -2123,10 +2123,31 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x045e, 0x083c, /* MS USB Link headset */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
+	DEVICE_FLG(0x046d, 0x0807, /* Logitech Webcam C500 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x0808, /* Logitech Webcam C600 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x0809,
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x0819, /* Logitech Webcam C210 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x081b, /* HD Webcam c310 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x081d, /* HD Webcam c510 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x0825, /* HD Webcam c270 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x0826, /* HD Webcam c525 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x046d, 0x08ca, /* Logitech Quickcam Fusion */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
-		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR |
+		   QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x09a2, /* QuickCam Communicate Deluxe/S7500 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x09a4, /* Logitech QuickCam E 3500 */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
@@ -2194,7 +2215,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */
@@ -2232,9 +2253,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x19f7, 0x0035, /* RODE NT-USB+ */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index b0f042c99608..158ec053dc44 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -194,6 +194,8 @@ extern bool snd_usb_skip_validation;
  * QUIRK_FLAG_FIXED_RATE
  *  Do not set PCM rate (frequency) when only one rate is available
  *  for the given endpoint.
+ * QUIRK_FLAG_MIC_RES_16 and QUIRK_FLAG_MIC_RES_384
+ *  Set the fixed resolution for Mic Capture Volume (mostly for webcams)
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -218,5 +220,7 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_IFACE_SKIP_CLOSE	(1U << 19)
 #define QUIRK_FLAG_FORCE_IFACE_RESET	(1U << 20)
 #define QUIRK_FLAG_FIXED_RATE		(1U << 21)
+#define QUIRK_FLAG_MIC_RES_16		(1U << 22)
+#define QUIRK_FLAG_MIC_RES_384		(1U << 23)
 
 #endif /* __USBAUDIO_H */
-- 
2.43.0

