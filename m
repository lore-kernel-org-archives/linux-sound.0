Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AEA3E3165
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177408; cv=none; b=DPAeVsouyGcyRY2j4JJuOLHNaeY09IxZTkvTitv7KatzuZV3m+CmR8iD6RbtAo9fSiQOkfLQrMde2JS1BShsGT6qSfvZK00xt8PYtQII5gz6DFUr5GayAEkyYJO0AJdfvAVfFtsrenkuBLwUmTVXw1M8tvIc6cr7gOIkNd43ZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177408; c=relaxed/simple;
	bh=igmbTMg9dXVQBvwDXOLCSEtT28ooXGJZ8hi71EftG+0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Drilh3MSRLGXwtuJHifoqRtUrVUkGz/cZYZ0LTuLz7GIvCox8lA+dvaIJzvQtt/Bd6spc8a4DNz8il39BomjPE9HqosDfPEpuGoiBCdRsgDAcyB3+HQrdbyAOFkyV12VUE85lvFUvPlz2CktAByEB9KWqVDE0m72wwnOM2ZjIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmyTaTsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIidFjWl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmyTaTsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIidFjWl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA12TR299773
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=skkPyifo0WVXdE2Fgj2nnDegbGOLV0BVF6u
	fFIRcp0E=; b=AmyTaTsW4Xfs7dBh2dzqF0in0r9p4De5fx3hjiGJ8rDWI++CSgY
	M6uvxwc1atRH4bS9PSwl4iR5RiQj1BQXFo5Q1JoXFLFwTfARSyzTPXL7CIefftxs
	n92+PhECzcvSg9G+wD2DRJsmy30zkiy1S7LYiSY+XBK8XQQP6T0vC3G0cYHyASLf
	TOeeMz/PZDnVzdDsQSf1VaJEF1yFBy7AKayPC34+JLliqaIbvICdU+7sNueWn6yw
	Xn8mQiS8zvubEbs5aiaGW/oRWAlQcd10wUtHvpFLpEtjulu3quSt8TUuzLsuJ2OA
	nF6d41objamlqQXv4bd3BbwZ557NTwwzyYQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7034fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842278a630dso9758376b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177403; x=1781782203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skkPyifo0WVXdE2Fgj2nnDegbGOLV0BVF6ufFIRcp0E=;
        b=WIidFjWl96kn9n40CMpakeQALEchdaxWK35V0D72lWAU5q7Ycu9oEqwRbJ9x8cx0FH
         1T9EuSICaxr7qjJgrIowdpejKs3N8MjRtnz8Q3kERJiz4RdefPZ+CUbksZ5BAPQVwihJ
         /cvkra22V1f59j91Mb+ghAIKZJiASHSlngt3J5t8Bkg8vx5sNhJBBXuQGMs1DOIZ4+76
         XMf5ClsPfF/D2zxGnBfNBVgqURSCzfWlYNumWIOyp08zfLcQKar6WuGloWr7r2CqI5OM
         Fo3gPGyQTcMsKvsViuW94Uh6H67pfe7lHilLJ0yhQm59QelqNyyGW8U1VKvOCuwC8k+e
         LHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177403; x=1781782203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skkPyifo0WVXdE2Fgj2nnDegbGOLV0BVF6ufFIRcp0E=;
        b=Cn3Hbz6vHasy8ju3TLMsUfWL0AmX8Z2MkbHcYV3KKW7+4GQTGw8eMqieBFWeLawF2a
         7PAzJeCvPYQTacUUxG5fP78RHmAznilOLBoWchab8ERn+ZqLm1ymVLoZG1ZkGIqkS7Fl
         1NOb7Y+dE5Bvcw85ZVnHlm5Z4HCbIFbQxp5rCZqmv7Do7J3lBHytVLtuG8fKBm91yi6q
         To1oo2i042FkNNcIWy/FOf8zRWgpbcgmp0JSkOaEoKsNKD9o69MRtYvUe4Da/L/UfxUF
         V21SK3oCN39egHssaz7iOkKB5pgGWoCakucYmn/a9oJhsggSuZnY1k2/C7jk7s6wXd4i
         0d7g==
X-Gm-Message-State: AOJu0YwmvpKBOG/w5b1rP6HBL/ZbYzgWLUG3p7OzpTZnZ7IpHop39nIH
	lpO5ldrVHnu0ArEEpDVDb69MOnNWbBdn2GMbCEXbjYYaeYSIScpdvQY+s7bd3G+5XmFYog/LCWM
	pLb84CV4rxsS6bu67B3X91fFYj8ulJVLEr5WuLCUrKNVvjWra1WKdZJuF88fpYE6DiA==
X-Gm-Gg: Acq92OGVI+YoQ049xO/2XhCMdzmuj0lHUZpwc3gNncnvYIBImAesprxQSf0yBFYQcBo
	IJ2hOFd2N2twcwr1y9QVsWsRvY2U9uQzVc7O7P9775uUorapD5cSZxt20slKyn+npkDGsVmAwCp
	HRQOTNYaV9vJ3+KqumoUmhV3zd2VPbdYyhXB0vx+7NakkN0+hYR2oq2Y9KYnQdfWBDPMVQ7k3hn
	zX4smccTvpXFxxCwBQn3AGySU1zWJ4JoGf7UWktAMNSIvVR6PJ1Ig8laD7LaiRM3lFMVpRHCbi2
	rgqk7355Z30Rno3N3TEZy2RbBFGJg8atBkAf9tjkpB7B9Lvz4xVsx9J6dcMx8MbX9Z7nOX5gVgd
	JtOu4tKXsRCIOdL9uW06hh+BxJdS/99nd/r9tJSSww3rVVysVpIeRAXLj5swc
X-Received: by 2002:a05:6a00:2d17:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-84336bb517fmr2618476b3a.37.1781177403168;
        Thu, 11 Jun 2026 04:30:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d17:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-84336bb517fmr2618437b3a.37.1781177402641;
        Thu, 11 Jun 2026 04:30:02 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:02 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] ASoC: qcom: Shikra machine driver and DT binding support
Date: Thu, 11 Jun 2026 16:59:44 +0530
Message-Id: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EWsEIcLC7RyU4qDMCApNWuflj86-C9v-
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9c3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HWbuaeYSr5whF7-padQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfXyhks7cZf8sKD
 1Q13zi7PsJIDN72WszsIBXo6ZmZN+ui7HTMBzXPJ71QWlCJKmjN+pAVVg/jGb1bJZOqdtPsm2Vs
 XcNOjhFi2UuYkM69YU5nVQqRBQgjDZV24tHFd6kJrVZ1vFRLRZbeTMHIxS6dQGeuoKy2vFSm4gc
 AGZmgxxndf36VvfxYSlst4RSO21vqWshAwsNTHE4Q7KM/p7eyDJb0JFPVhf4peBRE9iU755vDdu
 Hdrk7guOYNVOnVyQeLCwZG+Xvd7o9GdI4dCjHQGdQxEmaIn2qNFHuiDwZIkJZThJeqxVq2GmcZH
 UqISvbWyd7retv4byJ2gNJtJLY8m5DTnihXr0MmGVAklxDFLNxh/Giq0ppFy+64qwjXoyN8Fuq3
 bUUx4dNf2IWqAYrUO9u59hJFljrgu6/jD32npCliD54rrlXdN4RWUv5MNh7j5eQcV8JNqEFWLh6
 8w0ErR+St/FV/4U9Hzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX/L6YwmJIRcHD
 +f1RnRizuKb3xPokJTZPy/Eu2byzSxbEt5fCi9FhM2DsIg0ff/kMDKSAeJMfp+pbjKAjj2/8k9O
 /hN+beAERcGQgJI/4KjF2zyqT2ui2i8=
X-Proofpoint-ORIG-GUID: EWsEIcLC7RyU4qDMCApNWuflj86-C9v-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

This series adds Qualcomm Shikra sound-card variant support in DT
bindings and in the sc8280xp machine driver.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQM runs in DSP-bypass mode (CPU-only audio pipeline).
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

The DT binding patch adds explicit Shikra compatibles, and the machine
patch wires variant-specific DAPM/controls and clock behavior so each
board is configured correctly.

Dependencies:
- lore.kernel.org/all/20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com/
- lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/
- lore.kernel.org/linux-arm-msm/20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com/

Ajay Kumar Nandam (2):
  ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
  ASoC: qcom: sc8280xp: add Shikra EVK machine variants

 .../bindings/sound/qcom,sm8250.yaml           |  3 +
 sound/soc/qcom/common.c                       |  2 +
 sound/soc/qcom/sc8280xp.c                     | 58 ++++++++++++++++++-
 sound/soc/qcom/sdw.c                          |  3 +
 4 files changed, 64 insertions(+), 2 deletions(-)


base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
prerequisite-patch-id: 430488f50f36039338965ab1fc28d83f02dbc9fd
prerequisite-patch-id: 359ddad8a3fb36f171c96da5ce5ffacd7dd63e8f
prerequisite-patch-id: a98885b9d0e0655bb3161dc2c31fd92a844a5e4e
prerequisite-patch-id: 63e6b911ad6700c1039802235c0a6d5870957f8c
prerequisite-patch-id: 6d481dd14afe58a17230318f418ec3fe0d327faf
prerequisite-patch-id: 7675b5ea6f01d7dadb8df43c8532daa4167fc92f
prerequisite-patch-id: 3fcc510f8f38ce63b24f02d48257ce8d7079b61e
prerequisite-patch-id: 037f677639a12a986e024f9a66df2def301925d4
prerequisite-patch-id: 888f7d13f882fdd0a01bc3fcbe008e9e56394bd3
prerequisite-patch-id: 7db9bb6a1d3de3667a0880f8a75c24ce62e52ecd
prerequisite-patch-id: b898d117a21bddc176ae19937b03e733df72f821
prerequisite-patch-id: 3ca81fae4cb388c4970e908fb63cc99bc1cdd008
prerequisite-patch-id: 80aead6484e36f52cb6cc7fd7d9e0326d8296860
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 222630a15afc952683d954a3c66617a223546de0
prerequisite-patch-id: 3c55edb41f1e25920a350ce1c6f31fde67fee45a
prerequisite-patch-id: 0de75678d071f174c865afa2915be4df1aef8c8d
prerequisite-patch-id: 14840d7e2441e2110c1e147941744be637c9595f
prerequisite-patch-id: a7706e25f5951ec41e6b662c1704df8d20662d77
prerequisite-patch-id: 1e1be31d7ddc47eec9193164defa3e5c473b6ef1
prerequisite-patch-id: d13035abab3ff342753f5bf87b53bbf06a02c6a1
prerequisite-patch-id: 79fcbe1428667a6e0059cea9cbfd62d38d114930
-- 
2.34.1
