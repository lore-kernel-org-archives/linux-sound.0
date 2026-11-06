Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982747;
	b=cuyBFcG4xB7IVdf9VGzlH183i8avBvQvmaDWFxEdpACRtIzy+VmSo5XblaQXkLrwJaEn
	 PtT8v4tRrnmO7TYQLJDX5JXUr77fMa4L5W1DsbPD8qlLi7e/Lll4xsNLxCy2IAZIfwWC2
	 sCHKHDOTLYh4r9Oc19BtVdWtPsw4Nycz7T2p4un9v8Q1ZQFahNDQY+5UP6M54mcIU8hWk
	 g0UHE0+3vKJqllx5+Z04NCEI9eqvppd0Fb4QlmK5cRbOIC862cqp+jiHRqlUaoioW1CXg
	 xGV+vC4tc1D0kwp3ojbtmfdTkwUMk8smZLAgKrjYO+JO2yMM6I8G4oUZIB0WXvNwDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/P29yElmmZ/9qJYUm0WtsE5CCJ5pulJPsbr6qN5X8+4=;
	b=qsPAxe9fktfRwZMj7APuLszQbsj+bvCUy3TTr3y5dX4cDOVJNXhMmvL0U3b8H0WwVDoW
	 1ms6p0IU331ht4mjYEt8PRAWi7ftnnVAf2JNl+/xnbMqKA4TegIXP2djxl0fgEM75KTYt
	 tgnWCYtXMEFQahUhoxVg/n3uuRgN+tnXEr4sPJh7aDTna0vMRcYFf5BUifDtpgy0UytLH
	 kGpI6O0DNgNOHwZbuBWBXTvaMtll1cKscjtbkoTlLsusPaKjAhRaRKtNLYAnoZFGH5wvT
	 Qxq2VyfakzYzRHBUPcFw361KDV04uxGC4mDphb/qHOcYTX55DBmyWc+na74/L/Wffyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5JiNBUO;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE72606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5JiNBUO
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so1208877a34.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982745; x=1794587545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/P29yElmmZ/9qJYUm0WtsE5CCJ5pulJPsbr6qN5X8+4=;
        b=D5JiNBUO8dFuaiyc/Oq0ruH98x0rfmKeN4/KpRkjUOVC74+eAvHF+Va4FkGE8c9Sg8
         GCLxbgZink53Ys+B8GjviFvIEyeU5dM/nsncwGQZDruwcJ4mSL+Wn1Dz+pnKPwDnMShN
         nBmJ+DErQ+zA6e2a3JYeR2OcHp3nyMWf+nDaMDzDE0h68jh4H1cNg+834D4URA7YRqcq
         vgB4yr9+yGtk973Yadqd/3zAYPH8Q1Wc4r4Qtp4KdSWRc+7EY9zChUCLfz7vcPxdrQKu
         PSI1v4foVKdv6XE68Y72a397OYR0EWuz2cBQSjqCiJqkauz5g0RuXv3s0NymRut5jk8K
         qAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982745; x=1794587545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/P29yElmmZ/9qJYUm0WtsE5CCJ5pulJPsbr6qN5X8+4=;
        b=yYnSjOPE6lWm+U8yuPEBPuVcL1t8mK5Q9FsOYOm+bQgStzs7VO9Q26jE9yYm/ipXPJ
         80Y74p+mpO2f+aWx+qiQrtwnlZ3UoJiNJhnXJv9m8Px3z87A3p/9ND3euGfIXVRTUw4S
         AewnbO5d0ugty7ZNM727F9fUAsMVWOtBZRmDrGYfXL860xqcgKKawXtRFMB5eiPXaQL8
         F7qW3mid6JYt40ishoHn2d5kXMVZTxppWoGSUFoKXeKezNsmH60EsVjQ/bWPOtarmvgJ
         Ko9aHJmflKf3bVrQq27rFQLnnogVUM5EgSsUgSve86SVmPb3gFEgI3UCEOS4jvNlpdwP
         09zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDNtRmqMuU/j4UkLQYAVBfdq4rGdYP367Xk4/FFlpBEz6l6xIASs19xshFIFdiRZCGJPDpR8vKCY+5sQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SUZGRMMKN7BjJAkbX2Tynv+NaIuBQ4ZUMSGL0uC7c60YIby7y
	zi3ZZoOLAqZNnGKZMUdvwUC4LvplONPZYbsipksB9+/CGTVVOLU7mTz8
X-Gm-Gg: AYBFou1d1VbE6m7O2UqqlOVlxf6R/yZFjPuy32RZSVItuoZw63zkdYAiGUOsEmXg4hn
	x6gRSSySxBEEC4WMv0a+0WyRfgIrI69TYxbmOOGSXrixMqbDIe/MMVjpW79Np0SJAnwoCzKTwy6
	asL6qIM2cGO7tS4dg20YXdGHqIp51Pt6Itnj5KDcIbQ/5XKD9rnJMWUfT8/EURmSDwuXnb4Ml9W
	WOhllSQG4yTuYMZibbQr90i+LbkU9hCOzlW9dr3yrCzVpX7RfP7JHrP3L4c6jwHdqVm/+5FSmcA
	KiXZN4UtyNhT4EtEpLCcg3JmIP8pZs/P1PpmaFH1HbvYR/5zjDVS4DZ+4HRfiKd3G2jtEMYOaJN
	f3vRO6GiJ7wVnpCYbcYni+0sdFV5CBlqJ+i8faPBEQ0TuF2BZkhbyKesDOs57gLbArqCV9kw5Ds
	+oUU1tZOXv+oef+R3N3Z80boPCjvTugPlQx3O2sbHX5XqfXMdK7posi5RugqxwHWzmEK9MSnGpd
	hVdymnmzj/y8bIzh6WacfYfusPdf3rB7Qcv3E0R3Fz+4Gnttxg3fsHkO0CrnH1MlTnAxSC8mk/w
	koWOiPUJItKPTxA8ZOWXfCMWvXBI70CcUSrhB9orGDRKtA==
X-Received: by 2002:a05:6830:2643:b0:845:156f:5899 with SMTP id 46e09a7af769-85f1d138ef8mr3142017a34.29.1793982745380;
        Fri, 06 Nov 2026 08:32:25 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:24 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 01/16] ALSA: rename mixer_evo to mixer_audient
Date: Fri,  6 Nov 2026 10:31:14 -0600
Message-ID: <20261106163129.1006907-2-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Rename mixer_evo files and functions to *_audient in preparation of a more
generic driver for audient devices.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 MAINTAINERS                                |   7 +-
 sound/usb/Makefile                         |   2 +-
 sound/usb/{mixer_evo.c => mixer_audient.c} | 249 +++++++++++----------
 sound/usb/mixer_audient.h                  |  12 +
 sound/usb/mixer_evo.h                      |  12 -
 sound/usb/mixer_quirks.c                   |   4 +-
 6 files changed, 148 insertions(+), 138 deletions(-)
 rename sound/usb/{mixer_evo.c => mixer_audient.c} (54%)
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fee9d090b280..a1139ae3404d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4354,12 +4354,13 @@ F:	drivers/net/ieee802154/at86rf230.h
 F:	drivers/net/ieee802154/atusb.c
 F:	drivers/net/ieee802154/atusb.h
 
-AUDIENT EVO MIXER DRIVER
+AUDIENT MIXER DRIVER
 M:	Christian Ruppert <arc@gmx.li>
+M:	Will Porter <mrwillporter@gmail.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	sound/usb/mixer_evo.c
-F:	sound/usb/mixer_evo.h
+F:	sound/usb/mixer_audient.c
+F:	sound/usb/mixer_audient.h
 
 AUDIT SUBSYSTEM
 M:	Paul Moore <paul@paul-moore.com>
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 2e842dcc73de..44f4e4c820fb 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -11,7 +11,7 @@ snd-usb-audio-y := 	card.o \
 			helper.o \
 			implicit.o \
 			mixer.o \
-			mixer_evo.o \
+			mixer_audient.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
 			mixer_scarlett2.o \
diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_audient.c
similarity index 54%
rename from sound/usb/mixer_evo.c
rename to sound/usb/mixer_audient.c
index c1e0332232f2..e2700b08cf80 100644
--- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_audient.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Audient EVO driver for ALSA
+ * Audient driver for ALSA
  * Copyright (C) 2026 Christian Ruppert <arc@gmx.li>
  *
- * Based on the work of Ivan Hazucha for audient-evo-py.
+ * EVO4 support is based on the work of Ivan Hazucha for audient-evo-py.
  * https://github.com/vanzaho/audient-evo-py/
  */
 
@@ -20,22 +20,22 @@
 #include "mixer.h"
 #include "mixer_quirks.h"
 #include "helper.h"
-#include "mixer_evo.h"
+#include "mixer_audient.h"
 
 
-enum snd_evo_type {
-	SND_EVO_TYPE_MONITOR = 0,
-	SND_EVO_TYPE_PHANTOM,
-	SND_EVO_TYPE_MUTE,
-	SND_EVO_TYPE_MUTE_OUT,
-	SND_EVO_TYPE_MIXER,
-	SND_EVO_TYPE_NCTYPES
+enum snd_audient_type {
+	SND_AUDIENT_TYPE_MONITOR = 0,
+	SND_AUDIENT_TYPE_PHANTOM,
+	SND_AUDIENT_TYPE_MUTE,
+	SND_AUDIENT_TYPE_MUTE_OUT,
+	SND_AUDIENT_TYPE_MIXER,
+	SND_AUDIENT_TYPE_NCTYPES
 };
 
 /* Mixer matrix: -128dB (mute) to +6dB */
-static const DECLARE_TLV_DB_MINMAX_MUTE(snd_evo_tlv_mixer, -12800, 600);
+static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
-static const struct snd_evo_ctrl_type {
+static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	bool invert;
 	union {
@@ -47,8 +47,8 @@ static const struct snd_evo_ctrl_type {
 	const unsigned int *tlv;
 	u16 wValue;
 	u16 wIndex;
-} snd_evo_ctypes[SND_EVO_TYPE_NCTYPES] = {
-	[SND_EVO_TYPE_MONITOR] = {
+} snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] = {
+	[SND_AUDIENT_TYPE_MONITOR] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer = 0,
 		.max.integer = 127,
@@ -56,7 +56,7 @@ static const struct snd_evo_ctrl_type {
 		.wIndex = 0x3800,
 		/* no TLV here because we can't describe the cross-fader */
 	},
-	[SND_EVO_TYPE_PHANTOM] = {
+	[SND_AUDIENT_TYPE_PHANTOM] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = false,
 		.min.integer = 0,
@@ -64,7 +64,7 @@ static const struct snd_evo_ctrl_type {
 		.wValue = 0x0000,
 		.wIndex = 0x3A00,
 	},
-	[SND_EVO_TYPE_MUTE] = {
+	[SND_AUDIENT_TYPE_MUTE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
 		.min.integer = 0,
@@ -72,7 +72,7 @@ static const struct snd_evo_ctrl_type {
 		.wValue = 0x0200,
 		.wIndex = 0x3A00,
 	},
-	[SND_EVO_TYPE_MUTE_OUT] = {
+	[SND_AUDIENT_TYPE_MUTE_OUT] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
 		.min.integer = 0,
@@ -80,135 +80,135 @@ static const struct snd_evo_ctrl_type {
 		.wValue = 0x0100,
 		.wIndex = 0x3B00,
 	},
-	[SND_EVO_TYPE_MIXER] = {
+	[SND_AUDIENT_TYPE_MIXER] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer = -128 * 256,
 		.max.integer = 6 * 256,
 		.wValue = 0x0100,
 		.wIndex = 0x3C00,
-		.tlv = snd_evo_tlv_mixer,
+		.tlv = snd_audient_tlv_mixer,
 	},
 };
 
-#define SND_EVO_FLAGS_DIRECTION (1L<<0)
-#define SND_EVO_FLAGS_CAPTURE (1L<<0)
-#define SND_EVO_FLAGS_PLAYBACK (0L<<0)
+#define SND_AUDIENT_FLAGS_DIRECTION (1L<<0)
+#define SND_AUDIENT_FLAGS_CAPTURE (1L<<0)
+#define SND_AUDIENT_FLAGS_PLAYBACK (0L<<0)
 
-struct snd_evo_ctrl {
+struct snd_audient_ctrl {
 	char *basename;
-	enum snd_evo_type type;
+	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
 	unsigned int val_offs;
 	unsigned long flags;
 };
 
-static const struct snd_evo_ctrl evo4_controls[] = {
+static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 	{
 		.basename = "Master",
-		.type = SND_EVO_TYPE_MUTE_OUT,
+		.type = SND_AUDIENT_TYPE_MUTE_OUT,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_EVO_FLAGS_PLAYBACK,
+		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
 		.basename = "Mic",
-		.type = SND_EVO_TYPE_MUTE,
+		.type = SND_AUDIENT_TYPE_MUTE,
 		.channels = 4,
 		.hwchannels = 2,
 		.val_offs = 0,
-		.flags = SND_EVO_FLAGS_PLAYBACK,
+		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
 		.basename = "Monitor",
-		.type = SND_EVO_TYPE_MONITOR,
+		.type = SND_AUDIENT_TYPE_MONITOR,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_EVO_FLAGS_PLAYBACK,
+		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
 		.basename = "Mic 1",
-		.type = SND_EVO_TYPE_MIXER,
+		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 0,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Mic 2",
-		.type = SND_EVO_TYPE_MIXER,
+		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 2,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Master Left",
-		.type = SND_EVO_TYPE_MIXER,
+		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 4,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Master Right",
-		.type = SND_EVO_TYPE_MIXER,
+		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 6,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Loopback Left",
-		.type = SND_EVO_TYPE_MIXER,
+		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 8,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Loopback Right",
-		.type = SND_EVO_TYPE_MIXER,
+		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 10,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Mic 1 Phantom",
-		.type = SND_EVO_TYPE_PHANTOM,
+		.type = SND_AUDIENT_TYPE_PHANTOM,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename = "Mic 2 Phantom",
-		.type = SND_EVO_TYPE_PHANTOM,
+		.type = SND_AUDIENT_TYPE_PHANTOM,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 1,
-		.flags = SND_EVO_FLAGS_CAPTURE,
+		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{ 0 }, /* sentinel */
 };
 
-static const struct evo_devinfo {
+static const struct audient_devinfo {
 	u32 usb_id;
-	const struct snd_evo_ctrl *controls;
-} evo_devinfo[] = {
+	const struct snd_audient_ctrl *controls;
+} audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
-		.controls = evo4_controls,
+		.controls = snd_audient_evo4_controls,
 	},
 	{ 0 } /* sentinel */
 };
 
 
-static inline unsigned long snd_evo_kctl_priv(enum snd_evo_type type,
-					      u8 valoffs, u8 hwchannels)
+static inline unsigned long snd_audient_kctl_priv(enum snd_audient_type type,
+						  u8 valoffs, u8 hwchannels)
 {
 	unsigned long type_l = type & 0xFF;
 	unsigned long valoffs_l = valoffs & 0xFF;
@@ -218,22 +218,24 @@ static inline unsigned long snd_evo_kctl_priv(enum snd_evo_type type,
 }
 
 static __always_inline
-const struct snd_evo_ctrl_type *snd_evo_kctl_type(struct snd_kcontrol *kctl)
+const struct snd_audient_ctrl_type *snd_audient_kctl_type(struct snd_kcontrol
+							  *kctl)
 {
-	return &snd_evo_ctypes[kctl->private_value & 0xFF];
+	return &snd_audient_ctypes[kctl->private_value & 0xFF];
 }
 
-static __always_inline u16 snd_evo_kctl_valoffs(struct snd_kcontrol *kctl)
+static __always_inline u16 snd_audient_kctl_valoffs(struct snd_kcontrol *kctl)
 {
 	return (kctl->private_value >> 8) & 0xFF;
 }
 
-static __always_inline u16 snd_evo_kctl_hwchannels(struct snd_kcontrol *kctl)
+static __always_inline
+u16 snd_audient_kctl_hwchannels(struct snd_kcontrol *kctl)
 {
 	return (kctl->private_value >> 16) & 0xFF;
 }
 
-static inline u16 snd_evo_kctl_channels(struct snd_kcontrol *kctl)
+static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 {
 	struct usb_mixer_elem_info *info = kctl->private_data;
 
@@ -241,43 +243,45 @@ static inline u16 snd_evo_kctl_channels(struct snd_kcontrol *kctl)
 }
 
 
-#define EVO_REQ_CUR (0x01)
-#define EVO_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE)
-#define EVO_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS | USB_RECIP_INTERFACE)
+#define AUDIENT_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS \
+					 | USB_RECIP_INTERFACE)
+#define AUDIENT_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS \
+					 | USB_RECIP_INTERFACE)
 
-static inline int snd_evo_get_cur(struct usb_mixer_interface *mixer,
-				  u16 value, u16 index,
-				  void *buf, size_t len)
+static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
+				      u16 value, u16 index,
+				      void *buf, size_t len)
 {
 	struct usb_device *const dev = mixer->chip->dev;
 
 	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       EVO_REQ_CUR, EVO_REQTYPE_GET,
+			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
 			       value, index, buf, len);
 }
 
-static inline int snd_evo_set_cur(struct usb_mixer_interface *mixer,
-				  u16 value, u16 index,
-				  void *buf, size_t len)
+static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
+				      u16 value, u16 index,
+				      void *buf, size_t len)
 {
 	struct usb_device *const dev = mixer->chip->dev;
 
 	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			       EVO_REQ_CUR, EVO_REQTYPE_SET,
+			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
 			       value, index, buf, len);
 }
 
 
-static int snd_ctl_evo_boolean_get(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
+				       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *const list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer = list->mixer;
 
-	const unsigned int nchan = snd_evo_kctl_channels(kctl);
-	const unsigned int hwchan = snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype = snd_evo_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int nchan = snd_audient_kctl_channels(kctl);
+	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
+	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index = ctype->wIndex;
 
 	int i;
@@ -290,8 +294,8 @@ static int snd_ctl_evo_boolean_get(struct snd_kcontrol *kctl,
 		u32 buf;
 		int ret;
 
-		ret = snd_evo_get_cur(mixer, value + i, index,
-				      &buf, sizeof(buf));
+		ret = snd_audient_get_cur(mixer, value + i, index,
+					  &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
 
@@ -309,15 +313,16 @@ static int snd_ctl_evo_boolean_get(struct snd_kcontrol *kctl,
 	return 0;
 }
 
-static int snd_ctl_evo_boolean_set(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
+				       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
 
-	const unsigned int hwchan = snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype = snd_evo_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
+	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index = ctype->wIndex;
 
 	int changed = 0;
@@ -335,7 +340,7 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol *kctl,
 		if (ctype->invert)
 			buf ^= cpu_to_le32(0x1);
 
-		ret = snd_evo_get_cur(mixer, value + i, index,
+		ret = snd_audient_get_cur(mixer, value + i, index,
 				      &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
@@ -343,8 +348,8 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol *kctl,
 		if (rbuf != buf) {
 			changed = 1;
 
-			ret = snd_evo_set_cur(mixer, value + i, index,
-					      &buf, sizeof(buf));
+			ret = snd_audient_set_cur(mixer, value + i, index,
+						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
 		}
@@ -353,16 +358,17 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static int snd_ctl_evo_integer_get(struct snd_kcontrol *kctl,
+static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *const list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer = list->mixer;
 
-	const unsigned int nchan = snd_evo_kctl_channels(kctl);
-	const unsigned int hwchan = snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype = snd_evo_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int nchan = snd_audient_kctl_channels(kctl);
+	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
+	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index = ctype->wIndex;
 
 	int i;
@@ -376,8 +382,8 @@ static int snd_ctl_evo_integer_get(struct snd_kcontrol *kctl,
 		s16 val;
 		int ret;
 
-		ret = snd_evo_get_cur(mixer, value + i, index,
-				      &buf, sizeof(buf));
+		ret = snd_audient_get_cur(mixer, value + i, index,
+					  &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
 
@@ -391,15 +397,16 @@ static int snd_ctl_evo_integer_get(struct snd_kcontrol *kctl,
 	return 0;
 }
 
-static int snd_ctl_evo_integer_set(struct snd_kcontrol *kctl,
+static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
 
-	const unsigned int hwchan = snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype = snd_evo_kctl_type(kctl);
-	const u16 value = ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
+	const u16 value = ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index = ctype->wIndex;
 
 	int changed = 0;
@@ -414,16 +421,16 @@ static int snd_ctl_evo_integer_set(struct snd_kcontrol *kctl,
 		s16 buf = cpu_to_le16(ctl_val->value.integer.value[i]);
 		int ret;
 
-		ret = snd_evo_get_cur(mixer, value + i, index,
-				      &rbuf, sizeof(rbuf));
+		ret = snd_audient_get_cur(mixer, value + i, index,
+					  &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
 
 		if (rbuf != buf) {
 			changed = 1;
 
-			ret = snd_evo_set_cur(mixer, value + i, index,
-					      &buf, sizeof(buf));
+			ret = snd_audient_set_cur(mixer, value + i, index,
+						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
 		}
@@ -432,23 +439,25 @@ static int snd_ctl_evo_integer_set(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static int snd_ctl_evo_info(struct snd_kcontrol *kctl,
+static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 			    struct snd_ctl_elem_info *uinfo)
 {
-	const struct snd_evo_ctrl_type *const ctype = snd_evo_kctl_type(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						= snd_audient_kctl_type(kctl);
 
 	uinfo->type = ctype->type;
-	uinfo->count = snd_evo_kctl_channels(kctl);
+	uinfo->count = snd_audient_kctl_channels(kctl);
 	uinfo->value.integer.min = ctype->min.integer;
 	uinfo->value.integer.max = ctype->max.integer;
 	return 0;
 }
 
 
-static int snd_evo_add_ctrl(struct usb_mixer_interface *mixer,
-			    const struct snd_evo_ctrl *ctrl)
+static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
+			    const struct snd_audient_ctrl *ctrl)
 {
-	const struct snd_evo_ctrl_type *ctype = &snd_evo_ctypes[ctrl->type];
+	const struct snd_audient_ctrl_type *ctype
+					= &snd_audient_ctypes[ctrl->type];
 	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new knew = { 0 };
 	struct snd_kcontrol *kctl;
@@ -456,9 +465,9 @@ static int snd_evo_add_ctrl(struct usb_mixer_interface *mixer,
 
 	knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	knew.name = name;
-	knew.info = snd_ctl_evo_info;
-	knew.private_value = snd_evo_kctl_priv(ctrl->type, ctrl->val_offs,
-					       ctrl->hwchannels);
+	knew.info = snd_ctl_audient_info;
+	knew.private_value = snd_audient_kctl_priv(ctrl->type, ctrl->val_offs,
+						   ctrl->hwchannels);
 	knew.tlv.p = ctype->tlv;
 	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE
 			| SNDRV_CTL_ELEM_ACCESS_VOLATILE
@@ -466,20 +475,20 @@ static int snd_evo_add_ctrl(struct usb_mixer_interface *mixer,
 
 	switch (ctype->type) {
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
-		knew.get = snd_ctl_evo_integer_get;
-		knew.put = snd_ctl_evo_integer_set;
+		knew.get = snd_ctl_audient_integer_get;
+		knew.put = snd_ctl_audient_integer_set;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
-		knew.get = snd_ctl_evo_boolean_get;
-		knew.put = snd_ctl_evo_boolean_set;
+		knew.get = snd_ctl_audient_boolean_get;
+		knew.put = snd_ctl_audient_boolean_set;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
-		 ((ctrl->flags & SND_EVO_FLAGS_DIRECTION)
-			== SND_EVO_FLAGS_CAPTURE) ? "Capture" : "Playback",
+		 ((ctrl->flags & SND_AUDIENT_FLAGS_DIRECTION)
+			== SND_AUDIENT_FLAGS_CAPTURE) ? "Capture" : "Playback",
 		 (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN)
 			? "Switch" : "Volume");
 
@@ -503,12 +512,12 @@ static int snd_evo_add_ctrl(struct usb_mixer_interface *mixer,
 
 
 /* called from mixer_quirks.c */
-int snd_evo_controls_create(struct usb_mixer_interface *mixer)
+int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 {
-	const struct evo_devinfo *info;
-	const struct snd_evo_ctrl *ctrl;
+	const struct audient_devinfo *info;
+	const struct snd_audient_ctrl *ctrl;
 
-	for (info = evo_devinfo; info->controls; info++)
+	for (info = audient_devinfo; info->controls; info++)
 		if (info->usb_id == mixer->chip->usb_id)
 			break;
 
@@ -516,7 +525,7 @@ int snd_evo_controls_create(struct usb_mixer_interface *mixer)
 		return -ENODEV;
 
 	for (ctrl = info->controls; ctrl->basename; ctrl++) {
-		const int ret = snd_evo_add_ctrl(mixer, ctrl);
+		const int ret = snd_audient_add_ctrl(mixer, ctrl);
 
 		if (ret < 0)
 			return ret;
diff --git a/sound/usb/mixer_audient.h b/sound/usb/mixer_audient.h
new file mode 100644
index 000000000000..db4f31e02b5e
--- /dev/null
+++ b/sound/usb/mixer_audient.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __USB_MIXER_AUDIENT_H
+#define __USB_MIXER_AUDIENT_H
+
+#include "mixer.h"
+
+#define USB_AUDIENT_VID (0x2708)
+#define USB_EVO4_PID (0x0006)
+
+int snd_audient_controls_create(struct usb_mixer_interface *mixer);
+
+#endif /* __USB_MIXER_AUDIENT_H */
diff --git a/sound/usb/mixer_evo.h b/sound/usb/mixer_evo.h
deleted file mode 100644
index 7fe7e197185c..000000000000
--- a/sound/usb/mixer_evo.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __USB_MIXER_EVO_H
-#define __USB_MIXER_EVO_H
-
-#include "mixer.h"
-
-#define USB_AUDIENT_VID (0x2708)
-#define USB_EVO4_PID (0x0006)
-
-int snd_evo_controls_create(struct usb_mixer_interface *mixer);
-
-#endif /* __USB_MIXER_EVO_H */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 01210cc3fae7..af53c5c20e65 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -38,7 +38,7 @@
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
-#include "mixer_evo.h"
+#include "mixer_audient.h"
 #include "helper.h"
 #include "fcp.h"
 
@@ -4541,7 +4541,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		break;
 
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
-		err = snd_evo_controls_create(mixer);
+		err = snd_audient_controls_create(mixer);
 		break;
 
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
-- 
2.47.3

