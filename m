Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C30C43B3CC;
	Tue, 18 Aug 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042839; cv=none; b=j/9tSEU8kHi5zUGjklSQjtN0sjoYJXQN7tFlwbSfgKhPdnx15kIzXJS5CYO5KwWb5XzEjT6NaYhsypnletDhK9fxQFaX1DIC/BBOkTDnFc0LOi8MaWsnkYmiWwFwYOuykRA+xu2io8jg456offTj8+08lV7WLhMUY8y0OuB1iuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042839; c=relaxed/simple;
	bh=fTRKWRKM/Qi04gKrh5xuflPTGnP5A2qxX6+X6JkDPcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kh0SRz4BL0vkGifoE4YPoKWwfgSy5xfRCtPA38xgaQxwOqC49fq5IURymYfOX7wz3BGcyF0k2gM2aSFTJPcw5sVqT8n/0Fw1M+M8pYwvZprsMkJ+y8Clb8kxmZnL5tSlaAHdav9UMmJkfJRvaK+mcawjWwrDp1OyobrTyKoRu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgEdvLU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgEdvLU4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLm1310033;
	Tue, 18 Aug 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+tZeuQt12Th
	lFbdvu9gDiLjkKnD8RWRYNZyz/yEnHPA=; b=CgEdvLU4HnBFOShiv7qyA2JINxV
	sDga33gERZ9jCNU9NsgKsH6z2uB6JTCAmIbNyYKV7TtUPR24/DLBdF6k5tn1Z46U
	AZvgazO+HI23sMnmbt5GMkpyQN/YWcMR8bLqz5+V1Hpjsg8SqoG3FZVWTpw09ie1
	N9LjYumo4AE9C6LTdGuSTOpMeEb0p1vy1EcDiX5YjxjnHij2PnoJHCZ2cjqwec5r
	fUsWmK+T/QTt/IAKTJzAd/1jGteo81u1nGSk+R22CU61lfCIN9Ireyr1fE7kwdK9
	m0vih1fL1VV050+0YlRiRv91G2jwHBmgcgkMC119IORful3+8gUDClZhHcA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9aka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:47:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67I8kxnO000892;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jq1g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67I8kxYf000866;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67I8kwr1000859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 1178A63F; Tue, 18 Aug 2026 14:16:58 +0530 (+0530)
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
Subject: [PATCH v2 2/4] ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
Date: Tue, 18 Aug 2026 14:16:53 +0530
Message-Id: <20260818084655.3240284-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX87QamukzBHdW
 MAY0zWvwL/GxIempzEHi01TtF4637KugN3ltKmt2C8FhFi2lhh1CMFQld4AKEztRHxU18hHHIYh
 ZbqK05yPmyWtDBR78B1PmyIceljUYzk=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a841c07 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=r1-nxkMR8lvTQK0_ZwEA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: g1Cz8jwJ852krFRF5GIsIvHweNOFzX41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX6PgW8d6SYrqH
 97bJW5g/XH+8ivoCwTeVo6OyQxpAztner4xYjgKwgDTT5q1gU83asbdENvcc+NHq51ya4Nr6/Vo
 9gQC4w+WKfoT0NOJPISFxCdoAnlmNJf9xeiAuAPCBFQsL87lM5/zBvvdPycEGk4ku2BOasUAS7C
 95T17FpTCl1VpUH+S+RLHUKYRh3+0E+I1QYYi3fXkyPEuoeBVuR0Ea2A16rUhFkh3R+iwIeqynD
 Kbd0OomSA6CXh5etNuaDKW6GrQS6TW71y5Q7E3cpoQ3n271nvqIp3ovp+f0nCZT2XUefjoTO/m0
 jhG3C4WevirCxTW1ha9prFJlU+sqb42toT2AhKNf/diQPD/ULc6u4p1B9dwP31gDVyvksPGPb3D
 1gqCAZ3BtWeBmDmYtUowEVdy49molanKY1WhprNiW3Ey3U44EF5kWNATGyq72dRO40mP/doOhZM
 ZEDl6nquPeauHaXXyrg==
X-Proofpoint-GUID: g1Cz8jwJ852krFRF5GIsIvHweNOFzX41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180064

q6apm_dai_prepare() and q6apm_dai_compr_set_params() build an
AudioReach module config on the stack and populate only the fields
needed for the stream type.

Audio IF media-format setup treats zero slot_mask, nslots_per_frame and
slot_width as a request to use the topology defaults. Leave those fields
uninitialized and random stack data can override the topology values sent
to the DSP.

Initialize the whole config structure so omitted fields reliably retain
their zero/default meaning.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a09f4..033197bdd870 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -216,7 +216,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	struct audioreach_module_config cfg;
+	struct audioreach_module_config cfg = {};
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
 	int ret;
@@ -814,7 +814,7 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	struct q6apm_dai_data *pdata;
-	struct audioreach_module_config cfg;
+	struct audioreach_module_config cfg = {};
 	struct snd_codec *codec = &params->codec;
 	int dir = stream->direction;
 	int ret;
-- 
2.34.1

