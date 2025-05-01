Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407F276042
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082162; cv=none; b=EcvN4o4qTntM/UNOzW2htP+Eg0cq8elukBd4l4MK0fUdEY5WV/93gIMXoPv6FLRYVhEv4ySL+Hop9YGZJYlYJdbS+GhjOVnQBAHAnPOuk+ZlS60ri6VuBTQunC54rJaM3ACfIS/7ebASniHDWImvS66Ydqr6bWV37Abuk6opA98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082162; c=relaxed/simple;
	bh=rghWQigvYLWUQfqr8hQdbcQRA6mRxhVWRwE411z1tHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTh/PdnjYYBfyeoz2/vwG1TX+6aJG4xGt5tw3FIsnvE85MBAKbNfSiJ8IarbKkr5cUc0okCvMQ5ouoIv6Fc6y0BFAsL+CBmHoKFm03MSzft6b3FbKhk1vy6aw2TUr8AAGDmm1Ve6+UTxAmYQxNcaWr8rYEGHZTHpMr8T1PKw6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fpGSdLwZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fpGSdLwZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb5ec407b1so92492866b.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082158; x=1746686958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ScVhK4vOzBQ1CIEZ9VnoX8+SHxPZ1LsT0jvcBBvwnE=;
        b=fpGSdLwZ4lrRqTqsAJHu3Wb3SuyI5lqecGOkBqPl08SH2DIz6212b5D94gXI4egY6F
         aXxDGHshpW/ZiyDylxgsCAmv9BhPiG/6V2KV6R8CvDwnnNcj7HbcDhTmPei6W8fEE07Y
         mlaH/Q9smxXLPq8Zb/I+JoeLgdNGW04hMmlI5Aeyx4UbZpEA/XwbTdcmPQJWLqNEboSt
         vTf774hWuJzVlU5w6D2clUEFvg/fPX6QBlMSqaMm6LabCuWk/qZgjBP8pH8Gd+qFwZJu
         LCtalUbu7QdiehoUtAn7alfe1MfhQ4iJNHUMtaS9fr33A4K9uxWmCPAyftm233JrXy+A
         ir/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082158; x=1746686958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ScVhK4vOzBQ1CIEZ9VnoX8+SHxPZ1LsT0jvcBBvwnE=;
        b=VbZ+s3eFXkBAQ1n8/QnRp3wZXCar3P5YEuoLn6Wbza4ksvaExYoVYAAmPxqucmNiUf
         W6auFMbgTAtJNleS00Hn6cWkoUJIgip67hjbUuYKoNngddmMX1W3ud9EJn+rFS5fwVUp
         v+NB26IyOvtQC+cZtcIS9WWRm+EhAUp/J0eGYAKl+hQ54OY4MF73yAosRuGAMc7f4XNd
         HwWGaq5U1x1mkrknZ3jgTucZb5l6+fLSb9BnM+BIHcJsLEAJcnczvGZ/IyktQEkcH4NZ
         zc8oLvs3bjY01NTbKRwUnxjXhvdOD3HyLxPZnof0MUZu1Z9w932r61nQSAr5s+OPUJtt
         JRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtcVqw0n0D/eTA0rHddABBb9Q2ItfUI1meyFI/Om4jZKxxxtaZcZtsr0I33toDOICeBWLkOlJjWiu4AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxS8wQrsIIhgdBB49RNMYc/DwtHV2yBV8iahsAoKAjqmzLnHs
	efO71Gj88nSODh8qjtuEAw6e4L1JkRUlanNGaABCM1D/314tbzXxcK4NvB2r7gs=
X-Gm-Gg: ASbGncv965a23mkW86lDbOITHMctUUm1yEp64+Yh2rO8AJV8yaUiOIprqV7Nfn6rynl
	B1e4scWY8b7++43uQp4+TNVW2/h1+7ak6s5Bd7EtUefACVUSCwaawxOCaEc/p0YogEHrlRm6T3r
	i2pdqiIl9r6Lbljv9G5KmIe5bs0Arc44gHwFdVN+A6BYuCQA+Y4wTBYY4DcZMEaJgEPLCFyyjpK
	1dQWzih6GXLa8Fp0QUx/SuNVUDPZV5cLUQ3IEtTYK4JpdMosMms2iKw9+3ng6A1ca1mnmHDnspw
	LAQVr77qcp+IFPC6ReJuU64GTedoj3vmAvNh7xL4L9AhNsLzRz9tO8u+M7TFKD3Xles1RKwjk2K
	YsxpfzNrqswK+fQ==
X-Google-Smtp-Source: AGHT+IGn1DKosW3qZ5ZG71pQb8j7xjgzFnvZgJA1ZxIYOO/C/7lE7rQ8jXX4h2CCFnk06YrC1/1f5A==
X-Received: by 2002:a17:907:72cc:b0:acb:5ae1:f6b8 with SMTP id a640c23a62f3a-acee215b8c9mr562485066b.7.1746082157735;
        Wed, 30 Apr 2025 23:49:17 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:50 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for q6usb which handles USB audio offloading, allowing to
play audio via a USB-C headset with lower power consumption and enabling
some other features.

We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
able to use its sideband interrupter.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 375f964e793626115609996aa25ea4e0fefe6c5e..92a2f6e0c3d856eb2549a89509486979a7439cd8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1351,6 +1351,13 @@ q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
+
+						q6usbdai: usbd {
+							compatible = "qcom,q6usb";
+							iommus = <&apps_smmu 0x100f 0x0>;
+							#sound-dai-cells = <1>;
+							qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+						};
 					};
 
 					q6asm: service@7 {
@@ -1979,6 +1986,7 @@ usb_1_dwc3: usb@a600000 {
 				reg = <0 0x0a600000 0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x540 0x0>;
+				num-hc-interrupters = /bits/ 16 <3>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,has-lpm-erratum;

-- 
2.49.0

