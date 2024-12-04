Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B61FC7EC
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320838; cv=none; b=CwTDLj+EXqQtfkmmUF1QjU0jkHj4UK1TPzofJJk7fZZfAMrvjQor/X2cIIzOfV/jMGGEpdjRyFzo0KOEDTyuavgqUA1r0qL3vlD9/25XM8nRwC6Ll7jLeRc4Pcjn5ls9ojldSJMDGq2zzmeXarZsDkr+r6jI1G8HGzORiL3dEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320838; c=relaxed/simple;
	bh=ssp4dcsZCDyLM82QaOE3c2k7MIcONTsg6QEdlf87K3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0SMXp0bkSFh9IxUIPEWdi4A2YlGsRsA4juHUDSQhwurQo17R5vhHkO+kpEMGkurKiacTK6zIxhMPcLA7rnB56YwETbDe4SeQZpQQB2oLvcKTCs+JXDwSovkE6/qe1kxSgOahNtWHytHiohiWBh0nfleULR0QVeKKZZfoBIODl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J3/fqKrK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3/fqKrK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385df53e559so4015900f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320835; x=1733925635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLrHu50pzztwUqxBZk1ZRxPuancx79BTgjqfe/nlYrM=;
        b=J3/fqKrKillUlmpD9RJRk/x/mEia5rX5KcylXC48IPc/NX4hJQMfkpmv2rW6fVLN6d
         dAVpqeQQ9Nl9f9WOIRrlvS4Twi8kinTGqIvUkZVAL3LMBjKsI5zeRozaPrs8cuGM5/NA
         spDwchv3NcvyUCE0V1QQoq3PQXvlpTK5SH4JjU1jx7MPMfU+AasVMDSTOjbh0Zv70ssT
         Y/GtqrNtMtL/W4lVMTNXMB3PkkQHC9TFc+lGpjfVVYVvlmLHc4rHbSuGQc1jOUxO8+PT
         6NhPKms56vTMympq9FShlrOMvcLRXz4YrpwQaZMCHh7kI4RQK0XbcQ9gu2JkbqE/0eLN
         kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320835; x=1733925635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLrHu50pzztwUqxBZk1ZRxPuancx79BTgjqfe/nlYrM=;
        b=w2zIdTuQvg+r3rxFFGCEnd4tJ1JYEkFclWBzxLBtke168Q28ycAtByNNFuCpYM//wF
         zS7zZ+TMsxf/uk2VFkDkpJwNWLnpcZcAAcLcnZn4KqRwbRRYifxMdS5PJZTnRRLhGtPy
         sjuhnjNfR2mHH4YGGBxBqosKpJ8FI/DzpCyol74Fcjv4g1DZmd4doUe6fXLbV3dKTzb8
         kSCyWJiAACYBAMM98i8IFnuHiSZ388WcasD4WHAMMNhmgE5zjqp9bz8511hoyei2MkLV
         8f7jJVojmS/9LD2mn4u53wTgLuhz6Y0aYgtxmnM6SAxwTD9ZZt3q2O9Tmym2VXu76rV5
         N7VQ==
X-Gm-Message-State: AOJu0Yy/z/fLDGKcakEjvUyjuBqtTp1zEMbwsfNEUBmuQWxlT2DdG/hg
	scjgwQAmvIFj0K67AGtbRPljSu+V13QpEZ07M128JGZ79UauT8lHon8XVbl8QII=
X-Gm-Gg: ASbGncu39L1U57aicHiveoM/omS6MUK96HFiYBLB/GIangVqNDoCzKaJhGGX+u1/bwT
	rnGDWsGgTDAcBsm2EV25No0JFIUe+OzYhWORbkAbrb7Jr+IRn/z8jeFqwEAX79Jtrqp1PmFN9YR
	2c4YG2gD2peCY3V8AkBnPu6JLFo0XdP9n3SfeSVCg3Qfbr6KWiqOBW/af1+APj/Muy7t9RMV2lB
	pAH6avD8RjmUZ20om619JVDdK2567vz81+LRA9sE8h/N/33oBSWZHsEFppMD4pADVTdswI=
X-Google-Smtp-Source: AGHT+IHYK7Du5iUylGSHkyu3iZhxC6pu4WEqdTfJd2HA8NRTO0kPBBavxBK4pbJjpzuedl5Cz9JDnA==
X-Received: by 2002:a5d:588c:0:b0:385:edd1:2249 with SMTP id ffacd0b85a97d-385fd433008mr5794874f8f.50.1733320832123;
        Wed, 04 Dec 2024 06:00:32 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:31 -0800 (PST)
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
Subject: [PATCH v6 2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Wed,  4 Dec 2024 14:00:25 +0000
Message-ID: <20241204140027.2198763-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204140027.2198763-1-alexey.klimov@linaro.org>
References: <20241204140027.2198763-1-alexey.klimov@linaro.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

