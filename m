Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E6C3FFFB9
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742618; cv=none; b=tgUroVCq9ymeLq62xzDoNN5q5e5VwzZmOc+asFFBJ4KIw3Dr3pqgfmPpW0HEVey7IM5Q/xM31xAFnF6Kl1ETVWeS5IShLoXruvdWjQDBr982VYbc7bzm7Z9ffFmC4PmrCmr0klVMKnGm7nUWh9MGtHnlkZprYIlbxYKFs7FZK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742618; c=relaxed/simple;
	bh=fUvFc3fENqrCdtYGcnwIQZGyeEr3x3tj/FL3fDKbygo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWrU9XxiczICuUjb7O6NuxnIAPNQuSWxTnsjdLfdroBLm2aI5OEQzyfUFVXVniT/b5P9xeck65Le2KiCwdfwhrNipsvBch77jynkREcfqf+l2Ltp0oDYAgLfbM/M/FuzyNCsFB5BQZok94cbu3Hi3UJ+0DWvl/hH5PSSF3ky2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbn+4ocR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHQefGer; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbn+4ocR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHQefGer"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATSWi2579625
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SjUvXL/mX56mOYrPBguEs1h3doPmK8H6vkztD3URlg=; b=lbn+4ocRVkoZVnNE
	yD8zRV04Vo2axT6kVqEI4NsRhqHaqVpNwKgncF89EcNsy3miEGchJpJMVXaEzKwi
	R5UgEaruRUnjJ1iyHH8Atx8poYrHKtunNdqTc3RAwNIKq5F+iSdG6deAbkMk4PON
	SGwLM9tZO4chqQEnPPMXpbExYUc01vLxImzSdgldO45CV/KGJF+RvbbVFw9Bgzo7
	QZQT3kvwsce4c42qv/rpTTQRUdM2HqCE7likLCqpDP74BDr12pkxl76QPkzkn0B1
	GNLmH9KlPBoTkGmz6SC5AtIU8sr+pPzsZcrErlLvIHWdR8lbS/Vj3e6KDpfzGgzt
	zoucNQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hqyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:16:57 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a14c4681d2so4420873eaf.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742616; x=1783347416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SjUvXL/mX56mOYrPBguEs1h3doPmK8H6vkztD3URlg=;
        b=GHQefGeragr51ir4quh9bILiJjpxHSdZN7/lHiayR4iPxBNWZUdaccvrVZOd0kN5kf
         vy4gpTQ0zuTVLC4qkRawz6WGMVx+nGLnoaJkMPq6XYh2Q1dCQ4AR5p7NCZHt6oVcXQvA
         MUVfycrqinIAK1j1+9CocjqgTsscZCQwgDdxsEI/IBIK+J/KIa9xGCUv5GXf6jOoapyJ
         cyMpCVQ8RE20e+U+VVJAeImZhUTPuLqA10PIQBc55p+h8WzOlflPTiuB2qB3j9XxR542
         ga9GF6xd9EpLKoCXc20Y1anxA1m+8c6aOiyZOyYmQfH+L4cfPn2qV9cSi2yfxw9JCp+C
         HviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742616; x=1783347416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3SjUvXL/mX56mOYrPBguEs1h3doPmK8H6vkztD3URlg=;
        b=clW6nBu7/2JrmkJDXq5T0n0orUQsKdNyD+VyaWC+GkQEoSoks3OLYcmWsL6zhksOMB
         Q+7RFKwk3XbeX0D7ufaZLHTEEJsTI3RYQCMPxp/UtRc5edQfLFDN5N7YLCLab8s7VNRI
         /eyKNAQCsGM14WOMp2u99ee71vWy5oVk7Y1fqxB77ybOxUU1PzgXjKCvOWw2bqqJOkvS
         u9keYbdMBCqRcLfatqZR4ASFyNFVxDsIexxIPQSMgtNnzKeOOCRog9TOjiWJRQ4mSz0U
         k+HyXQELDi42zcHTU3x1Z3g6gQSnixHFZqAF9c4E/IiQ/p2eTl0C5+zmuT/58G8im/Oi
         OtDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZZVoInPtALX70pFwuFvmUqPEjIYm4QeeCfFdg2cbdBh85vdHJZseZd5ku3AkNGeHL5A5017kb4fIWWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoDqW5QpAbU9R2t8H6vao5R2W8dKxsMY1nXUN3OfsJeim5yD9W
	ndXvqwqvrjN0iZc6uIxQbd1nQEavHgYEVCnMwnDQ5RNkGeOdvghowqYUx/J8yNm7fHCsZsCncaV
	XuiSXGaFJggqfjjSB6yt2JQLb+3pG1GR0bUADiirsEtqXLfF55y9bRuy2hUOUgBjjzg==
X-Gm-Gg: AfdE7cmoF5WDf8OmzGzAKaZ2POl9spVCTd/CTvREKaDTdS5zarSflPMaDKAkE/PY3MU
	lcBjGk93trRBT7QuqnzMfuj+gsPI8LNWh2hHTYcYshGsVHabRVWGpuByG1NpzFOgRlGdZQDx1fz
	pD9adFP766Yk8j0DYFOeph8vFYI00wdZ+SDjd9BvZLeHTaj0pHSI/j1eOgWt7cAmCRaQE270sZA
	Av4ZlfP7LRTtKh/DofPQN2PyGpA8zzYWq7MMzuA2hjyTL2gHId99prdqhK0P1ydHy5rv0vF7OM7
	BVCYKxv+a9I+EjkPYw3L5eADArTr7hBBhz2vUG9jNpgo+k1N86vQXz/DGHE3Y0LivmID4B3+STN
	rftJJokD7HTtZedXz38m6h6lMe06WLttmk9p7EgowBG0E5Uc=
X-Received: by 2002:a05:6820:4b87:b0:69e:53fb:7867 with SMTP id 006d021491bc7-6a13434f2a1mr10237314eaf.17.1782742616017;
        Mon, 29 Jun 2026 07:16:56 -0700 (PDT)
X-Received: by 2002:a05:6820:4b87:b0:69e:53fb:7867 with SMTP id 006d021491bc7-6a13434f2a1mr10237234eaf.17.1782742614096;
        Mon, 29 Jun 2026 07:16:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3500sm8584812a34.8.2026.06.29.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: qcom: sdm845: skip set_channel_map for SDW stream DAIs
Date: Mon, 29 Jun 2026 19:46:32 +0530
Message-Id: <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX6CUBjb72yOEw
 1twDYV9DNWbs3wHJoGi4PY2Mb8pNINLDCtkGpJLh2mXbGAcbckAhQrUJc8Nf8i9ej/oYm3xg+zC
 1G2CguHHc6RyYUI/c2vmHWXdlhsS2rE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3FwlRal9f9ZL
 em9E6aFUnkyt0q5ZfIGJGYtBMuvW39fxwHTPGHlpf2HnazAMQYSQ2lF+u7ntSKTX9yC7hhP1tlp
 UIwkWOp718C122N+p7hr+HL7SkF1qLAreHYHQLc4QLgi9T1ZhDje5TL2ZvyKz7oYVxQVmVuMNN/
 AUugmZ1HfQLDKmkus+X+TGhhI8uqW4SCktHVoU2D9KB7nMHiQul29MXRRdHpyxB4UMDy8yIoOcS
 mo5/wgKePaf+bv8lAG0Ueqp6BRiT+KC2OwFAdosfn82LfxBPgl3k0b1kFILjTKSlMJSOzTwgWRR
 mO9HR9PN9XGoZm1bivUyg3QjrQRT3sWzqxyNGYOs9LO7Uvc2peZHOllplDJz1ptJWR15MxVneVe
 ySmBKTOvRfpUBI9TVXLM0GsaLPIjc3Axz9CyR4FMcX3pgCJTBM+VKMEg9PxZWbwvcZ5d3OWo6l/
 qDQzg/su2iakdkOq1Ww==
X-Proofpoint-ORIG-GUID: FuTQBxq3eLdgyseb-qKOGrRxYkuGgAbW
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427e59 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fJR0_yvY6LQ15X-jUkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: FuTQBxq3eLdgyseb-qKOGrRxYkuGgAbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118

On sdm845 the SLIM Playback backend lists wcd934x alongside the qcom
SoundWire master and its SWR slave speaker codecs as codec DAIs on the
same link. sdm845_dai_init() was calling set_channel_map with hardcoded
wcd934x SLIM channel numbers for every codec DAI on that link, including
the SoundWire ones, corrupting their channel configuration.

Skip set_channel_map for any DAI that implements .set_stream, as that op
is the distinguishing marker of DAIs that own an SDW stream path — both
the qcom SWR master and SWR slave codecs register it, while wcd934x does
not. This confines the SLIM channel map to wcd934x where it belongs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sdm845.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 0ce9dff4dc52..509d7a551397 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -294,13 +294,26 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			return 0;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			rval = snd_soc_dai_set_channel_map(codec_dai,
-							  ARRAY_SIZE(tx_ch),
-							  tx_ch,
-							  ARRAY_SIZE(rx_ch),
-							  rx_ch);
-			if (rval != 0 && rval != -ENOTSUPP)
-				return rval;
+			component = codec_dai->component;
+
+			if (!component || !component->dev)
+				continue;
+
+			/*
+			 * Only wcd934x (SLIM codec) needs these static channel maps.
+			 * DAIs that own an SDW stream — the qcom SWR master and SWR
+			 * slave speaker codecs — implement .set_stream; skip them.
+			 */
+			if (!codec_dai->driver || !codec_dai->driver->ops ||
+			    !codec_dai->driver->ops->set_stream) {
+				rval = snd_soc_dai_set_channel_map(codec_dai,
+								   ARRAY_SIZE(tx_ch),
+								   tx_ch,
+								   ARRAY_SIZE(rx_ch),
+								   rx_ch);
+				if (rval != 0 && rval != -ENOTSUPP)
+					return rval;
+			}
 
 			snd_soc_dai_set_sysclk(codec_dai, 0,
 					       WCD934X_DEFAULT_MCLK_RATE,
-- 
2.34.1

