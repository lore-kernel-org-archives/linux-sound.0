Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5789258EE0
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778937425; cv=none; b=l+GXXt7CUwb2J2oQ7LhzgaK/07e68GXJf9aKP0AnHkuzysWwMMWxfXeToJNMksBnGzApCum6rWXGPS4dtk/xlbKZuUR4HCMagNy/soeCP5WWFls18ZplJN/Cbdv9x7mBYQcZqmFb4UbK78aqQzeoKzR5Fz5ExLwelQlhfRrZqO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778937425; c=relaxed/simple;
	bh=pyzDA1spdtkDsnUqb1pzd4IA1kD84PLcswbD58Ir/TI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMgd43DHAh/ZrLsqXCKE+C+lnWDFjj1/PyEYFrbjWNUU830M+VQJ7mIpeu/PY3ZQoQwNm+6LhE8Di/SX/HcLI02i5MWEETkg+zx/ibi2ow7pp2hu0mkwbzqtjcuONbTtAQIFBzSvjhrIrsMDmr1G5RoGgKGWzRictcuWV8Bi+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9wKre62; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9wKre62"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50fb4a7d704so9189221cf.1
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778937423; x=1779542223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1iiLMTnXZ3HRKof5m2IvmmuWm9G3cxep98kuAE+4wA=;
        b=s9wKre62gwIT/EknWBKZXMv0XrSQNViG7y4V6LXKjzcyDUGKAwDcMAn8ng/onjbwu6
         fDofDAjBsURWfJUoF3sxdXblQVPYRhhO2eMcmi50PAVHC6CuLFu3C41ETendpMXAuYB1
         M4cOOFGnYip32/bglAwe8ubKRELirdqj/YsOBkEIGTNuIrv9NAteuWp02mpJGAkl3BLV
         RlehJir3I6VKIJzwZJ8l14r6yYd65kQaRg4eN8tWy2MdEWtkUkqmG94rM9v4u637pOec
         s+D1lCx7A+olGy2vBwrCgFdYSYmRlQs8b5Vyz13dT//jDp4brca4GJIzxgsiuu2jMVcO
         4ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778937423; x=1779542223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1iiLMTnXZ3HRKof5m2IvmmuWm9G3cxep98kuAE+4wA=;
        b=jvBvqTnwZENZAdqYbavN97I8j4v3d5hw8Egac8Z3Ezn65mexTIddgZJTk8YfBkfcKY
         hnCycA2xAt1BVt/zoO5cjNXCD7moQlfQl2ZOwGZd2fuxmzZfVyr4RS6D8GE7/WuUBP4y
         aGBk4T+36n8DFiqIJuzabhgU++VmU58ckIk1mGiYBm6c5WNgg/E73j/2nMszz6OA9eKC
         wG8TIV7+iG/Dcp/XLflQIGrL7gQfqe5o9jLE05+nnAP7o+hcGM6kmd68DClf996H6exa
         DmirGcIMIfCbhZc1Q7iNTuiJro4faPSTvMdnwu9M+Jm3XEvyEceA45EwGekUy6rhjzgV
         BSAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IKtD4rfoBjKH0860ibFF13C5wrUyPbG66+X928GOCijFEu67k7SL3vGmaAMlcfyU7QyfO44U4MrR+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hQ2NPdIYyTLpjHm3VCTSKwhYDyu1NKouWSFG1C7OqLTdP/a8
	O+VO7eUNtMbpflPNmTLDRHefj6JPLpZE0V6Re0cOVZZLXuK+yQOHD+oX
X-Gm-Gg: Acq92OH4FyGCJqs5Gm6bRcnDJdzG8uwfavGiXxagdZuYsWP4zvv3lHlkEzP7FWHXsnF
	4eDEmIHigTnHn+PcJiiA0XwPLLSUb9m0fYdMJ0h7DB8QV7XO7fNTeek5QJRXYITx5EF/x4awqEV
	AV7aoeJB/yqjmBXLm3Z5brrRm/NtArUagl4vCvB3djB7JU9Wye3iNPSCL0wFAR266LTQWJjRNY8
	dadAzq/mGp9kwVyVDxk4TOD/TOU//z8A/6crudq26A5Yf379AxA1JHfvov8UrZPV6rkqsGvGtdR
	xNhBTpF+owfGbF0MjoDJg5K7UBzJJyML0OCkM7n4tWaVSFxc2JU4oavRKas9ubBtvwMnIUsInO0
	LBlgRVi4zsll2cngDQomUpqUiwh+z+hhtq/SKCEzFb/Q9YTMG7DSoFhc+0OsOArtEZi57Gh8IP/
	fbhAKQyIrFF8RZ3Yc0hl5c2DHZYr0d3FHIeiRufxJxY5ttpzQ4qLlVm0t3N4DJECjOC1KgpDf+v
	idbszyH14xIdQKgqbDy9WwpGy3DSi8QwAiYup1DdQTxFhRI6RfTN4by
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr108120681cf.29.1778937422824;
        Sat, 16 May 2026 06:17:02 -0700 (PDT)
Received: from sergio-HP-250-15-6-inch-G10-Notebook-PC.. ([2803:9800:988c:831c:3ae9:178e:aa0e:2efb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645856d10sm71755171cf.26.2026.05.16.06.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 06:17:02 -0700 (PDT)
From: Sergio Boglione <sboglione@gmail.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Sergio Boglione <sboglione@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for HP 250 G10 (103c:8b34)
Date: Sat, 16 May 2026 10:16:50 -0300
Message-ID: <20260516131651.143109-1-sboglione@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP 250 15.6 inch G10 Notebook PC uses the same ALC236 codec
as the HP 255 15.6 inch G10 (103c:8b2f) and requires the same
fixup to enable the internal speaker EAPD and microphone routing.

Signed-off-by: Sergio Boglione <sboglione@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb7..11bcc2ef8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7050,6 +7050,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ad8, "HP 800 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b0f, "HP Elite mt645 G7 Mobile Thin Client U81", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b2f, "HP 255 15.6 inch G10 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x8b34, "HP 250 15.6 inch G10 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8b3a, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8b3f, "HP mt440 Mobile Thin Client U91", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b42, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.43.0
