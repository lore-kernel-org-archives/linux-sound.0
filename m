Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209234DB5E
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753678; cv=none; b=KvrepLBsyiaWZYw8Di7AKB18FEKYYQCRBkPRxy40QvYX1AHxK9L7XiJkFrHRVXqlu5jswPitMfmbaGe0LFYLPdLhjJqJA9NoiRwmNaGgHTohcPAIMgl7Plf5hgXpx41c0VGkPf3blm0zuwqTOBBdgxRnGb8kSRgSa5Pgguqpi1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753678; c=relaxed/simple;
	bh=iZXJ+wvYSZ5S6EtMrmxWZW14bw4Q9snvePaLf0HVOQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4XLR48lEKiixERXluhKW1qpJK1DwZFHuqAPqaEmpBpZ9OB3i2EgbULeF9Y+ToKTgWRtnG/WZdEy5EW+zWJTwWNaqUELgpU9VO+zK7wz5Lt72gEn3mKb2RkWd0++ZDdsQfyzTlufguT2rCeufElZ8z+Cw9EUlkhiL9UTmzo1Sx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOOEL8vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVIgmx7k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOOEL8vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVIgmx7k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TCGHOm3663636
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xd6tUxrDmZV
	yYkpH6AHK/2JkgivGrY63G9FW6CayDw0=; b=NOOEL8vj2NWA1GTOrvp+0hoMfod
	hfSfTlX58IIOqKdai/Pwy8kBLc3i5BtaKYAuSDXg2NLnUiaGPp5PrXmCxs62xOQZ
	TOSbY5brM2mR8uyXCdJdZEgn02oZ/C8mWyAQre9lj+MuMPOyH372zNfjRjHjJOAa
	gy9A5fNxX6GGpSXXyzk7F/XeDQVSf2itzs7KB8gPSJcKnju40EFnpyzUCVNdwkYz
	507M30s9UaqLo62GPbz7YUblmSBh9ZWqHAevCS6DRo9iQfAsurWtpUgqh0rljSfn
	irlnE/VJcBukpfrNvTj4GcwXRhnbFVIQRHPitgpXxEjSfjPi1uR7eLvmJYA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1u5gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54aa7b50e26so8969e0c.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753675; x=1762358475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd6tUxrDmZVyYkpH6AHK/2JkgivGrY63G9FW6CayDw0=;
        b=XVIgmx7k6tOB1g0Es+2T207bOfDMISnUl+TOP74/nwgLCLxvvU5StQ2lqtd/+QXONM
         8JW0EA22dX29lpBBxsH+MWwZZw0+/BW43+GhZh9/CmQ1yZHnflfZvIcr3tV62IefKgNR
         q1sJvyH1DAcct0U1KHv0IgJzK+luXJaHSfVXfiWxp+oP/MG5n70ckiHQBByMv5gibqXK
         IZukCfqdPfMpsdki+lFn7H1ET74jivQiJ36GeMSOutUClmnCG72e68w07LLKWpNkJS3Q
         c0hTPeaT71BKVXS5mTiaCIoNm3ZvB63sHwK81E1QRz/nxcU/jw9r3DdCgpp6caf91WSo
         OODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753675; x=1762358475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd6tUxrDmZVyYkpH6AHK/2JkgivGrY63G9FW6CayDw0=;
        b=qj5S3HquuMxk9c+Q3n0lYpviBwgWmO+WmigcgdwO2HWoJjDhzCrqKfzW5OlUkld5Fc
         ySLlPd0OrDgRFvuaWUUah2GOo4V+iriaDfMILpSRMNn72QERHggHqljfvUAPeZv/YI0P
         dj03SCOruls20ceNEvblvTeYjjvA32Kwtn3aYUrqJQsUYvmkLT8y/vWCZFkm+CJCx2RG
         oXXrx6dLdvDe1p7sK5DJI4ZnC1nh+BrOrkOcTkyO2TcTiV5OtkwnPEJr0iVeYX4ZsPpc
         VA932/fAbswLHLvWqSAGoyiTvjjZL22KY123jDN1Oc0vO8FHaq7L9iN3ZS/kYMPsZi3t
         zj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/XzjYjWr8sBaiFKcEwHdrLjUU1idI0ceUKfw/k9zgFv73VNkECV1ybIrAwO0/y2dEhhXvub+ocQV0aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Vdm3Zjw68gQLU42nVbWgs31trqSIhufS+swOlN8KzKoBeyUZ
	EuJBMSXm8hIK+t0VQtIpazPM4TLbmnU/czSjlZNbj6WFmy8Py4AwsVP3Xjb+C1r3MEc+ADRhWU+
	Xhhh6mRCuzlrgFPbnXeMHE+WHVhwo21lnCuX4pLM3XteuXxTB3U6AUjt61wnPH9uYHA==
X-Gm-Gg: ASbGncvL6kK11XyNaNKtHkIESnGJI4hv/g4dJKWsITbdlMXp4KiwT/boRDgDVZon5X3
	TrkBXrACEwjtBWoDOBakFcIVm/8oqyTsfTwfEGVO3ZPRk9QFzhtEHlaoFZW3odHXjl8hZHak0gQ
	5QN8D/80Niv4uZJi6fS3uf6tiikIFYgSU7rLTEhi/Zv03oolXq1wffG4vSC0HQB+sC7fT59WJnb
	KWua90F38iuYYpQ+aTieWKje+qYDvOjlEuVHeMAwfrmQf+P6LfMGY/lYFje9+bPr0fJoH3LoFl5
	AMM6LqH3pguYWBakVB/Ud/We9pubR4c3L7xzLykVQWwLuV1tmZwHj5gE6NUJz115O5st8RvD4+j
	zgoxzrl45+9Xo
X-Received: by 2002:a05:6122:1d9f:b0:556:4f4e:812a with SMTP id 71dfb90a1353d-55814105b1cmr1156445e0c.7.1761753674880;
        Wed, 29 Oct 2025 09:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmMyq2OMke7b4038qoWowzNVA9IP6dPgXk9UEoB7Iao+WLyIdArUF4UBE7roEcnbRQ9jmahA==
X-Received: by 2002:a05:6122:1d9f:b0:556:4f4e:812a with SMTP id 71dfb90a1353d-55814105b1cmr1155604e0c.7.1761753668177;
        Wed, 29 Oct 2025 09:01:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: lpass-tx-macro: fix SM6115 support
Date: Wed, 29 Oct 2025 16:00:58 +0000
Message-ID: <20251029160101.423209-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sxXHL1InI7bqn4plWiSwWcrtpLU3P3jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX8Q6qbD+sDVNY
 9IGn2qX6g4YkQc1SAzq6Qf78l8lX5iqQWinZHC5ej5meUVaQZudPZDAbPqrgJMpTkLe7Jfl6I39
 pYJSEMJSJ74BClfkINo/op9jSrKUJuaWYZu8Wv1f4ctMDUwdO0UI1J0U/x14CGxgLgN4rq2O9wI
 UWNlRvCPCl5M9MvQXVJ4qtakLDs5LbRx+PbAxCmKx0AGlny5+/mK4cHmFsJSLx9JQSKoxUE8+u0
 Jr7BEVyKSBcutmCpz33beIcUk0NgIiLYJAVlExq6Yc71KxOhXN3mzjSHm3W9fR0JiKUDUOZ0Xvb
 TLgx8aSKY+e8pNfyrh2YrJjyliGnRA4ouxFbGgHlKYvIBnqELJ/uSQ1Jl38rfEWIDiZSJxqPM07
 OgcWl86MB62MfmOFSPoOkas42JmfRg==
X-Proofpoint-ORIG-GUID: sxXHL1InI7bqn4plWiSwWcrtpLU3P3jo
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69023a4c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WUhUZdYVz38ogwO1su8A:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

SM6115 is compatible with SM8450 and SM6115 does have soundwire
controller in tx. For some reason we ended up with this incorrect patch.

Fix this by removing it from the codec compatible list and let dt use
sm8450 as compatible codec for sm6115 SoC.

Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde818..1f8fe87b310a 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2472,15 +2472,6 @@ static const struct tx_macro_data lpass_ver_9_2 = {
 	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
 };
 
-static const struct tx_macro_data lpass_ver_10_sm6115 = {
-	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-	.ver			= LPASS_VER_10_0_0,
-	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
-	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
-	.extra_routes		= tx_audio_map_v9_2,
-	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
-};
-
 static const struct tx_macro_data lpass_ver_11 = {
 	.flags			= LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_11_0_0,
@@ -2500,9 +2491,6 @@ static const struct of_device_id tx_macro_dt_match[] = {
 		 */
 		.compatible = "qcom,sc7280-lpass-tx-macro",
 		.data = &lpass_ver_9,
-	}, {
-		.compatible = "qcom,sm6115-lpass-tx-macro",
-		.data = &lpass_ver_10_sm6115,
 	}, {
 		.compatible = "qcom,sm8250-lpass-tx-macro",
 		.data = &lpass_ver_9,
-- 
2.51.0

