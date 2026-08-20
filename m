Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AC841B8F8
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224421; cv=none; b=m/yW3DW/YF/Rs3X+819lgqcqHEMsqdtq+M7SKLb9FvSVGfV9T0LMpvBlrcOaZdpZsOe6JHpNGTYH58uHnlC+OPa4D2+bCQhlF72PTtXBb+fY8Mz9saKz0K9ctfowP86oHIgPvdKUKG2Kp37+dExtUjP0FLxcqgCa4fvLybZZxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224421; c=relaxed/simple;
	bh=GZ+W8p1ry7vldsXpMatf0H+bFkmjz0Gihshg3tLwqpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRXfLbvNOh7ZQFDO5aX5nFwvxHpbSTh3MC8oTR1vNlwnCgkfUN+OMFIgykK1bD/jjwjJapK5VUQjdEdcrkq2MW9AhyZbd0Rcx9S64XV/r9wahWO89LCqoN9eKAzuq1F9Kr6li7THdKfBIKQE3UYbxLBZ/4mdTCrB1xPVFWjsAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtH3haA0; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtH3haA0"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8486672f03cso1949275b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224420; x=1787829220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=;
        b=dtH3haA0tUTUff+CRnKhOYsxlISot5ZzpmI7UTZnRjXMlJAy0ATrZMUaHq/jnyECxj
         Fdl8X69kzOIJLsxs4DyawwTctCcwv5iNMiyOuGsOK7/+XCjpZaFwSYqCrGY2JXjjjyz/
         iSrPKekfCXMcnDPG5bZxYJttq6r50OEPN4FoPmutN59tGvbsfUrlmZa3H1mvBW/nDh8m
         kc67VQYSFBiRL/nriE1+RH8UTJcvbLE0EEGwjwsoVVPHAd7zUY8KUt+T9MHC/e14qNQu
         5rGMrXBtkL4zRvFY9OH/xtOuc68dhfmuDgOdvas0LgXwMmbPmkIr25W1radygXuZw5a4
         Tf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224420; x=1787829220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJCRYDZE3VyQeQed1gNiTmBloNm9vN2iVU/zKNvs6Uk=;
        b=U9ZNUOoTyp9+1f7oect4DJVVkf1n6BGc9/xGDo0HDV3KIfT3bACo7njync5AlSbGHe
         swKnZU35hQ9BDSKWZmrqFe2ny9RkN75M+2OBJqd/LnkKkgtin7xkdEiUrIsUHIEjNDgT
         MqrmQsaUPEn44aGnggvAg1QHAOaZuTMGTXbdU7JPvXfAJy/s17ampr6v8cnbYs5NRbp0
         e/DKgVjRVgt4RnZEjis9N+A/RkvS9xDfpc8Avb7KXBTprNvYfjjbn+swm+eBFTQnFCHq
         6ZM2a3gOqzp66CoB22LbqzPDbujt0JBHEnJfjgEInWvXoNMUJEcbuCNhvBKoMAR03yk0
         21LQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFgLLeop7BtIdh+LVbJSJA/EDfJBG2WsmbdFHpX6Dpb7EkBm6lFFEL6DuSR+4YhPzYYRr+WbDyV3TFtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgC/9RDaTjk/D3QGhcAdOx8FfEAexYdhm/anN37/iZ2MYRwMtq
	9BZ5wr5zaARv6WvkSgKQPmft86blorHrJqMWQnwHpREp2S5bnhAWdyTl
X-Gm-Gg: AR+sD13ePXwUOvv/gLf+mVZoKnj7FihV1lM7ALKJBGL5+IB47Jsj9JQHpRxdOOplbP/
	Qj4F1le9x4hPFfl0zi8xihUAz17LtqAYu9ySp48BZIqr9b+i9nVDEWNr1JDWjb25rozxKSCJagL
	m+p0j2MeOewiYGlcrW5/TYKExocG+N9yt1xgTUZzpHKoLcjtTrD/9UMa7TyziX48PF6gZU/0ztf
	g5VSVJE2RP7TAHMTXBYmZZn33hOAQJ76HeJNemB8gGcbAuChVqlKtnJD4vaJOmaPaarn5xpAKVN
	ibpuidK7FC/W38ToUItcgF9tYV+v+lmh48guw56nxSeBUnob9YlNpy++2zGdenm/TwEJpXjPZEF
	5uq23GVEhAJGXscxSPEGpJt3oTaVCsv66Sz6wvEwr+21X2UG50UhbVclDJKli1Q+JQ8u8B4/4pO
	0ql843SiXyoRU5qlw7K5agPG0WVcBxmJrwtD7EOVMHr1rSCvw9TdcRZJ9nVEtZd9JG+nnE1zBn3
	1pvl5zhzAW3gcZLuamZZzmwfB9TTm+Bnj7t7IxzcDrcNVp+eqCkj3Rj0gTbHN207+PElRFvRSmi
	CdTUYKvV/3gzRlI=
X-Received: by 2002:a05:6a00:148a:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-851d3914f9bmr20061259b3a.11.1787224419796;
        Thu, 20 Aug 2026 04:13:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:39 -0700 (PDT)
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
Subject: [PATCH 3/5] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu, 20 Aug 2026 18:12:51 +0700
Message-ID: <20260820111253.97866-4-phucduc.bui@gmail.com>
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 94bcaf92e396..d6b0174e2655 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -359,7 +359,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto err_apll1_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -384,9 +386,10 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
+err_apll1_mux_setting:
 
 	return ret;
 }
@@ -412,7 +415,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto err_apll2_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -437,9 +442,10 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
+err_apll2_mux_setting:
 
 	return ret;
 }
-- 
2.43.0

