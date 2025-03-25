Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032522561B7
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902867; cv=none; b=KhXWt8dHzRsRqrr9G2PCO8v/pvas2ffItop6xfHEDDaLYNR/Qj3QJwgXYc7wMCIsqfVGz/N33Co1gF1mv7Uq2v3BZrY3SDJyNsCa8paLiRduIMA/c1IbkDJWQUETJsFwckiYAZXCqSHwzBF3AORBxNnyHYuWf++yqvrwnkylAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902867; c=relaxed/simple;
	bh=nzVmJfufed+ekMZEjdRDlysNfkHvhI2RIGmGqRITGrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dNIQYJhWMrL/BZrkr2FnnPiQVYf8Q03DItJ+kdPQ3shApGyOGOUjT9fNkadykSZhV6eCvYnhgvNTWdc+pyJicpx2VkUq9nmQcBcIQH/wDb5gPR9wWkz5XPdp3MVowQB1sIZkI5pa3LU6xwqKowNaN0QuWxLiZkpu9A57RN3lAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffWRSv8J; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffWRSv8J"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso24803855e9.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 04:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902864; x=1743507664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=ffWRSv8J+GPpoy6DbNK+oKp1tY7WD4lq0zW2WzZjKmfy9AqtHmFqar8PY63iyhyqpY
         IJ3v31dtWrDJ8IGoUkGogdK1ezqGXD/4+8flP3qusj1Sdn4m4cQVmxmZHFm5Mg9VY49G
         Gw6+qTpu41rj4/dc3srTpCkgaV+SjikJw//DNigemL8yyZNXLVuo3u4/WVAgBYQmMial
         7WyPLZuIZjknB3KQTQ4M2Yh/oH1cqUaZh2lObK/ug7O5ouDCvXxoSOumxIlloOyQ5gGM
         j8AhfR2J9xgSlJkekOtSVcglrViP+rnDcwH2ZX5+YfSoO/wpz0WAJUCav2irLGm4l4zb
         SPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902864; x=1743507664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=chKXAPJdp/7Iy5Tuzhr53QUWNY3oEh87Q0gje4WQLt/G3nVj7dH75ijRa/V1/vf2ls
         puaUNz4f8aNqXJctFzIC9jw8QPjpMTuQpzcrl/8J+MCfiUzCLRaas3PmSL8F/7s9tcOJ
         vsNELkLRgsEWXrUN4gwGWK5lo7NHxd/eO2jdgIVFd1hvLgo5MS/rpJMHvJYuNvDqiqMv
         VmLWa6r/5ObhidwrKiCaKhDC+kPaCM6UlckCXJJaLgFbo1ol3yV8IvjLjsdsOeykqYD8
         dXh+mc0Za5C/VZkSPuRYxDxdaS6Qpj3a3TtQIHH1XJBu780g41jd7ziGys1mP+ezNLE2
         iUwA==
X-Forwarded-Encrypted: i=1; AJvYcCWXKeoxddVgx48KJPa+IGBcTCENICrVnqXWria2sWTy18tD564YM8mxA746rO3/zp5fLthn+w5OIg8T7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEUeHYEpegNx0/BKGizPLBP/N6fTRYWr4U2uFZhbyuKZy2IwTe
	GmSkdG9P8B/gCZPwhr+ipbx3H7S1ofAsS3D3yDoEA1ubIRtOMajk/+dYn7dxAGA=
X-Gm-Gg: ASbGncsB6qQTKa7USTJaMUiq/CHi+wjQBXp8FUtE6HNjlIjxIUendEpjqkDz/soeaW9
	4/eRb1IO9N7uM/drzckkTqEEyZv/1hVN9no2H0p1jBOplnN9aOjXlA2lScojS50bKTMSNLlMk2j
	bTVPJRaBZpoyBL9sr0wGDaD3O3ZLnevsdH094U2Pzti9tljOelgetpMYDjKO5U5xdEW/oeRsAwN
	KWV0DwB3gtwqd/XKyZfLJFJfkIgOviumy2MnXXKs9y4R26SBndtVsQ5UhVH4tCqog9TQROid2+l
	V8nm5ywkZbgoyE8IuQkPnKnTAGSLXoLCSMrfmogRLDrZr+q660eEwrq/pQOUgCfrI8izLA==
X-Google-Smtp-Source: AGHT+IHnXTKa7PclIfoxNwdAn+abeRK1ZHaSvsObkxA3nuEMe8tz977mZM57XF3mqVcCCaA/t91RfQ==
X-Received: by 2002:a05:600c:5021:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43d509f6788mr171568615e9.17.1742902864348;
        Tue, 25 Mar 2025 04:41:04 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:03 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Tue, 25 Mar 2025 11:40:53 +0000
Message-Id: <20250325114058.12083-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5

