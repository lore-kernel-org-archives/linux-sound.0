Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4CF33ADBA
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870079; cv=none; b=eXTUewfu6lUEj/SHJiNdmdkc6YUzRn/0ozBdlQjih8dm9ofpT7roRA4Z6jIPuyW5AlAcRpeaDNGdH+FngqMlCqKm6a+pf1gFSuqWl7VBrVdCQ+o8kGQzWxMoM0aBJaXcpnhmiNr2Jdy4w1NxZlLNvqSCz2z2iSmX4GJeZ/FA3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870079; c=relaxed/simple;
	bh=5A0PZJ0tcK3fkLbl6nvYDc3AaJ58tBa21J94OKzY4+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs/vi6ZqXGcBFQcrROYKLPteFPYN3L+bdcq9PDIWtpTc9tHeWfXPuDP6wZuHNQ/2vdkx7/p2noiiMs5TLfYfYlAGEUuUR+hjpaznslZC932tiM4DADeOes1yvyEuBVf5iaGfVDP/8OjIj33XS4efuNULNIVhrrDeeKrWicJRnyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYr0DBz8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5Xf9XbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYr0DBz8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5Xf9XbB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFI133936170
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=37mbn9sGZIUZw5Cf10iBTiX1YJvm5soAKR6
	78F1qQkw=; b=FYr0DBz8pwoQxydF9LLASATu1nmPKJcXUan2LZh1yqcmFyFr44o
	hT6Um2OxxvfpxlzYHEOlxD1WFeLTPlV8WgjQQEjV8UHGHek9Ywlb3ao7v+jPifF3
	iLRGcwmh6rOXKhIISElZjABvixWjdaMDQcReJr/e/Q8gSoV5AN5tcd+1YVLzlA6D
	DDgiRrPWu/a/5kLDiERL3UCB6ImcMa9mQFHm1q6IJtAZd3fDBJaEghVvVhZzMz28
	VZDTdWzrWWRiJvVzCQ9yo7DAOhCvTAKh7147WWOs0nxuhcKZe+LLGvsZCMLYtlzS
	Ox20F6WciG1NhxI6iM/P/5n2noNjL6c4f2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mgch7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so5166647785a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870076; x=1772474876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37mbn9sGZIUZw5Cf10iBTiX1YJvm5soAKR678F1qQkw=;
        b=K5Xf9XbBcu0RrdwNSxV+FbR60tq2d8TzAn1lMfj41Q2QDfRRY085o4ZoQ50cs4C0GD
         6tPoQSwmpW0JtLExqYoYMyV/uqEImA+FB4gGO0RqeFJ4qdwfq8YydfjesXQBDg2p6mVU
         3h3HpS6lvxX0hZP+D351fTLoiPWOWCiW2WuT5tmhSb6APo+WTbJ+/VPX4PWWWalzOKuI
         FXt/ZHRtF1n4l+E2KUq9PS5cuCEtxnDORIv4/HzfT0ZYa9HAiLXPNvejWhLIY1SG/BM4
         6yuyeUNv7eqeSUWYjbcTQe313G7XSQzTXydCOXLE1kvIXoiEbmj42vICd0Ffc4R+LohR
         gWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870076; x=1772474876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37mbn9sGZIUZw5Cf10iBTiX1YJvm5soAKR678F1qQkw=;
        b=Xo5zTxmoniqulWh9IMuX8QNqijezQteQIrOzl1WSi72+rQpYsPymYPL09qQA2JWEjM
         tfHGevTEgh5nbDSzM/pFKHl3x23cU1ItWSVyRUVsCnCGPgdAQ31R2hOUPHEqEEYpSRd+
         wBRgY/zaSpvsvbppYH5FFM9MVk0BuatvGyDOL3Wqh342H/peY0rmYnL6XV/CU4jyZbyV
         Sd8/DdRou2m9ueZtAR/TSYy5et/ELm4vb40QCVTSEB2Ik0bHhxaTLrMHW5GcpO9EW3Bw
         vJiJgrf6BpFBOIRoITsWRoyubNpUYdcSesIS+PeLRLhEed4bLmgEgMP2iJNJhsb1fIe3
         cakg==
X-Forwarded-Encrypted: i=1; AJvYcCXU85qjDeInk+DBYGe86+ciKDlTm/22KF10lfD+WL9gDF8MdAhq1TAvbeA2GO/ajHmY+mFsl+XL3Yxt5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys0FmdPUyrl9R31RTV4izUr7868pc1JIxzHRsc2nkVvIuk7mDn
	d+qKS6IL90dLk3ukMhFH/9p6P9evStrCJwc7q93pxG161rdt0g8g0S4J1LHHXcqQHHB5pyGvEG4
	Sa/1p1LCDSQOoBtyims6+8CGKcEoolyaPqDN/g2qpMtEYGz91I5dbzzB7grAZ6ITdpg==
X-Gm-Gg: AZuq6aLj94T0nr9KHO3MpoV3pW2hWxq0NgYm5BShNgdgnkZLgHgZv9+ex9/Vx7AALbC
	1uqZSKXyAIwHYG1Mw94osRmqb3J4gD7vdrKGAdFZoKh98X+7bgZXfknl36ze02iOCAlFvhyGFJZ
	7e/5T48gIxKve9L4qRYOVDwWZxBoKRX/KGELFu9tuWPQY7Rwy+hvrADS1Bvppp5gJcWUgXAMlrm
	KLsbxcjoTJS5PSSYBGxxFQeHlxqHmv2HMoTBOZdEnubdJpU+yw5PM3fFCbNca/J1WLapGU4Y6QU
	2ISa7mUbQvOWSwj+o+rD2t4S8nhWAw+elEaFi8wlBklzTwJqKNVFG58w4ND132y2g7eG11IjoaP
	Kvp5BGWyqzx8cK88rhuongOhleLC8dUcHXJr5I2lyGQYGH8NIZMiKj4k=
X-Received: by 2002:a05:620a:4090:b0:8c6:a103:496b with SMTP id af79cd13be357-8cb7bfc8d5cmr1983720285a.25.1771870076077;
        Mon, 23 Feb 2026 10:07:56 -0800 (PST)
X-Received: by 2002:a05:620a:4090:b0:8c6:a103:496b with SMTP id af79cd13be357-8cb7bfc8d5cmr1983715185a.25.1771870075545;
        Mon, 23 Feb 2026 10:07:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Mon, 23 Feb 2026 18:07:26 +0000
Message-ID: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699c977c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=CdGEBIRw-R72dx1e2_YA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: yqLIWHtKHquq7zHBD7cbg016LpOQ8b2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX4wDWHQFC9KHB
 06/rnG3gKp3oT+A1Z0Bmz7qAW48KTUq7VIrpPu+814McYiyM9reZFXx9XnQtv+Prf3aot4qlRma
 PZGq1a2wdwje0EaSNFBjnVnWa5EeD3eKWKQCV6jmqT0pP74gkTy210HjuzHe7lZJ/RYoq/L2IWl
 z7w57DcPDzFTQRjfCfA9zsU5isMupQ1nJ7g3TSzmUUevzkOXVCxrK7pGDTVZd0Au/MVlzydHxzJ
 icpPE/H5eagm2nAZYxitRS9TFNpOdIYQ+2YUkKAIq9j5149ab+173clPFB1aifeeiC0PHf2TGc7
 GDYlBP+f2fDLhEOvLRRXxmqgg+lgSnLGyZCqEPYbn6xnGBrgFMj4g+snDCfC+bZGkF70HndFmnZ
 XoL4Xw0fNPN3vxrpVwNLTYrUgYZQFT6vit5rE96pP10gPAnZX8/zLlk6noX4/+HL87uiCZcHxjt
 op5jDa0rkG8x5K8gaFw==
X-Proofpoint-GUID: yqLIWHtKHquq7zHBD7cbg016LpOQ8b2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156

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
- add new LPI MI2S and senary dai entires
- handle pipewire and Displayport issues by moving graph start to
  trigger level, which should fix outstanding pipewire and DP issues on
Qualcomm SoCs.
- remove some unnessary loops in hot path
- support early memory map on DSP.


Thanks,
Srini

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
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
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
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 105 ++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  47 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 187 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  21 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 +++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 15 files changed, 387 insertions(+), 161 deletions(-)

-- 
2.47.3

