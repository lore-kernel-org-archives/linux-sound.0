Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078B3C9EC9
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018176; cv=none; b=ZOBNZVHfGvN1VBOWZ17gXr1plrx9/7v0ILi0aN6zp1x9qpmI0pMDGZwmvcpt4MQJT6M6qgEPGhnIHEvNnvQ4EjcI1GMnv4rWh9/5Vh6gXIi9E1jrMekY+OfxuuYVLIu2FaAb1Wvsvg0bLKUuwHqXcqn7k0rgoFkF99LlocGE0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018176; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky3vf/IDOKUvXL/1dAd5cnT7dLlbyr4DtHuhpUv/JjJj7ihSnsgEV20OGql8REXyxqNh9nM4DJ21bj45v5u6AsrFK7iQbDwTlKlcuQfgTE032gl+6Req59mp2+SsNeb2qPpyMSEusFRjQBjvecippg/IBmivWQwwnifRg4ZLZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jggkPTbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7wUPuSl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jggkPTbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7wUPuSl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBsgYu3876218
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=jggkPTbufutD6JPGqnEAfrD0qDB
	PMI2rMIsW/egiajgtuyD4bnh5yXR3it57GsI4p1hpJ9B3g297q9tmFQKv1OGsppF
	FZXZCJ4aZo8KfUjbudAZ/c1KMdogDQetWxIySBprV4SMzpiY7VJ2owQiaifct54J
	47etODdsQotqqSjtivf8CBEQq8ggbi9ukOwYnwkk7fpY2RqiVmu0VUG4FjFPM8lf
	AjP1KFY6IucGRQQsOEPvpO3FcNb1Gl/Dwd+qoiXwVdZMgsHpLjd3z63DYoInt6QW
	DmLikk2SqZqrhNJTqIpRFlg06+CpzWQ2Ll9yhSh2C2XifAQDQdznvhqlBWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08e4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so45097001cf.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018174; x=1774622974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=G7wUPuSlbZvbLaNXvPkcMKiQBCWtpYq56ZZXdpS1HmS+O5IQ3xVOwPpRr1t2wOSgPo
         mwq96Z/XKcgGGQWmaZdCKL6nXhb7HTgYiIHETy0RgExQpLufV/sBgr2VQ+RnyorLj2Kq
         Ixd0FpWeddlVz0SRblbjrfrsazpGBqgMj136htxYBWT5Ne8KbdpaH4yl23Bg97Qrrfii
         /nt3is6F+tKvW1075F6RBVn/HkHOapqKKLiTBoW5+ZGo8+uWUugw2XPQlnsC+kKm86Yi
         zgl9RnGFEOHXtsDFH4mT9QItqShyvcouoJY86gXErSANmO9asGhQWUQryIpPDV8fIKD5
         r8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018174; x=1774622974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=IV5EpKdVBsXNuUDlA13eg43yWwA1GUfhDocyEJ1vIrT6+YruVObgMnB0oc3TsZsCGH
         tGSjZdV+HyftTElw+1kjPDiE0L4suA2WmBaKOobz9OJto2q5gHIsGn2R1jS5WKj/+DLL
         z9s5xHbVu0o+GRsDtHdSAm3giJBrTYDuzpxePyUh3YvDA0SQZJKI7eZrRKFzF4Z0IhvD
         F7v30pTaJJp5n459bENMkfNzlmVv7vs65O+NGIv+ZeahyVU5P0QH0s1/hgAQRwMpr1JK
         gOmKHLiapgW2i+c84u/ylfhtBWdPYCB0TBYlO2HQrGKRyHuHVi6AT0FVoR5K20zvzTO8
         ekKw==
X-Forwarded-Encrypted: i=1; AJvYcCUCaLN+LCsLitSscTK35Xsfhd3a1YUUQN3gyFHvP3EjitFYccqaXLrZcQx5T/jIyTKGFCHmeMg9cFyXhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdi/Rx3Xf56RzztDaAg8nDBYQbz6Az4Ctlk9DnjIwk/o1dh9L
	968BT6rXJg0Gr+KpO2wCLo49IjIqcyRNM2OVM4HSDGlEM6mOoPANgTcu7LmKd2GXxFsdFNdwyZy
	+E5lmYgwrLfnQIomBDooyOjPmbOdINPMI0IcOOMhHz169HfcPg8jDjrmcN3ZRL6s12g==
X-Gm-Gg: ATEYQzww7d0bjGPBroR6ICO2t8POgY1SPGiWaUIGNBY6DbxNDlj9YVS2WaFR/9fTb+h
	4cUsMxZRcE/CD5eGYhKpiX79KzxpQyc/xMwwjW1TIkdkyHkpQyrJMrcVUwiIuX1dkEtOvxFrKkq
	euuNJAfS3BoAt51R42jmzDDjGRuSVwMjVI0t7RufoUk0TDsqXO0KDeM2qdRMcK6HJ46HY1czrqJ
	BR+NDnFc+YfaKF8GBv04yfXToj+DWaN7j4E7YrzA1UBh+0F47XniD2b59gFqOjy0/SyF12zF7oE
	9vrzVxzOrFuszTlvWuYDG4+C94OmNEH3qJiWOJlaHY3s7fg+tk3V/+aJpS1CQ7izbHlX4kUtwy0
	GLyxsIySkA0h6ng/938hz2Xp11HcbMWXbcGsXIsO6JcZTYVX1MAJ3+bU=
X-Received: by 2002:a05:622a:4e93:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50b375d4f6amr46932151cf.67.1774018173595;
        Fri, 20 Mar 2026 07:49:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4e93:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50b375d4f6amr46931621cf.67.1774018173087;
        Fri, 20 Mar 2026 07:49:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Fri, 20 Mar 2026 14:49:11 +0000
Message-ID: <20260320144918.1685838-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vlVx-eu37P-tiHiFkqR44IdxOj0SBCfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX+OdJ87v+y2Jh
 InNmSPsSOEfiYqxvHHMNmei1EiwOZg8lyT80l13CcF7tyxphzXpDslIN535WljnItx+qnW0Ku5h
 X96hbDoJy/REQ0qYWy0mHYzccichBulR36B6gVyFlvmuNHqtqftaiY0JbWAE3+a6ui9KCr7298A
 /z/dg0gdfuF9WksIOJtm2ZqNx5AYBB2tf/8ZzffFm6eSP2ULAXa2+tn6GNU0PVJ9fDuDMbtSu79
 swF6B4xO6DXnFM3EOU5yyvYefHqTVQFBNR8d/lf8D60GGusCdcmKbjOb8zpAbVn+pLGNw+492x3
 Mk73rze7o4sNfRJW/rKdMI2v8Tvn7Xz/SUjcR/v0bx7X7A3bIWmqPWHsJR+l9J6kf8XQAK0HVHJ
 ep4vtBJ99n8MXHtdKUg7s7ETaicxbvtD55uvv+LqJCd2Cx5KIFvdufZugB7VJH6Nnkem/840rFC
 u4XGkotowiDSBE4DLzQ==
X-Proofpoint-GUID: vlVx-eu37P-tiHiFkqR44IdxOj0SBCfT
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5e7e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
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
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

