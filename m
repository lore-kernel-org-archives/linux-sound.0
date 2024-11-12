Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEEA205ADF
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 02:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379997; cv=none; b=Wd+dsw3H9iEQ/A5MhirBcNUbAvPAP1r8VguxZwUDFj04KnraSqCMTXVJd1x0Cy+C844askxD+/M3UFEd2/qfNdgToSRLn30rkQe4pOaHfSVSwWjECLuLAJctAvPaT9qQLWkIE6P1Sk7x1jieybjtb4Q8JvmGPl+BFwaZ64xF+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379997; c=relaxed/simple;
	bh=ucgy9cTopg4E0lG1/WUWNQk0L/jEkoP91XiRceUS+fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8CFY2ed9bPaZZarywquCh7u6myHKY8zXzEFYBjlG6Sk9gseGk++qK6RIzuoooc+4bk9T2pRAF/Kmm6INOlayWKKPcch+33VlIEtpGUujHXrWh0RUqJceW1FPWtb/7CztSpmmmbeFbU2FKVAdBA2tTBhVHzcABzACCa7AyxUMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOp5U5/f; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOp5U5/f"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so3145769f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 18:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379993; x=1731984793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUmkRrbbbyk9xLx54NwTCapKIUbE/O+g3oU2muHUiIc=;
        b=gOp5U5/f4RbKfVW2JEv9bPATv0in9hqoVo24bRUCJ2UZX/FtW6FpfNjXsRn9Vvsuyp
         GbLr05sU9YTSpFrFpg8Jj8ojcnuiy/Ufxu3EDevUNbYi5zYcVIK9JatWz5Mg1K8y52gX
         2tHfwWNuSZTMh1BfGg5Ui6SCl2DyCgFpXTjK65PK/W9airTHxpDUJPxon9AvYstKsbX3
         f14BGCVZBvNzD4u3Fsd1o8C4lSJ/gx7O1F6Mb7hshYhi/MIWqORUCP96KJbbLOwWbOa3
         Nwihdtlb0KPJCQIjmIleBjfifmepqHgOqUWC8KJyM+qqsS79HAwAOzK5jRj1nWElzgjE
         /oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379993; x=1731984793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUmkRrbbbyk9xLx54NwTCapKIUbE/O+g3oU2muHUiIc=;
        b=pK1yzNJ7L0soUT5IIbqXDX5DI5qJdfn6Tbn3AZjeNByRFkafj8DfWI03GVQgpFjtiA
         /3JGzeiDHoIjKPYKBgUh0CKUhYZJAK2gGr7eRkKmehQyt0UbYBjY4cRWxEBOSr/jVEom
         XXZMTNFB7qWuJVHU1vYC82XmlOSVknBIDKRWPnTaKLZQDZkXi3DItKZzERAP0ov4y5CG
         sMM3RCHggWvpxx4Hi2WAqyooSnB08sdA7Yy8YQOd1Idgm+M3nqWc1Bo9XW0JHaZAV8A8
         1VbXj9LGK0JDtxrq9FnKlepLIhJxhcRjynphR/6ihyU9a2zek5H+80HeAD4nYvkYqU4A
         Yr0w==
X-Gm-Message-State: AOJu0YwpCGDpuWVMw849QCoxt8dEMkYxPS8688hinCuNkrO+8Q4F7HPi
	5i6A3VXELoAE3l8gktpgCyOekuxNXOX8jyyfKpmPnPn6v0BFEq5NXQG36OQBmJM=
X-Google-Smtp-Source: AGHT+IEwJoxeWcs+JgTBSm7RguLuVxJryodvRLUUZ779A7RyAXR4KAjN/Qdedun538HHJYqULBojOw==
X-Received: by 2002:a5d:5f52:0:b0:374:ca16:e09b with SMTP id ffacd0b85a97d-381f1863404mr12322257f8f.9.1731379992780;
        Mon, 11 Nov 2024 18:53:12 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:11 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Tue, 12 Nov 2024 02:53:04 +0000
Message-ID: <20241112025306.712122-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 816b8331933d..df2241237b26 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -810,6 +811,20 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6115";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
-- 
2.45.2

