Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A20A126C1E
	for <linux-sound@vger.kernel.org>; Tue, 31 Dec 2024 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735621290; cv=none; b=mu8BEsGZhsNJeXx36Lf5FMFXrX2CDijqz5Zt5ZJ4z5seYnpIVij09BiBYOb3x31HtXLh/DQ4ibJI295xNW5i3JSZIsjKoJicoz0+Qoi4tOPxZOX6qjOGciqU1MF7DXBZ03Z4UwxjelwULvvfw/eZQnZcg25MNS/FcDHr3aOsxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735621290; c=relaxed/simple;
	bh=e8ND6v+Weul0tLHRFqeXGey15CC7KBUR1EipLA1namk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1x8bOPf2HUDdwW4YNrdIi0iqva4/nqSdzRaSGcuCgWjWF6Nto8TnP34y0pAqMl+rNq71H6uWLA8upYSgCi/DtNPfNqVsJmlaGssDJJE5Ml1BT0Tr4BWddYoV8p/265cxttu7KyeHtECWLYPqj2BxtQGOlMdCSz5+ikLqGhF2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=UL7mQELt; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="UL7mQELt"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21644aca3a0so34860865ad.3
        for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 21:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1735621287; x=1736226087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P2LFNWWbJcIMQpmz7Nk/YKD5jQ+D+1vzZtaYMRH550=;
        b=UL7mQELtVdU0tuyV4jMl1n/e32BnpDNsOhkGck0VhMRKtoDEe5CTDevF66igYChnTd
         DwDbl46MqaGR2/L51KBCYvfO7FwfSaVt2NtoScKm0GxEf8kEprkLmGtSal3+LdvVSsYA
         F7gFUEK5rpsZpbbv5G1ML6t6itUi7IY5lzpaYaN8Rl82mKOxEGmG5/OKb7+9BVRnfPY3
         tuCagbbQiNsWBWKgUHU8FZUI/b5z2UVHu+kkwBxNSMmKmYvNEX4qhCHbxob31G2t6uMw
         ihpZk/Gj07nKt9IcGcyywn/qgnxKUBF/sPafZA4LjFsJFj445Kjrss+4WXBocIj4w992
         3e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735621287; x=1736226087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P2LFNWWbJcIMQpmz7Nk/YKD5jQ+D+1vzZtaYMRH550=;
        b=CoUNzgH7e9DIfqidK8WN241PDwTzdjcvwcgxAct53GIb8gR459utuHTlcc/MHB6XLI
         sRgjc93JAhkspN5mxd0+ihux8cHIVT0DFdTGewr66ugsiGpcgg0RmB2gjgUQXsq461NL
         Jj4iCLhw+Qz5/e+fugEbk/kaHxYS1bu5S3o8DTTj3v+55kMc/NeZ6dQ5bvvcEGqEHkHq
         L1SJI952QEhldzh6eoh93lSVPng8i+h67WrjZAYHdQpoZCq+RqHL8D8TB6CYtXJkleLw
         QT7UyCvRIMLLFV2LNQvqywK44lSOSXBUUwNrBQaN+cZtiCLMXOku6YC4SAyn286771nR
         nzqQ==
X-Gm-Message-State: AOJu0YzdRf1XX1qcKlByGkGAT3m3bYF/GDjcU9gja9CnpgiT7Q7NdC30
	isk1bFkVKqJnP6aoB5BV39lUKpXLfnfjm1eRoYZNCT7qQW44ZF5YHIXpShLpB12soA2gHA7uIFk
	7
X-Gm-Gg: ASbGncuvR/Nxl9bvNh8dl1rOcpP2jlhm33+yBut0fgkYkm8NBNCkHXoHfYkWmirh926
	N/vw20JaIkPWQypIfZr8fck6FMn0YXh+TtcLRXoRFdiAzLxLNAKr9XlV8i7vYK5vN10xFUrgvep
	AWYzZJMKANCbMSyTcUbEnRZdMOj1/vcoKU0V9rA5oyfvMMgN4ea6E+lxpaFlfovxIvHC8S5ZpQe
	xFEt23Stn4bBofu3jBQiek3yYxZ1udBJZwyhltlKUZfE0d/z8cPbVhsR3SOQsDew+kQUCUl3dhp
	dFOPxhWmZhiuMM0RtFEBVgQ=
X-Google-Smtp-Source: AGHT+IEq63mce2em5YeLhtUFSv7GJcqZBk0uxnG40XrkRjj/BXP6W8Ac53lSHNMZ2OEcEGkRDWATfw==
X-Received: by 2002:a05:6a00:22c2:b0:725:ef4b:de33 with SMTP id d2e1a72fcca58-72abdbe4de8mr47881741b3a.0.1735621287055;
        Mon, 30 Dec 2024 21:01:27 -0800 (PST)
Received: from localhost.localdomain (36-227-245-30.dynamic-ip.hinet.net. [36.227.245.30])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad8db637sm20064948b3a.119.2024.12.30.21.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 21:01:26 -0800 (PST)
From: Daniel Schaefer <dhs@frame.work>
To: linux-sound@vger.kernel.org
Cc: Daniel Schaefer <dhs@frame.work>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux@frame.work,
	"Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH] ALSA hda/realtek: Add quirk for Framework F111:000C
Date: Tue, 31 Dec 2024 12:59:58 +0800
Message-ID: <20241231045958.14545-1-dhs@frame.work>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to commit eb91c456f371
("ALSA: hda/realtek: Add Framework Laptop 13 (Intel Core Ultra) to quirks")
and previous quirks for Framework systems with
Realtek codecs.

000C is a new platform that will also have an ALC285 codec and needs the
same quirk.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux@frame.work
Cc: Dustin L. Howett <dustin@howett.net>
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4ba9e647250b..ec9d7595dce1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10978,6 +10978,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.47.1

