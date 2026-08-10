Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A403D902E
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366337; cv=none; b=D37oycPNf3Au57WbdySvGOm8E3Ehj+c/u5Nv4X0LIvftyl74K8AbArJ/SetjGm/LbC0urRf33mkxRqn/DhEBR/7CXjUlpoywNy3SVPuyQQs3Wif7+M6f8WOvsj43TFzG5HIhwImFUkVCY1AlAkRMLR8Tc1tx0rGDFcjnJODDpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366337; c=relaxed/simple;
	bh=VOyVrKBxAa2NcHrazT98ZERt4p8INB92OTGM2dSWwss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDm/sbWSjSulrPGj/cZf2kVwMwkv7Zl0tvEaoJ9B5R0dPMpFWpQZHoi2NXfKBaI4V/MmJXwtfRLHDRJ02GrppTbLXMe05Hrr5xLr1khpWaUmBjdIbfM0keFeJWhX+2IMMUJK4BVCS9ubt16dFkletSDB5XJOe9wkC+BzrkByn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2jgeGZI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2jgeGZI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2074710751so240297566b.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786366334; x=1786971134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrlWuKe6vIOBZ5QESYaBmuJu7So7DiYov3AMNAyIE8I=;
        b=q2jgeGZI5MTh4MA/27xnFOmDuBldv68aHBZLoCywF2hOz+Ilbq1l2kyxA7Ax8foXn5
         piuYQpJ6dNAc4TLr+I0bAUCrKlPT+VsSgkt7mwwkemURTX2POk4hITWKk+uNKRbqCfzq
         79A2TlyPzVh+K/fOo8mV2HsnPL1moPCZgC+VyNSgrEQjfVCtlLnw2I0/YuTk60MEIMR1
         t9alDl7BniklwvoAFFpTIDQCKXk1X6Z8JHXP1JCXOTxxDFjwRWmy7S6S3AhhBKujZUh+
         g3LmoNBnO7x9Ebc6blbvLLnk5OyRiMW2yvIzU1loYwLWMXoyZJAALCEZ3hFVuBaRjSoz
         Sdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786366334; x=1786971134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrlWuKe6vIOBZ5QESYaBmuJu7So7DiYov3AMNAyIE8I=;
        b=dkTNEzfDL9DvblY6SmZJWRlpjhKP+dTrKHc0N4TaFGqomZV/EUkOin6ujsPGdPxAVv
         02yPzoSjfnoQ/Tv2+E8cxkV+FMz/pGrIEEkqZby8ClveIlntXsQtmfT7bbgohzqn0Hlq
         L6haoBOcDn3dZJkS9sPNYRiDPXtTwj+3BUHrmGbU1E2WgNnB7D2yxQ7o5TdfV18Q9z9p
         ROVDQMfeodlF0a/uLs/d7NmeADCePk3f2+6piguB5BEGt95VA3Cyonoj4cKDyFbJxG4P
         KWxlXvwe8eaABHaVRVWlFkW8B6d57yaBlayPyQgrNC+qwhczaulrmrhqFJ5appVrHMQj
         /5MA==
X-Forwarded-Encrypted: i=1; AHgh+RrEjEBKocUKkM/Qindb5WtJ75W685HbmERaXdn3Re91YXB7dPcu7aB83ZJSAGwaOAs7XnItQ2WpPHMtwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+N5LCKBqAQGjnxJGcbUOMA49uyuNnz4cUfsM8unnJQqVzzp4
	S9y9wPlZnqwr7nTygPtXR+v3YT3LY2ZVbzSeXyY3OUleSCuEGlgqTWssaa2LHmxv818=
X-Gm-Gg: AR+sD11myYw07AP6wfStMSai3FezFwGcnG+DIbIM0LUDCbQESv9RUpdfzmA3AEF/FwH
	7nsMocwycZbqXsnHnaod+Q+E9SbdBSCIsz33Xg31dsnFUVapmaKihjc1RRs7uZIm+0VEDkiVKhy
	IYED4L3aIZGAz1RGU+aikawgBJOUmoSLGhPr4idKLFkxos4vutTjNXmC9hKnRMN5WAe1odMVKDR
	WvsUCmD47bfYyJV4BMygjomHqrVWBOFL85d4FM5ydvZFYvjBREJ0Bm2hv/m/C+DWkLNIfO+zBxH
	6x+9tilh3CpLCH7mZ5O2KCBWLzSTkZntENWJEyqzy5+sRKP1ymVZeI9yGcxNDVnC26wmYagu5Lv
	YGDpMoOP35vLzl15z1x3cnVdymyWjm6pGuO0HctQQHVb9a35vlvzDKiZM6Vgw1WdHo1Jx+mnESS
	1LVChqBeMb/CaKUwlhFEPaFygz9QR5AsHG1YsuLor4kszoq8+jOgjhlQwZdUVRwQMMI25zaoYkb
	rCMXbLehDKXZijN050fC484gTAEwULQ1c8=
X-Received: by 2002:a17:907:ea8c:b0:c1c:257e:4888 with SMTP id a640c23a62f3a-c20c6a00dd5mr70166366b.27.1786366333844;
        Mon, 10 Aug 2026 05:52:13 -0700 (PDT)
Received: from localhost (polaris.rmrf.org. [70.34.242.93])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1fed756c0sm2535399a12.31.2026.08.10.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:52:13 -0700 (PDT)
From: Denis Batishchev <ii343hbka@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ii343hbka@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6 G1a p/n: AD3Q9ET#UUG
Date: Mon, 10 Aug 2026 14:52:09 +0200
Message-ID: <20260810125209.2014042-1-ii343hbka@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook 6 G1a (SSID 103c:8e0d) uses a Realtek ALC236 codec.
Without a quirk no fixup is selected and the mic-mute LED stays off.
It needs the same ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk as the
already-supported 14" variant (SSID 103c:8dfb), so add it.

Signed-off-by: Denis Batishchev <ii343hbka@gmail.com>
Cc: <stable@vger.kernel.org>
---
v2: fix indentation (per Takashi Iwai <tiwai@suse.de>)
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b36c730c..ef8beb928 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7542,6 +7542,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+        SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14 (AD3Q9ET#UUG)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

