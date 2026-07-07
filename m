Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BBC3D45DF
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463103; cv=none; b=jZhe+u0KNJTsKHte/Gidtu9ya0goXc1HXYs3PhOnvfUjbJJsDJQsGMkPuv6aXXxonL1ZJWs76U2t3/4hscnz+3saptCGPEW32e3X+7CvfqU8u5361umEDlnv8fTLRvDfkNYPuiMANBdm2DG7RlS7WjnEp0hVSmiaq4Bvl399b/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463103; c=relaxed/simple;
	bh=t+Y7bi+iwrfoEgcWrKkMlrCe4Bqp0iijad5WyrrN9rQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=cz77bnAhxw5oPjYWmpsQ2BKHC6gyKTHkaiO/LFlatifVOFpVnQWpM6qauhDiGZjKxMRuQjC73gOjaXcanNnZVyrCW6cMpuVThKjiYbY2iCs7eUV+osBlNdm3M70asDxy6iXKCKnhIBAb8lhqk7kQFfGTOV1sWdxtz17D0LpcMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdgAxQhE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdgAxQhE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc84e77e78so680815ad.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 15:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783463101; x=1784067901; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwjIF66kplJEKAaOVMELunWPkMTynx35WZ02Vh1l0yk=;
        b=NdgAxQhEY99ebxKPP9s4im2sKiVOGZj8QbC24QBLVp8g9HthTX+pGuvYxe0FR/QrTy
         bk2kh0icyacyYFAL7QnjJP7kDDIL2FKwBldt3jEmkJaSPlVgFrfOL7+3P74S1EmjmZuj
         xXl564hM8LPTzCKoXvDjj72zF+IZ46LQ91of6m1qQBcvsqmRGi6sJ9jJGJDENbu/pkx/
         g62WDFE1GBgf439+cFJ2Sg9rnyWS7/THT6CyDvS/qlHCRR4adhj+EgvDfQBHVFgx9r5u
         Yz7ufymVaYcFR/1MaqC3j5HZTFaYuEIpAHG7+ga7I0WohTc7+Iyy6iOAptQlHjBbwpaf
         AESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463101; x=1784067901;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwjIF66kplJEKAaOVMELunWPkMTynx35WZ02Vh1l0yk=;
        b=JOV2/y2T+zhdoiWS/WsqeCCtZk7lEPQ5K3bAQZj08D/NjeEigEhuuLok+th4DTVPfG
         +o4VJjQ4oPY0o20rx2mYYUnPu6FLtuO1B3o73SrJ2MZXYNyagegIjaIDazNLItqkMvYY
         3ai5hOSD5tUvJlYiBmGMJ3JTpoOfqMOCf7muFv0gUWQBHUV+u4reD+p7gYfkEn3QAu9s
         VhXZNSrEAlM/HfOI1Zs6x6KK9A6mJ3mC2leAZUL8/OytS0rufO8WO+SLco6Mrat9lG3v
         /ab6RLrT1Yu3by/PctF04Nv27B/3jpKBmkHml4nKDKCK1DJArOX/MINbEF3GGUAdDfpB
         sDQg==
X-Gm-Message-State: AOJu0Yyaupf4ZkOkzZBQCFWy5o4eeFZawcz0lXQ1PuGQKGxi4V9v2pZg
	Ie8wTTLItWw8M1+/kajEaiKalpk7yNEoFKu1gjyoyH91X5XvgH+noJrck4SFMRDH
X-Gm-Gg: AfdE7cnHBUzjvRrehvS+Gl4D4y6JxOLTGjIHTOzQsyxV7GNRlQiBSlgjT3bxa5Clmq2
	UBt2L1qO38KXFHw1ieGsCFCvXNA/4NO36oQMWp7rLQoU7rxo13f0s09C15tjjUSx/PcgXuEOH4v
	0xPnqQs5R0dRzS6Nax3Wlk6fn7PBe3AvcDW+wVbdvGsYI7Dvm6b4OzETFPP9B1ZlUm59ina1x3L
	GLEMTuIRgB8/8qsWrirRiKUnXd28oJ6Uhl8dF4VVH1c3xc6dWdfcqhzsotFDh9A+VpweReWxJCE
	r0azFKfaszsfC1i1ZOGSNOX/mxUYmCBsgdeMIX27lXyXRQnjf0Se1bEe2LfOFux3/Wsf3YM5IeE
	YRfJFFDdUnF1L4BrwYV8AGDMKL0Aif3uOF/o3645q2ufux4uGBakBlBZwf/IIPIjSQ2x6rBpsYg
	pblchAHrZTbKfhHSHv7+aCKwDVY8+m
X-Received: by 2002:a05:6300:193:b0:3bf:d1f9:b1d9 with SMTP id adf61e73a8af0-3c08efff67amr8538160637.57.1783463100925;
        Tue, 07 Jul 2026 15:25:00 -0700 (PDT)
Received: from localhost ([2402:e280:3e1d:59f:6752:398e:c71d:48d2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5982sm13425702eec.5.2026.07.07.15.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 03:54:57 +0530
Message-Id: <DJSOWKFBTJH8.2Z7EPWX514QXM@gmail.com>
Cc: <tiwai@suse.de>
Subject: [PATCH] ALSA: hda/realtek: Add mic mute LED quirk for HP Laptop
 15-fd0xxx
From: "Kshamendra Kumar Mishra" <kshamendrakumarmishra@gmail.com>
To: <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

From: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>
Date: Tue, 7 Jul 2026 22:07:44 +0530
Subject: [PATCH] hda/realtek: Add mic mute LED quirk for HP Laptop 15-fd0xx=
x

The HP Laptop 15-fd0xxx uses GPIO bit 0 to control the mic mute LED,
but currently the quirk only enables the speaker mute LED (via coef
bit). Switch to the existing ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO
fixup which additionally registers a GPIO-based mic mute LED, mapping
to the same verbs (SET_GPIO_DATA/SET_GPIO_DIRECTION bit 0) that the
platform firmware uses.

Signed-off-by: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index dcbc669842e0..8c0d503cbf8a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7236,7 +7236,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =3D =
{
 	SND_PCI_QUIRK(0x103c, 0x8da8, "HP 16 Piston OmniBook X", ALC245_FIXUP_HP_=
ENVY_X360_15_FH0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx", ALC236_FIXUP_HP_DMIC=
),
 	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO=
_BIND_DACS),
-	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE=
_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE=
_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPI=
O_LED),
--
2.55.0
