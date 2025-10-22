Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235A33F8DC
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143648; cv=none; b=mIUEQ/tjsz1GewkdgJQUkWVL7mCkV+3dXh4QP0AeBNU9dN9vUNkCUjqEung5dHp51YOj8D9HeUsTMq4O4lrM6JviUvi3nlOmyUhuSnUO0L3r2LUx+MM3FiU0e1imfsK06M4ljl9lHT7TB8djgsu/N3Yq8gOhBUbCNEeX+aMyaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143648; c=relaxed/simple;
	bh=aOzzSQvUu2O5D1NhZxoqCv1Pu8jkho1TPDsFdKGqrVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQhUIqhHgZP1ulMAJXrIadQ4tyBPyyMS65aHXmKTArj+HQMWcB27eyvmVPOJdVJ6HXYEQyMfi41rkCU0DyzxFs5U1BN76lKJgGQ1Y+ghOnsooLRVs8a+N0a53ETOxHVsN7I8oQH+21z7tZkx+gWy3F9kHSq5HaG7qcoROwIRGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULxR1EnE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULxR1EnE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAJ5N7004435
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tt1tRxJzz9y
	kCOmzfidVBNfag/M4e8YRcu9Y0ig1KZ8=; b=ULxR1EnEz3XALQpDgOHrTa21vf8
	1Us42ElgjTZXgmj8KBMQOwmbl7ke2ZiPYH+aAFssTw6Fd07LjfvDG78BFPQBs5U0
	k2BADxc6Q8KmdBIwqhd/SqKd2Nttw7Bx+4YwZajB05hLNEvL337ercPkBq8h6PrG
	i1ba/c9MEmEnulBzg+ivuGpmt04niBjtd66sNkqMtVdoqTnyapm6PMcEkcitICmv
	tKS+EE5qExGiw1Dyx/QUHPGENWvM4aFeYVVpI4N2zyrRANmfmmDBB7tKNQmQVuuk
	nYvyzPBgxITWUXj4bBzt1Mt+l1fhM4w4eai8LEGllQID81/k4hiIVHZJmiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfmwur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-81d800259e3so103676896d6.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143643; x=1761748443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt1tRxJzz9ykCOmzfidVBNfag/M4e8YRcu9Y0ig1KZ8=;
        b=kQTK3WjmBnfbMPGOoFCoABAViB/pczbwW8UJhtgMDasCCznrxrdsJgW5Or306ILLmP
         nXL0wau1h3Nuu7hrsU90DGFBRJrl6axSPhOi1SmrVJpecO6m97PJtwWgqj8emE6abovv
         m5gNmKAyB5T3obQS4HC/ZALRiGFsMYW8jmGYJIqFcIZpeX/VAwV9i5rkEW0gsc7vIAmX
         49hfLyt402RYTY+KCXymRRHX9UlP3Ah8W7EJIPHcroM1TnkmJ1t0/nyfopmqdrM8PmYX
         V6JT9Ws31fmsmc6Lx99DyvXMbgWFCbeYy7wsPmEYhgntE3LQwQf6bnI5Ac6x7x+ZCxER
         3X/g==
X-Forwarded-Encrypted: i=1; AJvYcCVLV02ydPnFORc+66GVlkJCpXHXaKnQmARA3q3lfPJ2L7Eak9s/cmzYrYj2yrriRTxUHgnRq3NLigthcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn9lXnd2dt++OD21UKjzNacScxYnq7SLPjsAiQDtADYIX5Aw8J
	HBs5LaYBSh5lng9X4A5Invzq60Pgnw2iu9MvnEov/fqsY0kYf/sE3wSRp/raKi7cAJc6mH5VEDv
	tC7onD8VqE3C6l3ZMefqzZJV8QjYRnC7jb9GqACLQSeaOkRepPokLhWfrF/KRncatOg==
X-Gm-Gg: ASbGnctPRnJWlDu+9DXLYBtcw3SeYHSvdX9TxpRf1cgZoG+apWrME8ml244ppTMPHLb
	fNw/9Ay/BD8D5iB4DWpEIds8kjAp7p1gH7o/a04Wq0Dh41eK3VHmbFTblB2fsO56lL7ei7DlKgH
	PZKdU4qX2IV6iY02vZIzvK6IqcYiO3sA+3Oj1eFMw7UmMuWjYBXU/lkGuzOtUxWO2ZDL2ZfqXmK
	oD2v9Q3bNAU3Nq6lExcSCWwPPyr2fBjRvZKA1cCRakK3Wtn2YVACYJCkjk8KZimBMXXdcPqDYNP
	96KuauDVOm23w4Y6nB6JrzsyIg1Lpz3pI2g9U1zNv+XAR0YC4UbxrXCLrssbOtOx+N2fPxenHqo
	Y8apzZyPQttlL
X-Received: by 2002:a05:622a:134a:b0:4e6:ef26:3152 with SMTP id d75a77b69052e-4e89d415399mr269121061cf.80.1761143643153;
        Wed, 22 Oct 2025 07:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Ohog4sO13eIB5GYi1WdYITJtgbxhmIZljiPYyETzVJdhdvKK1Z1JdxJ27Gt2pJLJCUyMlQ==
X-Received: by 2002:a05:622a:134a:b0:4e6:ef26:3152 with SMTP id d75a77b69052e-4e89d415399mr269120481cf.80.1761143642465;
        Wed, 22 Oct 2025 07:34:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:34:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: [PATCH v3 2/4] ASoC: qcom: sdw: remove redundant code
Date: Wed, 22 Oct 2025 15:33:47 +0100
Message-ID: <20251022143349.1081513-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Qap6ozAC0iJkMO2ayxXWZQ5YWLUesEYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX5rQHs0QfrgEi
 D+T5g5TD2C6MZpGh7LRnYtb+V5aupqcpJXmgv2+5bo3TJSFodnXQ5wnxvDDz2afSTvEBF86QmA4
 FwJ0QfQgrsjeNO5lHq7cGhVT6T/8rPSK0N4/NiVn2T+hSidl9kUARCCSELYJOTwh1rL6vyR7JIi
 i2CuBBiySDEmMQd+Jbe8dX92ziprNngIuVfqI5ZZRJJHbgQ3hO6qs4TgJbF9RL/k0s+PKt5AnJq
 kPaucAr4SPsCJD3khymJ3mKK3PqDn8Wujg0gJe/k6kFE8CD9PTBRt4UGW7OKdLonx0GG+AfXH1c
 9XR4kI4wDg153kl5IBJ6dBXDVq/nwlDfg3R1m91DEPVcjX+WCaJcgwo0RKaHtwYTwnPPmR62/n5
 /MVk4c6Fj65rak5NVVKJiTmqUSRZiw==
X-Proofpoint-GUID: Qap6ozAC0iJkMO2ayxXWZQ5YWLUesEYG
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8eb5c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=eS8ScSGqROhw0OgIVi4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

remove redundant code and pointers to handle sdw_stream_runtime by
making use of qcom_snd_sdw_get_stream(). This removes need of machine
specific shutdown and hw_params sdw callbacks and also need to store
sdw_stream_runtime pointers in machine drivers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s
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

