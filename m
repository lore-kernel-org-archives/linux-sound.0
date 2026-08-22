Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124681E7C02
	for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787398936; cv=none; b=ibFaWwNjqmKqUXGdkAox8depv7Z8ij5vOxKRCTn4cK82ROh4mThNtoifr2N9UrZe8XUrXefdenlhXrlH09I7KjeVyjN6uNvN4FQ0uT3yKmuKJ51GMT9FCYXNb0TtTKfG4rM+W6ovDpTs/V1sH6VPo2jU4MXL52UAcIrYheuiG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787398936; c=relaxed/simple;
	bh=+OHtB28JviaPOZFcX+0qBiPj8olfaCQHcVY9gnVABtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fe0wwrQocLquJ011/FKz+zA9l5wxvRHCgh/3vy9bSCpqKXanMef//dksG9gEOKgK3WS6Khp2towrElrOs5EwB/DQX+pzlMn7IDohAr90VoIBRxSVP7iBSOAf6v+eJjnSLnKZoOI8XtOIBGwt8s1NY2/ktl/B8GaYivjCwkuwfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUhRrAhQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUhRrAhQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1021874f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787398933; x=1788003733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7QXI9cutNlpu3FezK2DBCYDbLzgpfG1PNBXuJL+LB0=;
        b=eUhRrAhQXzhfY89KhLcZBDCZULEJY0Sgva9JCje6O0YZeLAaHR1HLuwRX6kmIFujQw
         uRyz73Xtl5oU1RWTdMzqpZGHxF0ZhGELAmThBqfxCgtio59Y/7bc+XXzQzKD7zmQT/MV
         EAttGE0Q20/3qleIw7f9WLVY+f/KeS+CRNu5i6q6pdC08wPSAV8mbv5E6lCWLvhccojI
         8OnE5MlLRqMsrbjXL93WMyry9xF1UOQ5O2xne5CJaMeBScIYLnH4Oywrxh/8OGpqKT80
         bUJFc2Aw45SGRqwJbzm/T8F5HlA2B4i6oKr7C+/2V56tKjWDXQUKcHGgwsFn3j7YRFRJ
         OvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787398933; x=1788003733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7QXI9cutNlpu3FezK2DBCYDbLzgpfG1PNBXuJL+LB0=;
        b=cr1ano4QSaDe9nMiF3ItB9rRe5ly6XkrlWzAyJvnSpALmzmCf5cmaY0nQBVKql96lo
         Q2V5vaQ/Zud8F0JKE321kZToXNLXWXbfHe4AF0sdRIBiNWqwT+8zQKNyKaIhFypLDJSf
         xWG9jhC5CAe2zfzMHdMQe2iPgeJZ//bUKgZOx8XvYrBFegHlS4XNHZS9w4exOXRY5Ta1
         Z1lNW9qOUWNtv3BvrkNcJyU3dppOlCjL7cERGLOnyI0YofVUTngbzCJbOTdWxVwNr1vm
         VaoEh2STcKihXACjGxkBabhvAPO5qqGe2HwEgh4SbklbUT+dhFYwqshv7KHwlhwKjjN/
         0y+g==
X-Gm-Message-State: AFuF++l1J8g14cQODhYRsxRYGKGq6rwtq1IEHSHjUMwR3dCPXlBkU12B
	msHKIHNjapylX7E5vuKrk2x9s8r1VENmvpvOzmlCFHWQ4vuMlDoBrBjxyuFOTYs4xCI=
X-Gm-Gg: AR+sD10k25BFtrtClQw90km1KEuAB9yw0kU6G8g3baPX4Hz0kPKW6NwZyGMDsYZuygn
	y7vbtOzPy6DfS8+eZ5JPPLBN5TbdscbQnPFARVFNSD/8cEmyVLofxhtexw6mcfPTv/Aopc7ywbp
	+1LL0GfjojRh+pzQgO97ZZL4t6KJhR23ELXKwsrmiA8YVjJKlfFVLDnwZOxQctDZE57teOaPSPv
	/FEzBMohzlp3Tcy1/gFehc9eU1EqQ9jd0Dv7EmPlfBlEvs7lRTv19vmBNzzNQCPNIn3ImTT60jY
	T0XBzq5yxWmQ61lZQ7I0/mLpwAshbvmQNgq6ucmaKftzLXHQZ13HwsWYJIO8NqJ5R3OlkfFPeF4
	N3h9LbG7u5OheZ7ZupRwZ8RH5+iWP2tuY+Hl7GWz8+ncjCS5SKsGyuZxKDR9CptqDFB7Hw3xauT
	TdUCKUTsibhQbXh+dwOCgrjDKF0NyPHBwEykj20YmZbgh73D0Z9riAAeIQR/FPoDOgCa+Sr1qlq
	Pnpg2cypH+xIvkVI+3MRIwisacNDZv/SQtP/9k+LzVUw+ScdluLK56soUfQKwG28IwerRWG8Qnp
	aGy/pEbFWSkhU4DXAiayNSjD05IySmsofY4RaZPsigIW7Xqy
X-Received: by 2002:a5d:584b:0:b0:47f:cb30:8591 with SMTP id ffacd0b85a97d-482c0b67a0cmr17241292f8f.6.1787398933107;
        Sat, 22 Aug 2026 04:42:13 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0bef5sm1901896f8f.31.2026.08.22.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 04:42:12 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Edward Blair <edward.blair@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk flags for SMSL USB DAC
Date: Sat, 22 Aug 2026 12:41:10 +0100
Message-ID: <20260822114110.1069541-1-edward.blair@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMSL USB DAC with USB ID 152a:85dd produces an audible pop
when snd-usb-audio performs its redundant probe-time interface setup.
It also pops when returning from runtime suspend.

Skip the probe-time interface setup and disable runtime autosuspend for
this device. Both flags have been verified through the quirk_flags module
parameter.

Keep QUIRK_FLAG_DSD_RAW in the device entry because the exact match takes
precedence over the generic 0x152a vendor entry from which the device
currently inherits that flag.

Signed-off-by: Edward Blair <edward.blair@gmail.com>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index eb1750def..eca86b62c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2393,6 +2393,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IFB_SILENCE_ON_EMPTY),
 	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x152a, 0x85dd, /* SMSL USB DAC */
+		   QUIRK_FLAG_DSD_RAW | QUIRK_FLAG_DISABLE_AUTOSUSPEND |
+		   QUIRK_FLAG_SKIP_IFACE_SETUP),
 	DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
 		   0), /* Doesn't have the vendor quirk which would otherwise apply */
 	DEVICE_FLG(0x1532, 0x055e, /* Razer Nommo V2 X */
-- 
2.55.0

