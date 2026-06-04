Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818721C5F27
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780544175; cv=none; b=BeVqViw5yrehmYw0O4lQH/6Yb5YcwbJ76W3zwtd1oiURXmtvofJZGImEwx5/REC0z+v/DrgW4cHauIWEImcyrDlmjGnBSoctSxf7iLGhbwhwCBgnBiS5wn/WDm3WVh3lV9qEq2vMfE93VyNIJqUyhf49ZezOh7qeqe3L10BhWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780544175; c=relaxed/simple;
	bh=JsmDQDwFjv1qMs71CZFn8iCXQdOuq5NjJNvZvFP2ek4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwioBoM0LILuaaRFNvSyDE8prE6ldbFlHDeDjQi02WVTvDhYwoUiPAB0xxGJy81ZG1sVJYQZXNPsEA1RawX5Ztx8sW6NraeL+JioAKdzpPbFrSzYXtO67A+teiMLNNagBMcQSPIPRcguzu2wHRlThsVtTLj96EYM3u50O1BIyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhNQBOta; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhNQBOta"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842307473b5so164490b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 20:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544173; x=1781148973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=;
        b=XhNQBOtadXZsW30pOsG8/oJROsT+4P70T+zu4pOfEVX+YvURA1ZA4Unkh6LcQiBd39
         4hLxc9kWSjYccU99eZBFsP/FaVmdq9GeW0/YWAcGNCREK1wMfeAddYiCNQQpQcMmcZTo
         650loJj+iqgXKfLEa2JKCUr9Z0nF292A9WrYOLWCnb+M+W0b0soTl2ekHDll0W7Fw0Ut
         sQ+7Lqfxr/m9+eWyza97FRxXKThTnp6pb2ZL7WZotYUrU1YOtzLIHbm8lWx4FZnlEe8/
         I4Y/vZGVnTxrTEnTnIMmcRd7QXR5k53NIdFeUhYG7pCP5YDiFVhqCzc50raeqH65R2km
         vqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544173; x=1781148973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEBgbFdEMrwR0Bbx/xOW9IyMneCSJBVo6qr7YB9TYfA=;
        b=KIfeaQlQYDPSJlECuslkqA5ekUy3+jtxu2LeKVCCM4IHgFQmTEC6Y/VxNtx6vqb070
         L8ea/lr8bCFvxvO13QrHPJrxGjUuAFExdGvWBVFp5naJl4/KLvNFq0+TgFfiep/sC7mH
         jtEHAhfuBQXO3B10NHPGlHHDzR2+aRS5aUXj58pqY84PpnNZcNyCC3NnafCxwJOKwn/r
         woNSEJ8y3uQH0o5gT85Gc0hwp+4QtzZd2y7VWRK/okHkqZcBQQ4qbd5Ay89TGuRVXP0A
         vNO67LRm/sN7JQuumlQU1RVfpPkirQFs4iZkAcrDWX9BCYNOEeOpDC0Rk9DDjxL3nezi
         v+5w==
X-Forwarded-Encrypted: i=1; AFNElJ+5lGi1qB2NjFeGp4CSxlzE1ybTty0PzNrPwYjlCttJ1/72vdhAPbCws+/sO0ig0MZmcWZQHa4zPKm9lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCycg5NnO52wXAR2owVxRn8nME4RVqeAamWi3lRS+JQ99JNBQ
	xzzFn+2bAIr13HZ298BjxrU3B4C8RhT9QJpKkIP+vVrJ9LCWiWo1eM+0gGrjSQ==
X-Gm-Gg: Acq92OG9YAOZWk6MfeuxSYs7bG95IoB4EJ+L0YCgMbQf1Gzmf3s4o44oNH65RZBzLf3
	4MQKUrtncl6W/+0HKlXBIPSRXjr8AMeBKvw1RUNgCFJsaDPvmMqeK2RXnfgu9ci9BJn7r42IQcO
	2kRq9240d36CVeresq3Hd2qIc4/msqw9585qi852/useE3Wnqs+AfrG/RXUX82Pv5XnjD8sZOxY
	CGzlgFtCkwT7PWedv1uRO/P6gUZz97YXtCSUFZ1DDbeK11Io7zJH5C9ahA2Aw8asaqC5ItgLzwh
	aWQoLnodEEpR1fRlsfTi+bjNEK67YAExeNmLzKiNZQja2dQKZGHa2gFzHjCcvB2iBaneZlLB+YO
	NofUc4yiLLSZRTP6t5FxO5qK15v3LtIPW/dp3PyvARXQmLJASAncwDNHDQ55F3E6QjS0ILrne8Q
	XORqJwpPBaA8x6zsdYwFnhNksBeq/iEid86+0N0eyTXPR3amLH4OllHw2m25ZP0RkmtYR9
X-Received: by 2002:a05:6a00:b483:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-84284da5a08mr6132587b3a.12.1780544172780;
        Wed, 03 Jun 2026 20:36:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm5539745b3a.11.2026.06.03.20.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:36:12 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
Date: Thu,  4 Jun 2026 10:35:51 +0700
Message-ID: <20260604033554.96996-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604033554.96996-1-phucduc.bui@gmail.com>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
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

