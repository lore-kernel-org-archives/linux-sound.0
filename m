Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943C715A86D
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113230; cv=none; b=nhbu+8VStI9gaSiciBg+TOjMPJy/zW5j6+MIrB8gXJkgzhbCYuQNReY3M0o39sunCYZK0JJxILDWG0B9XIB6xjWluqGz28oERsvciumApKOf8eOv+3sXfLohpmlNtjpW+avG237dwqJJBas/EFMufwydM0cXJ2tvSdMw1HxHa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113230; c=relaxed/simple;
	bh=S97oSVlZN3KadS5+RKsMHqWslriATuoFqnaos8OAnCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXZ3KbzIXurUTeDXcH8gP0tFugkrWBWjErVf3iZda5z+7vZemUd473L6PwHZMgdohvqGMq/3mXduawt2l+VlKwPtVAr14wCfj+E23IOoSXc2mSd/ttrp/mE4Xy9Xl1qj6j+6Nb41ZqNLQMs3aGDkGDUDrMZ3T++vx5nMcm8Vv9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+PzS1mF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+PzS1mF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47114a40161so21800245e9.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113227; x=1761718027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2kywcqHndau+ZX1UJrHVrAlF87vou6twWGANcsSckg=;
        b=D+PzS1mF2m5XAgZxJv9W7JVRgqhuEJhiPu8xgtDSBxIUJFXsbT7wX2jyM+KhoLmo7M
         l0gZYApbleMj3lKhMcfbt2dCi4zRWUzNfEVXte4QQnxhCYupOQzuhcloStpalCPR5MWL
         Pb2UIie9zne49V2Ia8IcaiWLA1wU/RVhXDeuPZdx4dfk/FRMyYYfqAk9MU7N2spFr9cn
         RegpidKiA7UZ6KspbWBqjk5EvP8KxzTTqanE043aEg73NrY8RJZxTxj5cyPJxlZduRzU
         32aEyfI3NmIsY/QM17Bsv+rs0dSamTB5gMHJX55bCryuOzbjV/NPWbOlIbAkE0kYiaun
         T/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113227; x=1761718027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2kywcqHndau+ZX1UJrHVrAlF87vou6twWGANcsSckg=;
        b=o+nj0zSmZDHkyHnUtqSlY9VrP/KnpYNqJOHokadRiCbx8w06gfC7CKHKlVaKBIpAJ5
         Cakf24HaXmwF1TZIrQs57qPkGolIrs+NIvtnAV0nywpb33ubnhcGauUVoxglXLf6YzdP
         tyrXkt0FL4OcIYtsfAn3sTDX0O344WFCCZexk8bhD7TgQuOrUe8aRZp2GnvSPK0sLZig
         1Ut+fnPmOjKUo7FUsvMak4Orq3O5cWlgNvwlOmb+gaTDUXYJQgqWlLq0nG6JaIXjCe7+
         Cyv2q+GQ7X8RJMLmazABsrMRrxttqwZxCZtB1IjtDzsUSyreKe0skBsJSDCkLzEymQSt
         W55g==
X-Forwarded-Encrypted: i=1; AJvYcCUuj0XogzJmg+PjTqzlM5TuNlisRLsuxf/FzZ06xEDeC9Yme7ZxFCoECnqRVxjJmUXpVixJQKUNQu+TcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTh2MFuyay3ZgcuEI87qUEJ8cGkbW5mrVyPaJ3kJSOTizttA0L
	CgyGqn9oYVAjM8zGyoNrnr1OLu43hziWFcCKRS29Ms+OP1Z6mMopo/MlUrM47mixFWw=
X-Gm-Gg: ASbGnctKd2yST912HGC1VJFSqNKJakByiYJbnnAOJ3d7d/tpnMAL/uvZcWc2ZE6VCha
	r08cebP/EZkNnGFFErF/vLgxMir1taq2kcCgav8xbgB/kK+TNfAjCrRDTW9uYngy71nNRgE/ADt
	vFgFVRJ5xSGxHHHr+2w7D/PBbMJv7iFxvueLwpBlLddzDWBG+eRVuPVUAWgUQuvTSqCWdo87Ozv
	+behpEoDp68+qAAZ5IDvwQ/7ITMuZBCQqTRk78T5YYcu51iDZ+oluBeKsGpHuqrg2Yk9beaXR/U
	I+QvzQZic+p+4sxC0aso3IdIw2X6MtgBNZNG/iB9XQqi3mqiJBUAJa0lS3IFyOahbJ/YslUjsMW
	Tmg9cuoYpJSmf2nIreEyt5CVS/zjrdg845Lkb2/ruCVe5O+AMS1dj5JF3QlnmhU9yCr28ZoqgdX
	1GoBBScJ4x5IxFpmzX
X-Google-Smtp-Source: AGHT+IHvY8MI9FmdOJKvxqkZENHKXLT9a+Nnec2BglSSWqYh5CgLTYL8rIj1yUpyF0vSSs/N2lIokg==
X-Received: by 2002:a05:600c:871a:b0:46f:b43a:aeef with SMTP id 5b1f17b1804b1-4711791d923mr117704085e9.38.1761113226858;
        Tue, 21 Oct 2025 23:07:06 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:06 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 07:06:42 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-rb1_hdmi_audio-v3-2-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI/I2S.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7303aff33814f256a2ea09a71a640db466370eff..a378bd01099633db49051a87d0b0f06e07c3ed2c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -673,6 +674,43 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,qcm2290-lpass-lpi-pinctrl",
+				     "qcom,sm6115-lpass-lpi-pinctrl";
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
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				sck-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+				};
+
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+				};
+			};
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-qcm2290";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;

-- 
2.47.3

