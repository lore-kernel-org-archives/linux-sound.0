Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3792372075
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562945; cv=none; b=hUnj1OIT+NKnuY4o/RB0gYlOSx8qURuGgtHnp6cRWeKiGZvfJFQ7TfU9WeVFzLMI7vMpao4CUjAUwqOBSpz847D2Rfx9KGoYM35DdncEEVN+iIVqX+HZGJ1Za1UxBGxAGZQw9oeDzZ4BnQld/W2vcQYi2J481molL0a5IbTTK2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562945; c=relaxed/simple;
	bh=jpy5XZD/LVA1KvcJbBMPz6qs9DnJcEVLaquPNvmZGSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISwjNaI8v4vsgkyDNcdCzIft5cJB60lf+jnIZgneg9lKnAurwVMBXP6NRA7r3ATmQvmhQvWC25d8Yt9A5JLKUp1f9q9omOFdwAELx2pNJriAnj/lhzre27NiD0LjIIgSmaA6+LsswfLzAapoCskSoFfxuS2ksXFLJ7sLuZYVfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf6sNhIq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf6sNhIq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so821020f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786562942; x=1787167742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6D16k/s+4sWOnTZjGytoDef/dz7828L1yfczDjZ2AAY=;
        b=Qf6sNhIqN+MV8POsU0HkMB3TNg8GDTHkqbZDakco+hF0sjxIKBHUhjLJ+taFqO5YKO
         rcZNqzbXYvdgLXEn0T8pRvOW99ZXmXWmAOI2LbfHI8iZVXiad57fAbHjMv2x9yAvnUcm
         w9j4QkFoehPMu5tGtnEOnCMvhOrrlPQ/gE6/wt5Ugkotjgl/fNRe11EbekQAygXv3hfU
         wvtPfm0bG+msbwSZg4Vk4YNPHWYafCk4MXgsbAlpWuyreL/tC5cVehJuuGwmA35HDfIF
         FgGx+3cYbeTxIms22ckBR9MeybYiaKHxhgobZuMEgk9OVyoiohTjuk8xwIdEy6EF7Ip3
         hfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786562942; x=1787167742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6D16k/s+4sWOnTZjGytoDef/dz7828L1yfczDjZ2AAY=;
        b=PzM4AyLZNXaIfIPSbX8fBwpHN3XpEhqGPDVtPWRN15vQIwgWdJ9JoTbQSi3ydW+MEu
         L8cgx0MFnB/F3pxKj6gkjGKi9GVsk84rp8dNd0ubOOTLU4Hm1ahlF3WB4GdOuhanFcce
         knu1WWdlihGdKBtYyapvPToOiHhlBJWA0CGQTRc2UAtKuSjZlG5VKHCzInJIDQfHfNS8
         jtQvavJA9w3qb1Q6c9uHy8g+I3lGn2knhZ9qcUPgOU0V0QTU84XcXYlhjspLyjBz3Kp8
         dnr9uREQvOp44qTLFidnNAHkMggPAA4FOModkt3sdw6LkXcPucIWVWlo9sGenU4dWMyX
         tmzA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9JBg2O3ThRAvIwp8NtnQL3AdPZRJdPEU0uEgTG0lDcyYbXOiYgjgSgOTfv9PLzK9Q7jH2T3+p0p2SKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznDcPhyk+kKAbu3s4ZCi0h50FkdBF8OcT9FW1anl1pmpgEzeyn
	QySk6TuDXOXwAmiqaIlOnRGiXsUlwU3Vac/5GXYan4bAKHMZHvLe3KQe
X-Gm-Gg: AR+sD13+I2PJDKDb6O62qRCov/tLyTVq9gOhL2Jxk3zcS0LNXqeYzD6m9ySG59fMcAR
	2N8iAgFrg7AUbmZ3mioKktUAtDE/ej8HXPrvD09g4KOnS2v+I1Gm7xa97eOi8Pbac/zf+n0OZHk
	/Psu8I005JBVoESG76JRSm5r8TWAJT2eZutEwb7bLWf1kRrArgQxuNmgltzz3DOBqYegOgKaMS0
	Yw4Fb9oGjmpZm09Dl7GBVYHC9kTmQO++5O63riCJvzX40gQZUEsVh8Ga5qEHny5SvtGEBLY2LvV
	3yFBJu7Eg0Xond1pMGoNW9tE3au7OdFXBr6Kk/gZl3LwkxcsCdrpt+NsCfY9gLjooawEmQGZTIr
	OLtJXrqveu+Y5iiqMH8sEPaGItSOKiz2v5wiI0s52otd/l5Xza/BrA2pr5B3xMVAb7Lw6JuO+KO
	6UfFDjZDynYlSTrO6pF1mCB9OH6/OtpzEkTteovaLHembFREP3JMuebcm7ntNFMufDKRnNtJMol
	Osh8M0qlyKo
X-Received: by 2002:a05:6000:4619:b0:47f:9de0:c27f with SMTP id ffacd0b85a97d-48159c9031fmr790665f8f.1.1786562941781;
        Wed, 12 Aug 2026 12:29:01 -0700 (PDT)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e3f5sm9648751f8f.22.2026.08.12.12.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 12:29:01 -0700 (PDT)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH v3] ALSA: hda/realtek: Add mute LED quirk for HP 250 G8 (0x85f3)
Date: Wed, 12 Aug 2026 22:28:32 +0300
Message-ID: <20260812192832.69240-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP 250 G8 Laptop PC (subsystem 103c:85f3) using the Realtek ALC236
codec requires a specific quirk to enable the mute button LED.
Currently, the audio mutes in software, but the physical indicator
light remains unlit.

Adding a quirk entry to the alc236_fixup_tbl with the
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup correctly maps the
LED to the mute state via COEF index 0x07.

Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
---
v3:
 - Sorted the quirk entry by PCI SSID order.

v2:
 - Added technical description of the COEF bit mapping.
 - Fixed spacing error in the quirk entry.
 - Updated mailing list to linux-sound@vger.kernel.org.

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..23d9c9384545 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7101,6 +7101,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x85f0, "HP Laptop 15-dw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.55.0

