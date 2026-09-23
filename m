Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B943322527
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127492; cv=none; b=WgU5Lnk0W3p4I/quS1/KTk2j7DcjLa45u4sjeLU5AdJ7yFAMcmZAwdd/BhnU4jNkZa+iNMv1rJoHUW/ed1Nkk8Rnj46D+woqF6lW2UvyeQdQf6N+iO127nqCcn27IsREl6fBJ9XyZW85Z029UI+K5vC5Uca3Y9Wzc+8z4EOmgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127492; c=relaxed/simple;
	bh=26uSeSqONrc1c7mY/yt2M0oVRP55z8GFJlCAj6wfa4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XH2yaN1D40FjjZbpKfjQc895l++Ix3DJWmC8QHF4cYbPRyS4p8wteclWXJN9eVbpCc8resjzbF6vm3KVZ3VfTqRR1KBl3VUsmC+xKXfDc+DeeiNWy3EtslewsBCSzRcuNQO9zKhP8GgdC7B1FkZqgIr4hKfG9pp537pcijU7++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szRV0J0X; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szRV0J0X"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso399104b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 18:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127490; x=1790732290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gjv51lT5GmKLsmUutPMbDxqNAs/b/nWBNLKaRp48DgE=;
        b=szRV0J0XhU5ShSgZuBv3/k8Qlj3yVnJMZs6cQj16f7IlCaNy8jqVAKonqXGeoIL7uk
         ObBHx7QP4Jk/6DXsVOl0JWhdQLd6cWyZFLZmgm/Ql8KJT3rBe0SUYVy4rmuXXfpNp1Pm
         zvOu0zyJYjOWb3h0BHVICqFfHvY0hcsjbfWHe5xDSHMmrvY0zg9sifYERSuI+XSprbIo
         8ZN1nZuwtj/VBL9WVx95D7LGaXmHIqOcAGtGvdRPmLgrHIr9DH0889SdQ3+eDvcX7KiG
         IAhHz/fFF2sc46QSioRjCvtQ4JKQ02Cusbgp5EsjJKdg60kQ/3AbpRHkpmJg9oH4Oxik
         jl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127490; x=1790732290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gjv51lT5GmKLsmUutPMbDxqNAs/b/nWBNLKaRp48DgE=;
        b=cXwR2cIwAy09R/OwcjCtyitHriEYBemZcXEQDSBQ9iy9LGPR79KUx9YUuCa1w+j2AT
         MJ6IZnFQJTnb24DOJmiruHhR6nBD51V/zXcertZHZGhcSwRXEWCxhQJq9+Wo1+OxOorH
         0ybmFTdS6DGzdhQsZj4hUQa/EBmSKDpuzPaQa7Kb61v7wZsHNeHti5Z/ZucKrz8Y7735
         X0spQb0D1TY7Hft5NQ9Um/Zgxkg5VuPn91np/TlWxiobEyqFVFxgiWbV1w0H0cxJNkkI
         a0i0SGAUo7E66p4tNvatiO7CP5N6e164sPI5dZb3jsA7GH5U/x8ayVwKfwy0XyMcULQB
         /3ig==
X-Gm-Message-State: AFuF++koPqVOIA7+ZLCm+x5gaAT0GnY42+ov4BprO6PIXs/x/8UEcDCe
	+ekSMzos0XiXsdyzBmLglrVqsvLjxpOF5ehQLXIeSUDgFILXkVxT0xyUdHead0P8
X-Gm-Gg: AYBFou0LqkPtnKEMdQtm+oEFzylLmB/I7ETVyjnsEk0H30oo+3bp1yuSducpZsvtFNh
	jWyxc9DcjDvjo9cJjfBA78IR/a1ufXq8YcHjJN80cmaBdcbNFaX/GZDrl2ys34zbElLQsi7BZdp
	VjkX18OjXs7+4AvT2EAcR7sKL6rfgTpFplxy7YLIjg50QjuVpfor88/P7p+Wa8sqJXTFImkXM1u
	1kbmVXchvekDEe8GIUus0CNNihyKkhHK+/uVglaGmIGsPkrA0ON6V5CcGZQSpxw7Lt+NkVcI1wh
	OcaqyqPMZTzWHh7naV5iNQ+E9d0amWi5x/Ny4FHoqjAL0f7qnfxL9cy9FJPZUnKZO2SKzO271Mz
	G/deXOwokIQ16YTcE2wcHVc6QbkQXrMctgN5vJ8odtTCVDbmagCePohhoYTq/zry901nKte/OgE
	6hif/sCRg75JstABn5sxYanxjTVjfoBWwpXCvZpDsYmjDLP7clBx0sS+VQR1BMwlPHtI7v9pmzb
	2wLDHJOPgmm+xNnPrjawS8zqQ8Zv1EeDnPSX72VlL5MV7/Sh1A=
X-Received: by 2002:a05:6a20:3956:b0:3dd:85aa:4531 with SMTP id adf61e73a8af0-3ddf82b76c0mr948563637.35.1790127490204;
        Tue, 22 Sep 2026 18:38:10 -0700 (PDT)
Received: from phrimm.Davolink ([2406:5900:11b5:2a11:f397:5bc6:4112:6acf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f4046aesm265060a12.27.2026.09.22.18.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:38:09 -0700 (PDT)
From: KIM MinWoo <phrimm136@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	shenghao-ding@ti.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo ThinkBook 16p Gen 3 ARH (21EK)
Date: Wed, 23 Sep 2026 10:37:56 +0900
Message-ID: <20260923013756.106033-1-phrimm136@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkBook 16p Gen 3 ARH (SSID 17aa:3871) has a TI TAS2563
amplifier device on I2C, exposed by ACPI as INT8866, the same
arrangement as the Yoga 7 14ARB7 (SSID 17aa:3870). Without a quirk,
the codec falls back to the vendor-wide Lenovo quirk
(ALC269_FIXUP_LENOVO_XPAD_ACPI), the amplifier is never bound, and the
internal speakers stay silent while the headphone output works.

Reuse the Yoga 7 14ARB7 fixup, which binds the INT8866 device as a side
codec. ALC287_FIXUP_TAS2781_I2C does not work on this machine because it
looks for a TIAS2781 device.

Assisted-by: LLM
Signed-off-by: KIM MinWoo <phrimm136@gmail.com>
---
Tested on 7.2.6-arch2-1 (BIOS KCCN40WW) with this patch applied.
Kernel log:

  without the patch:
    ALC287: picked fixup  for PCI SSID 17aa:0000
  with the patch:
    ALC287: picked fixup  for codec SSID 17aa:3871
    bound i2c-INT8866:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])

With ALC287_FIXUP_TAS2781_I2C instead, the codec's component aggregate
stays "not bound" in debugfs and the speakers stay silent.

Headphone jack switching, the internal and headset microphones, and
the volume and mute keys still work with the patch.

The speakers also need the DSP tuning file TAS2XXX3871.bin, which is
not in linux-firmware; without it the amplifier driver does not enable
playback and reports:

  tas2781-hda i2c-INT8866:00: Direct firmware load for TAS2XXX3871.bin failed with error -2

For testing, I symlinked the Yoga 7 14ARB7 file
TAS2XXX3870.bin as TAS2XXX3871.bin, and the speakers play.
Shenghao, could TI provide the tuning file for 17aa:3871?

Fang Junhua reported the same symptom on machine type 21EK to
alsa-devel on 2026-03-04 ("[ALSA][ALC287][TAS2781] Lenovo 21EK
speakers silent on Linux, headphones work"). The codec dump attached
to that report shows the same SSID, 17aa:3871.

An AI coding assistant was used to diagnose the issue (missing quirk,
no model alias for the fixup, missing firmware), to choose the fixup
by tracing the ACPI name of the amplifier, and to draft this changelog.
I reviewed the change and tested it on the hardware.

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8f55c3c..cc52f41 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8193,6 +8193,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3871, "Lenovo ThinkBook 16p Gen 3 ARH", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3874, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3878, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.55.0

