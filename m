Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCF178389
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492728; cv=none; b=VooS+lLTzYyHTlq305DuEB023bfSSFxmgxwTP/wM/wM6aSUWnhYvvtn4y24Npdlo5sSs2pvVMZB1ajcv0R8y5GoBMMXe4Drl7ke9oJeOWILOIxIKXnRAYjRQOJAbZeiROqXTPh9hV0qlrqWZFns78kwrQNizXMbv2w88truR7iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492728; c=relaxed/simple;
	bh=tra7GUSYxOuDci7FtdSU9K1mGynWhG/R6z58PtzsNuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbB333R3QfLzI9FiulGnbm+eUq0p2FFiwcsOzM0rJ183zmgC97wda6TKAu0k3+cv10b0URjZhCFKi5O3T8B2gLlFgyJk2jOwkqj6kd91X/CJd+1A5FVK2ma21vYJL3C/UIM6SNMfNk8myMsTFomVlU+VoHSpre4lGVcRNXMebRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gomFNyTo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gomFNyTo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a728f74c23dso233612666b.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719492726; x=1720097526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3fWxjkujTAEOZu9H+o5L8JwDxceIiaHODnF69xqvKE=;
        b=gomFNyToBAdgDn5PmOju2FhScuPRSWPbSAQP25+y86WCtWFwCAq8/hNixwUsWASf5f
         R7r7dTMtZY+w/ycpAg+wFBq8up2KgQ5TOw6QovgBIdhFTQiLvIDbkV3MA7kajzbQYQZp
         Mh2fZVlEMDV+6ikklU4cku9bjNCcwKKkI0odifx2b0LNFZdHdI63/VSZOiODfXGNO38Q
         TITJmMUx2AAThn6DBci5alD5/zlVx1GkfbeJVC3tM+eGAzmy6wYBRKh3P/6EjUct15OE
         PptfdJLr/XaCU/zzwXzcSa6PVKZzsS9TdFlt+K8Qrqf1P1+C8jmL15yj3hSg8bRZTNUB
         TWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492726; x=1720097526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3fWxjkujTAEOZu9H+o5L8JwDxceIiaHODnF69xqvKE=;
        b=A6AbSlug998DEuWzKSKVMX896gMkqIFHtzaBuqg7FQkgT+Aiy4YPC3SNNOOVgRKru9
         JVmeaG1glipQ3Ur5Dzb3MzQ4jxiMpY3IHD7OyW8p1uR/1jhBuMGO/gVed36tXv+NMiFF
         pz0q7clsIKPwGDb/sAWAPK9TGUgk1iaMtmJIdKOZeXMbCsxkI5M1g0WA8PepKedgqUyH
         XghgqzeQQfJ7vn3Ol+RfYQZQtdZ57utEud0cNCn0ZqCc/K44gaO2dawr9PRQE5zHfgPM
         fV3x5FyxV687EeiD1/TptIc5swc2TDuE9C391/rl3+vlad7q7nczd/3jcGzwha+Gm8To
         JUvg==
X-Forwarded-Encrypted: i=1; AJvYcCVPIlWZJQJI6yiylvwPrvVsQa+Gl9p4PGzbdXtrykcdzWok6iJ3ca5cPkG8SX9K7fk7ASnjqpvgnpzHUuxJXvsF7HhpPLGEMwAL4F8=
X-Gm-Message-State: AOJu0YyEUBzxTP/g08ExrFYsSVnaZABXBW6ofw52pf/6RVGCNKi6v/j1
	U4qDKrvkSSeMcjpC7p3u8eMFQ5SooBpbfZslT25wOwY0vR//1JJ/4yaBp9DFbhc=
X-Google-Smtp-Source: AGHT+IGET1esYfbROqvvZkY8IDH7ijftBgO2xjdYktEdnF7Izv3Kvy1Oe00gyYjczpk4u/qLWxjp/A==
X-Received: by 2002:a17:906:a8d:b0:a6f:b940:10b with SMTP id a640c23a62f3a-a7245c824admr801852466b.62.1719492725815;
        Thu, 27 Jun 2024 05:52:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d71f271sm57248666b.61.2024.06.27.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:52:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: add missing select of common code
Date: Thu, 27 Jun 2024 14:52:03 +0200
Message-ID: <20240627125203.171048-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm LPASS WSA macro codec driver uses now parts of common
module, so it has to select SND_SOC_LPASS_MACRO_COMMON.

  sound/soc/codecs/lpass-wsa-macro.o: in function `wsa_macro_probe':
  sound/soc/codecs/lpass-wsa-macro.c:2767:(.text+0x1c9c): undefined reference to `lpass_macro_get_codec_version'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406272231.th1LtuLk-lkp@intel.com/
Fixes: 5dcf442bbbca ("ASoC: codecs: lpass-wsa-macro: Prepare to accommodate new codec versions")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a99cb26eb280..36dabc045868 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2538,6 +2538,7 @@ config SND_SOC_LPASS_MACRO_COMMON
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
 	select REGMAP_MMIO
+	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_VA_MACRO
-- 
2.43.0

