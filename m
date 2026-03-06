Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3A38F25F
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799726; cv=none; b=IvtvKXOb6OgSALfamyx76H6u8ndqUgQEHUiZk4D6MBdCX9jn0hvj0buCWEk2quhqP944mOjl+19NsE0dlUwvJpt8vNNx9dxCBEjPHYxqrWb0sfE2RhbzhSz8PS3s+HsVngMvz3+R+juSnMLq7VK/oRMwguqnAngQZ/elmgtAYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799726; c=relaxed/simple;
	bh=qxPf+3XjJNgYQuJxRytsLvp6bwbDQyQcuHZPjIAZXFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKhBCZEtRqjcftZnqcAdcfBrYH8pR2aiE9zhZUOC/hLEeMlhoCqhUZuO7Axkg3cER8cfTQVKtTWbvV80KJrg99JYTdMNf7N5h+4RAjFS4ortBzw0Q+2gSTXT9LSNayS6B1EEOv/A/3e14S91eIZ9dlHnsIq8WgcN1NmfVowIzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hksN59Kq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fsj4tvBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hksN59Kq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fsj4tvBO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb4On3407248
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dqf1okfGInzL2axMVnaWbPhLXJ9Hlnq9fbQ
	hY0yio+g=; b=hksN59KqqRkfn5UuI1FcNU104xy+pDSbU9YBz0wil0EkjZy2faz
	L5OJAx5tH05PTtsRh3Rk8uAfVKK29tD82pin09kVG3i4M6pp2k+2odQ9H3ViILXd
	Y7qfolS/JdcyQB6oHP2V3GwuwqVqK1uiQ2Vfx9cDKYrcVhA3ydnAWC0QnD29dVbA
	dSI615qG7HjK8KfpI1nEgcftG1OtQ8zpkEGNY/k7wfQX+14oa+WkBqTGrcdf/0VZ
	2JWdWl6QAQl7uJXzBDX8GATlAE/V2wfKH9FW2p0GPLOAAUjd9m15goR7VIe1pLJq
	+2S6x11ZWLyi/gd9MSZa5WP+Wx6o1XKv0Ow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8gpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso5840514685a.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799719; x=1773404519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqf1okfGInzL2axMVnaWbPhLXJ9Hlnq9fbQhY0yio+g=;
        b=Fsj4tvBOlSfFBjK7uYNjlL15IcvmPFn/xxWcA+Ca1gcUSmBTAon/iACNVtRD9Hv9zQ
         x+9tW/8QwNSwy4QhiAqRWlpzJJ3BnuFILA2TymnUF/rD5QRqSQMI06wcel4lTPP8IbkG
         9/DxDIVrONNuLJlk1ImsoIEt2Xe7N+7Ed0Mhqi4zbpAj94VgbIKksGJhcDtU8a4yYcJQ
         g2dFG+yvjA/4EXvCH3OuuOrC5L7zD49rS1grRCEACt9NY4AfK7n3brceuWH/xgxjNwV1
         wykhogAWx7eCXhRJUOT9Z7lk7eWBz6q6W/bzvYKH5WzQp4YF1FerbqsabKH3CLVFSIoT
         Oprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799719; x=1773404519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dqf1okfGInzL2axMVnaWbPhLXJ9Hlnq9fbQhY0yio+g=;
        b=HWvAL0gFQyqupCXUXrRvZNNVWpgN6JWzboveDSIWJZ6b7zZaXEm+UnbqAaFLxMvkw2
         kioD0HnTOsabg177vJ8UKjNGGDy5L5KrzZWDJjqwpAivRX7Bsoa6vIgIbDGb2iJHFxJE
         8HuGO0F1CegJNHSZR9cRGT55jCItFXzNjYUwS+3f+IgCRGKCNUUT3xmBoEaQ0uKrN7JM
         KQyeuVGowz9c6EVsIC6OodlDr3dxaR3dZ4ErYLrJw5s/RhpEidA8Ze/FuHIL3oH0ISOj
         moBVqP+16Xv6MSNtyKjR3CbyHog3a4vItPtiDCMoDDohvZlN9qwoW3j3bHsZJTPLzpna
         ghhw==
X-Forwarded-Encrypted: i=1; AJvYcCVKZHYBU4/cUMYW2ZzmSJ4JotVcQFEAZzfJXO8Fe1inM9sy/Bd4q+H6Bc4lb4fZPBunpbVUpSYjapl2KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYPYM47/tRmBBr7kOGw19RuvGtamkvwDx2NBC8nONZU0b2dxa
	uvCwtiYDt0srPjIJwbgCGceekBEdbNjxWrm5fyCxeYd04KHaKLBsR5d/UGHLnDyJeEqKQfquGc9
	g/DMTgDnUu++IOms2Zu+4F7bGaLju62ieDqydrsvEvYCUtCzC4UAz38nweKMaralrcg==
X-Gm-Gg: ATEYQzyo8ibve4JcOys1qwiULdFgC0Qzvy3IUJoNO4fjk9UevazJ8H5NKEQq8tvkdhU
	WAZza9Y1S79k0Ated7nIbid4JB/cqpFxYqDekOxXXEQpTfWvcP3RGLAdyMjc9I1X3uiNvJpw2EZ
	jeBuuFFQOjAYGYDdHCrtmdfx7gb/E9voMGbQ5BJUwv/2j1PnKXDX3EhGpjP7p5exK/bE2ZpwRlD
	fHODQPmPX9krs3tCcipIBdWNKFqcW0npCSCAGPBC78eYOOj7VaE/Mv+yDT2C8vg5aXO4Giort6N
	wCmJjTwyBuoSnWuR3ZxSWeFplA5X1gVTiFX9kofo8hw3RK/cBNzrICeS4LPAzNfLH+UX91w2pc8
	Cha1BPdE1bz0lg1qnVSNZT6+eU8Uu980xm3v/6fU+sZoEYaZ0TYmg8lE=
X-Received: by 2002:a05:620a:3f85:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8cd6d3d915fmr218383985a.2.1772799719492;
        Fri, 06 Mar 2026 04:21:59 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8cd6d3d915fmr218380885a.2.1772799719040;
        Fri, 06 Mar 2026 04:21:59 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:21:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Fri,  6 Mar 2026 12:21:02 +0000
Message-ID: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX33/QRGZiT7n5
 XaAPJESi6jVqg5yYaV7hVDio0iUKz/f/woi0ER6d1tBoyOAleASfVDEcurJtLQvcmsP760LAbcs
 HFb+20sR6xqwDmR+BeF7q9o6k7NgJp0QXuXAvpPIFna9flcwXVJg2jZ2uoK5HFAtO0RWmnXmQpx
 f+4k9p+NX4qYitljZfncVsbaOiKIjKereJmle2M1muNAJEFPM9TacY1qCKM/+1GSGZBdlZElByf
 NQI7sCHrUMHf6YATjrEp6frvmszZj8qL80NTNdqN7xWoQ3M8rf15PqM7UcGY/q4eoQ19mYGogD3
 lvUtGAkCda/tGEEbNICiyPdfkOFPJV0SL0nFHv3Hb++pKVj5Bt4jSacj5ECJW8/oPzR6LiBvORX
 5lS7QUCgOJrrDfzc7mcc1nGWaN5FH1msu0r0eht/ZCHYLuNfRcP1c7mU9GUiXvyy+dGO4KwvC7b
 Y2P5EFnevB36+1D+ugQ==
X-Proofpoint-ORIG-GUID: Ab6VvFmkFvX4Ykev9XZ89cO4tU6-8cc8
X-Proofpoint-GUID: Ab6VvFmkFvX4Ykev9XZ89cO4tU6-8cc8
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aac6e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

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

Changes since v3:
	- squashed 2 dt-bindings patches as suggested at review
	- updated yaml to reflect the new port supported

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


Mohammad Rafi Shaik (1):
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

 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
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
 16 files changed, 384 insertions(+), 162 deletions(-)

-- 
2.47.3

