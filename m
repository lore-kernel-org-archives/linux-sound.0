Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD7A2FD1B5
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215162; cv=none; b=sMhG+1/iIflgWUzpMOWzRdm2mTb0wS+3e8YxOuB1n7P5kiGpEtyHx8WOFzG9bi2jI92g1iWg86x0WP/Ok5lbLbM7Px8TMXEJMLtUl/eUFBPthF3Bqp4HRp3OvTrxMPrJQ6WL6F2KMnGXnokYSMKAY3R7RQYebvPwzQIciyJRBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215162; c=relaxed/simple;
	bh=+pEzU2CaP92P+tjHZGLYMYsO+p/lLdluRH2vfoyibvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROYRsr1Ci3lUKMliArha7LfxiYsivQzJwwMHfHUz5p8Pc/I+GgTR2qqMSrz4NdcoEgV7v1LBgs/MJPDWfkaSorTkJaBb16LBNSPbZOpwspEThdYUrQdSYtd9MuaUYkVHyQ6fz8dqoYjiLUfFRJMT7xGfxcI/ej7KEPibTNsOtqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHD3C6ag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHD3C6ag"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6sw1t007476
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hugy+iqvLUJ
	2cjxOk55z+UZwKkAMqHXBccnGqDcDbTE=; b=bHD3C6agXJdHa6WOJPjq+k2cj2e
	Efmk65n6JaL9JQox4iXtAsYb3tUz5HRd2dNh03JvSMyQtls+BNIfRxZvW4HZAJRN
	R/FJ1hCidjA/3meuFLicg/UNMQ7U9Hl3/IAndNM5JK3dzuRD1j72gruOQv35jdmu
	OuhMW7b3Qrc1CjZIIj4YzBEyseY7jF12jWxMzgjlqUafKIFybYBXHImFYPxZGQIV
	y8IuxH5luwGauiSOSHgMs7FaHx1Qa/aoLVJo/igQJXK8wrT775Rh+9qYj8uK0nEK
	0rbJlfPmxx/QSNrZAMeuf/9hUSQqtBJpVarEDIJtLDgCr2LFJpCfLwAJI+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3448397-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e89ed6e110so17800581cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215159; x=1761819959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hugy+iqvLUJ2cjxOk55z+UZwKkAMqHXBccnGqDcDbTE=;
        b=usyJ+eA67po4a/wQQf+DHbx49Nw7l0ZV1eOggTsM2i63w3xz3We+P0z0lh63JL9KMC
         rQ4bqC4WGkkeHqVPoZXR2DMJ8vk1nrWwbqpvX2nZ7+yMtlUmkELFtDTzZq3fXpoffCC9
         jCR3KHKg71tDtFR/qei2/AG22ijGZtjUyJTvaLIteXKwRxWFCuHMY+f+sV5v1h8eqd9k
         SlxXy7+s6NZsWiuFhZeH5YVUYxsbJmQxl7Hh5pdYbpLuIde7CzLtOsN9dSsmis9w9EpV
         KthkB7JHLOVEn1YBcNR103oauZiVBoN8OGYMzYn+nUcnXwNKgbFyl35kBmTEQJO9m9bT
         sEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIdXFvTt9m6zGyQY5zGwdafhH77aBoCzHMqWsjrXItgkHYuJANIuoU5q2qwbV1mo05rIAtuM4WPK0nOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3iGWlqn2PvFbUfBb4qzLjzK6mV1VAD0uDzHSM9ltKgeffDu9
	4cuW2aO1bR3AEiCOJegn9qSZqK9l2gu7bG9QeaC6+suxMzgYW62o2rfpGdAvGvKkX3K2S/u6dRV
	LrCR+ZNS9iMWJDBe8t4fhRIjtxCPsbH3iHS+OX7JGicoNuW4ACmR/Iwlm7zr27S6pig==
X-Gm-Gg: ASbGncsz45bnfqXs2r5qt9POrnJemTShi5vGsNys/ArTbTioKyRPKN4mtoREJhehXwB
	+f1eiT+q1HDy1E7dqGwaTa10FoO7YB5SlXf9nh+voNNj5vi0KXEB4c/jAPkUUkLxxDznGSnwNts
	jUu2b0mfCJTRXvPFNvluf7Vr+eyQrY67Jo4aPELC0cWT3lVFo5Fa0ZGoeeQftylVNHNvzkk7M8R
	uIM1epxWpY2u4PFBoDyReJSQ45W/3RIUo1/OT4zbYnoTlVNqzQgW2DAGIY3XvGL89F8OJRvvUze
	bdt2h3DsLL6UZGZdM727dFJLMFzHCoRgmWT9hFEAyuXiVZCxCZETq2vb5+uab7dkx7QY4PQs1BR
	YPS1EPZ1td+RF
X-Received: by 2002:a05:622a:d:b0:4e8:b669:990 with SMTP id d75a77b69052e-4e8b6690c9emr204361711cf.22.1761215158916;
        Thu, 23 Oct 2025 03:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbFZ/aAh022rvOoagwONZHMEh0MEWdYvgy0BQ8CSY0tqtrarJPhK0oSiMEE6Ys8biKzppMkQ==
X-Received: by 2002:a05:622a:d:b0:4e8:b669:990 with SMTP id d75a77b69052e-4e8b6690c9emr204361541cf.22.1761215158490;
        Thu, 23 Oct 2025 03:25:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 03/20] ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
Date: Thu, 23 Oct 2025 11:24:27 +0100
Message-ID: <20251023102444.88158-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: _KPAL73ykxZtummJOs8oPkgwHtHSmOAE
X-Proofpoint-ORIG-GUID: _KPAL73ykxZtummJOs8oPkgwHtHSmOAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX5INkTpqoeVHZ
 qnLcB91N8j0O4o0hxIE5P+5ADKTsym1NOvGlM0IOHZyDqknTJY77gX88ltzlUaRACagm5FK6SVy
 chewh0o4yvOM4c4j/iblnFQXWeISFwr3Enr86hi1zb8ohLA/enbNiy7EblTvdJCVXdeM1bM3aiz
 u8saiP0fhU3rbUWAdmNgwJjb5Pqjl1i5P2DKMcf2yV61MX10CTxdqrn18YAP8+1W30I3LzGp87C
 sWXxLYIA98ew66UluRwATVCCmw1it4bG7mppdg63SsLCep+jAzmwocTUXhWf6VC/FbynB2mJv5Y
 iscy7X/u1oHyQSB0irkJnMlxVoSy35ZaAmkX+h43gDofmH+Ntg9lbfjRpX8FyLy/URavLdrCf5q
 t0c7gA/+aJOfT5uReuL9nyCMHoiMRA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa02b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Ubk33e6zxpvlPXQfVdEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b616ce316d2f..e8129510a734 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -403,13 +403,13 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	}
 
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
-		SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+		SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n",
 								ret);
 	}
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
-		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+		SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n",
 								ret);
-- 
2.51.0

