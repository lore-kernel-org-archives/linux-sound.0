Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB349191F91
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785650366; cv=none; b=fhX6SyIsrQxrn2GS+P0/tC8vLkT3NDL8MsowBbIoLomBWKIV8ivORM+Un27bP065n0BLbjEetROXbYkePijxfkUNAufBHLKF5JuJZ9+qXvJ6KX1NabLrAsIWB87uYfnTg31UxqwllcclXgLqHEarKbz8/QheK3ADSrO6gBrNxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785650366; c=relaxed/simple;
	bh=UvSHls9tVD/XUijs4aqcyVgEqql5/sNAvHcq5cInBfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjN32oE3l5BHnZAcDdmxTqrOpN6zdYT7bvp/t4L9YkBIVVJzofDSZLLV3ttaWcmyoGHNrUzAhjRiEhDqc5U3jG+dyWh6PzezTGv4l2yk+uMqcitT4AVyjT4q37kL4b8RdARYFEX6idlPvTQH8iA8SLCD8nQ+uDGD1uWtxBCUEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKshTFa5; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKshTFa5"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930f72317a6so126707185a.3
        for <linux-sound@vger.kernel.org>; Sat, 01 Aug 2026 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785650363; x=1786255163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/I6wD5CiYbAllA3CVjZgDIk16D/PIkqS7PpmIFeTiU=;
        b=MKshTFa5Llu6/5GlLUt2K3zeuCM/nJ/qmsHxz06acYT7Yh5BPSeguQJeQYx9C8OEHd
         MguNbUkcVs5/ngKjPT7FIwcHto6zBJsMfiFdrbOHDnjeJ54v2M44885voQzr8u+iKuCR
         CEWKO1W55ACOtUpt+v9ePlY/fIT8fcXEw2KbkTw2ISVOfXYXN8AHsMo9qWuLw2CVSLMQ
         XOpkDWhD0PBASXk/6xHkxzeihxHSHCXth/jav9d2X8NEr+G3E+1BQ3GDM4D0WWkcofU6
         UyJ4ZL05fVFFQOMN3frzg2IP60Kz0N2NoFVa0nAvdec2rttZVj6LAdh/D5gGY1+e7csf
         s4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785650363; x=1786255163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/I6wD5CiYbAllA3CVjZgDIk16D/PIkqS7PpmIFeTiU=;
        b=myYQSJMvgfyM6cONhmFHVlt5xWCiolGLMnIke8iUVTEENXjwR3A8Doy3GqiC+qkBGR
         lUiUAn67HqfdhS9MD/HoFpBvAOHXQ5FYQLtcdzEa2hzD7yXg+a8kU412cJ5/bbeGh+hh
         lsSLHjyBWPE9wr2v2jObpV0RmkPN1Q4uW3r8J35ot1h6FyXf0eCNgCOcoED0oLy7d+hy
         GDF35fi7qx3DQz6lWGyc97LtW0p3k99vHZCxw3cOilWFCk8kDTkbiK2w/Waf7oZeFbT9
         FcM9tIwEm1ysJyD/IZZQmbYKwXHPCq9gchY6qT7B3QxjoH0dcl+IpM6PUwLuux9EcCnp
         7u1w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5gPVfNhnHOkQfhzKeCihKCQys6WcZyqO8Aq7bocmo6tYPVi3Jd6VcZZpEIAhh3bubOCsHV5wlF/5ZBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3FyIT4oe/wyZV925yCRA+T9BZHwq6YxHXqX6mqUwQkf4ADLu
	3l6aHGoJKsF+nm0YUwuyUdcYPU/xICovEHX0K8kVTmlvPd5Fy6DOxzNs
X-Gm-Gg: AR+sD11qjYZ7nJROi/M5K77x2BdrK152u3HMkIdBo3eXrfguzU7iRrYD3HuWcJwFJNU
	XTIgzNUahTRuBPJ0P0/XW20/EkxewIa3Td6VFYHioHzqT9gYDxyuARebHRTahx+xY+6ThUattna
	1+PxFqUAswGUk/0Und9o8EbCuSuHBFIl0thcw/B1gKj9Y3LbTYIJeCYRMrTqpA2qU4NW0GQj0Pr
	VWxLSW6Vig0IQgzDTwMoyLNOPA9nqREotY2sF6bBqmNhkZ2e9jWWUC9Dv02UWsrj0bf2YUS21DV
	o3DMbRp48H0xzkT/WhhTj/6lxjMVFf+tpRo8CmIrxxSQqHa2VK5iXTCk78uEjZwI38EeFnFJDpd
	mP/c/B9uVDpCWKCM5q7mj2+mX+7uWPYkQjM8N1btsvesk5zTNLtImeFxpwCA/u0JgeM/32wXube
	jpoHuaHaEKF2pSBqd8HYVb24bXVdRKr+dp7fUFeFZTgCY5sI1cMwYheRPojyoblkfD3ZOaqAyxC
	khXPkQUasR8aGqsFHHxyhDgUf9E6iRFxoH5RPFWGoKF8WwhQ6vGWa054yZA2b8EOmc=
X-Received: by 2002:a05:620a:5dc4:b0:92e:fc42:2c19 with SMTP id af79cd13be357-934a0789dd3mr874000985a.11.1785650363407;
        Sat, 01 Aug 2026 22:59:23 -0700 (PDT)
Received: from aarons-lg-gram.hsd1.va.comcast.net ([2601:140:9600:4840:44d7:5cb1:5027:710b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc4bbcasm405182085a.13.2026.08.01.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 22:59:22 -0700 (PDT)
From: Aaron Fan <aaronfan404@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aaron Fan <aaronfan404@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for LG gram 16 (16Z90TR)
Date: Sun,  2 Aug 2026 01:57:27 -0400
Message-ID: <20260802055818.7389-1-aaronfan404@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LG gram 16 (16Z90TR, SSID 1854:0554) drives its internal speakers
through Samsung-style smart amplifiers on an ALC298. Nothing initialises
them, so the internal speakers are silent after a cold boot, while
headphones, HDMI and the microphones work.

A warm reset leaves the amps initialised, which masks the problem:
rebooting gives working speakers, a cold boot does not, with a
bit-identical kernel log in both cases. Dumping the codec's processing
coefficients in the two states shows the difference confined to COEF
0x22/0x23/0x25/0x26. COEF 0x22, the amp select register written by
alc298_samsung_v2_init_amps(), reads 0x39 when the speakers work and
0x00 after a cold boot. 0x39 is the second entry of
alc298_samsung_v2_amp_desc_tbl[], so two amps are in use.

Verified with hda_model=alc298-samsung-amp-v2-2-amps, which selects the
same fixup: the internal speakers work from a cold boot and COEF 0x22
reads 0x39.

Signed-off-by: Aaron Fan <aaronfan404@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7877127e..eac378e2f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8114,6 +8114,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1854, 0x0489, "LG gram 16 (16Z90R-A)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x048a, "LG gram 17 (17ZD90R)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x0490, "LG Gram Style 14 (14Z90RS)", ALC298_FIXUP_LG_GRAM_STYLE_14),
+	SND_PCI_QUIRK(0x1854, 0x0554, "LG gram 16 (16Z90TR)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x19e5, 0x3212, "Huawei KLV-WX9 ", ALC256_FIXUP_ACER_HEADSET_MIC),
-- 
2.43.0

