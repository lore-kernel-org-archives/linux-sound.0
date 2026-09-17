Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336043A7843
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619892; cv=none; b=YmFacm02htIuH7QcBgmdPhntJ7PMZo494f8i41SL5zrRNhfu9R+u7aTGlWS+sLCOb2U6edeO3hsmlA+sxyd+dY9xEAADEQkpGuiX3PzHuGKW56jZ68zmIGlS61/SqY/eE10+TRh/KQCEy2w6xHq9TjUebjAZnugddqPX9/hS6lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619892; c=relaxed/simple;
	bh=rVj0wB6TfE9jUwIn6RbEtT1SRMnMNK1dShgiCP32JiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEM9clBkJPT253Tl1AhuEU3NsDz0T+2ixf9yC3L6J/kl1tJjxiS3jOlgFIvC6xW36+P0lKNZPvdsR54FNy6VMhGO3DqICCDlOGWVqkHPiTi8cd57vhlXSDieGfWJG8Rv0JXPD4EvtQEhPg/TETSHMiiukbFiuKR22R5IEgCGSnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqa1HH7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bgio4LI1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqa1HH7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bgio4LI1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1LLHT3559722
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Weq3dJ7H18I/Y0osm5dexfiimeQYQYBP4jA0iRYxto0=; b=pqa1HH7+Is03wUq4
	KzZiJ27lho4IVMgfcTc3aIqyDZU72Dku5byw5yjtIz4Jw5V9d18oNacVHbNiRZ2+
	89+23DsuWLqT3rTB+JWJ1X+xBsT5fF7H5mWoAg9Iton4/bmJN9xcaLGML7krmu8L
	xT9w/Ncnnjci102a5urYloVw7j7JuTrZSHHk3cXa5hKhKJJY5xuvW5dfh4jmoo1z
	cTPc8hMr5LjPLoazTvyhWiD/3G9PkoknJf7HPU3cfwEZTPJ8exn7+QxUAUzz3HuV
	R1Bn2dLjW2MpDvc0BMUzYuYPJ8ZfOVmN51Nnj33gCP2+3UTfoM3MhKB13099Ye69
	egvJGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hacex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd667770efso4136895ad.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619888; x=1790224688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Weq3dJ7H18I/Y0osm5dexfiimeQYQYBP4jA0iRYxto0=;
        b=Bgio4LI1BQRuZi+MedBsQQcNIVcuO3l5v7X/NJXXnLeQMeU8Ssx1LQzA46VylzU6QG
         nIrvYvTIBxwSAiDK5exd/4RrmBxQpygqT5OdiDKdwYUCEXHmf+hT3xcM4ztOFxPqmAYP
         JMNgC/76crNzpw6UzC18Y0GhLlgHKT904xBllhRfFsncbabXPhwxfCuY9N95I2kK7Mf5
         dKtbgSsLRrW3yFTjndtZy8T+WPTYVTKN6nOh/a2k6FhpIc5CdjbRAz0pWQIouz1w+MNa
         3G9NLrPq278ZyBigufW6keRS48Dt7Hm5w5rITIVRWqyfD0+KTvejdNaB25cKy2NonGvj
         zuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619888; x=1790224688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Weq3dJ7H18I/Y0osm5dexfiimeQYQYBP4jA0iRYxto0=;
        b=PA1INhFM3T5hj2+IfoJgLe8bB5FkqVRtl1oeldUcWnz3BEMoYSH4hD7uCq2pw40opp
         nHk8hnycmT8C2UCgGd8TdOs3zuuat7IfIk1kiXAUeEL9B4VtDlRzyI1YeTC94o171n04
         Zk3o9yxR0wlqE2cFyQ6VZE8OHgE5PvhL76Vzw8j8H8cmOVNnamyBEF0AmYabiCUG9aWe
         Oip2DBY6vpxb+aqvsyTshaYXgmIst2pND58H2o48CcpounP/HsYryUXqUOmUL1Q3Rm2J
         4yBmuscHo95OIl+BPXSaoXlA95b0nq4saSbAQ6RZXQ3kHwioKqN2ZUCrPraa58tnPFFG
         3cgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHPHiC35dW/qOw2Wt806TnJkxS1NmZXpO8EWXunxUMPWOBMY2bKmwSAlrvcvcrH929As7f8fLL+7pLmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m2uR9yteKKXCCjFxzz2ghQxPsl9Mn1c43A32owDgfYvh2+b2lq
	4qtUFG+eAd6ZrCF6Him2pMfdL0RbBV5k0SLdtlKFoDWfwJzvJBtGBahkoAKHPRjqB8lUkGWAy0d
	96qoYyQvRbWB2bN3KUc8PivJ0LIjRPHQWSn7/cXvNKE/q0lP56lZFZouaZ4xus5vrEA==
X-Gm-Gg: AYBFou3V+ChijbZn7lhgS3SuXHW5vaAzn/W7BwbrIRr1oK8YpgyTGyQnjjibBQ+ut7W
	A7Rx7p5B1w8urqduv08QMGvtTYjfttfgFGKLzp4q9a3DM42xSxW6s+0+zJp7J5dFZexzwG16FTv
	B/ew/DJUmBom0qFHl4fF33fgNzUKtW7BzqFHWTIqlSRuBtTjIXHqy5cRsNbmxIjUwY5dOVwYh0S
	+87qKQUUgSrFYrXgo4j6aSaFn0VnrBlBX3v/bLusgh5ZRzC8z3HFA+A/3RaybRHqOzfLLHsaI8X
	vlEhl/or6/2OOCR/3S6CifbYeh22EvgwAzFJMtUOjNxX19iOJzRfFZ8a4aVcfOE1U5v16Afl6GH
	8KbcOTrWaHCOwpIGmdQWMuJXIzIdP3l+PyQwy
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr31792575ad.21.1789619887854;
        Wed, 16 Sep 2026 21:38:07 -0700 (PDT)
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr31792245ad.21.1789619887416;
        Wed, 16 Sep 2026 21:38:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:32 +0530
Subject: [PATCH v3 3/8] arm64: dts: qcom: shikra: Add gpr node
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-3-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=3434;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=rVj0wB6TfE9jUwIn6RbEtT1SRMnMNK1dShgiCP32JiY=;
 b=E/QoJRcoYrzbLaxCBFVJf8MAU767a1GSDtIZUCe6ts+uE8hTGtI9uebyKU07z5nYxSsbjKsRs
 bBokGBHoB4dAmSxAAlX9mIwI+xYhjkJl6RgP3B6ESbboLTmQg6O9Rpz
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXyoFpOmCrmWKo
 V/X6/LhABsPhsVzuk57K1KVwG5MapGuC1lrGBpkyRgyWlppk6pUQnWtJBkyVurVlzkufV/8RDHs
 Nn3tJ2Sol0X8wX2TCh8CHSSIddy/oanHJOFCVA7Q3+SHaLEZi+VTMzTmdCoblUoh7A0udE+ye1C
 zLCIj35Y3CYW3hUUoGaXyMUTRu7csTWliarUt60qr1aSDs779QNI/I2qEWc7+FSOct1AFhyyyGK
 jnPo5G6kQkFzr29Qi9yRfZe1eIzkEi6EjyP1HCa9ppu2rEpWYe14DQRED4UbNGyHO81RqVT39CU
 ZQMsHr6rMYnp44QoosfdJY7GwmNh9mgo/5V32+bxSzhVCpL5qI20M3oT2wNdLv+bLeY97pIs03U
 LpZNwEmCrS3UnT5+aCfEGfZoazm7LseMaAynpEDF9zz576exvelM7LBgb4v5kdMe1HJ2JAD7GLu
 SUfs6eoOXH1ETQ0icFQ==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab6eb0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=T3D8ljLgrI678HBggIwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: y7kXluP7mXNHZ1mIEfH1IAwaf9Q1BBFT
X-Proofpoint-ORIG-GUID: y7kXluP7mXNHZ1mIEfH1IAwaf9Q1BBFT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX5/lIRdAvqFu7
 1fhm1gcdbg/F8jIevP4pTYwV/EpjYyff/ga+BGPm7jyI8D26G8vii6fHTUx5eiZB3+Rd+U3CfTF
 5GvyZn7GOHVqJpvd5zrTgracucSIAvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add GPR (Generic Packet Router) node along with APM (Audio Process
Manager) and PRM (Proxy Resource Manager) audio services.

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 49 +++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 7633d274e090..21e4e6a7e12a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -16,6 +17,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -476,7 +478,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -2410,6 +2419,44 @@ glink-edge {
 				mboxes = <&apcs_glb 12>;
 				qcom,remote-pid = <1>;
 				label = "mpss";
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "modem_apps";
+					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
+					qcom,intents = <200 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.34.1

