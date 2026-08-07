Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4C4B0494;
	Fri,  7 Aug 2026 01:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065910; cv=none; b=KaHmn18I/L9HOkESf1aOSVK/nbDRmcki/FOzfUeDU5navaQ37P8ETFJbvz09igkHOlIxu+MdK3rH665efe/jLbhP2OUySuwenMn36KiYC6KSN13POoKEnyletDC6tRPwqvTGzYYoTnb3GGMGyBYjapmnLPk+jkON6HCM29jPVKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065910; c=relaxed/simple;
	bh=bnWd9LrDId9Pwik63OJcEDNiVrd208Zmx7mpbHmSQLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jzcQr5GbWiUfm3dd2froKCfqd9AMtnobJ8KBQWrbQjjSu2jFZDu0hlshwHDNoJUo1QLtQP8bX4JQMRUO4+ge5sQp217GJ0TskFj515zeas8g6qPk1N9ideuzAz5z7Hun/PDJYjqnmScTLc3U4vo6cnao5AnkUatevibq7ttROP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMCJSVr1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMCJSVr1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gftj4063303;
	Fri, 7 Aug 2026 01:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ud/w5WdlhmCptNNwsOoZb7tMUctCGHHeXYd
	IRJasy/Q=; b=EMCJSVr11qO+605av+n0hGxzCyxKDiWwHVkD3F1qTMdUZ60WBQU
	vDuF82nfbBMpRlSIKzaC4aVMRmB5KgtfG3xkwBleP7BvRa0tnuAsXYtIenKt/WOm
	KqHUSVulFOAQLtYvxHue9t/8DhMuGuWoIGigBEvrFoSAgcnSmyrjKG/DExI8t01y
	f5qE69p+Zv4lOdxrcgCWk9yRg+8SQM+9QWjnfziNCGo5+WO4BKhGliuDe53D9lR/
	+w1RPn1iKueDwtO7nG0zvjqGAXqESbgaA8XAJVW7xJtJtR7Y+OcxL+duz27DU+d0
	4SLCYmzY5lFWrULzHXzwakopeQ1X1uA1NGA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h9h80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:24:56 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6771Os8Q024372;
	Fri, 7 Aug 2026 01:24:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fs9vknts5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:24:54 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6771OsM2024364;
	Fri, 7 Aug 2026 01:24:54 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6771OsIB024360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:24:54 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id D83D220C26; Fri,  7 Aug 2026 09:24:52 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: sc8280xp: configure codec sysclk for QCS615
Date: Fri,  7 Aug 2026 09:24:50 +0800
Message-Id: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a7533e8 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VgxNshHlH55NMODlW1cA:9
X-Proofpoint-GUID: LbbXvasDcKw2On3jWFfHql4wO7k0RYb1
X-Proofpoint-ORIG-GUID: LbbXvasDcKw2On3jWFfHql4wO7k0RYb1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAwNyBTYWx0ZWRfX5Uotuhu20Mdi
 52fH1/mdeNG48ph0h2zxtYjIjWQBQPgznqoDDb6NjPxYofurj/DWdeiR7Fdjy+/Q4eRqKSQIB3F
 ePcfYVisHymy9WtvD4Sb6GM12f/N8Pk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAwNyBTYWx0ZWRfX/B/ophE/tFIr
 UJhzL2jkq+yqpOnupdtcO51Oqq4DiGgNZ5N6GcZ1M+B6Vqd3YF9wcN8+gLDm9LtYFaYTnQIfga0
 NZw5dZ2xiUg3vOfhyeiRq97Z3vWenDOUfF/nDG3Siqj8qIU+nLeGZL7+oKCl80wtOOBhznFW2KI
 UzzRDpm+64Uic1LuPIzcD6Ws7VuV7HPS/vtZFdeWJ/LtfixG2Sh+FY/6zaxZ+XAG6k7y4aR0+he
 9zlbeiE6oSrot3KWEE+gQOrlP8TTE4a7Ub1QKIpGjxYsfg0/ADeOvIWfoMmIZTwFQDj0LaunKrl
 aHK3K7vVGTekIHLf3rnqCs9IoyWYNhxT0UOPL5MwyGH5tKBWueZiaZnpl2kavgtkrcVGdgj/gAW
 +pxhFBXdr0xuCCT+8ysvtGkcxgkMQNIRCoDpK0wATo8plPZWAcfo1VdDmYGoVYhIHUOuQam5IMn
 YuUktn0yiNtNNom5Rog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070007

Continuous high-amplitude noise could occur in the DA7213 microphone
capture path after a Bluetooth out-of-range/reset event followed by
reconnection. The noise was present in both the raw ALSA capture and
PipeWire input, confirming that it originated before Bluetooth
encoding.

The codec already obtains and enables MCLK through its DT clock and
bias-level handling. However, the machine driver did not explicitly
configure the codec sysclk during hw_params(). Enable
codec_sysclk_set for QCS615 so that the DA7213 clock source and rate
are configured before the codec power-up sequence.

Verified on QCS615 Talos with repeated Bluetooth disconnect and
reconnect cycles. The noise was no longer reproducible.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
This patch depends on:

ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

Link: https://lore.kernel.org/r/20260727151230.408122-4-mohammad.rafi.shaik@oss.qualcomm.com/

The prerequisite patch introduces qcs615_priv_data and the
codec_sysclk_set field used by this change. It has not yet been merged
into linux-next.

 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index cf272d0612fe..8d949e4dec5b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -306,6 +306,7 @@ static const struct snd_soc_common qcs615_priv_data = {
 	.driver_name = "qcs615",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_sysclk_set = true,
 };
 
 static const struct snd_soc_common qcm6490_priv_data = {
-- 
2.34.1

