Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040FD359A6D;
	Tue, 11 Aug 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437987; cv=none; b=M9QrWAivTN7IlUlPrbszZoow8eaUadJnyyneO+B22/YD9czadI4JSQfFvgHtMDgjXfiRLIm2MOogyEs2EYU0EJwMezO2gw01zpOg0cKehKVf7EjztznkNkbZxjFpoZqVsCLkenLTuC6egA1s9NEjZ6Xbhg5Z1xi/6ICNzV5+b1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437987; c=relaxed/simple;
	bh=6r2k2kdtQACexMthg6QXk1oRUQ7Vwa4ymYdWZIav+AQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jEu+vSfJMRQ0j3gNhbrB76FCahWNl/bxUKs1zp/gEQSKKD2GscS9+t5gbZyJJE0HZ+SexhQOshqAXnXZHVr/pgH98ts3pmLTT0FcGbV3IGYjmDDaj6u6vnT/4kgceKfxnIfTqPTF92KFz5AGsxxUEMoOQ+s7kL4P9PDV/7RMwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJ1MtKVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJ1MtKVd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7H8go3008761;
	Tue, 11 Aug 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HsG6S62+95l
	VCVtKoE4NinbQHpUhkLeB5aiDzDZKqVk=; b=SJ1MtKVdPCNWZQnLNJvz8uKFUWm
	1jsI/uKE28Dp2nB/8kyzJoz+za1//NczFwYeazjxvZyOLoL+QQTcAunHdRrM16rw
	6LOTnUvFJLXBEsaZW+VaUhOtMCTlQWoTJYdjbhscgv8My3U/oO8tTVwjcvz0yps1
	q2b+WPunr0clcwSOsj2eZlCZL2x111jkITqIsxlaTiI7CzfM4xL9T2PR/ZGETPeB
	hj/vq8ljFt1ZMeW6OfBghkzxMWT3HHsKlIddGSzWvmExSv1rocdBNPdiw5SZq/ZJ
	bprweufMC3ATMUfb6m/xhh8MJvqqlv663uvRJfruCiT+A/n5Y3Mj/krugQA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjtk7rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67B8iY7X010977;
	Tue, 11 Aug 2026 08:46:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhjtqv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:09 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67B8k9bW012321;
	Tue, 11 Aug 2026 08:46:09 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67B8k9pS012320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 4210F63E; Tue, 11 Aug 2026 14:16:08 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add Maili sound card support
Date: Tue, 11 Aug 2026 14:16:05 +0530
Message-Id: <20260811084605.1820056-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfXwzbI0tUOppSO
 aGiRnEkDASW2WcTbUI5FHFAs5W8cKUVKzg+yrUW3idEA0dL76zekDd03g0UDnc7jY6ohAWXz3Lp
 tGRvXG1sR2SFmeUZtkPmeYDm7WOJIV/vykhNy+PNruoOYb8VNWuLgeEdHmSC+56JS+jDs++MJmL
 1n7gB4AZXV6mxXudFVlC1zUKJ3TeCMNb5RiPbFSCxNlSm4ep3YCLKKFp43yhM0RYwdXcw6iQkkq
 LeW3cPjfROhTmZL7ydB43cYaC5Z8xHTv3CFWbiHNdmPiIU3LEokOwaD76Y1hP1OQCTQDqnp23na
 a30/z8Rt5aqD+DU/DcsFDV79aN5v+7zASxA/Dkv2roLoYrwjS+3RTtXT3mheh3c/OfypzbONd/c
 kZN1XjF4sZ7ak2rNa6U+3dA4VNyDhXQiwM/5YgS09O5h5wuQw/WqqsGiqFzrGbios14YLLWAgDB
 z5fbv3mECmc4CjD5/1A==
X-Proofpoint-ORIG-GUID: kP37tGqg0Mh2wW_uHWHfD3m1P8sy0i9H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX0O6mrnlP+2FS
 +xyoXKK4xZKlxxKj0k6U40/m6EsORAGe3I93c67CL+fdAtI5bVuQ5VPpEWIAOwehIYbrQM4Yugm
 7pzvcu7dUXpDcQaVj5yeNsOImc2NKZ8=
X-Proofpoint-GUID: kP37tGqg0Mh2wW_uHWHfD3m1P8sy0i9H
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7ae154 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=lh-XhUDtuT6bYpdale0A:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110071

Add the Maili sound card compatible. Maili can reuse the Hawi sound card
data.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 913ae81be424..1322601659d4 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -554,6 +554,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
+	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
-- 
2.34.1

