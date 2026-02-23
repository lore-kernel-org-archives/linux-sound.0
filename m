Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E2A33CE8A
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870085; cv=none; b=YUMMoKP4MNyUmLSnrR9ANYOCDWfBS9O6Lzb091Wu1mRCNsqcLc59me2L9jLxvBsA7Tl2/fvY8pZ86ePY7FMdKWFxM/eWfer+HKLkKweL9a8KkAWgNCA7qHN2AsO497TcnThsNMM3/vUDBxpfDYwgLNSAAuWFQfPqIiQ+aJwTQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870085; c=relaxed/simple;
	bh=VNHduoXGqlVxdzBtpgR9jvDgv6WgWm5Ys+b36xvTjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ151/B2fP3b297aUxPcxtNnRKQSg++XOfw7ngYrh9SOgKpH2DSDl+MLik6zIJG9UFm7hrk1pot1Llq6ftGboFzHKDRbWKYqGNBkJZftZ0uSy3Oq88Krh31AaoIlceMLdbZHcxxGOK3K8018n8TyUmebniwAYMt2tYUDKEKhQ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7VvNPEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDT1VdHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7VvNPEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDT1VdHw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcTI322185
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UDRf/+L305X
	Zc8ITbEbLHZrwiYXIk2guFDOZXnVMNE8=; b=W7VvNPEcpUGweUd04xr3LE/x4lX
	WPUywO+xtxf5tGbPnef+/PWJ4tZAyiT0zF0twZ2It4L7igg77pp1vyyQI/Oj8D5l
	+qBaqFQ9/ipoarwzwQhyxQkkAYy9VGCgWuWoziJ2bNUclS3wC3p+c99NDvtU+pDT
	LbOPMKgSQLMKVt3azO5loWp2+W2soTO8REQHi6o6IG7JV3/bb8kYD8jTPcGJsfJt
	4/arXYV2oxFnd3i4+XfTO2D0WJrYYYNbArczkeDEij3usfrF8u+QotRh/KrlrnEL
	6etbYEA7L66/VhygXRqYp+uQAPrgFaUXn4z7eyhArBUxIneMiRK07M14LSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1e6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so5666464085a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870083; x=1772474883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDRf/+L305XZc8ITbEbLHZrwiYXIk2guFDOZXnVMNE8=;
        b=BDT1VdHwpqPt3Ezx4uIhMwa4QIIUBtOT14QkdJ8oTaP/A/8tNE8I7UNnix9JBHNi1E
         YqeybRarpD/0HY921kSLPlmLWS8GNlpRv+ntTprOH+e+q9ihbxNHXrhQUfuLkIlR8Y8B
         jn+KnTtQL7znSIW2SOYfCiKlWhIlbjRj9acZYXAL+TSItyN0se48vZi+CvPfO1Xazwe3
         gn746aDd6QfZOZv5Bd+qMfnjnLhdZOOu1hgvCDKF9hb2rsjPMFUwSfSCEZ+dccQ2OaMt
         a++9voDov9N40kzbgYY2uMPSfouMhDvwicjBv2KDOJsqz+JkrWKy2XZRIlrWNs/WrTWV
         PgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870083; x=1772474883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UDRf/+L305XZc8ITbEbLHZrwiYXIk2guFDOZXnVMNE8=;
        b=T9ZNjkROMtmmkNKK13klnGRg/Hv6hkV/QOi7ljuS9lIGHcBIP65jz7uW5Z9cSZblbZ
         V3YZ6d+K1J6QTHF2qrFyqKTozH25U+0nmzbzFK3wbo6Xd6mtA1yfY3zRjFmdXbgOExPY
         K6jg1104NY5j2bVA4O1SannB7SRrjKsQp9C9Gn51wYm7NeaiUPeDz9dj/BD8z0MKwAfh
         vPJ9G84H286NE+xBYwhcHAKdJyEMTQHbjr1AYNp0pjvfV/VzKFyjdAd+Cme5jMV52Aan
         7tEhMv30neYtu2jZogS62v+co52mDA8C+k1+kgdWRgre4H+7lPXzeNB6S4K7HgC0wAn2
         TKIw==
X-Forwarded-Encrypted: i=1; AJvYcCX5cWOuASC3cL9g3vS6nAkfWGe3c05BZ435+bI3wdW0bQFeWjK/sxkualwOGHVqU+hImCv3L3bSuzhJHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIwGs1BLos8YKl5Xch5lcGYSXxSN39TSKcqwWtVkyhaMRDsU7
	2kJZswdySFFRMxPncepl1+mLUCFYzk5EuvKxKgFiLVSdb0VfD3KQA1cJtrxhptnILUhYNboSwur
	wRUJ7kb899MvQtklgo1wWclc3ZPODg9X6r6uGQZxAwYrzI2PjPnaYaF44lDN/DBc3sQ==
X-Gm-Gg: AZuq6aKUjRYG7PBtA/tPSfrZgDKW7YCzboUb8jk2raASrbUV0vawomAqITugsdJ7iLp
	Z29aZAxoMc9N7bG+BAGqo0df8tiaDBelFdqS+p5sHtKA04DpYaHwGulL68HhLlKq2uw9kgin4OL
	HAwTS/WZDKBPT6wbKfGg725DOQqOK2+l35G++LhG8MgcE3Hwvx9zI2KQfsfI3We9PoKpn9blFvd
	x+nDOMtimMYYRJ/MZ5UXApf8LXhq5FYxzds9g2FnsrUV8fxGZx6jBQuV6w5DVtgP1zMl0EsqT0Y
	mcfDNcyBfefGh0xIbhDZR889E/HvJNt/A+2X1JvgteDhnuRglKAZUIspSWs8+MDVspm38eUobQt
	wk5eA9h1WXvTsh1LxBWsLl3QuMGynXyXPZRhvmjybZp8oSP/TaIvDNbw=
X-Received: by 2002:a05:620a:4484:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7be731d4mr1789941585a.15.1771870082748;
        Mon, 23 Feb 2026 10:08:02 -0800 (PST)
X-Received: by 2002:a05:620a:4484:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7be731d4mr1789934885a.15.1771870082116;
        Mon, 23 Feb 2026 10:08:02 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 06/14] ASoC: qcom: common: validate cpu dai id during parsing
Date: Mon, 23 Feb 2026 18:07:32 +0000
Message-ID: <20260223180740.444311-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX6keJVuAg9HGV
 1W7Yi402lmiD3RPTq7pC7uVeyVtXObDHwGWXQOMKJ9tPbDtGOHz107O9AEQ7bbtaCA0Emj+7X76
 nWPGCPUMue2JSnMhTvKbDTRnwcvS2njr6GFp3oGV5yLq+3VOkCqRmX1aD3g63qdlJUQoM5moR2N
 ieubMUDYLN36uQOifSWJ5M6gyA0wsmMlXcpj/hsSQPBP1LpiTNZGfGiEyXvjj9Nappz8VWNDnSJ
 3ajcuEJIRIhCFDa1vq1nfaTL5LTzdLz2TMvE8PkFGa43McO4wkbO5KVHYTUvD8/7uYnQPzDRp9v
 ilpDVi+2hUbIPSwNJ/GmcnD49YWwoWN7Ovmf4QpHqBKhc3a4fXWAwOOLygJHiRMGcXFzU1310Ok
 ef0HC5nhQYIpDgII24w/V17SEo0N8LnUdjWn3zEHG0YdDQ2HQ36RAY0b1ZvDvoB9ORsGkQNN5AM
 CQr0I0SkN+C9Lpl+viA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c9783 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vqQb6Hr1y2LgcfZFviHtcPdh_d7VbZOk
X-Proofpoint-ORIG-GUID: vqQb6Hr1y2LgcfZFviHtcPdh_d7VbZOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

lpass ports numbers have been added but the afe/apm driver never got updated
with new max port value that it uses to store dai specific data. There
are more than one places these values are cached and always become out
of sync.

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
index 7ee60a58a336..2f5d3ab1a353 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id > LPASS_MAX_PORT) {
+			dev_err(dev, "%s: Invalid cpu dai id %d \n", link->name, link->id);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 1b8d3f90bffa..ab8061049375 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -4,8 +4,11 @@
 #ifndef __QCOM_SND_COMMON_H__
 #define __QCOM_SND_COMMON_H__
 
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
+#define LPASS_MAX_PORT			(USB_RX + 1)
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

