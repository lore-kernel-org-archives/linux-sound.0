Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAB78F3A;
	Mon, 10 Aug 2026 03:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331453; cv=none; b=GI10CAEc/6CcghMDqsttKgn3b1mVhpPV/9dBEAoEE0ZS5bYwAlwaNNnil+kiyXXRZg/GIZtVCQ7Wo83ot4N+aE4s7+ikgPwsurFsrBgT8I761Xsy2/1aeGIynmOoTLU6RuJi/OVlJKREXamWdCBTm4qDDgek9+yBhJmIGS1s1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331453; c=relaxed/simple;
	bh=fK8HnBLQx3v6DMX4Nbt5V1DE5h8gdue7NTN/fhuB+I0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W+TFm0HMnAR+arcUH/N9XNquZoSd5ralJeQfeaADSg/uC85OKcKqzwqOu3jvn1D/OC6sJzpmsMy/isbdRAv+hJBsWaCSv8L8TiYTRTHslL/FR1Pg3i67si+qe7IYdhnUTZq+4P+TGBpDDH3Z6ik4T0P5cLRDjN1oTy6T52C1DjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAgyLEcX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAgyLEcX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L8BIQ3050181;
	Mon, 10 Aug 2026 03:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jqgKkygFwWrQ9kWy4wutoYOIb9aBgOtf65B
	XVYCP2DA=; b=eAgyLEcXhHHsRY/QXADMuvBOk2lO31r/90qmiGxXx9k5R3GRrfO
	h4huWaH4bxG6xdmMiP1gaTINvavqT/XTU8hpE3wIfxwhhv8Z7G3eZuhZ6W6rNSed
	ch7s1SZZHQRQ8fXsKzNItiuj1q3jT0WVwu80SCXGCVTdhICSB/e8ZG77d6Mh+uX5
	wvfCeQHEGl54w8C8jXAsZhjSGxiGO5/7UplbvfcMFI9QdqQa/gvJ97VUJASBq7Ii
	zb+CYXeulrtIyhI4HC2pZq3wP44INU8NGy30JPi1KG4+9NyLqL2EOln8VPnvojki
	bOKnewibugcRSFV9KEDfS1Q/XIEEbiSzOug==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgv3cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 03:10:39 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67A3AbGa019496;
	Mon, 10 Aug 2026 03:10:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhsr59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 03:10:37 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67A3AboV019490;
	Mon, 10 Aug 2026 03:10:37 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67A3AaeC019487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 03:10:37 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 81D3B20C53; Mon, 10 Aug 2026 11:10:35 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: qcom: sc8280xp: configure codec sysclk for QCS615
Date: Mon, 10 Aug 2026 11:10:32 +0800
Message-Id: <20260810031032.2001053-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfXwHS7QxNtUE2K
 L7fLjMFC9XkJV3BgNUMSqfojTJSyM0HqE0eCsk5L8V30fxd1Rz0byhKSjBI6Hr+uRrKnu8BFApG
 FYZpUfe43UelT+NERHt4FOlJMT3m7e0=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a79412f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VgxNshHlH55NMODlW1cA:9
X-Proofpoint-ORIG-GUID: wZBwX8kKSwO83NWKCeOgSO-J162zBjPs
X-Proofpoint-GUID: wZBwX8kKSwO83NWKCeOgSO-J162zBjPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX9DzNo0VdMwZE
 knY5QlQYUvlPp9OBCLefzmWmFKKSkjzPxf0s2OuwmznNqqmiF51hz7uqGD3RBLC/MnHKGfKG0bi
 ZRjf3EqrWCdwhoZUZHWm2Q1blAg8diCi+3B+Sdu+hW8toFlctU6OtC+YqQcl0c+Rpm6dx5Wor70
 S7h3A8ZRSIE4y9jKNfUA6wmHLteYwNihRQKEI4wy/Ye7nSqMfYyd11OSJ3MGRci89Eyx6YRui3b
 w7/1BzTn39NBQHBxO9MP4UHXUxUDrcsJfbgUs74xDbz2WAJAplGGJIcdpFcF8V8bKkVg5eNay8M
 IAjb4CNBJg3k+yHCuJqdU/eKPi5LjHI70GEOs/JTAetWOaIpXakLbsqyaz/JJhMRnyk1ytFa2Gz
 3jEgAkT6u/jtRWuz4njoQ+amJ4Ged0EhcgT78wFcR5oRm74e10zXT6o0MeA3bTgTIXmSXYnzrfb
 k8NQ4toHOkWQkrmzpFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100023

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
v2:
 - Drop the dependency note as the prerequisite changes are already present.
 - Rebase onto current code and regenerate the patch.

 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 597c0d887d2f..913ae81be424 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -462,6 +462,7 @@ static const struct qcom_snd_soc_common qcs615_priv_data = {
 	.driver_name = "qcs615",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_sysclk_set = true,
 };
 
 static const struct qcom_snd_soc_common qcm6490_priv_data = {
-- 
2.34.1

