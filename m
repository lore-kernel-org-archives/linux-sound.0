Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4E33D502
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870087; cv=none; b=VwesP/eur6dlO5XUZ5nxRRU7eD/kx1NlFGzLgaGoCbVU9M2aXam5cFpZKMArH/GOKUeeTqagxiXOfo0/seADhPaQ7D47d3KILhU3i3Z1ujMU5Ow1Y2TGs3CSp5JWnlus1Ut+vM/xukaUA7e2PoYno5o3dB4BsxK/50DZT+ihYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870087; c=relaxed/simple;
	bh=k+V9np/k8kxcG0TemOtAqNElAc/Y6WE69Qv6f0bpv5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rg5Q2pErhdFFaVxOWjg4JkxhJZjPs5ZWGiCz4yp4CkXVDzL/eQanhyhqO+TAzvbS5EsYfR4r9tk4Q5keJ4VBmEErv0umGD1Mj0QXfyD5lC1yI7KCQCwyfy1FSt8eGHik/KL6hNx0u8C/6jKvBKKhVwbzsrtal+K23f4GE8/62VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3UKlMMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpgfWJMV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3UKlMMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpgfWJMV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2gTn3151767
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GCQtUWK31BU
	Ldny6QyCqYw32AyO5oDoICxT6CT2h5Hs=; b=V3UKlMMa53IEVtRUvpH7OOtBK6F
	asBxIhDCVBZQEtmCbcMW6sQaHptOg3blPD5EBDC5GyKmcZuJDOGA/1dYHe57P6cG
	IrM6jqefjVFxlbTYQC4O8BRO0+uMrg9Snb3BkBrNYfjPuzk4ky6XVwuxGzffSqb2
	fRIaqOqEcz46Z8alWfYDrzBGrzvFYM/fzcHc6O6CSR52ISom/XGRbI8ecgDJh9yw
	GvgrbCCrChoGDRdBbLQq+T0TlMgNrm41Ns9DknAewuadn/r3uOWClWJ0A/eur6xY
	FL+a0gensUDUHQmjafoPmaaDmGBlJKUL9OKAY8n118YGfCu1lZb875aJ/Zw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj895p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so6958588185a.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870084; x=1772474884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCQtUWK31BULdny6QyCqYw32AyO5oDoICxT6CT2h5Hs=;
        b=RpgfWJMVf2S2h3LUnMKqMz1UuyzEb1sNmVFjdqRFoy6GygYwThVkdXUGCuHN3yMl63
         6hsJUDGFg9eHmKDbkz8SqC+sAxvhS2Ws9YPTMELVnKRdec/a5lQX0N9zoy7vmUk7ZgNr
         sLXgAYdwtU3RJ4rxKFkkUDsWzKmzI/+PRwWv3bLX6k2wwQVV5LA7Sp/nBRbf+bPqrHmN
         Od1QpwBVLMtSJRGSLZfZSYOzCTwRT4OsnLr92kvfYtDTV6tAU8ngV0G+I4ZC0JVY8z6+
         KjOBLWci/9DWj7STx05rnniHhS6aRZEmNHaxhjzJrDLwjJN33yQPJlu/E1orSjEZ8XpY
         r+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870084; x=1772474884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCQtUWK31BULdny6QyCqYw32AyO5oDoICxT6CT2h5Hs=;
        b=U9bj/NSXoJ7sHindnc6Utbu7eCXqmeCu+Sh+ERrwtmDWYDGUbheGuXaOuZh3E4vbgE
         xjdt7XwfURldK+MwYGixJIqHffdXV7N4khU/bqsnbmct3oJ/BZpYtcb84UEY0IZRlRxM
         abXfrA2G7FyOmQ5fsxh4pE+j4cj7UANzHaWtXkee2XHcKC526vrkrFy08xaIl5H8qPzM
         kl2W8EHUfJPo38lA+ktYW7gpvsBMEiRkmUMm1lFBZF/SHh5UolHh4AD0H5JZ2T9ajTW/
         uCLiIG6x2d7pgfVD+UQ48pp9Sz266wILwEhIapr3KnuUlEjfrvgYanQ035+Te8LFxjh9
         ApoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcTbr0iNZlx4KIE9Yyva3/WecAuJgJgiFEhQV+SmB3DZu1AEYNbpAvFlEhcCVckvQ2f01zFEI7BLXjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBDqwc0xUz8EoLV3sdbPQFk192eh4al2/1EWFuyWAC+6SyPah5
	3+xrBApRA3ojPFOMturTsjv9c9ORkgPD7BKsnyVGDOqOS78rPGPT8D6ZpvUc1BC0Hy+B0fBv3+a
	YIC+iowvl2odYZeZOJcNwaX8Mx0tM/OUL+2WsEzTpRbo/TDCQd9cvM+rVrdGeDLfEfA==
X-Gm-Gg: AZuq6aLeU4ECYIhKpvhpI+uz1GdEqaH5qmDU2XShEDCkgVFlp6BI8FNJBDkvRQhxZuD
	QEc+ZBVnxHKIv0G+WmK+3BLT2Og4b2DxvW0gIhr4vxtFyWaqJKlp120pGzbMopYmDIVxSrkNJnd
	OlRB6cNjOjkMdN3wDgzOOFQmYC389iZPjNjlhEWJbM/Leem3CZyNWf3LR2lIhuyVvs8vafwK9YY
	NCJFIEMD4DtUZka59ZZE55rPy4LvMWBiRvfX3CEGL0hAWi89wrtfTRL5W1vz9TPbhyLuY6kIHxv
	P+jZNrpBrok5iyuPvSY/qHQiRHZ2VULdAKAW+cI4I2L7+3ZurVwfGAg/rsAuFNNb0l+FO4TPF9D
	vIa0rPIROHuZIRkbpNnS6CeQW8DVWzUcWamngW6hMXzkmk82Adpi/w20=
X-Received: by 2002:a05:620a:3711:b0:8cb:8150:b1cd with SMTP id af79cd13be357-8cb8ca0d7e1mr1183560385a.26.1771870083839;
        Mon, 23 Feb 2026 10:08:03 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:8cb:8150:b1cd with SMTP id af79cd13be357-8cb8ca0d7e1mr1183551785a.26.1771870083202;
        Mon, 23 Feb 2026 10:08:03 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 07/14] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 23 Feb 2026 18:07:33 +0000
Message-ID: <20260223180740.444311-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX8FA2W16riB4d
 pBHkgR4uAlZFT7PMnum38kF4hMtLLT3fwtgLu6DstHJn1/yC5HtzBM0DWL3i8DLuW48GgmQF015
 esRFDjxtqhYvFghHl8KhhtWp/inaJZWQMgTpVwTufG5suou1Z4fG60O81oMqcZvOKTqv/gyQjif
 K6I2aS5q46A9FcK+c6GWFBhkDaPz6wFNO0+Wgr4b9/Nc8SLfbNXCewQg21d1S/JTZtr0bzPlS1E
 juQ1Osl4UJTb/mUtggTDI9Djcjey4naftw5YruH/GmEyKRxiCw8cuiBF5Xy9Nnjl5vQRlkDPplE
 1rp4s/w47wk0kMcXltDNJRDFuslhY/ATVhMgnyG68rxHbR1DmfaScDisVgiSkSXMrwCcFjCbEeQ
 ICiKTYC/MliNDhkFK7vn0rCj/NEvhubX3fayNJdR7pj1lpMq21A6O7gCqx0/XnjxCfq44j1GP6W
 Txu1GHFnR1ya/0QaMzw==
X-Proofpoint-GUID: ssFRDbUm53wJNjStBTxBYrL4qaWyq5r8
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c9784 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=O6SSznAZH13pnem00RwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ssFRDbUm53wJNjStBTxBYrL4qaWyq5r8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

Add new dai ids entries for LPASS LPI MI2S lines.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 10 ++++++++++
 sound/soc/qcom/common.h                            |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..e27a31ece1f2 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,16 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ab8061049375..85ca73408151 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(USB_RX + 1)
+#define LPASS_MAX_PORT			(LPI_MI2S_TX_4 + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
-- 
2.47.3

