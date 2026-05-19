Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20E229B12
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152700; cv=none; b=ujymM3tdOEupbTXIR6L3i29kkck7Ff1DImmw6roYhmyKaH3V4b1J1lFmFsvqKf8QTxahLNerfub6nIcAFSCclz1IqHqnOxNzEK4k1gE+OhKwMn1NXZeud0onY2EiIbmbPRWnktyd6N6YH4wkKsDhlmW2BpV92WaUFOuLC1MHJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152700; c=relaxed/simple;
	bh=IihrxKX+mGVVD8Vr+AaxkOwsMHjS95psdFHYHrsOWx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQ6Zgle6+FXSnzgnu14UYe9WiVv/yE8qOqUOaeJkxzI5b/Tlb2FJJBar8Nsfyg5IFvhDXKQ8z4jJecvAHNNdpjEJDOXdJzJGrM6RxHhvIGwvtWRHH9eC0M27eHxuBWyxpH22livVTxFaSNKy7AMJDubp736WrQmNMS+M2g0mj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KV5k5GkJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KV5k5GkJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-366be8040a9so1134984a91.3
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152698; x=1779757498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=;
        b=KV5k5GkJUa1Bo+HmXtW6Q9y3sMwQcOIuUYbukditQy7BtfgSiMnjyXvSDpYFpzO9M2
         zNaaqsOvxRnogScAylxzxy9bm5Bwyx+O0gQLaX2crjLewce6os9Xodzro2P5juk8bHOu
         kffK9lJh2KaJJHIniZFG5khod2yvdO6G18/38Kzz5M0B5m8yU4wHspl1l0X4L/FsdJ4h
         B3Y+sWeXD3Payom2+Hl1OpGVTefqzvMlKcWypRH9RuCZIBx5uJbk8dr3Si2Qb307Mxje
         145An/IUkJCQFHg0vnW+AMtF1i3b0CkQTG9+RuKVI9auvhxm8oQqJFT+QUQwWeu2Z4CK
         RQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152698; x=1779757498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=;
        b=Jy9B22ZZEznJQpg9oGpyHvBTp1uxZlE8CA5qyI9rKXeNwEO8fxpok2sE37V0RFWSWo
         F/nuYtGGGR84NjziHTK46FISUAO5psa62ZG1ldXlosrZSNCMyQW89x0NaO7KS7OaHYuP
         HsRtx9Vdof0ENMsulGGBkTMQVRM/OoPvE/aygWJFR0DfpMbXPupVwRZbQDn42EqMI3qM
         rfZjx1+GQuJkUOqrNP5iq2E7Yqxb9ICpEUqUoDBtvEN4pgqMzH9ousGp5u57lgaXABUF
         l560l2MeNiQE3xUEsrVIRLnkYPggrYVvKRPtblp/mtDCrV93i4jAUhsAXfIlfU9weena
         RLJg==
X-Gm-Message-State: AOJu0YwpKngaky7v3ov774iZNFubxyM3Rdk+zvD35XLbDjnxALiZ3oiI
	hwus9Iru/Amya/wDbGjxTCbv+2EHEWc7Nqn8QNkwjMh3jaxl18ymZUxPDrPx2F40
X-Gm-Gg: Acq92OHL1CxWrq1Xjm3M7XOCpAfoGu5R92PiVh/rrV6uJDebSpDI7+6zlZlDyKgXcyp
	RgvILSitx1s0nkjDop/7G0Xtu8Yd0N2m+YPEnKyGO91OxtlOKExjAJC317MWGNETNQK+imqzMSx
	3Y6yyzxf0HPCeFfD8pOPgoWU9ydutWvlzPV9MIm0CMlV5CDNGmYMWz/cJCBJpdTjvURp0IwUeqa
	RrJ2pHqPJAp/PARKCCf9HagMom8zp4A4dTPoD7fEDVvGhdiWw2F4XDjrTGaJqsXaWkyz0nTh5OB
	lq+zYXkbig42oUKPeIvNfnlHPjOM37QmA1PYiUdoGWupa+LTY8ynqQ5gAC+jIH/THJUjAb/j15h
	U4YksbP+UdteG8yi1qawxfm9tTm9TACUJaOTopEOjnyNy8KXhp1gQlrhjJm3NsLkJ0GqlVa9B8U
	9n8wxOjWLQzHW1JhShimTbaZbFXZus+cqdhbnvOWaSbp42EHr2qlrIbeGMXXiTCk6LGYjiuoB7q
	hw9Hi9X6zKspOgBNE+tEWsfbNF28mUYkblgMzthMaO/DA==
X-Received: by 2002:a17:90b:586f:b0:35f:bb33:d72c with SMTP id 98e67ed59e1d1-369518b00cdmr17164840a91.4.1779152698278;
        Mon, 18 May 2026 18:04:58 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695148d53asm12212912a91.15.2026.05.18.18.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:04:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Date: Mon, 18 May 2026 18:04:40 -0700
Message-ID: <20260519010440.629290-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For whatever reason, GCC is unable to figure out that i2s_num is a
single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
represents. Add a min() call to help it out and fix W=1 errors regarding
snprintf bounds.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 5a2bcf027b4f..43157f218409 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -25,6 +25,7 @@ static const char *const base_clks[] = {
 int mt2701_init_clock(struct mtk_base_afe *afe)
 {
 	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+	int i2s_num;
 	int i;
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
@@ -35,8 +36,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 		}
 	}
 
+	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
 	/* Get I2S related clocks */
-	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
+	for (i = 0; i < i2s_num; i++) {
 		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
 		struct clk *i2s_ck;
 		char name[13];
-- 
2.54.0

