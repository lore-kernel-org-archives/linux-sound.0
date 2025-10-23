Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87B0303A1D
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215159; cv=none; b=o4qCfgBJe1C6/1dAVonIfydSrICn40Cx4elfIFWua2AyIy8uRhfiGVvyjrnj4aVRj4+eUJFtWYzrAUno4Mefz757e76e+Nh59wLEBHQoIg75RBPiryfir6AXZwv21oGZ9H4CaRFB45IOqvtG0xXOsNwzUUgEZlzKw+d/iltJdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215159; c=relaxed/simple;
	bh=fKU+7psoGKhGov9+abzdK9VeiEyjPMI2pGqzhT736sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx7ILr1YZV+3y9zRV9wAvB2At5l/UrdhpB2RDdUfnUkTcjZ0uqMWSwDsz3j7F0NewRbKWIH7vghwchpPApnU0w1IQX3gyXKzNxwV7CwqlCkFco9wlkC2tfJXFRAq00URWV+ofbyBKo15S622x2kuQRggi9OhNnrbnaS/1hwpxvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4Ujkerf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4Ujkerf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6ZH0u028831
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HoHmVwgfwgY
	ctL/x1k53Df3AjUPsgAlOxk1+AKZybp0=; b=b4Ujkerf3On4nYtoUk7dWUASpse
	yPsTwgbNGnrJnQ02X9yZicsJahmXpEmnZ92+btcP+7Q1xU0MnviixhFsttF1M9wU
	TS8O2UMWtZLOPdD0qXAfTOL8URC+oijTNvwUU132PDIXHH7VRxuauYNJF2/ezJ2N
	FBoSta3SRwhqaM8PuDT2nM3ND1QNnys/Q9J416yu5TITF7bONhsl6P1RFjAFtkqr
	CMwLOMWf5kLdhnG2IByI77GmffT3aY4v1Z9rdfRfp5bjpKWDLc0AR7M1SIvz0p5n
	Q1kFRoA1B6V3We8OMuNAP4PL6SUtxV2BOVm9rSd5tomTmMFv34usgQbciGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdp0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:25:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b8db4a35so19126461cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215156; x=1761819956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoHmVwgfwgYctL/x1k53Df3AjUPsgAlOxk1+AKZybp0=;
        b=PFW6osMLWu5k8tz1VHGrpV5pBoNUrnguPArYu+CwX2bcZe6tqkFavXY2vgBQIJtAGf
         0E8talKP6g+2wZhhagiCNGXFZQzKButs1kbC9HQJid7txiVYYrtgEbWKJcKLqvu7QPNR
         l5p0Tq3EJHcDNv5FkX5KyWMXT5B7anJ9QCuaSBVz8+BK9mJ6hET6fLay4HNh2o4u9QcX
         XUH8nVKVbgdP5PaN0KnfulcoU3wCOVf07iS0D7xXOkaNtX0FjDW6Rfvl0uAN3u87UFzV
         CRVI+d+DAQKMOpj/ipPi6wAeWh/RxErwdNrqe+0llnBPMaJ8UniqpWqKDmFKa/564IeY
         QK9g==
X-Forwarded-Encrypted: i=1; AJvYcCXuTnRtKx++ujidm3KBO4H7MGcXoKMq0UdGj6QzJmjOw7w2cFd/L86b99/HnmSnW+CoHMkF/IohC0JGIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0JSR8ByloHk932vc7FNxTE3G9dMs8fxhB2F5v9l8cutTnigen
	jxftzgBSIwmtvGfgf592L+zlZW9eNVQqWJCAPPIVuQxfGf7+VU9UFSQZiKcfD5HibfgGBf8KTKt
	CzzOvFsWY/Bk48GGjAq6D8QPwd0GwGOb7LphfD223Y+JaTZgDkarebzDQACqh9T0cog==
X-Gm-Gg: ASbGncvBlWc2EsDyeLYhmFyw2CbD11HO2aUuqwj1hpirrW+4pyRj8jn7o0uEEQgat7h
	TyzXJn4QcK4rODZJn4euW22uDJXkoR1Se+H91fhaiAlPgE3sUTC8ty/sNOt6NdHhUI4wDd+8Uxj
	/1tmua78Dp0EIYVFX3Yuf6pAQ8BX60ZibXeruFB1U4U/3y6FYz5hW1AlvRC9LKUyZhiWUIOJDzb
	2nRZzssx9NQupbvZe77HMWA8aQBlXGjga2BazzedgtWHXuZyHT4btHhAwsIotOzVsHw0o8lPXU5
	WJqtNDEPGWOOd+zbmjghFbo+s4YFqtQZDLAHzlGtGDuZQmEEFti57MZULdJh8BdOeG31FDl7TeT
	W3IMhc1gI+H+O
X-Received: by 2002:a05:622a:13d3:b0:4e8:a2aa:77c9 with SMTP id d75a77b69052e-4eb81020e0bmr20467391cf.1.1761215155875;
        Thu, 23 Oct 2025 03:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4pmDb7EjDueb6982IesIBCCpfc2JJhwDrIZYFugXpp3Mkd6MdhDM2CIiRAZN+L5enEZqEDw==
X-Received: by 2002:a05:622a:13d3:b0:4e8:a2aa:77c9 with SMTP id d75a77b69052e-4eb81020e0bmr20467131cf.1.1761215155423;
        Thu, 23 Oct 2025 03:25:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 01/20] ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
Date: Thu, 23 Oct 2025 11:24:25 +0100
Message-ID: <20251023102444.88158-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 3KRui0lw8UczesxlLwaVb2HDg_Q9Y8k7
X-Proofpoint-GUID: 3KRui0lw8UczesxlLwaVb2HDg_Q9Y8k7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXyBlSa8iBT+Bv
 pD1InNNZu2kvrWutByz+xCZjCsBL9lcvEcV3g90crsItUENMVwRi7rP6worFH6IwXybqlkMIJlq
 9whFC2pYCtVjgczK+2jg3Kp4ev/hsh5+8B+VRUGq78Y9zP9DBxWUqkg/SgIwqdX2hjEqvLV8D+Y
 YYHVdkPW1rU7ToZYXjAJLA06eLUiLBjhruy8w0vGv9II6C7PfITXreLs5mJXpCvtzvk414nMoZc
 OFlVLLLr6qUU9P+g8dmQKN6RhqelzbNal3F5HIaChT59EdWCTAlOoBsA35ZbblZx3fZ+3bHmDEG
 wBUG7T3xrtmGv7lzm0s7VrA03EYvDxB6qmdXTiBNgN9o/yBvj7DFktpvE366FjVcWj9lZrkvpU3
 aY9lZFBksyXI0Il6okf0ylejqvYVEA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa02b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-7q2M0jigxX2LbQM1jMA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Driver does not expect the appl_ptr to move backward and requires
explict sync. Make sure that the userspace does not do appl_ptr rewinds
by specifying the correct flags in pcm_info.

Without this patch, the result could be a forever loop as current logic assumes
that appl_ptr can only move forward.

Fixes: 3d4a4411aa8b ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 4ecaff45c518..786ab3222515 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -86,6 +86,7 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
@@ -105,6 +106,7 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
-- 
2.51.0

