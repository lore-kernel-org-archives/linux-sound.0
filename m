Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E686A1442E8
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723057897; cv=none; b=Xei9jRrSlr5enrrlQ01zUmoKUiRAV9HZ0BAZ+yayHub7BwBTJzREX719ybEeO2q/4qAvDTLnUlVfGtEKY5UaXWlpHjTOAF0tb9B95+2ecgsRT3cCyz2AtT8qmSxRKU0g5h+SkxAdsW9BvX9pAKj7CylGPG0gu9jrkKd/qwi1M8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723057897; c=relaxed/simple;
	bh=VoAlmkiadVaDADJkifI9qsn/McqfWgl3/vgxW53T5dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q94VCZzLW8apiyVMooIo2kP8utsWCT2mUpaPfs4sLbqS48w/h8gTxljmqSKxAtKL2519bV+xAspaRJsZdlTED8k9sCxnjTP6kBV19gqabHjTXMgOrY7bNSnrEDFn2F3O5npCSWesfoEjk96aF3hsUImZGpCCvdTNCDn6Ob7Lu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7uVIQUl; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7uVIQUl"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso2253431fa.0
        for <linux-sound@vger.kernel.org>; Wed, 07 Aug 2024 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723057894; x=1723662694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JElm4ZAr7bRF+SgA8pOcLDaF7nOfLIcx5yZg97Mky8A=;
        b=A7uVIQUljuK48Fh75Y+BIcTqeixDZqlJX9SKsHD1gd+ugS3pHZglLwmVZ0E4omCEEq
         58ta5GhsUjxwsKZVmJXszY0uU0p41BgdYyDJdbjvajviGudNGn1hFvBVtHbqBHvTQSKB
         vzFZYNKnFLuE9xfmfokEUJNVJXMW7E/LPIJtD1Z8Z26oIUB1gw6oFeW1WdYGMfX3wloN
         lmLa3RaXaxqOdBvqdDhkId6uwDSuBukphPH/lARILWlPfrszBchxVJGocynXBOeeiUMM
         J8y5SELsMzoD9wVB5Y+kE8k1b35iBpBhxO1KLE6eFj2jhdtTw7Y7UBfWksQlQ+8JFoSa
         CRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723057894; x=1723662694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JElm4ZAr7bRF+SgA8pOcLDaF7nOfLIcx5yZg97Mky8A=;
        b=dDr87M4i1uwurtYusYbU+vim38hgx39GGBzdjZifm06huVVkohUWqiN+WGWsUpCSI3
         Tlnag/lhXRM1t3xlas2SSbON5+peinoJYgGspFymX/6YflSNN5BU1F1KRWj4tEjYbAJr
         aWBLCEtuKiVRdYTCHgfh4LhL/0DZwN/qqFBb/MKfQ5um7ywj7icuC7BAH1iFp7nuzCBF
         tL6Kr/g8Q6jNBnxCzL2E0XkJKl/mD892lEJMZ3v+PUDq8ptqs0fFXF+2cysX3EUuPMj1
         vN3MSS21dV6Ysg+su2ZO5ATdWRucHxISkY8YDckUygpkx1ky3iy8u4FWNMx/SBxsyLc8
         xeXQ==
X-Gm-Message-State: AOJu0YwX5VEM6LKzh1lPLepmGI+8KBpdgtdpIX9Kt4QAln5UYijCYDYl
	cJC8pKbUTY5fcbQ81XXOmWGZqssfdiheJ7Tvu+rLJf6fSkHtMCrHC0OYoh5rJlM=
X-Google-Smtp-Source: AGHT+IF7d/sfDtHvUQHeTj/vL0hOyrFqDTD7udEyHDi/01LHeAMbj2Tal3TEnKfaSODnR0s1cmmyeg==
X-Received: by 2002:a2e:b60a:0:b0:2ee:52f4:266 with SMTP id 38308e7fff4ca-2f15aa88b39mr168133871fa.3.1723057893304;
        Wed, 07 Aug 2024 12:11:33 -0700 (PDT)
Received: from stefan-ms7d75.lan (84-217-106-36.customers.ownit.se. [84.217.106.36])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e1c7581sm18887751fa.68.2024.08.07.12.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:11:33 -0700 (PDT)
From: Stefan Stistrup <sstistrup@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Stefan Stistrup <sstistrup@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Add input gain and master output mixer elements for RME Babyface Pro
Date: Wed,  7 Aug 2024 21:11:21 +0200
Message-ID: <20240807191121.68614-1-sstistrup@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing input gain and master output mixer controls for RME Babyface Pro

This patch implements:

1. Input gain controls for 2 mic and 2 line inputs
2. Master output volume controls for all 12 output channels

These additions allow for more complete control of the Babyface Pro under Linux.

Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
---
Changes in v2:
 - Check invalid negative values in snd_bbfpro_gain_put
 - Coding style fixes, blank line in snd_bbfpro_gain_update and checkpatch.pl errors

 sound/usb/mixer_quirks.c | 164 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 163 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 065a4be0d771..4c050110004b 100644
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
@@ -2695,6 +2704,115 @@ static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
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
+				usb_sndctrlpipe(chip->dev, 0),
+				SND_BBFPRO_USBREQ_GAIN,
+				USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				gain, channel, NULL, 0);
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_bbfpro_gain_get(struct snd_kcontrol *kcontrol,
+                               struct snd_ctl_elem_value *ucontrol)
+{
+	int value = kcontrol->private_value & SND_BBFPRO_GAIN_VAL_MASK;
+	ucontrol->value.integer.value[0] = value;
+	return 0;
+}
+
+static int snd_bbfpro_gain_info(struct snd_kcontrol *kcontrol,
+                                struct snd_ctl_elem_info *uinfo)
+{
+	int pv, channel;
+
+	pv = kcontrol->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		  SND_BBFPRO_GAIN_CHANNEL_MASK;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = SND_BBFPRO_GAIN_VAL_MIN;
+
+	if (channel < 2) {
+		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_MIC_MAX;
+	} else {
+		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_LINE_MAX;
+	}
+
+	return 0;
+}
+
+static int snd_bbfpro_gain_put(struct snd_kcontrol *kcontrol,
+                               struct snd_ctl_elem_value *ucontrol)
+{
+	int pv, channel, old_value, value, err;
+
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	struct usb_mixer_interface *mixer = list->mixer;
+
+	pv = kcontrol->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		  SND_BBFPRO_GAIN_CHANNEL_MASK;
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
+		  (channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT) | value;
+	return 1;
+}
+
+static int snd_bbfpro_gain_resume(struct usb_mixer_elem_list *list)
+{
+	int pv, channel, value;
+
+	struct snd_kcontrol *kctl = list->kctl;
+
+	pv = kctl->private_value;
+	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
+		  SND_BBFPRO_GAIN_CHANNEL_MASK;
+	value = pv & SND_BBFPRO_GAIN_VAL_MASK;
+
+	return snd_bbfpro_gain_update(list->mixer, channel, value);
+}
+
 static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
 				 u32 value)
 {
@@ -2790,6 +2908,15 @@ static const struct snd_kcontrol_new snd_bbfpro_ctl_control = {
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
@@ -2813,6 +2940,18 @@ static int snd_bbfpro_ctl_add(struct usb_mixer_interface *mixer, u8 reg,
 		&knew, NULL);
 }

+static int snd_bbfpro_gain_add(struct usb_mixer_interface *mixer, u8 channel,
+                               char *name)
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
@@ -2860,6 +2999,29 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
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
+		if (i < 2) {
+			snprintf(name, sizeof(name), "Mic-%s Gain", input[i]);
+		} else {
+			snprintf(name, sizeof(name), "Line-%s Gain", input[i]);
+		}
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

