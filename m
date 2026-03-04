Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F523AB8D
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629640; cv=none; b=b50wrQ3yPZiw9DGp5u4DCogKqvBwN4U+vhKaFP3fAincebAfeuxYJ6Mh/Wr3AP6mJpjt6Qa80/gRM/lO4AHW1dv274r8aP6TxZVeuDice+b+Xh2KWkvx6f9M+VGIhYJypUaDGqGw1O6iXHUzsy/AEOjFZetYmJKbxwxJG4XjHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629640; c=relaxed/simple;
	bh=Iye+bnnMcq2UlFaBhORCaxbUSPgoXMM3QypbJg20gso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HeCw7ND5o3QuCc0BYj6zX3w81tdDUH0xavKGCzAeu8X01D7mP/qAOtiVjOSNuie/bltiFscdcMdwg6K16A0hyLpH2bEnAz7UfK9SoYOYaknnxpL26JZivj4LeoIhs3v1yBaYZajp+5UsqytL/Gp65Kc696jI6ZfatstHr3q+5FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8bSXpWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPBIvxZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8bSXpWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPBIvxZV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CF662956992
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ADo6939JS2yhAWLZSQJW9ag9n0Y7q5E2u9/
	qTW51XE8=; b=G8bSXpWLbWjIUut5lZ2FFawxxXJiyo/ESQhmzZrT1UCCZsRUT+t
	5mM3jhzTj2Q25s2KN6yVh/L9MkX/D7YH95B3cT11rOs139klvxkQLDO913aT0BlB
	W2DYYriDW9tY6olmX22b+ofwUyTJrZxW0y3ikcVk19gnbIAchLpbEXLBsICEDJOz
	UNro7qadx1QhgyGpkiFFoEZt/7jMc1dgA3nHMmyTTVwZULxrDRQAr2QSVg84psAl
	+pzxNbYMBRokqMzGS6pxi+908+ROc15jGbdph2T4y/iNdK4xoo/pHfF2k9gRLNdN
	kIE8ST10an6UCLX/qjr8KX4HhurEchodI1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgaxb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so5000963185a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629637; x=1773234437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADo6939JS2yhAWLZSQJW9ag9n0Y7q5E2u9/qTW51XE8=;
        b=NPBIvxZVO58ThQBBbVjS5GkpLKka1oMbKaObk5aTAoLTTxQCh05zKoHa+Ue+FxwwMt
         H13CTphwvXp4PQvJpm1Pio2UAf3XkMpygZrFkbrslaPOsvNisgJHPVT8kJI3XD+uh6mm
         RsxcCJ6mN+1LAangE6zJmG6jBaLvfQIGkF2/fiJuej/yQlSIeOrmkV+FYPmw92gpBvHl
         5Nt5DcKBcI6pYBiHbjVmArFMK9Zo2aEq1Qwoe8neXG7y/p+60Mv+T8cpWhm2I8TNRnDA
         WRFvmIUPiTK1o6VuWpEd8IX9e8TC09WisMQ67zWf1M5Gc72egaQUKbfZupP7ynMUxL9P
         B0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629637; x=1773234437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADo6939JS2yhAWLZSQJW9ag9n0Y7q5E2u9/qTW51XE8=;
        b=GsVff6YdgejLrMJ8GmZqXSp4RkO7A+oHov/Zlmz2Tl1+Vinay3ZQG+SF0ADTpOiKfJ
         UiKQg1rQOoAtqTFG2XWImpmatW+6THyt2244Z4XHiahlVZJ4qufzRgMNirTp+SGIz+kI
         Di6un9ydZUcLCwJjV5EzhsWoGnehkB28T4mAnMIL692LNHcgNMLP2EdvTw2c5pyNxEZm
         VRwIYtHYu0wAlkJQEwLl7CSU7+UK9tweW4v3RLPXSlqLVKZJf381EvBtZksnR8RW1DXs
         0C11JRddbSolm1M6L+Df2C8b7AN62wpkdtP5Y2R31+kWZ7KEKR1ZCImCg2MPDcl73kgO
         bUmA==
X-Forwarded-Encrypted: i=1; AJvYcCXorHWgC6TKT/JDuk4ushsKbjW5sKAYJoDMJEE+TA73TXHsc226C1aDmuS9D9eNoviKFGC/MEzW63VJYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqD9YdJk6HI776ck/jllZGnlsiolzqAx2sBxXJ4i0rsBxlCLF
	tg+QcIXIlNa+N/H4utbKYnHo5k96bO3XYq3ysZOC3h18bnVSjBIjngcDpSEn/+Z6m+ZhfMD05c6
	WedVtpaX/789CLvpILjD2khult09bfTdkta3wa5F9cT0IqmTrOOzfbJBBTirTRqdyyQ==
X-Gm-Gg: ATEYQzxjePayI0cZN7l37G7/XVRXvLkNXDEhN1puf17ktRk3wsAV1GXlTywHYig6FWD
	lU6BEtDsj9vAxwBxa0qg9RfGJ3b3cTCTPt4RaUQeBT/5PuW4prg4C6O0gOIrxPG90oL5rnW6qDI
	85ztjNk8vZFHV5fHs+m/rr/Ki6ALWuvMNlLjz87wiVcwamX9oUZMqlMVawGdNAPfYDnknuEiAnr
	BPP384g6xfnxdICPp73HRF9lgdIu84JLweex/QrHysJ6RxwwUHC3ymjPvuG11zslpmi06RFxk71
	DFw7oN96i49vKle7m/JUz7qqUVXb5P64xiOL097cCzpWAMhVghUW/IgV9hbIqrMCT1CcHEcBDe2
	x1vP9ut+dQB7era5eESZUz5qFTf1cT1AJhMVt1mODxK7sbcIbSXYy7lI=
X-Received: by 2002:a05:620a:1921:b0:8c5:3045:854f with SMTP id af79cd13be357-8cd50bc2878mr623755985a.30.1772629637496;
        Wed, 04 Mar 2026 05:07:17 -0800 (PST)
X-Received: by 2002:a05:620a:1921:b0:8c5:3045:854f with SMTP id af79cd13be357-8cd50bc2878mr623751485a.30.1772629637046;
        Wed, 04 Mar 2026 05:07:17 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Wed,  4 Mar 2026 13:06:58 +0000
Message-ID: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX5QNHXEL9ZOCD
 rxV1JdkA2fTigpkRkrDIQmemEF3/V69L0I/dc4l+WNboBdVxqNK3XR+KHNYJxMF2nUJLvz60/P9
 FkHEPXNUimMh0PYzQ3dCpA/9g3CSqz7P5fdRYW7kTar3bOD6NVVivdqhi5R1furoGZkbJFdy7/x
 s9Ug8Ce/OEPWYbHwCUBz11Af2OrzCpdR1sLnLU6khHTOXQiZkq3t+krAafkb0k6CYUM24DzlMWM
 o76b35y+wtumXaP78ivJDighUTl2DreSE1+H1kzouWDj93y8apB3JZysJt3i31Ew22DOxwPvbM/
 VSP0i8NVAt44DivKGlOytEG97fQs7lQCOyL30DdQDg950fFDl7jpvs1uoZk04Lm9ZVvuanvkRjF
 4fKJbND5cn1G5yMykZ0Mm4zkWGST2IgO/Q9sSmeeb1NSwVCxK8Req/UdtPar5/gwV2wxE5uk9c5
 SwbGbEp4VGXnYNJqkxw==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a82e86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Po9jSEPpK0qXdfDLCGufsecm6Qzczmyv
X-Proofpoint-GUID: Po9jSEPpK0qXdfDLCGufsecm6Qzczmyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

This patchset contains few fixes for the bugs hit during testing with
Monza EVK platform
- around array out of bounds access on dai ids which keep extending but
  the drivers seems to have hardcoded some numbers, fix this and clean
the mess up
- fix few issues discovered while trying to shut down dsp.
- flooding rpmsg with write requests due to not resetting queue pointer,
  fix this resetting the pointer in trigger stop.
- possible multiple graph opens which can result in open failures.

Apart from this few new enhancements to the dsp side
- add new LPI MI2S and senary dai entries
- handle pipewire and Displayport issues by moving graph start to
  trigger level, which should fix outstanding pipewire and DP issues on
Qualcomm SoCs.
- remove some unnessary loops in hot path
- support early memory map on DSP.


Thanks,
Srini

Changes since v2:
	- removed non-dt header update in bindings patch.
	- removed some leftover debug statements
	- updated function to void where it did not make sense to
	  return anything.

Changes since v1:
	- removed LPASS MAX PORT define from bindings
	- added few fixes found while testing dsp shutdown usecase on
	  Monaco.
	- replaced tab with space
	- added port range check in place at runtime to catch array out
	  of bounds in future.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
  ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Srinivas Kandagatla (12):
  ASoC: qcom: q6apm: move component registration to unmanaged version
  ASoC: qcom: q6apm: remove child devices when apm is removed
  ASoC: qcom: qdsp6: topology: check widget type before accessing data
  ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
  ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
  ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: qcom: qdapm-lpass-dai: correct the error message
  ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
  ASoC: qcom: qdsp6: remove search for module iid in hot path
  ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

 .../sound/qcom,q6dsp-lpass-ports.h            |  12 ++
 sound/soc/qcom/common.c                       |   6 +
 sound/soc/qcom/common.h                       |   3 +
 sound/soc/qcom/lpass.h                        |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c             |  60 ------
 sound/soc/qcom/qdsp6/audioreach.h             |   5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   6 +
 sound/soc/qcom/qdsp6/q6afe.c                  |   6 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 101 ++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 183 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  21 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 15 files changed, 380 insertions(+), 161 deletions(-)

-- 
2.47.3

