Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09EC212B0C
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068970; cv=none; b=LdJVYCHaocgC9UwyJYXvP0Rz/EcbxYN1oRU6Xf0kkVHQDb+akQ+dR5qEsfY/tJc6HmMQyxd55CQsQc02DbdcAsx2B3w8pcKXEx0YiGur3t5Za1zP5wJusm0MwshkQ9n5aMs+Zmbmu25exJixDBX/fmtDss4DF0D+u4QQ4Y1HINM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068970; c=relaxed/simple;
	bh=/VfHNWugQzZOouS7hKpPuUUlotDhboVqpoBQsz75KJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Air8OE04yyt9uJeBeH2akCfN75qYSKFFa5xmB8rppLmXBGWFRxSwuFGsif10t8POl8QCYN7OD6ZG1g2gpsrNaM6sRHeKwkDvq6e8kV2lWdwesw7bXq7YD6AF3IpOFXC5ElGuQ7aV/PNDh7CEhl47PuteVqN8zW0xFhbSLAypOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5mN0vFR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5mN0vFR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so826420f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068967; x=1740673767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNs8W2h+NxjkcVzoJNbEyvvCSIIo8azfvztr8o7DSmU=;
        b=n5mN0vFR1IPe65oQy+wbhA8osJ7mkeTeTJNjdDqudAuPm0weqIAeqMdiHBajOO5MVw
         BkJjvqaJeoDf7/zHNNLBzavmWK0x/uk+aB7vvoFr/TFssJLg0eYd6I4aRD9SO5xGmrKy
         LAumR0Q9NgNst1iJckuJLQj2jG1ckbcn7IyXXQG1ZBbujCN3g8er2BcHJog7tXAjI5tq
         c0Do7BFknFGODU2dp6+ObO8PE0HFD1xeJHQEA+lj/HNZJW2TkcILX6voJkE+nIOY5wxo
         wvzma5b4pTErJhKIAIRTo9NqZ368DWp67wCQL9/C9PhNLoQ3xmu5wMa2DY8Qbn5rq2Ap
         c63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068967; x=1740673767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNs8W2h+NxjkcVzoJNbEyvvCSIIo8azfvztr8o7DSmU=;
        b=ZQTx5fy5bfOgj+gAw2aW0CmM5DsRQo2D/vjUDGDmXAViXnUWv4F6lsBG6fjiBG9u43
         Xrjr5spuUMQkdBb30Mp1GfkGwJqoZWhawbZ8m9pEZWLMkzuVFK8NhqSKdGPtnN+nnU9O
         9HwIg8JQO4z7QlyavRiuzlG4INdQxXnN3xLyHu3rVsv+Oi5KBletFy5ssgAehgLTP4WW
         wVZrjmEWQCfrPrGfNNSwnay9hs1YHCmzI/b/+cby1nm9cU8mcfj5pFBSPRzifcvWRx9K
         3KqocyMheDd25cjnRs8TBkZ5bLDfkdlTyrCIFeta4NF3Vqm7zdEtv422UD0BwZUG+soV
         ifIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk+R5f/yJfbujhdmKtgdLagVRJa/4Tb9isiE1XcfDS27lv49HKorsfRast0rO8uUFR2eFOiSsPs+tfFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwurRYOMUFD+c/ffmg/Owsr91jCBZY69W7zzW6nbYSE5QOWUD1R
	mLDaut6KooK4p/kjKYWz4GTpCPNxTi5PmVYY+OiIIGYB4QVim4BU+6egvWq6xQE=
X-Gm-Gg: ASbGncub6D+Hb7M4zzkuVaqCq+9g3uVeV7xfjIAgCyQx43l0GTqIXHTj5hP/tesDNUw
	CxHqVwTQxMts5njaSG5NzSurPjYmiEbGhzoPkUdA+7bKZkL8be727l24ENoJlVSqwwFErslFEJP
	3PQ5DfDfcNtf6+0KSfkJimSHKjoJSSCAoHUUPjFuTF9x/UN3XC88Qe+DEKaL6sB25PNHGApQtP1
	rrOxDhGmdm6W2Fmp+1u7LYPuqRpRan3V+E1SktS2XFYvOOxpnPLN5/obYnd//WB8N7JhDmWe036
	fC41z//pwCXI4CyrwREJZDs77jsdSY3saYfDA8nI
X-Google-Smtp-Source: AGHT+IHjLSNxeifF/38VMi7dEG8R8mOoiltOqfkJG6DXGhVBYkNfwPD9ab3HxUNuKUZ0XFxpl43IYA==
X-Received: by 2002:adf:f3cb:0:b0:38f:2a7f:b6cd with SMTP id ffacd0b85a97d-38f33f3dba5mr15018331f8f.20.1740068966979;
        Thu, 20 Feb 2025 08:29:26 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:25 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/5] ASoC: qdsp6: q6apm-dai: set correct period size
Date: Thu, 20 Feb 2025 16:28:46 +0000
Message-Id: <20250220162847.11994-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

For some reason we ended up with a period size which is less than 1ms,
DSP does not support such a small fragment size. Adjust this to be in
the range of 16ms to 32ms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 7466fe0c661a..049b91fd7a23 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -21,11 +21,11 @@
 #define PLAYBACK_MIN_NUM_PERIODS	2
 #define PLAYBACK_MAX_NUM_PERIODS	8
 #define PLAYBACK_MAX_PERIOD_SIZE	65536
-#define PLAYBACK_MIN_PERIOD_SIZE	128
-#define CAPTURE_MIN_NUM_PERIODS		2
-#define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define PLAYBACK_MIN_PERIOD_SIZE	6144
+#define CAPTURE_MIN_NUM_PERIODS		PLAYBACK_MIN_NUM_PERIODS
+#define CAPTURE_MAX_NUM_PERIODS		PLAYBACK_MAX_NUM_PERIODS
+#define CAPTURE_MAX_PERIOD_SIZE		PLAYBACK_MAX_PERIOD_SIZE
+#define CAPTURE_MIN_PERIOD_SIZE		PLAYBACK_MIN_PERIOD_SIZE
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.5

