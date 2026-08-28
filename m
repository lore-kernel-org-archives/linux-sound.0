Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FC2222D0
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908574; cv=none; b=nVF90wJQTH7FhAALxfwlayQdbPoQ7+Rg+UlhDhF43blfnKzNp2kBEJ4t6MpCGDNOe5ixQTxnUHPT/JGaDXSaXfzyXhCnOGO0YXhZ6D4WnUcsf3XlKwR8NF0n8f8Ea6wOG7nZsqDiOHTHi9Go6N0DBWdHXtYNR0OdesAU4f9Ssiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908574; c=relaxed/simple;
	bh=LgWe9C3Q+Q2sxxa3s225OxRX5s799/v0ot6Hkn693Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmXJbhi+uhO8k+Y16gHqWxgUFW7G45rpYKL5Vd+plEd6uSU1j89a/1gnLwQHp4Gl4yJKB373sOP6ZEc3f6+iD51IyqtfiAiRJ0eOKLTLJlqXl8VvTtGf4z25cBO+peFBrxMtydp3skgYQwrn8y0HY9zYiFML9hyVQ8XqXDvKtmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQrhMRVL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQrhMRVL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8548db7428aso639148b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908572; x=1788513372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=jQrhMRVLXhAzqMVN6rtHI7KEeYWfGsrmaZNoUWWLhmoPRq5pDv65H+avfqdZjWjJjJ
         cHVJh17UpgZvS0pv7cOn+jj3ovORVv7Mg9o4xPBWrSPe5J8KVmxVYuchxlPA/fcA5cMz
         oahICgdwaM2k5/7iSvSKNxwOVqbSfoTPtxt/xB51kggqyObikLQmZ1KvMa8Y9IXExPoy
         UKs3YpQoyzOliweykE302adfxlKEhTAMC/F5aJs0a4WhN3shUOvORDk55b4qO7/1yoDp
         gx1AepnIcziOHEtlZV6x0r7mWCPonzP5mTvhGCggbvEgu00kbm9EYgphsz2VpGMDiB24
         GBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908572; x=1788513372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=FLUJLdv8oXNZP+EkJITMGEPHu27skSEE5rCOr02LjKspzJhSGrecR+Ufy1eUfjGy0V
         6D5/K43j9DxQPvZJxvWJEtL/rcg7jXnyEpFO/OjjCuPhD/zL+amg62gkMHSiFY4DxPcv
         ReUsd3UEO4EPkezWVwNnC2qfdTv0Xr71TwuKsLex8rz0Z88ihkCCF4rwJXoDANlJUsMM
         +zit34FQTWJzMN7cb+G6n30SPethew37FeU55mWnveaCKu2qv0aaqBU8g/8Bowx34khv
         dzNZaNHWGB2iYlXJHbms5C9cqMLBb4v3ZjKa3eIAsi7r/vc7k7MhwOwPDmuulmrbJLPq
         LMHw==
X-Forwarded-Encrypted: i=1; AHgh+RrURMq1MmtLQQoEa0HqUbyQeCTkg+dMSMWTZxLln5dyjfVmKP15+ycriB6G9lZZuTrTvbRADT2IEouRYg==@vger.kernel.org
X-Gm-Message-State: AFuF++l9zsOkmbOLKK5wDpHredeYfFaOEu3NP4zF+r+wCXyUeq9Bajr4
	8dHUVxjbhWzyfFGemxkMqdV221Ch0lJSmqpq6FKJI/Hxj09UGDbKM3z0
X-Gm-Gg: AR+sD10+19UGD1qAI9XHdnB6fLcOFEIHuKfYrRR/CUE3XamSWFtWX1kvX41NKKSYas7
	ip/vm6XRDoRCWoCh4mrenKcyCAI4yf+dNcQcPIRGzQ6KAl0HCgBaL4y5W0jAN0rHnqS3CS8k+G+
	74BxOjPmM6QYwLHXT1SmTcwCXjGx6RSs4qTsCPARjGTXopTPeJu7e1GZcqCQnk9+LqdSCBhIhk3
	XETZXIYEPQCDrMf41nK4LcJT6XRWfSawsOIDayrqXpKm2Wc5uGd/N6pCMQCfeWWVKfrPZde74rV
	bPhsxoi0zQSFg11LB1FO9KVJxNMb/HC39OoDuiXSAAWfXhue8ra4O/R1UiNx6sfjut211ynUeDC
	Z4z1hxDDmquOI39VOCyBzO312NccuC9VI66it3+XjSUoCwYRhVJn/SZi+2lXxYkPHR7XGVnluHD
	1lAM5RG8JT4pa2fR2BtVziNYTmuanuaIoDh+1JV1OU9nJrqTPpSxxxodjsLfeVBP3ALO+0Tm4Ro
	xP7Y29zY0KNuG516YRiL3N3rmiSZGJzmMn6P8+UkPflorjszFGI6CU1PIKhkq1uBkbYktBnvbqc
	P/1h
X-Received: by 2002:a05:6a00:1143:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-85626f06db3mr10697213b3a.2.1787908572039;
        Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:11 -0700 (PDT)
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
Subject: [PATCH v3 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Fri, 28 Aug 2026 16:15:27 +0700
Message-ID: <20260828091532.600047-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index a517aa67abf6..b3e938088a7b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -296,7 +296,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -323,24 +323,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0

