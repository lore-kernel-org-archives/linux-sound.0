Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4153932274B
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912456; cv=none; b=KDKwEam+O2SOM2XfyKmFoP38E2UsoI0uzaHOodVABec2CyOzSgDl0bFm3ICtzj409ydNZemenOg8GyGFBQ1yrqxnThjlxdSPRiFtfklowuFlqmkvUpmfrQZQt1XdOHBaz08gbcr2gpmFUTQZ4PR+DLg+Ij/mI3kPZIqjYwYkCyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912456; c=relaxed/simple;
	bh=hnoUdf3rjdcAoYIydQYt2dYzr9CFPXyNlJHvaQr+eBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ImiSPG/3r7RyBZrDynoixnhJ5Pb6BFdESQHt+iWn+TvJVB3B7KO3dbJUdICFxLd8ENDtCg8Kdlq3aqO8/0Tq8Oa7NHZkbU8z6UCPg7sorDBUIU8hm/EoKhDI6Eg3cZrZyHs/TQLgjB3eCk6M96sfG3pbM0mQ0wxs2yQ/kmmBoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZbIdZoT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZbIdZoT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwtD3016989
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 15:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1zT+isCAMKH
	XxYTivUJqw6qOIGYD24cgm8f1bNsXLvk=; b=UZbIdZoTQNn0J0ph8e3tzsZNG47
	pqtPRdGcKMNn8Yc+SsMgDnO4TqW+xeqvZrB6hBUD8rLAOhaPOVBCLwVWZaw8YaUu
	RyPaSQbHCJZv6UH4uflkc5JziDBRcmXUIw2Tn0Ou7oPo74VS5b24Cvy8npfK98oO
	Qxw+nTvxV6f4fFz0PuQ5fRON5CtZvsCTfYWoAzEaQM3d3gM9bUtg+HV65Afkonl2
	qQ/W4lA0rqULiRuMY7LvXiPYRmwpQ89EyFJ5D+iDMHVwV3IGfGXnUWW+zlFYaxwj
	xjr1wBduuckUHQhrF1Ns45WgpSYSZ+wbl5z6T9C26VjRb3JWWuRnGa/icew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0q0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 15:14:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329e1e3b25bso2219024a91.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 08:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912453; x=1757517253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zT+isCAMKHXxYTivUJqw6qOIGYD24cgm8f1bNsXLvk=;
        b=ul3lZ09Cghd2Bz1wi70juOsTcWysnM2XzPbK69A6GcpVvVR6HALCjtfg7uVDTJD0cM
         Wyjq8XIIKPYliL2EOVp4ql6Ktejvbuzqg64p2MPpEitQkgXjFh7BrwpstHQfTmlP7QFP
         4Inb0TSqCZkTP59UK9gyZWU4AJogR5MjutiloMCTJI8+VM7EL8qRqhLmKSNviKERZn8m
         1wrKtttJw+crDF3/+FY/l+Mp84AdzlUS/Denjpd9VwWKMJoS3RqAbk/fIkpaBEpzdQmv
         PUQxPSGxRHJUdObyM1PwYOUJnyYJrLWsvypnqMNOebBWLDxtqw5pTVx55zLjHR3c9CUD
         gxTw==
X-Forwarded-Encrypted: i=1; AJvYcCU/2uGSVYjGCJQCFa3EUyXfLBZVOlevR3JZQQNKgzg50bGpkoy/8NYvaeMCmIXV+F4mN5pAMsYoikvsqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17TEo+wJqBrnyVFWOTCQpHDus0ONebluOw8+edfAHyM2F+U7s
	P32wHs7NzrkfC39P3MQNN9VNugZQsx5uFNA2Up5Bh7LOFeUFccTYasTf5RvkDlRagnjxmV7YwP8
	AG9K/ps5SuG50XFKjYZOdo2Q0BoiYQzEtUvHQ5WTU1sEvLQAkHks0ul0fL25PrI/0tA==
X-Gm-Gg: ASbGncvG5kSZ42Qmxg9ob/mVVP2hDpNa1FpaG5bIVifu10Yl4uZvxlOHaQ6YLzSUN4O
	Q1iWU4aICorePFTicLdeH3xyctEl04qK6wZwZKczNBu78qi3CtDxGRwAJYgDFuGTek8kQVldXqC
	qdkXbPwv3Hl05ilU7cyYP3/ahYZccLWETNaxlVsDTfJrQDEALkkEKbrTU+jDMpdYnqjWZLlZ9xs
	LkAcN/x/1Iuc25RiK2FjZbtzJhnB8+E6SEXqoVG1aWh7b4jwY7pxsAp5MvGe1Q/uMSHH+9WI6/R
	oOmCdDL5buw0Do3p7LrXZ6mnai4eBC0s14XRLKcY+8h7O/YmBRwDBAhuHXWaWMlnLSjYQmKrQcn
	l
X-Received: by 2002:a17:902:e94f:b0:24b:1589:5054 with SMTP id d9443c01a7336-24b15895984mr77983955ad.23.1756912453109;
        Wed, 03 Sep 2025 08:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOVc9HbfT1Od4ND0ksWQhGbUiXjtl0OlMXb+jVj3sT9uXnWRuDf/D9PyMVC06mYe04GhUEVA==
X-Received: by 2002:a17:902:e94f:b0:24b:1589:5054 with SMTP id d9443c01a7336-24b15895984mr77982655ad.23.1756912451454;
        Wed, 03 Sep 2025 08:14:11 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:11 -0700 (PDT)
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
Subject: [PATCH v9 4/8] arm64: dts: qcom: qcs6490-audioreach: Enable LPASS macros clock settings for audioreach
Date: Wed,  3 Sep 2025 20:43:33 +0530
Message-Id: <20250903151337.1037246-5-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX4GyWk1wOGD8A
 fJ0kfMp+Vs2TgU4RHo5Nncd0uDY1oTwtM+C/y/afHLhPiPErHlyXLb4XGeiLSmMVe2ooBYpjYPC
 QXqTVp96ExsH5QHVLSuT5JoyJQu2avdsL+MmhIAORlAXKsvhFSKaSzv92U8h9NVzFJawdsppsUw
 aZwkuhmkHCZjWb16Z2vQv/15RtHD8KLGZiLZBE+aXK7gQacXaaSbqmAEtIZlgXBjD5/y6ysNdS5
 TlFL0lPSf9pwLiUdTykCPU6eUhGs34j+3A5AiWM9wZv6wwU0ivOReksYnVWXSwh2BknTz4ySiEJ
 6r+tYD0DiFAriaYQ83j2OkeKGwnUOW9QjskHXtoivnSp4tsHGzRhNZqx5gW9AtnmEsJZKeRJlJX
 pmV9rz76
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b85b46 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Ri8MtJ_oCAYdBNTneTsA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BgFdxJG6QWwzZfLDQ2TuVWrNc18KlYrf
X-Proofpoint-ORIG-GUID: BgFdxJG6QWwzZfLDQ2TuVWrNc18KlYrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

Enable LPASS macros (WSA, VA, RX, TX) and the lpass_tlmm clock required
for audioreach functionality. In audioreach solution mclk, npl, and fsgen
clocks are managed via the Q6PRM. On SC7280-based boards, the TX CORE
clock is used to drive both RX and WSA audio paths following as per
hardware design.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index 980499fb3c35..bdf4b6c3fc6d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -10,6 +10,67 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
+&lpass_rx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "macro",
+		      "dcodec",
+		      "fsgen";
+};
+
+&lpass_tlmm {
+	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "core",
+		      "audio";
+};
+
+&lpass_tx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "macro",
+		      "dcodec",
+		      "fsgen";
+};
+
+&lpass_va_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "macro",
+		      "dcodec";
+};
+
+&lpass_wsa_macro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "macro",
+		      "dcodec",
+		      "fsgen";
+};
+
 &remoteproc_adsp_glink {
 	/delete-node/ apr;
 
-- 
2.34.1

