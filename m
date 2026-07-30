Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2035C6BE
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 03:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382549; cv=none; b=CvXapsWBEvVKTyjker2nL5mlGG1Q+D6iGIyhakWxryg3FhUMHT+VNJGz9HJdgZEplA+IS+RmS63EXcAlw3XIaFTVTvvwy20Ih08vNlSNVZhIncwQ9G/gwYRZS+CMMDX5VcHoSAaknCQcPAIBHAIE4HwqORSBftOB7m8AbJgAhV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382549; c=relaxed/simple;
	bh=IkOnKm5up7VqWGqGWKIzYr9mmCHH8apjNEhkFVYvMKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nS+8Sicprc4IXlP+3TCXUWY2+QkV0VrkEnt19ciQ5EJRNTmo0NqBdC1kx3rI2UfX4pGcgKidrvlBOzPiIdK//I9wqRc4LrdDPtFP6NBIPBryUi8XAy8h2J8Y5wNlPoWAf8gz3mrqoYfX61f6oX62q+FV2f3hS/ayFdcei5grjrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdAA51M/; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdAA51M/"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-74d55dac06eso843674137.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 20:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785382547; x=1785987347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzRWZ3nrAUmrX9lQvSGQ+xKQuGR+rbxnQB7vEZ+GpeY=;
        b=JdAA51M/ccuaMMyun0+qRddKt8bf2Cz/QDFBX7ZO1UcSRVRxUEFX+ettxPkh2peed2
         IcKbrGt41RlGTAMTobQKmcj9tZhTEDx6bgulqfl4a/Pk1WYL9Kg0cv3YR0BeApGrZ5+A
         TDxoWI0yce6Fhp5A0vwQ7c9KcTYzM6FsQmS3DkOaPu0Llc54hIJEQDreDY6TGM+EkQDt
         gWOnaW6/4IViE2ltKzltxDgOPxpi56EblcHM7ExnKv916qVcUVutVdcrnD7Akcb0MeBl
         1XT0DUCdlN9h2bxxc/u1j8xKyYeT8Rb8qBeU33HrNnP4gTchdRHRCz2+7QBVbj8GQR4U
         A3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785382547; x=1785987347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzRWZ3nrAUmrX9lQvSGQ+xKQuGR+rbxnQB7vEZ+GpeY=;
        b=gFvuPGTIQAxUSS1pcC87f7vGh1EbU9hGAm4kRQHs8EcgEPYO9hPDVzSUkRa74gkxJI
         xbYInwuNMeYPCyCp2GMlQqgO/u1lQ1Pr0Gut6ItWbrypHPKI/ER3xh6IvS3jbXxteTzw
         d8v4lpI4wypMyVx1h1+5sjUR4X/pSDa95IHan3XYA5ufKex4MkBMAbJULu+SlIF8ypZR
         TU2yEYqdmoCmdM90b7/8ZFVGJLrazdSOkMYK6oJ9FTT3KqMIZdVbvKDynyCtP83Hkp2F
         ulCvln9IQ6SLwPfpxtJ1mJ2ywWuKplFXgZ0GndRWvr5CMJOtZ7bioOVW0OeCoP5w5tcV
         qBsg==
X-Gm-Message-State: AOJu0YwcEjCdDJq7KKakvV7sxYeDoERc22CADbNs0LRm4HdkC8fMEXY9
	/aTor3Ur9sdNe17NEAR/YGTseABRe0tjX7G34ONunXK65DQrmEfHecHo
X-Gm-Gg: AR+sD12LcvoM4kRxHjEOekRKCsE1yYWW0bMrKurFC/9h6wgMBzdXgAaoh+VT9iJ2KAU
	mhmAX6370CjcuHp6IWw1PiDJvLng6zQw6IDgmfuejtjVLpeWbYeg+LNA+wcnBTlgxzkMmUSYhij
	fjvMRRd+EIViQQQpuudzA+IIyKLt1CsLHLF7LFDOqEGF83/3ln/2u1QN9k3kU4YwA5Eye+gkojn
	QfQJYO1I7fHG20iuNJuTf/13IgdTRqxx+qiqSb9HJEPZA9GoV4P1Dza9+k/ZHTsj3naaBw9mP5x
	o4vZnBJeWb2FAKx2q5BkfYFs9Civ5dot3f1c9fyBbqccWcmkheOnKSYOuj8iLTfSfNdi/h5w1WI
	3CP2M4hj/1OCSrySRqryyGvoIdmpJ6X4WxiV7KW7lmZJakZmNsrc9JwxnY78fNPI0unU+cmN+mr
	/DL7KUBiehKScttiNo5cOyfMbXpIqsSH/jdIQHttKie+PdXZAsmBRs5T5DMFgxP5I=
X-Received: by 2002:a05:6102:510a:b0:752:757a:96f0 with SMTP id ada2fe7eead31-7574dcc63cemr367859137.3.1785382547511;
        Wed, 29 Jul 2026 20:35:47 -0700 (PDT)
Received: from localhost ([181.63.26.13])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-75759ea29c4sm365027137.6.2026.07.29.20.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:35:47 -0700 (PDT)
From: Mauricio Orozco <mauoro3@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maudob@live.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook M515DA/X515DAP
Date: Wed, 29 Jul 2026 22:34:55 -0500
Message-ID: <20260730033506.8958-1-mauoro3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mauricio Orozco <maudob@live.com>

The ASUS VivoBook M515DA/X515DAP (subsystem ID 1043:1e3e)
requires the ALC256_FIXUP_ASUS_MIC_NO_PRESENCE fixup to
enable the internal microphone.

Without this quirk, the internal microphone captures only
silence under Linux, while it works correctly under Windows.

The fix has been verified on real hardware.
Tested on an ASUS VivoBook M515DA/X515DAP running Linux Mint
22.3 with Ubuntu HWE kernel 7.0.0-28.

Signed-off-by: Mauricio Orozco <maudob@live.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 218b897a5df4..80a66a4f03f6 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7632,6 +7632,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1264, "ASUS UM5606KA", ALC294_FIXUP_BASS_SPEAKER_15),
 	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402ZA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1e10, "ASUS VivoBook X507UAR", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1043, 0x1e3e, "ASUS VivoBook M515DA/X515DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
 	SND_PCI_QUIRK(0x1043, 0x1e12, "ASUS UM3402", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1e1f, "ASUS Vivobook 15 X1504VAP", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.43.0

