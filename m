Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215715B102
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 06:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740638607; cv=none; b=Aqf0T1nNrprUQli9EmDvqueid4SJfkIuyl1s0/KDW0bD49QQV8D0E+hg26sHhiS3wPpnpgP2FvB1xKWVNJzcZCsEJrWS3OfavlS0NomNUzv1LQ0COimtiHwTfMk6oxlizpGDaw8PW0FkijfLn2Bpdg1CWUAqTalNKiiFpSt/FhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740638607; c=relaxed/simple;
	bh=0QyeHQr6w+29/yhAZgz2qElP/FgpTqixkTwNBijXOrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TP7hKbdWoMotMNgZNt6gqw20lp/kMaipwuXf14KO0k40MP4K08sy6MJGhPJeQjbYsGT0TPavnJaO3RYPPme0otwNNHnKSGt389J9n695/yM50fTWZVpULugXwo8NcedSNmxx2iP0dMgBSYmVkbjmyKuk8KA2m2vunjhjsQxvWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Qq0BQ7gV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Qq0BQ7gV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4398738217aso5087575e9.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 22:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1740638603; x=1741243403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I5TuRqP/RXhnMvUTyLB3ZpY6gHaFOuESH9hsY6raDJI=;
        b=Qq0BQ7gVLYEwc2XaAk3xIOHxvzOt0VguJhgJRh7I1ofLyyDrl2zSx+JTE2MSiBdSRh
         Z2W4Z8+4c6oYtswCjX3jzHZF/PHjtpXvfz6zUVRIYGQNwl5L0EFO7DWud5abH6R0gA9q
         Q8IIUa7HX7pRpRM094iXPD9a5EVeT7qVH4WqlB+J1lPdbm0/Iqn+Ny+LmiFCNLw3zXn6
         Enn/0rmeYGx4k4cckX6uDm42AnJzsUnI+pJ63PoWmOeaxFHAgmhIN/VYSexKiw9N9OWl
         nAmRiszZZCTGb/ohuQZ2vSwPHsvMMVnG3X+KoAm4gM0SU1ULscMh/q3K0i66aJagnZk9
         nLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740638603; x=1741243403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5TuRqP/RXhnMvUTyLB3ZpY6gHaFOuESH9hsY6raDJI=;
        b=bEeEXdpfmuun8rglZWMJWX0lptIVgCCaMeDSRqpKrbdPfKpDdMdu1Tg77ezL5aWsLE
         G3iYuwXkh/5YVTZm8T2GYTMjvEzD9DtAB8yjH4edlBMM5Ccu03JZ7GCDeL73UW+9F7sV
         k1VXqQox5IM/A1f4oZSfbElM1q472gu3hVXNfqAz9OvJKWBlvRcBgcWZPvKVey/0EXOd
         KIeSG2IXi162s93Bnhl+EhqeAPKRo7P5vwVf4s48QBFh3f2s6n3IGCke6LLwCu9F6Iw/
         oyykhj7zc4zgmNVZvDOC9rB16iiCvqTboq1bZ1j60Psq71fn56B6cGD+DBg0yGDZDEXs
         ixtA==
X-Gm-Message-State: AOJu0Yzr4Lbpg5693S0sdmazcmvG2ekdn4lLWQSJfDMyvlUzZy4MeUZj
	QRvz7g/nLOLpKkYTckWfWAa5lvACAciUoTZrSer+mAl5ZhxwVg7sUtE1OW5r
X-Gm-Gg: ASbGncvA+JS2Wf8qhZnSSFQt9vnCpq6b3yYc4BT1pQxoBT6M9WnDeO6oVwwsYaEA6Gy
	wlc/EsJNQEHQF7M6vlscES+g2fh1AesbSRgs1N5H4QGmLy3uKz6OX7sSvikojsijMhb/X4zAzA0
	OVC6E2QUV7Mk9AGlxInIvLuPd0NSnmczszMF9zKijnF2BrcbKyGaJcU0o7hn8qn7BQ105E/v9ii
	df1kmsT8XWi4v7Js4jZ+BljgCHGTXjswxezCGb2HOqagQwowsSEh6OJFr/5Hj/Jir6q1bWcLiFa
	GEQpXvpjh62pC8gfL36cB/y/x4KkPMdPvipdsP2OFTXU
X-Google-Smtp-Source: AGHT+IGKwUKuU7RwMYqZj3Xwa0fMXIEQmsfecLONRPCYWuzOgj3nTm2TjVmUy1SuXvYIDM2Y1Qr1aA==
X-Received: by 2002:a05:600c:35c7:b0:439:88bb:d002 with SMTP id 5b1f17b1804b1-43ab9016966mr50588945e9.23.1740638603076;
        Wed, 26 Feb 2025 22:43:23 -0800 (PST)
Received: from STUDIO.. (p579d906e.dip0.t-ipconnect.de. [87.157.144.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba539445sm43868265e9.22.2025.02.26.22.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:43:22 -0800 (PST)
From: Amin Dandache <amin.dandache@googlemail.com>
X-Google-Original-From: Amin Dandache <git@amin85.de>
To: linux-sound@vger.kernel.org
Cc: Amin Dandache <git@amin85.de>
Subject: [PATCH] rename s1810c* to presonus_studio to get s1824c working
Date: Thu, 27 Feb 2025 07:43:08 +0100
Message-ID: <20250227064308.154758-1-git@amin85.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 sound/usb/Makefile                            |   2 +-
 sound/usb/format.c                            |  12 +-
 ...mixer_s1810c.c => mixer_presonus_studio.c} | 247 +++++++++---------
 sound/usb/mixer_presonus_studio.h             |   8 +
 sound/usb/mixer_quirks.c                      |  12 +-
 sound/usb/mixer_s1810c.h                      |   7 -
 sound/usb/quirks.c                            |   9 +-
 7 files changed, 161 insertions(+), 136 deletions(-)
 rename sound/usb/{mixer_s1810c.c => mixer_presonus_studio.c} (59%)
 create mode 100644 sound/usb/mixer_presonus_studio.h
 delete mode 100644 sound/usb/mixer_s1810c.h

diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 0532499dbc6d..ed3a7d49b553 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -14,7 +14,7 @@ snd-usb-audio-y := 	card.o \
 			mixer_scarlett.o \
 			mixer_scarlett2.o \
 			mixer_us16x08.o \
-			mixer_s1810c.o \
+			mixer_presonus_studio.o \
 			pcm.o \
 			power.o \
 			proc.o \
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 6049d957694c..2bebcb6f3ef5 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -280,8 +280,8 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
  * The list of supported rates per altsetting (set of available
  * I/O channels) is described in the owner's manual, section 2.2.
  */
-static bool s1810c_valid_sample_rate(struct audioformat *fp,
-				     unsigned int rate)
+static bool presonus_studio_valid_sample_rate(struct audioformat *fp,
+					      unsigned int rate)
 {
 	switch (fp->altsetting) {
 	case 1:
@@ -382,8 +382,12 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 
 			/* Filter out invalid rates on Presonus Studio 1810c */
 			if (chip->usb_id == USB_ID(0x194f, 0x010c) &&
-			    !s1810c_valid_sample_rate(fp, rate))
+			    !presonus_studio_valid_sample_rate(fp, rate))
 				goto skip_rate;
+                        /* Filter out invalid rates on Presonus Studio 1824c */
+                        if (chip->usb_id == USB_ID(0x194f, 0x010d) &&
+                            !presonus_studio_valid_sample_rate(fp, rate))
+                                goto skip_rate;
 
 			/* Filter out invalid rates on Focusrite devices */
 			if (USB_ID_VENDOR(chip->usb_id) == 0x1235 &&
@@ -398,7 +402,7 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 				break;
 			}
 
-skip_rate:
+			skip_rate:
 			/* avoid endless loop */
 			if (res == 0)
 				break;
diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_presonus_studio.c
similarity index 59%
rename from sound/usb/mixer_s1810c.c
rename to sound/usb/mixer_presonus_studio.c
index fac4bbc6b275..2a5d87bc0112 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_presonus_studio.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Presonus Studio 1810c driver for ALSA
+ * Presonus Studio [1810c, 1824c] driver for ALSA
  * Copyright (C) 2019 Nick Kossifidis <mickflemm@gmail.com>
+ * Copyright (C) 2025 Amin Dandache <amin.dandache@gmail.com>
+ *  * added 1824c support
  *
  * Based on reverse engineering of the communication protocol
  * between the windows driver / Univeral Control (UC) program
@@ -9,6 +11,8 @@
  *
  * For now this bypasses the mixer, with all channels split,
  * so that the software can mix with greater flexibility.
+ * 
+ * 1810c:
  * It also adds controls for the 4 buttons on the front of
  * the device.
  */
@@ -23,13 +27,13 @@
 #include "mixer.h"
 #include "mixer_quirks.h"
 #include "helper.h"
-#include "mixer_s1810c.h"
+#include "mixer_presonus_studio.h"
 
-#define SC1810C_CMD_REQ	160
-#define SC1810C_CMD_REQTYPE \
+#define PRESONUS_STUDIO_CMD_REQ	160
+#define PRESONUS_STUDIO_CMD_REQTYPE \
 	(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT)
-#define SC1810C_CMD_F1		0x50617269
-#define SC1810C_CMD_F2		0x14
+#define PRESONUS_STUDIO_CMD_F1		0x50617269
+#define PRESONUS_STUDIO_CMD_F2		0x14
 
 /*
  * DISCLAIMER: These are just guesses based on the
@@ -81,7 +85,7 @@
  * The two fixed fields have the same values for
  * mixer and output but a different set for device.
  */
-struct s1810c_ctl_packet {
+struct presonus_studio_ctl_packet {
 	u32 a;
 	u32 b;
 	u32 fixed1;
@@ -91,24 +95,24 @@ struct s1810c_ctl_packet {
 	u32 e;
 };
 
-#define SC1810C_CTL_LINE_SW	0
-#define SC1810C_CTL_MUTE_SW	1
-#define SC1810C_CTL_AB_SW	3
-#define SC1810C_CTL_48V_SW	4
+#define PRESONUS_STUDIO_CTL_LINE_SW	0
+#define PRESONUS_STUDIO_CTL_MUTE_SW	1
+#define PRESONUS_STUDIO_CTL_AB_SW	3
+#define PRESONUS_STUDIO_CTL_48V_SW	4
 
-#define SC1810C_SET_STATE_REQ	161
-#define SC1810C_SET_STATE_REQTYPE SC1810C_CMD_REQTYPE
-#define SC1810C_SET_STATE_F1	0x64656D73
-#define SC1810C_SET_STATE_F2	0xF4
+#define PRESONUS_STUDIO_SET_STATE_REQ	161
+#define PRESONUS_STUDIO_SET_STATE_REQTYPE PRESONUS_STUDIO_CMD_REQTYPE
+#define PRESONUS_STUDIO_SET_STATE_F1	0x64656D73
+#define PRESONUS_STUDIO_SET_STATE_F2	0xF4
 
-#define SC1810C_GET_STATE_REQ	162
-#define SC1810C_GET_STATE_REQTYPE \
+#define PRESONUS_STUDIO_GET_STATE_REQ	162
+#define PRESONUS_STUDIO_GET_STATE_REQTYPE \
 	(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN)
-#define SC1810C_GET_STATE_F1	SC1810C_SET_STATE_F1
-#define SC1810C_GET_STATE_F2	SC1810C_SET_STATE_F2
+#define PRESONUS_STUDIO_GET_STATE_F1	PRESONUS_STUDIO_SET_STATE_F1
+#define PRESONUS_STUDIO_GET_STATE_F2	PRESONUS_STUDIO_SET_STATE_F2
 
-#define SC1810C_STATE_F1_IDX	2
-#define SC1810C_STATE_F2_IDX	3
+#define PRESONUS_STUDIO_STATE_F1_IDX	2
+#define PRESONUS_STUDIO_STATE_F2_IDX	3
 
 /*
  * This packet includes mixer volumes and
@@ -116,30 +120,30 @@ struct s1810c_ctl_packet {
  * version of ctl_packet, with a and b
  * being zero and different f1/f2.
  */
-struct s1810c_state_packet {
+struct presonus_studio_state_packet {
 	u32 fields[63];
 };
 
-#define SC1810C_STATE_48V_SW	58
-#define SC1810C_STATE_LINE_SW	59
-#define SC1810C_STATE_MUTE_SW	60
-#define SC1810C_STATE_AB_SW	62
+#define PRESONUS_STUDIO_STATE_48V_SW	58
+#define PRESONUS_STUDIO_STATE_LINE_SW	59
+#define PRESONUS_STUDIO_STATE_MUTE_SW	60
+#define PRESONUS_STUDIO_STATE_AB_SW	62
 
-struct s1810_mixer_state {
+struct presonus_studio_mixer_state {
 	uint16_t seqnum;
 	struct mutex usb_mutex;
 	struct mutex data_mutex;
 };
 
 static int
-snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
+snd_presonus_studio_send_ctl_packet(struct usb_device *dev, u32 a,
 			   u32 b, u32 c, u32 d, u32 e)
 {
-	struct s1810c_ctl_packet pkt = { 0 };
+	struct presonus_studio_ctl_packet pkt = { 0 };
 	int ret = 0;
 
-	pkt.fixed1 = SC1810C_CMD_F1;
-	pkt.fixed2 = SC1810C_CMD_F2;
+	pkt.fixed1 = PRESONUS_STUDIO_CMD_F1;
+	pkt.fixed2 = PRESONUS_STUDIO_CMD_F2;
 
 	pkt.a = a;
 	pkt.b = b;
@@ -153,8 +157,8 @@ snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
 	pkt.e = (c == 4) ? 0 : e;
 
 	ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			      SC1810C_CMD_REQ,
-			      SC1810C_CMD_REQTYPE, 0, 0, &pkt, sizeof(pkt));
+			      PRESONUS_STUDIO_CMD_REQ,
+			      PRESONUS_STUDIO_CMD_REQTYPE, 0, 0, &pkt, sizeof(pkt));
 	if (ret < 0) {
 		dev_warn(&dev->dev, "could not send ctl packet\n");
 		return ret;
@@ -172,18 +176,18 @@ snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
  * then ask to receive a filled. Their seqnumbers must also match.
  */
 static int
-snd_sc1810c_get_status_field(struct usb_device *dev,
+snd_presonus_studioc_get_status_field(struct usb_device *dev,
 			     u32 *field, int field_idx, uint16_t *seqnum)
 {
-	struct s1810c_state_packet pkt_out = { { 0 } };
-	struct s1810c_state_packet pkt_in = { { 0 } };
+	struct presonus_studio_state_packet pkt_out = { { 0 } };
+	struct presonus_studio_state_packet pkt_in = { { 0 } };
 	int ret = 0;
 
-	pkt_out.fields[SC1810C_STATE_F1_IDX] = SC1810C_SET_STATE_F1;
-	pkt_out.fields[SC1810C_STATE_F2_IDX] = SC1810C_SET_STATE_F2;
+	pkt_out.fields[PRESONUS_STUDIO_STATE_F1_IDX] = PRESONUS_STUDIO_SET_STATE_F1;
+	pkt_out.fields[PRESONUS_STUDIO_STATE_F2_IDX] = PRESONUS_STUDIO_SET_STATE_F2;
 	ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			      SC1810C_SET_STATE_REQ,
-			      SC1810C_SET_STATE_REQTYPE,
+			      PRESONUS_STUDIO_SET_STATE_REQ,
+			      PRESONUS_STUDIO_SET_STATE_REQTYPE,
 			      (*seqnum), 0, &pkt_out, sizeof(pkt_out));
 	if (ret < 0) {
 		dev_warn(&dev->dev, "could not send state packet (%d)\n", ret);
@@ -191,8 +195,8 @@ snd_sc1810c_get_status_field(struct usb_device *dev,
 	}
 
 	ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			      SC1810C_GET_STATE_REQ,
-			      SC1810C_GET_STATE_REQTYPE,
+			      PRESONUS_STUDIO_GET_STATE_REQ,
+			      PRESONUS_STUDIO_GET_STATE_REQTYPE,
 			      (*seqnum), 0, &pkt_in, sizeof(pkt_in));
 	if (ret < 0) {
 		dev_warn(&dev->dev, "could not get state field %u (%d)\n",
@@ -211,7 +215,7 @@ snd_sc1810c_get_status_field(struct usb_device *dev,
  * on, I could probably clean this up based on my observations
  * but I prefer to keep the same behavior as the windows driver.
  */
-static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
+static int snd_presonus_studio_init_mixer_maps(struct snd_usb_audio *chip)
 {
 	u32 a, b, c, e, n, off;
 	struct usb_device *dev = chip->dev;
@@ -224,12 +228,12 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 		for (b = off; b < 18 + off; b++) {
 			/* This channel to all outputs ? */
 			for (c = 0; c <= 8; c++) {
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 0, e);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 1, e);
 			}
 			/* This channel to main output (again) */
-			snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
-			snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+			snd_presonus_studio_send_ctl_packet(dev, a, b, 0, 0, e);
+			snd_presonus_studio_send_ctl_packet(dev, a, b, 0, 1, e);
 		}
 		/*
 		 * I noticed on UC that DAW channels have different
@@ -242,11 +246,11 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 	a = 0x65;
 	e = 0x01000000;
 	for (b = 1; b < 3; b++) {
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+		snd_presonus_studio_send_ctl_packet(dev, a, b, 0, 0, e);
+		snd_presonus_studio_send_ctl_packet(dev, a, b, 0, 1, e);
 	}
-	snd_s1810c_send_ctl_packet(dev, a, 0, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 0, 0, 1, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 0, 0, 0, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 0, 0, 1, e);
 
 	/* Set initial volume levels for S/PDIF mappings ? */
 	a = 0x64;
@@ -255,8 +259,8 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 	for (n = 0; n < 2; n++) {
 		off = n * 18;
 		for (b = off; b < 18 + off; b++) {
-			snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-			snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+			snd_presonus_studio_send_ctl_packet(dev, a, b, c, 0, e);
+			snd_presonus_studio_send_ctl_packet(dev, a, b, c, 1, e);
 		}
 		e = 0xb53bf0;
 	}
@@ -264,15 +268,15 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 	/* Connect S/PDIF output ? */
 	a = 0x65;
 	e = 0x01000000;
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 3, 0, 0, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 3, 0, 1, e);
 
 	/* Connect all outputs (again) ? */
 	a = 0x65;
 	e = 0x01000000;
 	for (b = 0; b < 4; b++) {
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+		snd_presonus_studio_send_ctl_packet(dev, a, b, 0, 0, e);
+		snd_presonus_studio_send_ctl_packet(dev, a, b, 0, 1, e);
 	}
 
 	/* Basic routing to get sound out of the device */
@@ -285,16 +289,16 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 			    (c == 2 && b == 22) ||	/* DAW4/5 -> Line5/6 */
 			    (c == 3 && b == 24)) {	/* DAW5/6 -> S/PDIF */
 				/* Left */
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 0, e);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 1, 0);
 				b++;
 				/* Right */
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 0, 0);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 1, e);
 			} else {
 				/* Leave the rest disconnected */
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 0, 0);
+				snd_presonus_studio_send_ctl_packet(dev, a, b, c, 1, 0);
 			}
 		}
 	}
@@ -306,8 +310,8 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 	for (n = 0; n < 2; n++) {
 		off = n * 18;
 		for (b = off; b < 18 + off; b++) {
-			snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-			snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+			snd_presonus_studio_send_ctl_packet(dev, a, b, c, 0, e);
+			snd_presonus_studio_send_ctl_packet(dev, a, b, c, 1, e);
 		}
 		e = 0xb53bf0;
 	}
@@ -315,12 +319,12 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 	/* Connect S/PDIF outputs (again) ? */
 	a = 0x65;
 	e = 0x01000000;
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 3, 0, 0, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 3, 0, 1, e);
 
 	/* Again ? */
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 3, 0, 0, e);
+	snd_presonus_studio_send_ctl_packet(dev, a, 3, 0, 1, e);
 
 	return 0;
 }
@@ -331,17 +335,17 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
  * from the received fields array.
  */
 static int
-snd_s1810c_get_switch_state(struct usb_mixer_interface *mixer,
+snd_presonus_studio_get_switch_state(struct usb_mixer_interface *mixer,
 			    struct snd_kcontrol *kctl, u32 *state)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	struct s1810_mixer_state *private = mixer->private_data;
+	struct presonus_studio_mixer_state *private = mixer->private_data;
 	u32 field = 0;
 	u32 ctl_idx = (u32) (kctl->private_value & 0xFF);
 	int ret = 0;
 
 	mutex_lock(&private->usb_mutex);
-	ret = snd_sc1810c_get_status_field(chip->dev, &field,
+	ret = snd_presonus_studioc_get_status_field(chip->dev, &field,
 					   ctl_idx, &private->seqnum);
 	if (ret < 0)
 		goto unlock;
@@ -358,18 +362,18 @@ snd_s1810c_get_switch_state(struct usb_mixer_interface *mixer,
  * specified in (kctl->private_value >> 16).
  */
 static int
-snd_s1810c_set_switch_state(struct usb_mixer_interface *mixer,
+snd_presonus_studio_set_switch_state(struct usb_mixer_interface *mixer,
 			    struct snd_kcontrol *kctl)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	struct s1810_mixer_state *private = mixer->private_data;
+	struct presonus_studio_mixer_state *private = mixer->private_data;
 	u32 pval = (u32) kctl->private_value;
 	u32 ctl_id = (pval >> 8) & 0xFF;
 	u32 ctl_val = (pval >> 16) & 0x1;
 	int ret = 0;
 
 	mutex_lock(&private->usb_mutex);
-	ret = snd_s1810c_send_ctl_packet(chip->dev, 0, 0, 0, ctl_id, ctl_val);
+	ret = snd_presonus_studio_send_ctl_packet(chip->dev, 0, 0, 0, ctl_id, ctl_val);
 	mutex_unlock(&private->usb_mutex);
 	return ret;
 }
@@ -377,25 +381,25 @@ snd_s1810c_set_switch_state(struct usb_mixer_interface *mixer,
 /* Generic get/set/init functions for switch controls */
 
 static int
-snd_s1810c_switch_get(struct snd_kcontrol *kctl,
+snd_presonus_studio_switch_get(struct snd_kcontrol *kctl,
 		      struct snd_ctl_elem_value *ctl_elem)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
-	struct s1810_mixer_state *private = mixer->private_data;
+	struct presonus_studio_mixer_state *private = mixer->private_data;
 	u32 pval = (u32) kctl->private_value;
 	u32 ctl_idx = pval & 0xFF;
 	u32 state = 0;
 	int ret = 0;
 
 	mutex_lock(&private->data_mutex);
-	ret = snd_s1810c_get_switch_state(mixer, kctl, &state);
+	ret = snd_presonus_studio_get_switch_state(mixer, kctl, &state);
 	if (ret < 0)
 		goto unlock;
 
 	switch (ctl_idx) {
-	case SC1810C_STATE_LINE_SW:
-	case SC1810C_STATE_AB_SW:
+	case PRESONUS_STUDIO_STATE_LINE_SW:
+	case PRESONUS_STUDIO_STATE_AB_SW:
 		ctl_elem->value.enumerated.item[0] = (int)state;
 		break;
 	default:
@@ -408,12 +412,12 @@ snd_s1810c_switch_get(struct snd_kcontrol *kctl,
 }
 
 static int
-snd_s1810c_switch_set(struct snd_kcontrol *kctl,
+snd_presonus_studio_switch_set(struct snd_kcontrol *kctl,
 		      struct snd_ctl_elem_value *ctl_elem)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
-	struct s1810_mixer_state *private = mixer->private_data;
+	struct presonus_studio_mixer_state *private = mixer->private_data;
 	u32 pval = (u32) kctl->private_value;
 	u32 ctl_idx = pval & 0xFF;
 	u32 curval = 0;
@@ -421,13 +425,13 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 	int ret = 0;
 
 	mutex_lock(&private->data_mutex);
-	ret = snd_s1810c_get_switch_state(mixer, kctl, &curval);
+	ret = snd_presonus_studio_get_switch_state(mixer, kctl, &curval);
 	if (ret < 0)
 		goto unlock;
 
 	switch (ctl_idx) {
-	case SC1810C_STATE_LINE_SW:
-	case SC1810C_STATE_AB_SW:
+	case PRESONUS_STUDIO_STATE_LINE_SW:
+	case PRESONUS_STUDIO_STATE_AB_SW:
 		newval = (u32) ctl_elem->value.enumerated.item[0];
 		break;
 	default:
@@ -439,7 +443,7 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 
 	kctl->private_value &= ~(0x1 << 16);
 	kctl->private_value |= (unsigned int)(newval & 0x1) << 16;
-	ret = snd_s1810c_set_switch_state(mixer, kctl);
+	ret = snd_presonus_studio_set_switch_state(mixer, kctl);
 
  unlock:
 	mutex_unlock(&private->data_mutex);
@@ -447,7 +451,7 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 }
 
 static int
-snd_s1810c_switch_init(struct usb_mixer_interface *mixer,
+snd_presonus_studio_switch_init(struct usb_mixer_interface *mixer,
 		       const struct snd_kcontrol_new *new_kctl)
 {
 	struct snd_kcontrol *kctl;
@@ -473,7 +477,7 @@ snd_s1810c_switch_init(struct usb_mixer_interface *mixer,
 }
 
 static int
-snd_s1810c_line_sw_info(struct snd_kcontrol *kctl,
+snd_presonus_studio_line_sw_info(struct snd_kcontrol *kctl,
 			struct snd_ctl_elem_info *uinfo)
 {
 	static const char *const texts[2] = {
@@ -484,35 +488,35 @@ snd_s1810c_line_sw_info(struct snd_kcontrol *kctl,
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
 
-static const struct snd_kcontrol_new snd_s1810c_line_sw = {
+static const struct snd_kcontrol_new snd_presonus_studio_line_sw = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Line 1/2 Source Type",
-	.info = snd_s1810c_line_sw_info,
-	.get = snd_s1810c_switch_get,
-	.put = snd_s1810c_switch_set,
-	.private_value = (SC1810C_STATE_LINE_SW | SC1810C_CTL_LINE_SW << 8)
+	.info = snd_presonus_studio_line_sw_info,
+	.get = snd_presonus_studio_switch_get,
+	.put = snd_presonus_studio_switch_set,
+	.private_value = (PRESONUS_STUDIO_STATE_LINE_SW | PRESONUS_STUDIO_CTL_LINE_SW << 8)
 };
 
-static const struct snd_kcontrol_new snd_s1810c_mute_sw = {
+static const struct snd_kcontrol_new snd_presonus_studio_mute_sw = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Mute Main Out Switch",
 	.info = snd_ctl_boolean_mono_info,
-	.get = snd_s1810c_switch_get,
-	.put = snd_s1810c_switch_set,
-	.private_value = (SC1810C_STATE_MUTE_SW | SC1810C_CTL_MUTE_SW << 8)
+	.get = snd_presonus_studio_switch_get,
+	.put = snd_presonus_studio_switch_set,
+	.private_value = (PRESONUS_STUDIO_STATE_MUTE_SW | PRESONUS_STUDIO_CTL_MUTE_SW << 8)
 };
 
-static const struct snd_kcontrol_new snd_s1810c_48v_sw = {
+static const struct snd_kcontrol_new snd_presonus_studio_48v_sw = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "48V Phantom Power On Mic Inputs Switch",
 	.info = snd_ctl_boolean_mono_info,
-	.get = snd_s1810c_switch_get,
-	.put = snd_s1810c_switch_set,
-	.private_value = (SC1810C_STATE_48V_SW | SC1810C_CTL_48V_SW << 8)
+	.get = snd_presonus_studio_switch_get,
+	.put = snd_presonus_studio_switch_set,
+	.private_value = (PRESONUS_STUDIO_STATE_48V_SW | PRESONUS_STUDIO_CTL_48V_SW << 8)
 };
 
 static int
-snd_s1810c_ab_sw_info(struct snd_kcontrol *kctl,
+snd_presonus_studio_ab_sw_info(struct snd_kcontrol *kctl,
 		      struct snd_ctl_elem_info *uinfo)
 {
 	static const char *const texts[2] = {
@@ -523,26 +527,26 @@ snd_s1810c_ab_sw_info(struct snd_kcontrol *kctl,
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
 
-static const struct snd_kcontrol_new snd_s1810c_ab_sw = {
+static const struct snd_kcontrol_new snd_presonus_studio_ab_sw = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Headphone 1 Source Route",
-	.info = snd_s1810c_ab_sw_info,
-	.get = snd_s1810c_switch_get,
-	.put = snd_s1810c_switch_set,
-	.private_value = (SC1810C_STATE_AB_SW | SC1810C_CTL_AB_SW << 8)
+	.info = snd_presonus_studio_ab_sw_info,
+	.get = snd_presonus_studio_switch_get,
+	.put = snd_presonus_studio_switch_set,
+	.private_value = (PRESONUS_STUDIO_STATE_AB_SW | PRESONUS_STUDIO_CTL_AB_SW << 8)
 };
 
-static void snd_sc1810_mixer_state_free(struct usb_mixer_interface *mixer)
+static void snd_presonus_studio_mixer_state_free(struct usb_mixer_interface *mixer)
 {
-	struct s1810_mixer_state *private = mixer->private_data;
+	struct presonus_studio_mixer_state *private = mixer->private_data;
 	kfree(private);
 	mixer->private_data = NULL;
 }
 
 /* Entry point, called from mixer_quirks.c */
-int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
+int snd_presonus_studio_init_mixer(struct usb_mixer_interface *mixer, int device_idx)
 {
-	struct s1810_mixer_state *private = NULL;
+	struct presonus_studio_mixer_state *private = NULL;
 	struct snd_usb_audio *chip = mixer->chip;
 	struct usb_device *dev = chip->dev;
 	int ret = 0;
@@ -551,8 +555,13 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	if (!list_empty(&chip->mixer_list))
 		return 0;
 
+	/* TODO add model string from original
+	 *
+	 * dev_info(&dev->dev,
+	 *	 "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
+	*/
 	dev_info(&dev->dev,
-		 "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
+		 "Presonus Studio, device_setup: %u\n", chip->setup);
 	if (chip->setup == 1)
 		dev_info(&dev->dev, "(8out/18in @ 48kHz)\n");
 	else if (chip->setup == 2)
@@ -560,11 +569,11 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	else
 		dev_info(&dev->dev, "(8out/14in @ 96kHz)\n");
 
-	ret = snd_s1810c_init_mixer_maps(chip);
+	ret = snd_presonus_studio_init_mixer_maps(chip);
 	if (ret < 0)
 		return ret;
 
-	private = kzalloc(sizeof(struct s1810_mixer_state), GFP_KERNEL);
+	private = kzalloc(sizeof(struct presonus_studio_mixer_state), GFP_KERNEL);
 	if (!private)
 		return -ENOMEM;
 
@@ -572,23 +581,23 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	mutex_init(&private->data_mutex);
 
 	mixer->private_data = private;
-	mixer->private_free = snd_sc1810_mixer_state_free;
+	mixer->private_free = snd_presonus_studio_mixer_state_free;
 
 	private->seqnum = 1;
 
-	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_line_sw);
+	ret = snd_presonus_studio_switch_init(mixer, &snd_presonus_studio_line_sw);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_mute_sw);
+	ret = snd_presonus_studio_switch_init(mixer, &snd_presonus_studio_mute_sw);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_48v_sw);
+	ret = snd_presonus_studio_switch_init(mixer, &snd_presonus_studio_48v_sw);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_ab_sw);
+	ret = snd_presonus_studio_switch_init(mixer, &snd_presonus_studio_ab_sw);
 	if (ret < 0)
 		return ret;
 	return ret;
diff --git a/sound/usb/mixer_presonus_studio.h b/sound/usb/mixer_presonus_studio.h
new file mode 100644
index 000000000000..211d35eef1f0
--- /dev/null
+++ b/sound/usb/mixer_presonus_studio.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Presonus Studio [1810c, 1824c] driver for ALSA
+ * Copyright (C) 2019 Nick Kossifidis <mickflemm@gmail.com>
+ * Copyright (C) 2025 Amin Dandache <amin.dandache@gmail.com>
+ */
+
+int snd_presonus_studio_init_mixer(struct usb_mixer_interface *mixer, int device_idx);
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 23fcd680167d..d346dba1c98d 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -36,7 +36,7 @@
 #include "mixer_scarlett.h"
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
-#include "mixer_s1810c.h"
+#include "mixer_presonus_studio.h"
 #include "helper.h"
 
 struct std_mono_table {
@@ -3988,6 +3988,10 @@ static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
 	return 0;
 }
 
+// Presonus Studio
+#define SND_S1810C_IDX		0x0
+#define SND_S1824C_IDX		0x1
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4110,8 +4114,12 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		break;
 
 	case USB_ID(0x194f, 0x010c): /* Presonus Studio 1810c */
-		err = snd_sc1810_init_mixer(mixer);
+		err = snd_presonus_studio_init_mixer(mixer, SND_S1810C_IDX);
 		break;
+	case USB_ID(0x194f, 0x010d): /* Presonus Studio 1824c */
+ 		err = snd_presonus_studio_init_mixer(mixer, SND_S1824C_IDX);
+ 		break;
+
 	case USB_ID(0x2a39, 0x3fb0): /* RME Babyface Pro FS */
 		err = snd_bbfpro_controls_create(mixer);
 		break;
diff --git a/sound/usb/mixer_s1810c.h b/sound/usb/mixer_s1810c.h
deleted file mode 100644
index a79a3743cff3..000000000000
--- a/sound/usb/mixer_s1810c.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Presonus Studio 1810c driver for ALSA
- * Copyright (C) 2019 Nick Kossifidis <mickflemm@gmail.com>
- */
-
-int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 8ba0aff8be2e..c70ac7ed43f0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1551,8 +1551,8 @@ static int fasttrackpro_skip_setting_quirk(struct snd_usb_audio *chip,
 	return 0; /* keep this altsetting */
 }
 
-static int s1810c_skip_setting_quirk(struct snd_usb_audio *chip,
-					   int iface, int altno)
+static int presonus_studio_skip_setting_quirk(struct snd_usb_audio *chip,
+					      int iface, int altno)
 {
 	/*
 	 * Altno settings:
@@ -1598,7 +1598,10 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 		return fasttrackpro_skip_setting_quirk(chip, iface, altno);
 	/* presonus studio 1810c: skip altsets incompatible with device_setup */
 	if (chip->usb_id == USB_ID(0x194f, 0x010c))
-		return s1810c_skip_setting_quirk(chip, iface, altno);
+		return presonus_studio_skip_setting_quirk(chip, iface, altno);
+        /* presonus studio 1824c: skip altsets incompatible with device_setup */
+        if (chip->usb_id == USB_ID(0x194f, 0x010d))
+                return presonus_studio_skip_setting_quirk(chip, iface, altno);
 
 
 	return 0;
-- 
2.43.0

