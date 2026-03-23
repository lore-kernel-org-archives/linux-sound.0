Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70815383C78
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305557; cv=none; b=UJBNf8yzxFWWRp0Hjd43m+Y1E7G/IUMmdno246w+9JFqaueP2/uROpXwxsmVBCsX0Wq+inSzUwIqdGPbjfx74yuGTTwQ1hMwDfQ3yCob3IV8n9EM2M1V1BUn8Gm6DpIX2TlY63o5+pmpnSxQxGcmqENwl5+VKSNhgUPdEpFsEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305557; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnNPyTyXQVp4W5T34fye/KcSfAVODWVcYilvgvjs5/4c0mAlnqWBc8EBGfq1b+1rj5+2vRCr1iWPinvcvLzoy9eonTRkCWYIpFDdFHPPzxINNgD99OcNP6VoO3zW9dtShLxIDn8DKDrumJXnxayT3q8q9gBFkkAfy0+9lPSGna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJ2kD7eZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1/1+YHI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJ2kD7eZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1/1+YHI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrhMv620409
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=QJ2kD7eZ+YvhmGGDHuQEChlMndd
	qZF3loald53N2NcXT6vW9/EIvM7p/kO+WVi7L7bbIlBje0U/MvBy51rvZM5Bselm
	FIxmGe7iJhc4GXI8TO2KhtCNVtDrDyGWZO6eEfnsyEF1eUiZRUUPu9W4OgL9OAVZ
	4cfSPa1+isqeLKsNTavLPjXt4lPWpE8yn/s66vUJQadXAIhFIXHdfOwahAchGEnK
	ZDulcbFK/SRhEHyMIlaefS0IwlbUg5r4VriDvXoZl3Zaep/W1Ntnjie0FjNWjc9w
	EdP6/iDYsz8kK8Tp6CYEgSh1ISU3gl6OYcUFR2K36ezP5zoSGDkCBbtlAWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjyt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so355112381cf.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305551; x=1774910351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=e1/1+YHItIeN0aQZU4D+BMxMGmcEdlfIVO8++/21OhE3VslO0B0IxzYF/UiBdaY9c3
         taY2rH9sVlanD0OcoG3JV9wNkUIPQzVMr81RFzYLTIMU0jmqvSqIbSRU16fK9qnvL1Qs
         C/sWcVG3LkxoWSwAbT9xHtd2GH6BwdkH7eNcjNAKcTFziTT5emBsc/w8BlWgcq89r/RW
         aUZBJ9WhjEzWTBi1DEvlSXp9cPacDZYBV6bb5GI9iWMQuVqs/iCldhfgInRi8UnPp+01
         WsWdpGijmSSLq/QlBx5oJbTQh9adpfzZyYZdJzyeaZF/YIfMJoBl5YspFp2Zcp/wrKk4
         ZR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305551; x=1774910351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=KmAmHUBNTZHsZ2atL/9DesSMZhrsTUbPRgqYtx3lfzoDSTHXddsqGEXVUhnLqxW9fw
         UO1rcucE/3VN1Htg+2V1k0kJMDMSmBDlk2zK/Wj4aeTqxxf5pOpv0NyOYraX6bkwp/FJ
         G51uQHRFwft+qARa0JsNc5S1HXyccSxEZBrg+h7MATyI1bxv8R9gp6skeN7u/hoshNSo
         o3ca9DpSQLjvvyefGJunQe+UC0qxQ83ecT105kMBSpg7yWYhH/01VMI9XkGPta6pveIx
         MrNPZrZv0Pr6DjsPgjvT/UoJ7K+NDvDwwOsWkx35rkCFkNkapJoyqcB4g72tCJzAhgJ0
         X4/A==
X-Forwarded-Encrypted: i=1; AJvYcCXOoa2Ierw99FuPsz9EOgS2OeabBgLpSPmGEsDctxRh9NSPyyUzquYxiukh46mxOUdwLyToXDCXTn/FFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzFB2YvkLVlscc6puby2iadZZWVlwZZN2CINTelufkjMKFSnC
	S6P0y3hM1kV2do9e+rfakdHm3uaoGq+tpliMBaIvg2sWJytR7SHJGep+UQy6ktiEwBifN3eYBbq
	4biypwBNMjwpB1wRMDVv/nQd7HEREeZuaSS1bQhQe134PvFAeotJzZMeDDYcxuNNNXQ==
X-Gm-Gg: ATEYQzzp4SBw6wy/sRbVtYrS9F1D0ERF+yCWiIqpBuecDQvhyLjOMl4dVCs65ggS475
	+vjiyIrmaCZuI13aH8DfrqapGUsju0GUHPMJy6Fj3LnCx9VpKX5bOiItrTqWNFgcA+dSTYF9tXR
	NGLVVBw5ODFwnsz56wPLhwnnbQ40oMFWOs+hVzIdcy8c6ZdOEzkNbtZGQ6tsYIhMKNNRtORxg6h
	Jd7mY8RYRe/74tHq9V8YlTbUQkDVMu/bS0oufHquv+3LBqerM3+AWXurnZVmzhFETXMq7n/oyAv
	EKsu4y+Co3DwsH7pebplcq34x/pg6VN/jonEWln2NpS6Efnd6VDEN8dE/h7kfRIN2LjUzMy4huW
	FM0LkobsbaWx9TJIOVzl0ZgbR68IWgT/csEwpF0mqQqSMqNc2JeAlCNc=
X-Received: by 2002:ac8:714b:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b6ee5ccc1mr16161611cf.23.1774305551422;
        Mon, 23 Mar 2026 15:39:11 -0700 (PDT)
X-Received: by 2002:ac8:714b:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b6ee5ccc1mr16161301cf.23.1774305550963;
        Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Mon, 23 Mar 2026 22:38:41 +0000
Message-ID: <20260323223845.2126142-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sSKmDcaHVCHXh6P3R9VNnZPAeCEFeUlJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX03kvqmyED4C4
 MaiCMvcbtLrv/kI6Y8FuGPxj5i8pKN0ybrQwBaiRk1CTqcr0r9dkH87r9dpKD2D2oMw3YnE3zhN
 Sjo9614dURcMnfcsKLoXLzLx338NCKoHa+FAtoj0vC+EM7Ugb6uGYLlNU3Ew3xuQ/KZRH+wX2zq
 xl716+ms8tfNWUnRoJ22DvxPeFP9HP5ctJ7sG/X2jHlCeM3uwQU9nE4se28a4hWbssKeglStBSv
 GEkEblO21XJip9gm9R1Ph/7Q2JrZfoOSJ9MFCiOUQ40Py8T4cXbjo0dkATDq4GTvzxldE12JeFb
 zDgAixBl+Mrji4Ha9gZdXOdnEFhQw1U2ZHtT4EOfNFb4w4VnqTtMy7zaYB0o/Gna3hvgO8U2mRp
 f6pjuivk+5oNRO4tABrQjd+LT38/RBcmxmOSmS0Y87A6RkKP6agsuzKLwYaLbFEhDOZgRPLYjnz
 TfR8zwqOAQFkaRR+u0A==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1c110 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sSKmDcaHVCHXh6P3R9VNnZPAeCEFeUlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

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
index 7ee60a58a336..cf1f3a767cee 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id >= LPASS_MAX_PORT) {
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

