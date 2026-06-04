Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7807426D37
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578925; cv=none; b=tAhWRkdBr1LUHSntfETt2ZF0au1czrCQ/lxseDdwIZ89/bsnO4nmY4tY02OtfVkbTgKSKoqJPkiCuxXL0D01ORymj+xhbSBDveQK2a/r6LkPQFHYqoGI76H3D6ShqYZs56QtYMrqhR1Q/Vo2EJ2B/ZZ9pnuZDqFH9GqcjUGCoPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578925; c=relaxed/simple;
	bh=PX1Js/3zvWR4Ese5jDE6K2t9+uZlMH4V7izjEaFNoQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZaB65ubm7qqrbzPiLWAledHGVP4HY5fEUnKjvyuIvr8w3q/dx2Lu79uYPv7LSD20rmCcm3j/iIBy4dduthaiZkz+TEtNjRftkNmAJ3YvW2i0OwDKNWphScOtJTOHalOPhU72CGyyHrE9IJ4dA19ozXm4zj+R5IsfM053PlyqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nymtjo4O; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nymtjo4O"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4600cbb06deso404133f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780578922; x=1781183722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uby14OwIdVW4k8F2NJV9+wRf4v9W+0pNeX7ztbx9q+8=;
        b=nymtjo4OjUhjED038XrvSVcky8m6W7qowI+mA+zaqVqMROeIHGWIEfZFY7VTeDOmsh
         K6HP0tXuQqmC7lfrR9n67jSCkosj9A8WzW+hWXX0xQBleE0fsi+FN9qVIa3JuE+mvncS
         VyvdsG3r0CpB+QbtYugS43l3c1Scp/BxivL41yI/+eBuMn4AjdNd3RHEGyj6we3nOJp3
         6Kp9hWmfenjP0G4BmZslIpkeUqtQSuKZDeCMBUi3Gp4LijnbtvYHnPsWLmpPpmLc6Ksr
         ogpq4KWp9tsfgYaDKwJiLoOVCGpGjBIgwMP63Soi5SZDJ770jzekVHCVuOZC0MX6s9Ui
         BnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578922; x=1781183722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uby14OwIdVW4k8F2NJV9+wRf4v9W+0pNeX7ztbx9q+8=;
        b=GpyrAFytt388YZI6czIkG7Fc0gFMImifceGjpgEI7WDU7Q80JylRkUT6ZXcx/N1aB2
         s+q8GUR8lFcem7aomKMmSVI6R3OuoxEiG5UdU3W7yGbbi6WSoodrrLC0Bzc73OeCPCBg
         BJBcphBSiHeA872t3/WXEFKw96mLomA+0uieOB1odapePkJEaYG6KwceXwTSiMZZ+yah
         /Sc28u3rY3/LjiU/mkaWHT4v6VHIfdk+vX0ZDdUsO6Ys5sZ+Jha96KZQrgYhuEUGL1AZ
         /bAlKpU810teN4VJiu5yeWV8F0sE1E3rY7h1JYcXC9g+Qty1pC8SQ+9EIuYTYBhRRrpp
         we6w==
X-Forwarded-Encrypted: i=1; AFNElJ9CNy8b6UN4Dbvp99msfJDEoL3hYFhUa7nL07anvEAB510s5LRR9sD2ZwuWlHfU8DHtzLv0t5SC5rFt4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZySBxfsAtE45764hfRepkjjonQZBo8AZu6p/gjnNVVDMeGXH
	bRB8FX1kj1xyTuc2wWSJ82iqt49fGfpde8g9lN7En0v10ExXk8UgZZxo
X-Gm-Gg: Acq92OHfiICfSC7GmDgMClwDvqmBLEeFP6R8rzfo4E7YqQDMT5BJHVUmSX/MXPRmstT
	fZ+Wb+pR0bTwrIu5+4Zk1NnUgNg/c5pQWdlCEo09Y7LhD6SCaYnJvJmgBjwI2pp49A1/QSj5FMH
	Een1MBNQqEcne+PmbqMPf+foxlowIUkWxhW2u0gebcU2217sXp5axaGm+to9kyHKqzzuD78Gxvu
	3BuJJlry0WP4aDxeAlkvDStlP4gb9uWSkYNRkVMZgimUTDUrGfhoeRD2UZpPJ87ya6Ne5zxsewY
	O7kJ3Gsi9HE8xbQJRCcbwKVVsqpzF2uN6bFe38MF7IzuIIVr9p4AVx54Knubu0DgVhlIFBDAsep
	MbrIGsJKzo+XKgncv1AcsJ+66P0wn7geN8aKl2Ja4w//R20VU6VAoYexTSrPM7iWxXy91sT+67m
	GOxrNOeOtdz9r7s3aoIdfQCZjJajIAXJ1sr5j9P52duz4DNyqnm0NEBzhvCabOZrBiBXCSwygqu
	FRPjvAHYGNYhLNaoYtZ7uxZlDtv/n9wGQ==
X-Received: by 2002:a05:6000:2082:b0:460:1c93:6eb6 with SMTP id ffacd0b85a97d-4602743465dmr5773003f8f.20.1780578922055;
        Thu, 04 Jun 2026 06:15:22 -0700 (PDT)
Received: from macbook (178-222-30-44.dynamic.isp.telekom.rs. [178.222.30.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm16849569f8f.4.2026.06.04.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:15:21 -0700 (PDT)
From: Denis Batishchev <ii343hbka@gmail.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	ii343hbka@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6 G1a
Date: Thu,  4 Jun 2026 15:15:18 +0200
Message-ID: <20260604131518.45993-1-ii343hbka@gmail.com>
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

Note: I don't know how to fix sound-mute LED though.

Signed-off-by: Denis Batishchev <ii343hbka@gmail.com>
Cc: <stable@vger.kernel.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 78a865709..8eebf9159 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7274,6 +7274,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

