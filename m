Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122442FF164;
	Tue,  7 Jul 2026 19:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450889; cv=none; b=DXHnYzGe9feyM57o32eE3LThNROhndc48jJQ7OZd7PeT/L9S5bubiLjGeC2yw4b/6lrPjh4vl+K2mhlHp+1sQHjflyChqSLwUdwon1TREeuVrVo8Ff4iRKz2id8st/4LnkauXAKCiakpJfZr5rbk9biwTtCbILehxM8S0iUhIeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450889; c=relaxed/simple;
	bh=0eYbyxpn0pNUVcWQwkMitZTx6DrasPsg8i04RiC+Be8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JUdiOv1UliazBnVnULU5ZBoqSwujdjc7sYLLN33zH3dpyj0kTAXgOlH4Rwx0XRF2cyuzYLuZ4xx6t8xGV0bfdUqMA1MeGaOqLlsx76R5jicg3AgAkxdlG/uMfIliCDQ5Uu7HOCl0dEPTpXnfI3Av3hkwWcDIY6Ks0Hsn0CZGudA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cP3pNxNX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cP3pNxNX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT6F1002253;
	Tue, 7 Jul 2026 19:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f5VT70XhlNH+wSGet3eo3n86NJh8UuGF2GJ
	7F4CGmZY=; b=cP3pNxNXCBl4VO/UoeN0WbHnUK/haxpHX6omsrmm9s1odtfgc83
	lAfJv2X0AmUF65j2zHzSxKLfafh3/F4ukcc3KCVSGR062+v7lGPfH19q0gExCAJp
	fx4W29e6F+vibq+Z0J48zqS3oiy+0OtcD7Z9ufYpWxWPKGwWAGAKWx2kQ8i5FEYs
	Kku/7VhQOGtQEdVhAooI6Y+TVHq+O8iYss9FKbkJvQLCw/KWlxqgVmp8TZZDiViV
	2jh83R8FJsUhkayM0kyeD3RqUcxG7qhJJk9hpX8YBOqqRWVbo3AiOr+5l9azI/73
	DL8b9RJKYqJR/VkI5E0dIC1Qgzu7wivbB1A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0jax7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 667J1AnB019109;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8k6b47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:10 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 667J19lg019084;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 667J19vc019076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A48D2632; Wed,  8 Jul 2026 00:31:08 +0530 (+0530)
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
Subject: [PATCH v3 0/7]ASoC: qcom: add AudioReach TDM backend support
Date: Wed,  8 Jul 2026 00:30:59 +0530
Message-Id: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: _44QRBW5tmuUgh0-3gckaoJQ0Ym1vNWu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX4kJxTEnNQtm2
 0saTOxwhNrwLfxK6EB3PBrbyVKIGQYPCDBp5GiN7agRonLBpAHByGkfzn9g7JzdrqLqsJidKnU8
 f/bZy7uhWvAuAxp9Vko6JQszhCDX6Dc=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d4cf9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8
 a=Yw6pOkK7GvuVVCPfzFYA:9 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: _44QRBW5tmuUgh0-3gckaoJQ0Ym1vNWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX+lS6FQBQ5Ld3
 WeEgJHmsdKWDrrFtFxi12GTrdU0anGFDGY94p5AFa3mqzFdxSb3YdaWHtN7OXfQAHhLGv420Otq
 penlLDJSUwZeVftznIu2OvDimYoIvXPLMOpN+/SWRdOCh77QCpkMUG1n5yuddA4w1oa7xFCtpt+
 hCawh+h0COlszl6AqmAOjDA2ECfbScsloWkM+u8x3vlHF2OdEQOfa9Jr8lpc3zOB0VzXYoCCW3P
 TJ6XFoLQZ+ZXtOUfo0QdbXKWIVW8qgWPGZD81czb4OQq0CuWkSUubzKVXkceRoa1QDtRMvUv6ck
 AqFbPCLcz5QEbgcRrVadY6+rjU6kq7+KBIP6gLFwN3XBEbgvRRn1MxArGz0AKJyDZhgf2EPUxyo
 k9hQHTnFPEl789NIZJOZSg7UUP7UfNNOwW0VdneV/Aq2+R5KRuSnvVRWjEvkw3YjA7+ww5LZeGV
 YpZ70+c1tADIyXFGqLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070186

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

Changes in v3:
	- Reusing of tdm-slot.yaml and update the bindings.

Changes in v2:
	- Update AR Module token definitions and validation prefixes.
	- Reorder module addresses.
	- Add kernel-doc for `struct param_id_audio_if_intf_cfg`.
	- Remove unused code and stale comments.
	- Clean up comments and naming in q6apm-lpass-ports.h.
	- Add bindings for TDM slots 

This series depends on:
- https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com/
- https://lore.kernel.org/linux-arm-msm/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Prasad Kumpatla (7):
  ASoC: qcom: qdsp6: add topology-driven Audio IF support
  ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
  dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
  ASoC: qcom: q6prm: add Audio IF clock IDs
  dt-bindings: sound: qcom,sm8250: allow TDM slot properties
  ASoC: qcom: common: add DAI-node TDM slot helpers
  ASoC: qcom: sc8280xp: add TDM hw_params support

 .../bindings/sound/qcom,sm8250.yaml           |  18 ++
 .../sound/qcom,q6dsp-lpass-ports.h            |  29 +++
 include/uapi/sound/snd_ar_tokens.h            |  89 ++++++++++
 sound/soc/qcom/common.c                       | 165 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  97 ++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  81 +++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  57 ++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 +++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 +++
 sound/soc/qcom/qdsp6/topology.c               | 105 +++++++++++
 sound/soc/qcom/sc8280xp.c                     |  60 +++++++
 12 files changed, 772 insertions(+)


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: fa309c7712836e2ec2f2a7a130b80f07f28dbba2
prerequisite-patch-id: 84ee327c8398aee280cb16ca48e91d139b6effb6
prerequisite-patch-id: 668be29290a9ea342c0ece1cfec468d9cc6d0b27
-- 
2.34.1

