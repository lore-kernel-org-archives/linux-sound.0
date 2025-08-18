Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB031B106
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516505; cv=none; b=Vn5cwJnqK4P2Co0/IRJ5ahwp+t8B7/ZYIF/ekShtVB6BjPZi0U2Ac3d6CQLChbuy6hDWiY4gosT+vhvAjPa27FyfE6R+Xle0Ch5WtPCfHDGbFI2+fZWqgJ5e50RQ8KhloymybFnIqEexms4WgUoSr3IkfRlMLjWOdI01RcnIzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516505; c=relaxed/simple;
	bh=4MkbI3+NYW9NAd/ICB7latFbcvx/s9tGCzhbUxJU/6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0/UBpQWSrhUlmZodu3SqjQD1u5nDPumn1aeWRY7pmehexlfihCpzCQX6p6EKk1w9tmVUWyRGRZPRAk+uP8R8n6S3D8G2q8AOmBb7Cw3+RoWF4cilgSxbxQxKbFXmBIpKCK8bCwx7iMtGI86CePP1CzrrGN+Ds3579LNecjpiUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8Fx/2qR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8Fx/2qR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8eESE018557
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wPPPAuwBMBQ21V/IeDnUe25ncfknbEsC6+w
	xD1Rg/w4=; b=M8Fx/2qRblJLd0D6tYdjgF5jI+gOMhZ/8WIq6o/PCstYIAUzwkv
	ekcEUp4A9Cn0IQCXVYGlpNYSniHB4t4GWeWdVYZ/tQoAga+346wRRgdnaDMDlFD+
	Z8Ta4t5QJQehYvQx4LCbcc77gnIV9XPZFW6w+hR8wcy3CTPeEzd5BiGb4zjOFijn
	Sk6zSY3rru7vJDsMVdHaT9K62rLF0HbpAoMTY0H63d9TRgv406AtlauT3PsvUKNv
	zLu+QsviiDNS5rWhhxXe8WYdN2Bmc263U/nPRtICc5RqD3RKHOm1DLMMguq8FD6a
	XXief8ZYS7PtL66i+8DYwIHGc8XUff54+gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtckhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e8704fad73so1135643885a.1
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516502; x=1756121302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPPPAuwBMBQ21V/IeDnUe25ncfknbEsC6+wxD1Rg/w4=;
        b=kfyxrro+x1Rg7M0qlsqQ0TO3BD5OtSJEqkI2hvJtMXVnBRunFxxNamUki/PNK5epoc
         pY07JK7DA4C+TJHa3geM3eFWKv3ThWSzGk71cr8qJQLs9Utj0LvpnIazGN8NQ8sQeVA+
         V/qBgnZGSNnrcZoCtNfaVaXfCPee8/hdyJBC4usNoKAkcbBTMzwgnEwAxJcvMMD1KC1D
         QpzM9Q/zX4wzOJcQPPYQNOvSbJJu7HojXBv8FjUeMkhqEOKFs9kQ1B0NMxqiye/wl7eG
         jiJ7ixPHQg/srJW3NDy8glJxdxp8vyv8LhFbmGZDXUN4jD5+ppMEX6pBeqfRrdPr4nLX
         VOCg==
X-Forwarded-Encrypted: i=1; AJvYcCUYPqoJaqTICwuSUmc165SNO7+huQWVvY9COJpoYO8zXcZJX+qHfC8nb5ZGlQ0SPpoLva1zE+iHxAr/jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdVLmB1XAmiXkhTHe+gIZnDqKOkGMsGAp5CC64x7fit2ZPk7+
	QVEWDcp6v84mxE0GmFwuwUgqDGw0sPFjjeQtFHaVID993Xqkz2GRMHsIELKs6CvFmx5e5PNsjme
	/6jcrPMvP4OV2dbLXgJFDy7qVbp6gpqmVCFXr7ovsevjX/hw52CXltQoBWwgTFj9Aaw==
X-Gm-Gg: ASbGncv/qe4ruLJ/Lxe0wV+9SbZwb3eC1/OMdPjKLIPE9mrYee4jd1cz7KM4Xnb2eI+
	ovT8vNdir/SFOfm4Vmi0ojJ0MaBnvf2D3b2TpIa+APKU98SQMUUbNVGHBlXAoLmPL/z+p9hWSFa
	gYCtI7/gDBWyu76BDyU9zOUH356FgFwYIrrOrK/ig20bSZ8eRzeEHwEO9CPF926lXkt2OuZl+8G
	1+lZJWJjxo4B+taYhnl6f47ZS7fMDJqPQudPIGGskFDyTSkPSZ/gur4cX13uXBhKlKJ8l+UzbWO
	9goK30p4TZGH7b61KHw7jMxL2mkUSotG4D+kDEWaD5AJkkAjWhqUpQ==
X-Received: by 2002:a05:6214:21ee:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70ba7a5e744mr136126846d6.7.1755516501967;
        Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvYCLxBLKSYU4z3YHAZlz/ozcZEOMLGps7I8qvH7pSBWRbf9LiIs35N//2eK5MQoGG4Lv6Dg==
X-Received: by 2002:a05:6214:21ee:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70ba7a5e744mr136126076d6.7.1755516500911;
        Mon, 18 Aug 2025 04:28:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:20 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: qcom: audioreach: cleanup and statiic
Date: Mon, 18 Aug 2025 12:28:06 +0100
Message-ID: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1NyMfQeo-ZA5V7OMy1LkCRH1upVlZdbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX5X+69oki8Uky
 jUFY6k/txfxYhKT3cpH4+1stswUtvsMiGgW5Ksz6+GtRELY//P8yIVmrweke5QLONSJhmXkmqRm
 4DeiYQTShWNrknrLH6Sv5QO0VyXgBNmEuH+EO3Do9/Jb4roeEQ3/Os1NvEJ0TcNA8p9DCeAETvy
 uH35+pnA6r6QYrICWJRrut0yNa8v0YZ1XsbRdLA9lFxtJqnx2LVVefXl1mJN+sKugqnfoZLwVKB
 mmy89Im8qNrbkTDT+/8i9D+CYaTAOP9p6yHgLcAtyhilPEe4n+FAA3ynDsWRGncw68wInbb6amP
 xe8u6I7UrzylRzmP3MgkCzpOQBehYhCLDUcO3N7CsLzZjfqsP9hZ5B1yXda+vnW7S7/pliji8Dz
 aszScn09
X-Proofpoint-GUID: 1NyMfQeo-ZA5V7OMy1LkCRH1upVlZdbO
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a30e57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IKPg2kH8tdNbmVK0Zg8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documention 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Srinivas Kandagatla (4):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 18 +++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  6 ++---
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 78 insertions(+), 14 deletions(-)

-- 
2.50.0

