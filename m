Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC3459AD0
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932984; cv=none; b=VD/KwnZ4dV0q78ARFO4sgA1UzL1LKzGzg9MygIErXFmfoaK9aWqNjP+7sdRlKsnnm9PAG0IcZ1UTBDzGEh15WCZybY2+XCr+DwAjO4beS35I3TF8C53V9THnMW6j4NmKXiD3BeUBZJSWOq271hnCbhLsSBD/368xQ0R7yytsz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932984; c=relaxed/simple;
	bh=y55/OyCDh5ZlzV27SkFVh8Fl4aSApKxqeB+wfMJJCCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToVbjW4N4qHGPrwQZdyxtscOWVNTQv69ghdY+eu2/tLe/0LmkjkQfOm+2denZwT5SY+N1Xlo81iUIADUkIZckBPPvTBsFRjwihHe4yKEUAcw57ENkghaeCJfCuxR353rvdFl3kVchnZa8RuNivlfeP6seIgcQ4140YHU0EwqTZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDwD6syW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDwD6syW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so98030166b.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932981; x=1786537781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGJqx7LCm3Dt0D0CWAACoV3qrQxlMdog8+6/YRy2R7s=;
        b=ZDwD6syWZkDhL+NDByz8RG5oTzMxOrjKlw/Ajx1rvpibT03ctpN/DyRSWWx14hhPZU
         Q3t/sVXQo7uLOWvF4gfQD0+cgMMLXrge6B3X3jIDUEuLgNDSj4KVWbm019qSweMGdyXg
         TSioQH8LRrt3fW5X4QS8uqVBssd1DIMJTMuKGzYmkUrre/lKRIYSFZkpk3Av0aJtDdqU
         mgYl2nGP1zJyi6M7XIKIIN9l8y1OcOeEFnNVSB6AdHA+hkm0+owOa/xoyg01rRRyPrRF
         rtbu9SLyfL/3BXb192/SG87ocuTdg5IyLa0k0ljb3FPtsZImYr36nYRUzZNhoHKWC+4E
         uMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932981; x=1786537781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGJqx7LCm3Dt0D0CWAACoV3qrQxlMdog8+6/YRy2R7s=;
        b=GJWpz5rrRmS2K0VcLa8a5pJWXyGo4bc3qi2FD2ypT27x94Yl0b+ZHhyBQYUs/fuke8
         0+ZIeSMsP2OEWqm1S1L8dSShvtgPxMCvmggy3gw6nCj7fb9T8uY1cZS8Ngo7pEmSkfE0
         AMaqTJ+Gy1s3Q38Zz7McbgomfvOuuSANTS/4kNBxWsEU2F7wJDwJdmze49o6SVvtG2kr
         cKVvUrOXK3Npp5ZuyqDfE1riiyxGPa1V5eUjxmw5XutDQD5FIfar4XzKDMghgwtEV027
         QjTwGW0jzzQxBZKjaCLJNSyR9BCxdTkt0jeDOgPTaj7GeYh+D32NkyGHexKXia2QLWQy
         lVug==
X-Forwarded-Encrypted: i=1; AHgh+Rq+zQpgxxeGcKkQ0esZ9YMbln9CNugOZm7J8p1O71uB4lZQNa7grQu7RBCX/yRsPM+KzoB65LALjsRm6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QWNa5UBHv7mj/BIF8bwn5RZQqG3HVAkag1KZ2OTKYq/ZZQj8
	9NIwK8RZxlNaAj4jOV/H1ERNUH+pFMJw7S72YM6HY1DPiWM048R4/zzQTw4f5Ejb
X-Gm-Gg: AR+sD12elM+uPucmfCS8X8luyuT+S3psfopIybNFoRvYLO9fvKfBFFT+Wv1vUYWfjh4
	THjtnsSm1FN4YHJv0IqJq5+PsJR6g4Y2b+SEnJEFem07Cg5ItHt3APK/aYx5vR0f3vW7BOh93lv
	JaQP0xVr7qlSCqA4YrhTJonLGKAlPX/40cQAM4tdT7vz6R/b2uc0thTLV5Ypx8eHVt8Vm4dSXAF
	kQYEsLoZrAFMj8hrE41ql3BADlSwC04asshG5w+mwsVpJ/XSYTFjKSYT47dw7XgZ1TJP+QmReyw
	eTRCN2cRoVl0cYvgRPGgnHRPirq0AZGyow7QIsXCMrOobjk/yY6FaxOZI9MiHOfSh40RcGCDPY2
	rq2VH5Mv7i7rvEZXhY76uLON6+6sfrpKckLvhcf6IwAoZurj9ZnymXT7yUkAPOqLZNTETNmi8yc
	Rc3DXwcWBw9muQbYfH0yQYfkt6yVYporo7bVmu4KLTrRLxPZgEncTHFhfvg5/PmTtt6gGOL0WNV
	Opl1pgnZjLBIder8Z+yEwawu8/+NGrbPKqhkOqAft/f6yrk9OZ6HYJrqe9q/t7SVP8w0CkxdVio
	Sjs=
X-Received: by 2002:a17:907:934d:b0:c12:9b98:209e with SMTP id a640c23a62f3a-c2039c6806fmr275676766b.23.1785932980885;
        Wed, 05 Aug 2026 05:29:40 -0700 (PDT)
Received: from lc-hp-pavilion-dv15.local (93-46-49-60.ip106.fastwebnet.it. [93.46.49.60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036227ddfsm105787266b.10.2026.08.05.05.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:29:40 -0700 (PDT)
From: Luca Castaldini <luca.castaldini96@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Castaldini <luca.castaldini96@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED support for HP Pavilion 15-eh2xxx
Date: Wed,  5 Aug 2026 14:29:07 +0200
Message-ID: <20260805122907.52302-1-luca.castaldini96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the subsystem ID 103c:8a0e to the ALC287 HP GPIO LED quirk
table so the mute LED follows the speaker mute state.

Tested on HP Pavilion Laptop 15-eh2xxx with ALC287 codec.
The mute LED now follows the speaker mute state.

Signed-off-by: Luca Castaldini <luca.castaldini96@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f267437c9698..5ad105a89d85 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6489,6 +6489,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a0e, "HP Pavilion Laptop 15-eh2xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a26, "HP Victus 16-d1xxx (MB 8A26)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.43.0

