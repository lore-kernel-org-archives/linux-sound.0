Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0279EEBB
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777131689; cv=none; b=tubVW0nGK9+RnyOY4M0DuPOORqkxVCLTriyrtersGQjiLpQLn7QsK0FYWLnkODglfmJDKPeYsfhDtmrHBP95ni9tFee9T6g2kPO/oN/8MQEVYIfwxYyamrdahZPFCpg0vmc3LbJAPD6MsAMWYxQYQKsAxSVySqLGkKq0f5eKLMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777131689; c=relaxed/simple;
	bh=8EpqcSCihoJmzvC4cH3ptI0Yhl6e3iiwEFrTxCnABi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EReXgPErjRrltBpvQaDk+f6mbAFYrix4Vxz5vZAGMHmrQ/9E5SnvateBS7Z9FhjsegtJ1wj3j4BAk+9XPaEcvMJ+9lBBFdmPvVmxvBQz9uuthUrgFUv/Jo2rhxvhbDU/n92n7tlnz7i76QxLGBenWN9AlRF/O2Sr2IoBbzp+FCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pERB0j2Z; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pERB0j2Z"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a41099fa86so7769402e87.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777131686; x=1777736486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7E1wYO3D8D125+M3Nc+VvAkr/VMUiiUXw1nBlrOtuk0=;
        b=pERB0j2ZrZPFqtv4fmSL8hYMOoGoW7g5PlCd8fy1vI7KMHkAzbidVgiC//Ys/ymc1p
         eqgJFbkvqumM3CRjWt5rlqfVCvRFJlCQhEPaUILy1rLuRor2QwhH5ashQhvQWUJ0kSLF
         J3G84RYiXtHndUegvVcZ6p8EfS9eSLjNtE4zBiSYD51tfBPmHiLfygiZ980N4grPViGW
         s/3rVFj1TaVd/7NumBr/6/sV4u5EgAiHVEk+1rymkp6vhCpr5dZ2jUAcWSA2pRKZ1S+d
         n2a4wmzNKrlSlnhEjAmp1bOrv1qHxGb0nrDuQYg7jMKAQlUFrx365rZLPt34JmEGL4lJ
         SjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777131686; x=1777736486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E1wYO3D8D125+M3Nc+VvAkr/VMUiiUXw1nBlrOtuk0=;
        b=bp9h4okMfBbPWTl8CZTeXY3BF3PWbJMY8NHaluOtBy6RVP31Cvyv6uYvcSvOt7BY8Z
         ReWc/ivdzx5Wu8dApepiVED1Sp1zyY1jy5L6BAyRyEfmhpmvDggU6Udh5lYSdib3IZvM
         2GsrKgqQ/JjxMst8Zi1wGrvAEHxX5ueOefhlPlfumR6mxZr6VMT86R2J92nkeuQ6Pr9l
         tvKYN1apl0KRs3Z06Hs+5zJBXYxZ1xL8hrcHIgSFabggNRF8P6oOcHiWOXTVFgUDv87g
         zJJMwvJmx/IwgGzEYhj6TJAFt2fGymK4l0D9L5pg7RQ/V+ukkgc10zSeVdGYE6N14/NL
         vamg==
X-Gm-Message-State: AOJu0YyK9jd0wFNTVLzz4PIhc/dZoKky4/SEHn6Iqeh4FqSI6rPOe+Vz
	CcXbyt85jSiVMWsVGrg+HU4NHQ3caEljAbM7ZFS63FyDo92uEvzWkKTWGLQppzk0
X-Gm-Gg: AeBDievGehqLKPDTKqZw//id2K9r4latBY/Sg8KsaqBq/XgVSpEpKtJB5GirWIXD4W9
	cC+BP4rDzAwZHbYT4RVh5lXCWfWM+Ku/1xLZ4D/j+M6CS2QLA6eWQXI25w1hLTZd0l3O3YNO80j
	g33qJmpuZEgmpVSrORLfKtbsSM2T1YyvoYQmv+FjmWkZbLieppIhDT9A8qZucut4CVwj5d/nhXY
	PDMStPTDjMBDFDUQdZL7ZMcLmVT8m0HRUr39hOBLoKedHTioOgil5lzEXaYiR1csplPH93ClQGM
	vb8l+goCJsdMR8gpPmvwR9tp5lDe1JqGO78VufFCysTFNUhPaJzWi6HD1KTk/CNpCoiQuO1BxOa
	XaWk/H3DCzXMFkU8GCeHZONu0Vov0McwrpCBqBqwdAezkcWEyrkru5wwVTgnWtfYldji70vf6jA
	gX68VmCzLaz5Ky1fhUVJz94Wc84oYnS5mKKgAh
X-Received: by 2002:a05:6512:138e:b0:5a3:d3bf:d3e7 with SMTP id 2adb3069b0e04-5a4172da9f2mr10975498e87.21.1777131685856;
        Sat, 25 Apr 2026 08:41:25 -0700 (PDT)
Received: from raven ([2001:2042:9844:6b00:c235:32ff:fea2:5ed7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1131sm7019450e87.42.2026.04.25.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:41:25 -0700 (PDT)
From: Naser Al-Asbahi <nasserqahtan0@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naser Al-Asbahi <nasserqahtan0@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A315-44P
Date: Sat, 25 Apr 2026 17:40:14 +0200
Message-ID: <20260425154014.83982-1-nasserqahtan0@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mic-mute LED on the Acer Aspire A315-44P (subsystem ID 0x10251640)
does not light up when the microphone is muted. The LED is connected to
GPIO3 of the Realtek ALC256 codec.

Add a quirk entry using ALC256_FIXUP_ACER_SFG16_MICMUTE_LED, which
configures GPIO3 (bitmask 0x04) as the micmute LED, identical to
the Acer Swift SFG16.

Tested by manually sending HDA verb commands directly to the codec
and verifying that GPIO3 drives the LED while GPIO1 and GPIO2
do not.

Signed-off-by: Naser Al-Asbahi <nasserqahtan0@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d720565db..d870f87a5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6717,6 +6717,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.54.0

