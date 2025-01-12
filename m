Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233EF1B7901;
	Sun, 12 Jan 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687614; cv=none; b=V1RjFN7zEpaE44p4Ax7dcGW4OsPLqNN/2JNoC4UnY2smkW/5UNO2jI1nfU7BqNVZTTW2WPbSGajMeOQD2zqkNoBESFAYr9/+x5s9RCeSpHDus4bHaTBL8gB1x9wZxHzKOd/FyTGO8HHe/UP7PCkEEUghM+gV2JM6TQ8JMMkkZmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687614; c=relaxed/simple;
	bh=8Zf02ADpuZFzYDvfEwm/VjWYqDZBeWkaj9lW8KPyL4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXt2+86N1gQjzVR7H2LfVLJ3cMpaGgqzze4YjU24bdz0160DIOAKRr1eIIhHNWEXRRt69Uy3UMKdl9vfGPTROr54ISdrrycMV42VszWcp1tytGxSqj9nsFk0yXTSWJuII9d2f5kO7Mpptyp8WLjUnTJCslNb+44g9dFgMQ77d/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGDvbPHV; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGDvbPHV"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2167141dfa1so59632295ad.1;
        Sun, 12 Jan 2025 05:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736687612; x=1737292412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKTn4cAVu546eZwMJZYVYJ0ebfadl/bUM0OrxlYrMOw=;
        b=kGDvbPHVBGPZhzBn1iz5A7wQzHQzm/v2oecGGIhTYghsRNQopY+nIT2C/5A4G90OwW
         mKkmkY1PafiGtxs5EaFzUBl+V/1eFF9QoQhac6HDOXk99LWW/NwyCH4ehDGekSIA84CU
         4Jwzjs4h6vk1ll5+noPVer1FcYIy970osAl8VBWtsnxhh/4m/wdWMaMUodokhyhcDewp
         TP7mMAjA4qUGEA2kVjSacvBv5qyoNNvWjSqB9wlChf5d6y8kAWfkx1AnunKm6EhuP2+J
         JEBeBunMpqw0PYcM3POFyeFoCXKrVmskQfLxbtEs/XhOdQ9ziZ9526A4LyeOu6TGGxkJ
         EEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736687612; x=1737292412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKTn4cAVu546eZwMJZYVYJ0ebfadl/bUM0OrxlYrMOw=;
        b=iPfZ3n4xfDrvaKKqljBQoRzRuM7L1TemK/b808qDcOKqwR7rxZjPfE2HDFrBq7zyk2
         7WCXQBtekqoqv00+57DHoTGWwI8fdnPhLKvx8XViKxZZuq0fvp/fzthWkYcFnEQss3yo
         jiqiXvKk2dQ0CNMXB5WyGu+cA4BAOhIwyCNvc+Qj5AAopqSGDoh+7IQr+4AO2yydYnKQ
         /nBDV5/wguQMwgUU0mvPVw4wBJmUGedw5uWXz5TUJQROXd61eA01hpMJ0J5/joru8qGI
         W+vsyAS60ITm5pxz9UUIuyLKdeI5bPVtHY8KIL4orU94BPNAuge3TPn+j+BpH0Skryuu
         uYAw==
X-Forwarded-Encrypted: i=1; AJvYcCU4rPbU3he6Kqq0R5keL83XmarBBzY3OehGzW8XhE0SQbLrDK/BO0BNLcawtu1CA1QWBaCBsG1x/F8Cr50=@vger.kernel.org, AJvYcCVcY8sqMaSYx/YmAqmEe6LTBKh5SG4GdYDw0icDSdriLkZxnhj+6MQKk8Ae4onFZO4UgJcGc0VyARcQsLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQ9oqPO4b9pfMQatJ9lAj24DPY/WOc7A08TalubTrNG3jtLfy
	K8SrmyNwpVB5VyuN3u/i8pLOBf6OND2LfdxmfTT64sjPBMGhc0uKUapMK1omSnthknNo
X-Gm-Gg: ASbGnctGYRXyy/XrkkYUl0wLY5v1VLR893DSymWdYhDs/p/3lqJr8xzxSeKWEg/z/U+
	Df8m0GNqqAyMYnIG27nAltnYAa/MheF7oR0anZjNQ1LfLN36vTaCIQG6cWuBXOZEnavSxvj1Wcq
	HJ1pHlAaSmH5VJJB8bUbvXX8OiHUfRu8l2mjYlccj9AA2TZjMdP+wkpnjU/P9LMHcN6EmSFKrG9
	hQ28+JuQasZ1bqhbYkmIHhXaYz/kMR3xw8ENy6i8viitshNThaX2isOtQWh9UZsDixdoA==
X-Google-Smtp-Source: AGHT+IEi7vCId6t3pUQ5lBY81FgkkYwN//6229ntT5BjfrZkWXxhIUv74JHaMvGfhOQ5v788jfhj6Q==
X-Received: by 2002:a17:903:234d:b0:215:58be:3349 with SMTP id d9443c01a7336-21ad9f4635dmr94475225ad.14.1736687612440;
        Sun, 12 Jan 2025 05:13:32 -0800 (PST)
Received: from localhost.localdomain ([104.28.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e2basm38425695ad.19.2025.01.12.05.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:13:31 -0800 (PST)
From: Yage <icoderdev@gmail.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yage <icoderdev@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix volume adjustment issue on Lenovo ThinkBook 16P Gen5
Date: Sun, 12 Jan 2025 21:13:24 +0800
Message-ID: <20250112131324.20900-1-icoderdev@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the volume adjustment issue on the Lenovo ThinkBook 16P Gen5
by applying the necessary quirk configuration for the Realtek ALC287 codec.

The issue was caused by incorrect configuration in the driver,
which prevented proper volume control on certain systems.

Signed-off-by: Yage <icoderdev@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 61ba5dc35b8b..000dd85f9f21 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10930,8 +10930,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38e0, "Yoga Y990 Intel VECO Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f8, "Yoga Book 9i", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
-- 
2.48.0

