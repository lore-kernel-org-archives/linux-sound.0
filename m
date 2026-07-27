Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2A41D13D
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165181; cv=none; b=kaQcE3R3PjnLzvYpVJzUc/uYdbfpykZKCkzlIbj3EjtFRbCJ3fUffw0uEN0F7GP3/hBcGPu0xzsx0duULZ6j0Z67Jk7XMqGYQvFF6aZEjFBVNJ3fiWUjmadqQP4Erd00xG54WCB9D+mtxhdd3mewwtml6CDsh5Poal+VG7CWVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165181; c=relaxed/simple;
	bh=LJHSPfoU2P3/ZzG8PBT1/08PEPzCdunMvhJjqtf4LPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zwt4My76RrW9U1Px1m4rEnOFYUw241KrND/MWPs2UW+JvQhzblH6I0Pvp/CpmGE039TCuBRQSv/X5Lc7WwFaPDhl15ohlC0GLDnA8HprMV3N2vOsZgVzAZyd1eVUc5kUKKhCDcJpBY5WJeYm/lHFaVyM9j/GSm0EGI4EqDK+y+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrAVrtnx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieM3lLgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrAVrtnx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieM3lLgS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDli1o4061200
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kp0FJSIQOQM
	mrFJp3CSeOHrI5ydYDts0OU7ueh7Va2U=; b=XrAVrtnxBLX6nTvJj6jdk/VV/nV
	2ApUAmGt89Z3iW77bDmGVRNW87ZPnihk6wxDxc/Cw6X856RBJOUGBMwdsxZQhDfS
	tvXwsPpthCF8vH7uW9haMuZA2o1kjzfZg3D5jXx9CbvYEKxqcn1qujnLwhAT/jTx
	Zdgi0DSXSiQhYUqgkQBjwaq6mdaM3avz4uN4Y3tD4/Yo46BGkF9WX4QHeaQSMatV
	WpWTuz1fADlGDK2MRrwb+TJywUAWqpKjKuw+7gE6b5T/FAcA6stJ/UuMNO5MRdY5
	d8K/02cGZSco8CPnln6p5qbMD3k8UIHx1aCdbUKFFu9Zw4DTy/osjvwPaaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq1cs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso771416a91.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165177; x=1785769977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp0FJSIQOQMmrFJp3CSeOHrI5ydYDts0OU7ueh7Va2U=;
        b=ieM3lLgSMg7XX0lfP29NxDd+Z1B6T6jvUpbGOY1wbByOXFx6p9TsrBD0vDr/gi3jw4
         qdQLaG7AOV1/+EFwBdFWE8qFkrWVwka59Ik3TB2SspZMIQwYKGkKSRlWfbL6FrQADwmu
         S+Y2KXIacgo7iOAqi17buuvcpL5jyeDUk3clEWH1hexudveI9BKxTQbi5HySyppqyPTp
         DfIa8ce0u2NRAzy2AvF60Pzm4Rm4dAYgzj4cY6bRvq3KzQ1ZEkZy5UDc+LpF5e8DckZu
         x0GpOacBcH83noh3OeysXhun1Y1S54iRN5Bt/0ywCX7BxFKkP4sZtuMIc7hylYvzUux6
         xEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165177; x=1785769977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp0FJSIQOQMmrFJp3CSeOHrI5ydYDts0OU7ueh7Va2U=;
        b=ed7ol4xE6rbi7ctaigiDwE4Ssh5LUXo5AMfpVXNknPNhMX0m7ZsyySlQp5eycYvXP3
         Wsrdm2qS2HPIQ/07VwDS2f8E0mktp3zweiXSlv2bsdnZfSj0yWDHm4Ff/mHpafAj7oEe
         s5AyFySmB2HK6MJyy/JLcW+KC3LkCO9ma24y9CKz0JJCM0m2pWb5+oYYM65UxTvhGUYn
         5lP3tsvi7W7fak1yS3B/qhoEzgbVbRvpzK8N92x3OYMevP4EXXw5RMBdke95bkjhkew9
         +odUS2Sa7C6TYko87dDLM5FYefHXeHLbhYDN2LEpfedcbQY+4IqHNppdUuySG4/6zPTb
         X3Zg==
X-Forwarded-Encrypted: i=1; AHgh+RoRDXgKhBFGn5uBEfBtBPB2x7n9Lr4VvuIF8YB74Ww2WS0oLoK/as4lDed/I4AVJnVz5Xh3qEVDy8OhXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pzhJVynkZkO2xcN/33gyS7wBiMcG6Yx9zOsBnOXzySb0bFzT
	zs9uRsW0MRphRNttR+664FN1Xn2wDIKkAl7hBSSnkOMoBzGbdU+oT+T+upmphaAqjl44KBnN8U5
	i1s3p/1fTe8eFhmYLvDxP81YhmgOPAYxzWI73qrzVTRt9cjtpQEi/j0ihJMnievo0bg==
X-Gm-Gg: AR+sD102vL+TFN7XbIwu8OgSjei5W9vVEpLBi1EuQ7Voy9bjsZtKqGESQD0nXpjGLiS
	eimbSeNjSTnIucXwiKPmsOr0NEEEOAZ0YTD+opr1EsBvl4UKEh3PF8T5S5n7bPtw0w5W+Eo6ycT
	O52CEOesFpv0LcviN9d6281ZQt6Gi5rZSI+jOb4FtPPPD++TCL35TkVBpviXvBlT9OumMSM4TUn
	4U+VqcZ7Q8hGw7LY6H/jh0U5RbXlNlN0DTPiC6k0Elg/i1IbojG0Cfm2gS9R4Oo+09ju0i6CENv
	AVRG1s4nwHa+ydjlZJJwkVT+QvYJPOCCv2ITgJrlyVNfLRBJkxM78p1vynd3h7r6Ih0Lh3wDnSl
	zCWo+0g6vEIflHRDv/uiGiOcT1LRDLsaCyc7s
X-Received: by 2002:a17:90b:164b:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38f293cbec8mr8159053a91.15.1785165176554;
        Mon, 27 Jul 2026 08:12:56 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38f293cbec8mr8159019a91.15.1785165176071;
        Mon, 27 Jul 2026 08:12:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f1a759228sm2510133a91.1.2026.07.27.08.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:12:55 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v8 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Mon, 27 Jul 2026 20:42:29 +0530
Message-Id: <20260727151230.408122-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfXwnj47K9/hB22
 ulSYPde2xTy7I6bS2TyPzQFQJogNLWIr/iJ4fmPQ5K21yFuz1dHE6bvHOaEQMH/GEEYoN1tjIVC
 cP8RvzCmgfHO3tEVy5fiAEMdxjPL/o0=
X-Proofpoint-ORIG-GUID: 95mY5BgJ9tzKUZT-7sZzUQRhu6tRr4LY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfX957BsIV58I0P
 HVSFRDe6gvRzvVvMFd5S5c+36HWMthFR6TpKMud+EUT0NLkGhxN4ZdWQ2auP+QsSh9Q2kfNdWr9
 S48dsJhcq49TKor30i266367U0/ym+Df/BV+jNmHGbbnG0ez6/WiMjx9PK2Z/KnLfvJ8CWBuBjg
 puGPdrxQB9KNcVHt20vn2qbGYZbHuyZEYCRNTGCiwjgu+lc4MawzAgSjEw00kHcV/5AVH2BnA41
 xcnl18U9v3MI1g9+00tEFEvKZjLss4qrAZE8Ktird+EwLqLycYDxft8/oSMJp4A37SBlZZDBboT
 OZ0nVxUH19MI7ZbVL3xF8Fbe1HJNfxOrsJFMpk8o5AFkSqy15t2ivgP7ksIg4vX0IMKtRegmDID
 baq7x/Fc+rRLvf6X7ZMNdBK0CdsBZrFpRQqlURIyaou9SKDKS4xrRFcntteQco/MwUgd3ayB1iN
 yYyQQ/qqKRaelXSJeNA==
X-Proofpoint-GUID: 95mY5BgJ9tzKUZT-7sZzUQRhu6tRr4LY
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a67757a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=7K0g8EdguqLjfqVUVIwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270143

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
now retrieves its clock handles from the device tree, allowing per-port
clock configuration and proper enable/disable during startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 181 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   3 +
 2 files changed, 182 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b28348..a3ff1137b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -2,10 +2,12 @@
 // Copyright (c) 2021, Linaro Limited
 
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -15,15 +17,54 @@
 #include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
+#include "q6prm.h"
 
 #define AUDIOREACH_BE_PCM_BASE	16
 
+struct q6apm_dai_priv_data {
+	struct clk *mclk;
+	struct clk *bclk;
+	bool mclk_enabled, bclk_enabled;
+};
+
 struct q6apm_lpass_dai_data {
 	struct q6apm_graph *graph[APM_PORT_MAX];
 	bool is_port_started[APM_PORT_MAX];
 	struct audioreach_module_config module_config[APM_PORT_MAX];
+	struct q6apm_dai_priv_data priv[APM_PORT_MAX];
 };
 
+static void q6apm_lpass_dai_disable_clocks(struct q6apm_lpass_dai_data *dai_data, int id)
+{
+	if (dai_data->priv[id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].mclk);
+		dai_data->priv[id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].bclk);
+		dai_data->priv[id].bclk_enabled = false;
+	}
+}
+
+static void q6apm_lpass_dai_put_clocks(struct q6apm_lpass_dai_data *dai_data)
+{
+	int i;
+
+	for (i = 0; i < APM_PORT_MAX; i++) {
+		q6apm_lpass_dai_disable_clocks(dai_data, i);
+
+		if (dai_data->priv[i].mclk) {
+			clk_put(dai_data->priv[i].mclk);
+			dai_data->priv[i].mclk = NULL;
+		}
+		if (dai_data->priv[i].bclk) {
+			clk_put(dai_data->priv[i].bclk);
+			dai_data->priv[i].bclk = NULL;
+		}
+	}
+}
+
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				 unsigned int tx_num,
 				 const unsigned int *tx_ch_mask,
@@ -251,6 +292,69 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	return 0;
 }
 
+static int q6i2s_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return q6apm_lpass_dai_startup(substream, dai);
+}
+
+static void q6i2s_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+
+	q6apm_lpass_dai_shutdown(substream, dai);
+	q6apm_lpass_dai_disable_clocks(dai_data, dai->id);
+}
+
+static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct clk *sysclk = NULL;
+	bool *enabled = NULL;
+	int ret = 0;
+
+	switch (clk_id) {
+	case LPAIF_MI2S_MCLK:
+		sysclk = dai_data->priv[dai->id].mclk;
+		enabled = &dai_data->priv[dai->id].mclk_enabled;
+		break;
+	case LPAIF_MI2S_BCLK:
+		sysclk = dai_data->priv[dai->id].bclk;
+		enabled = &dai_data->priv[dai->id].bclk_enabled;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sysclk) {
+		if (!freq) {
+			if (*enabled) {
+				clk_disable_unprepare(sysclk);
+				*enabled = false;
+			}
+			return 0;
+		}
+
+		ret = clk_set_rate(sysclk, freq);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to set rate (%d) for sysclk %d\n",
+				freq, clk_id);
+			return ret;
+		}
+
+		if (!*enabled) {
+			ret = clk_prepare_enable(sysclk);
+			if (ret) {
+				dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n",
+					clk_id);
+				return ret;
+			}
+			*enabled = true;
+		}
+	}
+
+	return ret;
+}
+
 static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -272,11 +376,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
-	.startup	= q6apm_lpass_dai_startup,
-	.shutdown	= q6apm_lpass_dai_shutdown,
+	.startup	= q6i2s_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
@@ -297,6 +402,70 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
 };
 
+static int of_q6apm_parse_dai_data(struct device *dev,
+				   struct q6apm_lpass_dai_data *data)
+{
+	int ret;
+
+	for_each_child_of_node_scoped(dev->of_node, node) {
+		struct q6apm_dai_priv_data *priv;
+		int id;
+
+		ret = of_property_read_u32(node, "reg", &id);
+		if (ret || id < 0 || id >= APM_PORT_MAX) {
+			dev_err(dev, "valid dai id not found:%d\n", ret);
+			continue;
+		}
+
+		switch (id) {
+		/* MI2S specific properties */
+		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+			priv = &data->priv[id];
+			if (priv->mclk || priv->bclk) {
+				q6apm_lpass_dai_put_clocks(data);
+				return dev_err_probe(dev, -EINVAL,
+						     "duplicate DAI id %d\n", id);
+			}
+
+			priv->mclk = of_clk_get_by_name(node, "mclk");
+			if (IS_ERR(priv->mclk)) {
+				int err = PTR_ERR(priv->mclk);
+
+				priv->mclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s mclk\n");
+				}
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				int err = PTR_ERR(priv->bclk);
+
+				priv->bclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s bclk\n");
+				}
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void q6apm_lpass_dai_clocks_action(void *data)
+{
+	q6apm_lpass_dai_put_clocks(data);
+}
+
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -304,12 +473,20 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_driver *dais;
 	struct device *dev = &pdev->dev;
 	int num_dais;
+	int ret;
 
 	dai_data = devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
 	if (!dai_data)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, dai_data);
+	ret = of_q6apm_parse_dai_data(dev, dai_data);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, q6apm_lpass_dai_clocks_action, dai_data);
+	if (ret)
+		return ret;
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a3208..bc5b9fa13 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -3,6 +3,9 @@
 #ifndef __Q6PRM_H__
 #define __Q6PRM_H__
 
+#define LPAIF_MI2S_MCLK 1
+#define LPAIF_MI2S_BCLK 2
+
 /* Clock ID for Primary I2S IBIT */
 #define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
 /* Clock ID for Primary I2S EBIT */
-- 
2.34.1

