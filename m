Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210801586C1
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489370; cv=none; b=EFkaW3KeZ00Q6KTK6NvJ0pd4pwx23UGC2Ot+Ih88N3TyqctFC/T888DOmgbX2urz52YDXb4KpcrA+yMjemOzCLxvfNu9WuUyYUPrktno7ySyddV78ANTzUtpHRshtJM0MO9nut/v1BlIjb2w+hH+9vpjrT0yOOHBAavAZaWM/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489370; c=relaxed/simple;
	bh=fhOsLuyqrBwQUqU3KeH1GRGhl2FQpbGrlcG9u9+rBVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otXL5Y8rzoPJcj8TR/ggEgN+l3Bz0mNYvkB+1dEfCsMgINC8ByPzFYW8nmc2xL1vE6kKlCMGWOCrPWIBgxkAFgP38P4Zc6SimYGCiKhPJ2QM4rFenSN1eSGyvvDC68m5F4xw9etSziKG1UdrIRvxy5YG9uNxThjZoHIknSe56LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqRg8g0P; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqRg8g0P"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e764bb3fbso141217e87.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489366; x=1720094166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piU6dixVwevEMvMKFVjdM2+dDBv8tkHRGk2Ym1RU0bw=;
        b=DqRg8g0PZjbzU30J8J4pKuH5e8zectryeA2Veej7sfuTtcqtQ+zaLeAwaVq5IukZz2
         7wC2yFD+HhYk2A/1y38DPmrLbPaVo9fH53/SE/a7cTLvobYtn7nG4ce+QfSdJBKaSRtn
         QtiWnQ5k+6H9SCYjKEGCt3LW7HvirEhmi0A4ZVRp0WcnqYF55ngBwUdmYCpdsL1QhyXB
         iKryQ9PKtUhRdblnvFVfP4Eq6Iqn7vnLgwNL5B0XIU9059kfDzjIU7NVlOuaCFYbH3xc
         kyWjrQ8CAQbkt8aymv3IfWRuph0xlurbKxQesEuvulVS9exdQpuPGkR3XjlLIz9kqkNo
         VZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489366; x=1720094166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piU6dixVwevEMvMKFVjdM2+dDBv8tkHRGk2Ym1RU0bw=;
        b=eq+14FPoA+yr4KE33x8ZDBA2CrROC8eO/1joooh8WrxejLHxm+ZCo3nOjrIZMO/6Yu
         oph7nfE4RIf41a/ZK8o34bSBW6vIlJq4LK4ehOXYIgC9ms9ID8fUgf4CEg5xbUKwEKrC
         TKI4yuRy7oT3xGLKl7UO3LPT2fFB2gKfNmNqJOTzZfEFgJdK8P8dMdEjE6rpzD3o4K3Q
         KE2oAUer+9mGhy9xscECISPE1fs9qBsFkJXJo0BqbfYpEMCM5yje34jPVCywNN378f1V
         4uZMomGtvMTNXxKQwZYmwvS8UlZWZH5bdMmALn1smKX9LTtkPSGdYKWifx2SwpR5wcbN
         FzWA==
X-Forwarded-Encrypted: i=1; AJvYcCWR3TTnB2rPJavQ2YC/yN9BLFKZf8H4RlVBZGadwcYmGBk77arq0sEeDgKkYW9YWhS76PQ6y1DWv/Khhun28CyW0YAqZ/VRXhqbMvM=
X-Gm-Message-State: AOJu0YwW4AvpWTbwRWE+BYZo544m/CGmzjzugilS5t/fFOhGN+mNMBEW
	DRoJP2Z/UEeoaOYG6mneuvW5qGD7o4UNlVKGEQ+lBuNmiCx9T+0pzvEgSmpqRE0=
X-Google-Smtp-Source: AGHT+IHrpS4FaO+MLa+HNiW45CgkKJteDWyaEAeg1DQpUOW+P5vfLDvcO4u786fvHvXTXhgmUZujUg==
X-Received: by 2002:a05:6512:3091:b0:52c:e54e:f84b with SMTP id 2adb3069b0e04-52ce54ef9fdmr8943991e87.14.1719489366398;
        Thu, 27 Jun 2024 04:56:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:22 +0100
Subject: [PATCH 6/6] arm64: dts: x1e80100-qcp: fix wsa soundwire port
 mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-6-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=fhOsLuyqrBwQUqU3KeH1GRGhl2FQpbGrlcG9u9+rBVA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNN8VJANE2p5q7a9tQElvD/J+6BThXZJo1SY
 JISlTpiwtmJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N9nEB/wLOagPz2MWymeyiPZmgmKPaDEpckmNiW48ztjNspLG+XaXC/0zZDNJaNW4yBaoDFolpp6
 fU/t9kex0J1DPRyOltkiJ2CIkbyAyNCYOICpax+aogY+C4eFTrNB9YNNRolqlLY3qJ/P4qpgvSJ
 hyyjJxY/Aqj1TB3p3CWzLzMAmlUY10GMZ87Juje7Rn4TisWat05KCZCrQgY67mQWuraYApVY3Pe
 0qwNcqae067Cc1MKITj6GWJC5OFyjvumStp7sn4Syr6kyYu6MrDSlAaXC+HZd/lmTYj3Z3BWlzZ
 SqI6SNQ/hJC3sveXQrErHVC3Br9w9UBRZM7Bk/qGm1BiD3U1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Existing way of allocating ports dynamically is linear starting from 1 to
MAX_PORTS. This will not work for x1e80100 as the master ports are
are not mapped in the same order.

Without this fix only one speaker in a pair of speakers will function.

After this fix along with WSA codec changes both the speakers starts
working.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 4edec3212dde..79563ae34890 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -749,6 +749,7 @@ left_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Right Speaker */
@@ -760,6 +761,7 @@ right_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.25.1

