Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02443C069
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311657; cv=none; b=UBD+jezTWb+uyIFQ2vjU6UKEp0JNkoO6lkJD+F92inkKWmpbzq1Wg0oKqWWiBeY8K3cmQeosh/oLw+TW9/VRv7T7lZ+wHLG5wap0MjNrAz/n8GVPmbMDMmQCx4PNy9HV1p/aCYmqsmdnXAQ00JAXHc1pMsE/6vaMnrMwP1X3UXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311657; c=relaxed/simple;
	bh=ot4v7IdT37glVkaw5XYs6V4fekuF/r4NR9cPsZOo7xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftxV3iU0JS2fhYF1fHb2MwWbi9ixAQd9ALdPyLtCT8v+e1lJQwcnpBtK451SIZEbxWxjxoW/VjaAv7T/Jr7c7OZ9A547jkKqQ/MiOn3fg/mrB/KwIdwPHg4HYBOqmiqseI1HGt3wNjPCP5rcGnJVsOqZojdFWQymY1PcYqdbNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oh2IP4iH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RllArfxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oh2IP4iH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RllArfxt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BFDOB3237223
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UvYxzqUmTdcxy05mKK/xRePrWY3EtR0lgj8
	e+aweGHc=; b=oh2IP4iHSqxvdR0VYgXdpWDQ05JWBIEFyXueor2E5tGeNv3d8N+
	EhDBrFmcyzG7btpZAxPB2hbS2Snk4MxLEYzmvmHmBa2/9Iu/s2aQbtTAuuDbePwT
	EqGPL/7091D9SGqvUQPvB5343QFt8AlmNfdchr0RpcO5/oxOiUzVZjmhqpc45vIe
	qBA1hK4Gu5eSNJIGKNZGeqn/F7TS1gKTR9Sxwl8wB3vxW6JXhKhU8wUOPSZeSC9V
	kI48g2bEypDiK8Z6xu1f3qHdOjlIRk8CI+ci+q8DgNdxExWex+Y2ffA2YuWZPLE5
	hLFso65DeOq2sS1nqv7sGIRu5gVMLbb+Tww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp53h8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso301820485a.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311655; x=1770916455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvYxzqUmTdcxy05mKK/xRePrWY3EtR0lgj8e+aweGHc=;
        b=RllArfxtn9cU91kPlWchcOmdw3oCgm9cApFY0JheREKd0TSybJ+jKgGcgzjyraU2jH
         Nv5R77noHdlNTnqxwxCL/FXfVhBUHTJcYcbNziCv35UzldTWtUSNQBize/HeeuFIOA3V
         Zi0NkuAJwSMHRoT+LHFqVfEFqgd5oyvFcdXZdkrnVifQRWhHOCcCWqswa2NPF1w+P9ct
         cTAyLsgic8EMJLs4YCezo0K1RL6QsvGtB296Y9hUliVlrJLTxdLXFFy8I5s++sApJSac
         WwjM59qvsv4EuYnXnl7gxTyHsMySH5PUArWGn5rR/XDNRV69Hka+s/JHOYqnypO0uy1w
         MEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311655; x=1770916455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvYxzqUmTdcxy05mKK/xRePrWY3EtR0lgj8e+aweGHc=;
        b=dbQrFbljHAiAwJ4ExB26B+qfejG8ZJy8jlDvj7AuQKYs189E9+pIKlRpqt3YQYTTJ5
         k+/x19IfYkqRB6h2bsV9+Yw6VA4TtgbIwMMp5lFQXRrUqoL/4T1csm3LgCXCXjhzmSb7
         iweDMKgpN6bJDohHOeRIsXo5e0A0L0w5i57A1pi6vTdX1nE1J9xe129JXzFymhtYDK6H
         tuVj7qd+OGlQjcRFCskdQEMzWakhqWDUkct9tE0rXSztQMHa3H+GzkoPb29E4yfuEBXm
         H09gZQ0vbVMHMztUQujoWHuKyZ3h+LuttPGO+GTjZ2+0C4mkpk0Ky1Mt64BjHITyGnuC
         8thg==
X-Forwarded-Encrypted: i=1; AJvYcCV2IeN6g0jpP1Os1Zt1IAuayRfg2StberaBFSqfWaYKwY3EHyTqhBqpqocIPKWLs1G31m8mSMOKZI4akw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEFoZTzxbRAJiCcDgu9gwA3gAn5M2B1sCDxQa215Xi/vDAn6j0
	zU8znmibZlWoRMxyM8m/NH7DmOw2zgKHDtC5SKPJfeTnowYReK0S1Vu92u87PWFsGDM5oMcaTF2
	DYvNU8wB3DI1vcneE26eBPmsTaBwhck2G1JApNTsZuhdbWJnYE11l1Emp/NXX3ryXHg==
X-Gm-Gg: AZuq6aJ/m1xi2qxy/FKCV5EHJrvz8o3d6T9Mbea9Gg8mTvLF0xOxniySbGWEWmi35yK
	g690G/Zx16n8KcjVhuBzuEPLHOG6Carw+ZzPySVRZR0qzY6y6pDL/RaRgLXNCJ9b9V7E2Z5fX6Y
	wUhRGBQS3NgOlbtGxglM4HCBhH8nCGP1Hw+PjdweoqVAL04YoLWvSmX+r+VynlhZ1h80sNcZRGO
	PDB9gJKjKOUmafV83zj9l6BvZkSAcZoyHh816gYpnKnSNGRDQJN0txfdpBekJ9NZOZRV6kqCVc9
	uKnuz6d+QcTWc7Z+1gfg3uEgDK4woy1gRTf4Zd3MhyPBJx97CBIzXB5SfgnA/Ic9R8lnv0R9KUF
	VeRAOdExghn0W3GYFX74OHXzB0Pqumk74rvE8bjn/xHY=
X-Received: by 2002:a05:620a:410a:b0:8c6:b05b:1f33 with SMTP id af79cd13be357-8ca40b65b5fmr426413685a.9.1770311655239;
        Thu, 05 Feb 2026 09:14:15 -0800 (PST)
X-Received: by 2002:a05:620a:410a:b0:8c6:b05b:1f33 with SMTP id af79cd13be357-8ca40b65b5fmr426408585a.9.1770311654774;
        Thu, 05 Feb 2026 09:14:14 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 00/10] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Thu,  5 Feb 2026 12:14:01 -0500
Message-ID: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=6984cfe8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CdGEBIRw-R72dx1e2_YA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 01_UMi2zlsKx5CJ1nprpUphz4OSKTDfH
X-Proofpoint-GUID: 01_UMi2zlsKx5CJ1nprpUphz4OSKTDfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX6VTZMeMaP92I
 ReBysoGBOAAVgoMwvCr+e3S83g+trfK5ZQZlWdwfxx8aWky5ASJQ2MDeFM0SllvRBFFHvX9vxLY
 KJS+Z3uzP4C0xvy7o8dWAXuo+RG1kUeNzD5Vp3pVvHQrqRlcT+1VqXZ1A/i1LNsn5lou1sh6TYj
 UNACTp7ga5bq3TyUXFh7D9DW3+yUYLHUahKC0HEyudv+VtbDjd3tbss4hnY5ijSXEST+8Lh712v
 8OV8Irf3w2xvT4O5/8YbJfrWOUYQdKl1Q+U7+I8XBZA2t67Miuu9qIF6h8Tzu+QelfI83jzXpAP
 Uclu98T4EbRfxV5JBE9dPbBjVY23CcOFN0uPGNuJ73mCKuRYM//6KNvVT0S/IjQ06OU7Z5ehXYE
 2tc49jZBXq1Zl6Wvj2a+cLj3ohYy0pvEfzpynrKFYjD4Lpd/Q8Q/KE1Ty1VsNuBbHDjCUHjsE/G
 z3HsFVksk91++XY5Klg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130

This patchset contains few fixes for the bugs hit during testing with
Monza EVK platform
- around array out of bounds access on dai ids which keep extending but
  the drivers seems to have hardcoded some numbers, fix this and clean
the mess up.
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

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
  ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Srinivas Kandagatla (8):
  ASoC: qcom: q6apm: fix array out of bounds on lpass ports
  ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
  ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
  ASoC: qcom: qdapm-lpass-dai: correct the error message
  ASoC: qcom: q6dsp: add support for LPASS LPI MI2S dais
  ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
  ASoC: qcom: qdsp6: remove search for module iid in hot path
  ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

 .../sound/qcom,q6dsp-lpass-ports.h            |  13 ++
 sound/soc/qcom/lpass.h                        |   2 +-
 sound/soc/qcom/qdsp6/audioreach.c             |  60 ------
 sound/soc/qcom/qdsp6/audioreach.h             |   5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   6 +
 sound/soc/qcom/qdsp6/q6afe.c                  |   6 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 105 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  47 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 175 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  20 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 12 files changed, 361 insertions(+), 157 deletions(-)

-- 
2.47.3

