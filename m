Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3342820A0
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349566; cv=none; b=Wv231FFZyw7BA7E5sTvxi7shqzewkJfdAkJCj0J8k61/8JbK6fNB3ei7FSU36gSoVrGGKUZcOlEDzEjmNHXzjyeYVNpwC/eeBSWY/adJD0pvFCCfVhv5ihs1qqCeB/1s5tfDaiEjw0Spu5jfJ5FMvvIwFn5zjkhUVbdGdmSgcDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349566; c=relaxed/simple;
	bh=eU0rE+w8vLoH6e33KwYCTSmr+/UOuCFYdFezzoORBnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aGP4KvdQZsqzlupWoIcbvM+fD6XXo2L4hxSbeviyToXlAg+v6DhhnKcd36Z6rmwxf7daGsjo+1lhAtz82k9AYVVihv2oeh9hVPEFA+yrmG4HlitFJYodZxvCCbfzF50UoiYcc7T6da0fgFO30iRSlnkJnVimQCvXt6HXMLUitDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjHw9q66; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7lBg+LO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjHw9q66";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7lBg+LO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DlPD2351644
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DEoF490jUeX
	CQq+pu07fhdbph37+1R3iDlBmh9qDxUY=; b=PjHw9q663QpTkMRc1HKt+JKCYyM
	4Q6L5WwdfxUBXsZ52R/LSuSRxOxIpHrk3GI9LB9pkTaAHyxN/+gxxqC6uAyt/WFx
	ipcDRwwJZNN29y6nT4iRaaxIqkQnJJi+/qWEPeDCbCSz2ONSXW/3PI2hZrT3Q/L5
	JNRBDbAeYcu7b9TFjyJWUtG0IfqsVMNXSEpBTdNNT3+sWueEfFKkGdKHgYHIg0cO
	tz3aA5OcP1BZDb3w9O3BDar6l+S2JEmctpSOT9Ph32iwb/knxW3caMlJnOJ7AG/j
	DPHORacn6b7c/dGLn4w6kW8ilBQDnSocEe1ZLy0X7w8aCjMH1ouDudwkG7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvn4hfx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:52:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297df52c960so129203615ad.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 22:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765349563; x=1765954363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEoF490jUeXCQq+pu07fhdbph37+1R3iDlBmh9qDxUY=;
        b=B7lBg+LOqD1LMcVwCuHir4J4pHLMAJYUcb7BsYzA7xadMUEVii97cqRmJA21z7VTBa
         px2au2BSTrlLSexwJvHKT9x2C6MCni1ivzeaaFdQTx9R9HKbVoJSKsAvGZ9Pw4f9Uukv
         cWSM+vxBvQ9dBh/IBeq6mpqoehBpJUzcBIrWuENkkW9N/AxGzxgNtBOQSBR0s0oxr5k5
         tPIcqwp8+2z49iX2P00s/yJ1sLllnqtLgxDYjj19ty4Dnm+fz0alQ5k20EbP2F8d1S62
         1ti8ngb41Bpw81mmTmYnqi7UF24vGvKfrBYCOzYnbUgmaEjo4O6zX0C7TDejilErPlFr
         WSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349563; x=1765954363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEoF490jUeXCQq+pu07fhdbph37+1R3iDlBmh9qDxUY=;
        b=FvrleuwdRZ1k+veWYXua0g3h8bqzPl+59fy/heHrj7C0nRNmuHpJc+CZFrD+NR8Lwl
         T29O40LvaagLOsaXh387r6ejxVhgASrAde8C3TaWVp9ixx7IKA7hEz3g72nT+Mzq5Tn7
         /6HKaQy8w521QzNBvyPhgtP2ncVB3DMKzuoo5uJTxk5Zpe9qLOc2juf777Vh9q9Z5h4u
         eBwHu+Icb71W4Ozc4tZGZwfiVmMo7M8n4JRDLMOU31yt8ctev3TyclJ9WbR68NXrmLF6
         lNZKwQSnNIYEF/8OAMonyRP7M6yn2bq407VSLiFna+UVrKPQmzrMYGDZP5jhOZyNZWCi
         9nnQ==
X-Gm-Message-State: AOJu0YxeWxB7F+l+d3wUP+Yxktznt1ES9UzcsDuQQRP1P1aMVyLzzmqv
	PjbYRgrozDcMlr0CJfdAKmCp9l7J35MFZb0YSnkWwydtPYZyGgYL+ACFr7PNTWs088wa9kb0X4x
	bWRTdHS3EADiSvcwzaxiB1/qLHr9ef/I+Ywnxcihbh3QR44qf0hNQVJBq7x6UcndNnA==
X-Gm-Gg: AY/fxX7vnjCEqikr/3IAbQAe/3R9NtwkiGmttLri2CdDMFi/fgGdf1L+ivDfelm81UG
	tfuliYQla3MaK9+GbLcMgrxqRukG7ubXs4NxY4i4ZVUU185K5js621CTm+hgqxGV/JQTvDSn941
	iUP34ajxLCtQPb5kMK88Wez/gBDEF2+mBz7WA7PNDHRUQ9ginaQEwfxx2LNcXC/w9buQsChW05e
	5oarBSDRRxtA1Ttei5EIYhtKT5SXODWz6CBK4LWEry5Ows7nu38iqTqTFnw7dosW3FPMqrOu+9F
	gTxySNOLmTTADXOmoqSEGJnNfhnqLvQeml8uhMhzTlUCAzBh+XfB60gQZeZWYjSSNs1tXCdT33W
	0NF4aDbyOkTEUgZHWHKa3JxFmdHDTUi6ZPe25H2Y=
X-Received: by 2002:a17:903:290:b0:29e:9817:1cc6 with SMTP id d9443c01a7336-29ec22ca92cmr15576445ad.3.1765349562763;
        Tue, 09 Dec 2025 22:52:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2flnIXL94He+2EXGROYJMEPH1vwcVF3g7/KAv3F7rrJZbe1dwVfQC7DMstVyaDzNXa3HpbQ==
X-Received: by 2002:a17:903:290:b0:29e:9817:1cc6 with SMTP id d9443c01a7336-29ec22ca92cmr15576185ad.3.1765349562337;
        Tue, 09 Dec 2025 22:52:42 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm171728205ad.81.2025.12.09.22.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 22:52:41 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/2] ASoC: qcom: q6dsp-lpass-ports: Update constraints to support 32-bit PCM format
Date: Wed, 10 Dec 2025 12:21:56 +0530
Message-Id: <20251210065157.2775514-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1OCBTYWx0ZWRfXxBylAZ2lNmqe
 ILyZWHr/0QjV9hY3zWaHU4u9gRCV87mJaOA/oTkHIcix1Qe80JdOSrDmv3As7WobiLXLzsjItgo
 /XNklPkvndGOiXu5rFCRR4LlkDk88NtskMluU1nUW/q2EkUY8d5fCDDwNZ2t5A02wB0suY//SN8
 Ss2WFtR78ZACpQBAXMzrhz6bC8rl9zVQ9TCzeLZWy7+pbLmxIEjNm1xcrvUe02lS5//FEWusVyQ
 BkqAaq0F7vbDZro8xs4V0H4Q/gOsPgXnvc6XQqDvtnrgm3rXY9h8IMrlSogrgZDBGj10NOVAaF+
 hfUVuC8TDXtpIqk7Oh6ZnTgRnYKkpVhykSAljnlIhz9bZJ3PvZwQfeDLlnMQI+zxTzkbf2Z+OTP
 u7EaHxhjQpos9chTs7DviyRZ5FJQ+Q==
X-Proofpoint-GUID: SqwacaNoyVJLWRQi1JxbvJ2gMqXR4CHY
X-Authority-Analysis: v=2.4 cv=EarFgfmC c=1 sm=1 tr=0 ts=693918bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cIWfwQdKQqLfDOyn9HwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: SqwacaNoyVJLWRQi1JxbvJ2gMqXR4CHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100058

Expand the existing constraints by introducing support for
the 32-bit PCM format (SNDRV_PCM_FMTBIT_S32_LE) alongside
the existing 16-bit and 24-bit formats. This enhancement
enables handling of high-resolution audio streams and improves
audio quality for supported hardware.

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

