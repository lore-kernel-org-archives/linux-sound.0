Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16D31B104
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516507; cv=none; b=EaR3PL4FOIaiEwPW5NopldYC3WflO1HygNmHOa8AmaziacGA/ebv53vpjPhhx6Gtrm10a2JIeP0yRfVwCA9gMbFtY4v12mx+R3VnKBXc+oz4LJbM4re3FfUMZ64klc/Iye5noEwfHZejW0mtdHaipObWNQt1aHhowpD+vpcAxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516507; c=relaxed/simple;
	bh=MVknS7fZsBbltlMguf8cAS8VVN8wV1AijKC/soz1lsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGa6JcKDJuGaZZ2fFm16N/3PtgMI9WSCAw3xG+XOUktitDEklFTmmuEEmoanuxDErpWxjKT6xmsdYdiCXnbMqO1dV+X6WBfIX3uVuM2fUvKhZ4scA8MamoQpfHw1LLekzshVTStAliCwFT+pEgUze8fbsTlAGy+ilEGLKSLLt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aye3wiGc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aye3wiGc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I83WWv017909
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGgpd8ySRMJ
	cXDU8t26AMIBMPUh533T65jXYhrJ/7+A=; b=aye3wiGcmc5q6fFsEO62PaZwnBj
	+jNxBTGVAWa7nD0inxIKSmCHDHHntpZ1+mZZ+0gqjsGBnulhXn2kx3haRe8tIl59
	dke1FZnjdynlxJQdirlrbw5/UbnjclKvj/4B7myMXbJyMz83dQ8JEEI2Y4vyR2OV
	JQgdAxoQiMrTSJ+COoDnH/yDvGxs4AlGf3HTR6i3IDChzMXkNy5nBSRk7GRVnazE
	70E5e+0hwcv6XZady1pnh07Pi4c+L42lJa/zLfOjdfFUDD2VbInrbUwEJCbVoKzs
	L4ySZy43quyOZVQRvjyZRqIkolXm3gA8P74ZURZgv+6X0fm6RHY7nlpf0NA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtckhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f5bb140so140549606d6.3
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516504; x=1756121304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGgpd8ySRMJcXDU8t26AMIBMPUh533T65jXYhrJ/7+A=;
        b=twMoMC0L+Wig7W1LJhszNxpx6n49VT4VpON0b67Fjza9buzfJKFcIxSyPr52q0Bj6m
         3KEsu51ILE9RkHLiZa6TyYuyuiYA1E/12GjfNCGOXy4Jc3kmmD050F77CNX1N+XeR8AX
         2JeZRRRAOsM452jh4SnteNE7ztNdD+HB60QPyd8MJYA6m4HFF3nBe4JA4CTR+UO9qLIS
         8SBU89dAukmFOt0Yhb37fR6kng2lSxACZ/BcaSFIXVG0Au/Jr1b1a3a+t/vBaXzHPKfV
         TfbNZTzZ9CeOlv+yk7S1rMhgr7O8vjoVMSZgFOmUqTdDguZ/PygjclD2e7QzY+slcj7r
         MNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAm79XngLNunPEI/NtW9wlcm1UnVwj32g3ns7RhLe0p1N1A1SVBY6JbF2NEnoGOfDz16oMoJPCHjCUTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNjPZxTK3vbZLI0nQe3gMYWiXck4vFEOHZ8NuB/htPqfucW4Y
	qkm+Ows7hvQom0sDZHPOdlFk33WeDTv6DqDWk2eQ+6/NFWHRhjBFP7cnkphnhAD9jTaBqeY2Aaw
	8gEH9mGcFT41Oa5id6iVBKF9mjHKNJ1GWoUAtR7FC7bBXeW+D/lXDV24a3KMz6dGN/A==
X-Gm-Gg: ASbGnctEx55Oj2o0zfPBo69eWoZZMdyzj4QEIBL1oxY8OZe5eEq1NGhT2DMA2g9VJ7e
	bxXV1q8EqHKYNFT+rAicOD1YNFOibBM7Uf546WrlfLMUIdD6jcFGVDiUA43bsnaprDLSbiT9U3P
	lTn1Utn4WFbgWP5wZ4VCc6hPCsRYjx4H/WBpFwZHhVnspBBYe8R9FtwZ6POEAPrIX1u6mFmNiDr
	2gCGUQFdTX/4bygsLFDKCmpQ3cOZa99ajMBG2R0KXlTTSSwqOGWAnEP1Gszv8xJcCylKnfpks26
	PIXyipOVcOsBhlAGF/Zry/HmON2rkwm0VOCcKgh+WtJ0QGjIFjXOIA==
X-Received: by 2002:ad4:5946:0:b0:70b:9f86:5fbd with SMTP id 6a1803df08f44-70ba7caa8c0mr143184216d6.46.1755516503609;
        Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN4KALdHu1FLJQrv5AAJZwm4Wvz/EYRkjjHtCXUzU5NOxtj3D/IbKu1Mfi5H6ZZfGwGqtzew==
X-Received: by 2002:ad4:5946:0:b0:70b:9f86:5fbd with SMTP id 6a1803df08f44-70ba7caa8c0mr143183766d6.46.1755516503003;
        Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:22 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Mon, 18 Aug 2025 12:28:08 +0100
Message-ID: <20250818112810.1207033-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6M1uRaax80tEv-n5GDo017guGDiPyL7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXxd+XRSXj+Ro8
 SpPoESC+gWFPfXrS0MrPHvWuNxGz2TgbnCfbyQiNPkxFM4Zqf/GXu0Pp9sheEJBIf9wqhvFNjv2
 dZz/RMISzP6ttam+70yF/E72cTbtQ666FQA2lHdE3x0yNtgqeZeP5Y5JpcYP7a6alGZDN8W9BOW
 2M7QKulNOp7r5/4wZBfid6UB/wOHfcHJz9RA9eVgYn5hebeNM8D1wFt/hXDep0Y7FRViPAk1ReK
 gj7cZbQ3p9d7R9vedMVKPYV3mTcKwSM/+kDQ/7OkGjoaItr4Mn4/pO9AN7LBFWmVLPa8DT5ISXG
 2Clytvu2bD9VkeepZHA2ww8nwxvIj99UGGhFr1K8+QbSYOJSeXHyG1oK4KxLVqk+nsJ1IZdCZhO
 zYadJw0M
X-Proofpoint-GUID: 6M1uRaax80tEv-n5GDo017guGDiPyL7Y
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a30e59 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8DVPAwtwuvfE0Os7CJ0A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..3aa5f4928a2b 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECOINDARY = 1,
+ *						I2S_INTF_TYPE_TERTINARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0

