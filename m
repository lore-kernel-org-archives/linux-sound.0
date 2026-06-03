Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A9526ED3E
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780459121; cv=none; b=F/BVO1FR1B2b/4KiiEltQzgTGHXEuyRYUg9a0LOVyd44JW/Pu/J89co9QBP+SE58Rw06MKHxEbhTdNuah2FU2Szj01fin4HKr6nUk/f06FOd1vROLXvkxRgSwkpd8vnOk/cJicYD54Y4wwGI8ILv7PK5kOylcGFdeexdTF7mJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780459121; c=relaxed/simple;
	bh=JsmDQDwFjv1qMs71CZFn8iCXQdOuq5NjJNvZvFP2ek4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHn1bs9B9oZAahqTtrF5oxuEYenfv+i5SB6kfcXquK3mHeWdpI+jDzpBlWNfwV+URQe7KosR1AnYp/LJ1VCTOa7fXcdsqPy7TR12pnCx7CPRflqEO0A3kpM5HmkR+UEO/GnsEN05VW/nIbbF2pqFnLwlnNnuDjON1KSC7g9Z2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co/W3gLW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co/W3gLW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so21696805ad.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459119; x=1781063919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=;
        b=Co/W3gLWcDn6N+rClgOVI0QHNtwbjz6wYzIwE401UvpqgZXchvve5eWfp5dZ4jddk4
         p8ap42Jzz/a5yvo/cIx401xyHIF1DUYSNxgUSzt6sMRhMCMXKjz4GQB4p4d9pixDsg8u
         uIDus4p1JA5nfUuaw1KAL9Y1Y8Swmyt1pwegZKv+taOiPergiphaBCX9an2HS/kQhefH
         UtzULDOHm810A1A+le792GjnSwVTfVin33I6FybQ8ULrdTKJ4ACwvU7H7rC6oPjw45/F
         U1nPwt9wXVQa145Be2EC1WkwEA65rxXm2hteHfjIbAtIFFoRpRA6R9ASzcvn/DbdPf4K
         ADEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459119; x=1781063919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=;
        b=R3bCLQkkR/YnwdJIcd0ZBmtNw3ET39Ryp6wkGPeSd5/3Ae0N0JSzuovThOlev9XR3d
         pusXtuLRyH62mUwhB3GmQ1CeKykwiroAzA2nbnvVgLSDwQ4XUijEpRmS2dp5WjIqfyTQ
         liSVTTePeX4rY6Z2P7i3Y3nwB/l7qcoN+NhCtyygJbjp+eOervLdzWULjWhHAAmengiX
         dxEKyMchnNEgFi7CZ+TPXPqb0fU6zLonntN/5g6dman59hV6PvE/elbUaUUBj9ka9r+c
         2p+KFB5ouXhQNvSMaEhnwHQu3dZ89hkuNSWTE+fqfVFQezrQYdc8KtTfCC5gT1Az1iFV
         UJeQ==
X-Forwarded-Encrypted: i=1; AFNElJ93MJG4Sv9bG4YKPjYFktO6a0e9vjs4R9ZVGV6zb7HxZENHfWH2xa1A3mQYvUQIN4sSCBt58fDn2zbG+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF12TMLXJ3vDaqGoTo3GJAmN6ItC3wBwT7vUTO85ORXD+9y+Wa
	1Nl852ABdcQbV7ZvV7IiwyVA/fOYsgtNZIdp7CMfmyZ4J8SUmKE+j1+1
X-Gm-Gg: Acq92OESl4wuikxV51McZXZEkpPwhGNawitTZWxl3TJ2imXFBmK1R6Dw5eRq/dwQ2uk
	uouMI3+OJiS/2yBStWDvazT/1HVwqDfgabT0IHzE+a3RlSePURefXdMN7ycrD/hlEH+XBa7vh6i
	HFEJY6pr0oaPlYsElbhmCNhluFgYmgdNGX6ku43LMfEPK0hsMJb51d7qcwnChS0fDXm7y/7sfmK
	uNdn825KmMwyIfs0YNoeMqcwUsc7mmpy4Xz86DcwJXxhRFRaP6cjcnL6pQIf/qzNvmnyDNwIFLT
	ySfkTqU8WrQFuEZeZ+/w7sRBlA5PPoM5Eei7efpsIg2RQ1xLSWQBF8Veblhn7fFREqBKl71XPGU
	SCB7J/5f3xwHVUBXKRY1Ec6nOd92b/xgYJ418OdqslKF/08LthWGfKfAKolQeeP8t2OMNXXQhqA
	oaV5rPcj4GeR2JdyXb3La1A6LQXwOfuJ/5qC/ifhl+NW3dHenBz/Mj2sVtMvasGgVPZKaT
X-Received: by 2002:a17:903:90c:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c163d86b55mr16757265ad.24.1780459119038;
        Tue, 02 Jun 2026 20:58:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:39 +0700
Message-ID: <20260603035741.68893-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603035741.68893-1-phucduc.bui@gmail.com>
References: <20260603035741.68893-1-phucduc.bui@gmail.com>
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

NOTE: This patch is compile-tested only.

 sound/soc/rockchip/rockchip_i2s.c | 160 +++++++++++++++---------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a0a95b4f520..5a5087f4ae03 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -127,52 +127,52 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 	unsigned int val = 0;
 	int ret = 0;
 
-	spin_lock(&i2s->lock);
-	if (on) {
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_TDE_ENABLE,
-					 I2S_DMACR_TDE_ENABLE);
-		if (ret < 0)
-			goto end;
-		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-		if (ret < 0)
-			goto end;
-		i2s->tx_start = true;
-	} else {
-		i2s->tx_start = false;
-
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_TDE_ENABLE,
-					 I2S_DMACR_TDE_DISABLE);
-		if (ret < 0)
-			goto end;
-
-		if (!i2s->rx_start) {
+	scoped_guard(spinlock, &i2s->lock) {
+		if (on) {
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_TDE_ENABLE,
+						 I2S_DMACR_TDE_ENABLE);
+			if (ret < 0)
+				break;
 			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
 						 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-						 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+						 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
 			if (ret < 0)
-				goto end;
-			udelay(150);
-			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
-						 I2S_CLR_TXC | I2S_CLR_RXC,
-						 I2S_CLR_TXC | I2S_CLR_RXC);
-			if (ret < 0)
-				goto end;
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-							      I2S_CLR,
-							      val,
-							      val == 0,
-							      20,
-							      200);
+				break;
+			i2s->tx_start = true;
+		} else {
+			i2s->tx_start = false;
+
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_TDE_ENABLE,
+						 I2S_DMACR_TDE_DISABLE);
 			if (ret < 0)
-				dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+				break;
+
+			if (!i2s->rx_start) {
+				ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+							 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+							 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+				if (ret < 0)
+					break;
+				udelay(150);
+				ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+							 I2S_CLR_TXC | I2S_CLR_RXC,
+						 I2S_CLR_TXC | I2S_CLR_RXC);
+				if (ret < 0)
+					break;
+				ret = regmap_read_poll_timeout_atomic(i2s->regmap,
+								      I2S_CLR,
+								      val,
+								      val == 0,
+								      20,
+								      200);
+				if (ret < 0)
+					dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+			}
 		}
 	}
-end:
-	spin_unlock(&i2s->lock);
+
 	if (ret < 0)
 		dev_err(i2s->dev, "lrclk update failed\n");
 
@@ -184,53 +184,53 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 	unsigned int val = 0;
 	int ret = 0;
 
-	spin_lock(&i2s->lock);
-	if (on) {
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_RDE_ENABLE,
-					 I2S_DMACR_RDE_ENABLE);
-		if (ret < 0)
-			goto end;
-
-		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-					 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-		if (ret < 0)
-			goto end;
-		i2s->rx_start = true;
-	} else {
-		i2s->rx_start = false;
-
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-					 I2S_DMACR_RDE_ENABLE,
-					 I2S_DMACR_RDE_DISABLE);
-		if (ret < 0)
-			goto end;
+	scoped_guard(spinlock, &i2s->lock) {
+		if (on) {
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_RDE_ENABLE,
+						 I2S_DMACR_RDE_ENABLE);
+			if (ret < 0)
+				break;
 
-		if (!i2s->tx_start) {
 			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
 						 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-						 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+						 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
 			if (ret < 0)
-				goto end;
-			udelay(150);
-			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
-						 I2S_CLR_TXC | I2S_CLR_RXC,
-						 I2S_CLR_TXC | I2S_CLR_RXC);
-			if (ret < 0)
-				goto end;
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-							      I2S_CLR,
-							      val,
-							      val == 0,
-							      20,
-							      200);
+				break;
+			i2s->rx_start = true;
+		} else {
+			i2s->rx_start = false;
+
+			ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+						 I2S_DMACR_RDE_ENABLE,
+						 I2S_DMACR_RDE_DISABLE);
 			if (ret < 0)
-				dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+				break;
+
+			if (!i2s->tx_start) {
+				ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+							 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+							 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+				if (ret < 0)
+					break;
+				udelay(150);
+				ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+							 I2S_CLR_TXC | I2S_CLR_RXC,
+							 I2S_CLR_TXC | I2S_CLR_RXC);
+				if (ret < 0)
+					break;
+				ret = regmap_read_poll_timeout_atomic(i2s->regmap,
+								      I2S_CLR,
+								      val,
+								      val == 0,
+								      20,
+								      200);
+				if (ret < 0)
+					dev_warn(i2s->dev, "fail to clear: %d\n", ret);
+			}
 		}
 	}
-end:
-	spin_unlock(&i2s->lock);
+
 	if (ret < 0)
 		dev_err(i2s->dev, "lrclk update failed\n");
 
-- 
2.43.0

