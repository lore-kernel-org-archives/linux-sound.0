Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8433F44EC;
	Tue,  4 Aug 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827014; cv=none; b=gCJBQIVKg3AWUIkoSWDYJzZn9pVuev+O5VnHl9D7YuOEndatdmqwVlQ/D0nbp37m6J/7P57NuLSS41ye5xHwrOqsv4MyREeB2q8Jpd5vMQzqBc+IEYuNQfI1OPLgsJRl967aYn1ewXvUkcWI/F+P+KxkbubC54F0DHfvxeDXcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827014; c=relaxed/simple;
	bh=LGDjHk0BCCj/2ROInIaOLLeuA7TfQ3QEyxW146owL1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pJk3GpAxGLiSeeNMDECgwPlmVu3tOrG8RB2yr27iYtHOAD8/XVJOAty3l8P7LdMW9Y9LBQQvimcumDsh/FaVQIT8k5xOPUN9pudMCT+vDDsye1lb5Q8YKbyTe0vb5wPfBcE7xjUY75Iy9m+jkbj9BENzpGIx/mUmOfTWNNLjOjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bR1KIob9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bR1KIob9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67418o7o2592689;
	Tue, 4 Aug 2026 07:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jFP0ESmP3AH
	k6hMD55+JgreaP08x/DiuC4NqDBuojbw=; b=bR1KIob9KpucHoCQ5HqdP11BtCR
	K/EmPQmv7p3XJgaqc8QFBjYzJ/bIXy57Ycz51yYHhuZIFhypn5W2cZHngHV7/JFg
	uJf97s3cTPk+J2OVGtoJ3h6+OyAdvv9q6ta8BDpWSwbhn2xsaZlROVKtUFgKji9S
	SkuU0FyZSw8uhjeAawFysOZ8p9ep417WIq8lGaYKsif7JoN3J0OmkfKpksjjrt7r
	i2WVmT06w7hp0s8Pu+iec+ATRzgRZNVsIMuLF+DWOEqaYrgwNc6V+RlSs6+yGBBN
	DEwVIVJnKg4qs538ueXdIzEYDcCZknbknCAHs2dgmxJ2HyB5f5SuMgB3k3w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs1np3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67473GaC031254;
	Tue, 4 Aug 2026 07:03:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vjhjn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:16 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67473FE9031220;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67473Feu031207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 83242641; Tue,  4 Aug 2026 12:33:14 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
Date: Tue,  4 Aug 2026 12:33:04 +0530
Message-Id: <20260804070307.117119-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX2JN5pW8eteLH
 tZ2GOHrrSaOt/+MFVxmA8TxTvXhx02CZhPcGTb7Iil8OF9psYaDFgUegL2NvpexTJUT4aQXdZOB
 bpkCVElObKq8zBZsVp56KOoTwNfcFw8g3hwdil/bGUw+TitOSAMsjy23VHzkbi77Sz5ROdURZQa
 5Jjins/mMo4RTM153R61flBabVX3rCfCJ5bMJOmrnQnI8PffKjIJa0oocisfAulVEQvTck3OWkE
 Seo9qwWZA7S62UAM/C4YHacJX4G/EyUN803cNpGseh8gzlsCJZ3L+HH1S2UgcDluYM2zYESKKXD
 aOxxlipB1JR3MMWmW6d3/IlAWomo9S6l8/XD6IusZInnVP8eBEQDBIMJ4e1fBiKBIDwvgapeXKQ
 oGkOE7L1YwkBthnxiA448srtknOJuDILT/lL7w0LlOp4snoj7iWTprr/fF4O6+t+m85OYdub4Og
 WRK+Qy27KVqWwQGqGbQ==
X-Proofpoint-ORIG-GUID: hTfmVF8cTIWQJikQS0XvZVvDBN7KN7HC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX+cVUMNW0KGXj
 TMBy31zPGihBbcGSW1pjlNx2rD9vrczLZJLURe1laEq+oO1ZfKcTMfl0N+w8YqxNZquiK3MJTN4
 jOwch4wwbts88tkASkzlNjZACbHU+oM=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a718eb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=lFrHCqQP30YjRFDurIEA:9
X-Proofpoint-GUID: hTfmVF8cTIWQJikQS0XvZVvDBN7KN7HC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040054

Add the q6prm clock table entries and internal DSP clock IDs for LPASS
Audio IF backend clocks.

The public binding IDs map to q6prm DSP clock IDs starting at 0x500 for
Audio IF0 IBIT/EBIT. Add the internal definitions and register all Audio
IF IBIT and EBIT clocks so machine drivers can request them through the
APM clock controller.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c | 28 ++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm.h        | 29 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 02dad9ee9804..f613e2aee75e 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -64,6 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index 938b1bfce287..cca77cd92bc1 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -97,6 +97,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT		0x500
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT		0x501
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_IBIT		0x502
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_EBIT		0x503
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_IBIT		0x504
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_EBIT		0x505
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_IBIT		0x506
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_EBIT		0x507
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_IBIT		0x508
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_EBIT		0x509
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_IBIT		0x50A
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_EBIT		0x50B
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_IBIT		0x50C
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_EBIT		0x50D
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_IBIT		0x50E
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_EBIT		0x50F
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_IBIT		0x510
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_EBIT		0x511
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_IBIT		0x512
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_EBIT		0x513
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_IBIT		0x514
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_EBIT		0x515
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_IBIT		0x516
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_EBIT		0x517
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_IBIT		0x518
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_EBIT		0x519
+#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_IBIT		0x550
+#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_EBIT		0x551
+
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
-- 
2.34.1

