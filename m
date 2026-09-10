Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331B549E143
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082229; cv=none; b=tfKJAzm7VJEixxJn96cnOp77Dema4OZD6X1rWFl33eqxC35nNx+O1zGkMBG3hg/gZ9yexXEdCgaXDu0HNNRpM8YwRjmV7yKdr5YD3KADv8MXi9ETL+ZP6jJtuaL7t7PW7dCFV3X5x9Zae8wSJIMQpbLRFgprfxaTHWy7yauHVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082229; c=relaxed/simple;
	bh=Zeq7+ocqQo+fqTVIrp6IWUcv70w/mUcUuk6iTuYKfPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QnFvaEkuUqZ8A8d6oT/Zcy8/KlvUvCbjmugdtbO1mfOkuyk6bX9XaHLmbvFFnevhIFXKrj/fwS54jjLulMSB4zJwZmKaMa09hUBqSvEoLdAf3UCYbqTJR7IyNnt8y1Mzq1z4YsHV68jJGpEHqSHbwHLvWwORro4n1jtULl1PRKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgO7SOW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM53GHKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgO7SOW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM53GHKn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUTnO2350109
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GBDO4MTnE4z
	zdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=; b=WgO7SOW0bP5jqHCCJSm1Vop/Bsv
	iI2OzRx04+PNkUURd+keFkSz767SVg6nJCPEsTmCUk2ZiUekzRKiTBVmYTuQA/5Q
	+0N7Yrgus96wgZrC2AjaP+yLqCD4LO2mIzBI46OxnF1ggEdf2viuBb3LEKMIoQaz
	C2aDHS2Nci6cOevfbkjbbYe+6HnXxAGD6lsAFA1TZ5L7sE6+twTlsdZLskMxeiV2
	FUMXGpwGI/gjcrZkcBtVrR80kYxp4ybDr+R0xDfGFbDEj68mVA1XC8PB3BF+SLPb
	ZXMvLZZWHa/EiwGJKYayM9TNi3IZ56cIfXbjESOBxMahJX9lwI6h/94cpJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9tfxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so436813a91.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082226; x=1789687026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBDO4MTnE4zzdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=;
        b=OM53GHKnVXI9x0m39Xpqa4oK/0kW2w4DqXjl7ZaQ9yo1b6fTxHH1LYxw9IJfRjKA0l
         yUcnNgjIXQGdss/UZTE8EupBBF7WNhgCHRd6CxrKT3w//Pg0f3CTFPGlsLRHzgPDeleW
         d0wsxT704TPq58eM6I8uV0uMmQ9DEY29bOZtDuci5NBRTsrGdSi5oqqIQhTAqn3xntH8
         K7IVi4kCY8cqcoFQGCXJUUk/tsuUTv2Rx+6XuGhfh5Il27dhLt+s4VbbT1fURqzJpQqX
         aMnPHXPPzuBYBsS8REkFwHJ8enBd/wRzB+XexvzMLlewDKQMy7PwmMQxB+4kqOcWqtWF
         MpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082226; x=1789687026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBDO4MTnE4zzdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=;
        b=iv3NnCUzi4IFZYa9gWFoXqt289kcFUkckKbMUxdFkKbHSX30nfS9r2w9QqClbspF8b
         eDTbVG9L+tnYKs/mI1eH/mcWAktcJ4iwGTZthxU0dzjpmjP2Vf9dpUDNdB4qN6FJ4C16
         KevaSgYA+SPchERAf/MwKibSUpaZZHzvqg6euCkXUoqXeoS3ggIQq7gf1JL132L+yl33
         Rf/7ikBUFOhBZkbspyDxvket/KQ+4Oa2sbSGJIzw/0f68io/BYd0jTQiQGvW1UeKK7Z+
         5M0gKAmafTP0DXpv+ex5n/P5AoUswDk2ggv9dwiTwT7vsOhyH+uz50lOE+22P3KtkNSz
         LQBA==
X-Gm-Message-State: AFuF++mTAjy9m3ptRGZdHpFkmw6DSIWcBzasQA422gDhcQwcea5a7IIF
	fewaL1PCOHcc3/VJfk7wobXsDwsjr6TPL1x+jtvDqReggoUNDjUOEznASlgZsR3PAtEBNN0QT7E
	/9GBpig9PchQVM7284TH+Va43M7/26w0x0nr4mu+bv+EAVNtfWhzgMAMhcf1RPgqQJg==
X-Gm-Gg: AYBFou2SOmVYsD29+J27OsHCtgR90d0OgXaS/GfvPr48bXkTT4k2jvddOCuu1vjO923
	s8efNk0zFyv+8qRCUoMk0Pr0u79f0SsMhKCdA6a5TMQdNNtNqYjfY429+FtMK5CT5ZHxrzLjtzK
	u4tfbEN/Ei6O7luVLq8ZnTZWKbo5sJbCsbxjbUjVgfmSf/1tSdovhVGzKMYJvX88XIu+82Sq1ti
	loTf/Tm6LZyk4vhLHZOHvvVznvr1VIGwZN0NGiPujjfQSaeMdsHALkDPdrpADfIL+TTtwnypMJw
	Ka/cKew4hXZIRhHFX6VhDUtHIs0EP4Z8/9MOGn5tggPQMymzPF32bqXIn4Qev3m9uff+H5SAr0s
	mKilK6bVdRUJTf94jGEVLnKNAMcFk24qcBO3K
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1942092a91.1.1789082226309;
        Thu, 10 Sep 2026 16:17:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1942028a91.1.1789082225910;
        Thu, 10 Sep 2026 16:17:05 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:05 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v2 3/9] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
Date: Fri, 11 Sep 2026 04:46:36 +0530
Message-Id: <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXxIonzZjgu/I/
 og07m6mdicd6v6+1XJ/eIhqGJh0kEdacSP7teucpvcaBvQZ/6gS3bKyqhWvNvEPphsY7/kimWWs
 E906M1TK0RE3m+BG5GZtarB+VlluxWaiBAPhxZIika+fe3NzUCk5sBzP6Rz15KX1XlBCyToXnw7
 dL2WC6nuSIsgTh9IAY6OVs2zwGwwx3aLKSU/by7Y7tgwIUu5/RnlR3gOw+e0p/FS409q12k6NI3
 UedJZTWv7sNpwjSnbQbUa+mejX2HIVtpYe9GwIXihK622RZrNRPZIjGXrmGWzH/uO2wveLotEdC
 u6CjVyje0UAx5QUPwccxwawtkvN+p/W0OnnIZC9Mr040G6rvXtcGGxdtTJLKy428GUqeSbs7rJN
 ikwdBnutalArGBKhtbNc25AfK15qyJrk9/MEMLQOb/621sd64gogLALt35o6PoZJkzVONKZno8V
 LG3OQ6pkMQ9luQ8rV8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX3NP/0Uo6EFWq
 owe+MyfU69V0K3SD+KU4EqlIhtGim5kWWELRRehyeOsBKqyppH/9bu0GpgafNLq3bEHmIZXdtaS
 vnEmaPBk3/mQNO2PCMXcVOGKFhypZzM=
X-Proofpoint-GUID: tsxIq7ZjWz94F_JdFIrRnBFXYyG6AWFc
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa33a73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SNQ4sQprfOKLKwPE6BEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: tsxIq7ZjWz94F_JdFIrRnBFXYyG6AWFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index b8a13462771a..52b71790becb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3486,6 +3487,40 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+			clock-names = "lpass_config",
+				      "lpass_core_axim",
+				      "aud_dma",
+				      "aud_dma_mem",
+				      "bus",
+				      "aif_if0_ibit",
+				      "aif_if1_ibit",
+				      "aif_if2_ibit",
+				      "aif_if3_ibit";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;
-- 
2.34.1

