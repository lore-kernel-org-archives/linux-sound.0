Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D6224EA
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723236578; cv=none; b=XRo91fZkstPwXKd7LAWB4jU4UE4z7QIw7mhtIvOlcGxrRQBR4KLocVJUzFUb4090tvhjwguDUIoUas82ydRM+w3GJlvmlH1qD+w/35/FUYdOO0Wml4u7c53j8fIcOC1YCLg8GGuJYvhW7Mp37920WfWGC0rD8ZWBR2/lvPzi9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723236578; c=relaxed/simple;
	bh=Zn0tCsuL6LRqTwGCdzazcPr3hxKeayGwVSneTe1Z2Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeLMCcOb5nrk3CBb3aBsMG88cD9XE2MYRt+LbLs0kf/r6eoMVKaFpucLajWAn2GHY549jNnknCDZfmn5AqidoPRoGSZRGI1zRoXWSTgPwNom3yL9JvDzWWDjx345h30hOSlAW8Q/NH555pQbkYp1hCn0eaFNmNg6aE1b+Lt7Oxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JShvQx0H; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JShvQx0H"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so3378037e87.2
        for <linux-sound@vger.kernel.org>; Fri, 09 Aug 2024 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723236575; x=1723841375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFFCIMQOJB3xvhip+DoOZz/X+Dohh6p0KM5+hYC/nyk=;
        b=JShvQx0HcJ5Yd6LcTD36j3iSjAjqGoaq+9Lp/XnYRCpCD30zWGdjeigs0T9tZi6Xsg
         VcaBSw01UUqbvB1pSJM0Q7iTJUANTgeE9KHsk9CJAi3nGIH1TatFtwniXvHdub2bKfvf
         t/aMkZDuGoCBvU2GzFUfcFykbHWH9nSwDMNpyzObz3jkAuP0J2znpQLfRoFSKPIKvN9l
         /imYMWMRL/GDvIJ3itanpAleJ02Kv9X+ZwG3IyYM8e5WLzZ5LEhFkzEEkmkSE0Zny1dz
         b3WkyQE0ewS6M07A9fGgUaAjyhwaHzX0U+dfTc6ggWuockKZaYXtAjeegJbb2qO9bKki
         y08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723236575; x=1723841375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFFCIMQOJB3xvhip+DoOZz/X+Dohh6p0KM5+hYC/nyk=;
        b=UrIf0HH6Su3UeounPPjv2wOldKqI47keUoyWrZRl+qSrDrRoQ8pkWMfOPeZrdJpWRF
         TUaFwDurZ1HNh3zKb5eoxlSwiQU3AsuafVIkPuduyIBwojcA9rgeNRS3+wW+kBqaP7TY
         NkGPCPF5ErgJLj05g2o4PefONLrOKb60laWDzgjpSwS+YO21Dol2WltNbCs1FHbWtV8J
         q1OMRP0ZVu9fUEdACH3xoA/5ndVNYh2gJdnNbZuTnNtCf1ILFchCIw90irTdL0IGmOaQ
         3TBQ00k4EQr/O29y8VokjD7EEerXxm4VjboNoZz0tAWkOHDKHX3Xh8f+ierIdE7J3hlO
         Pb2A==
X-Gm-Message-State: AOJu0Yw8JsdbXkR40SkszPY717rhdZZjZqrDHJFLJ3JENkgM2zXLhK4C
	k7vsgcmPOFdTNqjiak8yXc6WfHzc5rk02zuj+WEFu1oFpBtYewZPl7lOd4vexuc=
X-Google-Smtp-Source: AGHT+IGTxmY2905HcBHUcsFI6scFEqeHYueU0SPc4WoW8dHjHIgs63EP8UIjAx8RrG+xgKI6zmmIXg==
X-Received: by 2002:ac2:4e0b:0:b0:52f:c24b:175f with SMTP id 2adb3069b0e04-530ee99e101mr2381429e87.20.1723236574115;
        Fri, 09 Aug 2024 13:49:34 -0700 (PDT)
Received: from stefan-ms7d75.lan (84-217-106-36.customers.ownit.se. [84.217.106.36])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f428b3sm29537e87.288.2024.08.09.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 13:49:33 -0700 (PDT)
From: Stefan Stistrup <sstistrup@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Stefan Stistrup <sstistrup@gmail.com>
Subject: [PATCH v3] ALSA: usb-audio: Add input gain and master output mixer elements for RME Babyface Pro
Date: Fri,  9 Aug 2024 22:49:22 +0200
Message-ID: <20240809204922.20112-1-sstistrup@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing input gain and master output mixer controls for 
RME Babyface Pro.

This patch implements:

1. Input gain controls for 2 mic and 2 line inputs
2. Master output volume controls for all 12 output channels

These additions allow for more complete control of the Babyface Pro under
Linux.

Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
---
Changes in v3:
 - Use checkpatch.pl without -f flag.
 - Fix remaining style issues from checkpatch.pl

Changes in v2:
 - Check invalid negative values in snd_bbfpro_gain_put
 - Remove blank line in snd_bbfpro_gain_update and fix checkpatch.pl errors

 sound/usb/mixer_quirks.c | 163 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 065a4be0d771..5abfcd90b7a2 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2541,14 +2541,23 @@ enum {
 #define SND_BBFPRO_CTL_REG2_PAD_AN1 4
 #define SND_BBFPRO_CTL_REG2_PAD_AN2 5
 
-#define SND_BBFPRO_MIXER_IDX_MASK 0x1ff
+#define SND_BBFPRO_MIXER_MAIN_OUT_CH_OFFSET 992
+#define SND_BBFPRO_MIXER_IDX_MASK 0x3ff
 #define SND_BBFPRO_MIXER_VAL_MASK 0x3ffff
 #define SND_BBFPRO_MIXER_VAL_SHIFT 9
 #define SND_BBFPRO_MIXER_VAL_MIN 0 // -inf
 #define SND_BBFPRO_MIXER_VAL_MAX 65536 // +6dB
 
+#define SND_BBFPRO_GAIN_CHANNEL_MASK 0x03
+#define SND_BBFPRO_GAIN_CHANNEL_SHIFT 7
+#define SND_BBFPRO_GAIN_VAL_MASK 0x7f
+#define SND_BBFPRO_GAIN_VAL_MIN 0
+#define SND_BBFPRO_GAIN_VAL_MIC_MAX 65
+#define SND_BBFPRO_GAIN_VAL_LINE_MAX 18 // 9db in 0.5db incraments
+
 #define SND_BBFPRO_USBREQ_CTL_REG1 0x10
 #define SND_BBFPRO_USBREQ_CTL_REG2 0x17
+#define SND_BBFPRO_USBREQ_GAIN 0x1a
 #define SND_BBFPRO_USBREQ_MIXER 0x12
 
 static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
@@ -2695,6 +2704,114 @@ static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
 	return snd_bbfpro_ctl_update(list->mixer, reg, idx, value);
 }
 
+static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
+				  u8 channel, u8 gain)
+{
+	int err;
+	struct snd_usb_audio *chip = mixer->chip;
+
+	if (channel < 2) {
+		// XLR preamp: 3-bit fine, 5-bit coarse; special case >60
+		if (gain < 60)
+			gain = ((gain % 3) << 5) | (gain / 3);
+		else
+			gain = ((gain % 6) << 5) | (60 / 3);
+	}
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	err = snd_usb_ctl_msg(chip->dev,
+			      usb_sndctrlpipe(chip->dev, 0),
+			      SND_BBFPRO_USBREQ_GAIN,
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      gain, channel, NULL, 0);
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_bbfpro_gain_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	int value = kcontrol->private_value & SND_BBFPRO_GAIN_VAL_MASK;
+
+	ucontrol->value.integer.value[0] = value;
+	return 0;
+}
+
+static int snd_bbfpro_gain_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	int pv, channel;
+
+	pv = kcontrol->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		SND_BBFPRO_GAIN_CHANNEL_MASK;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = SND_BBFPRO_GAIN_VAL_MIN;
+
+	if (channel < 2)
+		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_MIC_MAX;
+	else
+		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_LINE_MAX;
+
+	return 0;
+}
+
+static int snd_bbfpro_gain_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	int pv, channel, old_value, value, err;
+
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	struct usb_mixer_interface *mixer = list->mixer;
+
+	pv = kcontrol->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		SND_BBFPRO_GAIN_CHANNEL_MASK;
+	old_value = pv & SND_BBFPRO_GAIN_VAL_MASK;
+	value = ucontrol->value.integer.value[0];
+
+	if (value < SND_BBFPRO_GAIN_VAL_MIN)
+		return -EINVAL;
+
+	if (channel < 2) {
+		if (value > SND_BBFPRO_GAIN_VAL_MIC_MAX)
+			return -EINVAL;
+	} else {
+		if (value > SND_BBFPRO_GAIN_VAL_LINE_MAX)
+			return -EINVAL;
+	}
+
+	if (value == old_value)
+		return 0;
+
+	err = snd_bbfpro_gain_update(mixer, channel, value);
+	if (err < 0)
+		return err;
+
+	kcontrol->private_value =
+		(channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT) | value;
+	return 1;
+}
+
+static int snd_bbfpro_gain_resume(struct usb_mixer_elem_list *list)
+{
+	int pv, channel, value;
+	struct snd_kcontrol *kctl = list->kctl;
+
+	pv = kctl->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		SND_BBFPRO_GAIN_CHANNEL_MASK;
+	value = pv & SND_BBFPRO_GAIN_VAL_MASK;
+
+	return snd_bbfpro_gain_update(list->mixer, channel, value);
+}
+
 static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
 				 u32 value)
 {
@@ -2790,6 +2907,15 @@ static const struct snd_kcontrol_new snd_bbfpro_ctl_control = {
 	.put = snd_bbfpro_ctl_put
 };
 
+static const struct snd_kcontrol_new snd_bbfpro_gain_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.index = 0,
+	.info = snd_bbfpro_gain_info,
+	.get = snd_bbfpro_gain_get,
+	.put = snd_bbfpro_gain_put
+};
+
 static const struct snd_kcontrol_new snd_bbfpro_vol_control = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
@@ -2813,6 +2939,18 @@ static int snd_bbfpro_ctl_add(struct usb_mixer_interface *mixer, u8 reg,
 		&knew, NULL);
 }
 
+static int snd_bbfpro_gain_add(struct usb_mixer_interface *mixer, u8 channel,
+			       char *name)
+{
+	struct snd_kcontrol_new knew = snd_bbfpro_gain_control;
+
+	knew.name = name;
+	knew.private_value = channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT;
+
+	return add_single_ctl_with_resume(mixer, 0, snd_bbfpro_gain_resume,
+		&knew, NULL);
+}
+
 static int snd_bbfpro_vol_add(struct usb_mixer_interface *mixer, u16 index,
 			      char *name)
 {
@@ -2860,6 +2998,29 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 		}
 	}
 
+	// Main out volume
+	for (i = 0 ; i < 12 ; ++i) {
+		snprintf(name, sizeof(name), "Main-Out %s", output[i]);
+		// Main outs are offset to 992
+		err = snd_bbfpro_vol_add(mixer,
+					 i + SND_BBFPRO_MIXER_MAIN_OUT_CH_OFFSET,
+					 name);
+		if (err < 0)
+			return err;
+	}
+
+	// Input gain
+	for (i = 0 ; i < 4 ; ++i) {
+		if (i < 2)
+			snprintf(name, sizeof(name), "Mic-%s Gain", input[i]);
+		else
+			snprintf(name, sizeof(name), "Line-%s Gain", input[i]);
+
+		err = snd_bbfpro_gain_add(mixer, i, name);
+		if (err < 0)
+			return err;
+	}
+
 	// Control Reg 1
 	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
 				 SND_BBFPRO_CTL_REG1_CLK_OPTICAL,
-- 
2.45.2

