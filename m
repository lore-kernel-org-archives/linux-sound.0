Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2572314B81
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965941; cv=none; b=lvQmohOJWGcC0PrNcegNEhc8ZxcomsvguYDFWNIgbwTwrdMOP1I0qmXo1Bc5Uwfk+/fY+a28K485lGoLprMU4hXshfxoN+SUaU3uoSef55eFPHRfSDcvz7GEzhzTJkJHzelwClZ4Nm0nONdkwjF9NhxaB4tPlFVou2j3mzaur+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965941; c=relaxed/simple;
	bh=/HFo0chNl4GSV9KBtCBODfpuGIDSCIV2oMLhJt9NfPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAhsbl8/DHfoJiJWk8/W2XKKggxiw0foHVQFlSCs1pfzc/ONdP7CS5qGJZiEN6JhPqp7aGFjB/hYHPAXOvYSr6tnA7NXnf2urQxOwbHa8/8oee7oABiZm0OSSJdeJTVOWD3mDH8GyhUyeTlsJgiZiEGUZ7c2hzJHSML46RMz0dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oajbwBi6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oajbwBi6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBu9AS020299
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XDzjsbNRreQ
	M8IINxKudUQBopPbwW7nJ5HkVJNfp380=; b=oajbwBi6Wp2HJbEL7zZ1MPCm4JR
	b0FadfaqV127SkiwL+6STXy9aSEqCeqosZ9JNMPMhMSHdkbyagvtioUdXQ1EY4SG
	1c4IXPuuaC4bevRAgpvpnB3Plh8VKRvhvZd4Ze+bsS9AVZo32JorgfoTwhafPWiQ
	B2oIrUpwe2FYuV93xzpifdES8HZ0ijqHk9G8GAuaVaSKm+gdW0e6yVnotdA9v4DE
	vIFZ3+zCLiXNI6PsOVc3tnTu8bgAzrUijus6Aks/kkKpWc0q3Dsc3nrF27uLDapx
	M3ePZv280JRTHdNdScmpbA4x6uv4Os3A7Po3G2AyQZMIjEzaTE77aIv6h2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469crpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:12:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79e48b76f68so227484166d6.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 06:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965937; x=1761570737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDzjsbNRreQM8IINxKudUQBopPbwW7nJ5HkVJNfp380=;
        b=Sq3GBmX43XTTX54huf2lKxO9ZjiwiQIYSgBqBS1hbG9Vw2Jrr9pc/qZv36e7ggIUkE
         qTHX+3bktCji8Eggnn7uZ5R1nQwetSLCkcA0jLvHeqTNPcvU8Wr7Mq+ID1M6h9ZXTgcf
         Q1oUS8P8Cq7lUgy/3oaU3ZtThHNcTsTUEVKl6opQRuGk1bHer47mzqOdGbKyhK4qZEMN
         hf8odB2wNJqLtRWA6Lq5cNlEqIyMzZjILnnsY4Nhok5Z1hSvYAMBy3B6C4UFQwPU8RU8
         R0BmTciEcDHQxSb78Mg6qON9zdZIK4iu4t581HiXXipAFfPiJZXH08uJIBW4Ddt088Vl
         /AwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq6r8uy6fx7Q5ovxLfU9nX3X9wjcXnMnLz1BcKJBE6c0EHw1gQvwmfkXZeBqvQtwiq6L7QZIdJG7jjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbVNAJFjZsMkvKz/L05x3aI+ZK3S4AlQoRGAboZ/Kb4pVkGegd
	XiiHj804t1vQ0LDPk+fHlS1md9dpo7WWe44fUi8EkQUV24zPFwobUfRb+pL8zao9dBHgtSZ40fC
	AMUvrYvVzayTG5+4krwkUBANsvbAQv2Svho8FbPA0QjZtHVvHBHe9NrIQEUuXUexbLQ==
X-Gm-Gg: ASbGncvBO7BvmsK0ECm2w/iP0yyIOMMTeMwPw/kfI4AwOzXcK7aLFhFWlqWdzaZBPYK
	vr6cmkb9AFDTJeUsmPK/jeZPWd+hY62kQHsm6cpnn33KJ9KPzoL6rhW9zLum5bIR2kuQPGQe8Vs
	K4UWUb2etl0tjjvJ+W3HEbfaFJidsx5eqpRx97h3upGmBf41+/kq8KfoB++kp4J5pu1rGUZ+0a2
	ail6ba+PW4uBTi8jNbNonsvTVSOSNDSSYm0B8yHsjzZ1Bv/p22rnBCV35POjOy7zLs+amjYb9bh
	1rEfvHdBs1L5BVreXCmeCr3BeTaufcCTpTVXfEHgFip43H8DC7fEwJYh34Z/cC29QPg3lfA8c6+
	lFMKVgMJqhDEU
X-Received: by 2002:a05:622a:1182:b0:4e8:9a7d:90fb with SMTP id d75a77b69052e-4e89d335b1amr166530111cf.50.1760965936468;
        Mon, 20 Oct 2025 06:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVPdUATgyqwUuw9C3MrPllzh7sJzA95U4vgS0PSVpRWvNjeqg+RHAgWUSvgscGhdStT/pqgA==
X-Received: by 2002:a05:622a:1182:b0:4e8:9a7d:90fb with SMTP id d75a77b69052e-4e89d335b1amr166529721cf.50.1760965935977;
        Mon, 20 Oct 2025 06:12:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm118165505e9.2.2025.10.20.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 06:12:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: qcom: sdw: remove redundant code
Date: Mon, 20 Oct 2025 14:12:08 +0100
Message-ID: <20251020131208.22734-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020131208.22734-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251020131208.22734-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mOIB-Eqklx6wEyZY2NyX7rdAuBXTNFFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX6yh8Oa7dkKkk
 Kuxpcf7GsVEZf0TpeVQtliDk6YQDavwIh6097RRNowlOmAzDf9xs4jgPu5YkcgLT3A20WFFPtkN
 fK51CyFJI9ZPj9lXRR457kY6ma4hn0jGUSxiweSTyLHzh+cC9WnEM0rKahChtr+mWTCWedX703M
 IrbMMFnstiDiUVN5FACGUT6Y0IA3YfoN7jUT7q8JFrrvcAaZ6s4HUCzWniJOiCnT0hp1sOTy66h
 hLtjqmtmDSmouNTILYYV57Y+FeeVEJzrBlUYY2bZMKtgHuMrEdyLuAuXAkF04h6O5RVC933isxn
 o1NT801MEBDG3dbkxPP+YWkb9TNs1TaGFTo2kI4RyYEay3rkDQtrhqaAYjTK+ftXHNvf/xcr9ll
 wg6BCwVxl1+HVfm4AhopuiMDNL+G9A==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f63532 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eS8ScSGqROhw0OgIVi4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: mOIB-Eqklx6wEyZY2NyX7rdAuBXTNFFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

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
index d866fad04131..df5cc1dcb96f 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -112,19 +112,21 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
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
 
@@ -171,26 +173,24 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
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

