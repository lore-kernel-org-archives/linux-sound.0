Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35C12BF1B
	for <linux-sound@vger.kernel.org>; Sun, 23 Jun 2024 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719141924; cv=none; b=kO146w9IrioKKDWaF7W/DL7Ei/0lMzmexUCYxqOz6k0cMK3EO8NDNN4f5AFFSemAe11TfYRbNPpwg3IhqrQUSV0qvoKuRdcyNeIVA5hBEmeKWVUdjo2WNHkgSJE77OzuJdt3NWEiwIkxmzKsp6fGq359XIJGAMLvOLK03Ljgrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719141924; c=relaxed/simple;
	bh=ZMWAmWV8up4drOf25zi9IV7KlcBYT0d1DWHHyMITiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJulpW1kUPqUafeQuunuxNwY1Pn8SVwIJ29lFHBuDrHlLaGehgsaKnbCORqk5CaVVZCIQnzKDL1iXzY4oW1WjiyVOtr6iFlnZothOQwcUEi5Rvmm7M64R85QEk784eupduqfUj373dOMHd8IHxuK/1OBYh30rDVKly072nv6tIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWSM+c+7; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWSM+c+7"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so35930161fa.3
        for <linux-sound@vger.kernel.org>; Sun, 23 Jun 2024 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719141921; x=1719746721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TM5wqefDlS7gFCtGhpUpD2P4DkDyCARFRLweAG3MHho=;
        b=VWSM+c+79ktFyQJjfI46gGCikDrWQLTjLQMOTKKJc06g0gKXLRXKR3QmmpxatoxgwC
         8uWJmGilG6ld07lj02OU+Ud1tUgJ8YyG8kzMhA/bFJFrsVTDiYRg+V9E3mGanXk+Q3Hj
         9+HZ7H4imjwOlbMlLBLQEgrbYYLI+HpqIlXKjLEXEHf499QN5fSWsur2wOBpZYENNz/q
         hqem1cJ/tK11ttbV44INfZxAOU6GbkCn0PDuY/Hf01Bgb0fYe5nz5MyhQug5TlE6iOci
         n05rpfhooixKV9m8c2lam8bbcj73NqG7WGE9mAhLUUV0Ek2gTKf9fkR9p/mELDtPNKlG
         ZZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719141921; x=1719746721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM5wqefDlS7gFCtGhpUpD2P4DkDyCARFRLweAG3MHho=;
        b=oGJyvnO7Ns/D66zh9g3yhrPcIUBtqRkTJxVNte/5/PFCYGpkuGVuffaBZ3iDXMd8i2
         GClm+yb2kGUgnaJ1iPEWLf/aVaoLtScpPRFiccJvfzQaKvVGowgTN3l+vQ8f8igUgbhT
         tL0XXk5sdVSWSGEccNQN8O6DbqHi+tHjzLgCoIy+vwahBs33ZUxQpMg0Z5jMKWNhmuyF
         OI/qKXAhkasfnKCl2YRiSZmeQThEh9iT3mvZgyZAEeibLnGypAWK1BJHTFJboo7NsAEH
         8vwVUUlW50mlK6mKElP3i2VEeuHRjO0Bmr5m1iqqmpg+n1RjWr74U1vFy8aDSzVgwGev
         R4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWin7S/FnmsrO7LDiRgi9EQQuTuqjmN6kwz+fWse9wfah862KqVpraCK9phKZc0QUyHiuxE4hX525e4WKBbTnqhfpS8dunJ1giww0E=
X-Gm-Message-State: AOJu0YycJlf4ItnIxiXCmsUVqcP1WW2GhmgtAGIpKKDGS3GJTVx/epU8
	ILLmyGDHnGrW4oZ27T7es4jYcmp/fkUw9OjEwc6foSiyO3EFjpid
X-Google-Smtp-Source: AGHT+IG12+0wswWogqtqNoDxrAzdXKWaB2v/PRI/po8Zntcl0VAu3GgZkZjX5aOtRXsOOMVmk+O/fQ==
X-Received: by 2002:a05:651c:2109:b0:2ec:5f85:61ca with SMTP id 38308e7fff4ca-2ec5f8562a1mr4914141fa.20.1719141920988;
        Sun, 23 Jun 2024 04:25:20 -0700 (PDT)
Received: from hplaptop15gw0030ur.localdomain ([176.59.196.14])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2ec5357b6e3sm4885031fa.45.2024.06.23.04.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 04:25:20 -0700 (PDT)
From: Aivaz Latypov <reichaivaz@gmail.com>
X-Google-Original-From: Aivaz Latypov <pngdrift@mail.ru>
To: tiwai@suse.com
Cc: Aivaz Latypov <pngdrift@mail.ru>,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	Aivaz Latypov <reichaivaz@gmail.com>
Subject: [PATCH] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
Date: Sun, 23 Jun 2024 16:25:02 +0500
Message-ID: <20240623112510.81915-1-pngdrift@mail.ru>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This HP Laptop uses ALC236 codec with COEF 0x07 controlling
the mute LED. Enable existing quirk for this device.

Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f4454abadc8d..51225c5770ea 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10067,6 +10067,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x10ec, 0x0236, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.45.2

