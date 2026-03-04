Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EDF391842
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629659; cv=none; b=mP7PSMITXemmhkZzcKvKPiTn4uVJoRU+PyaSZi4xTudpTrNV1dWljSyjKk1uywUCLmxHkHlDnEV0Zek6Yb5y8rg2IgkSVxUgNXhYFlxciNmIYZCZ+Zoe7WsjYxdSdPVCEomxBpjXrwN5XZYl7KC+dfHWKiBxfBsC7idsMQUPbqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629659; c=relaxed/simple;
	bh=sljgOhpaU8wHMtLfJBiR4fUV3hNt3/HmvH6kZPwy9as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fv5OOuycJobKwueiRsr0M+xJkcSPH+4fRtY0/3sKu3K+LmX/sS5GOgepo8uBqxK/ErWdAiRpoTzV6wDDoOQWpNAb03vaqzVRb5Ed4p9UlLHbSmWWLXbDH2OgBKSLOMzb1MAznVDcEi4WAj4oMKDyowO+gKDB8hDIidZEagyanys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTwiyvl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5de7mt7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTwiyvl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5de7mt7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CiRwP3110655
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=79Hssidv5J9
	yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=; b=hTwiyvl31OaC7ApzylVMWQsVubV
	4U6Z/UUXpDl3dlYAyeX8nkLZ1MWamba3PIqec9PNZrFX5gOgns3kfstv0zqNYS2N
	C+OS+Ucb09yIWW0ZtyDMe6ZO4lmwZevL0NNhw3FN88M4tjfb1tqY2/IiQ0JVCMKy
	lxJcz3XAGhATaNOtLGkvVn/CJIpLkHcTRKu7aNy7g7vg289pk6k3rxUGbGL9SYxj
	2t45hNWNB9+OZw2b7U7JyYCrtYI9FsSABfOHz31+rA2l7JisWyfXtiHFcTcRhuH5
	8rPJCFq4FFRJWDkIOVRzyZRSgCpVJMSFJUAFNZrc2ugmAQm7zGseXVKvbYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2b7ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so718930485a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629654; x=1773234454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79Hssidv5J9yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=;
        b=U5de7mt7HpDb3kszqHVffsiCfacpK+nTSLeufX5ofI5PCFCbyBYAFC2w4NUvVtLPkX
         C8nwcMT7jW28tuauVEgW7pi+D+UyyKlsxWSI+kbLsHriJWRQ/d38z9DvUP2gnwbPpT1b
         1K/naORx+WezYkQ830a5ZqdNMHAC6Y9HOv23cnAMr2SvAfsGgzwuFcZNR7mIZbOFrOms
         ypri5uBrCGZw1RTPx7cO/moDn6hedbVidWNPCRnNL6NeXTLK+a5hZAF6EQofxsKdrLFy
         vyn7mUB7otDsehwd08AIqEYJahBTdS0M+gCbuiSnCG0AC6+dILaBoAAxva0YYl0dlroR
         aRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629654; x=1773234454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79Hssidv5J9yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=;
        b=L14eqZRPFTbEc2hfPd5qRdDSZa+6dW1dN2dxIQZR8PtLBmMSa+KUvMBHijaM9hfn11
         LjD+LxvI3Emas7da5KP06oGxL1xsgF6gedGj2hkcPnE9N7awbnDttY7xhV6k8Y7UFx2m
         1Iiz16WTTnbIfiNY9DqcONPGpzXZ3m7dEnw0XRGrOudzzz+nqrL+nCq91N1yj41zEijp
         XdAz7ChCMjHSHoYr00ruwb68MChAFOP5Ke3pfmslhBJ3PvGM//W+a3rCDSoypUQlof5x
         YTEjqzVd1LSa565K+TUAP5WYTJoe65YsJ0XuV12FX6oMjFYjbELr5g0nyLkwCQkaTNgl
         WDnA==
X-Forwarded-Encrypted: i=1; AJvYcCUoZkUBoclXtPxa5Ej1BPFAkeKFI2mWCn5945m+3kDUrbvOsOgKNXsAHHl1CTMU4KeODwQUjChB/03NMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+XkhY5ACFV7QERzO7hhS2BDhyn9S0dumLNBrzaKnnEN1tIA6
	HMw5bQJCq2N+F73MvniLX3eJX5e7mUMPOXj66GmIWRQrz1ld6sHn26nIl/JcfbEMZHm7eduUU/o
	dUY/bj9rKHp1V1uWCuCVCGDOlO1NkFwzzq4/08IHKDu6Pw/JndF49FjHU/69aqrccvQ==
X-Gm-Gg: ATEYQzxjq/PUHaOUtaN4lsY7qmkpzWyVS+TKlZ/paAkyN+RhiIwrbwHCcCI8zmNuMgG
	eQjM9YTeIs498WcKQyrJwAQbs77IyRvIOJQq9P5aAS64jTu2sgo4vY25SAueElYS0VmMtIpq2vV
	syTleM5NHCA0Tsp4mAT5BIuMYjtbu6ApOaSp6hl0IOq526eLsY9+WwVO7RKo3KE9PdGMjwVa7tD
	KJMDAVkp5zS5Ogw81uXw79ri5mzGcwRo+JBLkXWW0LhGduazWPemtO+JtDZm1IlhrVcim1oyZMa
	JOGJejpLFTNaw0D364z05rFuqT2xK6Xfblc2grBVdQopJ9OvlV599PvyAi/5bBoDkygr/j0n+P0
	acAOXzVm46Ex+5jzkVDxuXslba6oUozPXvz5jRvHXFlYj2rsnMjrOuD4=
X-Received: by 2002:a05:620a:290d:b0:8c5:38c3:7cca with SMTP id af79cd13be357-8cd5af0dd89mr216124285a.31.1772629651872;
        Wed, 04 Mar 2026 05:07:31 -0800 (PST)
X-Received: by 2002:a05:620a:290d:b0:8c5:38c3:7cca with SMTP id af79cd13be357-8cd5af0dd89mr216096085a.31.1772629648720;
        Wed, 04 Mar 2026 05:07:28 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 10/14] ASoC: qcom: common: validate cpu dai id during parsing
Date: Wed,  4 Mar 2026 13:07:08 +0000
Message-ID: <20260304130712.222246-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a82e96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FtX3JkZoW9ygcimNT57pccYEacZjOqu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX8Jbwyo9/SXHt
 0yTJnHsmFutBkB+NBB/jRadjEKg7AXZvh8CCsYYk/h/host9aPmQx5UH4m6Wtp9uGi20WQK8Od6
 nNsvAquYtqf7vRS5VpGudbJDN/ruinljr9OcbwkhJ1ROkOBl+D4cHIxR26i93gyNjGTINLxmEmq
 gpqOGx03/mx9Nl6DViTF8SgPndaV7SHlcAC+1ugDXAmi+7ah41udloJZZEC64rYO52Y1WY7swB0
 ju6QkZwb4netA+dX8KsKiDXOUtAvhYrjajRNLxofytS1vHFSj8waBozIAqKeoPWA9mloFNFZh9i
 5bKP4nnhk1zXzBW5IZ8gZXGUeXAXMdwTKagNPqWoKHLwxYudq0WaAKNWeqY6+YTN4/la9BcIf3H
 Q+fC0B5cOvuCUbQEws+fwBG/JRQPLaAyQbNZv8PEvF9IbbxX+jgxbM0pwhLGrJ+4aeVNVDdQcBv
 Kvhh0sUMN8wpTtoTqoA==
X-Proofpoint-GUID: FtX3JkZoW9ygcimNT57pccYEacZjOqu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040105

lpass ports numbers have been added but the afe/apm driver never got
updated with new max port value that it uses to store dai specific data.
There are more than one places these values are cached and always become
out of sync.

This will result in array out of bounds and weird driver behaviour.

To catch such issues, first add a single place where we can define max
port and second add a check in common parsing code which can error
out before corrupting the memory with out of bounds array access.

This should help both avoid and catch these type of mistakes in future.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c      | 6 ++++++
 sound/soc/qcom/common.h      | 3 +++
 sound/soc/qcom/lpass.h       | 3 ++-
 sound/soc/qcom/qdsp6/q6afe.h | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h | 3 ++-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 7ee60a58a336..878b42babcc3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id > LPASS_MAX_PORT) {
+			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 1b8d3f90bffa..ee6662885593 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -4,8 +4,11 @@
 #ifndef __QCOM_SND_COMMON_H__
 #define __QCOM_SND_COMMON_H__
 
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
+#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index de3ec6f594c1..68b71039b981 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -14,10 +14,11 @@
 #include <linux/regmap.h>
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include "common.h"
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(DISPLAY_PORT_RX_7 + 1)
+#define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..0b8c3ec1315c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -2,8 +2,9 @@
 
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
+#include "../common.h"
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		(LPASS_MAX_PORT)
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..5cf538397841 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -14,9 +14,10 @@
 #include <linux/of_platform.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
+#include "../common.h"
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		LPASS_MAX_PORT
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */
-- 
2.47.3

