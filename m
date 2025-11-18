Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D134330328
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460143; cv=none; b=bamiK7C/u83OiaNqCNtFTVnRCLsW3d6LfMAFs/nAlM6rxntd6X9pdAiiUOMUQROMnyyVrehZlimTtGFgbksjhw8N+AoTFXrJuyCBz9k0Cj7BZQHTkI4w7u6mc4TqHYvPQeir2mrsqQeARxj1FF0dKugfRUvw0Cd7fnttqPtWgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460143; c=relaxed/simple;
	bh=CbxtIvTekqrp5erXiJTkMlBeVvmJmh/eKhW86wM11l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=incr6opghoiJ5hBoy+Nf+13znmDbNnoqwczOot/ufbDbTs+JZMkJ5dfRcYRpk+SjlVo42bPWCywNYmXtx2vGQAXJUD5F6qeWTvjRMBi/TuIzs7YTGYlKf9cGGLElDyPAl56nu1lKYYg2SN0MIlOagzc6iYuZNts5JDAF9w3tYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp/61pGl reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp/61pGl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rJN02664712
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qMuNEob1rac
	JwJMjnvjWTnyit3VquPLYcumLP/b/DM4=; b=Zp/61pGl48suyNjIVq2A7nJbQBg
	t2QvRnVQxwmoG/CGPh68NfdkhNJKH/6MvCVCJfQWkjszeqkgmxnTIngZhaAMz2ei
	TKWoLWQhS9CYuUF56lNuW2kaLraO6OzrPFg8y4VSuZh/QsvEoX6f22RK+kUqfnMp
	QJnM9xWYhEoJe2v6U91ZqTOz5EjbJhN3qy/n3PzqwBK9S7UojO+uRdoObwfz8929
	E/tLp3G/rR6+ObZg/KziJ8lGTvYkfWcfPMhXthpLPEQ2/I9Vk5cS4NoJKRpJup8e
	K7Mdf0+tRnbPpwNMRIX6DdoZIwfoBpOnyM4yrWTG85SZg1dBQVm2xSdHPPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk811r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3418ad76023so12203304a91.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 02:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460139; x=1764064939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMuNEob1racJwJMjnvjWTnyit3VquPLYcumLP/b/DM4=;
        b=eUXIQbz7qeuXsIGSc0BtxzjqsozrboOuDoL99/O0yHhFIs2Dh34PvPPqD5y8+/egcc
         QqjqPNxls88vJCVZsAvXSOCCRfRVCKPrYS/vToazlbu5lEFtPTH9tG/U6jH0KltRcn4F
         W57BcfGBLPdSHX27XOdHQXIyFls6hFjhxMQok+XsRTsbqCXYj95phdRWpsh7GNXhnYIl
         fp9e7stB4i3RSrlrAZEK7LT0SVGLjfME8As1isWXq5hrGY2IzfxkCe46hZ+bgeZ7Q+bE
         /aK1L4q8BhFnbq8vz9NBdZ0qiFFHHo6llo1VA/398U57xkSR0Ah8yJt2qeHbtbn4F6hY
         IhRw==
X-Gm-Message-State: AOJu0YzN4pQXRMQVF4UsIv8rGt4p/Udc+cNFPtdgMhcmyLV3IYsNimce
	IAHkzdMzdaOvI0rSz74xlODIKDxL0ls/cV/bzC3Cbk8Q4YKObRFt/7a0v9WYh2NYtOFWR9B27Xi
	wYjf1hPi+BLmV+tlfQu5nWmGUKuFHKdbr/j0nNMewk3TbsUfPf8FRVYM6ngRL8dPO1g==
X-Gm-Gg: ASbGncvgxf9ZQexRJHaJSYhEZQ06wgCeaqZb38LQ4Zg+5q2lqfe4jJyuVTdbYoE2tMP
	RledjgNQ+hfPQxKcShHBgR8B4pYoxlhsTkB6XMMm84tBldmUhmyzKemphfcaepJhTUYv5gHeegI
	+0VDDS9QRWTgvMuMiH7IddN7K2bSeHyZJGHQA815Ajzwh2DdO++tRWd6CDKQGobR3sc47fW5O/j
	rWnMCLZeYFAG22e0xsss57SLneb31omMjyblmlXpvNLMGMudXU+jBQeTBTt6t+x8tkjwAaNmrGQ
	B1qS1tYifvALZceY8tCpIwmIfAS7M1q3BPvCZApct5ot7GVNL4NU/36WbKi4yxTx47SzSCLa5sL
	t2Lc=
X-Received: by 2002:a17:90a:8a84:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-343fa73b7e7mr15448645a91.17.1763460139083;
        Tue, 18 Nov 2025 02:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL9RUDf6h4VxjPfstozuaNX07Z0pm4BzkP/oEdHSr/z+UYskYnGmudGCyLJlm3pH2mwlX23A==
X-Received: by 2002:a17:90a:8a84:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-343fa73b7e7mr15448606a91.17.1763460138576;
        Tue, 18 Nov 2025 02:02:18 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm16120030b3a.33.2025.11.18.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:02:17 -0800 (PST)
From: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: q6dsp-lpass-ports: Add support for 32-bit PCM format
Date: Tue, 18 Nov 2025 15:32:03 +0530
Message-Id: <20251118100203.2751955-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wYRw7WFhA67DlSssXQ_qQJWEkRJTy1hC
X-Proofpoint-GUID: wYRw7WFhA67DlSssXQ_qQJWEkRJTy1hC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfX5z++CcJ6s9UN
 8LIsfan4oMFRoRVIMQmBcJddv4rrwaM+n6wZX1qUu9Hun7GKUfokpqvmuSa7htyULUau5ELK3Yl
 cmzIB+EPrM4eXYTpSRmMa4tFyzn0/1TSDrS+oyNrnx6qP45488UUekYlSRu/++qYCuWSKZ0S301
 tGz18366XEVm+Dqod5SpgKc20en6BHWCbMPticnf87Vy3/iOe0UyskEjJIVPAXK+SjTsgAy1lQv
 PChlT7X46aP0D4I7/nBUBaOSXFON5BpWYNsd/4Vpns7+lg+37Z9Kjr4pTbEL1xt96gcDj+7IPld
 gZ8OSwSm7mXS55gbR5dpu/41w0pBrTOkYMdu3YnJwEOR9FSzFhCIrt5fNlDLxN9Wz2ne7QORnHo
 SvejKiHMlPBqJvfEChWlX2WetC+uHg==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c442c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h57z9UKOc1SyWDzF5_MA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180079

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Introduce support for 32-bit PCM format (SNDRV_PCM_FMTBIT_S32_LE) in
addition to existing 16-bit and 24-bit formats. This allows handling
high-resolution audio streams and improves audio quality for supported
hardware.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 35 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 76421adb5afa..8542e620ee02 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -344,7 +344,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Primary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -357,7 +358,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Primary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -369,7 +371,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Secondary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -382,7 +386,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Secondary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -394,7 +399,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Tertiary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -407,7 +414,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Tertiary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -419,7 +427,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Quaternary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -432,7 +442,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Quaternary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -444,7 +455,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Quinary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -456,7 +469,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.capture = {
 			.stream_name = "Quinary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-- 
2.34.1

