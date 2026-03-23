Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3BD383C84
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305550; cv=none; b=iW9w3IW0nWdrN5o9z3d5TiNl/tsxiKsDU2WwttJEUgesKvEYXDDAdAdZ1MIw054e26fT0+WA2XPRtaNKc71q3fyANVfsJrhT7NQiR1Zo0Rf5SQzE2k4OA46YcFxD3wlPKn7IbxPEFvUFInL9oQusYuF6svalki8U8OLGRxTSSsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305550; c=relaxed/simple;
	bh=uSbPbbEF96iO4/jDf1d3kH2TPon+s7DHfw5HFTuRwdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFwlJLbEBY1LNDN9h6n6M3I/4U1dDJ9iPQhK/DL2r6/XCz0MoWP2kQo1n5f3BG+zb6RQOVjPxe39aQhAme+ZGKfXsF9+cdADppLX3HFWvytbh86u2j5AUfMkO9PL230G8Zo0FmqxVX3XeONxaEu+JNRBblHWEDLj0RuoztmJkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXFPfg4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEcDTOH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXFPfg4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEcDTOH0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqhu73934726
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/jKQw8dGxLC
	6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=; b=UXFPfg4Pc+yf2grujnyk+iEix6P
	EGl0Ezy9IKDWfnTcxfEvfXpvaAJFq3lHhyjbh1jzAZQGY3JYxrksAaCIj7p/pgZE
	hfMNe1sd+/7jkyqC58m32NZMcXODN0demDCsiK8ZELr/k1er/+R+WMIZhN+/GTte
	FcUfTV/TEqls7IDe5JLBacuUYH1InGq1t1lqX2JVbM/EUafhNTnQs1+7ZZ2INz1J
	w7cSpJLpbyq7wl4cbGBt4x1FaZZ1mB+iEHMkiaXvt0fuBG1oBTX1IcLpHR3/pBZh
	9Y9Qbstm4o0EtvMhrI33AwKNTU3OAv6Ir0mqyBfdf3+zNI5gxdF1/hZ7mQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0hkc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso55802901cf.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305544; x=1774910344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=BEcDTOH0KlM6asJ6wnjVNKvGXIuXK3CTdxPmHy+FQO7Qf+LoayBeqMpW2xMwoB4AZj
         E3dmeSUelNXffw+oTXQAx28xlIoaanZ1k3w7LICnb2tEz43DNQspMDqR3g/5Hi7mpMkC
         1C810/nO+dCc9x+q/aydtWdIBOsvn/hFKPnlgf3aq0uJ7mEFWfOv2D5OBRm9a4AX2QZP
         BhYJPboIZliifUk0bnC5WV/nOnMu9AOkdsvDYe+FCqsA08ObqPQj7tU5NRZQvjJ3QDfo
         jAOjfXeTFfvKzbyTw4kgwto1vpn/xkEO4cNptVgE+kxy8K/zhhuIuw7dno8RyaHtA8J/
         0T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305544; x=1774910344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=dM+lwXSigbyQfN7QVVgeoj6c/saKrWEq8Z/mwiXIteD/gWyjUoSGouW5Vr9XdiU5k6
         8LmILiBLmmH976N+Z75w0OYiMcttFDNTzQvLsfCKIXP/augput0oKw/UAtmoW2CGS3PB
         s/91QI+67Ejw2NHgJpKpg13LSlCi6OlZbt499/171h+wCHGZlN0hqBB02HOeIECxock0
         80Mql4Ix4sG+4fNljcsNIMcA4K4Dvj8x/rqPyvSb7eHKPdM5ryKC/BHnDYTpxfmAFLKj
         2aVlszKlGNoV6XmuWgh7M7cWmriA9ZLG5vNDAZI/X7OQIEjX2rNX5iRSpx2uvGhekrr1
         Sleg==
X-Forwarded-Encrypted: i=1; AJvYcCWTCCcMJgph92vwbqsWzLOIZcv6r3fqedEA0f6N+cDOQJsYR1GiTOZkhIcrnnyshCqy5gKILMuIHMPEkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zMHJIWsMIVO9lWcHB6LV16QTVUhEfUZTOjKbyEB+K9UF1/jK
	S7GWkiG9T4daUp88GiWpRcPLGlhxmj7ugNLMcwBlHVSYtboJvgIjtfJ4mR8wmjzpoHe4fdVEoiy
	jF+XfwUGactD4FkYMOH5FHmrXM+w0gduzlliV7hTOTqA9tMv/Jdhm7ww3jXh9GRQy0g==
X-Gm-Gg: ATEYQzyNYupdQJ+QbvxDKfTl8XyoXlavqg7NA/jbBGSTQ+FQoT0sv45RTci88vIeI1z
	dTIrQNkYnr7PWHV665YOGfCovtMQAJI1NROFBRKdLyCuuEvv2n1oZdtVF7Xj9JqI0bgQchcnN4C
	4ZQexgbiFUQHUX4Mpu+hGNT3NxVHLAVfi+w7ACVVZuxL57HgQkHOW6wMNBtmciBbamv9k8wiG9H
	d6x6H4OnPdAwyksoTHka7+eWjbO+HgI2aJ3MIRKPJLJ9N80p9fsimaxW4EeeXZzEKrrvzTpzHQy
	1au4v0sQXzYSxEEl15Zo+qvYfvWa0Bx/JP3xF+IEqLJHdlsr9v3E0vR9nkRAa1yuW18yC2aVA4f
	hJ10ZGgPD9KANJBrB0MvVB3hEmYTKfGd5vuEwmwZbsgbmludP/0cIric=
X-Received: by 2002:a05:622a:154:b0:50b:6fb2:fe1a with SMTP id d75a77b69052e-50b6fb30404mr14837261cf.42.1774305543684;
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:6fb2:fe1a with SMTP id d75a77b69052e-50b6fb30404mr14837011cf.42.1774305543137;
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v7 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 23 Mar 2026 22:38:37 +0000
Message-ID: <20260323223845.2126142-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1c108 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX0DgD0EWL0rL5
 aI5A++nREzjK7PHxlQ6CcCXgfZuq2a19MmbUTNpkHzWxoZB9o6Mpt4Liiex76FzfNbvPt4OKWJ6
 UaRNkm2wkfS17JUdMdzIVnHRrRtBw6hmqenlwKHDwYj5bPuJNVanZQat6zmz3bkbt7Gnq1p1iXk
 LoflPs1fgIjGsq+OhEjZC315lEGniHvlMOGY9VvJW+D5JhsYpCNRYjAQWKrWJaogytUlm110/PB
 O7w4xlXho10NYK83yDx4Zbr0lc2i9jU43Z9SCSp5wjqLVThWu+gkM50d5mTq7MK6GtYuaYb0hiY
 sa+nx7NChBpHsUa8eaGBe58v72i1J/Fa1IijrSt3GZOqFPSnbdnMa9/mTFQ2ESmODpHMtHDKNZy
 jmuevfnP0bSj9PXFgiYTKrI+HpPFXemaMHXbcpiv0imU93ML2PkFn/F7pxBIVzYNOruSwS9N1nD
 aroKrGWL1sWkkCAYQBQ==
X-Proofpoint-GUID: tz5UFKtDzZPszDlfxTy5iymj0Q2d2rgg
X-Proofpoint-ORIG-GUID: tz5UFKtDzZPszDlfxTy5iymj0Q2d2rgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 306e928e7b49..292be457764f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 1fbcbbf3123d..9d4cbe29cf94 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3

