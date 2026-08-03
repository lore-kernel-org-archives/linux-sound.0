Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD1F3A3E98;
	Mon,  3 Aug 2026 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787003; cv=none; b=IkH4/laMNQP+XuAJI9mfvakzjqvrOSvU4J+XwOvyplbvZV+d4rOC9v74OnVytj+QwwUk3oy1r2ROMbXFbAS7SZRKSCpEWmqcE2CRszb7zoLLo+faLoJYRMuu3012fpuRngz1szsJ3DRMF34b3OhBb4kt4xs2dEqUqCfdoQS+MUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787003; c=relaxed/simple;
	bh=/iv5XxS/3gFpnigOaB4DtAv95MORN/hbX7CcjMPJckU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kG0o3KV/vQaUot14C5uE8sream7wbuXjwvCNyjvN2nkfg/mfSNp/4dfXbIrIu6OfntuX83WL9z2uT0YupZYSNenwNxYZfnOC1v0C8FGQZpi702tmNijkza/REx+YR/11ojCblaRcBDhfKmeo+cWI0henN8qEKBaubXK3709S9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKhZF5je; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKhZF5je"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkcNX1405240;
	Mon, 3 Aug 2026 19:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4PAHR7ItQG
	9/+XFtJ2wMEtPFTKj2xYblRf96V5MB7g=; b=TKhZF5jeOCd1z3peOd3U4qaHdO6
	clWtWNU/Oa8qYo822QZYhuuVcPMya9/gtldx1pDlF1oExQscErW/v2B1z6cA/qp+
	pEGom4zNyNHUkfrC7tmac8loUZLkxBFU/jyeBZ9IVH1iQa0Ij6o+wMJ8gHQSplUw
	fT2X9bmIyHeHWnNPPreO7R6MeJ2t6JMG+gJ9+xjyvvmr6nyJkAjpjmTKCi84IDIf
	Cl/TOJMzWSdPUQz37PS9j2JJm3TjiwaKmGOIhhtboXfJEHUpdGOdTyk55pPv+uPQ
	lSYJyMQkJNox2wedukv74LLk0Ez4vl5GcikPMr9wbjhe7Y+4QANnGCcVtVw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qgrjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673JuS7m016737;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vj9wup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673JuS5Z016713;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 673JuRGj016703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id E0EDF640; Tue,  4 Aug 2026 01:26:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Tue,  4 Aug 2026 01:26:20 +0530
Message-Id: <20260803195624.3606352-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: j9oNHSoYccu_4mg5YEel2uhRh_uZdz2v
X-Proofpoint-ORIG-GUID: j9oNHSoYccu_4mg5YEel2uhRh_uZdz2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX4NY1z49+ZurB
 XTPsx91VQSfBCl5dU+ieLMxnTs2PQg+YxSE5E1V82Ax+5UUtjdIgqmAnrjtfmkdm907eDGQNPzL
 RgA5gctNmiqBy/DFddSPdqzBdgDpTTrTBYidddDCzIohTPPqAfKryWKqN5QBqfo3gPT2BE7p2bi
 x+VWNiaRuYxuXoGoxXhz3UlLSVvuuVa09vbwnoPvyoa+saGsPLDQb+T6QQ/M00chUtDyOS4FdNf
 DbcPXPkLVKtFSn92/hkExNkNGw1ABgwnl7VJKRpAzE2IKJ7DmdJKVpNkXFcmmMTm36hUpmsmzj4
 TZRqMtc8rZSSm3GEuBWAED92cA7tXNmTskrUuKFH+qfT6O/kOYMUr6/mV++B+kaC3Gp5InIV39L
 CNuo96IdW7hLseE6IcNt5fGlvfpDlf7sJ1f58erkaADi7hNqn72j+mJwZD2lOVhWGhpYYTQArhp
 6GKFqTXIBZNQp1FOXXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX8QaCYc2MTmHl
 t2pvxXjgdKl5bMyI5PdF2rPGDWM1YE8y4/6zQhKMXIo5ffkhxINQH9RJl68Gl+SyYIS1unaKmam
 C/CfgzN3F12hArnguxjxWmmL6lCY14M=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a70f26f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Z2x2jAe23Y4aVj-ete4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030176

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 7b553a73bc92..dfa79da5c8e7 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -233,6 +233,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
+#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
+#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
+#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
+#define LAPSS_CLK_ID_QAIF_IF1_EBIT		74
+#define LAPSS_CLK_ID_QAIF_IF2_IBIT		75
+#define LAPSS_CLK_ID_QAIF_IF2_EBIT		76
+#define LAPSS_CLK_ID_QAIF_IF3_IBIT		77
+#define LAPSS_CLK_ID_QAIF_IF3_EBIT		78
+#define LAPSS_CLK_ID_QAIF_IF4_IBIT		79
+#define LAPSS_CLK_ID_QAIF_IF4_EBIT		80
+#define LAPSS_CLK_ID_QAIF_IF5_IBIT		81
+#define LAPSS_CLK_ID_QAIF_IF5_EBIT		82
+#define LAPSS_CLK_ID_QAIF_IF6_IBIT		83
+#define LAPSS_CLK_ID_QAIF_IF6_EBIT		84
+#define LAPSS_CLK_ID_QAIF_IF7_IBIT		85
+#define LAPSS_CLK_ID_QAIF_IF7_EBIT		86
+#define LAPSS_CLK_ID_QAIF_IF8_IBIT		87
+#define LAPSS_CLK_ID_QAIF_IF8_EBIT		88
+#define LAPSS_CLK_ID_QAIF_IF9_IBIT		89
+#define LAPSS_CLK_ID_QAIF_IF9_EBIT		90
+#define LAPSS_CLK_ID_QAIF_IF10_IBIT	91
+#define LAPSS_CLK_ID_QAIF_IF10_EBIT	92
+#define LAPSS_CLK_ID_QAIF_IF11_IBIT	93
+#define LAPSS_CLK_ID_QAIF_IF11_EBIT	94
+#define LAPSS_CLK_ID_QAIF_IF12_IBIT	95
+#define LAPSS_CLK_ID_QAIF_IF12_EBIT	96
+#define LAPSS_CLK_ID_VA_QAIF_IF0_IBIT	97
+#define LAPSS_CLK_ID_VA_QAIF_IF0_EBIT	98
+
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
-- 
2.34.1

