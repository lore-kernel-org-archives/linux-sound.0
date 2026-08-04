Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0541D223;
	Tue,  4 Aug 2026 07:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827016; cv=none; b=du7H1sO7ZAmf34CzfMd74mp2amZWVVk82oWWg+tNwx+Giyz2IbzmyaQ6+DMzoejS6xjwGouSVYUth+R1usjsIVUaH8oJz5YRiHdw7a5eMuEac/sCfeGmIyUElySzd64+9XdmXhDW/QcL9B4NZE1Q2EuI4JtxhjL4TBg1xU443Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827016; c=relaxed/simple;
	bh=zQDL8eomyEDrk6jn7d+ZOUsOjllNoYmzBg/VqLhKQb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ppDFikU5R6WCBqTpTSiDQnp8t5Jrwx0EsSBM97X2/66mED/dFNsaCnKmbzjfpT++/XuZiRGHNeli0Ceg3FCz5wPBqVbYuA3kosMevlaE/hyJQHvJPL8tqHP9jli0R7wrXg9tMZPGp6B6unIZ4jT+NPWJgzlC+yrdcratra+P95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMHgtrP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMHgtrP2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67416rUL2027959;
	Tue, 4 Aug 2026 07:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=paZKkGsgZhJGJujVNDa9zqaEHHOqXeEy9qI
	3N6iPwkw=; b=ZMHgtrP2uNo17iUtkHWUxBfEUkpY7SzzE/mJisea/UyFA8hrIbw
	M3NO6oywdZ7itIh3ka+chMzXQbiOSuoQvC+XQ39B4fusxkFJV5SwjoywylQ8Oweo
	Jk3/qPmrlZnLERU4+4WsqxyNoDrE1KLLABCUlbl656HY7wWADU3I6XS0kUYAutO6
	yTqBAunn4DPwDet1zIJwHzNCUJA7dWLymr1Gd4Tv0uSI9WaQMFYCruGm9Yc3ACiF
	mgHzC2bP5HYQDQNiZW+A3fQupN2PkBAmYFMAfLD647VVSVMlAcEINj++fuAzGKqe
	ncALj5qU/HLGDqVHI/eSmV44COCErn9KxJQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2syhxeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67473FEp031239;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vjhjmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67473F2j031211;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67473F8A031204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7184263D; Tue,  4 Aug 2026 12:33:14 +0530 (+0530)
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
Subject: [PATCH v7 0/7] ASoC: qcom: add AudioReach TDM backend support
Date: Tue,  4 Aug 2026 12:33:00 +0530
Message-Id: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a718eb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5LSzgCIJ2aLde3To2nUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX1ajT8j5t0EUo
 vJNmlvI6PTfNQdQap06+r43L/FLB86VSgiQ1HkxBCVDKe7lcfliCfb8i4N2hWHsTcff+HsFd86D
 hRiHnZlY7qkJpjVFluegT1jK76ZIPhk=
X-Proofpoint-ORIG-GUID: AsxooYV2oYK9CZtQ8zDqvI7Ii51YpDTM
X-Proofpoint-GUID: AsxooYV2oYK9CZtQ8zDqvI7Ii51YpDTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX8+xjCYLW/Hgo
 VTv7Mk+abuOrqeYr5JYB6Et6dQm0xmmsmoLCypxO1LNkeg6kWKDKRQjamrGhCVwmLm6ULn50fy6
 m6/751Rw/rNUr6129Y9i3olw31JaauMisiFuYJyhS0Cl0Umxsi4KkFcDp5uDdnGchQO/fLGxZmp
 neWVpXlwk4YMlFq5x7QQSrG+fKjCTVb7wQcwsPdYJWCg+9Jel2khGQVu/YhzE5L2eqfLzzTl7yn
 p57K/M48FHGER9lGgw28MNYA9nL0rNsb+idHYlqDUGyLA9bUslfaOaXJzPBQFGmcU2u7SDD90uS
 W64WVjtRj8ZeFd7UhcKdnkW/gFFXqVjE/NDicS1TDbNVHmNUbPiYB71IC/R2b+IY3Jx7uxpTnuI
 3C095c2NHHKbYIY3wM1qVn3OhmiQFqwr3+yfRyRopgW/7NczXCovcAsB+wEnvRBc7Oazs5ZXbgO
 jZ435BKrpAxyA2rT5Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040054

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

changes in v7:
	- Rebased the series on the current ASoC for-7.3 branch.
	- Fixed build issue by renaming sc8280xp_snd_data pointer field
	  from snd_soc_common_priv to priv.
	- Link to v6: https://lore.kernel.org/linux-arm-msm/20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com/

changes in v6:
	- Addressed comments from srini - Provided QAIF Supported types, Removed 
	  dead code, add kernel doc for ep_frame_duration struct, variable consistent
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

