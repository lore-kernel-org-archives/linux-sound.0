Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017188;
	b=WwvO2hbcqB/8HnBlE/IRr+h7zvOodeTPQaC5FnP3UxbjSlkOU+225Y9/Sr1Xv1FrVlSv
	 el++J56JbPxK7CrAvIEhOjKH4EIzkTSOUSTey6GcycBJafbYyNo/sRNBvJSqWVNaB6V8V
	 ugQ2uzVMxdW2ptYw0ucbmBKtKUDWvJr0NmqUVyX9CVil6vlMicBLmnHunh8nm85sdz3VB
	 sV0QS/F3NIQXvzarIKdziUR97Cmpp6rsTvDMDG93sJkHUWuUWiHJAhVugZgogqMFyH7d9
	 D72Nm9BSJ2mMrf3xOE79HscXhORyoTYNWjp/Jkvc4hJMBEMqbUr3pJtGsy3VkZIRp6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oxbvFXXIUCN+7V9FluKJpw1JRAq4PH3ZAoWLU3oqVe8=;
	b=DAlwrLlI6kaQLcFz0TtYmg5aPfrenpBGIliqWQqmX2T5opvHs6qk1QAroikL1+JNSm4A
	 e/+TtKCVoc9CQarr8h7LYuakHCX4jbMe6VIQTF+BfYYdxTT1hLEHr6Lp5lxoOGzhmR71I
	 OjINkGCT5xkO69PIZNhzbzziyp7Qrtu680ZegAOien3UwEZCKhzG2FKZ551PMFfMff336
	 HiFi65xF1ejE5/hGPkpcH1Ww1mfWriUKFTF5Fy3Kbfm9LtQBaBwkWqDF6LlIN1R0f5F4E
	 dIdtrbqkLYFDm3J3uqzcWcOuR3Oy/0dde40chEhhYWGYU26mIukCiCW7K8O+Phm1e3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVMKTjwl;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B6606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 02:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVMKTjwl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99be54f9c14so175062241.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017187; x=1794621987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxbvFXXIUCN+7V9FluKJpw1JRAq4PH3ZAoWLU3oqVe8=;
        b=lVMKTjwl2XGiwO6FCqVgSDppgDaaUS79qhFvD5ZS9pwNjP80KaSesMZo/q97tEo+rn
         BrYjaYMXP3QXXB+qPl901Dy3o3nUFTh35qqjfLrzwPCq5AfYBQpL04Wt3wmuM48qykWF
         mcWtcF9NOJdcLDI3Hupe7OryOHwnni9c0rfpgMq72fKK+XEtmOhdC9sNIu4c710qqOip
         zNNxegeqhugJ3/4YrNYdMbzOyuHM0k0tPqkpUOEl8lKv/8VXjDuB3dsHTcUwq8oInLh3
         oZsnY8azZHzUMEdkwsgQaW+xqJfTpRIzezpq94YqTpmt8ExRL9Ck69nt0RYEBLEWGF9/
         dzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017187; x=1794621987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxbvFXXIUCN+7V9FluKJpw1JRAq4PH3ZAoWLU3oqVe8=;
        b=Kp4ZFWUClneqiWQlvjWSo+/4AZaqtq+K36eOlTmXvD8ItBcgIpLPkHjP+Q4rgzI4qB
         VzE8SOGhIoc2ZLfIHRwK9qO9ubFFH8EUbpiqYETC7fYGNdtvu9Q4uh9IlWjdpkxWtceH
         uQOS3Ok7GnJXol8MomiDZPYFDEXGattR+Fk0TSjJxU+j7iAwjU8xkVBlWZlIsY3GtSnX
         aeZUDCBMcilfi5TydDLi6Dj1w7szKtjqCztKuRsIv9d1VzyiiN+FOXPBvs+fzrA9WWuR
         74QiQ+tfRoagbEkHHZ0WxcrkKdE6jwlzgs11mx1miD5ka3aAvDwQ0zS7Zfq+9Di/KSOs
         +paQ==
X-Gm-Message-State: APuU4Z8zPIwMtKfgwTZAC4QoFhPFwftiYlpJ+Lmmxp7J9Q8eWrr9N4q/
	FsWU7YmLBHp57dDVLup7kpFnqYkbb9aK5juQaWpQcy8mVPQbYRxF/LOANyOdKIAITdw=
X-Gm-Gg: AYBFou0bRIYXFymfuYE9ADGk6kOUMp0mgl7YPE1cA6+OB9JDsYdqmmjZy6EwdW+XIG3
	QIfLAIN7377Y2Txa7txOljY8VZqbuMuqqwfV8eVwZE8CC0boZLx6VIMcWhwidE3n6zQtVLOoW1D
	XqlZYaG2MBSzAIA0AniqwWIQ+DxQV7v89Vd184MUapO0uN71HCFI4wuvb/2+xVsvDUBq6zKTW5y
	/gMadqv0JiFW3neH3QTmNj60f6cwFsyrdZK6Gg9EgWJE+5HmWa7+5ml51ejquoefVDO/5pAkMJv
	Sx6s743xZbKigXXXXtZ5W7sX0KmPJ8DfpUapshLg7UGWSU/20WrxelPW8gG35DLjnPKlXDBP0B/
	8XtPWnOajwJZAkm8I5rSjJBKYU8LHXKuStuiMd7pjihDoVagSamdv04DTuGht9/XgUiPbw9neQI
	99FhBPDhbh+tA3levu75bxp0L9UQUPFW+RONxhsJFUubJhpYAQP1PLAuUxLZ2VQhymu2/siev/m
	5P3rSn+nVriaNJ3owfaifp3cnzOWUYlnANNf0bGFnR4kq6PG170rPgCuboI42PUpyudXuHxdIJ8
	lgUKNQBtfpkAIIq+BaBoOy2RsvBPGhuc5h5/
X-Received: by 2002:a05:6102:644e:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d2bd9b03fcmr196037137.43.1794017187219;
        Fri, 06 Nov 2026 18:06:27 -0800 (PST)
Received: from pop-os.local ([2804:868:d047:aeb1:207f:64c4:29d4:b099])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baed7d726sm3024811241.11.2026.11.06.18.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:06:26 -0800 (PST)
From: Cristiano Souza <cristianocps@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	Cristiano Souza <cristianocps@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: Skip broken playback feature unit on XiiSound chips
Date: Fri,  6 Nov 2026 23:06:22 -0300
Message-ID: <20261107020622.119529-1-cristianocps@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Weltrend XiiSound-based devices (040b:0897, e.g. Redragon H878
wireless headset) expose a UAC1 playback feature unit whose volume
and mute controls are unusable in practice: the reported per-channel
dB range is only 0..+0.39dB, yet setting any volume below the
maximum mutes one or even both channels, and the mapping between
logical and physical channels is unreliable.  Any attempt by
userspace to drive the hardware volume therefore results in muted
or one-sided audio.

Ignore the playback feature unit via a usbmix_name_map so that
userspace falls back to software volume, and pin the unit's master
and per-channel volumes to the reported maximum with mutes cleared
when the mixer is created, so the signal path always stays fully
open.  The capture path (microphone feature unit) is not affected
and keeps working.

Tested with a Redragon H878 wireless headset on PipeWire/PulseAudio:
stereo output works on both channels at any volume, software volume
applies smoothly, and mute/unmute works.

Cc: stable@vger.kernel.org
Signed-off-by: Cristiano Souza <cristianocps@gmail.com>
---
Changes in v2:
- Skip the broken playback feature unit via a usbmix_name_map in
  mixer_maps.c instead of open-coding the skip in the FU parser, as
  suggested by Takashi Iwai.
- The pin-to-maximum/unmute initialization in mixer_quirks.c is
  unchanged.
 sound/usb/mixer_maps.c   | 19 ++++++++++++++
 sound/usb/mixer_quirks.c | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 98b4146..9218ca6 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -374,6 +374,20 @@ static const struct usbmix_name_map dell_alc4020_map[] = {
 	{ 0 }
 };
 
+/*
+ * Weltrend XiiSound chips (040b:0897, e.g. Redragon H878):
+ * the playback feature unit is broken; its volume controls act like
+ * mute switches below the maximum value and the channel mapping is
+ * unreliable, so any hardware volume change mutes one or both
+ * channels.  Skip the unit entirely and let userspace fall back to
+ * software volume; the unit is pinned to maximum/unmuted by the
+ * mixer quirk in mixer_quirks.c.
+ */
+static const struct usbmix_name_map xiisound_map[] = {
+	{ 5, NULL },	/* playback feature unit */
+	{ 0 }
+};
+
 /*
  * Corsair Virtuoso calls everything "Headset" without this, leading to
  * applications moving the sidetone control instead of the main one.
@@ -790,6 +804,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x1395, 0x0025),
 		.map = sennheiser_pc8_map,
 	},
+	{
+		/* Weltrend XiiSound (Redragon H878) */
+		.id = USB_ID(0x040b, 0x0897),
+		.map = xiisound_map,
+	},
 	{
 		/* Microsoft USB Link headset */
 		.id = USB_ID(0x045e, 0x083c),
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5839719..ee12bc7 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4603,6 +4603,59 @@ static int snd_audiofuse_controls_create(struct usb_mixer_interface *mixer)
 	return err;
 }
 
+/*
+ * Weltrend XiiSound chips (040b:0897, e.g. Redragon H878):
+ * the playback feature unit (id 5) is broken; its volume controls act like
+ * mute switches below the maximum value and the channel mapping is
+ * unreliable, so the unit is hidden from userspace entirely (see the
+ * quirk in mixer_maps.c) and userspace falls back to software volume.
+ * Pin the unit's master and channel volumes to the reported maximum
+ * and unmute them, so the audio path stays fully open.
+ */
+static int snd_xiisound_init_fu_pins(struct usb_mixer_interface *mixer)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	unsigned char buf[2];
+	int ifnum, ch, err;
+
+	if (mixer->protocol != UAC_VERSION_1)
+		return 0;
+
+	ifnum = snd_usb_ctrl_intf(chip->ctrl_intf);
+
+	/* unit 5 is the playback feature unit on these chips */
+	for (ch = 0; ch <= 2; ch++) {
+		err = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+				      UAC_GET_MAX,
+				      USB_DIR_IN | USB_TYPE_CLASS |
+				      USB_RECIP_INTERFACE,
+				      (UAC_FU_VOLUME << 8) | ch,
+				      (5 << 8) | ifnum, buf, 2);
+		if (err < 0)
+			return 0; /* no such unit/channels, nothing to pin */
+
+		err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
+				      UAC_SET_CUR,
+				      USB_DIR_OUT | USB_TYPE_CLASS |
+				      USB_RECIP_INTERFACE,
+				      (UAC_FU_VOLUME << 8) | ch,
+				      (5 << 8) | ifnum, buf, 2);
+		if (err < 0)
+			return err;
+
+		buf[0] = 0; /* unmute */
+		err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
+				      UAC_SET_CUR,
+				      USB_DIR_OUT | USB_TYPE_CLASS |
+				      USB_RECIP_INTERFACE,
+				      (UAC_FU_MUTE << 8) | ch,
+				      (5 << 8) | ifnum, buf, 1);
+		if (err < 0)
+			return err;
+	}
+	return 0;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4616,6 +4669,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x0644, 0x8047):
 		err = snd_us16x08_controls_create(mixer);
 		break;
+	case USB_ID(0x040b, 0x0897):
+		err = snd_xiisound_init_fu_pins(mixer);
+		break;
 	case USB_ID(0x041e, 0x3020):
 	case USB_ID(0x041e, 0x3040):
 	case USB_ID(0x041e, 0x3042):
-- 
2.43.0

