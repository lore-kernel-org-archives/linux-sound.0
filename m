Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A550941A78A
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224429; cv=none; b=JNLjyTsUgob7mOqVoiwyrRXFEzqrRRbixSKbrWakqMGLbJMWXckLsC8W8gXP9o+1962p46paADpFUMWQ7Tg0KYRN675xIGAy7KE4AJV9EVcqJve8MG40vuZIvMKRwiMLCLVT+1Z0QJxbL/CMUdP0kn+giZqhmh4rWjHjIS1Tvqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224429; c=relaxed/simple;
	bh=Ax02etNy0Gd17yLz9ovg3nfEQArEGnxo7zLc/NlrZHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/FzXw6psv+oE3HHCE1UL00gJMWdprDQKVskmBjRiJL9TEK/d+KucZpldMBtCGfBkGH8YIvX835mk2O57Qb+CfWmbC4XDrt+C2BFsdK5/VqmRF5fO1TyjkXDwb0mw5KMLHtGPICDA2LrwWMkUzkoWf0PB80FvuebcBUR9zlTedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aye7hP3x; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aye7hP3x"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84874b52eabso2623529b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224428; x=1787829228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=;
        b=aye7hP3xV7PIAHY4FYtTR6xiBmMOyJL+a/IlcOapMEXD6BJ0/vMUaIjZmKKs6ZSY/O
         WuaKm9jnG3JklgcgoljhRhYegiHwOT0Ezngk6JAbnrmrsB7CKQis2RB+SUDXnt8PjaC5
         uyhTRqcGx6oMBWBYjr3ynbvhzn56rQg9bi5DCS4UEmZW0wepSYhoAWL3gEq5ICSwCNE0
         NZOFgSmV67c4OWQUC/DzN+mbW84j5XsTjQu5KNcT7iKpF36A4zBKuoOYMOPYiQE71gbX
         uCH1dLrpJOP2WgYVjmumzW9al4A0ggWQ/ayYm9TBrxyOfNc+XR7qVw+yq5GQnFNv5fU+
         Baew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224428; x=1787829228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=;
        b=PDbDta2fYm1hHKzLy/xp8CdnDMPig8GsK5VtBA2zdLfEhx6lmaLS6xdTm3tsbs0Qqu
         kf6hCym4/rxM0oeGUwfPcjVUvabRMd4QbRUEoNSS01VnEZj2kuvelA90HtGwjt4ccgJP
         mWsZUvvRFDTpGk7YhAUt3dV4JKuBQ2Wyw16fJEYyu/r5Nb9yE03BXacW0NPMWd0VNg5/
         Cu+19OAJa+6TCtRkWZsz9mYQILPST0Dx6W42LQZL0XfvzglROL1k5F0YD7QQtjS+lq2F
         jTdXn+5FaxDO5dy2mdwb71t6dUr3wcBXxSq4nC+mTCBFUVDqqu1p48i7qRcy9286xcOz
         2SRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqICL48jeabxAsS2dVrQRengKLvWv0TVQhQSwG+i5uCPzb18UXzDlKoFAgqUNU5D+dDZKEnwL5ekPDJkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhgtQXFl/tMs8E4kBk6DfnQ0oM+wT5SMyndRPe0lVE8iCeQiWs
	C/FZzrhUBBRtcB+dl0vfhFGfL1DwkfxGJh5PGzQGuGJ6YPaamLXL9XtG
X-Gm-Gg: AR+sD10NlRi+Yr4zFNXFWThP2k38RtpHwyUmfVigGLNhe4CMlSLhum/G/Ae5HNYoIkn
	6wUOtWoZ/jBfFrOQWQlPmMmqN19L68tqal8plfJbOONObw2ViT2PVXk/aGgiqjz/ofSmMvAEWup
	Q4FW6Zjg6v6099Ml+EAXwjWjMKNi+sJvDAOzFhSePJ/jKQDnRsGhqY6YL5wCoquYDa5ws4gc6+n
	I6XjbQQ/6GfVb/82nkUSK/xPxDObGi/HHAbb/KeZnFgyfGgpKxEKODnNN4W7gz+k9uTtIV4tO5D
	nuDlKGS/lG5rZMvo2uLkNk3fDPHuSSbDNinac/XdX+ZVjwNdqE7ikLw13+wk1vDUEJ0b31Li1bu
	7gcfTKU2RZgGB2IwtEXHH5Hqx/drM2NbRHjooyuniI47BF3mHj7mIau8sXArGfskFJYaDbfya6e
	bZK5RmqcveoNff8WdIe7O73/ojBxJ58T4UdBpPsJPdOggcTS15Ogh+DiWe7MzQ/O57v3/uWpH/i
	hww+jaOHUg5R98/TytapnRy9ZFq+ipnG13tVATug1U9nDx75tgI66JVmuvn1BV4nZvPrQr/snky
	SI0Z
X-Received: by 2002:a05:6a00:9514:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-851d395a3b5mr18400958b3a.15.1787224428046;
        Thu, 20 Aug 2026 04:13:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:47 -0700 (PDT)
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
Subject: [PATCH 5/5] ASoC: mediatek: mt8186: Propagate clock lookup errors
Date: Thu, 20 Aug 2026 18:12:53 +0700
Message-ID: <20260820111253.97866-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The driver currently clears the clock pointer when devm_clk_get()
fails and continues initialization. The clock operations later in the
driver do not check for missing clocks before using them.

Return the error from devm_clk_get() instead of continuing with an
invalid clock state. Use dev_err_probe() to report the error while
preserving the original error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 8cc8eb8022b5..ddd509ca851b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -592,12 +592,9 @@ int mt8186_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				__func__,
-				aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0

