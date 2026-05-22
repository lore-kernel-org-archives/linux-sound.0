Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E212C028F
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779475464; cv=pass; b=YAtXzFJ0z/TIY9im0QxgfCWR/dV6FkCx2j/rtuKVao4yj4TegBbD3FXoBg69rISOfz+lwwD0e96FkH7sYOmanieo77EfwEFATwelP0oDWWxwwUy3NOjYaCojye/EQ70hAr31CrwlTdzLo4kXv7P+Qrp1ZN4YbJAd87HEteFTMR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779475464; c=relaxed/simple;
	bh=eD3ZYCaAhJhCBAmSpID9Co/YQmGi/eAXTCxF87TB698=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QfVkOBSxNSFRFhWIVtApSDtorYGJ31lUE4GJ2YMUHvKKduwuRjcd9iqA8a8xmPFq95K7jL2KBFMyBjQyBakkIhdEaN5UWpiJqFm/vOzo3wPG589ZXQ1rtxQTfSkvBHRDko5lhqJSz265PibcjwbTsmq5UKr7YK6VxLV2Nv8WsfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkYmnzPO; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkYmnzPO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa2691db86so5907004e87.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 11:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779475461; cv=none;
        d=google.com; s=arc-20240605;
        b=UaoBr1ty/Juv2tmR03q/NVOld24C+qc4z0Z6bKtB9303/rXLQQNdBRiS3AnLtOkxuA
         UnVD+fbWCFlATKoITEr2gFcMVSC4CU2qswJVd3tdVBtvYjE58LlRo7DWDRlStSGO47SK
         UFBUuZpBr4VtjaIDXMV2x+j1VwER/I8M0Rg3KJ2CFme+rUNg/6dmtZPKfYrdsmhbAweE
         z1vwNJVvS6A2ST3THp0RVKD+ireHfNz0wHpTIbNIEzVJDUULwTV4KvowP4Pb57aEFclq
         9Pz/m3oc+E0scKOKaHh8ee4erGjgPk85wr42BY6YeLRkMWvUuMGxVXYsiDDU4caIOpEh
         eeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ha6+o3QJXbRykuAKksVhGRT7wl+R41lI/G04J23zd4o=;
        fh=60waNaQ8TusAo2O0PnnUUKEza1NZqLB69GMYO8U+qp8=;
        b=UpFMid1HlauS42ONhc9oJOzv0KlBI7EiXZ4w/BGvP1ZyG9LCIBIr0EdmvXN7tNrP4f
         3qa/Ad5eQFwhnBvY/QpmoIUEURGMhNLLxxCOM1yXGi5yQHNYllR3AoirP6yyoBnFY9xE
         yFxv0SFgsShZSEy3eIABmil+73PqaSdM8p1blmqbEGJ2Y8hBHEDnIQLh+QdSZtQYXUMU
         vmDiX12QFO3ZDcZWSpbcMqFfwkECxOWieaMzuDQBAIBNGz0d6k6qsCljzZTVipsf/uNk
         EjREE/G5ntlaUNwAxPK7eMxpeWrPeyjrS+B4vWEtTKCz9nfVb+MaU/8rsd2g/1WePM72
         M4Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779475461; x=1780080261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ha6+o3QJXbRykuAKksVhGRT7wl+R41lI/G04J23zd4o=;
        b=EkYmnzPOYhoQQl78q4FBYA3VnkjdOZV+VBHhua1P/zzRM0S8nDEW9iLuDyK8i/qisX
         bS5oOegb5Sjr/KmqCoYAnqbFhOGXw80S99TbU5ADR3aPUQj90cQc22mScn/VoHv9pnXv
         3dczwUddY8TioMkuebsabeJ5nTs6ADfRb1LeDYrkm9jqTH8inHIyC8L0CPBPqMu6yeNE
         4Nbn5DDEPVK7CEqPkBZx6V8InnyDQ2cypggEaE7k7OHQhnoqPtCGPGiURfPYgvzz+nHr
         tngIyJdRzSqwTvRZWBfrHNg8GzK12vr5Rb5fiTUkU4A1VS9ZgM2Gqkr2x1rZ5MWBmgGC
         xBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779475461; x=1780080261;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ha6+o3QJXbRykuAKksVhGRT7wl+R41lI/G04J23zd4o=;
        b=rua4PgHcKMbl14RZMsN7AN44vcTq8Uw/btI7moNKj1PG7iztYyq2kAvRmbNywWYyMJ
         YzO/ir1EJj0e2SmVv6qN+llC/WnbVnjONYwJXkop+iAT1KkuIfiN+48Bri8c9DwUy4VB
         tzu75ctLKe/p3hHeaLfBIDGPSxDBJMyefopTdPOXlo59tJfE4vAbhACI2qadn23C9oys
         1/gI0e6EXdArBbuQYu//voq/c88+Hirwi7e9EEpGrz3gjeqzdOeZar6OV/DsGAgV2rod
         FrUOvdSv1Uqv9np+a0WQZSkqtPxkINVFGt3RGbaDIbRgBG+0oWUqbsCDJCpNseaxayht
         u0NA==
X-Forwarded-Encrypted: i=1; AFNElJ8UYLi2nd/ZoQbJLWGrrX9zulGwe4cDpuCA9HzLcg/xvWQHrSUXW9LOmEMcTGiGQ+wrL14keXdQxjQAdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOiherEO5MTu7S/FYnP9YWCbMZJw8ryjGQj5+Tpu+lHore0pK+
	sgBBR1++mH21Qkt3QZmnCZ1LB1EZRaQlhXfnAJKd7OWsB527j67uhyrW8By7lWMV5eExD/Ya9zQ
	9ERJdSCw83ayXvfHPhNfEKPv2Web0jZk=
X-Gm-Gg: Acq92OGmdF6p1QQNTvRP2eCsB55wAnH6GEPejSJvWTkLv8qmYA2H4hEZOR9ENbyKSZg
	v8ZMaz4awv1Sl8BaWJ6AJjdJ73z3rACxGJIPoGJQtmNqW0abCwGMCaWrAejtlj3Fp/zEeai5Da7
	BMwc1j9M4TAWbQDFBIU8I1UKW2rWk2fmuNn/FfRYi3OiKreV/wIqLYzAPlKgm4TcrjpGxrXtp67
	ifEV6AA5ZSjk2cu9rGD4KA74Wmz9PDCltqX/lh2hRK4c8v0WxvGmsLT0xHpuFeCrKVwORSWE9mv
	DIpZFIN/Yw==
X-Received: by 2002:ac2:4432:0:b0:5aa:1068:6c95 with SMTP id
 2adb3069b0e04-5aa323a9caemr1119496e87.23.1779475460617; Fri, 22 May 2026
 11:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabian <fabianlippold1184@gmail.com>
Date: Fri, 22 May 2026 20:44:09 +0200
X-Gm-Features: AVHnY4LwvKesVcLJBmG3nSdLaf264oFWFkCrC9tRU19Mxhi_RHP9Bf7lAKzP3m0
Message-ID: <CAKrjPiXUi=_ugS+Qa3aW3kM=wqZKT+ssEVTGmtAPqeT6XNDJNw@mail.gmail.com>
Subject: [PATCH] ALC269/Realtek: add quirk for HP Dragonfly Folio G3 2-in-1
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Fabian Lippold <fabianlippold1184@gmail.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 0039d23937f4c2783dcea11cc09b26a788d09872 Mon Sep 17 00:00:00 2001
From: Fabian Lippold <fabianlippold1184@gmail.com>
Date: Fri, 22 May 2026 20:36:10 +0200
Subject: [PATCH] ALC269/Realtek: add quirk for HP Dragonfly Folio G3 2-in-1

Add PCI quirk for HP Dragonfly Folio G3 (PCI ID 103c:8a06) to select the
CS35L41 SPI4 & GPIO LED fixup variant.

Signed-off-by: Fabian Lippold <fabianlippold1184@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 2f5d13032..2c478d80c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7069,6 +7069,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
  SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)",
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
  SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100",
ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
  SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9",
ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+ SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1",
ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
  SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx",
ALC287_FIXUP_HP_GPIO_LED),
  SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
  SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.54.0
