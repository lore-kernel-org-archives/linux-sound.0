Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE394F798D
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977300; cv=none; b=upiGUMYQkXuz1nIQkGDpPnQfAFPo6mpsF7quD0tPL6XTe98IqoCvIm+JuWTfENBrbC3fVdpnX0wbIHKn8YBTHBc6YJHOpUIXW3I8qFbcq/dTN4OLmSs18dk8NPax7mWKY11Rt1aQyRjjlD3x2YlfO44SPgyxepTskEbTavhjYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977300; c=relaxed/simple;
	bh=BqOIdOWIc7Bbbr8ZxXOpLUQh36ChMcfJeTwhKtu2ZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTlDbrQ31mbuX+TNSyEEnfsvqnQr/toMcDHb3OmYR4eXc9F3GR2O1vteKUY+khHy9lqJq5VAlAIbTxMVJ9xMF52TkEfzB8BklEwXU2KVaT1i1GXG3WmSg8gkBZwBVYkPB4mAu5m+gwY29QlfoPZasHimlUGi966KdugyWB01BPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8zVxwiE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8zVxwiE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2094454a91.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977298; x=1792582098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=q8zVxwiE0UMYaqW2Agvhzp2Wum0iKIPcOu+iAepkvWnqd5qaywIFePv9bhQAc6OO+A
         vIWpn3Qow5Yx9FE3ix0nZA8qGR6W54h9mDG1ttg+R3hyZZ5E8aX61ysVtZU4trU8Eq6Q
         RvLDNJ3DmoCGJq8PcatEKz710v7idDrI07kbwrTf5fxytidoWvJbqND+JZcYJ7heIdPv
         ED4MPGv6Sf1v/wanm/dxVhCX1POBfeVF6TelFCbgwxgH6ZN4C9fzR7ex8k//zpWm8DZJ
         0hjHr3pM5HuJWGIWrGei8tVgdwRiom/7i2YGjIn5W5abbjZ0/5n7ap3OZEByrCGJxZ7/
         CbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977298; x=1792582098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=eYixIqjqPRN9sxylXOOj94SqGDqBkg/ifzuQs2FONeZT81FqYB7b9LCsRNDMJ8rgWI
         jJj88AcV2McYjc0yX0ZRGYWqTUBurgccUIoUv3eGquk62g1hbhbLJG/Hxpj0A5Jo8fnv
         Ma2r17UPD9OSeOyiaKMVYeXcbSZROdl0ikb/0k1lqokMoIBM1s13PufeHWnV1F7NidIa
         Z1R8KknEVMBaQNa9ucitD1RLcieroUuTSSBFJltSAw+btS5AevWuOYFULHJqXYqYnIv6
         rxPd0ZW+XD8SOIdaY9zdGSExHUAm5IQF/9h8HMB9KHAu6iBE0QLMftVeB9p8Vm/6yqda
         RUDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6n3m1HXh/rXA0n3uCjqmiQCgI1ztMNLJYZA5Wcdo/PgHDCINL/Rna9kqV5qr2iuZkuS2TFKlkQYGrog==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjZJwZvW9R/qOFzSR10KnbMo5g9kBmeKhYsF1+wt+weSFlI8oB
	0ycLqNVhnW6GcIVoBI4TkfrkMYpLT6D+stw/VcGh03Asqq9Xlh9TyWBE
X-Gm-Gg: AYBFou1rSVtS6r+HfEFNCLrMRTY8U0618ntp7cH18phy/d5qUWJTBHn8+vvHj2GeNL1
	c/X3C9BkO4QJG5FI8C0yICk+VbG3JOtCO91PVvUO7zvwRQGklUXEONFnBToFGX8LUvTifYzTl6k
	+76GrzYemsrPzD9Wq6Ky4nGkOuxQ7wpn9JyWk5ua79g3Y92W8NjMf5Y2/1OqFvtOflk5HBLU1Tp
	B82TVnm6xuG2cXqYFJ+METmkeVEz2WouquSwl2+YMxNVBaZVuiCZRYTrlf/l3ZAwjzV/+PXnQSL
	GuoiiTvvbJ7vrOY4KBo1UfraIEghrWpgajFN33bixT61QRLNyXehxQXXoqKdlsBTNq8se4eDagM
	Hx0W5J4gnb0t6q1tkomhi+uhuZKp5u9y9yg9lrJpMwstTKXPGkPZk46XaBBtiP6V/T6gnWVaFbU
	0WgMIeNyPwb6chTPQ1UCfo1TgxSzl1v4wiapL9j66QvbPzSakiuQoxWkHTN4NN2dpVXqyAUPXL9
	LjYHqxEaRfyvijxXx1T2N+00uUBs8B5Zpol/+Ly6f/p85G7WMnIVls/6qv+2W/9hmvCBPoRzI8G
	qz7UM+mUCcDy9Q==
X-Received: by 2002:a17:90b:4c52:b0:3ac:6c15:1173 with SMTP id 98e67ed59e1d1-3ac6c151496mr1396142a91.31.1791977298568;
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 01/16] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Wed, 14 Oct 2026 18:27:36 +0700
Message-ID: <20261014112752.683032-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0

