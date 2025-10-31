Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D83347FD3
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912458; cv=none; b=uPMc1ER/CpmUQdrv0knOkEOlV892eMrgecQEclB4L0ddWeJYHHVvetlRsuH1XKF9u527BpTiMpSD1UWeOCKV3ioXH2HKFX4yzHWJblT7hoydAUZzMGdo3pwHA07Qg2CICbDUZuZXwU7x85j1mhpf3NniSioQc3iy0ZCzbhF5/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912458; c=relaxed/simple;
	bh=tBK1qwBUvRQMVKV0Br5+JUjYr+yEhU8c8RDgQyKsT2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+P96zu1PexLl6IajW2nBIUxk/xTP4owWot6yQh8eFUy92/GBVOTcbqsiwby23+dr7B7LMYWdVmB70m6sjxTHZcxg8kt+/CZ5WoTRAa26K78jWRoYZvXanzigRPOyL93wE8h1ds5jfAp6t6haZyABL10bRxbEGq5ODD4ZqGE4pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gN1t8NyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ja1MbekQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gN1t8NyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ja1MbekQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7eGea872581
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZWwpst+Hrx7
	G02/RkAKzDN+ldfPPWqoovAXsun6iEuQ=; b=gN1t8NyAcBVi60Vvai+eb/AFnpz
	mJJrg9q+PLn6babOQyCZWdbP99SjWSpjQPsNxXaK19GL5a71MZPwB2zID1xwtgaB
	xzoRUsQSggjuuST1LjGO7ut4Qkcyj4fMb63cNkSJ0mSmCcj3FTbNFaXXJtBatJge
	Wdf7dU49CLdVkEhiPXAM2fIe+LC8gf1OtwEOALxgeU4wlEhBolBdlt8uiy0bj1dH
	oJbcykGiZphWIB670vq0K0KxRKEjn3rDEM6OSHyuAabtdu9yXPz8/pXP9jgTBYfZ
	WF33jk+EZ+0OGWF6aJo2O7hJSzSPApNcRAUWm1kzFVurV5D5GYN8RagFOgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn227a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba930d6ecso54575901cf.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912455; x=1762517255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWwpst+Hrx7G02/RkAKzDN+ldfPPWqoovAXsun6iEuQ=;
        b=Ja1MbekQg1Zs3yQShBeYdzUqi0r7QixB1al9xwafsSl1EOR5XARcm8JRxScESc+zyb
         oldJ2ku3MzwKAm9ApejYX5ACx21UArsLB/tV/i4z7CmVYNhaGCSawqL2yrFCY3JSXCmh
         28ShcBP/39PPYk7xlDnyjvNR58RUQeBhJXhUl1LeqB6Jy1ZI5NWiBL3RfeLfGZEneyJ8
         NTGj2sNYEgQFiIl8HnkAcMoJch0kTGfWW6S2CgR5cMJpoIUBAnvsW53VcWzuMKgHbjC7
         8Fe67EtbTxi6e5uHWgaiKAzsKwMTHI/1XyIB81JQFoNw3LdJTbYXDMtxtON+BNWb4K7i
         Th4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912455; x=1762517255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWwpst+Hrx7G02/RkAKzDN+ldfPPWqoovAXsun6iEuQ=;
        b=Qa2PxfGnJRtEL6VBI3jZamVpLPRDQKL6qdSnE9X4Wm+k+gVLgl0yltDux6Zl+IY9rg
         4DUkj0sZmcLSUw5Lv3aHAA+0jfiVkJIN2vYXzRRLZmgztC9LvBaWAtZH4coxxAmlKXIt
         9IIctiSBGrzuVg5xwEDgdmLNxZNFoJYHcXNU3RZJVHSEIz+bBkjp1E5frZLrM1OwkwgG
         ehHVw5+MVeetJsy1Km4XqwXg6YToJv4EVCx74NMxo6/85GXpIsUE8XNaAjp5a0s2yrtv
         6aUgO4povffov/YstlHnBnv7jHOwDoDZOa6GmQjsKtn/XfKs4iQ8POh2Ijk99BBwnuTq
         /iKA==
X-Forwarded-Encrypted: i=1; AJvYcCVGuHJ32+I+fm9zhAgybyMnIrYLfau5sAMtKKgI1GjviKdOviwdVpIu8TQYDpI8pHp9YBKR7ARYDq2oXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBUvcitI/IBbgOjRe4ld5fye4EL4ZXkLHP76E3K74tapDhp84
	i+otcdDxQ4rpqYH/AGPp6youpwW/OJYj0W4o2vIXjVTOvdzVY6YO1rbVAUUdRAPtrh45H4XyruT
	Wb9ac96rmjt/Y11/Qu1CHIygpN1JysxDeM2JlJNr479TXGYl/zweIRkqXkR7Mw8EayQ==
X-Gm-Gg: ASbGncu/VlMb/wJNq9d3mHrhfbnorJaf4ZYAlRZzSQEZzXghRPJc+iSas6bGLMGH6Vw
	qicQZmFK9GtLy4bhBrhPmCgOezp3CjO9Tt2muEM2i6xZgmSKGwAeVW+Y3V8R9SAouxykJLxWZVo
	kHeiE5mrXUFWglp4O/JVT7bpBqvTQUEBspIdBHc/18M4yVNFGlzWwbE5GjkpqGdqILzYSaY1hWu
	BMcVtLYHWKkGdVfFT6bvSqxMfZvJcPejQDvBHYY+FVHKCnaHplcTYrk7kJ/aZIX2S5cROatRiPt
	NLeeJYCYOeCMC/cSeQ1M3M3RpMTif5c0vfFLmwi6Q78UVLPXYv0ODdFHFsLztiXMhV89Cj5ct5D
	puazmV2iAWVK/
X-Received: by 2002:a05:622a:1f1a:b0:4eb:a3eb:2ad1 with SMTP id d75a77b69052e-4ed30f9c8bcmr39361011cf.53.1761912455281;
        Fri, 31 Oct 2025 05:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFubrQw4XO/dt+yCzz4q2Xa+aUfqymGqW7ebuZTqajutjz+f81U2jcLSjc0jlESDX5Kqxd0BA==
X-Received: by 2002:a05:622a:1f1a:b0:4eb:a3eb:2ad1 with SMTP id d75a77b69052e-4ed30f9c8bcmr39359921cf.53.1761912454522;
        Fri, 31 Oct 2025 05:07:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v3 1/6] ASoC: codecs: lpass-tx-macro: fix SM6115 support
Date: Fri, 31 Oct 2025 12:06:58 +0000
Message-ID: <20251031120703.590201-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904a688 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9D4bFhRDwPOLDOHaW_wA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: C5o6peoCt-4KfCEjfsf_Vc7KW29jgIc6
X-Proofpoint-GUID: C5o6peoCt-4KfCEjfsf_Vc7KW29jgIc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfXz/BSJyntCJOl
 Q77S/DChAiuDwTnglZ4lu3rhRR4C3NxAcsx970zk40+Jg+ghn/6Edv+y94sbVScuzQYo/5PgwaA
 lscmG7ifjGA/gGElExVSzNN9CQAIlmVBzBq+q3QEyqOBCKW+Q5w1EJtM1x6cAabJizTPjNY7o8z
 stanXBCWI8p6s6j2KLC6xFUy6AlwtjEsUCtrH8s3zQ/uaCxIwLX9Fn5Q17/9q9LvMerc4n1r1nI
 glXfSfhEuaWDIBMORzd9ofYNDRGYmClsD8WPJVy1L7MZ0Fo8YpHPQpT0KTgFKMbczI79J5ZV6i5
 4sDOuOsR0gQ4vJaLr7tTV+KRfP/mMaW3F4UIwTlAl8/4O+xiugHoPUoo5FzzwuhdV7l6ejPqoQP
 MswQsgkNGaOBiazV7xwKcltFXM0vLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310108

SM6115 does have soundwire controller in tx. For some reason
we ended up with this incorrect patch.

Fix this by adding the flag to reflect this in SoC data.

Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde818..dbd8d0e4bc75 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2473,7 +2473,8 @@ static const struct tx_macro_data lpass_ver_9_2 = {
 };
 
 static const struct tx_macro_data lpass_ver_10_sm6115 = {
-	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				  LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_10_0_0,
 	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
 	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
-- 
2.51.0

