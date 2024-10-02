Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D549383A2
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 02:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835633; cv=none; b=f9KyXgGhQ3JyHs6BWCLlp5zM5rJzoIbXVTBHDZCklx7pr8NQE04eR0AXtsbFK2RgjGjRAdwrkvyGjpc3iSMnFSNwfQkz0IRf9DGu7+sst/chEHXZX8KKxbKfJSAFT9//BI5gOuoth8n0msijSBmZfIXwFxajMQUgq5YajaPl2Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835633; c=relaxed/simple;
	bh=ric+SLdIOtDdMn/bjY4ZV6JUUhcdjPFI79OUCHUnDgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiBpzTZgawx7iFVSHlhkKx02YJx0Zvklz5uErdpa8qU6hXj8s/lS/FfC5dxEfTeW8a7+bRJMey2/r/i7q3dX79etr0OeThckXObMeumTwEV7vY/llJFSRWOaemcb/BfCGhn6XaO4qCyVeK79oJ7+x1ZjzKp2kH2jJaNJt1pyPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APLaMqT7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APLaMqT7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso993514066b.0
        for <linux-sound@vger.kernel.org>; Tue, 01 Oct 2024 19:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835629; x=1728440429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIw3pjujevMfYCBuBjwX4+AVabirKPTZ9D57CaVG3PI=;
        b=APLaMqT7Xyt2MCqDDHtsTtlsgCf9enskEkDfoAg5FzR8xc2u6EBx4M1URNYHisfTDC
         fgqr8RMmZ1ah2DUX2RSxS9JFJglIaenOwx0zqIIyQMkF8ZiG578TV9uslsXV6+aUOg+v
         9cr0I3nhPsUN977J9flCMYQDjzuY6E9BV+fRQHiJ8rQBV8wBJxs3wm+rpmCitdMrTzl5
         OCpje7f6ftb+VxtRjImv5Ade7XKjg68sML7RWBXOoK6ksFxgaXNH9y80rSbBmCNiwQzt
         joi7fqsh0Uw3hz6/A8MS0OShnQIgCyw0LC6UZYdyrYn6Cm4twqCD/5/A4PZLqsevsnmD
         Lesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835629; x=1728440429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIw3pjujevMfYCBuBjwX4+AVabirKPTZ9D57CaVG3PI=;
        b=hpKVCqyaB5boeTi7yk4RcrqhmmRj53xN8lPB/VncKB1KMF10vhAxS/NpXTieNcfUm9
         jMPSdIQDKyTxn9piMmDTiq3ZpUjxQlIIGQDa7Q+X55buCqRaesvzCCHkNCENB20WQi4z
         uFpjFaKDueBW32CDhU4NJC+l8cCj5bK6KEqAbhlLx9+un1uombIKqOhtlZRn/0554mP2
         BKZPKd0YkfZFftpp6wp8k0IGtoFIATfx1UQMooO9F1KxbeGIe7+7bDMUFt57e/gNvDfX
         ob8hMrjECREawQLoKt3A4tBHBsSSBbzEz2WyEMtxGYMEn53haHfnrc1ZCqO4CZZQezQv
         kqbQ==
X-Gm-Message-State: AOJu0Yw9VR/+7DbOOVWvtho3NUZ3yqeWF1tj1qpT5AIlr4kzfu/fEee6
	2aSA9YW+lJX6kFehuh+sx2yJmIqYbDT2UvKnESN1QrPO0/Rn6ysf4zQWumIfqhzAHSIWCteokT1
	WS4w=
X-Google-Smtp-Source: AGHT+IEVv1yZPyk7AlihJhG5VqeeKRdBXm8rwVDjskcD7VkJNBZU1ibp+Au9f/NNatFh5EVKsuyquQ==
X-Received: by 2002:a17:907:7da0:b0:a80:f358:5d55 with SMTP id a640c23a62f3a-a98f824f579mr132293266b.33.1727835629204;
        Tue, 01 Oct 2024 19:20:29 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:28 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Wed,  2 Oct 2024 03:20:13 +0100
Message-ID: <20241002022015.867031-6-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI)
pin controller device node required for audio subsystem on
Qualcomm QRB4210 RB2.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index c5add8f44fc0..37c0e963e739 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sm6115.dtsi"
 
 &CPU0 {
@@ -36,3 +37,18 @@ &CPU6 {
 &CPU7 {
 	compatible = "qcom,kryo240";
 };
+
+&soc {
+	lpass_tlmm: pinctrl@a7c0000 {
+		compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+		reg = <0x0 0xa7c0000 0x0 0x20000>,
+		      <0x0 0xa950000 0x0 0x10000>;
+
+		clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "audio";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&lpass_tlmm 0 0 26>;
+	};
+};
-- 
2.45.2

