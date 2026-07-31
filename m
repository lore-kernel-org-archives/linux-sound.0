Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF545FFC5
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515198; cv=none; b=XqTI1jlnrsVu5YF5RVd9TbrcfZovtRSeSQTls1+DZOlL4aEFHiNFBzbvQmlY94ANxEKZ89ajAV/RFKkJBjbn8V75BC2kqV41I0CyldRIbBTv1PDmXGEe7HNj3vqML73JDhVan+MQKB/R9Fys1fPtaNai/OZ0c1krRrFgOZA5rrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515198; c=relaxed/simple;
	bh=ztWjHXYGQafW0eAjXikRdD2g9p7GDqI3ozXvSSMtAUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6d6t7lB1ujDjyyWCtbORtQ5VrpOOTLqAzp6O6TPk7mC4gkvf69xJw9Sj477Y6ArWQzuYWovZhvdBCeNPLzDZlJgcedNWapb2+MSOX1Fi9sZ6MkivaUh+Y3gJ13HxFptZbsw/LHxoMKjcLSvn/Mv2d+zT0VrNFHd4hhfiM6WvPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DagttHIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUvCNcox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DagttHIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUvCNcox"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOAIR3879461
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+kaJqRzjTip
	e+rj1+H4jUvUMfDcTIy0qQD12ClIWvpg=; b=DagttHIWZkFxTuBW8rPdIZQIwxN
	pTfMkN8ua/aezvvk+gKCXHUqkw14y9zg27xtBALd3RspY80Szn4M/1YDgJ3kfkQs
	95eP1C2XJE1scC5VjCz9AXGMlwAHWIRFphbTssGOFnW+onerOxzeBgu2zEM78665
	GxkwNDTWbhusn24cHjxNNgNOdRsIljrz4nvHBJ/7r9Y/VX0LhkS3QbAkPUsIC3WX
	tUTnaGuq+k2KFrlWu+sZeUfbgaJNIzTOFkwSzvW82Wu1FbvgBmo8l2GDPSUcQhE0
	8GhLPhvej+WfvYpF4TaSvAP+WFUr1ZLiwY246XfAXl2nWK4aowsvd2KetXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y175e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso10935261cf.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515195; x=1786119995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kaJqRzjTipe+rj1+H4jUvUMfDcTIy0qQD12ClIWvpg=;
        b=CUvCNcoxpuIy21/8dy2WKIJyuqv/yE7Ius7V59gfcZiS9irIRhJAUPmgwHALFgja1M
         Nol9jdbmV4bAL/mfrluE5fr5X+M98jtZrhQ1+X0rn/20aYLESBzFRs84KMINWxzV2nEt
         SkxghOSDY7o5o/n+lTD7LK42+Q13LZHkLtREtEntIjs4jBwS30fIc7f9enxM4pWo54M5
         168yqe9RBsl34TlvPSvxFr26nDam1yjx7lg1Q2SthRx5Y3Ya+t3DyligaTWjcBsFa3yW
         sC2mwi5vj4lTbsnuKaLl0NyRDuAqcnb7u2+s30hAHGTcn7hbsZNdmen/cF7K42qHErpz
         Kbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515195; x=1786119995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kaJqRzjTipe+rj1+H4jUvUMfDcTIy0qQD12ClIWvpg=;
        b=dXETx1oUhA0TKKlV3DQxI8XvwO2jGtYm8LiWcOOoDCOnsL/qTuJx4vac/IUasZ9DxH
         6gk4x8/qgOvfq5OLjrexWgv13llqu1ZFXw/dTzZBB1w0QaAoGl7jSTMt0JmvZUHQXqfe
         2+R5nk5sNzws6fWCxxKXCJmXmkVBnGHHautyWp48Ubpk/FmOC4awI0uqV3TdJfmanrLn
         FADbaWxybCtMbTYa11e2A7GLgeaIWvUIhebTrvkkWHhTxoTS8y83vpcV9ptX/dgpt0Dr
         YcrB7lanz+nnVvUAbApuVGktQuYiOMVIp1uqJIjtVSZoGHxVIwIIlVnfEYAuwxR1c3GA
         /hIA==
X-Forwarded-Encrypted: i=1; AHgh+RqF79y7zLG1bXjnH+YccAsOaS7yx3MlPbvrxtx1J8IC2FHmrlZDtHbAmOVcjuG+ZDAaeGlpdZHfDUx53A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYM7dCdC57orIc2/GjWoqk10Y86hPwVQUbWRJ7MXi1PyL1qRFd
	qLRkT3ujePEP/lwtUI9lHfL2kXiIvt6oCyC2usrDYr4sOBolaiWFsg0Izbx4OsvKtBqLnQYVtoM
	gQ19RT7CwmdcejXAKJuqWGt99bKNiHeUhIWhoa48mpVGQzD/YBkSQsT0vyqrowbcQww==
X-Gm-Gg: AR+sD12HTx/jGMYfG1Q+tc01IvBPSyL0/sGLyHLXnRj7/53589XEDNsYk09UskcwfBQ
	rS7FG5KLRSlFc8DA8oTCyVnI7V7tQIBlME5fbpSzsrwtzMxfgDzmneYnIynHFO5FzV/PXuvbMJV
	+GZ88bWdoTrnapKM4vXuyBzC0Wl/wxh5luzVCAAjJtP9xRRwYCyB17P6ZSKb8rNp7Ednv0I8YwC
	1EoKBCvy4pVR0nYPcb85FqDCEBczXZXspXoht34D3o5aHf2Fu7xZYdWVdbm/vbd0PBnlXNhuZfJ
	q9PxxiFaxkgsPp20PW29LlXnzBgIptZM0s7UGtoTC8am+jBmyLhn4ZBCp3Vv8AdWeka0R6CQaFJ
	B4Q5pCI3K0Wl63g==
X-Received: by 2002:ac8:6f16:0:b0:528:3b9b:4f53 with SMTP id d75a77b69052e-52b566afa65mr18723691cf.16.1785515194993;
        Fri, 31 Jul 2026 09:26:34 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:528:3b9b:4f53 with SMTP id d75a77b69052e-52b566afa65mr18723301cf.16.1785515194588;
        Fri, 31 Jul 2026 09:26:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
Date: Fri, 31 Jul 2026 17:26:24 +0100
Message-ID: <20260731162626.1588561-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX8ImWx3zEM5T2
 7ETTTZzS6bFv8v9D+lqCyY2mdWf23//ZjQLD3fpJTGrBgJHw6BZ0pbN8m85lX00qSUOnXUpMTCK
 cx/YNZ2NgKaFoFQ4uMtDCp5cX2whMBI=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6cccbc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=FqzlPtS7hxmnnDEetaUA:9 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX44Kx3SQAwi4b
 Njw15fqR4rQk9WfQCWRLEdzKtVdzJqvJECKtOxvhrndgF2wazhlUC993VC9Z/6MhdzHY5pK72KZ
 d/RaZt5f8SY3hD/8a6g5vvdiJDUrMQSKstIggIrlzS27kmhjIpmg0H8zkwTSTubtcX3Afxh9HXC
 p2voIBSU//7RvbVLAbRA5+xemYg5otkcQpI2Gp6Qb1zWu1W6k3QnBCmH5+PDg86KtgbBq1LXaVx
 DXNZieyX18GRqlV2LmJxFk+d2a3XRFAqpUIa/x0PAjBB4Lvf0SMij94/c3ZmOzNIrOW1xCoen6A
 +pxxYH6el58jODXzRhiO3A9Xv6mLTiY5bEn0P21iabzhVzSN7S3Fmgz+C/PxNg1LXuiX3yPEMbZ
 pvaPpqmpNZVNgMhZkaeOCVQMVmFCU3kdMwIqbz6pE9F/aO1kA2tWzcg2tk5cKcaYYm8TkJ4rTfz
 UCIOk0xgMxMqVzIXpjA==
X-Proofpoint-ORIG-GUID: 181Q_OUIG0MVDakBRMMd1rE21ttQ8teu
X-Proofpoint-GUID: 181Q_OUIG0MVDakBRMMd1rE21ttQ8teu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

From: Neil Armstrong <neil.armstrong@linaro.org>

Add the missing MCLK ids for the q6prm DSP interface.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
 sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48ab00..51b131fa9531 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index bc5b9fa13283..1800b997722f 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -55,6 +55,17 @@
 /* Clock ID for QUINARY MI2S OSR CLK  */
 #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
 
+/* Clock ID for MCLK1 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
+/* Clock ID for MCLK2 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
+/* Clock ID for MCLK3 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
+/* Clock ID for MCLK4 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
+/* Clock ID for MCLK5 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x304
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 
-- 
2.53.0

