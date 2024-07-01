Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497152B9DD
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854365; cv=none; b=iQKzZg+fE4HqCujrjkahIXB8uu+OS++e5f1HePQUnp1XjQNznH0pkXhoxWXFNrtqwt6IL3fbrfherZ5H16E3K8ukVn9XE3EdCsnkioDrhfEoyCErHdr2YGXow7m/9IpbHIVmALNB9Nl4mQkR7qQ0gO0eXnL232YMUTwvncuBUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854365; c=relaxed/simple;
	bh=P21qd1OkbuiMrCjx3m8pH2sGiiMR71WkUYVgzpHXae8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkuQzFNSPWO3AcJjdIuYbJ1EvBk/EMqUkiPet62Noyg2doWnYx5raCdilLheSN/n+fSfgpYzmlx56Lu77gvJUsblvVJSYsq6IqvjHJskuuKYSLHSi4Wf1w8lZE0oKy4dKNQOvGx5yMdZQquNghiIgxGqwNN3wbDZzKKg8Krbx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUpFkhh/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUpFkhh/"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso4885478e87.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719854362; x=1720459162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqja86UDKTFIc+qc3NF0+FAZFhHDXQ4XzxpjOTJHZXE=;
        b=iUpFkhh/nSsOntn7LxJqxDqyniQjpbI6xZnHvMEP4jNzHazxAOJulCN9XGGoc2Kzgi
         7WWFDXupEr1tHXxLC7DhaNvVD79LkoJz/S0fKks/CZ7n13W5DieE4vVjkvcvTdyfp/K8
         DlqymiXUa4dJLZcAueyjs/iUdXUq+qypotFz8r2JR/GMO6yVoPRNiEZz3use97cLiWz8
         IDs9olCcy9m8uukiqQ1BTs456ONhXIwBkSTbft09sBCiEY/WZbOrr96O5U1Et0AKNHAz
         EK68FUvsgsC3RILJkAnb5Vsj+OVGM26wAgCwo+matXqBLxhkQENtscLRbRkbgsSAcY5q
         w6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854362; x=1720459162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqja86UDKTFIc+qc3NF0+FAZFhHDXQ4XzxpjOTJHZXE=;
        b=soo/nxesG/H/LKOwOlxpUy0M090Euw48GCpADXpqhon1vTWq1V7/YZ1Yt7VpwfGoQl
         V7lk8TX2x1xS1HMvR+k1tkAvJj2EXL+9Bk8eoSAsqDNDcwmis8t87VpSz4puhHO5sb72
         sH1DYfgwffNLR5x+n45zbMKykMSEHR5TZD0JJ4ZEKZovD3/2UczMk52N01n1Y1NT6EeL
         714B2Di+EdnD0Ddugc+Sqei8lNd1QONDk2nfX1fJvamL0riuHhQbZJen9shfzy7F4Z2T
         2rP1zMgfbWsliz+Fx3r9LS8yEmX6/Fnc0IZIM+z58EYasJE0rtERXal6O0pBx7kXxJeQ
         ZuMg==
X-Forwarded-Encrypted: i=1; AJvYcCWZhjBFFsdCouZVxEyWgHM+Ws1sxThmla2STmNz7nBqAsOjOEFRRf2ZY8Hm+8WJz/SZudCyrW1qeP2fIIElmDdVSr8RDZqCT74bOz8=
X-Gm-Message-State: AOJu0YwR0TcOtisGUyxPuVDj+4WtPKVwwSYGXACvBRf19L2rETETK0+H
	khxX3ONtFo89Uxoa6+xcEObrB6NDVhRd+dNuj/bz83dUzXMEpEYgID5cTZfkKmc=
X-Google-Smtp-Source: AGHT+IEpcOPlfAXhpzDXXuXPLW36uadem/IXz8BjMrFDaiR4x1PqQz5+4iXhrAFqE4LAPZjFn+z0sg==
X-Received: by 2002:a05:6512:1599:b0:52c:dc69:28f3 with SMTP id 2adb3069b0e04-52e8270fa7dmr4370670e87.52.1719854362487;
        Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a112e19sm10581137f8f.116.2024.07.01.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: topology: Simplify with cleanup.h
Date: Mon,  1 Jul 2024 19:19:17 +0200
Message-ID: <20240701171917.596173-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
References: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate memory, which is being freed at end of the scope, with
scoped/cleanup.h to reduce number of error paths and make code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index f4d62ea60baa..83319a928f29 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2020, Linaro Limited
 
+#include <linux/cleanup.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
@@ -1288,18 +1289,19 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	struct snd_soc_card *card = component->card;
 	struct device *dev = component->dev;
 	const struct firmware *fw;
-	char *tplg_fw_name;
 	int ret;
 
 	/* Inline with Qualcomm UCM configs and linux-firmware path */
-	tplg_fw_name = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin", card->driver_name, card->name);
+	char *tplg_fw_name __free(kfree) = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin",
+						     card->driver_name,
+						     card->name);
 	if (!tplg_fw_name)
 		return -ENOMEM;
 
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
 		dev_err(dev, "tplg firmware loading %s failed %d\n", tplg_fw_name, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
@@ -1309,8 +1311,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	}
 
 	release_firmware(fw);
-err:
-	kfree(tplg_fw_name);
 
 	return ret;
 }
-- 
2.43.0

