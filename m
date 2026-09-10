Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCF449EC57
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052588; cv=none; b=ulEyVWmQyqSRsNADaWwcjn9kkwJpZ1qs4VACZozqTex38X40rjQriuaapDl3mR9ezRKAs8CZ8yCP7NwKg/pi38/V7kGE5MOqRafm52pAtg1OckQaPcHSwEPBuerwAitMy4xWbcSh0+rUZxYGALbOEAydMiT/omn6sRfI41S6PkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052588; c=relaxed/simple;
	bh=Yt6bgePLJmo5nfr3TgUtFNZs1VIHJBLofDWIH217bHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BuB2IpLZTj3lWpYtekTPaAeRxQPorMLCpPpyfFm3G7OxvDqhTswgvFaqX4OvlqOoXRq0AT+oh51c9+1YhDzlOhQu2I1XER/F51oS2YHXlUu3IAwgjFPTG8aG7h4Tlaz4hifxwFRmXN1h4tjRCCvvduoymslvMFGK2Vy0CyB5bwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e29PEg4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqRajIdC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e29PEg4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqRajIdC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AE09n61334157
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qlv+RCIgN6n8OpIQswWk7x
	Zr8KiDxD72diUXV2HDjvY=; b=e29PEg4RQa7lGENEkW91d7a+K5tqvU+XIWicPe
	1FTHUTz5abkpuA8431sv2/ZDtHZGErPco3Sis9h2UA1lyBPixPIuVcIqdKyCQRBE
	Ie2t0pJS1nC0NrQ/mTsSH2Fr+ooaL0kQV4wPENNlRlxNm6oLo3PNRK4LPzQ1uiXk
	2nO9Ph4xgTYt4asygF0axN3HaJYLuQaPeieMfDkBrlNONVmzL6p8lYt/Ljw+FabG
	lAMF8mHXx0GPtUsB3hyq2NdzjXMWUhN8c3KfTAsvL14LlhEcmqolXLnfS07CzRXm
	iUJsFX61R8X6+/SPaMbmQKe/+T5VsS/9bNWuFVW0/fvCYctA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9rg4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso1620171b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052583; x=1789657383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qlv+RCIgN6n8OpIQswWk7xZr8KiDxD72diUXV2HDjvY=;
        b=GqRajIdCQ4eCPCxeDHOkTQkdZyKk46E3+04vxOIQPMwo5TbEmP2C5HYbommp9j1Uyh
         u+YUouZ+O2YLh6QEzZOCPDf0biIUI6D/zzZMM4b6slmvtHAQ2QA6eetUINZCCaPeycRE
         n+090kCqVKGqtnOkBkqZysYeYKubm4ucUlfUHMBjfXGVJ6kcmWPjzZ75XCDIS3BLAk++
         Z4Q7Su9ShWEfKFEhTfEcrJWJD6MYbN7ZwXmUBPCUgPhw+rkLquOSnxrhkNXqEFHr/pne
         ClWVjcltOedJbyHXDl2B6dJc53GDy1Wk8dePySip6HK8BK64Ne9ln5BcSYf6Luyj0btJ
         LzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052583; x=1789657383;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qlv+RCIgN6n8OpIQswWk7xZr8KiDxD72diUXV2HDjvY=;
        b=DjHLflqDl3izfekxtjZPSGh38g6XCsrIAw3stmvjtrnmvmKkj9wUSnZTLWDCyEiA9g
         jEA5kU3QoWyh8JrZuZSGF2YVsGjbpp2Drf7ps040oco2inV7T5NBBC7fgr+Wt59GR3h3
         YK1nOTaGDaNY8UOffiEE+1au26f8vD9CU2mlJtWNSZxAhwUCsMe6kKaWuQfksZtrPgDR
         Kq7FeZwqfZehpo0xQswhz9KREKHA/WPAG6DDgtyl2yB6s8XQRKUJINfdhTMq9y/1gqy/
         LXS2BcmM5XlFlQjNFSNJxngZ0CTnHCqWWVJJrdV2KG0FL0dASXa6noOONOF5fX/ykuwr
         7hzw==
X-Forwarded-Encrypted: i=1; AKwUvBywXUQHizc5Zsc0wTZY532UZmROf1xxl3dshDoAVPWXgEVsGwzSPGAht4INJQa919/ZB/J636FFeP7+Xw==@vger.kernel.org
X-Gm-Message-State: AFuF++mRklK1g2N0o160FM44RhRjJOgfGjZlnBSgEFr6Y2XapA4wdm2+
	/iqOPz1txojixOpobE+FfiX40sdiTlEobnldAlqjwRHx/YK8As99Z1Jba3hpafM5sD0a+BmILaN
	d7W/i0fTkj85pKj3tQiG+1CPZRPGAATc4EjjjAiH9X5Y19WkBMl0V0sSiTTs03l0JBg==
X-Gm-Gg: AYBFou1ribCnYwEVZjXh8RAb9w3z7q4iib6KJz9XzGrF0AWD6cDcqC6sPOjV2fj0opb
	HJiAvwmyjeYUOIQXjubXuUX9ORzBDCh+54zJ7Xs3KKobqy3midxaUkZ93ap3Z+mpuOqjfb7D0nc
	KVf2cYFrIXlVhK4VaM1lFLt+kY0aZppVnfzgz156f+Wjjei8brU2vL0pY0g6SDq+6yxK0p2PJuZ
	ZBq6ovxFW/of/qm+jJ49oVTVzRvJzcUIcrktosSpCxfZ7K4Klw2nwFrdHSQrzR0k4RXTJaFvAqh
	xD77yGOOFsQ0hGQjpSzj/ohuUE09zvZw2AZhyeGnaq7o+erYvGxML5Wd+5Et4AUOSYJBOyNBZ+B
	/ibANI0oQFPIwIfA+0ZhoP3FJhhRr
X-Received: by 2002:a05:6a00:2d91:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8616bd5c57amr53850255b3a.17.1789052582961;
        Thu, 10 Sep 2026 08:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8616bd5c57amr53849946b3a.17.1789052581155;
        Thu, 10 Sep 2026 08:03:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:00 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC: qcom: Shikra machine driver and DT binding
 support
Date: Thu, 10 Sep 2026 20:32:37 +0530
Message-Id: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3GomoC/yXMSQ6DMAxA0asgr2speMHQq6AuMrjEoKZVDAgJc
 XfSdvkW/x+gnIUV7tUBmTdReacCulXgo00jo4RiIEON6WuDGmXOFl/WR0mMG2FobNsH50LnCUr
 3yfyU/fccHn/r6ib2y3cE53kBpZqR9XUAAAA=
X-Change-ID: 20260910-shikra-machine-v2-d6a79dbbd8c2
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX0oPMGh61dheY
 ofEFD3BaUZwODXoEpsTuhYBgCTRhAMk8lBql2ThLVhjvADOZiwizH0PBJcKC6V3THmNviSlDO3t
 SOJQmKcJq6sNKYETP2Cug2zUbNE0a002ICfrk+hK1pK8RhioUEg87b9nLmJriOj+Sujg3JxLLdc
 1+stneYKvQvAKGMPXgTW2+uN9PADJ4WL0KEXJ+QFKI5oCAIj2iM9B0L0YppvUKGtLxoL9ArdZA7
 gr1nd2jemKkJBlUREh8ZRivmVrfIpr1NP6fSbPcCZkrwtnB3zl9j8SYmhORgx//5Qs53MA9B0dV
 K6PGYJfa6oCQy+cOZG+A048OxScfpBA53kZHrQ/dpZ0qoX+ltz/J25c+QI+Fh7mXx41bOuqWWjz
 ZzAU113LZZy80taUqzdivNqo9aoq2f8YVsmE3/cgfDQznFMAXwpe0BVLYux8kd92N9Yv0kqpPNq
 6TaYRADwysIdykkW09Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX4GDPMHTbuRRp
 Q+4MvJTwWWjF1DaODwAiz9whGZflkZ1VB8dBAwhENqTuBvFs87XJ8JDErficV9ypJJPaTou4SXh
 Cnsc9Hq2m+zjUOATtjkoY/ihr436dfU=
X-Proofpoint-GUID: j1SgjZoyu2wGlc5rP3-Hg6mXCWbXXkb_
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa2c6a9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EeDgvMqZeazNxKWBYXAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: j1SgjZoyu2wGlc5rP3-Hg6mXCWbXXkb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

This series adds Qualcomm Shikra sound-card variant support in DT
bindings and in the sc8280xp machine driver.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Changes in v2:
- Split the single machine-driver patch into four separate patches
  as requested by Srinivas and Dmitry:
  - Patch 2/5: extend hw_params for QAIF MI2S/TDM DAI ranges,
    add cpu_dai_fmt, VA_CODEC_DMA_TX_1 and be_ops filter changes
  - Patch 3/5: CQM variant support
  - Patch 4/5: CQS variant support
  - Patch 5/5: IQS variant support
- Carry forward Reviewed-by from Krzysztof on the DT binding patch
- Use correct struct type (qcom_snd_soc_common) for all priv_data

Link: https://lore.kernel.org/all/20260611112946.954172-1-ajay.nandam@oss.qualcomm.com/ [v1]

Dependencies:
- https://lore.kernel.org/all/20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com/
  Dependency: CPU DAI ID's mentioned in the above patch

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (5):
      ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
      ASoC: qcom: sc8280xp: Extend hw_params for QAIF backends
      ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  3 +
 sound/soc/qcom/sc8280xp.c                          | 82 ++++++++++++++++++++--
 sound/soc/qcom/sdw.c                               |  1 +
 3 files changed, 79 insertions(+), 7 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-shikra-machine-v2-d6a79dbbd8c2

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

