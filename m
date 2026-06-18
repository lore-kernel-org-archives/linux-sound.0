Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3C32B10E
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762606; cv=none; b=mSgx5gHzupg1yflAkAc0er18n2/TU8gcipX3woxWl0CfFGqKNpvjgOYjYH8dVeRqqWLK1qYR77RXdzv4w4omfZVDXCpyRRIBIu4nisuGkP/q5mRHL4yS9RlzGJjCf2YAhXczOCHJknKvbVF7xM3WD9WSJR4b6Ja9N+EideBbatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762606; c=relaxed/simple;
	bh=cBdLHM1BoO8hc3bqJ1mVvAxfZvSv+pnc3jbEINYXKqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XgvSlpunmPqY8crB89GL1q8P0dduqKFzmwIgD71L3FrPO+SmcXldpxVOUANyjkC5zhVwo2vwyuiyOrufOynFwH93R18a/2/WFq0kNQKOfbluO7G98JD3tq6Ep/wxu+Sxbe30zDo6U4v5b7eGOIoS3BunWFYrIt+km8hRDWTi2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwlFo3R6; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwlFo3R6"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so215535a12.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781762605; x=1782367405; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIAq6vLYljaW9e51l/yhFdhIzysXTHlHfp/hTav5Rg8=;
        b=XwlFo3R6+CWmLBhhlbAuay2owxaA06H+1GbwRnEURnrqUGjE9qjT5D9hQQNwYzbJg9
         istzdaLNmfFmt/1AgqNt/L9VCysGfX6zD1n/4uZKm0jtfKqAfQ/QHLInv3R+tUfsc7Lq
         iSCnM3U6F000W1UwjeiEBxy4bztwpMjTIOGtpfRtGMqW6JFy0kZivOEe2CkM5tny4AQV
         qLZr7R9BREvpbxLuO2efEA7YziyNkzs29lgTfl1wco85qTvYkvhP6lWuoZWSE9MbdtnD
         il9fHkZRwpyK7OPcceKfEDLUiqVRuMz6UZfsyY0NQbkp5bH22+jMLc3tn1m0wTOUhHQo
         +jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781762605; x=1782367405;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIAq6vLYljaW9e51l/yhFdhIzysXTHlHfp/hTav5Rg8=;
        b=jaKowSZudKqhQoH6OUWdn96OC7ukVqvoZKE1RmHHAEd+9WYtKViCG9becVvsNWjnmK
         ilZm8/13zJvyA5n1NuUq4A+ntqCfxiWH5wC8QR0UDoscWX8u6k4iMDj1nnNyvbANYlKp
         qwXx8+j4PQTpME3bpVjzd9dAuQx2aq0jGUO34NEWFbHG2ewc/4GAQo6dMBYWR8E5BmlL
         YkgaywSMv4Hh8o2S7mn6p/9SmldpIn8z9XodXdRDpH1I1s8KXuFhlsBxpRi2js1eu9X+
         4WFN4gUlywC1a/1wMUhjtSXw5jhVLj2aSFFE7V36RHkaNOZtkxTiPf1V/N1rJfy3I1AZ
         GmDA==
X-Gm-Message-State: AOJu0YwCXW1eORpS6ynuCIHYUmw9iA2X66JrC8VBfY3APfu1GMT1SxkF
	B+rWwGe79WPrGcB1BkZ3Oh6jMq1qFZN9BHuvSY9mMPD9TD0RMCfMpBCbpfd09A==
X-Gm-Gg: AfdE7clbqPHFDdEhvtPQqzbd5oPjzQOpWwRPteMJb1OGMtXCutJyOrotAF0jVh/VTbr
	nGLwuLDHsy3lXWCDdVR1l5QBN1QAuyDhJD4+Fj0EUvx0TY6OAuEegaqmYFLOOBHCO4UXPdyYvfY
	rLK66nk12olJqwk9aPK3NvNjBXXw7/WQVYLy4Nysvf5eoHWXVmy2H92TUUylROcGzLz+X5TNvd8
	17qglh9T4xyLrEDuq1fdY/W/eeZImcSHkNnAh5cDV4tBG/FXtSW+vVhGyi/l5tTjHJt0uJDpyqG
	NnjYs9EGhEB/avvqzXlAYsBQ16t+eW3qptHv4CgtHXKBzevOx37kcR7rS7+eOMwZamSrQRhKCD9
	gIgXGAcAntTrZc7Hm1b7nkLFzJ/Pa7FeqrreTDpgJ7IcWIAl89xzQsx734bERdJ2diiIlBkTddf
	DDR+gzl4v58cXBvhgkSiaEvOw5EQrcc6/kBkXXdg==
X-Received: by 2002:a17:902:ce07:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c6f347e06fmr9968285ad.35.1781762605032;
        Wed, 17 Jun 2026 23:03:25 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm42757485ad.68.2026.06.17.23.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:03:24 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Daniel Mack <zonque@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: caiaq: bound the length in the EP1 input parsers
Date: Thu, 18 Jun 2026 14:03:15 +0800
Message-ID: <178176259547.3343534.6659489917322808916@maoyixie.com>
In-Reply-To: <178176259547.3343534.6658931377288378506@maoyixie.com>
References: <178176259547.3343534.6658931377288378506@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

snd_caiaq_input_read_erp() and snd_caiaq_input_read_io() can be reached
from snd_usb_caiaq_input_dispatch(). They read fixed byte offsets from
the reply buffer without checking the reported length. On a short reply
they decode stale bytes left from a previous, longer report and feed them
to the input layer.

This is not an out-of-bounds access. Every offset is a compile-time
driver constant. The largest is buf[21] in the Maschine ERP case. The
EP1 transfer buffer ep1_in_buf is EP1_BUFSIZE (64) bytes, and the USB
core caps actual_length at 64, so a short reply only reads in-bounds
stale data. Acting on data the device did not send is still wrong, so
bail out per usb_id case when the reply is shorter than the bytes that
case consumes.

  read_erp: AK1 needs 2 bytes, Kore needs 16, Maschine needs 22.
  read_io:  the Kore case needs 5 bytes (buf[4]) and the Traktor Kontrol
            X1 case needs 7 (buf[5]/buf[6]). The preceding key bit loop
            is already bounded by "i < len * 8" and is left untouched.

snd_caiaq_input_read_analog() and snd_usb_caiaq_maschine_dispatch() are
not changed. Their callers already floor the reply length.

Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 sound/usb/caiaq/input.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 2db4d1332df1..eabbf41fdfb2 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -237,12 +237,16 @@ static void snd_caiaq_input_read_erp(struct snd_usb_caiaqdev *cdev,
 
 	switch (cdev->chip.usb_id) {
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_AK1):
+		if (len < 2)
+			return;
 		i = decode_erp(buf[0], buf[1]);
 		input_report_abs(input_dev, ABS_X, i);
 		input_sync(input_dev);
 		break;
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER):
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER2):
+		if (len < 16)
+			return;
 		i = decode_erp(buf[7], buf[5]);
 		input_report_abs(input_dev, ABS_HAT0X, i);
 		i = decode_erp(buf[12], buf[14]);
@@ -263,6 +267,8 @@ static void snd_caiaq_input_read_erp(struct snd_usb_caiaqdev *cdev,
 		break;
 
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_MASCHINECONTROLLER):
+		if (len < 22)
+			return;
 		/* 4 under the left screen */
 		input_report_abs(input_dev, ABS_HAT0X, decode_erp(buf[21], buf[20]));
 		input_report_abs(input_dev, ABS_HAT0Y, decode_erp(buf[15], buf[14]));
@@ -308,9 +314,13 @@ static void snd_caiaq_input_read_io(struct snd_usb_caiaqdev *cdev,
 	switch (cdev->chip.usb_id) {
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER):
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER2):
+		if (len < 5)
+			return;
 		input_report_abs(cdev->input_dev, ABS_MISC, 255 - buf[4]);
 		break;
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_TRAKTORKONTROLX1):
+		if (len < 7)
+			return;
 		/* rotary encoders */
 		input_report_abs(cdev->input_dev, ABS_X, buf[5] & 0xf);
 		input_report_abs(cdev->input_dev, ABS_Y, buf[5] >> 4);
-- 
2.34.1

