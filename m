Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A8F1C461E
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944985; cv=none; b=RxLEqHKf7xKXk8PtXLDWnmKNvkoJV/p862omGG0LX7DTMVMoAIxX6kZEvLEhDHz/ksJ352pB7ZdLnMlkf06vwyQCqCSO+UV/TOIFnxRFtugHRP1V19dnDpb9GWGF276joxmUbRRAiS8UTu3r+yH5e8VsID7/Q7DjfVoA6+fyxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944985; c=relaxed/simple;
	bh=Ezp1DEESNAuzSnaq1SG6uwRupUnI1fkxIZaCm2O+49I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nT7OKrRUVlkA5KtZom8Ncas1YbF3NMOQMuUz5sL9ekGCWztGw6+he5ZzmXxE5a855qA3a+w9mlB5NuCUc5tLN6cWCxQicxMqvpnrfIhTMrUyyB7MZ/mx0p9OFdNFrw1oj0VsNkQ9EDURFGDqLx2x3CFv6rS0H1xvSA12pxR+qtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlZ41MIW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlZ41MIW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42812945633so4321625e9.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 04:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944982; x=1723549782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMlV2qVo85xWYVBMYhrk0PfH/1B6nF4UrxaGSSozyTw=;
        b=zlZ41MIW91eleJp6jQ/cNAGsszGoWa1MyQY2J9lpfpvVAHZJN5ygagEcVSmOHAh5EJ
         MRhlrZNm9cpce2/bhCPIcHMSH/RDF3eABEiNm8Mkx2sX+SaVIJ8na8J4aToA60hf9Xdg
         Tfyk/uKY0eggPguFHx42CUzxeqIrcQM4KmbD7cNvm7oT1Lm1qHfMO9i8WLVUtpEDfQ23
         3JYIZpM7zSqBHPNTPpBRXmwafNJ30pwPubjlMFLnBjtRQlb7wZAMMi9zyNOyZ7zBzkqT
         67IjJAzjeT0up639F395Qjb9t2HtgrYg8QGTQBAt4MSbYAI/kmd1Xuph80Yj9iJTh7id
         /u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944982; x=1723549782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMlV2qVo85xWYVBMYhrk0PfH/1B6nF4UrxaGSSozyTw=;
        b=MAAd0NniFNhJkcBIFwH8lOUya7911cc4TrP9Kvl4xzIrx5lUOo1/D6Z/Z0e7AVwhwi
         +J8BnbqsBUyrBg6bQ3Nw7a4aM/prIsG0DpOko/8rjt+OWBqqfhuKMfkqNR0yA5QF5k0l
         27fd/x+0wmY7ItrrUJsem2ZHM/w7t+nuOsVwYxwbA3yb6/WKC3RRwl843cCzBD9T1FQo
         JILa4+uUQwGiOwX8WADq6yxsktX/cUsbKhoihUzgCOqQbc5AVL+RU3Tz+gMATVf7COcH
         Dt+zw0RR4t4HhEBkfSgK50G5xDwk7uuW7LYi9zhMGIe1OmuEAc1+QqlEua5g9tEWxR+M
         5IoA==
X-Forwarded-Encrypted: i=1; AJvYcCVpZ2RV0dJE9maHIO6rAM8KcS+GvL4UAzQBOqhuupnlxan0xAsu49ySpBZil5TcXzCUsZ+Gn1NRp/xlSTzy72t6ZAAwICbNPL+0tBE=
X-Gm-Message-State: AOJu0YxNEzMdCRZFoaxXZCLaMg79j3ahVS28b/jURAa03eTV9ynR32yr
	NZFICV7sQL7zJHtDSePqutZQQp3i4ibjsDKuy+OvJYPcstHXpUb9Ij3vcUnc8m0=
X-Google-Smtp-Source: AGHT+IG0OfTvajOEg5ehvoF4v0jk7nAbAB0WzN58qCZhXcth2JhU2Xeyj9qeu3b8QEUJOcwwmdcrrw==
X-Received: by 2002:a05:600c:444f:b0:426:5b3a:96c with SMTP id 5b1f17b1804b1-428e6b78e3amr101124575e9.28.1722944982501;
        Tue, 06 Aug 2024 04:49:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,wcd939x: Correct reset GPIO polarity in example
Date: Tue,  6 Aug 2024 13:49:31 +0200
Message-ID: <20240806114931.40090-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset GPIO of WCD9390/WCD9395 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity, instead of IRQ flag (which is a logical mistake on its own).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
index 6e76f6a8634f..c69291f4d575 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -52,10 +52,10 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
     codec {
         compatible = "qcom,wcd9390-codec";
-        reset-gpios = <&tlmm 32 IRQ_TYPE_NONE>;
+        reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd939x_tx>;
         qcom,rx-device = <&wcd939x_rx>;
-- 
2.43.0

