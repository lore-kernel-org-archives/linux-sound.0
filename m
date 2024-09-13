Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D413F42F
	for <linux-sound@vger.kernel.org>; Fri, 13 Sep 2024 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214474; cv=none; b=aSIyLgzZlslpA644MMBhrarf/OYXP/jMr/b2jGw/m0O1t3SEaoqB4dhFpGjYHBfukSUgfuDM32xtbY7ex1g5fcWApSKIH9UC/OBSVB2MNGaQhoxe6w/CoSV/OjGAf6aJJEiPedWzP6ziIH+btAT0mlIBMfEhaIno2xHAR4z5wuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214474; c=relaxed/simple;
	bh=eWLnKrQkrZ+B/SKNWhAjMfO1/5Hy5j7niwLvheXwQqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qiCTEFP2/O7odXqVBbAicIImznRK/CokVhQAd2cuImapXozBUFVKxzo96kYZMA+6+9tHCAXni3db77vmnIKu7xpbMYKzyhz+izaVrx5EbgqHjmm4UoxlxUNUjfEvnIXLABvjY6O1Tze/2T/AmjxNYrMOmg6fjka9Exc+cv2NyU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso1006735e87.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Sep 2024 01:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726214471; x=1726819271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIzY/aaBrvBYXk8dzt3X3eBihzm5v471H/ZnQ+hGGfI=;
        b=lHkhBwyJSzBmVS5wtUH0tl+QYtqWO8mtlOQwRFwp91wjK4YMmXSOYnphIAROU90YoB
         9r8UtfgiPiAgF8AXusMctG65CUoaulUwOTJkbu50ESrwmBW5qO1dvOWw8UfRjaxRFlfJ
         C5FaeyOg3NhlpCMqYjd9VYJOVDlCz8WJr2aTFGpHhLXI8e4Rb5yKRSD5rGUgNW23JQ5D
         RSJyUw2j1GELqLYc7ugT7+uXDIyRYhuNZtksC+V/tybNWtzu3skzX2JUAzDk1lDp2Xkh
         HBIoeWE/YdrczJjoU0OmgMZ8EcImLKTd/5r31NZ4AibuCk7nyZTrVr3IDOnONOrfkxoh
         SXpA==
X-Forwarded-Encrypted: i=1; AJvYcCUA6H9TD63/DZDHoFWO6lmsDhyIu+syOJTol06ONXwJMe6zNqJvTDGm3NtvafoXLHMCiOLkh2p2H8KgHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrePQxmkvxC+MzsaKlEeVYI2b7m64EkVGlHZ1xAfHYjRZUwoUu
	amYqM0J4NBycWwZgz9gdwFPY05D6jFUEGV8vR23exxolWVL6168kWUlW9fZD
X-Google-Smtp-Source: AGHT+IFBkrZ4A5arvntCaMlV0V98RFKj8WHTBVXozIDEjiVg/Aaltui/ApCZ5x3lQS7pVbkNDlRGug==
X-Received: by 2002:a05:6512:1247:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-5367feb95f5mr1364287e87.4.1726214470564;
        Fri, 13 Sep 2024 01:01:10 -0700 (PDT)
Received: from galaxybook.local (82-183-24-76.customers.ownit.se. [82.183.24.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53679a21650sm537927e87.8.2024.09.13.01.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 01:01:09 -0700 (PDT)
From: Joshua Grisham <josh@joshuagrisham.com>
To: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Cc: Joshua Grisham <josh@joshuagrisham.com>
Subject: [PATCH] ALSA: hda/realtek: Add support for Galaxy Book2 Pro (NP950XEE)
Date: Fri, 13 Sep 2024 10:00:55 +0200
Message-Id: <20240913080055.10807-1-josh@joshuagrisham.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Adds support for GB2Pro Arc variant (NP950XEE) based on successful
test and information provided by Github user drewdrew0 [1].

[1]: https://github.com/thesofproject/linux/issues/4055#issuecomment-2346890020

Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ef6d9ac28..4ca66234e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10639,6 +10639,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xca03, "Samsung Galaxy Book2 Pro 360 (NP930QED)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XED)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc870, "Samsung Galaxy Book2 Pro (NP950XED)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
+	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
-- 
2.40.1

