Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E5931E0F9
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521461; cv=none; b=M6mknfr9ezqqybCNHZswNrKj3P+krho5S6YmqvUAfYg14tQwpjkT1Qv6uhrwFb8pYF2OJLa4px51Ze9mNBWL5EdfAxUyVEzK9KcnVKhoyHNzcWykpxklGD17MdfpbAwuf3IfXCdd6q4yDey/yvkJNQ1fAMX1PgPYDPpkxl+40lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521461; c=relaxed/simple;
	bh=lSfDSDJulBXzVJSH8kLsetVnz+LP1lpOSpV6/QKxUP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Em7333gGzmT4o6grrI78yesxeK522Gpn/Q1GQkZ1+RuzAso6g5xVsCiCeFqUVHYvtu+MGKY+3o3K9bOguXWGi7q6p4G1WhNVBeMKnWd8GR+sdss7kzjDTOfiQ4cIw2i+zBAk0ICOg06nAjMTuPs23WtWEXSoPXt2KvT00kTJTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUsAMxUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUsAMxUa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8NplL001815
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=99NPc/hNZh2Kb1E3FD5nne8SMDHWyt5h02m
	B6Lp5Gj8=; b=CUsAMxUa1mrg0ugsDD6FiipufqVXsZNxdLXPFO3Kcet8Sg06dSr
	PkLs07gh2JCyAqWL1LM38y2DKu/Y6ocQcis+/ZWB295+hWx+ZrDzjr76oEuBRMXk
	ffVSLOVxZqMI5rKjXGY3zWy+z+JIXPe59ZJJLhF/JFnJw+duZ5fMql7jlwqSvVLX
	brIEeSxkxk93ZxlbB0/9gF8/qMe94svI1UQ0CdR+95supZcCFSUQCBXB58jt1xzY
	Qi3HMAUH5oPqugju7HoOrbJ4WjRckrfG5yqzf2mAU1XWdhTEK6uREre0QS0T2jFF
	mAqqNw7LyxcsWB6+EBdUAw9YUo5sey/AGcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074rsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:50:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88dae248so89581676d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521458; x=1756126258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99NPc/hNZh2Kb1E3FD5nne8SMDHWyt5h02mB6Lp5Gj8=;
        b=A+h2XQQ4yR9hvwanTe1bzCSdLCBU1zbL6pHJiS1ZikdLtRvch+7Bhw8cU6G3F85W9u
         PBMljGYSmZcFvrIrEhtoWEHkT4pbgVtUChJiFV2FM1Q87RJ3eq8u8Xt7FkAIr2Tz+eP9
         BMUns3zFrU3k1N9f1qYq10GjsMc1w1FRsztVz6abqZBbDqdkmZ+xS0Fm1AJx+ZmL6CoJ
         T+3TgPyWH20jJnLGCtgHQgnAp9E1YBqwT5m67TWuL9B+KsF0HdRmLtMAtNMkG6xEQPot
         sbG6YpaKcP1SR5gAFw0CdFxz/o5vXCUtE91aCEAdOXRUfOfJu7Ll7KrAQV4VYMRbPoVO
         9fZA==
X-Forwarded-Encrypted: i=1; AJvYcCVX0to7Ilh74d5rudt3/xpLhNGrN+zE6QW37619KQumi8Yjkjp74LnUxiV2W5RZ5zabj4BT0zP3sPv6LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBkjZGsmqedw5/HVW1ocd+JRyDTc3L2f7zDkdOk2uKwZxsU5Y4
	qLYfjNlAtDnkHU1iyo/C7LTWAMscW2viUzGMog2hTQwOlEHE7u1ioE0RKqrW3nHpEoN/f3BJh1T
	mMK+uM2Q95GJR0ff+NQ5DGT8Lob+QaH8KPm752rgrkktUdxrFqvbefiPnt80pIg3n/Q==
X-Gm-Gg: ASbGnctewF4M5nc2q3CKhUljJMZup534fKp8cw2J5hU0tQBIpWt8MB+KomCr6L0v+L9
	z/YWFzTs5/SUUr7wwuhyH4sUaoCDUxnjo+yy5eDXu9z8qHw7voBBP3p4eiFYRdDA908lo3YCYHY
	83dTJviu46rbCh9cwgQtjCFQRD+wwQ+wBOaM/YI0ogWHboiaO2jx2kDLctf/KNlmEV8jEZEGDq+
	b27KWHriD8++ZoelPAkrF2E93NUei2UskVzuocFJcmR+BMm/KNbZGNoQald80Y3FfNcqpkAVvPk
	hr54e3ZOFeUf91qLwCBl19JZpwWJzmWY4xRRX9J4a4Io04cgLOXzWg==
X-Received: by 2002:a05:6214:20c4:b0:709:3768:445d with SMTP id 6a1803df08f44-70b97d69158mr174285576d6.11.1755521457640;
        Mon, 18 Aug 2025 05:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEehzsI6ttyklkU4OQIHPZGVa/k7IHY5zvv9A809GRerz5FOGA67mbOXfqroqTaT/rLzJkQwQ==
X-Received: by 2002:a05:6214:20c4:b0:709:3768:445d with SMTP id 6a1803df08f44-70b97d69158mr174285246d6.11.1755521457127;
        Mon, 18 Aug 2025 05:50:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:56 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/6] ASoC: qcom: audioreach: cleanup and calibration
Date: Mon, 18 Aug 2025 13:50:49 +0100
Message-ID: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C9RZeENL2uzMmkVHIKz3D_w0NcNICtWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX++MXYTzR1h9Y
 S/aYO7MzVFVzr4/3UZpehj/LzpP20kJuokG20NbKRT1Od9hCiZFYBbGCgn2XkPEwzTPlFeeqBQI
 rfiH5I1OQsZXRLBwrcn4WbdtJzuXJwvGu+qzq+TZ6dvl7t27CnDMhjVJ8PrcydotcteiX2r90/K
 zXyHMYHq/WPtq0NZP3+bDoCajMSy9ILGhCqklyCG8wekmkU6+u269O83rdE3M5UqCbR4yjh/499
 p70iDe22faUFBCBXuGpMy6c7DZ/Cx6/qXZ2YDCQZRQJABSjcLRqG82nOke7/sk6ZzmOk4sMq4Ji
 xrWm/ypQIlG2fDKC/idn7aR9IqGUhjM3YrPmRKfeXzLX3G7Fy9DkRvK2eHHjp/51DJ5BcwHu3H3
 4Xbx49yS
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a321b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NU7b6h4jXCN-HWJItUMA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: C9RZeENL2uzMmkVHIKz3D_w0NcNICtWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documentation 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Changes since v2:
	- fixed some fixup rebase mess.

Changes since v1:
	- fixed typos in I2S_INTF_TYPE
	- sorted module defines based on ids.

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
  ASoC: qcom: audioreach: sort modules based on hex ids
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 18 +++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 18 ++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 84 insertions(+), 20 deletions(-)

-- 
2.50.0

