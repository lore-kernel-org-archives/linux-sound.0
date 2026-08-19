Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0644A402
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134753; cv=none; b=ZzyMDBnOtlMf1iZWjlLZs4ogOsIxMJ1uMcoiNgDr6jRkF7A4fgMnHK5LZtS1ja0AGcheELGKUKz0hp2vK+b2LdMpb5QbxMzAP7IRO66R5SfWkaceW1AKtuiR3DDx6pT9/jUm3AGMdfRvnvBfUNwL0bXsF7YaeRBoGXnAjknyUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134753; c=relaxed/simple;
	bh=3D0ORIxBSCI+WjObWSy28Dr7v7WW+4niEHVt9fAxmLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrFFGnBwmT2Mzq9wsRfUoStm2hxBfEs6SDeBQWEZ7ohlagJsbpP+tU4VE3bOqPVPg+ZbrvQBs+GVjgB/sYjDkYNDpKxArOMGCAEs4+o9yWaFDFvhBhs9xjGIBIkdh4XSfQGJWahk8rJEwfWc1B53o6M36fb/tIkwNvx+QY4IfmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAN4bVfi; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAN4bVfi"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1141586a91.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134751; x=1787739551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=;
        b=gAN4bVfiGqqZ2mHcq3umzq7y57SskqSLIcG0d+/VzsUHgGcGBoaAxkXE7BFitnsKoQ
         L6wmn512e/evHWhc/5mCW0sKd6UTSOnz3znhQd6/N4XbH1VeJ7wNx13ZMqHrVw7IWSm8
         6VN4AilLHkOFStPyp+DWuPrPIl7oRlcYHYb4gtLNRJ6wxmwiWWVv6kZ0TgasFvTHASp8
         VHL/5QzRCu18YCjT5PR6+oz/bwv7hhl+opwkDCB7nUmc0V74j7RnTxUDVK/BXTWAL/jh
         N07IMdB1F1NvAOGYiPLunW/+lq3kl6VTSa9rK8hwx/3DZgsku71l+y3rQkym02yUg77P
         fnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134751; x=1787739551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=;
        b=XhpsaS5jicJv9UARlrmuLuIOlxWJ7mOtQhb2FiHUlXW6G3bdIAMR4ibggtMf7DsB3h
         NqmCGjzcsxHaql/4H4A5LrtE04pqN3KyL/EQPF1YYzFJ/vF6mHiucjSfvBEZ8xn9RtuP
         3XjLKYOTgFCVzIGtdifrgKQFoVAtUPuJ81pCmB084q9cdLvzHXMiHHTs19rq6EHGEq1Q
         XELu4bAyqGvW4YaL5Sp2AQIiLiEQnSAOZ/KFydKtDc98tLS2E4/HrdIqZMn+pfN0WJnG
         7fV8AxNwHIQpGg2qVyFaKzR5AE2mpuqhjEiDBrRm/LZ9jngobnsKe0v5iK+xOtFZCwp8
         44xQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKjx7x2TDGgk1qq+968NXs/SFqf0OggYCCQJn82wn9kTVmLiZMvXG0Ox6ZQKFKVNSMcx0qySjn/di4KA==@vger.kernel.org
X-Gm-Message-State: AFuF++kRWpy0KSUtt+Zl9EwRq1mb8mkSF59w+uh85qJinnrFoyA2wZW7
	6rLM1+rrgClD8OeoYQfO5X9UYVKtUtVBov9PxG9jKqZB+LS6diJSuvyZ
X-Gm-Gg: AR+sD12AcPCgyzozViI+k5fgaH0nfwA9mTcMHWLDhRTLcNG7YcRh7onwkXhvOFnWaUh
	hjCr7+bWgdEPCw2Qlk30YUxGYG00JQalz4Z5zSSnXpmYwrRAJbq/7ImYWgNTDw2MT2XMgV2u5oS
	wfkISCyUFCYt+srmjwt1+UICPNf3BPcxWW/YYU3/HrlJVgxYV+BxIw4XTYOZtaZghfolUOiwqVK
	ly2K1ABNRcgsyYX5XyoUfKOZVYiXTTuWpKJpecU++zaWeJjcswGu4+CLYHoNWN8UYGDLeuKBQMk
	qKhUEBk2ba6311z/YrCrcwWPMACEpCVEytSGC68R4ugB2dOW7TwNKY1R037lEOZo0Mvy0MOGIi5
	iutTstlfJo5f+aRAZs49yHTzsdD6MBO5ofNoOxtfxQ9ndWfDLt3Bv+1EeHZf/wEhIpA+DBDud8E
	Ow9trZAhMpT9OAQYHobajKWJrr13G+kA6wtAIFZdRdWXLKhpbXT/Z9m1V9+lU1oGSE5GYoHo9BO
	Xs1Gn1QYtpjOCAHMb5EwRpPBA6Ajcagj8VpSZwSwE3uhUfZOPlLuarpO+UBoHi7HEoul+iSbWNM
	nz1n
X-Received: by 2002:a17:90b:2241:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-39581228dbdmr6386601a91.16.1787134751062;
        Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:10 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Wed, 19 Aug 2026 17:18:48 +0700
Message-ID: <20260819101849.68010-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 260c27016cc0..d532aa8107b0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

