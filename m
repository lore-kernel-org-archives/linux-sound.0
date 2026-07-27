Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D241B8D9
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165170; cv=none; b=XM89djdRsWNbizptBjj4nP3fhShSO8uwE2/VV6zfmZX3cqdiFgjx4F93S+V+XlTh3VhDN+9Bpp1SY6XKphWYxtNeS3cZBO0IfIvjyyCA5p3UTkep0jEAOHsZO5JyM5uDpkqOTn9z+FXoCn1nhpv70rc3DyDKSOIu9eTgpvIH7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165170; c=relaxed/simple;
	bh=X6GslZBw9WDYaLf90dc3c89oMdXy2p8giiAFf9HTeYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z4fLj2xRtI8PLVNoIQ4F3cTwHvOcn8P516ozdby3IOpcLsETc/8Y0qv/kpXBfoHWO/Tp7QYQrNOcLv3a6vFkkYKi1s9dHLottJ7m7DUbVr+OmNhUy9hDNPbfNjf4LMR1GyIl/aMgIRRI8MB4yvR0BHLsrENCuBMg5qNHtBW/1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iURbuES1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+VQyThL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iURbuES1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+VQyThL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZJ14115070
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Zq+RFnkE+KGc27ny8j4uT
	2d1IIiK4kFF7h4JELICCk=; b=iURbuES1tqksNnN3jy/AHNyE9RiFZkGTVMOoVV
	wbbjyi8l2BlnA3JFMlpmrnqTYz1usSXtRWn7JwyLO1GvMAGpmNXQTSz5J/QwgD0E
	vxA1QikwN1nh6DdmFDtT2LgGFCUfvSy2b2yrvV/L0t1OUXTxs9aYuhoNNzjF5cka
	dTheLQ8S2IvIBUWPhxXPybz29Iz/KKp33ytaBc6UX/rsEH9W4D+HjYl3RicxW2mU
	CJmzq4ToVU/pR9GXZQg4mQB0LiLxEjMlHgGFF0k9MaIf7LHy9JjREcud4Gsl5pgG
	eN/pQvfeuLpM5ciA152pqERxWUBx+P/HwMA74uq0AEdC5sCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsctf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so36608585ad.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165166; x=1785769966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Zq+RFnkE+KGc27ny8j4uT2d1IIiK4kFF7h4JELICCk=;
        b=Z+VQyThLvBd1RU9PX47bJCKK3mS8RIZPCnR56AkAmKdzNprihTKMSEW1+IotsOcXjW
         +GKZLLHE5/Y/fxhkZLfRcPGGbmvC7qh7z3kFz5oZNm3H76ptPnmzTumemleFD20vH8bA
         fi8qQ6+cTyrtVCb7MQT2ZaUbIETQ8nd4B3k8Opm6sPNnUSp43vm6st+g0rqoZ33iVh0q
         S0h9DE2B8lrBwIEa8+GCg2BB4NG65KVMnXTcZFMVRDVi9GU8jKvRG2thsd7+f/Ep6SfR
         p3aJrVhGHAqQBfqvL0LmQ59vCl554GqGZYOcXmXU4TD0e4p+5+9M1TGL1eMpK9CrG/M6
         9g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165166; x=1785769966;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Zq+RFnkE+KGc27ny8j4uT2d1IIiK4kFF7h4JELICCk=;
        b=UphvA9JTbXrjLsv2TzjAd610k3PDxx3V0JosEUjlgr+Mo/XTXIWahNNPoqK78UaHf/
         Wrttx95Ulnu9ztaI1LDQYdoErpptZVPR37mnYWPvxLlwgoAjISB0G7JqI28Sh9obOZRC
         g/7nQC01eu9LXC64fE3KiVM7IAHXx3CeE1LC+tNXJnN10jtuY9vUkbP61d3jEaILFqJq
         +EgWOTnF0rDAY6d9R0WN4SHbR9MGAtxVqP/YmM43W6yASazlZO1k++4Wff5Pguo8y0XT
         YKlrthjVSWhXvTiNwskBaJdgytIQWly9KhWdI2xXkP/XrtLxfnr6nGgtlcTZkas730QF
         tCug==
X-Forwarded-Encrypted: i=1; AHgh+RqhkoS3+ne+p7inl4ozRK9T9hmXL5oBI0jRsPs1xRUB0olP+GNUQ1d4+e6BfkBwmGnQEafsm7EJBEYXyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL3VyzOYpTGDlQgk87DH7pS1h/PXg7zq7k8N/f/o0bCuBxKEUA
	uHJ5JLpsUv8FaFjsVxz/Jg63Mxww5G4NPY69c/5IEgLwW4yXdU0cOsjQgGfHYHIAU0WW7r4dwIO
	728xq4bd9BfYYbb7vz/Q2yIfAxlZHUxoOpfJBdKoBjYxAOzJMQv+qcHP/7MA2i592sw==
X-Gm-Gg: AR+sD13f+0ceiNlam8VQ9H/qNZOvBS0JaQG/7FqecI+G31JLIlrXBu63Z/8DRlpyuKK
	IaEURc7/uf51nN5XDitbBNKP3SODrNj2O7hCecXeJkgsTKTkRGBdD0blHNHYhbCO12t2PvuHO01
	gK3L+8u4OlfVjMmklyAxLvYxXiZawjuvJHy18vwhaF+crhGMVdGBd0LPMhAoPMnN9xnWV0UjCfS
	4vKbaycH5SkAtFY2ELxy9ShnqoVCX+nH8QDgMpsg8ibS24P2/+qnQEVEOuTwBJgPY5FZPQiU3V6
	LTfZ/XfjjbUIox3qQcRIc6zHckIry4FIP+wvkpnHrarDFAgDTy9t89PHXkrN8qSWB+1toft93wi
	eWauRAMxhvAhDpfTAX3Qr1vnF+e6uX/GGIHFd
X-Received: by 2002:a17:90b:4405:b0:38e:7aa3:df25 with SMTP id 98e67ed59e1d1-38f29658c27mr8165956a91.43.1785165166105;
        Mon, 27 Jul 2026 08:12:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4405:b0:38e:7aa3:df25 with SMTP id 98e67ed59e1d1-38f29658c27mr8165921a91.43.1785165165503;
        Mon, 27 Jul 2026 08:12:45 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f1a759228sm2510133a91.1.2026.07.27.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:12:45 -0700 (PDT)
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
Subject: [PATCH v8 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon, 27 Jul 2026 20:42:27 +0530
Message-Id: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfX6+y/WxUbfZEq
 doyqlZM5gyq5rIUSOShk0Q1XaSPwVburZY9QQiIh2sxh+o89eZqnf8GZKsrEfU3UxkJulUYpPfD
 nyX01QOnW2KoeVIr1afC6W0CEyJSyt4=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67756f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kcwWOOnH8nsvB6J9kCwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: zy_0dw1unKLjvNglZkLg3jdl_Qo4AT5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfX+5lLSCF5zTgJ
 hdjzxqt8WVVA+1Rlg2BdX5j/feiLLxjSqG4Is96cUCuEYyurQv/ehyKA9gatk9BzMVGAZOMEW6/
 kXICZ3sTO37SYd3rEs1GSusdqy1gVD/a/41lrEyQA3IOzQhGcsz4ZPlIoIGgkHM1RRQ2p+9uExW
 2gm37u/kK+7dbGylZsYgaauaH2TeL1TAPoS6zKa6PI3qifwIUSyW/vBW2wI2PH0qS41d40NLT+3
 yshWS3W/wmXbrJX/4IHwcEqH5QD329uqAmY69QPT4r0Rkpu99r23jiIl8SykfS4ZlwSfVbK5I0O
 9UlxIrCP53qKkJSFjpKDRIhR3QLbsp9+xKxJoGZ1WsIZsbRzxFRRk3XlyalzDwvchmRvx7OSNaB
 UlnAri3aYUYm4Zr4bXiLHLlDML8FLgY7Zi8ThsbXEaCVBumDhec3twTTn2wrKuveWUQVc5cOYOj
 416XuBXsumwxO9pZMjg==
X-Proofpoint-ORIG-GUID: zy_0dw1unKLjvNglZkLg3jdl_Qo4AT5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270143

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
now retrieves its clock handles from the device tree, allowing per-port
clock configuration and proper enable/disable during startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v8:
- Fixed indentation, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v7: https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v7:
- Addressed review comments, reported by Krzysztof.
- Drop ECLK handling, which is not required.
- Link to v6: https://lore.kernel.org/all/20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com/ 

Changes in v6:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  50 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 181 ++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   3 +
 sound/soc/qcom/sc8280xp.c                     | 240 ++++++++++++++++--
 4 files changed, 452 insertions(+), 22 deletions(-)


base-commit: c5e32e86ca02b003f86e095d379b38148999293d
-- 
2.34.1

