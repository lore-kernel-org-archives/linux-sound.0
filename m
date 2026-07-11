Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A57F3C456F
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774677; cv=none; b=fTwHztx+IHgBevsDdtyE8YamBoUnKF8iC3dQYxU9MZLjLCPyu4720UvQ4bZ3gcNCgtBN1y+ArzPJTDEyzRxPug/UqiLn2pCfdMbk7xxWIH6Ezq1kR91KNkmPyVuaKZgXi1yzG3s+lRsqOUjPHLRHEn9/6tQcraE3sCMc0VKfi7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774677; c=relaxed/simple;
	bh=E08ZjSLYCMK9SJ4nIZGC9Z/KoKMraZ4vLGrrTMsAUo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MHSxKncE5kpdwmoBiuBSjGcve/jfXdxvR0L9Q2fOl7O684Nrasybp7Z6JU7Ysdw0lEsUFzPrDBXjtcyjsOZbo9zzOBAb+nGR047ZnMB2yHA1HATEBmy/bB0yOGaf3mHNkVrz2KuNxXRqMlZed0tQaqZFFSenU+TkdRq3Z4swH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/JwW7Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UD+5xwnS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/JwW7Wq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UD+5xwnS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnEsm3602689
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 12:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MTb+0vYch66DSjN7lGTl7W
	9yD3pHWoZKtdOyO/YagqM=; b=n/JwW7Wq3RL7TEzym2VrIaCB7uUpC/C+YlNO+S
	OjBEULHjPbtObrWUaQ8BMWrIRN9xFkf3DBXyhMPMh+TiASoznY03KyGxt903QzYN
	u4TowW4FhI2mMnsPRPoy3fW+vqaWR75zdAcNPagvxZEF0yg7wA75MF8Urzz0hxF6
	OnqHKA+0rgAxsKcJ1zNB1jmOO/bZOY5Jdy4a35rjmrzq3/9HMQA1uwt018cgoxp2
	RTeGniZpfA5VdPHVOzwgmOF0y3+bM39k+/ehGWBWZEgxd+pe3k9coz465ce44KMs
	Bt4LLqB2IymHTMOn4160NMjKqFURYUEW6xtdwA/AJe6nxlvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehgtqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 12:57:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so1673953a12.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774672; x=1784379472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTb+0vYch66DSjN7lGTl7W9yD3pHWoZKtdOyO/YagqM=;
        b=UD+5xwnS9dPdPesDXX1JIpqbO9b66mONL9UXXT3G3Pmdu+S0tZzK+/CSTjcioYT2vc
         cCmm7ur0b9dAnTe2jw203Ic+hGtPTvBerVk7KVK+o1lGuXI7pVDeOOaCNIVVeCdQRxz2
         OAK4zdEJBroTFUSCNZlK2jKjmFh3E6KGj05xyr0AjSIp4qI1ZSU47r88Gym43CWYHK7K
         2MH9638LzNanZ1Fn6EZJ+vCKMXhO/XDjAd8dO1vtjSGEo9uU9xuP+fFXGdaWa+dk8WvU
         fotg6rLFTyyfzeqLEdxvKM+piFOZIHQypmbY13At9lKJfe6FJNo4SDbEpG15u8uYEOp1
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774672; x=1784379472;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTb+0vYch66DSjN7lGTl7W9yD3pHWoZKtdOyO/YagqM=;
        b=V8d0AhUB+MBTxcaEMUMvLcDyljcjYoG6NkA1daU4HLW7YwdYG5mJQk0D3mJzDaMi8V
         LPPqPVMIiG9kg+IXmUT/oa7uIiG5TIcFLE3IPz/iWkqZzvw9KXqpfThDHLRSTzrlGijB
         xrfoBR0tf+lBgXG8V23+tHKwu37tmRmOmzmnrjVTmGnLn281pYNT4mBJu7hYXTq7ktIR
         bq3xDvGowJl4nhPKZDgDaMpI80MqG2iWjrppYO2+Q32/JJsxtKVv2HggIEbcRH49alWf
         w4IDQa05/UHcBKQrqiza21km+57nKoiNMYZc4jJOfxAPeP9h6ZgvQcK+EhdMESIX+fJI
         FVSw==
X-Forwarded-Encrypted: i=1; AHgh+RquQqMEfZxqyaHJzBmVPDARBkHegbNUmznnNbzIQU0TWSbJhdnbEI+3oxqkoTHiIXxnoKjXLyHuQbwUkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfev+DYd++tZEC6uGkCv+32VtgoQAzREP5lM3NZ423RCAw4Giv
	+VPnbg8kxjqelQLhWi5faD0aFEyvitj1MW1K13Wt+C3mOpvSQUYQXQVPEAhmzA1zCmYx6vh2g4v
	3Tf/f9/ICyczU8IOynbvfxaId6ZIEWoscz4bCs0NmrTn1Z0Yy1Kh/VGe1gYY3tQsi1Q==
X-Gm-Gg: AfdE7cn5HnSok8i2/QZgf8Za3VYsjJxYWyuf2/LZDL4wYHQKeuVtt76u2Mlcwlx1VoV
	bCqgbwX9XtJocZOW9GJxY8g0gObxH2p59ucnklmnNDN9Fr64XUZF8cRfw9xtTdNjyrV82l/BdFo
	O74auqcXDDGa6vIm9Z+mNuT3lcugUxKFNCh+gwkhxYXGMupooayAdjCyWPzrvgfSD2QkcL1HQF1
	25943+ZJ7KZ5tm8yrXk16kyrhaLyoKISG1xZC+RWqzK9wTMLALRiABZbksj9b5X3esBKdSc+YTI
	afjBm4+nHXRHP6CYI6ZOzFxki9/rfLVYcqo93CR88i7aWVG28r1qUThyugccw/wWZzAhmmwptEs
	A1TSoJAwaUMWEkOuEhe0K2GS4HDarorqR0HdWaW4ZVSNSriI=
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr3506848637.74.1783774672339;
        Sat, 11 Jul 2026 05:57:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr3506814637.74.1783774671893;
        Sat, 11 Jul 2026 05:57:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:57:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Sat, 11 Jul 2026 18:27:37 +0530
Message-Id: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX7l5RaMw7I0lP
 F5lHqpPocQ4wUTmGVGZ6S7HhHiE4DzIga5gkIm0duGe+thbGcNpg5AvCpEBOxfoANii2ekGNfLP
 eMIDXjTYgGT509xmG7EgoOCtCwucJfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX4VHMbfN9Neix
 9yrZie16Mra9ynL5FaZm/MxEREi5lctb4xDmp23Y5r3ccMAzeJYqxnVzwTSmQD8G+8WhlRFAN7Q
 SyKZLRW+Ak3kymd7sbskH/R11hbAHGwLk/t8+CHrX7Gp/V9+zAG3do5Dk5TKuQgJHP121CaXbYS
 vQM9eT1BoZySCjqgTG4qIm6o9lmbL4T/pGz7Eq9i0IVtCp/jP4zTM0gEgsX4O+4H41oTD9XPG65
 c9WpM4pQh+bR5ufUB0OSrILES6AuQqNnbNPt/eKNH/K/6GRLP+pUB67fZJe0ac3rajgaBNTWRV8
 YjrqjwLxERPOy3rYKjTtN3CkoUbH0mcI5FHnUYYYNx/QE2BLA8L0GeRqE7N42Ap9d4Un8w5z0Or
 d1SGL/zXK/0PF/Jr3WzH1KcttJFz9gfdeMXDlPruXq6N+rN/MIpCzAKKYLPVN/Tm1UJQCukLeUI
 B+2ot4r2KBKxpNm8ivg==
X-Proofpoint-GUID: tjgJDTt7QxI63r2x2QExdUMG7vZRu2FU
X-Proofpoint-ORIG-GUID: tjgJDTt7QxI63r2x2QExdUMG7vZRu2FU
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a523dd1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110127

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  58 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 193 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 252 ++++++++++++++++--
 4 files changed, 484 insertions(+), 23 deletions(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.34.1

