Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB337399012
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054798; cv=none; b=DzdIiAI81633HgSOdTlWNjPLDDMKE+FT93rKOvcmyHrr+Vr24kLL5VBtLf1/GcZVCsMhqQkAWspZhGx3OBXDQI7taGDBw/v65btseOguJtrdoimjFa7DVFvBtLnqcZltNhUcyAtbilpBUEYhQHi1lSfmDCgei2hOFKwQvQMWkwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054798; c=relaxed/simple;
	bh=BdRgGWd4oEtLj76eWcDHQVOoxIh5X+tfa9dViGZtSdY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i9f1IPCHomS2PN4pkk7rn4EtA0inM/t8LvHnJIGEnPj1GEd4tsZUAVVrMWznxMH/gjdWeywhxRF9qMPw9kLTHh7pWiJS79kdQgBT0xLq2gZg+W3NIvlZVsYuFnXicgBQAD6yjnBv+qxIUWcP0LdsUjlEBzXfSTHyhquVui3i6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3HOekDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkCQzqFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3HOekDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkCQzqFy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AC7a51128815
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 11:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eQ+fi4cz84X+kwu0n4tPfxWg1Db53dlHnYM
	ir32ibW4=; b=R3HOekDFpEIjuu0FJBqV2HMuwu6QSrSlfUfSw1wNatc1q4A0Upf
	7twztyywgXkAwk8C4DnDtPg2EyUQTLquXuZSkwqTIc/dg2TIkDr0K5wa4GXtozfT
	mWTn5yEXLHDs3y1CRqbREPcyw8ZWqYsJw/QRnW0a4+1deWYRsCBKwZJR1fJOJPaF
	Yriq8Gk4sVVqJukqlLZG2TaaV+bunFVBQ9djQELueqMnagdI3a3+nlRaUG/3HMJ6
	2231ZX9aqK8+t1G+GCye65058csVLCxSgn8QcI0mqVg61g6Nd5UkDkUQDte7lQeV
	w1t1QsvmDcOoERdKC1ZYZlzW2EFSZYE/IqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8d2c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 11:13:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4e9577ceso385682875ad.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054795; x=1773659595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ+fi4cz84X+kwu0n4tPfxWg1Db53dlHnYMir32ibW4=;
        b=VkCQzqFy6fkMtC/V+X9BTQMbF9H1nJFf/JRiVGa24f1rrhpolSH7lE6j0ocqSPZ33L
         34CPI/AX4c7YMRZ2PHoZmZjNB5QPnH3ze9JhwJyiEkUdT/aknjm+DZAjjmzkLRSSAlHP
         08dd9913F5Bghn9dsfGOjkzO59BkCXb4w8SHDjbfHIfOOfFOEOjpAyqagXawo2LFVErS
         RgZAxK7WqPmqGxdncbb83em4KRm+CpGnTuSe/Mgij8u518exTcegmCRm6mPDK5vBKUN2
         mm8FyrZCe+oP22Dv1uK6ruKriVQA3fYVQOlmk628bTEDzee/L2YlzO6ob265oPKYWi0t
         ASUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054795; x=1773659595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ+fi4cz84X+kwu0n4tPfxWg1Db53dlHnYMir32ibW4=;
        b=Hsxh2H4uPfeB3M1PkQPKUP8EaIISnm2H+wfLCdQpnARO96in4bN3v+T4BwLXktk6UT
         pvLJQu9uH76zXrPSytsQJkyItKoN/NqXsfwDOEx1yBQz0qJmOwMpvpJB9HmXhvIvXCB2
         xo4nqCi8ucY4WZMHlxL9DM0CAU+MoMr4uz12ULizDIGKBSlu+56nCgMtRKGHQ1HwE/wm
         gHwW29RZPqsJXURH5AVJXxKsmKKNjX1/P4dXWmW0XO/fsswSuLQ4DWdkchN3nCz0jpkm
         KciH6wmuZJ6cNMsBSLHw3P0YkLZ7ltwJ3A0NqnpMmOS/CFihEIC5epoDaDD4d4fiE32p
         ro9g==
X-Forwarded-Encrypted: i=1; AJvYcCU647cTC6KewCiH1C67ieEdibRWKKk5q80QIdrh0GDagyG6S8fnjN3xAcp2QWPsRhfTAW201uRb7gN05A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxJG0C65KI8JpXjygBuEmJ2CPG/EJeQ0sEizrLve8WhWQXyAH
	7bD1/YVDbCRaPGJOXZ2nQ1alEA0flzw77avModF26yO/ZUUuVxRtn5o2nlnPAdop4YpyaScXpe9
	ioOaVErX7zoPq3pVM0zQ628mmDPjQrHyQdYmTrLOV/ajlTrq+dw1ZrUqaxh3VMVdumw==
X-Gm-Gg: ATEYQzyGNIqCy4baNlCS1Pwmoqf8SaOidrywC8of4NCgKvtEMz9TIL1DO2rQqaVdGi6
	ZO+mZayKeb4knWUCs/TC58GBHSPhb5jmwxGXuSOHVA7H+0jm9LVMnXqoxylBvoYQvpiPYPmSCpb
	2X91ht0ql5a+WMATNJC8ZQhfHUKOveCudBIaBaNsWV/EuYP7N/XkjfJkK+G1jyeEv9qk4HC1A6E
	qEBd1G2Ztg+ggq8C5nI8y0S6yuMqmUyHbGpk/nOUawLO19aW5LvLHkhpt/+rcJEvFb/R/BSlYXJ
	cilfKaUq2G3747EigvRW1b/dADxR8lvfuuMkS5mwaLyS1vONDxnzhNnKQLQz8cJaMdDHcnx3rGH
	ASVWQbWYoaUiWwFiAKwlV1qVUph/xfxbghWZqhAZAod9E+CIXx74+gbmDVA==
X-Received: by 2002:a17:903:8ce:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2ae823a18afmr97942845ad.20.1773054794732;
        Mon, 09 Mar 2026 04:13:14 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2ae823a18afmr97942695ad.20.1773054794301;
        Mon, 09 Mar 2026 04:13:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon,  9 Mar 2026 16:42:56 +0530
Message-Id: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O-OlEnzi2bI_OGOaUATiwqP6jJVWUuZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfX6IZyNyyTQZ97
 7zcWxTqo1uE1CSGa5FIaKQ9DBshh8/c8PfAmQcQeZHKn3Gl2DFimWCtDxOGeJ8PhW8rhwEhKVhU
 wo2KUI38G3S4sk4iCYPbr8pAPnj9rdnKotlQ0HeJx5N7q7jHRk5d2JAiD742dxc4dGM3kr109Z3
 tWE2MeK2D2UtBi3AwYLQa9Y4qq0KF1CY3LHpMJnZHgfSV2r2TgdkEC3i8e3asGMVTHI7rgojPoC
 6bgcOEcwFyorUhwU5nlPrTgrdcLxGUCwR5NxkO+E+JTXB7yBjx4e8UA77xc6jN0wGCJyclawrBk
 ObzYKFHWw9dPm/5eYmnDIMRmQU1fKtiql9a7yjH133BtMcLtHVi5whveMwlSp1ifFIptISNBRwh
 OTbtVHg0CjezCjMoGq7jlygKUGSbkNALpSw+gGS6xj/2de5LWmctIcyK3JUhHtLXkTdfr8nrVw9
 bzQXkKzv068bawKwzrg==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69aeab4b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=K1zzXB5ik6AW7qICne8A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: O-OlEnzi2bI_OGOaUATiwqP6jJVWUuZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Enhances the sc8280xp machine driver to set the boards spacific
configurations, some of the boards like talos using third party
codec's which need's additional MCLK settings for audio to work.

Mohammad Rafi Shaik (4):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: qdsp6: q6prm: add the missing LPASS MCLK clock IDs
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
    board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  41 +++-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 137 ++++++++++++-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                  |  15 ++
 sound/soc/qcom/sc8280xp.c                     | 180 ++++++++++++++++--
 5 files changed, 357 insertions(+), 21 deletions(-)


base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
-- 
2.34.1

