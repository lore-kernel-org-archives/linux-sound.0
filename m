Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C973C942C
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018174; cv=none; b=OGP+XEmE9+gTNrWOU0DPghs+0/klscW7TVUG/idgL2TfbgDvvpPkHNHtOIQRzBb0A0eK37xw1WTe1gQiSQfVVO4EuRkZq6EWjirXWyAb6cA6CXfqF7HsRJUGP+VMmhwQoBTUcqpJCJT7FbpuLHmxb+JyZpDRWuxYcWGxFtlniIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018174; c=relaxed/simple;
	bh=uSbPbbEF96iO4/jDf1d3kH2TPon+s7DHfw5HFTuRwdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Faia4UuQUwH12cUTvqQdVrge2pgfCEJ+QdHoR+ZxWJM1lbTP/6dC5by93ai/0L6RfOVxA2ni5rfFLLUh/vUsaG1y/6zCT/Q/V/dPayk78heRZ21/0hIATWqyi8s9Y7NBoNdzbCKQsHBFESgcZ9HnAU9NbvJr8eTybUh8Cc5cawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0mudFIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6LhaE6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0mudFIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6LhaE6P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KELeZ4332560
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/jKQw8dGxLC
	6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=; b=H0mudFIR1/xHDAwKWwh7u3rW4UV
	0YoL2HXoCdZfXn3FcRnoYI9SiA52cx+zOE8LZfemtOw8MIsAmmaCbajCBT+UgLVb
	hBOfjxD+fS6ypsuDT5hlkO3CsTspZBKdfgMiZwx5j+BbfKwnZ04QndJR/ZHgYgnL
	nJdu7EeqVUOL6fROJWgJcNH8PvaDpjgr+ZpaxIkdsPRb8iJHlZx4x3qp+rbaFO1N
	McnwM6KtJoxpfg8x7SjvvU1rrEWsqQsi33wxvg9FNi5FF58fQGsyAetdkR0nr8M6
	DBjLiVU2s6I8Jfp2hDCpvQkjNaPyHL3CpltKY7Cna9fmFpYJrsKkD/EzTAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k083pbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b380cd5e3so66753091cf.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018172; x=1774622972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=C6LhaE6Ps8jL1tckqKCjDmeMdUjVJAWHXlFVAcPnh/aVEJCmZu4JXG/PIJ4YACuAja
         eOW1vJ/eYeKYbuncY9BKnxZu3s+mEzPW0XG3CflvcPalT40THHLa/pnZhV3XX/GYIRyB
         J7rVHXVBswVcEchTlb1cl5+/8Vx0vdIlovSVRiEE39O2gI8cxxZvdItvyfCCZijju4Di
         Wjq25ie3fG45curUGmVvg5OFAfsUQ2pP0EhbO66By2HvpIsXBqQk6PyixzAvjjH6LQN5
         rsgB3l8LR36mxY3X3Cy/Hth09M6GnbHN6OjJ+S972Z2FXWu1+MXpKBf7aLifaJ7qzWRT
         u8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018172; x=1774622972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=ANSvcrDYq1iCRG+ANp5EkBk/l3JyW4kSlWeqOjH74+GSipDr36tpl5ZbeVgpSABpE6
         t/9wj6GfMD+qB142W98E8Oyll5z5GigdJjo7aGh5B4DsdjmqZfQTWkcEaZYoYHfzrcnB
         SSxZGl/tOkCGijXyxUDSFBMRPz/BuLVgtEDkizKAq+Ho15dqhyQ/rj7vfVqe3j/sJINr
         W1gGqtap1gksrAUPIgg4l5xdBIyJL3iPC5XUfoOEQMiBFEcTHaDzwARZnlixmq52zzfX
         7klYBjZNzj+Vu+xeqxqfLYTwu3sipfX1egujJlD8Jdz0NKdWQAqUjkFBbGirnu6ZouAm
         jcjw==
X-Forwarded-Encrypted: i=1; AJvYcCVJOweu2GklSOZB9+DIAqs+Cf6asOY+Ev3PWLgK1o/hQ6gvQ9o8taj1wmzkTLAKIZ8KRX0C0WVsVKm9Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1A3fJiixFnPqNeYbTdaEIsCp8Zul8sgRok9cN41aHgZQIj2d
	dP1r3wpbREe8HlpiEbQ73sHCNQVpNuTFY3RFBxAmmuThdrVRYrfcRuDRDbj63+Vlm/RgRZvpLxU
	ertTyZAlEviqi2w1O6GjOCnjk04tWjfdhWZ//3Ijgpy6UkcD0CTn6vijSa3gMA0Uj7g==
X-Gm-Gg: ATEYQzwOiZrw7d7mJkHz3Hf+DhltP+e+ssf/2vkiAhXYdYcBSeX6IrXid09ci5C3k9T
	niV2p4etIfnU8Qg4i1gg7WhFuiWCSjgD9MNzWD4AOh1FuGbF9zg4z+BRMAA2+nRL88icDrMJHGm
	QJBW7ZMkPfTLYZ+nAwcUbq9IuCSW631HYIlJpfZ281i1ncxJ4qY8lTqfhbDquziiIbP0ILjTDeh
	HNRohvKm+ztQ+Re1aoG7lPEjgCFffEDxYjj2hr7CeC2zlS4FZhGV4wRNNv5i2YOJOr2vl+i1KeY
	NWGpLmXsFYW1oFH1ysNJzcKX4XuQKq7DfHimAcK3ELrOc7S3huTDUiKvapgm6pkaPP8Bu61nnmL
	/Fy4/Iq018KIeFxammaLzQF7gDkxHDGhAWy90SxTOiumuxL+w9inUIXs=
X-Received: by 2002:ac8:588a:0:b0:509:609:b2e5 with SMTP id d75a77b69052e-50b37453b95mr48199021cf.24.1774018171660;
        Fri, 20 Mar 2026 07:49:31 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:509:609:b2e5 with SMTP id d75a77b69052e-50b37453b95mr48198571cf.24.1774018171219;
        Fri, 20 Mar 2026 07:49:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:29 -0700 (PDT)
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
Subject: [PATCH v6 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Fri, 20 Mar 2026 14:49:10 +0000
Message-ID: <20260320144918.1685838-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bd5e7c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Wb-C7aZV25JY_Vnp89SY6t3krpHqrIPb
X-Proofpoint-GUID: Wb-C7aZV25JY_Vnp89SY6t3krpHqrIPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX5dFwFEGxAfQ3
 ClD6K0uQa3bL7l/kQtP2GCHshSEXjhzRNUCIK1QuqDRuOt7+fIsa7Ju1u0nFmDYYz75Eb/mGa9Z
 fLai6ZkTVCUg5M4mKbs+eeBmQZDS5yw+tp0puM7HEjgFPqfolhoQGNKSnGtgz5PNyF6i1h6vpJl
 ghe9+Iz/CQ5NHo5cySLFlDFmRHPo0FnGgIqQK7d3JkimlxaZWfRCxx/o+2UQcCH/ynnIox+3qD4
 HTR4NskCzxuO2itOZIW0ODZ96inn4Lv93JzsBrQflYni//viEDV+r0SItlUZnIXQYjQp0cMm+Ve
 ghQihGy3nxa7lI2LZHhqArlWvicmqJKOA44Fj8hvzFl9fnceMTA2wo1dxZM9iOddF8KEfHpPPQB
 cHuYTvLrDVRLa9thJ4JAQC6eEF/hS/d1kc5+i6//w2oiwaU9MPRlI0Pv9B8d2NYIBXeXDzboi1T
 XSdgtfKGuQ1qQErWFcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

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

