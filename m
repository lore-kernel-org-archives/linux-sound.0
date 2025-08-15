Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C21547E7
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755278667; cv=none; b=bhhxrGFPUFG9LuHD1gEbTnyNL1DDJkBatjJLi4UBPSDyxBVMrILDCJadBpHMwBOMTtGyvKriN77wShPBYdzB7Dl+prf+2zsCi7r8P5bqRvuIM6wmug38oxVqiFxV1RuXQliZDkJi/SFkFFNXeSrbxFF6RcgHAIHs7ZMCa8vvJQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755278667; c=relaxed/simple;
	bh=/LB1x4MuYCAm4u9ZYS/2Z2F9Vv22NA/IaCMMGFomePc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T1gJTViIZsfwWu6LJmgEuyp1JLSBzKqm3957Z2fiedUoXFsOJkZxZ1jRM4sC1nexxxH6BVZXsemRar5yTo+ayN7cUagFW1AaoF250tJhJxaBrv5wBX7hqceVAR33BsRDUFBMzcZJrL6fAG/o6923jDWpRsOqKW3xBuFda+rsTPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFttS+lY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFttS+lY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIuu0030435
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 17:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3x6BuZcuYvtL28nrF1fEIU06Y2Cx3qSZPx1
	q+SLHa/I=; b=NFttS+lYGJ4HkhxFyLnAE9QA7jZYFyR7yQpMmE5ox3E+eJyMzkc
	JGm9yyHNHpzQKBFALNPvNrMKDGJEkc4Ho1rrHsd7P8VOTv+3ph5meiUHmK8pUuZc
	y9rrfGskjdJIp8bPEsvV43cs2nIpKvF/uulAm95Gjfy2/iNoaY/3+sho3UtLtFaC
	BLUAVvLe6G0MCT5p/804a6UOVKNq2witAroElcVUg/JfwXJt3XjhaJmzpidqEUVR
	QBmS6Jlgl5AmcVNUHAf1nwKnFcLSDkTpLxb3ieZpF+Bw4cgl1RIGegvISJRuDBhQ
	hMOBkvQBDFlr3P4+NXr/Eo+KOCrX7CPyxDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vxjqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 17:24:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce388so44329325ad.2
        for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 10:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755278663; x=1755883463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x6BuZcuYvtL28nrF1fEIU06Y2Cx3qSZPx1q+SLHa/I=;
        b=Qon2QffAzxL074CrbKOIrNxBsGN8HUu80PWpkaqvrpRXczqIi8CUQeLJzqB6t4fFp9
         VGJttZ2uQhHzl2qjposmgShcX2ViziyQEArvAV07nlPIlF57nU0nCL0sMuOSa8b1M2Z3
         0pvHpiDGj4LeFmgUTkgJkqv3tUB0BbXP4GPk81a28cxqi3NtdUViLhrAnqXnOCFCRSN/
         4XWDGfKBe8v+9pW7HJ/ScSH2aqrccl8zT1ONrVrz0AG1pJbLyaIjj0Tbx+PPZqET0oGx
         9lg/g3TvNo99Y9HstGTYElmON91T1P2NpE0M1s0KOE+VQSwFVrlKCWdcR0YpnMrE6vRu
         7jkw==
X-Gm-Message-State: AOJu0Yxlru+RZrLSUzQKxF7Ahiahp8It3g4QvSnOMHWiUKUS3xkKGTXN
	ROEFPyo9bRQjWOgYChsa/rrQi+EVDwezlahy9+LjqIMIq/N8N/0OIoeYpyf+f1tYR5CTbwIWPBL
	zNjjAfFR0XfnycV4LksboKGYnkeJG2jyv32w4+fYwaOHLaYzGTVRcAkxKokDgvyQr9g==
X-Gm-Gg: ASbGnct1duL2J0Kdw0n0mzyxdTOFYLBAWW8vsngXlJPVIrJCwXMuxFEVG/qyyIRgNHP
	fWenQmwOmz+shNocVQl74r7TuUgeb5JVaezkBXaCjkwRL9QbcUSJJOVJP2tCkglE4+X1sBA3m4j
	VIJwYMRwNHSvjjpprroLWqh0wnGlTwcdcGZiNYJQ3k6/dvnehZkiyIbi5xv4eXhPOli+ZI56l8y
	kWRhgwfWb/Y1riDUQ2P0gs5nDx7Qode1x861wCj13piO+aWDmxPWm7NoQcD0UXg6UoiMM5FqOPL
	8BF4tNhywQVmkf5msmWCdimaelG6zqE8p5aFvcWPVWAlKAydSYTk+bnnl7VspuD7xdTIkrKpTv2
	c
X-Received: by 2002:a17:902:d485:b0:242:c66f:9f75 with SMTP id d9443c01a7336-2446d9827b2mr40064855ad.55.1755278663111;
        Fri, 15 Aug 2025 10:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5M8anx90Lfv7XqfVtWP0jnq8FQcm1RoCJc/Do3JlKqE7ilXwZ5DRXQ5mWQJWHelWdjx8PWA==
X-Received: by 2002:a17:902:d485:b0:242:c66f:9f75 with SMTP id d9443c01a7336-2446d9827b2mr40064585ad.55.1755278662684;
        Fri, 15 Aug 2025 10:24:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cadff5asm18404025ad.42.2025.08.15.10.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:24:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v5 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 15 Aug 2025 22:53:51 +0530
Message-Id: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX0a6BMuOMvQn+
 7xtWFQcuyWQOybiz1JQcq7E9SRvHAKKZGVFD9+5rl+5fUwS2yM2boZybODhfPI3AVUuUPTJEMJB
 IjD4baQ9W8R1IkYGyEn4f84UIcNK5/JH62NgGDFSL0837ONLImTJklPKuuwcP7/BmTPb6mL3ul5
 yXiu+xqRoSAy1W9rjThHzxV0ndYxFk4STWgiKkkMpQLDpvr1qw2+3Y6MGsG7nmnpQTjddojY39o
 zOUxJJKxoDnmSNGCg8vT01i3jHBBH/UiA3bFPCRnmVjR7vJc+kjeVBFKYJ1OwwwpECdAqjhuxNX
 lSqleHFilZ5TXk1M9qddVNGnMchfnaNdsfqoAWX85/06beUQLSPdbWpUeoKfGVv3a0mOkqpy7lM
 9X8iIBkt
X-Proofpoint-GUID: RMO9EDz7l9ui7HEZYjooq0dIYScRJnso
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689f6d48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fihhyCgpykPbXYUG4mgA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: RMO9EDz7l9ui7HEZYjooq0dIYScRJnso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

changes in [v5]:
	- Removed multiple error logs and used proper shared reset API.
	- Link to V4: https://lore.kernel.org/linux-sound/20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v4]:
	- Dropped v3-0002 patch, which is not required.
	  Fixed with proper error handling for failure cases.
	- Link to V3: https://lore.kernel.org/linux-arm-msm/20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v3]:
	- Created separate patch for devm action to safely disable
	  regulator.
	- cleanup the v2-0002 patch.
	- Link to V2: https://lore.kernel.org/linux-sound/20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/	

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 +++-
 sound/soc/codecs/wsa883x.c                    | 57 ++++++++++++++++---
 2 files changed, 59 insertions(+), 9 deletions(-)


base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
-- 
2.34.1

