Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2F2192F9
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395431; cv=none; b=mxENzDVhaVHLa7vgS7e5gYLSqoUBrskkZM8M+wIEJe/Eq8+FEC2Uv8CbNr/k4YljXqosyAjlzY8j8jmoJ4HZs5TFp9HhBe7cAPXbk7bWXTSfM5bf2rrh66Mnn0Vb/hQ/y7/6GDi8qkOul8GCWInwTnoaVUZ09QsEmUzgdltl4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395431; c=relaxed/simple;
	bh=uRFKl4xKQGwzUS9TD3pTwdz6Hc5goUoHrMjTIwzCZTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qjX+KKlGwKltehimFEUuNgSVWYyahNXe43X3dw1C1TQdfDPizmX1qb6ParC1M9ISmRtSt7dfMFHoURfLUwAbYGwzYSCqwPON7tdfwXureqX/J8Ey2z4JwgjAzGAPcTgs3r6NgYTNH+TF0Oc05846vlZHXyibqgRL61++3AYIeJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMKATyOu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMKATyOu"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aea0fff535so1034858e87.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782395428; x=1783000228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=reTtbRaO1dTJUXLmXeUUhteNMMIYrFm+1RtHT9/WyT8=;
        b=BMKATyOuAm1esn0hKw2oxHl2jJfl8Aez45hqWgdtl8jAYGfoiFzbbMwtxPU8UaBZse
         8zN0iB1E838O0TtwOGEFT8erXA/VR8Rsd86NaFz3xmYkvfr0VRC2E5X1qGmS4K4Lz6OJ
         oOl8mUqkDwCBDJ1qLy9t2j2udr+HZG5VrCaj/kFtrHxznmJmiq/0bzlw5KZlEUo7WJHm
         9d/9o084AKUtM3n5uzzciwOqTe4JdVdH/uTJHQhWYr/m7GXd8ar26xx4ybmLkZnm5xmN
         0E+jq1OKT24i2dldFbTdyL9G+WweWkCIsn5YABtUU9tO4zsA222XA2USVbJgRtk0qOwb
         +QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395428; x=1783000228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reTtbRaO1dTJUXLmXeUUhteNMMIYrFm+1RtHT9/WyT8=;
        b=YORWfutd/xvwYDwGgtoe+4wpFnkYHW9+3wE/msXZA+Wd55ukMHlbSZZDX/vU9Cqq0C
         Ed/UiBezxeyupBB6E5vBXuyzmEscZh1CG8pXaXh7rOBMFfmwpPTQvWGFyZpGEEsAN4W6
         vgf2WllsifKqvbpaeeF1aU/BBtj/a+6wdJAPCyOndp/RdyehjXO+0RiTFJcb69+5pHj9
         KraOVVQaD2AoUEEZRGwZUyH9KGeXL+l78X/zzF2c8JSl9ALrC2rPr4KzNo8ZX9o3xZmT
         9DIvj3Q1ZD9Y8xHiwNa2Nen+t92E7fM7nYTa7AHD6fdXyMRZ7G8R+4XqKnr5tMImCqgn
         0xAQ==
X-Gm-Message-State: AOJu0YymXkT4GsynpaaItqPmCTiTiEM+Pg6y+/hLHGX+5GQqgjPOKwyN
	AoR3T95aUKYdNYhMs76xzynecQs4sUpEuBqSfkI0lNcTGVpRDjm2ySmyigOcGGp05nw=
X-Gm-Gg: AfdE7cnRlpratmdhJlKCQ9c1RM9A4YLWwjLTgoMUnlLNQVn+o0eGPClJR+s3cMxpNvP
	/VAOxf5iSaxIrbLp+NcXIEr7rEDJjYwpt/vTdOxAO6RoyJ1gjKAqi1XbcTTjRncNVNEujjjQZlJ
	axMq3gH92DbPYfnqmWX52s+62XvFKnwtarkqTjPb4yKDxI1BxZZOHLZlZLuZx3vcuvnze4odw6z
	bteuFLHSaty5yqqD1OAsK14paadQwgH9pWASd1/cHJmf6zvU0Neb9oO80Tn5LaH7Drt1ly2fdQ1
	SQ3wsnxkD+RUP+RIwnxwN+K3g6ZOWNz0BJ8knumleUYOyXr8Qkkbq11cBcrMt1JcLGkPr2KHJcM
	M1QgrV+zdXZWvd4m8GkxzjylvsdqieiCKR2QGg+n/oJnQEJS3QBc/Mfdq0MQc7W/npaU91Wb61R
	ebSs0G0Hr7BpuHsmdxj/c179A2UjTaWYjqJoO1iAFAwYTJ9boNvt9hQCKKr3G5Zg==
X-Received: by 2002:a05:6512:251f:b0:5ae:a488:cda3 with SMTP id 2adb3069b0e04-5aea488cde1mr455640e87.26.1782395427969;
        Thu, 25 Jun 2026 06:50:27 -0700 (PDT)
Received: from nitro-v15.lan ([46.201.74.28])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156f23sm41731731fa.27.2026.06.25.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:50:27 -0700 (PDT)
From: Oleg4260 <oleg.kucheryavenko2018@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Update Acer Nitro ANV15-41 quirk to enable mute LED
Date: Thu, 25 Jun 2026 16:49:55 +0300
Message-ID: <20260625134955.27465-1-oleg.kucheryavenko2018@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>

The laptop has a microphone mute LED on the F4 key, but it was not taken in mind when the previous quirk was added 
in commit 00e44a68efef50f65b12854b41f098b4d50f10be ("ALSA: hda/realtek: Add quirk for Acer Nitro ANV15-41").
Replace ALC2XX_FIXUP_HEADSET_MIC with ALC245_FIXUP_ACER_MICMUTE_LED, which enables the LED and chains the previous quirk for the headset microphone.

Signed-off-by: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 71625394aa99..d9e2384fc0ba 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6813,7 +6813,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
-	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1025, 0x182c, "Acer Helios ZPD", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1025, 0x1844, "Acer Helios ZPS", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
-- 
2.54.0

