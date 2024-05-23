Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647C513CFAF
	for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 10:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716460964; cv=none; b=opUf5O6EdTe94p7ZI2hT71OAPBUlPN3fcRMUzDb61sN3IPsbNxLTDBVG8FtkI7jMgvlFQL3x5u1PN6PN//nc1aaKCY+2PFKzEp7Qqb+BFMyp0zjrvZkq6ak256UJ1kAxFsd2qDxsRTyJDyDq+aztM10KEUUakhpwDXTgBDNFv9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716460964; c=relaxed/simple;
	bh=pPD2rS1ZgskYhKHjT7ris9b/z5/qXBC9txcXhZDWUvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fs7pen1nXzwtF9WTQGL9CVUvKA2XE29Kx8YbA0PUyH/UtxJic2I3lVR3zRSpwGXEFHTwe//hCElnycqN6XeHUAS5Sv0X5to3VotpUwtH7en1iB4mH8GRRtve2F94YtUbMJT4+QX4Z3L8mPDFHIBS9vLscOS5WYBID4UpeL9cyX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qLqvAqAx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLqvAqAx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-354f69934feso447180f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 03:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716460961; x=1717065761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DaH0WUaVpR/8gbZR869sa1sk2qXADEzmLsvjAUS36EU=;
        b=qLqvAqAxBAmV2dcEbWWmJ2aN44v2W4mx1zSiv5TYDy8H6inMDeblmMXB1B7H5XtuoS
         rZCrCYXqYQBSCtipj3oPsxwIUN9kGhG+U60C/YMEWXV0IUn1Vz+6Ac0Jifpja2d/aqAx
         2yyKG7Hf1DgodQNQ0ANpGw60WECI8Wlbc/uRSuIo0Jz4iywv2fw+pWvY1msm/0XEZI03
         m4FBDiPVD8gEvWITFjmDqCgqSaFed1DfqRZ+qYnfYCja9lCFGWCfWSQvo/jFaRTFhpL3
         A8hyHVpdy9y1vjyvoTof7YRK9DE9cUhooZeiUoCwWyUIiJJupYVbVd8CsNV1znGfQIGu
         Myyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716460961; x=1717065761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaH0WUaVpR/8gbZR869sa1sk2qXADEzmLsvjAUS36EU=;
        b=M1p5acA2QLLkcnIj3ZGwSr9i4GA004LDeNRXHJ+1F3a/TB6XnWZWY5gCb/lYMfItSD
         rD1tzyXqckPa5dChIEW9Gyqj1zbjDl+ruCKwflv+nh4AFGabuww38+ftAdzmjhENhnMT
         csSiD3qQngm47xV6+nAsvD703Lszv3dY7EKUDNxz9/uK0sWOha7c3XkAw/U7K4Yqi+M2
         lLBuUAQTK4740ZeFDMrXFIUSUmwILgITOt9cUHGZ2EMKo5naD9pGm1DDhbbicP9E6udL
         jboA5saIbNdt9jL3wdjv3NCpEquCe5aipm+YNqH7JVJ1h0f78mjiVOvFM5dE/4Ed5Zed
         Cf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4y5TQmyJOHD2aiDLSolTbVA1qWOH6wO3r0pvjVc1DQ1ZVHkBg0/NcQWqPlcGqhy6aRTK0OmpKM4bMNmXJDNtzC7P8qo279mLoZc=
X-Gm-Message-State: AOJu0YypMrIuh38OTo0VyFhxuO52gh0frv2wCpesRT2a0AohLJNtuhrT
	pPf4ZpMFJoasBdvLW0gDzJRrWclCMfsD2E9PRslV81YqdPyLTM+Vg8w9iuKonqk=
X-Google-Smtp-Source: AGHT+IH/fm458wBPdlXEb1gtuOzqmAIVNW1EA1Cak44UuBRZM5nh6/eqhRkhg2PYFkM2VvDBrDPuFA==
X-Received: by 2002:a5d:456f:0:b0:348:7e75:4d75 with SMTP id ffacd0b85a97d-354f753b77emr1706027f8f.22.1716460960667;
        Thu, 23 May 2024 03:42:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35501491c40sm516038f8f.28.2024.05.23.03.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:42:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] ASoC: codecs: wcd938x: Drop unused duplicated MIC2 bias register defines
Date: Thu, 23 May 2024 12:42:25 +0200
Message-ID: <20240523104228.36263-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All MIC1-4 bias registers are the same and the header already defines
register fields for them.  Drop unused, duplicated defines for MIC2
bias enable register.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 74b1498fec38..df07e92d9d97 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -75,9 +75,7 @@
 #define WCD938X_MICB_PULL_UP			2
 #define WCD938X_MICB_PULL_DOWN			3
 #define WCD938X_ANA_MICB2                       (0x3023)
-#define WCD938X_ANA_MICB2_ENABLE		BIT(6)
 #define WCD938X_ANA_MICB2_ENABLE_MASK		GENMASK(7, 6)
-#define WCD938X_ANA_MICB2_VOUT_MASK		GENMASK(5, 0)
 #define WCD938X_ANA_MICB2_RAMP                  (0x3024)
 #define WCD938X_RAMP_EN_MASK			BIT(7)
 #define WCD938X_RAMP_SHIFT_CTRL_MASK		GENMASK(4, 2)
-- 
2.43.0

