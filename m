Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2CA31960B;
	Sat,  8 Aug 2026 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213210; cv=none; b=Us8mavMVJV/J7qGYOOzZU1SOlQtGdr9PBwBMxQOFAWPhARckDQXucKSLrjRLlcFUm9/0boy4aDE90PocemUaV3O1vUK5l/3JYQJOsB8LAvPjEk9/UuCMfkSpu1BEa+ojyzJxLdOAUxl8DwdaRS2xahLS4+DDyFGtkQQLtc4Z4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213210; c=relaxed/simple;
	bh=fTRKWRKM/Qi04gKrh5xuflPTGnP5A2qxX6+X6JkDPcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ph1wH9km7aqD5eg50o7MNF3qyjm/2sp4hmqqEh4zpEXO/szJ03Z/XDj/HPbHLY/PvWiQ3bDOeqfVmz1uqCEMwWjgl7qhbuD3jSUkfGTzUIia56qwxP3HBXZbMtu136qlzWdC0b9jG04aK04eYj/5U4918R3MJBQrF+yzDcPoIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdCz3tLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdCz3tLL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GnSG4902348;
	Sat, 8 Aug 2026 18:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+tZeuQt12Th
	lFbdvu9gDiLjkKnD8RWRYNZyz/yEnHPA=; b=LdCz3tLLQAup6Lsqy3hhbSENnSy
	NLSdQuGPotiy3s69/Uei+V2navAlqfbpSO9Zilg+HbqqU7/8Fn4TDIXnG+hNbdp8
	YcyYMUZrTxtuIP0Umg+w28o5x0Eh0yxvZRFp+sUK0wDE1RvAeQiNdcq+zjs5ZDNd
	OkNJVzyadz798P+rUw9gOJW9kS4ilZTP5Fdjmwjazm6sTpSQYj2HfcZ3whHxcFGj
	RziRY6Z9nYVJfo8/Hc1ndAzw93FfCDT5qDoNsnZw56xmvChd/wzhlr8GYMGOsKut
	0HwqcEIO2iEUj2TtlbbsM8WwJfAPIN25TeJXhfWvgskuAVg3XYN/6Q+QQCg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqhjpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 678IJqZB009363;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhhg13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 678IJqQe009337;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 678IJqKU009329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3773AC09; Sat,  8 Aug 2026 23:49:51 +0530 (+0530)
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
Subject: [PATCH v1 3/5] ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
Date: Sat,  8 Aug 2026 23:49:46 +0530
Message-Id: <20260808181948.2489187-4-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX3xyEm4TE/8+C
 TTHzjRfyKZL3I2vOTt4WcmjqcEbw4VCMHCtV4VNTi92l7XnoRG6jRqAX9CWXFxZiT6IgTTYWtev
 IwML5g4ace3bUtdFqf9HwGfwcae/CG4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX2G1DPbDRrGax
 5rNpUW284n6SypQjqkLiyaciPZmKuSi1aZgNzoF6hkuatNt9k+FtlqSKBB9XudSFCGwX7kizky9
 OHszIrcsI6QOVUsmTVsH05MyxmDN+mxrnvdqbbytrhIpVMRX6H3idaPMD+jWjij9xnHTyRfN3q8
 hdAEQ7Vact4w1bdb1vFtpldb/2SZp+Yll21s0sKvBQKjBTSlzmGguneQjEN3eggNfCjnC8IE7+/
 K92bAa6XXW6Bw2c2sJTQqKWVwiRNOPqy6OJ2ttktJj4Wfm6qO+RQUbfCe7NiTFAVIko4nLezB3d
 xffkwDZDI5D8+C/qgXIocdP8jXNGke6h+Uc8AGOJjvwjiOKHbSg94NO7L728MmdEG1q1gTgV2FF
 AHUN0THupzG4SPYmkLVlz0AmyjhCeSP8P7S+04ymaovT7wtIjBLa2VqwHcCX6krgBeybdhdJGln
 9h5UcyJ6BUccLotlndg==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a77734c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=r1-nxkMR8lvTQK0_ZwEA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: FRkKP_736zv6oVoK1oWx5kjzDItvb8Ib
X-Proofpoint-GUID: FRkKP_736zv6oVoK1oWx5kjzDItvb8Ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080157

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
