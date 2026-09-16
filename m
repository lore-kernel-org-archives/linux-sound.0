Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229153B71DE
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534867; cv=none; b=g6UzQ5Zn8rTNrK7T6JqOUAWwn080f1Ox4SQsK7tQkwUPIcspQPPScnJkIogR7o+khM9v05+nCLd6FFVKyi9CgP1loT7aYqiyHmnEvPJ3wJnYRtsriGb/7HxOCPiCPI9RAboFDp79tKdh6wqKwPY0ofmksn6ZFGm+zJ6STwMOdyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534867; c=relaxed/simple;
	bh=sl/gIEyH51hHq7ahCeZqum/kQo2BHWlJjw6te8rTW7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuzA+Xc5UqpI5sBZaQwgivohas84ca6B7xsTNm5+L0zOGGZNe2UnuJDGa8TteJZU1zM5MfmRu1GjNJvy1ndBmNRwUt2F6/P3pfaXsuqg6KQalXREWI9nirPwITsrI6nLfzC4FuCxKWqQNOMXtzAbqwNiXYZ7SJ+EkZnHae1RxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtvZObVm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtvZObVm"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so227920a12.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534866; x=1790139666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=ZtvZObVmzjTaSITqdNS3iK2RHjMhrg+AoyzbwZ1K+myRokdt4j+nJnDoBARQLxq1oq
         yVgNUG1+zKrdzUVjVS7cUKGbAHzkxVk1+9on8lYowASlzWVjdYZbthQ+YFA2uBaOejLk
         lblULpixCktilqSrQ62JfSdONgM+OPFej65BAWjXy0ybgtigz6qcWcfzquYPk9ihGbLS
         1YMTcFVBTdDJn27o9HzcBBKzpxoONqaFMdP7LJ6OF/CBjNx1iVqmmap4xNV2XKp8Ragm
         Ox5141jWwN9Q58GjuFvgq1VdbkvRo5L6n2QnYKQdSq3oYLL32oaLbgjHR3CQlNYBXWse
         S5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534866; x=1790139666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=KoOApXGqCxLCnqRIXJkg+tGT/T3dZsarbGNbdTr9LwYiZr8p7d7qIKbYH13oy7KyE5
         96HxyyNIMvVnEsCjF8Bil4Zcvc8b9bb9bpS0JaFIro0cjysSpIAhq9scU5bmUZ6sUFAC
         +6Xihvun244e+6+OBYSP5MfVqxysA04gDh5Xda86J7hvt71BBmDg+LuA+ro9BWlHtwVa
         5CAdCLAFigtxhtZnVCMa8EtzSe0sUp0SdrePp6VatE/iLd8e1zrrm3Dg+Gq/UURFPTat
         UiJBvvVyTzM06R81ZAX9twoGpu42FFRtQ0IvTTVwHFH7fbhtwS0brEt2A1WywB4TadKX
         wWlA==
X-Forwarded-Encrypted: i=1; AKwUvBzVPsbVPp1pUMZHxJWr6iWMvW5FAzmAzeXWzo20qHc9tc3jNSLctKuKqkJNa7fF8eWtU8w7vaGctP/p2g==@vger.kernel.org
X-Gm-Message-State: AFuF++m396lCA65zycoVjeokxX/4hMPYcmom3ejXgPBQDaKWSqD+9Jw0
	TJtWJ9w+lvJVMxqAsEJws00rcR6mvfrp9nOLH/KRaxA8/Whv+s/ROyMp
X-Gm-Gg: AYBFou2hll2ZZHSFez/f07peWm6IhVXATcvzGEDw4+c4/afJeqGUPY/dMt8t6KlOpPe
	VIHAeZFvE4OX/Xef3q+AiYjYyIWGKVqKcywqngeX5dy0uU8lEz8MFi7TXdM8jWPhCbeKeVAl+z8
	GaLkO588PrfnaNz1xTDV4We7353xVbJ9SRc6TkQFGxQrTm7oCXzFUDoPSG5yM9sP4yxD707jRYy
	ZbAJ2XjFRyFAJbBOqeP7Ht1VU66nLAq+VOQPQmnd8Sry8YmoV7tJ0XVM4/rkVJ4TR15nTFYSDi9
	J8Lzryk1UEFludWCsMYpTGoZdYC0HvjUuAiQDptm5HL3KLCuv1JZyef/zsjg7gOi0y0ropym1Bs
	XoLi6XgSgsrxxi4jrdpZUJBRc50JvGAciQejgdcxOEuKnsxkBYSPNhnzkA1HPP8JF2DsnM0ASNz
	WPUxPeBzEl6zZx2TO1hlx5LEnVWTKu/1pAC6rkuAJxaInNlO2/GK39tLLWqlD5WeK2I8x8SvI9P
	Ok5K+VQVTcChzwFy98RENdsl+ARTfaflFJVhKiBNDxBHSZZnMQQBFlzSL+lbKT+H8AlXt5NxlDd
	3aCbnlEx7pxa+jM=
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr2952258637.28.1789534865531;
        Tue, 15 Sep 2026 22:01:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 05/12] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Wed, 16 Sep 2026 12:00:12 +0700
Message-ID: <20260916050020.14575-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 1132c924158d..594c214fa697 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0

