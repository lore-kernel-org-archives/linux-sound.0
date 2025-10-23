Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563B30C63D
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215170; cv=none; b=nOSbHxNDxyPJ++BiGph+ZAScOsPld4zDmC4re+XZZQzp+WsKgSvYo5NggfmPW8kmMUlTL4rL+cVBGqsB3F3V/U+IvmyGBM5HWKyNzusiXJMN0KLickoBSbOd/v6QklFNWzdPIatJORWo1pDbidbpNammwWKtD3qC7NwcPdY2KL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215170; c=relaxed/simple;
	bh=tFt+bVXUcHDK5C0sY2xTPU6k+atp8RIvt14CRRC4kxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zka1t7xP97EDW0l138KNHDXzkhJ/bVl+QoXT1MnbDzf51K92f5LM8Ws6roKsJu84MU4/E/6hfwvgnIx7P1mv6K1R1wwaV6yEKIY1dFg15ymK+BTmXnOsxiEv3G6c463kXg6VAYlF4TTq80kysOXrI6HjISu5CazLqAA1pdUMjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk7MBXq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk7MBXq7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7UBpx011813
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=icrZGM2TvKV
	a7LlZmhEJzlmHF8JdB/JFgQoOJEUzghM=; b=lk7MBXq73GZvUNxRKLjjurfPmGn
	yM0TOiSaEzGJmhX/N9ajr70dmXLhmWCNhe+1O7VQWLtx0l9gwAf8YyWUX+ONbMLK
	veudsgdCUl9OVzNoKc0SjejlZDxBvF9QC/NdsqCC1JGA5HCNtttSbRJArJNmYpLD
	x2SX2MA64K5TIjC94Xf1t6ai5LIfPZZPLXyzvyeFW/I5fEIT8v++Knr6WDEoEsOB
	aDASu6+OCdvfc0sayrIe8mPI+cl5RQqhOLkogIBzDJ3KIkhgOHr/OweHK6kr6ifp
	Z/berLnbEipWxGj9PwC/HO1VOEdQV5+4WRiSYS9hbjKHPOfsvgTJaoiH3yQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524a759-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88e094a5dso30719291cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215166; x=1761819966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icrZGM2TvKVa7LlZmhEJzlmHF8JdB/JFgQoOJEUzghM=;
        b=J96klK165a1XSapHG6fzq22Y4kVwM5v/Mlo35P9uB7sKq/Pc4LBy+YxCOBhmwqFX3E
         +uCRNttPTpexqetBQfjYPFkRXyv7El/l/xQCPa4rjsyE1deIOZagQrBdDSHLWr5JlbKi
         WTSdlO7rKG0LVDc9SPVI12Ik98o5VUkDsy4KpdZ8WIOiwdk/+3deb/PgoEzj1q/2X0Zp
         yRXU0zmvvUsNHM6O/HymxgqWGIB4diAhiFNjJO+SWm3NQMP5rtK8YaAUj2wzcRFpNi3E
         UGhJ58riVS2r47iPdjI3QR/rxZ/XdS8vqye7149eqxVQW0GhYnSiOb/+UPWEGNUc/ac9
         0iLA==
X-Forwarded-Encrypted: i=1; AJvYcCUyUkqTBKghO3Lmd52BoFUilcX2nY1q4xFz4yy8+sHjqf/BxcnE/6ilqrj616xExl0itdrqYRtCyJcnrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWF30Snzi7lod+IMHJ1BuPU8ebf1DOA00aCCseYl7wLDxIpvuk
	sVz/ZnHLWlDiOpYmiUtzGStpuStttpbmOf+TD+eri0BH8agU+mAd8owJQeo/O1A6gb0KdEJThjH
	QOm6uF7Pgy0Jlrxpz70L+VS9Ygg7lOwqnIwYFqsyjB8QRJB4MBmSDuYBm5avl0Zit6w==
X-Gm-Gg: ASbGncsyEEgDj17iCqXBXOFt5+YMmmL3utCxbFNlcpxdx1ZcX6vcTde0lHwRrHV+xmB
	pef/zdqJ0/u4ljXts3vhOlIBLw+lvtXRrh4mDaEPwLZJkzcU9j3SUDTnM3AkfTK5TeU5lVz6N3S
	jgUsU/tRLe7nOPDvHGmFCiz76Q3+9UwrCwuxOcK/4xBbcW/f+xWk/gy4suDRJybW18Fb/Hl8pvS
	c/eUjQktU7Mo3ogtYucJd1+ZU+MUI8b3TVzKj8tjHQaKzhxYBJL1TSbRqjmoAbWsnHiPoILRjaK
	PLcIt53gClromSTBBRDnSl7tvbsBYYX/RQYoxE2U8uS+K7OuyTy6HmVsXH/mbZSFUn6p1FGfjoy
	jTP9spDXSoqdQ
X-Received: by 2002:ac8:584d:0:b0:4e8:a7d6:bbfd with SMTP id d75a77b69052e-4e8a7d6c13cmr270609051cf.81.1761215166270;
        Thu, 23 Oct 2025 03:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE1nUb2mvyUJPcGAqiOlIO452HBSW46UgTgNvJ8RYJBBPoflO3K2RftR1udb7Nc7r+XaEXrw==
X-Received: by 2002:ac8:584d:0:b0:4e8:a7d6:bbfd with SMTP id d75a77b69052e-4e8a7d6c13cmr270608781cf.81.1761215165718;
        Thu, 23 Oct 2025 03:26:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 08/20] ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
Date: Thu, 23 Oct 2025 11:24:32 +0100
Message-ID: <20251023102444.88158-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXwnDiJMGIe3Lo
 XmsLJZ9n67GkACij2gpqNBxUFWCqhTeHOxh41rb8dPqNefOvxIb1bSAJT//1KotXOw518kMnTd4
 2wlgNoQxGUb1X4aRaEJPdoDZh2v1PJSXTzKD3/Drxh5b0qpNWmoL3P2jgOTay6y/eP3US+qoL7i
 kit5qpS3hsILMdnFgmPGWZ095WXvZepmnt2RZQbOpGG0iQmGvPJXsoEwdaNxPKmkA+QB7sr1cjc
 42PMRgtSpzO0jG9lJadTOW5nXOnBiE7Fdj1oinIcuN++axsazFwCRAdTMHfRLXLeOpNEWnYyxNe
 SxhWAwDiHkKAlPxN8ABhDsEBvgCsE+6pN8Zn11E9S7H9X7QQSMzrH7xoJC/f8bkhlrct1sR8Llu
 MQkb9swy++emp4u3mHdmpHMvtfYL0g==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa02bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ngjuI6RAwNlUvKc_ZX4A:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NaYE24y2WscEpTY6q8GNJSFu3m-SdB5Y
X-Proofpoint-ORIG-GUID: NaYE24y2WscEpTY6q8GNJSFu3m-SdB5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

make use of q6asm_get_hw_pointer to get the current hardware read/write
pointer and remove any additional code that does calculate this manually.
As this is redundant and prone to errors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index db2ea8973ac9..c2a33d6a0827 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -58,7 +58,6 @@ struct q6asm_dai_rtd {
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
-	unsigned int pcm_irq_pos;       /* IRQ position */
 	unsigned int periods;
 	uint64_t bytes_sent;
 	uint64_t bytes_received;
@@ -190,12 +189,10 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		prtd->state = Q6ASM_STREAM_STOPPED;
 		break;
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
-		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		break;
 		}
 	case ASM_CLIENT_EVENT_DATA_READ_DONE:
-		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
 			q6asm_read(prtd->audio_client, prtd->stream_id);
@@ -227,7 +224,6 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
 	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
@@ -479,11 +475,13 @@ static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_soc_component *component,
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	snd_pcm_uframes_t ptr;
 
-	if (prtd->pcm_irq_pos >= prtd->pcm_size)
-		prtd->pcm_irq_pos = 0;
+	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) * runtime->period_size;
+	if (ptr)
+		return ptr - 1;
 
-	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
+	return 0;
 }
 
 static int q6asm_dai_hw_params(struct snd_soc_component *component,
-- 
2.51.0

