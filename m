Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7272DB78E
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629650; cv=none; b=VQKJ1JNSD3kBKSCO/3TQh8T6mkmkyxNcVRR0mMJhZTVtd1smVXnTIoKt+BIkVjUaDgyQhlQ6oKRQ1PpAKqbHvPSXfi1wES+hObcpRZNFJSm+LYyOS4AUWNd3aq0uLyhQpT/mdU8CGzC6/6tAV3OokJRIsK3XNe1XCPoZRL60rL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629650; c=relaxed/simple;
	bh=nCfX2ew8MjR6tbO6p/o4VIded8eE480jujZMmjVg3Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCsTQBJ5bpWqeMz+n6Etq1LZ/dIuKNggo8NLdQL7fPYGUUxP6ykcuX8+JEcnY41lN+QLXxsRicgrwhAYyRBJ7Zw0GAzx3figFWSxq3EYmr/FBeRuAUo1mOUTyV68I94u2aWVO/9HAQpWTCCubhTl8MBQgPiPmChMZ1cJQ4uwa4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2G5ebKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6gljoX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2G5ebKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6gljoX2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249t9Kp1214505
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pynfFgOXiUt
	H3xXg8Z0aqV/XyaSIlD25TqToivr9SnE=; b=d2G5ebKYNBmBUOY1/hje1DHkOq2
	hDyPpCPmj0ol/TGK0Z2WcimRWtNNMfhLcuPzZh+jrKGKUEMxBLcxxX6KaqYgS/+n
	cNm3e4FACrdulKMHdLCP+DNlOSB9yWSTmYid1tZy2KBeW5HMH+2G9dXWuMIK2yqN
	7p5QsweL38tTZ5EK5J3Ae2khGHv7JY8Nv2PLP7/Kv5dmP/mIibx7KPZVqFykyszj
	TxMehAx8DIvx8z7TBTHB7svqd1IdYTtIRBLvIFDcxh5FxubjJHXP1FckJIvHWEPd
	tdSC5/5KumgW/gKAgbXpvfu7eR7RIvYjTLJCdOhp4Vt9kMn+N1qgAzZZxKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rhnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5132344385a.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629645; x=1773234445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pynfFgOXiUtH3xXg8Z0aqV/XyaSIlD25TqToivr9SnE=;
        b=j6gljoX2UUfM+kErrykrEj3Tdq/D7co6+F++tfgNS9YyTaVoQ62BQzmMDfJ5X/FcYW
         9PUaFuua5gdBPFPII+pviVEXpBJnOGmHX/tiHWy0j1mBOyEVEik1aXSipuHV2wRGOIDQ
         yDQ0hb7jLlD0SFk8+6mIa0izHr2BZbV0IQ1K93wo4qu3FczodP0KmOoghwguRvRUBzcT
         Zh4hDbFPQG3ZPgjWV0of+lH847eochn5AAGu8w8hXY2l8h0gHTeyAwrgnC2eTuAUEm/a
         g4Yu0cpfOR4cd5mAkfErVf1MgXT1EramkH4tfRmy4WQX4Sm1yuH8KilvpnA/J/y8obe1
         30gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629645; x=1773234445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pynfFgOXiUtH3xXg8Z0aqV/XyaSIlD25TqToivr9SnE=;
        b=ob+C7yHfpNVcjEmmCnskeuXXhGuphnStLKbAVixXFgJDCkyMJ2MQRpNwlUXjjyZ6iC
         Z1r8oRgnFWQZNXyPMX5hZEKoyHbcXPl1S9f9o3l9Aime4Du8S1+w7Fs6Gt+LYWT9n4fj
         4GmZqMyzVWedwle0mfnTR8dD49gCUW0o4Bu8Cgkj5YFdrGWKJEJjJOhFSfgIn5b2vzYW
         kIgfbFGIX+SZa90g/NvPq9Y/qeSGIbpUYmKvxxD7u3m0zfQU+ZYQzF2tNmJd3Zyl1YTB
         ozjiXBml0EdyYzxTLJkzLNGyh+8Q9YS71K9ynJQW993tmQVz+jYiJ0sRR/NtT/n9tSxj
         D5hg==
X-Forwarded-Encrypted: i=1; AJvYcCXVCNIkrqDVuBkma03keFw1LitGU+6P/9Fko2KYs0ULb0RjE6DGCtRGbNO2l8sIs1eAjkxDmrNO21Fw5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUejQ4/hXGCNJb13wleFasyqJ2euAqB1LAWnHXZYMNr7neFoK
	Yzf5pXR3l+ImtFrqEk13pO/ZEgmYiSnfOzxqiHLJ9TYt+15bSs4PthXvttqUooFPE5z8rES/nMx
	wwk9+ISvalnqOiXj5vr+1LG6l8vUhrMVbkkbMVB3grVXQXjafg3kDxDAcBPoW4oqHeA==
X-Gm-Gg: ATEYQzzL4XH5Mm0YFfXOcvl6tLJ4vvIRcydYJPUQwrTWBi1+ml9lg0x2ag/lmregYdD
	UmovxGxGJRF0tNZgfBFz2QNpQCqfYf9d/+0Fu8uqxgW411mvWSdClnl6Ybp4AimLjGvxquyYDxH
	kQe2qugemRKP3/Sm99O7q//lAazECsIywNMtrzqRCPLEadVI89/7jJSs3yFTXSPLWPkuSRXY6g2
	rtVv2W8HZZRtQAxOf+5YmLZi2YSiw1UFAl7mRS8MUv+HknkpAT3Wj9x6qhOH/QUjyiBkXCai7VZ
	+IDAbowhvlbcNB9vOXpSoAq+GW+lruhRZ4J28F6l5SGE/iyvFfcFxEuewXNFneGtdqF/mZ/GkMb
	EI5eC2BcgKCbgO96gzDJlCPzYENdU3krck2jJTAtBD9zzLj0qez3URc8=
X-Received: by 2002:a05:620a:690f:b0:8cb:72b2:29ff with SMTP id af79cd13be357-8cd5aefb9d2mr213386285a.30.1772629644685;
        Wed, 04 Mar 2026 05:07:24 -0800 (PST)
X-Received: by 2002:a05:620a:690f:b0:8cb:72b2:29ff with SMTP id af79cd13be357-8cd5aefb9d2mr213383085a.30.1772629644263;
        Wed, 04 Mar 2026 05:07:24 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 06/14] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Wed,  4 Mar 2026 13:07:04 +0000
Message-ID: <20260304130712.222246-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fJcSFSGEdk120sA_LU89AeikAdciLVgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX+kdvrEWer6jl
 bm64Zv8IkdEfnog5Ou5MRfEG+T9DiQZ0SZTJQY3INTAiS4nffjBWgyVmBM3Hd0zHkTtfbkqr1zB
 K4fbR4u3bLuANsPo41k1bAgglW1GPBOEx3VV7r1L37kBvGd51QKdbyMlhCon5EqMW/zWKNg5Jcx
 jSyg1WwnEzu04ujk6lCx2UwKzYka/4jkWZrayt2CnWdgNgNiGo+4NxuHIb7B4xyn3/M6wSZ3vWW
 DOaF/UBXpWu034A+MQUyx77eZZ6/SiAXSBZeUgsepvQo4aH6QJyxOp8hWM/BJweR0+azA2CKNNr
 Sz//WhBcVr6n2WQK2FfHw668oQfElGo2F8J/EnbO31s8SLRqQie/visZ9igE3cO3FAGMYzDJF2S
 UY/SNPw2QPKc10/8HgLmBcOvid/5be8TfUdo9Uv1MJcqp5dJbzTTm3rcIYN7KbSHfIwb3ad66h5
 xRAkPKeCUFmw97O4fMA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a82e8d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JSm23XzLRogIhJ8VZY0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fJcSFSGEdk120sA_LU89AeikAdciLVgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

Add new dai ids entries for LPASS LPI MI2S lines.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..e27a31ece1f2 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,16 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

