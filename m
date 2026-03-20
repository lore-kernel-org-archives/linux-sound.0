Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF0A3CA4AE
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018181; cv=none; b=MifLbCIHn6hkM0E5wIrzI0GOv46ZL8bnDDsn392aKcJpg83eNAlUiY++ECpckvvSeg56VgPX2US3en/t3C/R3Gqjqg4z4rA0VOHHiVB5LRpLilJT4Ov0Ni+VtdB74tpaGCShxDvcQXqDxMmvTUmzw5uwxaPeevkVf3WulGO3yLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018181; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llqTYZ//cCNNJLNwYeKm/jus2AbicYHuFXc7mQ0XankzaUsrXmmKrQeOB74vXibg6rb5VLLWjn77VJlSQw/FDO2SNsBJpTJxXQOYToX1P7BsDn0cmSthV9tECF7D9EbXs2cGvvwWmKrB3wgsnzpbJUYb9Ka/ULGknfKbqKE9l5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ex6PhGk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9JygXt0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ex6PhGk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9JygXt0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEcMQJ1692093
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=ex6PhGk+hwkp+aQgRMUmR5edSIB
	o8qn7Gs3qrueSo5JgvUnRz2j2EDDPyX3BE0mw4RYEA2WuboBHzAZxnRNH8kEQOzJ
	n5Z5+jO+bRGylLE/T0WqAxKZIoPH6ZUcfp6annnBc8NrI9WpHiNSzgHQae0I33+6
	8LJgu0PBwiwB56goJ60GKOcVIXHWQa7tRLVFhAKN4khOL9QAslNEMgyq7F555zHG
	buofdsGRAAEsm2GROmCoOWOcxhMkqVu7dDGcUtpYSMJ94Q/kuhwSbYIN8quYJgp9
	jT2aeuATUnmv6/Kw22rdmlTym++RsboAiDneha1yJSKHGffRlB42YYwwe0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d2aq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b44f7b7bbso4722691cf.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018179; x=1774622979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=i9JygXt0YflZkNuL4UIrNOiNcc+T5VqMWJhKXPiBdcIEv7yNakYzksJonsgxr22dGh
         TA3HVCTL9ZdVcxPgJAQGrUeRNbUIvBBQIRIJ4cdBbqYU0g+ppogAXXX+nEvC/RdUGCgn
         2+uu341nV2wXjB3+NCX2zClm4XMhPvO2NFY/dWAQU9hxcyzUgdJPqAIlh61A760AH89h
         /RPOwm6dfnYN0O8evn8KlxBq7NsFG+f797N58N1HCmEgwEkSsnJXhQ0Z8+zmDq6fU/On
         fZ3JjXxM7uPdHfYH6tFkMB4S3VrwzE6j5AnSh33ldZtyW+TyyT3rs0MU6q53w2MSerV8
         y9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018179; x=1774622979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=c/P6AF62RehCSA6ebvlqrYw8IDOk645FNnTyw57YBHSFR9dvYEiI91zXnsfVn+ZdMj
         bOssmVwcnCoFUdeM4fDz35HY58+8n9/uPfZXC3Oh7cpjwuy4rG3vJWItlWCHQrOlpx7V
         3iV67chxVSYWMFztRxLvxRRnNVwL8DM6SUHAI63yU07O8sg+Wzsyz67hO5FVpBKpdUl3
         tI41E50QKnse7BJsEyBVPKAgzd5baGRYb9wUhD9Ke7uyjP8EaXEcqQlUoyWFQPV4Guzl
         aBcOjmY7uIZEsY4LpJl7UXBcNO1G2WKgQuFYg7DG0gMHHcnOYJd+aGnn7BVAuR8NXBZA
         ooqw==
X-Forwarded-Encrypted: i=1; AJvYcCUJmX24zcWUYhwo4l0PTGlnCQLKfxDpqqQpVUH0yeh99dEIndYVd+ijlCk/D6X/ZsR8ZgVcKCH4JZyAig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVBYwR+2eSonbPtK6zzEIFAyElJtszUoNZU6TN9nwJcSjyi1F
	cyfz6ZenhqmhrTsHRcJ4ntF8+14DY26HU/DHB29REKuhQnbzAdkadOnCRMFjiP148qKOzHFVOXP
	sY157VEEFwrT73SUG8dBxwhY+dJisgI/vWQY31C+0IGV6HAlKLrz6mo4mZCyDYmfNbw==
X-Gm-Gg: ATEYQzwE+VBW7MiHV7agfbEZ+t2+NRqyrVE4PBQFAdBzjjaXN5vQCQXCjUlN8/MhxyA
	FPqiX32LiZrV7rLUxeg50+nJd7+UuNkzU/ejPkFyg+nsAoRIWS+GLvkg6MA5LJvTCe4TZuuaKMD
	E7dsPTflDyKB0DLwIsqpqdcIH86jW0sXs9qPlaw+CWQSyqMMSqpth1hhZv/PPWwlA2LnS62WLX1
	/yxr+GjuI+wMbtjXWCGqAoCz9MvDtnDGsXGsuN6vdWqGn8J1WzjTrJ3K/g13usVcpnsfxntzGqU
	u7RWFfAPGBq5XhjK8nHQjDvQVsSmW4v2sCteMfkZ6fAPKj4wHUAfi3K+uj3GbGVjgZwfBA8ZBfv
	TwCMYdqIqmtawXdRXOJsj1z5ecedjTuAc/CM2MvNwQBysvvaYmQvSbxY=
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr45801181cf.71.1774018178631;
        Fri, 20 Mar 2026 07:49:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr45800131cf.71.1774018177827;
        Fri, 20 Mar 2026 07:49:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:37 -0700 (PDT)
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
Subject: [PATCH v6 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Fri, 20 Mar 2026 14:49:14 +0000
Message-ID: <20260320144918.1685838-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JtHbiFOio1-V1WhwwNmsM5MIqRWqi3O0
X-Proofpoint-GUID: JtHbiFOio1-V1WhwwNmsM5MIqRWqi3O0
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bd5e83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX94c+l2qpH2op
 gNRJgobk9MXIJ/KIupKMkUw4j+i+cL58DU7SnB0demRAMnhhfiCEFqFK6FfWqIygpSnGNUcEfV9
 DuV7iGPC0gskQA5r+bCOafZGLTJtfbeoqR/DXxwVcfPR6EM8gTSajyoQzVXRILZwpb6VtIw760z
 C5QGoBhxAwOW3lijhB//t9D0yis2soqaVh3Eiuco8sH1zPxc9dReS8qZHGL07b3nury/WTmJ9jp
 ip4B741W5993EPTXKzQslaie513U8pPnBaYyw4/seEMOvpMXyqNb61F1Qx2eEhfrDX8BUI+Y3E+
 HrkvG0BYrmhDVtierm/f6hlSDfzL8qOgjkU7yxdkVbdJcVnqWL0wLjWAHgxxr3F8WnvuwxFj3lI
 6jtT1sv3zIVokxMlDM8NtTjB+9lnlnL1b5cWxGtnY6mKJnfkoIgmHNcQRi5eKfGGi32caguc8mP
 eL0lCLjzCr4zfoHIIBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

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

