Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307937F8C2
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315392; cv=none; b=KXTxId9/tCpOIb4Y7U6E93wTdLLJi9MeqdISAH7t/Zb7g6VDebuaQgqzIFupIg+8LAHXJX8yPHh656yUs1RDQPQ9yDGOeqQhK0DmpMMk/AyRFRs9iXxbgJzT4/0jCbRXfeqIpTllaXrIynm7+Dq2UZ3HM6/NO9l9jS4Ee6WrPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315392; c=relaxed/simple;
	bh=JP9eOEHyaoXV9HbY5hWZqU+GNYeECJ8ryV8lwd7nplI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ki8q3r01p2qQ6YhGVOsdmz9XLd6AxNj/3ibeKxwyxnvLsg3Rqz4WGALOFa4Nodd36lb6nuSpQjjFZ2s3m2Hro7Xw1m7/4ifOyrTOM+goHiHrGraRnBQZ8i/MF1/zNJF2AgycJ/6gzLGhXvNV/a0ByMmTXRXhbdk4N0xtTB2Hljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSnvZ6u3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSnvZ6u3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e04df8c46so991689b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315388; x=1787920188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axXA4DN3AZ7lZ4uoWKWlKISmN+79vPMNk4IXFpeL8kY=;
        b=CSnvZ6u3vsNqCBxlXpoeFtEDLpJC9Kmq00d987fMvI3JTW9U8OqNJGTcfk3kc9Vl8v
         drUWethG+ljyTYYLa6FKM6ChEXEieulh+QW8s6NURAMQP9F2QYhlRKvAYnfLnOMD7ZdG
         pKlEMBTvzSBONwe+PoNqyjL1RfwL4nrIayDTrhR9eVd5EwsxHCR76E0xripxz7T6377S
         eigH6Ob1Y7tat3zNpH9ZW5qb/02brdiYjBCh4ysks1UVVYDXCQGySy0aaMWZHl16KMX4
         oVThkuT4VsrowvA3wrUh3NCwWK75awyy68Hmyd0WXmEEzX49q1io6M2uarM1HFbUye5v
         2AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315388; x=1787920188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axXA4DN3AZ7lZ4uoWKWlKISmN+79vPMNk4IXFpeL8kY=;
        b=J3xH+586COCOt6LX2SuT6xxULVBjwB1YVylXWX+2JLHV/4N5kSRipAjrmXwIxPntZC
         y5+f7RpBNchq8OgqNGv+Mao+wDYSVFU0gsyBmLM8TAh+DwMUNmQq4SsGooTVEdm6Tjh4
         6Q5Ia9fYjQ/8PUQM4tOMc9sv6zHkTgLL7G2wQzNU/4+qlNbkK++I7wxJrqp6PUYpq1pe
         44YO23SnR9BxuV+2NnCLuv4YA0lUhWfcj4WPnoWScOH+Pj5c7yRXHxeUtDfJceV8uQcQ
         WQad32oo6fQ3QSjdJlDiOx6NsEVEWgCkE7pnE/y3+KXBWNGyeusVHZpPBpSknl8fmZZF
         r+VA==
X-Forwarded-Encrypted: i=1; AHgh+RpiBDMRPkcHCIDAQgrrN8beFLtO/GMrLxxFyO21Hn7ajyCvxjyA7P22kzoUGoIUl0GyspCAemCdD7g/nw==@vger.kernel.org
X-Gm-Message-State: AFuF++mlseH8e3a8vu9nhuXkdNPKQwcMkGKHPEkLtinOcZH5z85/+OUv
	rXsYyn79JvfWzfWguqlklo43zGX/CxyRgAP9Vr8DTBFSBQ8mxS7EkRs8
X-Gm-Gg: AR+sD109HjJLepToXH+fxskRzh8NyLP6aVJa+pjyyXBXwacjVcipA+ZkPlgi28QuTZC
	T/MJU/g0Wv559b1ise9W2RXElOXe5GHN6ADkOC5v9oWuv/kC9/IpKEQuVRYps42Dq2EdELS9HMN
	TcErbWNB9P12jcldzwRY7B208QuOEc6Ocl/gEVmsVJd35LiI2FrmgJMIfgSZuGw/P6/hva5h24x
	5vMV9pzk9KLMo1RaqHQQMdlpjM5F7llF8a2nmJX9O4VWqppO29RK7bxZiMpgFYTzfp4VapyFbGh
	aYa3HQREveJgIPDEfUBbuPL5gX78BCZUhM+/eEuAqOSAonIqGfiYNOtbk/DJBrxjFLpIZJ1PGjx
	CTPG07Eqem1sCKTXSUxSRS4ZX5LK7WyuJCxyzEdl4euj96opZd+kqH67TsBZyrSzrk/GUhH+IwH
	I9KqCY7ZFDycSNCkrz+mwNDM1vrNAuYEMRrffQv+bbBge1uwHXxWX3XhXY/d3TN05WGUXYF1B8g
	HSdz7CYPMw2sDOR0of5GlcAlnH+/CbaX1WO8p1CT/vq8OZG5s/lmIqWFAxRkyx+l6NGo3liue7A
	NxwJ
X-Received: by 2002:a05:6a00:a589:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-851f9efcc14mr9394852b3a.7.1787315387771;
        Fri, 21 Aug 2026 05:29:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/4] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Fri, 21 Aug 2026 19:29:25 +0700
Message-ID: <20260821122928.41343-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0

