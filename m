Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA12413785;
	Sat,  1 Aug 2026 05:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563197; cv=none; b=kuIoUvXDUuGgHHME3hg9gZXEEpeK0OhYywjyF50zyi4HPwqAIR7MKhCMNElzdq0J5/JGdA12HW9xGqlTDj8COS/mu+joHX6NGPjEabWSa2bHWQ1UtKatlr1XFO6deInPfiAOCuT6rp+HEcLcFeFE6WtxtRGI1HVB9B78HoNCnZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563197; c=relaxed/simple;
	bh=DK5zEsY6J3RtqMaKpJVmHPVQ3o5CWeN3WXUxDpI9W0M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MVq+MauMH+1qd53EEbWRncrfp8ZhJ13Ikeh65S4QTXuDp35KC52Mo9H3jNre0JnBoYnuyg8WCUyQR1aPEjgOfgYpWCiUIG1HG8AqB3m63vilsK1kJ2rAqeA+FQhOGpgwyJPhvte782TsT5WAEG3rJE72+PaYdnglj2teosAP0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHH0ADHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHH0ADHX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713PYCb1918888;
	Sat, 1 Aug 2026 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sp417BbWpW5gunE3ffitqV8cmKn5HdYUxT6
	GHqRTjds=; b=SHH0ADHXB5EP8+L7ToNSnUeYryHkxD+82/wbzjJncJFXs4ekuIe
	73UJwH5niZjtjV5x+Gd0ylas0Y65jjQlYO1e4yIJ+VSMf6oUWE4Tj/M30pwUlA92
	S8tNjG82eQvsixgbAMJGMxYz3umpjkabOZwcZZpiZy+Sdz3QNhVreIdVklCyMcPp
	G3rPvVReg08t4hhJQsyJivDcJkBXrKW41du/ZwIGeBqy7bIJ1nxuZtohc63PV/DG
	kAh8kp1qff3zxd8P7QOBK07U2s9FQ6VjywArGXZoiqb1z2oN3JD5/YKO4DWVyJ2m
	uKnCgk6ecNhAPCjhQXnY/7wTJnNbeWsPgdw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt896a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6715kEH7016926;
	Sat, 1 Aug 2026 05:46:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vh0utm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:14 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6715kEa2016900;
	Sat, 1 Aug 2026 05:46:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6715kD5v016815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 00B30634; Sat,  1 Aug 2026 11:16:12 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v5 0/7] ASoC: qcom: add AudioReach TDM backend support
Date: Sat,  1 Aug 2026 11:16:03 +0530
Message-Id: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX1dJvmmEUVHIh
 IrbO76TvvmLO/0BwWIn940D97V5QkfAa47GT6EmJnu84HUuOgpHih1nxdtvKzI922MET0r6cxSm
 T5lhWucg2nO9heuvp/VhC1QW2Fi44LY=
X-Proofpoint-ORIG-GUID: a589E_0hw-EwihFeF3Zc2peT3YNcXsR3
X-Proofpoint-GUID: a589E_0hw-EwihFeF3Zc2peT3YNcXsR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX3PRGLVo2mYDc
 ybRFvMzmrBXjRycMuPwKE5QCLjF084zBrGvlW/qrscWYUXilC8kdYceN/yLbbUkPw8BLL7Go6RC
 4YNkzaG0ldBs6jxVy9Ky7FMG0A2ZcGuoQbckmQm7e2m7QrQVWRi/5wLQeadrgRL9yflpNWshPCN
 GAKaZwE/8DxQ3fpn2l31tSKWZC7c0P2GJH1HTpmDzkAg7kB+Ep1EwXIeqXcLWq5stBKr+Pqts7/
 Y8YOxECN0dEcbFD3GKXpPwdI3s/8AcxBka084KMpnF1kjIYtumBVPXsbMcFlq5jtaI2vitAnMQT
 wH9J6I3iPUDzP8R+PcjhOtRLmvPlC5zi6Saz/Hca1BRTLyNKGoaRaUMM5Dc8KtEN5YBhdbpTodq
 SZFNxfsYVM1jqlYYJz4BKToducp5CuIbo5ht36TxJ0Vis6esb5/+bxjrCUQufHVnltCrc6epzth
 nznldCeVRJIA0LnKBgw==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6d8829 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5LSzgCIJ2aLde3To2nUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

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
 include/uapi/sound/snd_ar_tokens.h            |  89 ++++++++++
 sound/soc/qcom/common.c                       | 155 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  93 +++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  84 ++++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  60 +++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 ++++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 ++++
 sound/soc/qcom/qdsp6/topology.c               | 105 ++++++++++++
 sound/soc/qcom/sc8280xp.c                     |  59 +++++++
 12 files changed, 771 insertions(+)

-- 
2.34.1

