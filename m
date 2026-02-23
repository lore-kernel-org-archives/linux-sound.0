Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0633F36E
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870088; cv=none; b=sUh1/h7MNww53vyRuqE3Un/51CoMVzlp3/qeVZewTWjkS7XYlXmYyiPnNkn6Aeah7pa9RPCNdTBHrvyY8ZrFa4MQGHJeY/XLyU85gBVXPlSq+GL7MwR14r7MHTCOv/aMif4gCOvyq9zdjcEeKihraLgOho0ymlsDOenGk+fDRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870088; c=relaxed/simple;
	bh=7a8FeAvNk5/WvnNq5f6gPOGdPG6W/kpZ8BVaxW/g9Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuZEPnXNAHMtn5AoMG+M0t/+TOJmWnfRmGeNnKvpsxUjbJj4i4oCnZt9Fgs/Onh2FntvTGpdp/iTQWhvlnRg2NbaMVUbxwZFf++Qd0TUHO/pwSkz5nJ0Z88OXv4eHjr142CSNWfcc2nsYbi23+upqBI9LQWhzKLVXcYpyKArvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YM3292cg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESirJL3t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YM3292cg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESirJL3t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NI3R9v536337
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gsm1SwBtjf7
	DAueGLWMEyiZtda9HtqsqwTa4B2zHbb8=; b=YM3292cg2BAWgQ40lPIoDXbX0tl
	VZbDk7Rsf4VzpcR07tSC37mnnX2lxhw6q84jgATr0rVqU6IQaJ1lKyTdiR9h8Wv3
	7wMTDSu8sYwDpy5oMkXb50RDH923ukTVRtCf/f6aPaqv2dkiYYQv5+NS7FB7BlvZ
	+fMLypPJpKvuvikI7HhGNiRWS2cDHckZVU+6hw5Ljek/wTwEvOz3Nv0/Kcuen1Ql
	SFwjRAliu5+EI7sa0OEiGC+jgtycLGkRnsuBQdpO7Sv/KX+I/D0TpsgHDaIB+mZg
	tV2oT8DWX/cCA9ixh+2MQarnjtQPyL8LnP5efOj2eNtVSwy+08nY5EuXw3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9e9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4817f3c8so3913596685a.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870086; x=1772474886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gsm1SwBtjf7DAueGLWMEyiZtda9HtqsqwTa4B2zHbb8=;
        b=ESirJL3tW633dJFL+JnaczQ38d2DKNjqh5xF9HB95OL27s1LRio8M1vAFpCCQ8ixve
         wqdZ+4rn8ds1nYZ2dQBKnEUUHC8+at/ZTc2z8a98ARMtrQ2RZkFkZJ0NLEYrF6BDqzsM
         G12k6C8XSylNGSyvbYk8qFfLO2lErTVRbThOE3rfp/wk7ILptDPen79iPW7Yv6W6NwQE
         7RaEiulngQ8HrXdAnminNGnzqNrgiy2YjqunMhs9hVZ6FC8IiUgD61zR9iYrOv7t7Ad7
         gDY5I3FfqiHbQ+uRT1pC8MtOQcUd3EvyMt3zHLfHmCPuAVR1uTG37GjQdhZ7hDa9+1oe
         nhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870086; x=1772474886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gsm1SwBtjf7DAueGLWMEyiZtda9HtqsqwTa4B2zHbb8=;
        b=X4dXW2fJYOFyMKIH7W/w7NKpq6SK2Sc1BqSY0d3b1JLsMhnkMDzkcL/NWba+IIJeQu
         lE8PcZdRIwtYe6pqJ03lyACer7YPkz+/+oaTBgnGoh4lcnDwEdC0faeSNJcCIBaORmYc
         QrCWYdssescKNufp47Ey0VVqAhs8uGOxo5sDB5guV+xIzeGXVedjWTzON13XcPmB34sn
         QRJfzwf4of1eJ7RzmTksgZjtDmoe1LI6dDDcoPq34ZtVs5fqeWeObjsRWRuBjfI5+rpG
         Eqp1gTHIM+TlN4yzu7T1Jg3nZPv5S2/Zo2repTbaHo0rOqvNTcHicncIs8TDPz4Av2cU
         JrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKK9Cd8LXZhNrkMOHzBNC+ojgRRhBHo7KlGif5qZnVanSFAl4lhI2+bo+kVm292OtjNiZ4D+ogPjqRvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBap7WzqVg3kd3cgAz/qVtN2GIdO5eKDvwWpmWVGZYqrbDq9Yu
	zjaTMn01DCCdcwGQwaEXXZWecv5+cDRbC8qBz9/Iwp3eqUBTfPn8bqYy+pyX+sCKM/YhElo6On9
	39AokiwGdJRwBKX6VDyo6wua5CILftHt84XHfYi9/ZzZCtIX+IFnOYyYTbqCLVWWUmQ==
X-Gm-Gg: AZuq6aLu0eo9e7RFl1aGBfa26GlxRBR4BjJb/Y50JUdhaWyuoGS2ed5MzR3xXZiJR/F
	HP/O+iRoc6SCo72PQTx5gkglUnRAYWnJdONih/RRJttpM0Y670wIYj1Hx/BWE4kYRTuktU5jete
	dnA+IrMFfoJW7B2IJ8VWybKTQfyxd88cAUnUroI4/jYFW7bLA1N8MNsSqIcwvUE/Io5bOiElNDd
	AxB+/4mqpLaJsc4RQEB98596CNZIk5qOqxauc/c6LdBIIP+Jeijr35jrhJ4Mm3Bb5spbBoqN2oR
	5BoYqs+B5pNcA8Yaw1cLxviL78ksRiS8eNbk4ApVcGP8Bc0lnvEHaL6u10YLXLSK9ON/tR2K5fE
	Z5nRQoDclh0/8eZF+HuUmIIHvrZyzOK5ED3JUPCU61GHwLZksU3vLO7o=
X-Received: by 2002:a05:620a:44d2:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb8c9cdc29mr1199391785a.14.1771870085952;
        Mon, 23 Feb 2026 10:08:05 -0800 (PST)
X-Received: by 2002:a05:620a:44d2:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb8c9cdc29mr1199386585a.14.1771870085518;
        Mon, 23 Feb 2026 10:08:05 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 09/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
Date: Mon, 23 Feb 2026 18:07:35 +0000
Message-ID: <20260223180740.444311-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c9786 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=S1r85Wze4wKqmHhc2Z8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HjPvfbXbw0LmhXZsXi1JFa5qUmQ7SSsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfXzo+gOrh6FXFs
 5BbrqujoAusNpxLAOf3V3BsTS0kRzox6J94LvgNpCo6/0JwAVrmBELATMbfCAm+kRNKW4xIUCuS
 i9C4BstzLAIM2R/D2Q3ijoEyNRdncstbbUabROkde2C2kC3bgjdQWzqciNj1goF4SoFuvLcBwmy
 +0WEB024MH8MvOsgiD3G8hl4/ORb+sNnqVLt59QIXoAoAQAtIs9a/F3b3eXLZXyJ00ohKLwHzO4
 lPHLQUcByvoYljq1k3MfEg0RtS+p5UdmHqaiwRnRxUDbPCd74CvqLg/2+xrIZhLz7wxO3fX8ZMX
 6n81vwZF8lLy6zOyggDvTJeqy7gHd8+FVHm9I5OeIlkuwdAAC6ORwYE9+t0GZAgsdxiJnWIKt6G
 KugcGIh1/E0ZuH7W2OoNsz54g3NyKxOjuWrZ2KgybYRVHx/x0cEp+VpmkxGEi9WkO2QvMledBBa
 BJqIaPYg6VQvcUbv2AQ==
X-Proofpoint-ORIG-GUID: HjPvfbXbw0LmhXZsXi1JFa5qUmQ7SSsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Qualcomm platforms support the Senary MI2S interface for audio playback
and capture. Add a new definitions for the Senary MI2S RX and TX ports,
which are required for boards that utilize the Senary MI2S interface
for audio routing.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 ++
 sound/soc/qcom/common.h                            | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index e27a31ece1f2..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -150,6 +150,8 @@
 #define LPI_MI2S_TX_3		144
 #define LPI_MI2S_RX_4		145
 #define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 85ca73408151..ee6662885593 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(LPI_MI2S_TX_4 + 1)
+#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
-- 
2.47.3

