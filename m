Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCE320CAE
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912447; cv=none; b=pS4YTSnpiu9L9UwrRffynMOLVzX2SLb+Qo9vRE19wlvNSP3evADJMytt9nachykljvlcuW1m5na/aL6vvGLM4DrFJOn5Jpx1z4oNhvEg++w+krUqYy6SMgHRZDNr1mzJjcizpcLA1DF7JtpPPy2lrs/F/gVabRCCKLl5iHFr1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912447; c=relaxed/simple;
	bh=apwKk+ikM3l/V1EQQjFWc2jNPkFZenZw1Re+pEBEENs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eOgumGgm2LWAvmrCJ24n2WMIw2+V9Fln8UbAoqCUGFeni4HRZmBtEi7qyF74et5XzJvqwiOsz6mIKANo3xbIJamIWL/egSNmT18uZob1qkRzN+R/SEodcJsn96R56710lz2QNy8nGiW5+5gJeiP3hxj1UzmP9gVjL/yFIOFF7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yu/rHzUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yu/rHzUM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx1xQ007644
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 15:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VZTZQqgdtSX
	dHRS6Xhizb7R5zVIthwUpM+I82rokNQQ=; b=Yu/rHzUMtnnrgXAPEP0W5+0cUEG
	zIqf3rivDfhLME/e/StUh907hMugCjr2YrrAlzdvSKf5IbT7UIaJ4EyO7tPC0uxe
	fLav7e0a3dpPIgN+MhsaFq+4B/gUwdZereF8+JKCR0I1m/Mj0PbE3VF8D3+v8+iw
	6Gnnxo7VczFMUB+GMYYPfZby8EPa2sSBJUTi3n6wTjnNRMzSw/hgau8ZfKHTSejp
	rPVy+iAkZGOrddNsUtjuQx1wIxXO4JaWBIA5UaJHBG1wyD6GpjAojoH1Ww1onToI
	flRnx7iyk+NnPzVbYH5ZNzncoXr3DfH4syrEM5y1zjPtbCi7O344ahGAI4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv49dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 15:14:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-248fbfc35ddso512035ad.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 08:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912443; x=1757517243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZTZQqgdtSXdHRS6Xhizb7R5zVIthwUpM+I82rokNQQ=;
        b=lq40dLwT3812Wf7FuULrDSqd99xJG8TO6pz4br0P2k7JIHfZB5eXVpZt0A40bv/M+M
         UVZhIzmFc8N8wiad/NTimncvBkbX5nYtUmUy+FDgtKFzNj3JtWNAPWSq5G97HH2yGHfY
         p1ywHuJPvdoCZCkV2RG0UmLH7tY7i5l0msTt3d43yr1RFJLNb8GMbH9uaRbDI4w5fjl8
         nbTv33aNMxMGHhrkUsozYwqzv9fUQIzACtiNx9TOz4Hzrc31PmgMG9aJtMtSvutMzRFy
         Oe9NOb7jj2p/7Drbzh817nu2rOv0sJI9ajpoB34LhGg+rnF60ZJuZ3AdmdXsaYyEd7ba
         XNhw==
X-Forwarded-Encrypted: i=1; AJvYcCXoDuwmnl+NAt7/NYsD2ZsvISvAhtf+0AOnOuvZ6HKyQ9rJhR+RogAEVIjJy0Ef61RYP3nwFYA+mQacRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIACWpyxfsFRjDr5wA7kGaE1ngQxZ6PMfbe47b3wISOKmfb0v
	x3lwg2LDBkJzep9U9ECJ2wQncCDWz5dObxeCBbhxutu5ep9C2jLXf8s1IT4r9tWzLaJEySzIEOT
	AY6MkYFM1+vjSxQ/MGWZN/5y3U/6CYCnZbi0Tklfh+wJ7CnMAJMdWWOL9yDtewUGA3w==
X-Gm-Gg: ASbGnctqfMuE6zsCdMj1nbNwy6w028Ahh48jKiNEJxac560XE6Hdgih5mq3P9X99HMk
	eNi1+SRrZFyjtBJqdkqKeUku4ED7hkqdRZTG/v1vbtZLCL9gq40bScjMRWqH9Webf0fTaUHLxfD
	YdcigX8bSX+SuTRkwn6FDjC9hc02GxNOROiCC7W8vdqO6ZCc3tgC/7hMAVi8WpXAGU/YUcfwqqS
	KGvksQ+kMH7HK75l23MAzCHDxGXLV2JF016AY8tbIk9I4XOaKCFekYkKU0vYqGHcu+CH/iuzchC
	oDmUHc0rBWIH4iJPqHHnBBJCpeRll29Vzi60bTL3pRsEsWxH+qk93yQ5YWNyCp0tuCB+N0fGNVA
	5
X-Received: by 2002:a17:903:3d0b:b0:24a:c62a:dede with SMTP id d9443c01a7336-24ac62aea77mr145251015ad.26.1756912442894;
        Wed, 03 Sep 2025 08:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVvxveVOhkQWe2XBaZgNd81gr3PM1rlr7IZRl+AQORLEL7olQsqnPY/Lmo+ZFAIsPUQi/Fdw==
X-Received: by 2002:a17:903:3d0b:b0:24a:c62a:dede with SMTP id d9443c01a7336-24ac62aea77mr145250685ad.26.1756912442311;
        Wed, 03 Sep 2025 08:14:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 2/8] arm64: dts: qcom: qcs6490-audioreach: Add AudioReach support for QCS6490
Date: Wed,  3 Sep 2025 20:43:31 +0530
Message-Id: <20250903151337.1037246-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX0f7xyykHjjr9
 fxDPAFfLhpyMcnntA3ZQKgvz8ailVzjaGeAqPI7B0+Tl6+OJkJ8L+8835kDBOtoQqgCRCChUj9f
 cEGdHzoZrUutuwsHMgwy3qz5UrU48glipCJiVp2Xj1QE4WJEqoiPXtBWJZURA+hXYUsnHBPTUyx
 VOuX7+d+0oEKa+CPy//X4CR5DuH07jthxouhNjLV36OYwPAffqK/LrIaeQbW4f2edH05R9lqIUJ
 V1+UWKisGaCNKwobAY2i9T0XDAy53uYTyk7byt/4oGqF8i71xbAjuYbHqAJt6iVGokkam3Yv0nk
 TroBq9uTAgCfSc88Vtmhz3NTx49nxks4utmy9Fn2HfeDkZFPizB8oqwVPrL/HHJLMhFgBp3/Tqp
 FHPtrYM1
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b85b3c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RwPLVlW_fRfmQ7ZdlRkA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZOJ73Ir-dQvvZf3j0i4yh_-dzuxFWK-n
X-Proofpoint-GUID: ZOJ73Ir-dQvvZf3j0i4yh_-dzuxFWK-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

Introduce qcs6490-audioreach.dtsi to support AudioReach architecture on
QCS6490 platforms. The existing ADSP Bypass DTSI files such as sc7280.dtsi,
which is tailored for ADSP Bypass architecture as they lack DSP-specific
nodes required for AudioReach. The new qcs6490-audioreach.dtsi file defines
nodes for AudioReach specific components such as APM (Audio Process
Manager), PRM (Proxy Resource Manager), and GPR (Generic Packet Router).
This change enable the audio from the legacy ADSP Bypass solution to
the AudioReach framework.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
new file mode 100644
index 000000000000..980499fb3c35
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Common definitions for SC7280-based boards with AudioReach.
+ */
+
+#include <dt-bindings/clock/qcom,lpass-sc7280.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&remoteproc_adsp_glink {
+	/delete-node/ apr;
+
+	gpr {
+		compatible = "qcom,gpr";
+		qcom,glink-channels = "adsp_apps";
+		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+		qcom,intents = <512 20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		q6apm: service@1 {
+			compatible = "qcom,q6apm";
+			reg = <GPR_APM_MODULE_IID>;
+			#sound-dai-cells = <0>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6apmdai: dais {
+				compatible = "qcom,q6apm-dais";
+				iommus = <&apps_smmu 0x1801 0x0>;
+			};
+
+			q6apmbedai: bedais {
+				compatible = "qcom,q6apm-lpass-dais";
+				#sound-dai-cells = <1>;
+			};
+		};
+
+		q6prm: service@2 {
+			compatible = "qcom,q6prm";
+			reg = <GPR_PRM_MODULE_IID>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6prmcc: clock-controller {
+				compatible = "qcom,q6prm-lpass-clocks";
+				#clock-cells = <2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8561fc217229..9fa294cc9a3e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3944,7 +3944,7 @@ remoteproc_adsp: remoteproc@3700000 {
 
 			status = "disabled";
 
-			glink-edge {
+			remoteproc_adsp_glink: glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1

