Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFC2222A7
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462421; cv=none; b=odqGk0JE4MKkjvKQRsrAujQjXROlyJcbSRUAwMdsHLyGC2xLaDRKo7rPU3Y9kq4NLAGK8qpdfHYQe0kM8tv5hF974ycW6j/j1XFKzTFz1PtUiOzpmL1+lwmIZXDXY+oDhoYSzFHcpcFLT5BaBNtlZqpMlHvC3nZmxLSiDFJwAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462421; c=relaxed/simple;
	bh=Z3E6oDJPvDaUYacpuceMJjGq51yqfq9d1bcUwD94Ip0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBH2BsJfcUXw9BWrV0yOddAmkn/+onllsM4f85xurmsxaNyP2JUi+9cSVneQGtBb74L9SSJdA0T0qQ4XeFNjveGS35Igw5DpnQATIn8Rbw+gqD0OhzLk9b+X5Z/wRd9lNdv0gEK6w9p9YQpFABkYRK0bPmqD2OwjTQ1NeoBbotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QS5fHPff; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QS5fHPff"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso13844f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462418; x=1749067218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea3dEs9bTYxVxfpPjS7I2hituCqW83SA2oFlYXKAEAg=;
        b=QS5fHPffwBkWqQc2mL8JtNtvOq9ZxWqtMr13hQxeOxl2cQpy8qwEby/kltGya+vTd3
         1fobLulXXJTqsValqnBkaM4ieXQdey8ZNiiiUy69ZZ9Fub4vKcqtJ5F22a9RiHvRyzxZ
         ZnNUs/3RmpErRiDSSDhe7tzVXwXA8+JDjSALQtsD4bVGs5/lys+kZBoLRqRyqbpK5T3J
         vKIj3Xd1R+ZtBzvHTXm4YD5fKBPF0mEfeIE8h99LRh2Lmld8VTVmJx0MvAFaRmO0hBBT
         ajYcmlPtxZM8mCrnIjZ+P16y5h71/TJTMf0zReZO1sa21AZcwFOHyEghz/JZ+uoD0Uv6
         JKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462418; x=1749067218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea3dEs9bTYxVxfpPjS7I2hituCqW83SA2oFlYXKAEAg=;
        b=Uol1JH3LrGw2rDxzYJ3aydHUEqnWP4vKOlN9jkR+9WIA7VrpnwnSYC1jdfSlRZhhtY
         xxZCyM9/JkfI96OdINQX8YbAWnzdIfh8QPMG0RLAF0iJNe4TfLkSzRf+FIU2HFIpykxK
         BE7LeHR5UWBEetnevfeQnAJ5Tmpw3h2PQNBFW7kdgzJMBtsEatISAInaoX5OHruXvP1X
         B4pgw/141mFEtLcC9hbGCqiTbyXg4ndF9Y34qu7cwuj9m3EMKZ1kMJI42TyOQt0W82Hu
         9weKlfvy2TJhqkvd3xcw64z3FDC19zPcqdsXGFo7Eic1oDpAix+ivu1iGWlT9yP1lwL2
         WxGQ==
X-Gm-Message-State: AOJu0Yz3lxsSm6MM4tsflGG/69ntfdXeP3ROkuGp1FizyaaUO4jP14K+
	zi7bqCxsw8nzGpQ9IGa5LZz1Gh/u2XJHnvzLuZ3eCwTfyn9THJVYNcgVSfXy/vOZS3c=
X-Gm-Gg: ASbGncu/x1q1/+x22L48SvEg9D5eUvKviqRM8bV3DzZvVxPZ40n3vG6rTRkW/BtDyLs
	lGfhiweinWdXuZcmKPurPfbM5xLzAFnrhc+E0fNqOLSR+DW5i4TCc+IAHTH/eUATGkavGJ3HCNW
	eWkv1GKQ9R7g9h/s+pVZ9iFN3uZlb0DIjuhKz2XNxkLnzp8j9uzs6MaiAEEZkZx4UPdBXSAFHtB
	z5aTijfS1s2ijyMz5uB5ej4JHWKPtdni3ACSS9my4J0W8YwXhBNr9yJO8S7oAWTxknQjRpSr5rJ
	raTnyGplNNvnSFsxI0PfXawbHUoTJrd/P1JbY3NNjkqJ7OAY/xtSjoioXnE4DMzF2c9ukVk=
X-Google-Smtp-Source: AGHT+IFtclKo+09hBvWcaA31MANMniSSR3dkpZhR44JC9e8qX1d5fzwX6jzxBVXv3eOZIbMOIQHv7Q==
X-Received: by 2002:a05:600c:1ca3:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-44da83f6d0amr52288855e9.6.1748462418080;
        Wed, 28 May 2025 13:00:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 22:00:00 +0200
Subject: [PATCH 6/8] ASoC: codecs: wcd938x: Drop unused 'struct
 wcd938x_priv' fields
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Z3E6oDJPvDaUYacpuceMJjGq51yqfq9d1bcUwD94Ip0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tBcrZHChf8/ltrvvcWeilQUPKYCEoVAI3WF
 kFIF1ShmMOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQQAKCRDBN2bmhouD
 1wwZD/9BdU75kK7j0OCvqJCnr/wdNWfI5o0ONXRaXUHwVAJLqxX8XNjGRzJ/VWy368PSGuDEbvp
 FYmPomg3lI2VXO02pZgFsFlHf+XkHGdDjsFPfzJSTWKYpLqQhQlEOqOwjDex2Qz0AWlx82lyNd+
 Z8UP8Z7gg9wOk7ba0/YEcDRcrXNkrhFz6mpYk3U2RjRlfSCP2Zb7xee4Gp41ILpX+Kg1C5arNvY
 Ip5NrnqJUisJeNee4tk5sNH/sndo6iNngY4CBTZ/39Z0LaPNNSB9p9/quvh7kgHXFsH77hn6uoa
 6hF+g18EoEjxz/lP8+p69hyfJBKK2mitWDp9w33WMxxSfo8kSIlV+puRWzu0Ui9/LQEZboQB/nC
 eBXRcWXVtldTvxM9iHv31XirBezr1HFLPhXqx9RnxttVU/24GsGALDs1ypvK646ekz/UwnYBqUA
 jaeWQlr4d6wWHxWpyFis2jHH1SOeSXgZ/VwyFU6Mc7WEPsDb5k9odD/qNZh+cdEcrD6wEARB3l5
 FKDTfzwPaUxUSmOIqOPULOVbUSmDCYpwrtd/CeOjUJckSU9mmiLN+qUAuz4u3JGSw+p5cO008F7
 o1GG3E+avvMiP5RGreaGPOiiQfWdTWTZd2zKu7EJbUt1RCsc+HtSiKk4nZCEiG5edS9XKWgTFtJ
 kpChjEVikYq/O7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'wcd_regmap_irq_chip' and 'jack' in 'struct wcd938x_priv' are not used
at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 342d1f7d5dee3ac2d703e5b5602aef9ca2987158..43347c14070ca6dd8035b0c290f0dacb0326122b 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -159,10 +159,8 @@ struct wcd938x_priv {
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
-	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
-	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD938X_MAX_MICBIAS];
 	s32 pullup_ref[WCD938X_MAX_MICBIAS];

-- 
2.45.2

