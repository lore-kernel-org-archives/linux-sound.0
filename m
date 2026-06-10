Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE83EEAD0
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086853; cv=none; b=jQbqFheEVuBk/TCrkgc5x1Wz9SQsu3D0Cjdm4g540UtqzcKUDJ3YDkpbD1j6WtJvCWa8TOVpW1+M4XrlXpyecdfIITgz4T55wuwdUsdOz8RRJGliURNR7nAWrhVfxqJ6GY8dL/1UCqQ2BlXeuz69c2ZMPPgG3PC04KmU2BTPK4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086853; c=relaxed/simple;
	bh=KeBspY9AIg02Ytfq2EbyAvwQn6ojORL2TC15EQ0Fboc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G81S78T3b+1c6yOoe5ec8r9dLAIBbbLbD6u4+7Q2fmVSJeTBTi0cxFXd0rWVUG3JJm0t23egpWJfmVSOxAlVMhrGKby+AhoeMmp7ejqfeg0sE3Zp1Ts3sUEtwf5jt4vTvgrM1hj8dvhSfZRoR36th3paDqcJC7PJIEYtE0chJTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFxe5dm3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFxe5dm3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf1f074a12so67207015ad.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086852; x=1781691652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=VFxe5dm3EMllgD2HBlGTZUTcoLA8KWjWkaSNLu91xJH9Y67wj+vd8thYuTyRw6OdIB
         N0IoyzR/ZAjkvx3rake1XKVT/YZ1RJJ6+efpsGQMEO+w/u2TyoXhUN7woepmmAm1SHZe
         cmFYvi/GxOzhPbF/HR65LmY0qw+Ns2UuYWSlvdrt7tBPxY7a6BVU+2mvWpXigOfgw4BI
         GLo/AGQw9O6IgFcQYm6z2aHU6PzlFdnWgDRavkfKXWJXSn8wHp9zbJbo2nd7rEvYnLw4
         ckDIhOm4MzAhmmmoyDgaPHFUMQAYqFBSn8FYKVdF7ltSR6fekWZF+Jo1+CgHV+EdEYhk
         ahYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086852; x=1781691652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=q6n8ANOxYtO95fOwewVv1tA2fbxMDm9Kf7uqPtJO2LU+vjf9y4whp8v+MhlY9Pa4+Q
         O+Td+RhVaS5ZrwocVm8iWioU35c0QXnmsujnPCKJPsM1OI1Ub/QvmTrxQcwKtYvATC/f
         jRIKqskR0SYEW3WLsMKcZIH4i0kCz2E0yaUkLHfeOiEHF0ub3d3Wr+1JHc9klAfMG9nY
         djX9YkbmX42huFWpFWTJsrgESQ/evvhwGjhmvuJkmRAA98RQjH3k1QS1wcPN1ZTdSjFi
         g4+7mqB4TzAteldgw/NsHQrQ0xJCCi5zUhG2kWXwREs3oyKjJYBo9HcvavKoz+vRsw6V
         hB8w==
X-Forwarded-Encrypted: i=1; AFNElJ/lx9cH/JVDClMC+BI5XCpX8FrFSPCtFhdZiVrxlV2ip4GdVQsm3e1I0yVi5DcyUujhLirigc30nEomZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cXoJGM+gK/rSSlW1Szs5tkKQ9Wjhxh0f4if9vIr0dFa8dqzA
	MoHlcnrz+Kb+7RqVyzDO4jHkrKZSm15FEtIRe0+3EealDUOcsgrprfOe
X-Gm-Gg: Acq92OFHw8QI6sLpZY+uRbLv2P1toEPlo6ACd53jrgW/1sh00WR02CqzkoYybA/Yh8A
	L1EgBIgzCc/m8Q4LCJOu86ol7/j2GdCHG7oJrthcftefY2Z1vFDoZ6mpB8ND30dFEZjZXLJaLGi
	M61MXrEIf3KxyLKWlQXymYa6Sst2bW/gtEBBrqtPNMBLuVFtjU4qIEKyiMZDnLFmEMftqs0Pp/k
	M5ymh893fe2Gsz1OT5zd16YDJ28ByUgRsDhkgZtUYsZHWMn06ZtaW+KTl0otDNuOOn7QPy/SPZo
	Tjc8oHJ1Qi8gHjeHm+Tnd+2slHZPPqeZcMBKnsA1OkRmDNohFAJOTcFuvmmcuSev6KZuRLBlgU6
	ZtzOwqCrksIjyDGxZ0ZJAzvoeYJQPJId12AZcYig6lv7gehQvRE/1w+6oYLlK4KBuhwzXCQIVYm
	1VnyNbZ7LPIcWAi1e11OfRxYYoAfZep2Ai4d7URWcDI9J5fe632KLdYHTA3HYIJMZUjylk
X-Received: by 2002:a17:903:2411:b0:2bf:379b:53f4 with SMTP id d9443c01a7336-2c1e849511fmr304782305ad.19.1781086851765;
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
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
Subject: [PATCH 03/10] ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:14 +0700
Message-ID: <20260610102021.83273-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 9e86e7079718..aced8e7e920c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -201,7 +201,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 	enum mt8186_afe_gpio sel;
 	int ret = -EINVAL;
 
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 
 	switch (dai) {
 	case MT8186_DAI_ADDA:
@@ -209,7 +209,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 			ret = mt8186_afe_gpio_adda_ul(dev, enable);
 		else
 			ret = mt8186_afe_gpio_adda_dl(dev, enable);
-		goto unlock;
+		return ret;
 	case MT8186_DAI_I2S_0:
 		sel = enable ? MT8186_AFE_GPIO_I2S0_ON : MT8186_AFE_GPIO_I2S0_OFF;
 		break;
@@ -230,13 +230,8 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		break;
 	default:
 		dev_dbg(dev, "%s(), invalid dai %d\n", __func__, dai);
-		goto unlock;
+		return ret;
 	}
 
-	ret = mt8186_afe_gpio_select(dev, sel);
-
-unlock:
-	mutex_unlock(&gpio_request_mutex);
-
-	return ret;
+	return mt8186_afe_gpio_select(dev, sel);
 }
-- 
2.43.0

