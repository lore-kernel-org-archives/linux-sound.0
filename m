Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C623C062D
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143856; cv=none; b=W6ZoEli1ZF8mJUKGQWY9RjDhDpo6gwMxHmiWJ8uAnZZSUV97+EGhjUcc2NN7KoiXa0ZXaRq2+OvwZ76/IHhA58eTgaoGCtR4o0LKvGqhaNf8l54+CPGmt7clr+hWLKOT/q0wGHfaxkVFeKryjBMF8VzPpFOtFpoh+uN4PNcIe1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143856; c=relaxed/simple;
	bh=1Jui+JRA1sGL9ZZ7WJHilrtq7gZTpbtyalHwLZpCCyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgXVB6FNF8x+rm5RTOMwQRKoJZI0xf9SEzm8XMqeVs2TukChGBZMRZCNjPMTJxJiXY+MxZAPkXBw1UpokTDB5Nu/kM+NuqKUbinWzJtrD4Vjudt0ILAJjNGyyR9EQQpzdTbBsxcJAuhVnsYyECXZBlKbCzlYr3pLhyq7wTF+E8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6nAdOju; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6nAdOju"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so49605365e9.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143853; x=1792748653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccPdTUYyUCHC063JOLRXTy9qInrGn5gB0uq9/GM0cfA=;
        b=N6nAdOjuo8nbM57CLETvGW5+qLBTvwITjvxQ7BrT9yElTz2YQ8eusq1RUNm24B800Y
         cj8K4gOiPW0DwIKj+BkO6QGevtojtfsUz358pTq+bn4cR/W74Z45QM3RByjqEQ9YbGjt
         YO//i3FOn9ooyEWG12YEpEAMdrexqKk+FzsiMAbNj51B0zJck5mFE8tWPDPwJbL1NfO9
         9X/1dKVWVQt3gOeLFFARuDwOTeChkQaewhHdsmw+jMjWW4PVRgp64KHCRGuwQ43Tah4Y
         pMKgJXqT4QpEmdovfjctSay9+4kj5Z+hQ3HmD0rsA+XbW0v69psjwJvc+203u6UyZbmq
         5jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143853; x=1792748653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccPdTUYyUCHC063JOLRXTy9qInrGn5gB0uq9/GM0cfA=;
        b=Il1Uv6jev7bHq8XP8dUf4M9cAFS0uDci6viv98r+dgLgdDujiejS07/XT1ipoHu7ab
         C1HnvRIM1laQ/EE79vqq65NC/TidDB/iVa1xCD68h4QUg/d4wSbwtcobRVBa2XPsk5ef
         fjioOi8BfuvLPhvlNFTvwcG5HstxICn3lNVNUrnsR6tJzVvTX4T5zpaBInlMGGEovxWa
         sTNFdIAXGbTs398Bz+1F9w1ztqH/5qMSSnHxsSPri5oXt8MP7xnhpvgOUvlbLOl5O04V
         A622N8d5PsEqlrN/YobofrV2tpzMGZvAgrbld3vjo4SB762mJEGkghBzyHP/H8I6RMcR
         grhg==
X-Gm-Message-State: AFq9FYLA5ma2iVqaHZ+mKWzvK1PnY+OeiRExQdoW2iVOFHWAyXKBQiLi
	5lqK9mZz0vkBDjQdbEfB78OO1eoQp4eaK7lhf24v85TrsOIFjWel9T4/
X-Gm-Gg: AYBFou0UXC6/vH+Ku3FEz2blXsIpFO2I/c8Q6NpL8bSdmJqImS8ROst/TKgi6t8L1Ma
	wxvdbKQABENSh5/kd8IpTlzq85pF4yCckhGV6cPEui8jxdSqAhYzgyGN7wuvMKjGrRf8sMYodJP
	9i8169l3xYkJdcJo9gz2FOkMmFWYJHLrzn9j/wWjY0EIU/ac4UCwMORA6sWrGuMvFRShMh3XKNy
	cY2ycAMW+W92ZzBaVBHrPyD1SLZNPRIK5/SZ/c59B0H9tecxZ5KnYAIno4cgWPbR5pTNDTHHnDf
	NKpYVSZsBRiHRRrJ1o+N/lBZXkD8R8VENwznKIi9yUxWERVE/a0n4RkxJGdNPSigHRD0gLV0z8s
	nZey9UdqCVc3xfvSTcyCEJzOD9B7wY2aYkNcQ5LYZtsZQx6OFiN0mceEkC/kdHJksWWnyfFoQsx
	vyRhrg1xv8Xlp8BlsIT6XltZyiqPk7x/GJAS5dpzarJPaubiwQvvmzDd7+3+dzDqVV5ZeJ80D88
	pviANj8c+9XkRE1JcQi6QLdsN+kcw==
X-Received: by 2002:a05:600c:1908:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a18e4dd018mr426659075e9.34.1792143852976;
        Fri, 16 Oct 2026 02:44:12 -0700 (PDT)
Received: from arrakis.kwizart.net (82-65-38-83.subs.proxad.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm18858605e9.2.2026.10.16.02.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:44:12 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lianqin Hu <hulianqin@vivo.com>,
	Rong Zhang <i@rong.moe>,
	"Geoffrey D . Bennett" <g@b4.vu>,
	=?UTF-8?q?Sebastian=20Dalfu=C3=9F?= <sd@sedf.de>
Cc: linux-sound@vger.kernel.org,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk for Logitech HD Pro Webcam c920
Date: Fri, 16 Oct 2026 11:44:04 +0200
Message-ID: <20261016094404.13802-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quirky device sample:
  usb 5-2: new high-speed USB device number 2 using xhci_hcd
  usb 5-2: New USB device found, idVendor=046d, idProduct=08e5, bcdDevice= 0.0c
  usb 5-2: New USB device strings: Mfr=0, Product=2, SerialNumber=0
  usb 5-2: Product: HD Pro Webcam C920
   ...
  uvcvideo 5-2:1.0: Found UVC 1.00 device HD Pro Webcam C920 (046d:08e5)
  uvcvideo 5-2:1.1: Failed to set UVC probe control : -32 (exp. 26).
  usb 5-2: current rate 16000 is different from the runtime rate 32000
  usb 5-2: reset high-speed USB device number 2 using xhci_hcd
  usb 5-2: current rate 16000 is different from the runtime rate 32000
  usb 5-2: current rate 16000 is different from the runtime rate 32000
  usb 5-2: current rate 16000 is different from the runtime rate 32000

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a54fabce7920..c4550975fab3 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2271,6 +2271,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x046d, 0x08ca, /* Logitech Quickcam Fusion */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x08e5, /* Logitech HD Pro Webcam c920 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR |
 		   QUIRK_FLAG_MIC_RES_384),
-- 
2.56.0

