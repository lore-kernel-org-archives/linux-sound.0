Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0493315761
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912440; cv=none; b=b2w2ySGanNG9T3CJnKViRYAFtMiEl0G0BnDkjz7s4dc7lqjmS+uHTPIi65KK8aQlCw2fs+QlouNEuujifecszMdi91f5aXs37udwIyZ/6dVuw0EtF9+7H00XrNUEQBpW8QwLKQLCiKtagQDxKOcl3Tm5u6YiHepT56MZ+buMU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912440; c=relaxed/simple;
	bh=N9pCrJsrksPZHbfTDg3q0oMKXZzLcwpcCHloRxnFnzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jOSnBLTnwvdGEjeqyPhPm+uZ/SDvYq3YwZtfL05DR0YbdcYBZkzBuuv4OlIQBj7qG3ghCcrPo4CeZGQ/S95fO6mR05D0QlCDUM9MOsUYA6x4d0F5bf4iZ9H113u43cgqYZ7rxD0xO1bxl5gKdXC2J0swt9eG0Jq60DNwviZxzXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5VsLliO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5VsLliO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx3vR029306
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 15:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mDN4FfFt8TdXKMwEo9wkMwI0x1P9k50TGR1
	4bDK8xzM=; b=W5VsLliOExXoWdTEvI97N03SCEg3k9x4P3WY3fbXXOhdlm0m/Nw
	GUU6QMpf64C9ZFE60FGl3wX9TonziiRYH9mrYWKRG2zZz/ZDsQS3/nKlS7x08Nza
	w6a6c+OxFAt+PS7Ab8bggQHKyzsrHAKdv34MatbQiAlqRf6Sor04YyTbcvmjgyVA
	tRnLrZlGt54grw+VGz/DvQZurTJBjwK/K4/khHx1engzjqBoqsEsBk+G0M0/PQnU
	foIH1XdO8yrTgxxyAxPHtRsAvdJaoAjwNld/rJ3k0dIPJ/99l8a72uY4W6gvDm+i
	wH1OBRyRjNdET5WdoY2E6qJfu+aBUIeuD3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw046vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 15:13:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244582bc5e4so427105ad.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 08:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912434; x=1757517234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDN4FfFt8TdXKMwEo9wkMwI0x1P9k50TGR14bDK8xzM=;
        b=Xn+sYRuz6jzwhMQJRze7pFBxgBelzD/lpfX7HjgBlcnmiv7sYXloJ0EDMwASJS4cq/
         uzllzPsqg/JLevgDuUbsEV0R/uyUmB5bdhTGyFGGyuKwqFpEGb3AUaRjzz+rGwjwFNom
         3vHum3zI9rZ7dmEfiati2xcn1EXN19CLM1p4a0t9fLwbPN4iUa4jLAEnHEjx9LcpcUEX
         aDe5b8cK2KAUlsxPHooefDP6J71VcJ1zeqVqcQaaDAL+qrkP9W0in4u9tGMjz7L9v59P
         brPiSKR7sSwa16W8Ya7H4y62fngn3RIQwxWzEA+h0pk2cM7gtp9ZTNG4qJtlRiWqtER+
         Efkg==
X-Forwarded-Encrypted: i=1; AJvYcCUKTwlEtgc4Yv/qZ0HtKjE1dqF16lL98TLBLt/QOOSTR/a7rcgSR1Px8Xo5XV/oppzvs3dhmhz0ruSPfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxaO/L5N/AfajlBjvvTVpzsIh0BTh356R7oLfrqO9VNTjvrZ9
	7kGTqM6+Ff+pQ8+AsU6vk7xChBpBYJ5Skl5A9C9orgQAmhvlgC1YI831ErzP2VV/fDvEnhZXRLG
	jbRltljTm2qPYSox9JlxKZSUUbSgCXAY29JE3fvK4RSwclo0tQuF6oFTkzbEi7EfhEw==
X-Gm-Gg: ASbGncvBX1W8tmVhT7uxcG3OzxrqjW81pjmAhA2p++0xzAsWoosSHt3BLnzoAGhayRh
	pHoig5GcXwGFUS0L8/hNHn9BFUhgO+c7qnvA2Vdt+lp5k2WID5jp6Yn3k/efTEEDQX+2E04fYRq
	BcnDecDBDPy4xsVH5wuXnA0pdRzSX0Lw/E22gWrQ2rQAUrfKXhF8eVB47NuZ6Xzv5ae7lMd0BRP
	zPgCinFRUV65QKpCrdiMO73grXzELxGuW+aaBqa/qwemy82lMezZrB0K+A/T3z0/Yj+6jz2rjY9
	9KEnC+heBWuoX+hLX77GiFjPgkZANgHSR2USSCdYAWZ9rdEfVGizkvOF0tGlNg19zQgqwVtgrIB
	u
X-Received: by 2002:a17:903:190:b0:246:e8cc:8cef with SMTP id d9443c01a7336-24944870a4emr235877095ad.3.1756912433733;
        Wed, 03 Sep 2025 08:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsAqlt44R0py+c/3EHwlf1O7gYiuEg3aN1wafjI9wkjmT6KV6B7i2h1KnrO57/tqN0i5gGQw==
X-Received: by 2002:a17:903:190:b0:246:e8cc:8cef with SMTP id d9443c01a7336-24944870a4emr235876585ad.3.1756912433048;
        Wed, 03 Sep 2025 08:13:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:13:52 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
Subject: [PATCH v9 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Wed,  3 Sep 2025 20:43:29 +0530
Message-Id: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sRB6Nxn10QdJgjislYr1WiD0Ryrmg4Dt
X-Proofpoint-ORIG-GUID: sRB6Nxn10QdJgjislYr1WiD0Ryrmg4Dt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3veiFKiFqWvq
 0sGhVnUmS4K+5nCHKadzexwHhhFr8uWvHRpRJAvvG5BoP5XArup2kuqtYVlzKULp1kLqh9P9yFK
 lkvzlcRkKsbrer48R3ILeqK8Oql1K8hAupzk9bgeSkjdHSwxrVsIYBNhpqa54YlkeqgSNJ7x20r
 5vxk7o96il25LNasZmBlKkC2FyAy19aSKFwwVivA1erhXwIRCJoaFs+BDyD/rNTCWzXgaTOWAwy
 AgpXdrsI45XBg/6BLJllowN8KVDrYlKS1u9w1QIcNihe+6QVEnYwClmcxhECVU0hA70sDPMmLN4
 dwn+I+pqm5L4iV/EzN8LHmsRHgoeijJZiVGyxmv9GZysAPqjl8MFycUQx/tzxY80PiAtGH1al/Z
 AMW5rWx0
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b85b33 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=eK7tGN94E5jGERbYYjcA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the
required dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the
same SoC  platform. Therefore, the audio support changes are included
in a single patch set for consistency and ease of maintenance.

changes in [v9]:
	- Enhanced the commit message for patch 2 with a more detailed description,
	  as suggested by Bjorn.
	- Dropped patch V8-0002 (pinctrl DT-binding) since it has already been applied.
	- Reorganized the patch series, bindings are now presented first,
	  followed by DTS changes.
	- Link to V8: https://lore.kernel.org/linux-sound/20250821044914.710044-1-quic_pkumpatl@quicinc.com/

changes in [v8]:
	- Added drive strength for all lpass_dmic pinctrl nodes reported by Konrad Dybcio.
	- Rebased changes on top of the latest kernel tree.
	- Link to V7: https://lore.kernel.org/all/20250720173215.3075576-1-quic_pkumpatl@quicinc.com/

changes in [v7]:
	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
	- Rebased changes on top of dependent patches
	- Link to V6: https://lore.kernel.org/linux-sound/20250715180050.3920019-1-quic_pkumpatl@quicinc.com/

changes in [v6]:
	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
	- Link to V5: https://lore.kernel.org/linux-arm-msm/20250625082927.31038-1-quic_pkumpatl@quicinc.com/

changes in [v5]:
	- Added separate patch for QCS6490 pinctrl bindings.
	- Updated commit message with more description.
	- Addressed the review commnets.
	- Link to V4: https://lore.kernel.org/linux-arm-msm/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/

Changes in [v4]:
	- Fix DT binding errors by adding dt-binding clock changes for ADSP base platform.
	- Link to V3 : https://lore.kernel.org/linux-arm-msm/20250520062618.2765109-1-quic_pkumpatl@quicinc.com/

Changes in [v3]:
	- Added protection-domain in gpr services.
	- Addressed the review commnets from Konrad Dybcio.
	- Fix DT binding errors reported by Rob Herring.
	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250429092430.21477-1-quic_pkumpatl@quicinc.com/

Changes in [v2]:
	- Created dtsi file to handle common audio nodes to support Audioreach.
	- Addressed the review comments.
	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/

Mohammad Rafi Shaik (8):
  ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to
    support ADSP
  arm64: dts: qcom: qcs6490-audioreach: Add AudioReach support for
    QCS6490
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-audioreach: Enable LPASS macros clock
    settings for audioreach
  arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 .../bindings/sound/qcom,lpass-va-macro.yaml   |  23 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 207 ++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 119 ++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  99 ++++++++-
 5 files changed, 522 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
-- 
2.34.1

