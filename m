Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0617A2F6
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754504334; cv=none; b=infLUUuUP1Qidfkmc/1WNyi/Ck+uioH1LyQGg/4/NYgIdyH5wqVSUsUyUPl8n7PRyzSrH7dMhPzh4MbgAZNZ0cyyDf0W21IRUOIhoWUqeWVEaMdazXQp6OmZ+LxkAXVRwNvptPJFSkhw0Re0SaP7r5R2O8Lnz064u6DXaGBBE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754504334; c=relaxed/simple;
	bh=gltay6gHOTujsw+u6lXUTehNXIZtIgzLPCEbcmXqR7U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cVRSr8AWEjsXyOkcAkeNWAxbprRelz5ntcWsh1vy5XK7L/2JnsxAiuQY3BNhu/94dNiEak9lfDQZCZH/rW46kFX4cNbrV4BmCy0EYP460Y2+F5I8b+NaVLDKjB4orE2cONJGG3xv1Pfpcn+4Xci5bjSCSVMGosuzzQkIHrZbXDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yz6GLYbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yz6GLYbS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576ICKie032544
	for <linux-sound@vger.kernel.org>; Wed, 6 Aug 2025 18:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7EtcQneqFbay0S3BezmpHKQD8tPt2h3nFwN
	SuVeutIs=; b=Yz6GLYbShmltUGe3PZGOUeYoPiUFeaJqCKQq0FVjMA2B1+yMoJZ
	feQ1pfYJoFA4UW+2pCea7u9H8DBx3NmE0rVchA6iRHXM7EEZjdNgdMSx8Fu/k/oq
	xxy+P/gYIiwtgi0XYGkqTEaPmsMQyQJTxDrs25zrg0OAD7yQnikWvGvlAQk5rJkY
	aJ8OEXrjp1PQavenczvXk4NUY+A3saRLqYFjDtvIjNYdzsRCAK7hfJfVBgfYz+o3
	9i4yC9x4W+uwiJOl5fqDy/QuG9sZyPvmfeYYrSSIuWX2pchNTvERwzVOUTBukZq0
	6Ex8NsxZf0PRp1m0umihCXPbWBX0mXxQ0Jg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2ur7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 06 Aug 2025 18:18:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24283069a1cso1146825ad.1
        for <linux-sound@vger.kernel.org>; Wed, 06 Aug 2025 11:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754504330; x=1755109130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EtcQneqFbay0S3BezmpHKQD8tPt2h3nFwNSuVeutIs=;
        b=kM1fMgjYQUo9fPMWxr70v6KjNXcp/00rcWrqFYpPgRGcNF0dricnefKIINk5EZ4Ad1
         EDA/4gIvUBSElKICP2YWOHSwLuguT5mfz8/dVM1Nw2TPDDyg05TqpxvEXnkT+61hS5Ro
         ZIzL910L6frPDjShzWpNQw5elII7B7vaJ486kLpjIp/xhd90NZRH180ILWKgYOh2RGnN
         BUw9201H1vYoANrE8lecLqLqbG9AZnc5nYCV254RzbPa8lWug1eaJTtub+D8D2LQPFyG
         65uzY1NV9dGves7zUe/a0ynd40DFa72fy1lLU0M8Wkde75o3jv7ZwQwQctJphxHHT7kj
         CvPg==
X-Gm-Message-State: AOJu0Yy8Ch2v10kuz2MCeh4kvRDgwFHkAOaGNnNCR2UQJxGDIzr9k5Zp
	NoeZsBSvGweaOk2mkpZWKVl6Eu8rGT98NAMqxUvxQdFNr74h8Etjsddik2ot/vgOEGSse+64LJU
	6JLlR6pljl1jto9TfzAwv2PknrZ33Uj00oTmCIbD+e/mwXRnKgTUC1hKBUkEM7W2nIQ==
X-Gm-Gg: ASbGncveELLbxq8hWMj2buY5iik7Fa9urqcUP3VnDPg3iE+OzlzbL+Cdm4yCyxchQGU
	uJBGCc4YxcV5utP0W/FJEIvDsG/gPb40vWakfpUTXVfjbxvbQiqA3v9cHe5MmiKe1ni3TqZ6Eyh
	C8tBI+m0EkUNAjZmxkSH++bTptratNLbP1j4UoegVk5q8Ca5imDcNX5LUFWLm/S319ccwYs0XH3
	O6Rjonc+6lPiFpZGbxpLSbdSr3cbra/2REbPcD3mYw//gxF9H/vJGv9HPPppD/WUcqwCcv8RJJN
	v2pTuoh+dpnOMc8da9ZFhTrRLDim/FkEGWSPRA1X4sSMio+/3KSrcFAIxcxrFj1/lxD0Wmk9Wx5
	w
X-Received: by 2002:a17:903:2f81:b0:234:ef42:5d65 with SMTP id d9443c01a7336-242a0bfe495mr48029085ad.52.1754504330355;
        Wed, 06 Aug 2025 11:18:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Jjp74fSOAUZPkCo24NljY5UCf/PFKkDfQbKzSbRPxCaZMFEt+QxieBL3ATAUpTk1S+I4mg==
X-Received: by 2002:a17:903:2f81:b0:234:ef42:5d65 with SMTP id d9443c01a7336-242a0bfe495mr48028645ad.52.1754504329772;
        Wed, 06 Aug 2025 11:18:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f36311sm20235186a91.34.2025.08.06.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:18:49 -0700 (PDT)
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
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v4 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Wed,  6 Aug 2025 23:48:16 +0530
Message-Id: <20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68939c8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PJR2aAOtTfpWL2UOpAQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Pua3LDbHt-QEmAIKRq7ZglLwfaTZ4HKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX+yubS48vB5QX
 vS6gj3ccnReynLNJRLkg1N+4kjc7tkf2JOdSVv9876MOCwmc3XXt33C0Y7nTVhE8j4/C9Hksp7Y
 06ueom/AqmlzXbUhqt/pRdHCpstrZWNK1RAYTMbFXKRsRSwlLh9rZCyEqaObDqJfRs3UTJHxh8D
 FWElX9eEcIRayHrFXeR5V/QtUlzMqtWRL6kEZC62t0ePH7fDP2ib5X+r7AthkJDzOvTyBCq5mCv
 XCPsoAS1KcqIp8IKOMI+T7Nudeq+lUKpxTRJRL+ol1onxF6rchj/hL7ZNX98KDuelzQzUCLndck
 dBUHywGrQ+1QSymT/o1DkpjewslEt6/zJMK8p1R02q6OIErQGPrbyKvBvCP9SkcPYn3I+FlGvAH
 LgAcRLFB
X-Proofpoint-GUID: Pua3LDbHt-QEmAIKRq7ZglLwfaTZ4HKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

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
 2 files changed, 60 insertions(+), 8 deletions(-)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1

