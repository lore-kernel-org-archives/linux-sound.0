Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B37233933
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611375; cv=none; b=dTQepmtgZoNlzLdI0vAReH3QjfB1z6cdpPYctVVmtJTHVRolxQYWwIbEGW5Rnx/8o+Kaajc2RtRmi6qAuW7Gs3gL7pLRZvLJdH71USjO+fmq8GLaZFXrXlEMu5hZtQqHiTg0mxSxk3pmeicktH0kaElBZUT6dx0cpyhA3ZI1x2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611375; c=relaxed/simple;
	bh=dzSHSg0tnYOpMKohtDQniZjREcPmcvX1UrDWM0kbu3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATfsxJ/Rf7osGV/EeKD0XlxXskDVJ+Rjb3PKKjlAhWG56GyW2zrPFQnd3ciooxLTZE0KJTg6xi2R3GvtaZ3QoJ8P3PD1u/rQnsHaYt3R4QDU19GU8OsRBm2QGbwuIFdZMkfJ5khqNt8Qzzp732dp7JhuCDY+wIr03bUl5eSsJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtwHu1lA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2m/J6di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtwHu1lA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2m/J6di"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1KVnB210531
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qmBBtsE3gOQe48Sv12+iXY
	x65A6NntNxZLh/Y6z9vBM=; b=mtwHu1lAK0dA0gogAIrj+W7dOfbt9yiAucZeW/
	4AJQKBOk/Fho5rJdsLOn8z/+lEJTQOs7mXcmiP5BM4vWa92CFiS8PnEoEXrVgE/l
	jDR1TyYoqeZouDsGZY2FXtzWAHhzWH+PcOm9+ST0ebrpMM9fmCNeq3zDhuKKeDdi
	pFdPWqbexNtU1HMloqIoz9a3Fe4zstXd4iu/R7YDtmZQDDInPlH4JAvulc2KeKvr
	mCognNM3zdgSXlo0z5WlEXHWGIfQteO3BAI6iEuqjAdphPck6oB1CphgFHYQZeJH
	LGf6u389aNDmk4IPwUrKJBJKFMz7aKLfqSS78NmRsXha3bpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8t3x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:16:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so701346a91.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 19:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611371; x=1790216171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qmBBtsE3gOQe48Sv12+iXYx65A6NntNxZLh/Y6z9vBM=;
        b=K2m/J6diu9wo5IG7OHXWbGSEyrWC8SfuGH0gNHMJm2buXYbHndcuKHEyYy7d9ePAPa
         dP8oCqIMoGk0giYY/6Gbqmk8YNLxlpBtSgDOgBNjvbUQXPiDxza4f6Pl96e5fh03Wbl0
         MPlzhO4XFUnmVACZMax2249HBYMLYklv0ISnMGiPeZ4j6D14ph2+HA9VGMFT1qFHIQ1G
         j4l6AZ1D+3a2akSs75lfO5TItbiqqxnLjMxwHFl26yaiJ0epx9RBXdo9NNT3cqMc6SVu
         Td3/jTsH4RXj272iwFW8jNTgAiXDCsKqi3HFbgSGElOWnNgD1KQ/L85eQJkIDjUgNsHA
         Vp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611371; x=1790216171;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qmBBtsE3gOQe48Sv12+iXYx65A6NntNxZLh/Y6z9vBM=;
        b=CBZbu+duCeIrUCPsEbxt6I4IVB7lhbFOu7GBiYYY7+XIXn9WCX6KyNq3SKqQmLlbJB
         guQyj9+A6G3lRYI6hDXFb9uLn0RA6YLEzZQsZ809FNvJu3j5uoku0w2s5nSBC6Nm03TS
         ImoX8eJ6rES/W9xi4mrhGwOIdsvUQbzuBo7ncJRjVCYzIuLrqLgxBHKE3qIblSe+FxUG
         33ATAKWbdxdHzFKncbAmsJItcxWhsnBMtrkShsRKPoF6opoUm3hO6WKFzSxPIOb/ks+t
         AMTM105klztcl4INFQH0mL5otChPvzZgNfaV2JZqJ7yNdnH26wmClUwbCMKLQVsv1PLI
         Mt4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKwEK1y01GSxTXi5joXUZ6zNOcAMhHl9oV4kuaN+d5wxspKk/J/yHovgUarzzaBJ9BKpe0J3UwJ2r40w==@vger.kernel.org
X-Gm-Message-State: AFuF++nun0+56g9TtLNvdYyWtzNAtdbw+OA6o/yZn+V7B3RXerne8uB7
	oPQt/ojgosAqg1ISSPLYNL+U++CQIJW6Fh8qVRXzv1wjUnYj2pFsWbinsI3L7yB0k+q8XA7pCvw
	oBrV3Gaw1Jbegxa/SV1vrXxHxLZ+Tc2y1/WxCJyMIVMG0KQRpvVZVCVWaGLBfBDKZYe86ujZ9kA
	==
X-Gm-Gg: AYBFou2LB00Vw6KUO4u5BKETrBqc3lVFk4XflsdhBc4E668TMbq4uQbzoFv9CebL3dX
	ryiO+gUcx99FjSE5oPnq5f+MONeph8bA0mbFFIJAaY5hlFd/12jiW/0Y2+SF+dAnX62ITerg2vA
	GNIXz00ZLe5fOxdn1FPPtpzVQg4QDnBOoKrjRZRdjixV/6qKRsW8nO9i0r/u1sYxrrQVmMDQTX0
	fj1YfQppqwGAdx/GLlaUa5xt1lnNLXoaZGz84pBYJN0GhZrw8PlaJZN3POlFfOBgfxGjID3cIOC
	SyjJpEA32pCpDsGyaokX7TDSy3iWoWYkJAId9f1w6ZTjlawiYT007Hd9WIwcP0FU4QEYwhR7AIn
	a/8FqstlPG/R3kUHpEH35lQ7PslAPXyEUuiWC
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10500895a91.20.1789611371074;
        Wed, 16 Sep 2026 19:16:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10500846a91.20.1789611370615;
        Wed, 16 Sep 2026 19:16:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:10 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Thu, 17 Sep 2026 07:45:31 +0530
Message-Id: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENNq2oC/22NQQ6DIBREr2L+uhjABENXvUdjDAJW2irKV9LGe
 Pei7bKbSWYyM28FtMFZhHO2QrDRofNDMsUpA92p4WaJM8kDp1xQyUqijKmxc4+galzG0YeZcMp
 KwRolW6YgDcdgW/c6Tq8QC6i+GS7N3ep5f9tbncPZh/dBjuzo/iD0HyRyQklrDGdcaiGFvnjEf
 FrUU/u+z5NAtW3bB46M74zRAAAA
X-Change-ID: 20260917-add_shikra_support-201761ba9f1a
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2967;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dzSHSg0tnYOpMKohtDQniZjREcPmcvX1UrDWM0kbu3c=;
 b=AxnchDvZFo/t9BYXU7cVxFtxJK51uFZ3lCpjZnnicjxOZXdZeq+30HIJbXfJ8PHGrKzVY09fd
 M9UmTwFlo3LCyOiIULdQS7ayhFXPGJwV/NJOpOKrA2r4RSeLcy2xihK
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: fLZU2wBpcfb2riBFe4jLh7ifZoPTfQ-B
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aab4d6b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=doChDUTQ96gpDzZ_M_AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX1zRDqVI0s/uZ
 LHFE629sCikBvM6QiZ/X6uJhZPEZ84Di5/wwl/hRXss4Yllhg5bHjGdrxT6cfiV1Uwla5NKQi1y
 WzIwNIiHPeV6v1XkT47IVm82pq1lNx4=
X-Proofpoint-ORIG-GUID: fLZU2wBpcfb2riBFe4jLh7ifZoPTfQ-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX1IfafeyhBHgP
 KAXqUo0p6CD02jmXQobb/2Iq1VX0p13XU8CF9CYNqW7G99NCXLY6fe57jFeJqkmsCX/kNcbIvRl
 pXrLXs2GLVJEtmto1OXL9uYgCQXCxdy/D0+1Jef4n38Aygl8Y+fKuGRyDYYlUJxhE3PjZqkVCZi
 XI47yu1S8SwREc+kVDtz9TMdv58SvwyE9q1bF9nKCP4ulmQ0joRCVaGEyrM2P9XYCyqpQNAUxAb
 TdiMwzdRqRrLDmJN31MQ5gpKajVJYGvqyonR2KFUtpnjqWWmWyljc4gAgcRYD3wItqIKZgNJCZW
 kpdmAcLJ95HsIB99+YmT2KnS8xyHrJEoGuDiHQQUfz0wNQqaGpPC+a5wFneo5JgyTuo+rE10jCg
 nOh+IofiLVHosavAD86JTchHzb+vz8Gik/AMyRpllKpKf082c/p/e7vjNa03gVd7km/sr5i0Lmg
 8f1r1o1xNY/qXpEo10Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

This series adds support for the Qualcomm Shikra audio platform and
extends VA macro functionality to support SoundWire microphone inputs.

The first part of the series introduces new DT bindings and driver
updates required for LPASS codec version 4.1 used on Shikra, including
RX and VA macro support, version detection enhancements, and associated
register programming changes.

The final patch adds support for routing VA decimators from SoundWire
microphone (SMIC) inputs in addition to existing DMIC sources, allowing
audio capture through SoundWire-connected microphones.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  17 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  17 +
 sound/soc/codecs/lpass-macro-common.h              |   5 +
 sound/soc/codecs/lpass-rx-macro.c                  |  14 +
 sound/soc/codecs/lpass-va-macro.c                  | 366 ++++++++++++++++++++-
 5 files changed, 403 insertions(+), 16 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-add_shikra_support-201761ba9f1a

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

