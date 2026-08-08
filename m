Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5139CCEC;
	Sat,  8 Aug 2026 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213221; cv=none; b=aEtLA7pWeZ/ArqtjItNwrATBTLEoAr9RLOSLkT3w10xMg9D5EmCfc4nLtVxovupXcN9JYMO7AZyo/qr8CzOXSZ9wnsfaTP/bHd7nw0NaiOe/OoKFpy0Q8wujbeXAc1wQJvoRJFMod6V2yqmXXF9a0hB7w+L/CLBhz3g/7Madxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213221; c=relaxed/simple;
	bh=qJZHUigWnnDtnWOCw9hn1V6xbcRMLvCsBkvat/etqPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HaZ6e7nF70+k3U1Y0XhnL/LiHzp4pKHzk9xhFCPiNmR7hqeFrT+XQRFg0oANgAjEG25jDYrsGueVs9K3AJWDW77LYSMvBWlMowPIeN2a2HwEVW2VlktEhNNdmYa+9c92hm+dyLpjd8bbrmTq5qSGCM8WW2BtiWdbcSe/i/RfLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2Pc5qut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2Pc5qut"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GmKUq650999;
	Sat, 8 Aug 2026 18:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z9EdtSuZoJT
	ZPR8GTaqDU2RmbDXUrhMYo3jMydtPHDc=; b=Y2Pc5qutLSjWKuP8puzN7b6ab3o
	fyNzuPaRGDRrBZqSswZOV9q1COEm6lJuMLW5ShJs3nx0qPU5b6UedWPnyv3a+TGD
	7o3SufTt93HW18IkdA1tQUx1ZtVG/1n7nWcjbP9PDHd67osAsTTKuFJkzJF7cGs5
	0eWxuwhjdKQIdUn9t0g/rXGSCQhzk4I98bdeeOt4w9qrsBX8nsvVhmXb1MvmEpNE
	rf2hhF579yBxf0wI619H+Lnut9p7egQsmJkAtpbroJWfHNHxZG3g4quOfTWR/tWv
	7wExDQaLgzDhbBD+ShIKgU0gfk5pR4j42oBjv9/9UVDjN7Vbt3iplZKXdvA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1y9h4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 678IJqZA009363;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhhg12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 678IJqoP009336;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 678IJqXY009330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 31D74AE0; Sat,  8 Aug 2026 23:49:51 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo
Date: Sat,  8 Aug 2026 23:49:45 +0530
Message-Id: <20260808181948.2489187-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Tu0Rrf7zpa0ROSZ67wkgBskeoy9op8Q3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX4pnEcRPW038k
 tZKXeCJLFoEURUt03qZpyA2PfJ0jtE7fwf53X14Q2jCpgbdeMTHZbUAtKlNPnE50M+deLZiAaq8
 nZG5yJk7IwTiOJORacKrItw+IjM3oJLjtJDFDvv2fylsTMKzYtQTRWT6WvGWYAjR6uDmzDLrP8M
 0Hx47YzI4+pMdFt0o76zmfDMoou7oE84tJXvPsp/n6DJNsgr47mGW6CgnheaqZdIw05eHyXL7Bk
 +Rsek80JIf85qqox0jpR4PCi/5WCiSj142lk/l7Jhob1XITOWdLQ2OX+9YTXzxBjlPZoTpKrqI4
 rr/QlMwg7HAo4UxUGUu1BmxtA/FvVZFoyJ4ya/x90mxArs16i6B9/JmldeZAAEsObDuXKPbGMS+
 7tHOfMaXBeq8L7xIZlHaWtQIyZPfdLTpl8Q8nvBv8bu7gSLf41vQ6BK7inHJIVj4GvVE53Q9CC3
 Ol01eoc/Fn5QrgBPkAw==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a77734c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gGD9wzK1vCt4N9q3sOUA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX9vbnHzLr+/Yz
 mj1HPd4rAwizrdXxmx0hmeUOHVIe+YPnhPNmHYyvgxK0G9wQb9dr2DI5ZooIaA2Qh7F3dNjj+dU
 hxDFDZiXGKNUHfHFgWiLPNNVVZgh+fs=
X-Proofpoint-ORIG-GUID: Tu0Rrf7zpa0ROSZ67wkgBskeoy9op8Q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080157

The Audio IF QAIF clock IDs were introduced with a "LAPSS"
prefix instead of "LPASS".

Rename the definitions and update their users accordingly.
This also fixes the clock names generated by Q6PRM_CLK().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c | 56 ++++++++++++++---------------
 sound/soc/qcom/qdsp6/q6prm.h        | 56 ++++++++++++++---------------
 2 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index f613e2aee75e..b4f9abbe02cb 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -64,34 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF1_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF1_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF2_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF2_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF3_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF3_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF4_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF4_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF5_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF5_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF6_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF6_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF7_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF7_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF8_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF8_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF9_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF9_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF10_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF10_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF11_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF11_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF12_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF12_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_QAIF_IF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index cca77cd92bc1..cf619ef6561a 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -97,34 +97,34 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT		0x500
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT		0x501
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_IBIT		0x502
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_EBIT		0x503
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_IBIT		0x504
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_EBIT		0x505
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_IBIT		0x506
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_EBIT		0x507
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_IBIT		0x508
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_EBIT		0x509
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_IBIT		0x50A
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_EBIT		0x50B
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_IBIT		0x50C
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_EBIT		0x50D
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_IBIT		0x50E
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_EBIT		0x50F
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_IBIT		0x510
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_EBIT		0x511
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_IBIT		0x512
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_EBIT		0x513
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_IBIT		0x514
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_EBIT		0x515
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_IBIT		0x516
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_EBIT		0x517
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_IBIT		0x518
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_EBIT		0x519
-#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_IBIT		0x550
-#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_EBIT		0x551
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF0_IBIT		0x500
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF0_EBIT		0x501
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF1_IBIT		0x502
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF1_EBIT		0x503
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF2_IBIT		0x504
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF2_EBIT		0x505
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF3_IBIT		0x506
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF3_EBIT		0x507
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF4_IBIT		0x508
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF4_EBIT		0x509
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF5_IBIT		0x50A
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF5_EBIT		0x50B
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF6_IBIT		0x50C
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF6_EBIT		0x50D
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF7_IBIT		0x50E
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF7_EBIT		0x50F
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF8_IBIT		0x510
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF8_EBIT		0x511
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF9_IBIT		0x512
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF9_EBIT		0x513
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF10_IBIT		0x514
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF10_EBIT		0x515
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF11_IBIT		0x516
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF11_EBIT		0x517
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF12_IBIT		0x518
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF12_EBIT		0x519
+#define Q6PRM_LPASS_CLK_ID_VA_QAIF_IF0_IBIT		0x550
+#define Q6PRM_LPASS_CLK_ID_VA_QAIF_IF0_EBIT		0x551
 
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
-- 
2.34.1
