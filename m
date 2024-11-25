Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057E190662
	for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526943; cv=none; b=lPFPrUjL4uOiO9snfcLIZjU8hQ2/blw4DD1IIW7H5tEDPhUwLmUs2cQKoy3P8vDLOyOyFCLWpz9dBAh+1UnvGjAIVHkHFoM5I4avWpIvqElsllgntdzwQ8hDty+gClgFiOXfa3ocMUQjB3+4Ov5AXpcEOq5nQYOTtbDh4I+MZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526943; c=relaxed/simple;
	bh=F10KJxR7PNSnEdwKCwfKJp/4Tba8ymx79+xfnqgKopY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HfcWRYNH++uK+TJ6Kbbn4cb/kkNAqC/FkGBHc4eh3hRMxVOyYE98BfODzTJmWJGdfzzH/O2iuatFxUggSf22a3rWL1vcxzz1/RXuODaCPLxXA42N5na6XuJd0UptptWwct1PSOsFi6dZQMndzYWe45GwT4DdB2ux/NhsvRefjdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5Dmk3kC; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5Dmk3kC"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e601b6a33aso2494030b6e.0
        for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 01:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732526940; x=1733131740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pT4XmQomNYhjwiddS/lwEk7pr9pCeB8cg9bUhzAkJII=;
        b=N5Dmk3kCWwmzpNhbP93FZsypP6624kJ8E5geWf70X8ZbPgm7SDRWz/mMkcBZyhOeP1
         oEbdmilpyoc3yk1SDy+z2VYVOUA2gJLSzFq3rqKk8Gk5XPlF3VMJUQyTUcZ+UKQaQiYM
         +5jhHedBN3u+qXvE8BCg6QV+eTAkGPJ4ZqE1Fj1mVDjz2yJMD/mbbOTUr3+KauwQFvrn
         72+JaL9msp048HS2Wxh6faG9dUM1wn7W+wSY7z2PIJgNqutoACzyqbHCAWQC09nKGPtR
         hHFjIcET/02Ik/CrvcSxP7vQEjBWoHrwM50iwcZm6J3rJ10zRGz6q7lshvm+xEC24r6A
         tqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526940; x=1733131740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT4XmQomNYhjwiddS/lwEk7pr9pCeB8cg9bUhzAkJII=;
        b=RnOtCXLNXFl67MheHV0pQvnYMkGoAhrZu1DDaE7heQBUO0rgcVRz4rBriVCFpQv8Lp
         ZMySCzQFn1nspkopGfD544mbLAc56c5txuzafqAF6vU7rj3pzHm4yfeLYO/NdfJQjEfQ
         90cDR9nE68mdJfCvU+gsyHbRHSkay1hFiHTnl8IL2zhPZzioXRl/x47lKNXnDnLAepcC
         t13AKkip0cunfJ+1J8ADWSGg8zmxcDoS0Bz3RcwgF9QHagiEStbTjccVmAommFlAJ4Qq
         nVy4f2O1XAwj+P2WZeVnZz3GUh0NGm5dBVemlQrzMiUXuMaLQ9yB7htJOqKAtLgpZu48
         ABMA==
X-Gm-Message-State: AOJu0Yw+N94XWkiItuniVAJto6/pa2t8cqsXy66Rvoo4n3Azbsctf7UF
	5mab2DKcfHqELn6+qByzawGkZGCzw+N10d72FK/QMTY9yc7+E9IRFA1bZQ==
X-Gm-Gg: ASbGncsRGlEQMIrWc6ZJ4ODobrJJYLdWS8pWax3dkLBtRRsoQL9w0Aez1aH5iJJ3Y4k
	+X7dejLlNQBEUvFIcjD/2/ZvvUWu+bUQqYt7z0AyrEC45V7DYpdAvaOJJu9Dv/9SiXMGMBTof5q
	ZVAnCNMv72HPP2DUPkhnTTe+F6GeytfW0FnppFcDaYwE00sZ/4+xZgE/Dyb2Hm5OG/o83GvnTje
	ulqCaD2yYs/ULmZ8ZNssd69kPwtN+6TV+y/WyRszNj+IuevyL/+gwOowY9sj3uJxF++
X-Google-Smtp-Source: AGHT+IFD0C07RXIGcF4podhbMF3YvdveDvY5+10JiONjivfTkum0ypg8KP+KEteNfpg8OpGFesaXKQ==
X-Received: by 2002:a05:6808:1524:b0:3e6:14a6:4288 with SMTP id 5614622812f47-3e91581ce1emr10559930b6e.11.1732526939971;
        Mon, 25 Nov 2024 01:28:59 -0800 (PST)
Received: from localhost.localdomain ([2409:40c4:139:aa08:e516:150a:9bde:d151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc218012sm6157331a12.37.2024.11.25.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 01:28:59 -0800 (PST)
From: Dinesh Kumar <desikumar81@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	Dinesh Kumar <desikumar81@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix Internal Speaker and Mic boost of Infinix Y4 Max
Date: Mon, 25 Nov 2024 14:58:42 +0530
Message-ID: <20241125092842.13208-1-desikumar81@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal Speaker of Infinix Y4 Max remains muted due to incorrect
Pin configuration, and the Internal Mic records high noise. This patch
corrects the Pin configuration for the Internal Speaker and limits
the Internal Mic boost.
HW Probe for device: https://linux-hardware.org/?probe=6d4386c347
Test: Internal Speaker works fine, Mic has low noise.

Signed-off-by: Dinesh Kumar <desikumar81@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 56a3622ca2c1..82c537bbd64c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7559,6 +7559,7 @@ enum {
 	ALC269_FIXUP_THINKPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
 	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
+	ALC269VC_FIXUP_INFINIX_Y4_MAX,
 	ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO,
 	ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
 	ALC255_FIXUP_ASUS_MIC_NO_PRESENCE,
@@ -7945,6 +7946,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
 	},
+	[ALC269VC_FIXUP_INFINIX_Y4_MAX] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1b, 0x90170150 }, /* use as internal speaker */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+	},
 	[ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10943,6 +10953,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
+	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
-- 
2.47.0

