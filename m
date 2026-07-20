Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91194C6D
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784506175; cv=none; b=D2z9mHshl3oA2izkgEXi3DfE3L0UCNpgc9fhJTRfNOicD9IKwK8Ws7hkPN+0NhQW3ygpmmaoaTU4hgUS8MBmeY7jAT5i3peq18VRoj20IW4mRLeqKe2IV98SBHoXAlNvIqcE+sfeVZn3AMF57hiUKsAqv/+u8sHm8oLkqAidPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784506175; c=relaxed/simple;
	bh=1B5nx6Zi3n99efkcbz8SAb5twJXQTnwPAszDbfWLjgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMHNFxrjX0RvhAxUaKcE5YRWIJhxXmxTl9evw0uVyf1bf/pKdeIcDYCcN3Ln0YOl+FWM6zwATmThbCIXRboe1XbH09Wc+SgUxHkvqnviQ4/bhcZxYykT3V8cjn/HRkjYizt9AColGRt1qGaBHIAQCul7Kb39fiOoucR36iQFiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJmJJGIX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJmJJGIX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf452def93so9449935ad.1
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 17:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784506173; x=1785110973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MTXEfjCsGKySnmNhd6yyr4V6U2qE/6o/lYlOr1lRnA=;
        b=MJmJJGIXAJYMYx83V7aeyEBcXTgRIT29/Cr45bknA6ADXf1/tOilgabW1cC6qajT+T
         gM/4XPMpi0dtnJ47uEyk1vzr3qxSemC8cqHRx/DZgsFddaFTc7nsSYNuySvUABWDLfEX
         gxPInPZAD+kHhyKTPXqjp42ToxR22yr+lSLUch4VNCIcilsbbtVg74yHvRdsoqfH0wTe
         kxcGu3XxnjM1fiZTOvyITeexjUQJks5oL49+TSiSEd2p+7mYMiwMZtZUAhavNnGQlteB
         izFagLtgBglsVys/av4cgh+2yhanZjv7jRIT86PBt9HbKnZ7vtvNSRbRPZTUhJJ7VWis
         /XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784506173; x=1785110973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MTXEfjCsGKySnmNhd6yyr4V6U2qE/6o/lYlOr1lRnA=;
        b=lkh70Hvw9WWCzR+FMp9vaMIeTWJA008djQGjiYQMuO3sXpT0MLEEdDk3MPY+Xec6NF
         tmXZiNNfW8+ZnFKzqDzUeE3gb59sV6GwaXSIrYh0qmSssLgPvySd2hmM7xC3LwKb5W6D
         G6wJcNwjuKXWHKa4HJzfTSBFIpoiQU8q+4gFxK7iaXA6c9e6QbzDpD/360neMjG8uOaR
         RbIfGLUiBu0+D29xiN2Vw9EVrN0z8uxguaTjnP7Mui2V/0cVqgusRfSdfGbTP0vwT2pX
         vWeq6ebyZXj9GZ1hm65HBJNgZj6qYMc944gqOm53lbiIPHsi2qtVRwGGFI4VAufS4kqw
         p0uA==
X-Gm-Message-State: AOJu0Yw93HWWJvga7fpuyrABDtZVIYac3BFWa742v8wirUUJ4w2MrBCi
	w4B8WWjtZeNR+Z60LpVKlvGJraZJ59ASjZfd9LRT3PJ++5Jc7h+N1L0xFsf2bA==
X-Gm-Gg: AfdE7cm7/rB1wJ5svQ8jStTc0VdY39wBQ2j0O6C8c1bOwjwNAoUz343akz8es+9wn5k
	c9AaPhBSfbZGbAZ+Y2u5wi6lmbLHhik95Sz8IOrXjRokIbpWoqBylgVI1xma1eHKECQ5frEjpdd
	zTsmyam0ByO6+/ZSsrKFRy0DenN7I3hyGCOtzxv+eFpIZCVSlSgMoQv7pIiy0Fz65pBQB8zuIgy
	ZBeF50DFHsmxZjbg5ZVRPGgrzW2n/adqtxyk1O3YQYUeQn4wTqAp48sqwRZqdIvR9X7AhkzNakM
	A7ak35YqoHiZFKljm4MUMfrubXl0rLKv0EHeDxHthTe+cz+PoP6PJD9N+F5UlDje02puez5o3x2
	IuY8eJcTHJTcEfhNFQVE2zFjLpVgWhtcvbt9+BLIMcd8IyFkE32MgLyZ+YzwB01aWumtfuNeYG4
	d9WqZRHLy4JiTBjaRjoaaJNfSqHaIuqA08VVfdqCgTjGRG0yuaAGegErNpJm5jXIl3JEOQ+S91U
	773vkEZDaG4zAc1q6VJMqGYVknKNBFEalfICh7WBzHqcrOWIX9d0Ew=
X-Received: by 2002:a17:902:d501:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2cf349bc5e1mr126653745ad.16.1784506173031;
        Sun, 19 Jul 2026 17:09:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f91bsm46716385ad.8.2026.07.19.17.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 17:09:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: sis7019: Use pcim_iomap_region() for MMIO BAR
Date: Sun, 19 Jul 2026 17:09:29 -0700
Message-ID: <20260720000929.1432533-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded pcim_request_all_regions() +
devm_ioremap() pair with per-BAR pcim helpers: reserve BAR0 (the
I/O port region, used via inl/outl) with pcim_request_region(), and
reserve + iomap BAR1 (MMIO) with a single pcim_iomap_region() call.

This folds the BAR1 reserve and iomap into one managed call. The
error check moves from a NULL test to IS_ERR(), since pcim_iomap_region()
returns an IOMEM_ERR_PTR on failure.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/pci/sis7019.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 4be085d27712..55c1b11a2900 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1260,16 +1260,16 @@ static int sis_chip_create(struct snd_card *card,
 	sis->irq = -1;
 	sis->ioport = pci_resource_start(pci, 0);
 
-	rc = pcim_request_all_regions(pci, "SiS7019");
+	rc = pcim_request_region(pci, 0, "SiS7019");
 	if (rc) {
-		dev_err(&pci->dev, "unable request regions\n");
+		dev_err(&pci->dev, "unable request I/O region\n");
 		return rc;
 	}
 
-	sis->ioaddr = devm_ioremap(&pci->dev, pci_resource_start(pci, 1), 0x4000);
-	if (!sis->ioaddr) {
+	sis->ioaddr = pcim_iomap_region(pci, 1, "SiS7019");
+	if (IS_ERR(sis->ioaddr)) {
 		dev_err(&pci->dev, "unable to remap MMIO, aborting\n");
-		return -EIO;
+		return PTR_ERR(sis->ioaddr);
 	}
 
 	rc = sis_alloc_suspend(sis);
-- 
2.55.0

