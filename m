Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D534C989
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385786; cv=none; b=hnbW96G3wTjQcu3jlOTR7C3x9soq+Dw2lhCgLvwewUyroYHRkJAsy924zdzxtjErCvmBZM1pLYsuLQXY+RqfIrNAIvhkg/oHoeksZRRZ5qL5uythY5X/tDnhrCJj7FjzEHyyicBx6an/+E+J6Ly5TUu9fomvIzdpxgi4lQsePrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385786; c=relaxed/simple;
	bh=XzjQ60/SSjQz1xsqxJT3tG/VXfobGKlnyRsg6JL3WmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A50sgDVckJuxOtailv20ST03kOhnRj/6zilyZ+ZnNd/wHb9Ghc00NS4hkvTZ4+mlBvLsV00o3vUn1hOXN9QML4fCs9SmPs9kIgU6qUFWO1LROhW7MVS45ayZbWmc07DK8hJn0Lu6fue27isrAG+zEjucXp8ljkEN+VmIXwEhCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezCGOkpY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezCGOkpY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-487035181a7so24794675e9.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774385783; x=1774990583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYEM6pX7Y2U3EjDnmZx5hwFofI5ez2sNfPIMH8LA/QA=;
        b=ezCGOkpYPbSAZGCbyKw8ougX4UHWAQy32u/ucgUoIKOiKuMJmTUV6tjKOdXHUDvxRI
         sygNvbAYbkoAowbI3dKzcaERlSVGDPMjxsDDuM2/FVQ2FhnOtD4z3Tnzu00I2C/HzPfW
         29ZAI1jTcMNFft5FuHAjv2tLgoofYTqed7XwjlAJ7QzF2Xp+T5jMWkvOrF/Iwc47m9XG
         LU8iViCWFJYRWfru8oeGwtVjDab7uA0tXYPm7K7ncn1rw4qYSlJDiUtZ7lggDHPZj6AF
         XmqFEr0GnHzUQwcnJDQ9uT7GZbIHxSfPaDYLyLkZcB0o7g+XS/+8o2GV6x/hHXAytQFL
         oi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385783; x=1774990583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYEM6pX7Y2U3EjDnmZx5hwFofI5ez2sNfPIMH8LA/QA=;
        b=SEkkBD9nddn+0M6JkbHR02vRPYvG93E8A0i1izkmDazIN4yhlQmNQJWpC97LXtUD1D
         SLOy/c5cSaxds5aLIDdTDGzd91wc1qilkAMd9i1IuEhGuS0FuHEcizE8jSv/i9jf8Nws
         ASC8mZxZU2/LvyUkdQvzXbV0txxMAjbvLKTxsM+WO4Nh8bOmN53ZYTkyPpm/gnvw2iNC
         uxe9+cJvA7yuvd3NwOkiP/RuGP7OX7BxpsqkSnEpg5d5p60eCqED/s9cykt89Thr0ER7
         rOmO0xCIX1WxLCx4hzGQJSwwRaciVquemKA/UJ7Ccvs8MS56F6xP6Nvm4WE/E38stVdy
         oi1w==
X-Gm-Message-State: AOJu0Yy9HBLwCxX7uwXeS0Wx5jpVLJjW+vok8KCLkUMMZWJ6FwNub/K+
	yf0EsLf5uKJBwfw/Jz2CoDwhROUIQpfYkZq3625r4k0hAmGJJvj7/InGKjPG
X-Gm-Gg: ATEYQzzBV39h6ENYC6xLWCXlFeSICaKHpez4N2xndCNKHaYDjN9aAUpxClbp2e7LRcT
	7LNTVizl3s94i+Qrxd13CT23wvLqmj7+rizYqVi+wJH3ZGsXtzq2ZttmDxNsa8pu4Q1YeN+ruM1
	9LiFV/wIdlT2x+IHmAYcyeBOn3JqWN+7QdIVTs4GhvKn6KVaf8UjvcUpGi7NuicfAsUP6iJivFm
	jgnpzPVJrzpcCszAZxX7ZWKqErETfGuHFKZJu7FNoY83JhQV2slsk+mISEeeNjfw7yW5HY0L8q2
	ohyqgQuSOjyWTgFH8pPYVcKTGX9Cgj9NEkEjg5UyNvVdLRS9W6qaHXoapeqxXMo1GlvOYkVlBJd
	MvMENy7I5RSTAnVuNEObL6+iQP5XLzCUgRQePq1XfHqfzvW5/6oGFXScVwwg9xruhVFqttMyxD3
	Cs8G5YRwrfvkoH3zpNM8xH3i0aiElLeSMKD60aiEh8Yw==
X-Received: by 2002:a05:600c:3b16:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-48715fcc0cemr18074605e9.9.1774385782469;
        Tue, 24 Mar 2026 13:56:22 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711709e95sm73907785e9.8.2026.03.24.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:56:21 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: kirkwood: Fix clock error handling in probe
Date: Tue, 24 Mar 2026 21:55:51 +0100
Message-ID: <20260324205551.38786-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two problems in the same clock setup block:

1. clk_prepare_enable(priv->extclk) had its return value discarded,
   while the immediately following clk_prepare_enable(priv->clk) was
   correctly checked. A failure to enable the external clock was
   silently ignored.

2. If clk_prepare_enable(priv->clk) failed, priv->extclk was already
   enabled but never disabled — the error path returned directly
   without cleanup.

Fix both by checking extclk enable and restructuring the error labels
to chain: err_component disables priv->clk then falls through to
err_extclk which disables priv->extclk if present.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 99bd066c7309..ea734bc33dc3 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -695,14 +695,16 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 			priv->extclk = ERR_PTR(-EINVAL);
 		} else {
 			dev_info(&pdev->dev, "found external clock\n");
-			clk_prepare_enable(priv->extclk);
+			err = clk_prepare_enable(priv->extclk);
+			if (err < 0)
+				return err;
 			soc_dai = kirkwood_i2s_dai_extclk;
 		}
 	}
 
 	err = clk_prepare_enable(priv->clk);
 	if (err < 0)
-		return err;
+		goto err_extclk;
 
 	/* Some sensible defaults - this reflects the powerup values */
 	priv->ctl_play = KIRKWOOD_PLAYCTL_SIZE_24;
@@ -729,9 +731,10 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	return 0;
 
  err_component:
+	clk_disable_unprepare(priv->clk);
+ err_extclk:
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
-	clk_disable_unprepare(priv->clk);
 
 	return err;
 }
-- 
2.47.3

