Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232882765C9
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765069; cv=none; b=C4aihc6Z57IDjLleB5wQ19GiODdmyApGmCzRJlEIIvFe/6EH3WXgpvfal+eCYH3Ken0R+Pnc0+l4/FeohLYBVZemVFscNLgkvNJSkOxeqpWVr8ObF0H+GIA/uQ31UzwtvU8tfxIup5nZ5zZ2TRVZbWTDbDPhaWUsgrLltVsCDqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765069; c=relaxed/simple;
	bh=iqqc9H3kVGDEO4owcMh77Y6V/4jzKjChKYZ4/hBrnt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RPmcaAyCN9ZG/4NfABlgOJJpV+PwN6u7nZDGJz22umetosnxGXGT17CkUead3qNfnnTJPfn6RaYSWWFz70pZzU2NLXvG7lu2gKIu0cADk7bIzLUat5yh541aIUp5/PLuzvanu1E3ssS8VWHZf1cfwV3quPFHEa1+YpIZVPtiQGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvePidbH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvePidbH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78d5e13so7727766b.1
        for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765065; x=1756369865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=;
        b=dvePidbHHlQjyzeFugj9OaFDHPKSaQKJeIifd5dxdo8acJdtHKRVGz6vhO/kWKCD08
         ieywzpXAKGVxglvZhs5ipSo9vPO2sAS7B0Ov74vCn5S14PU5VvgTkWiYR/wYpEHxNY9y
         Z6LnHtNjxbiSK3nk/45eJDFG04sv5WhahCsGJC9cEtVM3YvA5S+741MeL72j9YAEdjVD
         dyx42BCtW1LASmi3RFmAwXtJwmyDf58/6DjgISPF+eEyydHXb26yvunI6Xiv3DCMZe7H
         tBBHEeiHIbOB2NMAQyfw1t4mFeimgp89UkslTnAHdnnygH0Gm3Xn+OxIE7Sag/o9e9ko
         LfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765065; x=1756369865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=;
        b=U46sZHQQIbjTYTffuicIjZ4oa5Ub2X9pmOhWN/nt8ZDrn2axwiT/OaeE0bGBl5XhzW
         to5114xBV6G5qU6V99nKP7gcVELoKdG6Sl3Yl6yNBA2ZSVgUg5wGav9e2T+r/UxKyms9
         elt7XZbHm8HWZGL2R2DD17yC49crorhXm+ppWgqyvHYd9LFLasIWSdt/5Avj09eAXMoe
         DYjiikmwxm8RkRn3rgZngRrrrfj8K7x+BUx6QnorVr1adbS2ct1GEWWkeXMnN6XjfBCr
         Q5P8Qk1YcKjroxX4nhgrp8VhH9YRRMAPqv03buxA9XABAqgrHRTvo4We8LiV1kblFQPT
         BEcg==
X-Forwarded-Encrypted: i=1; AJvYcCW/N9N3iCsls6D5oq0U2435PogKMlqi5Bn9PYcEyct0rngARolT+CDuUw3V/5YVawx26eP+8pOij1D/9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVkXzYt8iu/tKXOj7FFv67Bs0MfSfq6sO+jrAnt2pplzotw4FX
	Chf8UCAYZdqdN6pqed2XmVfBnLhSFEEP6pWz1pxNIQGT81nBbeS38r8TPsZeuR31yqw=
X-Gm-Gg: ASbGncs9AkJdkPlEyeniV4Yj7iWSDKEI50a4NRkXrZzzIuzqPUK+586IfBX33ZyH3UK
	Y0heoXL4XbRYMq92+FZQ/HXBoG5o4jk92B9J0OU9cgJbdvMlOKMp4yT2RI+jdYoFRk5WOx6mCB8
	UkGGZmEPPFMIGSCDB+Hz64HFdlBXgAu2uavox4TdnFVAne7Y+RRQcQCzcSbV41DNL8Swhwfz8H0
	VQYwq+3UknQXcO5jRQS8LqkMUTht6gV4ur4mb3BM+MZWTk/h0xf0Dk3p/nherdjcerDzg8MTPSv
	LRLiGAglD1LTzanBtR7DB9d5KiV7d6kZKWvssDd6znxKnAYFtzwWBD2IiUYfJaVouCxO+qaSCkS
	mp+zvukG6fDo8AtnipXO3Uv1e5teG4GvZKA==
X-Google-Smtp-Source: AGHT+IFNk/pJFnDs4lRHPJnbj+R0+UoDvHoNWBUQnniqvKfqWInUDOjeDP+OKC+piYhF74oUFSgD6Q==
X-Received: by 2002:a17:907:972a:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-afe079e2116mr74283566b.3.1755765065406;
        Thu, 21 Aug 2025 01:31:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2fc568sm346436166b.38.2025.08.21.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:31:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:31:01 +0200
Message-ID: <20250821083100.46340-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=iqqc9H3kVGDEO4owcMh77Y6V/4jzKjChKYZ4/hBrnt4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptlEzToO3Ku+DKnz2vaPiN1ssj2RVk8DjRQKc
 Qtcz+MExfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZRAAKCRDBN2bmhouD
 1/4tEACNYir9uMarV45GanTEgmnE4LFISWmgKJwbLjhiKVj51LWYivtWPj6mF04MOvmQ/0uO4oC
 eZoanmeV9/UPVaCWfsvGdXfIwkF8G3ezVQSCFHL8s/VzedE9HUpJUqTU50rc9jZtZKhZ4ACtsr9
 Ci2yCUbRSaoDyloZXA5YI0ImHjPi8QXHCa4TJQnoQPrIiTUw8QupgbCttoCDPzrcZWBpsjb7EIq
 aKun5PQRfFRYgBN1V6bl6v+1XG8GLHEfxnvFMEF9Hd5ve561qriEMBuzC3tYaSmfaAr0KTMgJOc
 YKJr6lmLHAPCZcbiIpVDFAx8/dtmHvuayFfFjuFmf321cHCUYfdAvLR66Fe8hfBpeI/xEOEBDCj
 7bB6b4sPJLZRCH9KSRHud0IaFOZGC6bukzBRVc95w0EqFIYgpcIDzA9mq/GIfUSnKSj4XWFqlBm
 DRmXsOAnThbF2L5ZDfaux9b2woTITUBSKUwcSCEYiQqNJlyBkja4nfOJ1rQfvIC8WqEu69gV8Ku
 +hCx1Dx6/lkn0FJwJs2hDLlRczw//7mZonnGXjdaEWslBwqK0bAGEspxUG9wwEDfMtYjJHRQzWy
 ovcuxx5q9cnEdPmVYf89/0u7owD8QmBimSmPtg+UCWVkkDMeYcatGhMRTur/sdy4OZU/I9uri1D Q1A603HnLHhssWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/fsl,easrc.yaml    | 2 +-
 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index 8f1108e7e14e..d5727f8bfb0b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -104,6 +104,6 @@ examples:
                     "ctx2_rx", "ctx2_tx",
                     "ctx3_rx", "ctx3_tx";
         firmware-name = "imx/easrc/easrc-imx8mn.bin";
-        fsl,asrc-rate  = <8000>;
+        fsl,asrc-rate = <8000>;
         fsl,asrc-format = <2>;
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index 85799f83e65f..c9152bac7421 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -176,7 +176,7 @@ examples:
                <&sdma 20 23 1>, <&sdma 21 23 1>, <&sdma 22 23 1>;
         dma-names = "rxa", "rxb", "rxc",
                     "txa", "txb", "txc";
-        fsl,asrc-rate  = <48000>;
+        fsl,asrc-rate = <48000>;
         fsl,asrc-width = <16>;
 
         port {
-- 
2.48.1

