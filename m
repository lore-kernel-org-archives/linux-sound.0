Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB49029B77E
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629645; cv=none; b=R1z2kRjNa7j8F3p4rM7X/EMMqnJlywbeZdiUvP5KhAKV5t6n8AuzrUAtOIXEP9c5SVOIhJPREJn2vEtKmWneVXba9Mw7da0YZP5xucOk1PoMGJKqtiJkL9K7VD9mC3imxy3J6D8gYmRQc0dW625rNHvjTxmADDNtxfYcSfGFjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629645; c=relaxed/simple;
	bh=KvhN5EIM3XXPaotrLaYPSuOdgBSYq4SNpSPqi8ZqfN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Av8KHznJGP3sE6/DwcWCOFDgHhH3tSzQycJbRu1SBtB3zsd1MYxYZ5LqQCPoJ/yogM49zrKPh0VghotdlGcbSXnGObYqsSv4xAYwIGjwvqaThB4uiA9rtEbyGlasds8odcnsPaROQoKEeu3+SZpFs9g0/TQnK57prWZam29yfE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJgHZ2YN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ufi9ipDk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJgHZ2YN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ufi9ipDk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T9eI2277038
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K4gYoo9JoJP
	OJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=; b=bJgHZ2YNtRjhg6ZNGKNu2y4jQWV
	6RTo0IzyHTPTEUIcoQ9lI2wzYZhBEKeT1CiKLTf24CQbEdW+TpHTblxcvhgKFUp1
	VkItVJfjhAo3P0HANGFx1kyXtKcBVBjaoJwhxLEoMr24mgndGSNgN69+8q6PJwaR
	epa8+tscQWZVAXUVObi0Omb/sTwMfep293ADC7493PtmvAd5tghTBLnkMGcYvSvR
	qMH6EIqTpo/XLJl0iy7Cx+qqVXCKe1uUQQaKjG+0vNM7gwPc4nhD2kJAwLvDEEve
	gSu1mtEKGhNHheSO06u9bBLQsg9u7c0FPcRNSqVpw9YjkXVZmIDEWE1ilQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msw5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70e610242so1062303085a.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629642; x=1773234442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=Ufi9ipDklVsKQO7cF/i5cac1ETpF+1RuMeO5J3mbO9Y/10vLXsd6dhHoXLD+Gmt3dJ
         h9IOCYqAOOiNQw+HDngw5EVz2+nnw3X7BkY7yJEmT9mD+2A5jXsajnuJlL3oPbSxuJzY
         zRQ3BiNj5UjwIOTU+Hjbij2vZXLToNIeURrBOeV7E6WKZqZSSB0paQLv2bDtQD6t7iFd
         QP9J8qsthWdGK2MVO0Aq7FyrM3XrKKjkh73I/7W2IwpkV5ZBfWFI2rlrovh001xqLc9Y
         1S7+NsABzCUreTQZEb2l8HArsF9iYHV02/O6OqpVdY87KQVPt8uzvcfCdSOeKZQIgGro
         qj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629642; x=1773234442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=h1Z91ZII6aK6UJpnDd/+NePLOoUa581EJqR0/AotX2picCwWine9jjxJnl404GF933
         Ryw9OzjY1dD7BUNxBsFvWLCculIwsJqYo9HHkhZnh2OyBCOs6fMduHZR0p464YCULACf
         0abdDpbpRceyjTPJj8nYhL8u3JamlhCilKR5XXjPHMieSOFxjFGKow9nR/uvkO9ho210
         K3TuoVMnau619i/7b/pti4RKByDGR+GdimjSIpFkNBN54CUQCKaQZITBvEXDH7iUDW+s
         vTfjcV9sUl6ZN6a3FVFCLfkH/+xtkW5NVYoHz1cQVjE+Z79zKeqUUk1v6t+juRhtkJjF
         i6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWNcKleyWK+SXoWAo9zfzX4hlf2zME0thatPq9RgAssMPUmJs3O595npgWMyXvh4JcQ36DJ80vZ6WMRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnJIvfc7WkzVk+qAhQBEqxBO5dTwWpwo/pKkP47JektX2gYYV
	cuSA/UkRAWlvb6ozbCN0Y8GTKbRwWvUJRbm3wrTCA+wiOhqXR3dtd/Ggl0/WM8ygJR+xBqHnHV8
	s/7NQIjETSUMAr7F5OwkmOvWkzwtAfXtE8gGnxk7VIN/S/LGQVs/fLGBiC56juxflLg==
X-Gm-Gg: ATEYQzxODO9AokPBSoMD0/TUS1kRYmXBe6Iqi915ATnaPO+luthI9j8rDT3x9v6dHPL
	fCbTFkm87RUAr+6qNZsBAZ3Zq5i0BXdgbvCZcFZcaLsWdxhH7jJK9Gx9wVVn4vERDxTkEGXfXL7
	xpxpgxGPFumnKTHFdfBvevc+5MeDbLBLGOUbN1rPBqYsrWYLeadJF5QvBdMPS1gY97dOQx9Lb3j
	RrFyhw1haab8L6F4h5dvQ1xYrfJIJg+CPXzG34Yq+Zv8v9bVEW/P3vK9IZZl8tig/C6hud0TvEv
	JtFjaSdVXCuaS+hznJw+7Ce+EuFfJ8/nsdRD9K3sRmjslSF+Bv0b/5RDtpwr0+24QiY/9ZY3DZh
	qzNsNkdX0hM2Ww6Ew/xM5AWSWw0GKPefIr58Qm4pU1JCim82OG2aKDsA=
X-Received: by 2002:a05:620a:4727:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8cd5afd2111mr209564185a.81.1772629642227;
        Wed, 04 Mar 2026 05:07:22 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8cd5afd2111mr209558085a.81.1772629641720;
        Wed, 04 Mar 2026 05:07:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v3 04/14] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Wed,  4 Mar 2026 13:07:02 +0000
Message-ID: <20260304130712.222246-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 1n2BOLvSwNs-etVCGsNMxWWgCbEbm625
X-Proofpoint-GUID: 1n2BOLvSwNs-etVCGsNMxWWgCbEbm625
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX6qYIIN4Vl8Vb
 W/0RgCJeNMAdZgkFhPZ/V39E5ievZ+3jBTjdQcIyqU9QUZ/D3LJ55WX860Ilmdd4QMthazsBNNf
 lwYt9zLa6QZbLrXTn23OfecaPWzJ0lyMa9y8Bfv2/kJRTLXJJ8ipj3yD4Vqg1fUZPpHvkhxa4Zy
 bCKHbBZJkyu4eDQVy8i1kBAxZU4eKC40rkAi8YtPegfvwvI9z2INraGQlbzKAV0ovX9xwHhoOfF
 AMYPj89WUspyhTR8P19sAAkBN9nYkM60vJUJJ7Xr+mcrHAx6e6OOEfVW0uu5Z7p3UALmUM8+CaF
 3eSIArm1xsDiR8deydReVN7tt7L2FeygqIWjULLkfPmcc0NQ/ZLGIU/6k7vBOq1j0PvDU9Vu0a+
 HPaKEOAUIHJnTpD/M61nUg231JmTJj4/Y3RD0uaSc45Gr0TpWeNG+BXClbZUmR+4Azw3iHoHn6D
 6HKmQuVOCmFpKB32Wtw==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a82e8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040105

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 528756f1332b..f68d4b4974f3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

