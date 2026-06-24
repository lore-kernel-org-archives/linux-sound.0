Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA353624BC
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328450; cv=none; b=nfiebmF7xgXpU25Do/8DQgG30CLsZHGo0brf0GVMH1tNZp58zpI8QVhuWTuC5J0B+gZ7Oz9aYjv2hSqg4m1J16HijkdjBHX4Uk5WEJ8YnKXdy7Fmgg15SSkIYKkqDsxpQD1aqpefzEA4GopbidcMY0AvCCaH95yDzpaFLnH+bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328450; c=relaxed/simple;
	bh=f1CA7KexbpI26hbYH2IX2DiHC1gHVul98fHM2DSdZUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJzT7ZCqvYVS1iwcMnPV7ueYxrirGLkV0xFNmynIK9EoJlEKBse9WQigq/llxYJurj7K1SljPuVKCdGgFyBzLvEMzG0V2GMMTK4uM+FfLKd0tH1TZelcAQ6tGLy1ga6HFXPjRTxwFydKw9j4vsioo2uoH41z2HkLfLiMiO2jwH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nzw7oBpe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nzw7oBpe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so2455365a12.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 12:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782328447; x=1782933247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PT4a5i2iJYoU4j/eGEX0Z27bb5HXMmWgDoRSTU7KzE4=;
        b=Nzw7oBpeBtxmnWzcwpcOubnVZbq2W3x1Hu5fZebWd33J6jKgkgJm9yJt5kuIuJ5cgo
         n0BXBrB7EKEznArmZX8SSWiZXDZ+m/L/tiyEtDuL+g4P75JJ1emC1guxqbOb0VEiGITd
         djvv+a/brGamAQREYkZZL8YF8igxi3vs91jOsZErQg/yB3y9AAhMl+bWslbQVxb+YV9B
         cvuNZnLueDLTyVsjiSskJAReaFB57BURvA3vWvB2juG/J/DN7mU98MchadkGUP3Azi0M
         bQWwroGdHE8L4EliHIji8Ksf1HHy1WOiy2Vw2Gl52JPx09MxO7o4cij3e6wINuyJwLhD
         Ivbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328447; x=1782933247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT4a5i2iJYoU4j/eGEX0Z27bb5HXMmWgDoRSTU7KzE4=;
        b=C6CGcmX/LvsJkGj0ppbPTgiBOlCJS6De3iQFSvFg4edprmF7O9vc/ytzIkrqBJAdMY
         oRBhFUWFeN32GMTnr9qfvlCSzF+HwbinGRudpfmIbq7MbBB44u8+MGVloarLlgO7Tsc+
         mlPMol0oL9a420AnwtKD8Qm904yDVPeIg+IvNmf1xbcl4RmsI8qq1emy1dl+OHWfIH9d
         faprtPyt6QD8bVjD21wQZifhXUbi0io1WjHHoLAGlIBdm9uMCRd/NKCOF2FcZlH4vTqY
         XetnnbfBEIp/EMRBQPJghWBNdbDPfSESlvzOmMZcAzTyDiicHHL1GmGbytBkI2Z9UQV1
         m63w==
X-Gm-Message-State: AOJu0YztKkOKo4LasmPJTTLKjuiW2YoooEBc4trMy0vepw+tGdxuyr70
	kjngcgpR6o6BhRqeIyuikOywtvmfe9WqtQcvh4Bj92FDH4QofaXwl743Diirf8/WBqI=
X-Gm-Gg: AfdE7cln1cplG32DMjcbDkBawHps8LusGxI96Ni5bEv5ijrkMMrn3WdU3T0l5HPF/xV
	R14cyDBDjoshFcbY0nb+8VDIoBivxx+x1LIbQcgwO8pi0DddyPK0iBZPR6jY7Mk0SFBCIz8zF/V
	DUcOdkh2yXyHwjD1cZ3Lwxq0ObtUFkgWrtqpps4J+7iuRGmM58jiTz+JLiDfEr3ARpJ0yhT9tG2
	Rv7skUwCvLWVS3IAQ/a0nCam6Lkum0zZLy915Jss/DJ4/r9GpVPZYCfbTVYFwnoUrKo9BoFpbnz
	/xwEv5BkxIYb4dq6C4ZQCKJKZxLzXiV/59TMUSFrCO6BmdjwXfM0XJVxdHnQ/j6253RUY6zVX0S
	xPp3wtKzKjRc7HxFDU30Yjq6DeK5RKzhluZZEB3aXcCTc7z0uKLiZBlqagscpLDfteT2xWkjBIY
	l0/bHEvNkGHtcOO/yvPVNxjR2KmyVs0KEt7dIM/l/EO+9ot6k46QdNXjkH2mUcybjVwPGuo//2
X-Received: by 2002:a05:6402:5410:b0:697:560b:f6b2 with SMTP id 4fb4d7f45d1cf-697dba62096mr4717370a12.4.1782328446649;
        Wed, 24 Jun 2026 12:14:06 -0700 (PDT)
Received: from nitro-v15.lan ([46.201.74.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac4774sm1688736a12.3.2026.06.24.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:14:06 -0700 (PDT)
From: Oleg4260 <oleg.kucheryavenko2018@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer Nitro ANV15-41
Date: Wed, 24 Jun 2026 22:13:01 +0300
Message-ID: <20260624191301.10162-1-oleg.kucheryavenko2018@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>

The Acer Nitro ANV15-41 laptop with ALC245 codec does not
detect the headset microphone in the combo jack by default.
Apply the ALC2XX_FIXUP_HEADSET_MIC quirk to fix it.

Signed-off-by: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5d09baa6d32e..2bb42ebb9638 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6812,6 +6812,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1025, 0x182c, "Acer Helios ZPD", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1025, 0x1844, "Acer Helios ZPS", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
-- 
2.54.0

