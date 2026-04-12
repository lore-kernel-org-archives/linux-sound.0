Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1443147
	for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776033834; cv=none; b=eVFeVZF0fqyfgWGAYLLGZNwQypDVqpl9K4/XJiWyOyOh6K5Gu8mufkM2W2111mvi0mH60lMyOPTuvxBIAya5PPunywUycfepOTlSGQwnCp94kgiq5BbBBh6c36/679VeX4yb9FFcB090svz5wVHZj1DWi4m9Ti2/t3JCHjh9xK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776033834; c=relaxed/simple;
	bh=ngpzGrqx9MiUDMn95xzAw1l75BDwjJh3cnXU1JsI/K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6MY8PxnRDTSFyqKT8wNukuy4UsJqzCupFNlDWdVzGdq3tIgA8AzqSsS1ho6vDF/PkC7LpTpmAIfnnTATczkK5wxdohhcDNHhTL4D0QftnB+ZzWInQpvgte2Rui7AfDsoS3jDwqpprnDzcGckjJ764x7cibD7drRRnz+jo44dXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB+pY0qN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB+pY0qN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a041eae5so26850295e9.1
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776033831; x=1776638631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMyvBf5JUvtHlxKynXuZ7vXIAHL9SvTb8tjFMPI/6f0=;
        b=SB+pY0qNFxK1BiOokfeKkaQv5cDOY/Aejt27wIUpNhKtKG5KVq39JSVhjmwyJIozXu
         eTcVsWjL3HvKTVAGODR/0cDbVs5W+5IghSDG31KNhHyStANdfvOEhp4WD73USNHFY1+8
         gIudKarsdgcteChUGrVkk3wAj+qoG/FA5nIecBrq6iRPwX7nk3Qfty0wlqxHMDSMxuiy
         LlH2xRGL22JVBAx4qLIVLgUovWV5zLKPLV29oXRoy5i1+pQ3l1VlD90+KLdeyjFnDE6g
         LrCXfkL4mngSXBcozZkAqNcSLVcHf/5cKhPmTuSCtVA36QfZfX680F9umhCjLpQa6xMp
         gewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776033831; x=1776638631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMyvBf5JUvtHlxKynXuZ7vXIAHL9SvTb8tjFMPI/6f0=;
        b=EvE2bQE5Tn3UKMQYdhL5UwZY72xBrgXuNiwA3Ix9Eb36L0lwHhx5fTl553xuy7lOLh
         Ily0FaUsD+ZUc3gC5gvRKQTfKRDu7cgDTJMHpxHWBJsyGkMfFf1cdnnVWTJlzSN/NLaw
         NyteVaJl7HUXpzwrZFIhmnz8xUDj5swsa7zfpUOzffAgZXyZ6GhVDsTfSbkOO4DUvBnK
         UOWH7DffNxcU0AXlLqKm45ZHqu2dqVLsqU5CpN7sGr1oBrb9cH/zkbTbW7YJ7gPcotU3
         t6UEubcYNTx8yRRYTAHlA6+adYLvWTTqzyymCkZozV1s2zoM9rVv9Ef8fcpGxBCTxX66
         7d4g==
X-Forwarded-Encrypted: i=1; AJvYcCW/PQjJVISihahm+IVtDrYksOGfxJ46Y/27Vb3d9zcFQ9D/aIjGkmpQzPZ9XRsJ0K/1SI/wg2DIg40KrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1b7bd8FGNlmvNArQzAauf7UWxCU6AMHUI6466R35cJDVIX7Rc
	3H7jqI8oVtJ+NFl3yRuhAEuLpRQ5CV1m0aznQfBs7j/E8Fr13FpAx9ey
X-Gm-Gg: AeBDietHty3ARQdzlnz1pRgBNRd1G8NAS5sNiwS9qgBkkFnITQB8/euXBJL86oCFhuG
	dljz4xJfdIgFAjcIutVvKVr2Z5pWQRHtUh3gPxC88Kb3ru6jJ5ib+TI1x15j+bSDsD7x/G2XyQo
	a0/IUYEJKAy7vD5w10yE5qSuqvVK7N+4fXy5uJrYS7bdPBfr/KalTOCz7LPymPy1YlAHeSUPPML
	ezCmjnXUCE4HnSd2qSc0QFQaWrhL89jU2QqdqfCTmY/bDMOV1gw4cfMdLXir4D3ezfkmn4iX5/N
	qLFpigW/DU1SPWLl2ytXQAxuq1IkeMttDkj96wzOJeo3rdhN+XRw2eRJ14UhWgfWcq+55G9BKwd
	Z12WLeijd8Fk+KVrjXs/VMfgMF2Z/RRzZiLnrSDEntfZGrJ+GHSAVGzBy1llYn8tkua1EIYVuUC
	qyjmgwbp+hnaUbs4Eo6FHrH2o=
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr139993705e9.6.1776033831192;
        Sun, 12 Apr 2026 15:43:51 -0700 (PDT)
Received: from toolbx ([78.83.170.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm29421746f8f.27.2026.04.12.15.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 15:43:50 -0700 (PDT)
From: Hristiyan <hristian.anchev@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hristiyan <hristian.anchev@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add support for HP ENVY x360 Convertible 15-ee0xxx
Date: Mon, 13 Apr 2026 01:43:16 +0300
Message-ID: <20260412224316.29010-1-hristian.anchev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ENVY x360 Convertible 15-ee0xxx (PCI SSID 103c:876f) has a
Realtek ALC245 codec with Cirrus Logic CS35L41 smart amplifiers
connected via I2C. The BIOS does not provide the required ACPI _DSD
properties for the amplifiers, causing the speakers to produce no
sound under Linux.

Add an entry using ALC245_FIXUP_CS35L41_I2C_2 to enable the
internal speakers on this device.

Signed-off-by: Hristiyan <hristian.anchev@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 45f9d6487..d05c0c57a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6919,6 +6919,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8756, "HP ENVY Laptop 13-ba0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8760, "HP EliteBook 8{4,5}5 G7", ALC285_FIXUP_HP_BEEP_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x876e, "HP ENVY x360 Convertible 13-ay0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x876f, "HP ENVY x360 Convertible 15-ee0xxx", ALC245_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x877d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8780, "HP ZBook Fury 17 G7 Mobile Workstation",
-- 
2.53.0

