Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5433DB99A
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781267528; cv=none; b=Gmv+Dsc2voDLk54fJb3P9w2yVqEs3EjKXQkr2XF6KZ1bLB5BSDamMzdOUPGUpzQkWp8Lj4jfd7MpU2SqNtSSF7iHqxqAzM1RFQudJdMmMEr+wgTp7xu1n5FiTxVAw9gQaQKzUoSf/hT+hDL+8Xs7KdyanxTP0qC7+34JBNnIgOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781267528; c=relaxed/simple;
	bh=3vH2KV0H2DnODXETuoUCCHy1VrqWWNhPhnwKVNIYKUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q25vmlG2XdsjPz+fhjcZmbP3H1l3GM4Xw7yYE/ouF2rm0DpDPFnAJtcw6HXqkIHWPc67PrgkQlECbpWM0mZg53rolenTQ9EW1Rwc90zVc92ncp8V1cPWNPQg0epludXTQtXJN3gKzRNeIF8w/gPfR38dUefY4OslIUrPmGNzSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+fxsx49; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+fxsx49"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13809223fd4so940938c88.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781267524; x=1781872324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCLd+pL3iAgi5zSaq3NA6KsjQBLVdwWzzz7IEdYF7As=;
        b=O+fxsx49GxuYzslhVN1ZDHKYFIZ+L0OOfwN+olwziP2NxZUpslu+oG1LCa9o9JrRR7
         6e93HWX1bKmB4MREkt1oy00aXp5ZcBcuL5gfVPM65kJm1xCZpA8ZkamZpjMGc7SanWAn
         rwQHNXQKtYcBR5u0XEd/KFFQI/R8RKNMWXOlJVP+wDpc3XCWgr5X6xJx0wmwAXKpKmzG
         Lvc5+O+7kE60FvqnNN3zYclgxVRQpwnGpi5RAzWnrhMnYpUwRfzkPfHlxId7rIPqSVkx
         zisecgsoej9qp+5oovWbpL7rGuJRtEW8xq9Kzcr1RRBE5v4pMbEE3Bbzvy2rcSqrX4jE
         sjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781267524; x=1781872324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCLd+pL3iAgi5zSaq3NA6KsjQBLVdwWzzz7IEdYF7As=;
        b=bghAh8IjZPYt/0pC5Q8uJJRZbLybkZsgMv2XX2umre2f2NrkoMHCrC8MYt3aHChgVc
         3q+flROuaQgKPkM6uDI/NxJTVUlBJ+rQfDxwoqg6eLm0XyD+hZgEupEVpixxCkW+1Lzx
         ellp01d7ynYrmaW5gGXvkKntZq24PGb7m4zqxBMfJdd70a/wTKLsT2x3NX7rX6vdAICo
         Deidlq+CuXrN9omZJdMizbqEmFwOJvAy6iLJgI+yDjOeiRo1WCPC1PFNvvMbuaQX7vaP
         UEELNLUH/BXbKsiG4Vyv/86ehvgfAnVmkGN48yRhdo6DkZbeolKGGHAlix3mdk1cHKFE
         BGrw==
X-Forwarded-Encrypted: i=1; AFNElJ9dYQgijH1tYNSvAm6mFcRsW3vjEiUhRljEGGJ/4LnF+sQqswAcMQegNNkfJPMGDUdlRJzehJbGewtEVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQImbZAyLNKV+oi2Q5Z5Rdcr6hKgxSBcu02eG7aHYCBUlfN7R
	AzMtmhxpvfM4Qu+DzMTJQPARsZ6p3TuLC4fqkiiuHXhHoibwNjUnN+dz
X-Gm-Gg: Acq92OHSRDJZD4DU/UrT3BSSZPYhO3XYiKv/xZL4wCgDogWLJfjldYlLMZd+fEG8vqZ
	sXlmZ3CuwOv9oKpPPcjjgssqshFOCY0lL+cIZNByXGZ+StZy9rUXPK2SEULJKvKYIPuPP+G9xfd
	hX4S9ky1CZOAwQZVucebib2ohLkGMsHcKRHDuukuVnwLFrn2CZofOfYW0CptrSBzqSkk23/CQj0
	HBpMA5fI3/bfeoNgK52Ro58D1r7jb0pBLie/6V0y9Z7XPewSzUhSYvFN0xLPMQB2n+7KGxYTmGt
	/TPFsMovCZLbFKzvgIDErEuJ3J0wzwDwAt6DJvm5h16YOYB32zZRH71TnKb/iPyfqdGDs9UfxxI
	KGsQH3lOVKQYqIvqiZrUgnM4poo+MkCAgFZKSeqj0j493zDq2V9Jhhl4Err/nv6YC7rV1S36UH4
	ULIZ8/PiXst04jDKHpgZyc/LIcN39XA+5p6a8mPLl1YAcjpNxqFNBWUjRpVw==
X-Received: by 2002:a05:7022:491:b0:138:56d:27e8 with SMTP id a92af1059eb24-1384baef0c6mr1147859c88.1.1781267523981;
        Fri, 12 Jun 2026 05:32:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm2068550c88.9.2026.06.12.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:32:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: hisilicon: Use guard() for spin locks
Date: Fri, 12 Jun 2026 19:31:50 +0700
Message-ID: <20260612123150.74696-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 250ae3781d14..33b1dafb2540 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -185,7 +185,7 @@ static void hi6210_i2s_txctrl(struct snd_soc_dai *cpu_dai, int on)
 	struct hi6210_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
 	u32 val;
 
-	spin_lock(&i2s->lock);
+	guard(spinlock)(&i2s->lock);
 	if (on) {
 		/* enable S2 TX */
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
@@ -197,7 +197,6 @@ static void hi6210_i2s_txctrl(struct snd_soc_dai *cpu_dai, int on)
 		val &= ~HII2S_I2S_CFG__S2_IF_TX_EN;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 	}
-	spin_unlock(&i2s->lock);
 }
 
 static void hi6210_i2s_rxctrl(struct snd_soc_dai *cpu_dai, int on)
@@ -205,7 +204,7 @@ static void hi6210_i2s_rxctrl(struct snd_soc_dai *cpu_dai, int on)
 	struct hi6210_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
 	u32 val;
 
-	spin_lock(&i2s->lock);
+	guard(spinlock)(&i2s->lock);
 	if (on) {
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val |= HII2S_I2S_CFG__S2_IF_RX_EN;
@@ -215,7 +214,6 @@ static void hi6210_i2s_rxctrl(struct snd_soc_dai *cpu_dai, int on)
 		val &= ~HII2S_I2S_CFG__S2_IF_RX_EN;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 	}
-	spin_unlock(&i2s->lock);
 }
 
 static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
-- 
2.43.0

