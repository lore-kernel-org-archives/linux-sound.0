Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B3233704;
	Mon,  3 Aug 2026 19:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787005; cv=none; b=lxhq/8sBauKq4/A3/uD3oZNnG3GHs8w3eeJ2jUctdYRC2H0+UCtiBUZ5gjJiCUEzmwWkrSx1bR/aB2P2JGBSEbJtP3lXFFMvi6Mr7CQ8QBGddi5KawgsDLXQsESevwEwpxzQzdPSyejpbWHQMnlHhKqgriJHeFIftqAo+w3i47g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787005; c=relaxed/simple;
	bh=BWxMTCsR7MmJEJFUCQczmzm1uNKpilvboU3SpgockWs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmkTmRpFH+WDAHa28pP12Xy6VR18MKILmavzS8/2LNd2wi7PC/MgKh8/iUaFE2kMCoIK1hdEkUn0bIxbnxZ7ei8zBdGbZUp0TArH8rhAPR12I3RgXJINE0wYADFM0DeHbM3BaZdiEIprD/j1MBlrUSLB31d0DZ6ppBRc+OJBI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K15ch9cg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K15ch9cg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkrIi990431;
	Mon, 3 Aug 2026 19:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=br3pN52cMwcauevXKYwKbiNsq9WrAaZ6drS
	AlcCCvdU=; b=K15ch9cgMdwQQcuMJi/q4qKSzX95onptjcuNBPK4jS/SqAXxQ3a
	wsx+s/dQMcCg9y7bc2RZ45b2LcdowgLgB0MW1FJE+RqLdi0E9bSu3SbDjpLmY6+g
	WMUT6+CWfnWQ8afTZW5XCMWIkqovNiG7cbHKrRJo4hIS5kNRWnP3GBotg6BfUNBi
	Yomb+8oY5U5M+qc4l0DR1FKCGLqlqGNPkawrdrGrPygBbORWDT52GMRgxSnhf7Ms
	jo7GLJzl1JR8Io4wFmMcjqz6K1L0CxAb682FkALwKgk0hVIvDDPwYk92W72VJ/Gw
	Tyi7pNwyWoVjZb9Fonc3rBO5nd9CsiJKNmg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m11nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673JuSB2016736;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vj9wuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673JuS6D016712;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 673JuRhA016704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id D411463D; Tue,  4 Aug 2026 01:26:26 +0530 (+0530)
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
Subject: [PATCH v6 0/7] ASoC: qcom: add AudioReach TDM backend support
Date: Tue,  4 Aug 2026 01:26:17 +0530
Message-Id: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX9+dqvHJ00rI+
 GpMoiLOrKrLfPaAMzjhVXQQQT0AQZjAbC1vXKXZIFdDYnhOdKkdkKmJGVTm2Qj4mDS9w0yn1icH
 X+TFnul68ZodR7XHRAnFiXZeuOoTEdH5bYIlZcfUEPeuVV2bEnxJKVeGoJLrnu8qvKQSv1p0HVw
 OL3fAx999mr0D4KS05bQP7nyBQyF0n3BPQNLg7DGuxSNtA1pJk8B6+zBMbFCprx99blBnoRr3dP
 ozSAS1lhPGw8k4D7PCpO0dXwqUTvON1keZPfHquGNiwdK6fdnsvBlp5cHx8gUNwCfSr5EE7zZAD
 UBmKzUc9fHF647MRhztYqMT2uY/OgPEIcByWpuxXI3pgZ/is35k3y1NQbWHmBfRkS5mei0Y5xON
 4Veun311dyQMKHYkhXqh36e0qI99h1xHNYIYlSu1/u/RehsHd8rr9wDsumV6Gz8+VJabf7P03yk
 8OMD8QIh39GD/44yHNA==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a70f270 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5LSzgCIJ2aLde3To2nUA:9
X-Proofpoint-ORIG-GUID: LIh6DtVhsaoIWDIwGQnlGg0UT5IDzZ5D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfXwiNVnxlsI+vk
 V4cSyAQR5i2TznrjliBBwxHUYD8AU8MWP3CBQVwb2NdGB/tZEYSNTzHewMjZ5n/0S8K/2gS0Jz+
 s9d2Xyjmi93L1Ax1vjxQBmYKaut05dU=
X-Proofpoint-GUID: LIh6DtVhsaoIWDIwGQnlGg0UT5IDzZ5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030176

Add AudioReach support for LPASS Audio IF based TDM backends and wire it
up for the sc8280xp machine driver.

The series first adds topology-driven Audio IF source/sink handling so
the DSP interface parameters can be described by topology while runtime
media format and slot configuration still come from the machine driver.
It then adds TDM DAI operations for q6apm-lpass-dais, exposes the Audio
IF clock IDs through the q6dsp-lpass-ports binding and q6prm clock
tables, and introduces common QCOM helpers for parsing standard
dai-tdm-slot-* properties from backend CPU and codec endpoints.

Finally, sc8280xp uses the common helpers during hw_params to program
CPU and codec TDM slots, derive the backend bit clock from the active
PCM parameters, and request the CPU and codec clocks before the stream is
started.

changes in v6:
	- Addressed comments from srini - Provided QAIF Supported types, Removed 
	  dead code, add kernel doc for ep_frame_duration struct, variable consistant
	  checks.
	- Addressed shasiko comments on patch#6, - Distinguish missing TDM configuration
	  from invalid configuration to avoid masking DT validation errors.
	- Restore accidentally dropped Reviewed-by tags.
	- Link to v5: https://lore.kernel.org/linux-arm-msm/20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com/

changes in v5:
	- Addressed comments from Srini - Removed unwanted comments, Define Macros
	  for frame durations, Updated the logic solts, validate the tx/rx masks.
	- Link to v4: https://lore.kernel.org/linux-arm-msm/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v4:
	- Addressed comments related to bindings from Rob.
	- Link to v3: https://lore.kernel.org/all/20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v3:
	- Reusing of tdm-slot.yaml and update the bindings.
	- Link to v2: https://lore.kernel.org/all/20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v2:
	- Update AR Module token definitions and validation prefixes.
	- Reorder module addresses.
	- Add kernel-doc for `struct param_id_audio_if_intf_cfg`.
	- Remove unused code and stale comments.
	- Clean up comments and naming in q6apm-lpass-ports.h.
	- Add bindings for TDM slots.
	- Link to v1: https://lore.kernel.org/all/20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com/

Prasad Kumpatla (7):
  ASoC: qcom: qdsp6: add topology-driven Audio IF support
  ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
  dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
  ASoC: qcom: q6prm: add Audio IF clock IDs
  dt-bindings: sound: qcom,sm8250: allow TDM slot properties
  ASoC: qcom: common: add DAI-node TDM slot helpers
  ASoC: qcom: sc8280xp: add TDM hw_params support

 .../bindings/sound/qcom,sm8250.yaml           |  26 +++
 .../sound/qcom,q6dsp-lpass-ports.h            |  29 ++++
 include/uapi/sound/snd_ar_tokens.h            |  93 +++++++++++
 sound/soc/qcom/common.c                       | 155 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  93 +++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  90 ++++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  60 +++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 ++++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 ++++
 sound/soc/qcom/qdsp6/topology.c               | 103 ++++++++++++
 sound/soc/qcom/sc8280xp.c                     |  59 +++++++
 12 files changed, 779 insertions(+)

-- 
2.34.1

