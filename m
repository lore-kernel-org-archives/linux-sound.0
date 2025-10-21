Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA00032D42F
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043223; cv=none; b=fTmBHdsQGKtzDDHSmgdfM35tamUJfsIXoPFyoqVOyZilf2UUMY/6IYrr8xf9PJTbZS9kib07AVmSYjrgKoRs+VGNHC6GYc8NfcxEQ6ludTeqtqryOSicDFAu2OYD6G5NhM5kWBVmZ4X/DicvzejOdoX195ZjgbDYFr5Gn9SY45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043223; c=relaxed/simple;
	bh=itSE7mogahuOOrGJibQ0XgBOmlVMa/YfZdK5eiRuhXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGWx+btKDtK4YAcoKB0plnOxqIS9ib3DF0Fmn0UwREmfjxZNVG7a+wuuK2vHtUlSSmnAje8Bnl9rmhFvmi/Cp3XBMbFgFjd3ayA9ZDRDARH7yhpG5FvEQa7EWvXHC1LlpW+rFqBopOqdoQanGAyN8CHjvTJCoIumfxScYNGLn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jy8gG2RZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jy8gG2RZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8Bq3A032407
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fRrHFA9Y7bm
	fyzeB3ooislqNqHa7k97OHrK/nUajLjo=; b=Jy8gG2RZQyisr6K+8IJEaLNUB35
	/l5VfUzv1BHcseQ932XipmgYfDyB5El8k7MbsMkJTzYAHSLFlHuQkbDbQm+TD2cw
	9ZlE7Jsoj9l1S+UKLvJ0Yn5zdE0BeIuWqOT19hxXL09zaRzG2csqbjPk9Lv7udhQ
	r89PHQnNAVS9V1uxZtEm7y3TgVX39uY3HRlxQfn3eTC/qOSN3dkS8VDj4uECxi/w
	49bgR4D+wyYCmCGMIOKc1KAhZln/gkR6IMhyq9QG8XjI+X2e7By/B09AVFzMMZDq
	ocb6SIROlaAMhDpcztuT1QcAcyrauxtDsxtWuFIjboYYdvWlb4arqR0G0Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k88ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f3c733d98so2073753985a.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 03:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043209; x=1761648009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRrHFA9Y7bmfyzeB3ooislqNqHa7k97OHrK/nUajLjo=;
        b=rKJNM6tDuMAH0QROhSO/fFcE3sYpZp8A2+buXIAq05Qf8Q/PMuwtVZy+JpVE0eDdq9
         I8kNo5q4w22MsnF0poXa1A37YAYxp8geU6VMi2xooJ6Nmo8Hq0LZfyT2FPg9mEJoZU8Y
         LbnaDOo+wbV7xIgz6SAqXLRNmaWBi8cxgyxXTERHt7d5/LoxPV3RK+/6ruUGbaSpKRs5
         y0JxQFCzeVsEQPZJ61r7Zwa3axJUiOcyKOvLIMST9pI7oIFRc9BLi/vmSvZxXEmUwTSn
         UbOIUYMNUbRFKvlyezia4Y/HhxG7eLeAXxl9TqyhykG6vxnb+LxgQFpfbNKeISy/JjQl
         VWbA==
X-Forwarded-Encrypted: i=1; AJvYcCVMkZEr/7m17EKk0BwS0VoCcB6rHFSSWPIkDWeq3oVz4+mi9pBvEjlXgXMN+wZAMlIVpO/fEWXpCpd/KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwE/0BftFfLU8iD8Nc2RBnsiBrOTFzo+a3N09g0B2k5yKBUbb
	+33fkGSvE+zVOmqp1GTCgoFdYrKK8QngMPcLlfWHc8Wkh3FpsIMI5XXP/IgX7eG+AOzCps0FyNs
	2zXznxlkp+P4mFXvNjU1vHMxtJJplhrV37JpvnHSkvAZrEl3XndO3o8PUF4FFyrQ4Bg==
X-Gm-Gg: ASbGncsgSp700xuMsUfun5rNW6PMRbDJrsiv99ZhBUh+A/y9VUj4QdMH4vB71DsdhOZ
	j9t6qJZSQLIY/fTDqYvsw3D57tkVQz8xDbXN6r3JwfIXved8uy2uuZcnVpfvgqamsQpEnncctbt
	0S2vPaXosYoD85zEk0Da031WJrtsw+roq70gs0x9KS5py/b2QiUZ5GPHGCqZyLPdxp+M6XY3kTp
	AlL+OuZrixSA2UcnULCRQeYgWhSA6Cwx90kGtPWEL4uH5Gn1owysEPwh2l5OTKbU/bcMvSLMcKb
	OaVomwk/t/iLsFEcAdNhOU8hUV8qdS63Lk1K3Xx6wNDT9ZtG4uItykHcr2o3aIfg1CxT5TKNxlv
	4dmdZiNWuTRRT
X-Received: by 2002:a05:622a:243:b0:4e8:a090:abc1 with SMTP id d75a77b69052e-4e8a090af5dmr157425141cf.15.1761043209262;
        Tue, 21 Oct 2025 03:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyZJGtMwkJKZOfnRdHp08i6kzLiRsBAJ6kIaedoDcJarTmtk66rdnHVgLuqBxhTCIzRVxd5A==
X-Received: by 2002:a05:622a:243:b0:4e8:a090:abc1 with SMTP id d75a77b69052e-4e8a090af5dmr157425001cf.15.1761043208758;
        Tue, 21 Oct 2025 03:40:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] ASoC: qcom: sdw: remove redundant code
Date: Tue, 21 Oct 2025 11:40:00 +0100
Message-ID: <20251021104002.249745-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y7Jj8YM41rOpX4khNp9OENWHej_20GVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX1jjcG7AHX5hX
 IEdlRykgSadJeLqjCvJxQ/1lK9TYEbg/6O9rf9aQS8f8eALwISBTIuepqoV4sLVVQIlQIEQQIM1
 ucWvI4/eiNwZktHxevOP0NjFtwgFi2666wdmCwy5HNqLqXpWUNQcw4ZmbhVslfeOy5sM1vHhcWQ
 szGSkTE60ljk/o3QLd5aLsold3ni6l5/tMY+MrtxkMTeKFmuFAgIv2CimPR9figpri0+4pRWhh/
 tE6XuWYvABGEjqLsPN05wY2DXSjZO0PPmYs7P1RgPgR2weiUFGZHqSlaAaHZoi7RNWUDarZnF39
 ev6QLE4EHizU7k7KcXzCaCmo3E+8uuZWZnA74rvv949wPPWmbYRxSj/xDsOJkZfi0aXnHXyJPqP
 uvI0B42ojOUmTAuxDX207h5+P6y+rg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f76314 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eS8ScSGqROhw0OgIVi4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Y7Jj8YM41rOpX4khNp9OENWHej_20GVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

remove redundant code and pointers to handle sdw_stream_runtime by
making use of qcom_snd_sdw_get_stream(). This removes need of machine
specific shutdown and hw_params sdw callbacks and also need to store
sdw_stream_runtime pointers in machine drivers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 33 +++------------------------------
 sound/soc/qcom/sdw.c      | 24 ++++++++++++------------
 sound/soc/qcom/sdw.h      |  6 +-----
 sound/soc/qcom/sm8250.c   | 33 +++------------------------------
 sound/soc/qcom/x1e80100.c | 33 +++------------------------------
 5 files changed, 22 insertions(+), 107 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9ba536dff667..5bd8e8aa1853 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -18,7 +18,6 @@
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
-	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
@@ -68,17 +67,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
-static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
-
-	pdata->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
-}
-
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -108,25 +96,13 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-
-	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
-}
-
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	return qcom_snd_sdw_prepare(substream, sruntime,
-				    &data->stream_prepared[cpu_dai->id]);
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
@@ -134,16 +110,13 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	return qcom_snd_sdw_hw_free(substream, sruntime,
-				    &data->stream_prepared[cpu_dai->id]);
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
-	.shutdown = sc8280xp_snd_shutdown,
-	.hw_params = sc8280xp_snd_hw_params,
+	.shutdown = qcom_snd_sdw_shutdown,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 7b2cae92c812..c44659deea01 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -113,19 +113,21 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-	if (!sruntime)
-		return 0;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
+	sruntime = qcom_snd_sdw_get_stream(substream);
+	if (!sruntime)
+		return 0;
+
 	if (*stream_prepared)
 		return 0;
 
@@ -172,26 +174,24 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
-int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
-			   struct snd_pcm_hw_params *params,
-			   struct sdw_stream_runtime **psruntime)
+void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	*psruntime = qcom_snd_sdw_get_stream(substream);
-
-	return 0;
+	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
+	sdw_release_stream(sruntime);
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_params);
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
-int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
+int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
+	sruntime = qcom_snd_sdw_get_stream(substream);
 	if (sruntime && *stream_prepared) {
 		sdw_disable_stream(sruntime);
 		sdw_deprepare_stream(sruntime);
diff --git a/sound/soc/qcom/sdw.h b/sound/soc/qcom/sdw.h
index b8bc5beb0522..061a63f1ac52 100644
--- a/sound/soc/qcom/sdw.h
+++ b/sound/soc/qcom/sdw.h
@@ -7,14 +7,10 @@
 #include <linux/soundwire/sdw.h>
 
 int qcom_snd_sdw_startup(struct snd_pcm_substream *substream);
+void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream);
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *runtime,
 			 bool *stream_prepared);
 struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *stream);
-int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
-			   struct snd_pcm_hw_params *params,
-			   struct sdw_stream_runtime **psruntime);
 int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared);
 #endif
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index ce5b0059207f..203a8705a42f 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -21,7 +21,6 @@
 struct sm8250_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
-	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
@@ -112,36 +111,13 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_startup(substream);
 }
 
-static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
-
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
-}
-
-static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-
-	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
-}
-
 static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	return qcom_snd_sdw_prepare(substream, sruntime,
-				    &data->stream_prepared[cpu_dai->id]);
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
@@ -149,16 +125,13 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	return qcom_snd_sdw_hw_free(substream, sruntime,
-				    &data->stream_prepared[cpu_dai->id]);
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
-	.shutdown = sm8250_snd_shutdown,
-	.hw_params = sm8250_snd_hw_params,
+	.shutdown = qcom_snd_sdw_shutdown,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
 };
diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 2e3599516aa2..a3f4785c4bbe 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -18,7 +18,6 @@
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
-	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
@@ -50,17 +49,6 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
-static void x1e80100_snd_shutdown(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
-
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
-}
-
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -85,16 +73,6 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-
-	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
-}
-
 static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 {
 	switch (num) {
@@ -128,7 +106,6 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 	unsigned int channels = substream->runtime->channels;
 	unsigned int rx_slot[4];
 	int ret;
@@ -149,8 +126,7 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	return qcom_snd_sdw_prepare(substream, sruntime,
-				    &data->stream_prepared[cpu_dai->id]);
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
@@ -158,16 +134,13 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	return qcom_snd_sdw_hw_free(substream, sruntime,
-				    &data->stream_prepared[cpu_dai->id]);
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops x1e80100_be_ops = {
 	.startup = qcom_snd_sdw_startup,
-	.shutdown = x1e80100_snd_shutdown,
-	.hw_params = x1e80100_snd_hw_params,
+	.shutdown = qcom_snd_sdw_shutdown,
 	.hw_free = x1e80100_snd_hw_free,
 	.prepare = x1e80100_snd_prepare,
 };
-- 
2.51.0

