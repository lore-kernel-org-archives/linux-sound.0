Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86238B7A1
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 04:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879229; cv=none; b=MRm2Jm/NCHFC2/W4AsnNFPJoRV0+qjhIBDUEOPwqjcQTiE0DjPSjcQxtmnJKEkQ48zzfHOli4H9+9c0qQ55A787vsBeSxhIigV3XHgADzBp2PM7laN9+KzyahtfT6RTh+HywpxB+0lPOn+QwzWxknGIQgFtqLbvMtoRfQWZXqxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879229; c=relaxed/simple;
	bh=3FZXWlaazKVVXGqsOlt9bSZxHzxITSsi9n2VSGvSEt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBiRFwL+CqOAgI/Rm7fLlMj+uCiIR0kRJQqXS8XO7l1MAz7WBXNevIWs/rBK1bSvkNf8aG1ZEYMLwNetNo+wHI8RhJYpGfW+z86f9CjY8aW7mVVdxiJGR/sHpi2TdpSm/954H8QHw2SdKvVND2vauIgV9OoTkz9DLwNe0DPmIQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXdikm3/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXdikm3/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37d70036426so102015a91.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 21:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782879223; x=1783484023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EeZZoz/UdMq6CHL5sceatvsRmFwz3qbQS7Oo/q8Ly4=;
        b=DXdikm3/EWVCuGx9AW3BGtg9pmJ9YuduBZOsYATzFgMP64eL9wobLXiI3lwoB+irAh
         VDtRyg4I/GgAP6FU/M80KG+eRqJNduPC/eVNe0xqD7m7UTdVs9HShOELnTHSvB8zWyKW
         i1ifNGOdohydkPuMZ6Ahi9f2jpDy8cbL3NNzzIee+3msQfOJuIgNwPXi4gfqcxFQuRGo
         x+ZoD0ZzUmGQeBsd3sn0jW2JgsLyZTK4zdnhDS6EKXgY9/2P4wYhuKEWW7xEf+qdDd68
         9Uk2xlST/wjb8x807LN6LhdhU05Elk0Y4ARIxMuQSk+pbvWfMQl8ZKWbAku9cTtDLPcO
         MfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879223; x=1783484023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EeZZoz/UdMq6CHL5sceatvsRmFwz3qbQS7Oo/q8Ly4=;
        b=eGpC7xWRi7GvXt9siFp9Qf2NnVUqeZeGgFDPfIo8as3QTu54b7XVeUR1o4JGLPjvQS
         1jkdBkpJBusXUOsAb9FqynM06b5ja1/A27lm/v3XE36oSxDBCyLfZ2vFkFzRnGc98Gy5
         t7FDdpiR4WUZaRhUNWpsJeWMFUCSu+mHbQGgFEbvX7ZQp0RV+OhGLtVLvbWdGurbvxBD
         biSzpat0eSZsJ88pDiOiSLwRX3TTB2+gmNUh8WhMqyVByWUUaAqw5+JAb5dpHo09bPYD
         66k2VE7PRwkDl245NFbXhSPUFux+cHM3wNvYfd7ne+8Lr6ZkRYbmBzDvBxKR/x/0ggm2
         7ghg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9FHJI1eFcWN3vIlNA0z0gpdq4kM6AFYWKwmdrM5E2eHs9VwlyQUul23LgbwHKGlb0tCT3iSlgcD3YdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypVZuhw/qmUD8ttEbKyhnDmGeumZQgVBwu4LAHWdkw5fMVhopW
	kptPYMMB15rDuHgLyi4yg0UBH8hM1nQPnFsaUNVmEXI7ntvYChLKJXNr7jvYCw==
X-Gm-Gg: AfdE7clYY64v1a4Ny63us36pYgqBdDB4qZ2ig6DymTsSi1SQy14zKCY+K1CKq1tOxVX
	IXSbb4av441TP0lzXqx47k07EEUbrgr5X6+onaRw7UBq09+BkqkjT1EFr76QO6v//rDHbUfGUUE
	Wu3D4La2RD5H7nJ4afEUGeoroZb03nio/n1+Qgm7DpjFYRqHGfRubPWrP8uO1bj1UYMlj3WR6bW
	4R7gnMGvbRWjxgcFJScZM6BY3MfJMjtN7C9xuwgr4/N6Y6LL4LgSRcqILGi3nvncaVXu/yi0i8D
	N5qSOHZIIpTiCScWNioGwvI2l7Dq/csxC7e5eEDQpnxay0k08mVGITYz4P/9MhA3kdLGR7kwnc6
	kfMXKDIbq1QGrYcCFVeShr0YLc6UBctWasU7tcP3g9gOjzM3i8XYWp2w8ESkmNqh8WFg8Syj2cx
	hwEIN5WEsPZ9zZf5pmKcY0A7aodO86pIiI3uXfQH5H755vqGE=
X-Received: by 2002:a17:90b:4cc2:b0:37f:9ce1:735d with SMTP id 98e67ed59e1d1-380aa219fecmr81787a91.30.1782879222734;
        Tue, 30 Jun 2026 21:13:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095e830ddsm963128a91.13.2026.06.30.21.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:13:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sen Wang <sen@ti.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: samsung: i2s: Avoid mixing goto with guard()
Date: Wed,  1 Jul 2026 11:13:09 +0700
Message-ID: <20260701041310.230725-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701041310.230725-1-phucduc.bui@gmail.com>
References: <20260701041310.230725-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

cleanup.h recommends not mixing goto-based error handling with cleanup
helpers in the same function.
Remove the goto path and rely on guard(pm_runtime) for automatic cleanup
instead.

Fixes: 3d08517b5c67 ("ASoC: samsung: i2s: Use guard() for spin locks")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/i2s.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index f80f697a5d55..f80e8d498156 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/samsung-i2s.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
@@ -512,7 +513,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 	u32 mod, mask, val = 0;
 	int ret = 0;
 
-	pm_runtime_get_sync(dai->dev);
+	guard(pm_runtime_active)(dai->dev);
 
 	scoped_guard(spinlock_irqsave, &priv->lock)
 		mod = readl(priv->addr + I2SMOD);
@@ -537,8 +538,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 					&& (mod & cdcon_mask))))) {
 			dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
-			ret = -EAGAIN;
-			goto err;
+			return -EAGAIN;
 		}
 
 		if (dir == SND_SOC_CLOCK_IN)
@@ -566,7 +566,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 				} else {
 					priv->rclk_srcrate =
 						clk_get_rate(priv->op_clk);
-					goto done;
+					return 0;
 				}
 			}
 
@@ -580,14 +580,14 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 			if (WARN_ON(IS_ERR(priv->op_clk))) {
 				ret = PTR_ERR(priv->op_clk);
 				priv->op_clk = NULL;
-				goto err;
+				return ret;
 			}
 
 			ret = clk_prepare_enable(priv->op_clk);
 			if (ret) {
 				clk_put(priv->op_clk);
 				priv->op_clk = NULL;
-				goto err;
+				return ret;
 			}
 			priv->rclk_srcrate = clk_get_rate(priv->op_clk);
 
@@ -595,11 +595,10 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 				|| (clk_id && !(mod & rsrc_mask))) {
 			dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
-			ret = -EAGAIN;
-			goto err;
+			return -EAGAIN;
 		} else {
 			/* Call can't be on the active DAI */
-			goto done;
+			return 0;
 		}
 
 		if (clk_id == 1)
@@ -607,8 +606,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 		break;
 	default:
 		dev_err(&i2s->pdev->dev, "We don't serve that!\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	scoped_guard(spinlock_irqsave, &priv->lock) {
@@ -616,13 +614,8 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 		mod = (mod & ~mask) | val;
 		writel(mod, priv->addr + I2SMOD);
 	}
-done:
-	pm_runtime_put(dai->dev);
 
 	return 0;
-err:
-	pm_runtime_put(dai->dev);
-	return ret;
 }
 
 static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.43.0

