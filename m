Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69AC3368B6
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086837; cv=none; b=DbUfdPxTUVc5IGhpHILr4xjI9SQEGfeCrTGPt6/TXlBvCOZ093ecKTojrqZQat9DxVEXD0wZxiKS9rBO5XctyEhscJ8Cc9Tb0sddMhnp1cfrfuaQfniweBfj94heWQWQ5HfUE+ACmbGTAGJX3YHp5U7F+N29C9/kx6eneIsqnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086837; c=relaxed/simple;
	bh=PeGiLG6hCrHkk1TB1pa6/NVtDkTBudB+5q9kndy4mOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REQmf5WnQv8zSC12bkyh4cimxh6lcG4i/bqEd6XGjLMw5ZutpRcJ67757BGX78vw3XC6xczQd1NnSdVHb2xMYvOVdlJl7gVUG+rytPtSQRbQJTuHQ0rC2yHk/A6yXdoL3eYym6Gzxp9MC70S05NDrXVGBtQkdvngSOGxr8/C9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMfdUPBj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMfdUPBj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf55c39e16so29525355ad.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086836; x=1781691636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=lMfdUPBjp29W0RHEjvOefw2ryJgHhH9vrQpzKKQNxJUO58Qh+q/MrxaXd2q05XgS7y
         4Y4h8tiLCxpl9CmOsfkX1G+hsXlv57bdnqojTdvdlNrMXcv8v4dqyn2PqZjj4rGxrbmf
         tJFgSUMAML4tkKqzusNQcVRdcXWep9bTmptq0bxOfLWYYW58VHYvdvxRXetRoERf7Le7
         QtEHsXDK6YQlLl4YOribiNRWEQYKZWah7/zLWYXevWnnz+sVH96BVDj4lkg9EUA8dG/i
         dxQ0OnAUKbhl44vpm+IN6PiLRbFfuxzwPjj0LMnNC1YHB3sOwYEg33awi7pq0XVxm+Mb
         44rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086836; x=1781691636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=jHkLgTk672iGAuu/BECseEMTwJUgg+UaPXeDg5LOz2lm1sITHj9aPaBkqsxRuY7NPs
         I8nV/QSnsBnWU6Ta9fEM0HjlwhzJTv3xTcvk8QEqm5HLf9yMijSNzUeThtnqoPdmZ9Ea
         Bo7JdNCVJYKonGAvrTbpFSdQStarTxzmR3napCaJK+Wp1cs+8HXzz9SBypG4PU7mtQe+
         Qwjn/AhIUy4M2N/khDzut/QW/rtcSiCgvfFEPIBtEmcxsE8uI0uANyIiB9Opjx9q33B0
         UNo/skm1dyShvkD+UZJWngy0hHdna7konpUa4IQ8SOMSpkW0nvipf/gPGNu0rBrn9wIz
         tLlA==
X-Forwarded-Encrypted: i=1; AFNElJ/KX/FbZhW4HlC51fM9AlJzZSp2H6+WQgq9/ADyKu/210Fr9bI/m1C+CHwwzgOsDlh+kU6+IXJcE12w3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPzeOxGlguJ/l1dqKExCmxHzUpNSWTv0T/o7yqI7M7YeaPoex+
	8VYDeoJ6LtKxbDMKh7KaKVaguHEfDoZ87Wve9ccT3+RBkSFrGVOLDzYpbbBCUQ==
X-Gm-Gg: Acq92OF9z8DpJYpSi/QVloD0BEIz2bkOZl74RCxaDdHqWfRdkXM6RB2zMRJzCByfRk8
	t4hvGZokxLpa1QuI1XRWRkVan5oPCTOoC0aGCfp3SDAJSGPDLiCFHNPF80Z94pETyS53bIK4nMH
	slX8vNmeFWiCdo7FrSzEIlpHROLNSVZdoNO8xBk2xtqsO0f9uk7cpY/qU1LcsGlTvFvHNav+IKA
	eaXP4PtBAi4ObFOmJCXoMD/0/an8ZV6oC9Wf5It2oZWc2UWJzIDvgtAS3vG8h9MAr8rGCpsnSNm
	o2bGeVVTbwIlbZnq7RkZM7Z4EaLaSP4qA8SAum+I4/P5ldXy88c7OuC8LK0a1CIFNMlde0Fd0QR
	RQvgwKn3cTRIpI4G4dy15nd4ACZOIYVYNbpJah4JX+RhIDMPTRNiOgICgmr4Wi/25ktpQoIQSik
	YVsmyvlff5A3ijZ5tAkdeSm2KRgB4vDs+bwqCV6o/3TFPDQg2XEZqViu5ZZ+Ybpcg5Byer
X-Received: by 2002:a17:902:e544:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c1ec7fe13emr206516295ad.23.1781086835997;
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:11 +0700
Message-ID: <20260610102021.83273-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in Mediatek ASoC drivers
to use guard() helpers.

Most patches are straightforward conversions to guard() helpers with no
functional change intended.

One exception is mt8192-afe-gpio, where the mutex release point moves from
immediately before dev_warn() to scope exit. However, the affected path 
only emits a warning and immediately returns -EINVAL, without any further
processing.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
  ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
  ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin
    locks
  ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks

 sound/soc/mediatek/common/mtk-afe-fe-dai.c  |  8 +-
 sound/soc/mediatek/common/mtk-btcvsd.c      | 81 +++++++++------------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 +---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c  | 29 +++-----
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c |  4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 42 +++++------
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++--
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c  | 30 ++------
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 +--
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  |  5 +-
 10 files changed, 87 insertions(+), 151 deletions(-)

-- 
2.43.0

