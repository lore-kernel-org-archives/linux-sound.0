Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFC44683B
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456078; cv=none; b=rqscNTI3lyEdppemwiyK5i1VAV1t1YORIajCrxfdVOmDKN110O/N/1tClI7X/HYgqNf7x+Ia+1nynlskjjQKyG3wrWe4d7oc0F/FDBmhsn8BEF1aWqOPvghDdaIV59C99urbTcGhlvQLRtq4DwUw568O6OxMxw0C18OKnBcDRDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456078; c=relaxed/simple;
	bh=LXR/agkvd7hUFuh8iS10z0LlWQD0bKHkPTKqEy9zZNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/NFKZzjNzWaiyN+cjco2vTz94s3GmzUNELyONIqrSJWjEGJ25XipuYtdMS9vREJ1r2s0iZ0COixCyiIQ329oWJXjSY7KutsTLGRtrr4MzPy36sv5/mN8R3A8VAXbu7TjSZ/Fyn/GO7VoeRBUbLJH+DbgRd6POKmKcezz+bq18A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZEnCoam; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZEnCoam"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe377a217so559417f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786456061; x=1787060861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOtXlVO88rvLCfrBY2eQG/983afIPTt1XL96VH1Llq0=;
        b=BZEnCoamFLETumWoJQ11zL2Urelf+r+S0TNCwL2mdGeuIFQAH4AL6uK6jN5vWDvbmU
         zGmDpj8nCfVsJkaKWHNOzIolGHO8AvVgFDVmFd05zPQ2vXENJ/FhsrJ82YrQbe9v2wV9
         gXB7xDpaaLqHTrXIX3nBSac83H0G6Gz5/p36WgDbgPi4GIMbuAvoZ+ltLymEwqhA/RqM
         S4FOMIpJ6v+l287TdYClJPTtihoRAiLEowzsDJ2M4v5AyxcjLNEvuN34XmkOuu1Fb6Xt
         qIJLXijG/Q8xKdYOHWjIr2epfJCeuxwW3GYLrcba4aYQBu3UgjCSa+3g4krCAUzu24s/
         M2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456061; x=1787060861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOtXlVO88rvLCfrBY2eQG/983afIPTt1XL96VH1Llq0=;
        b=KFEyqrCProD+b31oIfpeK3uLB8ayDIFnFggAreh7bUJFrNwvvwgVQ7ExqaYrUkR9Xh
         TBt7+14nAutgBE/VG2CQstLs93e1fYi1MH4ynld9AjfIZc5Uy7x/hqgq6vd0c6M5Ifqk
         icq8wckVOekuuoc49Md5W7fh2V23Ea6ByJ5YGVHd62I+txmtssxj3UbK2RhTnoNTX793
         UzHEphyIVcH/S4e8xP6UtEuZMhmL23rzG9Ziw15De6x/vMvPKqu0PvPQJcsli0EiCZUR
         0FGgOSZB7TF/QG4EBNUapgNA9o+nmU0Mlm0T4fOrORm+5OwwDzvR5BnEj9dK1bD4fQ/s
         629w==
X-Forwarded-Encrypted: i=1; AHgh+RohFAOXH9UyKD6wwZdCaj0tCnFimg/L6oAa0KxHM8CBFA0LC1wwOPYsLis07xjFlXGHQjGUiAA7Gz6t5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQjY4pfl3c5qAaLWvwV+C3+LxjFFKmdnkOajrMMNfPLvdldZx
	HY0rmFPBbuOs9BspfOiRE/EOLmEXMZh56KI99uExZo6ds0fOpVJcjnS5
X-Gm-Gg: AR+sD12U0khUvcUVv9QEDEicg8RLRRis2KrX7Bkv59/WOg/ABBvd1JCVvCVbA4LncvL
	pfS9P12GtjRXyiYqf+xWobCOlVDFim7yeY2w4qubodfCX5jrjCLZoTzH3iogqCaNAeTQZgERV3k
	Pvtl4UBFaN2b9z+47ncKHhPT06YI4pZAwx8n8xA/l3xLgBBfM+iQBSKXqf8wzzW1hyQ9PQlnFU9
	o9c32XAXhfox1qIKFjNelviqJEteopjuXolqcxk4vMQxK+otYnQCeaACof0OenFQ71SSZo0MVGq
	JxlJo7K6ibRbn1HIsjUUFZzGzDqixS5obRo4dFRVTX3E8pdgrT47PpIEA/Ze8MWLl0cXcZcAv6u
	AY/YwekTgPBuMG6G3cSm5+bwyNkRanMNn7BPe53qbwYV2hfvi9dTRXE+sgqjHlKUgqzyDbO1k1a
	47yzfOPrjMUn04lGK7U3H5t4A1wIf9Uifmqc/ribvtC/v0Zy8ZZg8kMjHCPn8Fy6rYUue+7k6gt
	wY=
X-Received: by 2002:a05:6000:402c:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-4814fda3b30mr617328f8f.30.1786456060427;
        Tue, 11 Aug 2026 06:47:40 -0700 (PDT)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be110sm4729673f8f.10.2026.08.11.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:47:40 -0700 (PDT)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add mute LED quirk for HP 250 G8 (0x85f3)
Date: Tue, 11 Aug 2026 16:46:34 +0300
Message-ID: <20260811134634.35795-1-bramwelbarack89@gmail.com>
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
v2:
 - Added technical description of the COEF bit mapping.
 - Fixed spacing error in the quirk entry.
 - Updated mailing list to linux-sound@vger.kernel.org.

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..74af2f9e26af 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7153,6 +7153,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x881e, "HP Laptop 15s-du3xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.55.0

