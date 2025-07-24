Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DBD2D948D
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364569; cv=none; b=h14fdCCG0Hus1yPTVbaF/zQJgq6zokQv7PSVQXV0EMDVENiLpaQgdE91O3IsVHxeTbBqsWKwd8hfcuVs5IK4YBSIOFlO686wXaUzm+C3xOncurKN+e3ssJdyH5hnsUVjEUF6F7pgWMSIkhgtOTd1qIY+p+gtIpZL6fQxvEbeYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364569; c=relaxed/simple;
	bh=kMhPDLRft58cFZj+7bDbN07osFzXbyRLO+xR3b0qJmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/b1xBHNXqdCaL0oZf/qJxpLS7KgCSnN0eVAgTGA3wGwVMTUKFkaN71H4AZIQFp2I3DPjOvR1GiYZZa2cBlHz9PU5fOLYLyP+zn1pBBOmI6sM+Dilf9IF0DioKE9SCa2PwPiN5yhmPSUYsya+PVhMZ0ewaOZ1j7yXusLRCRTbio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDISVEdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDISVEdl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9sSxl018720
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsUjJO0iLJb/UG0dtmULJPTzB+FcOPgkwsm
	DaJ4piAY=; b=YDISVEdlwwJL4Jp3sjRXEiZnt7qMrCT+tple+g2+hVnF7wei8xf
	eKrbR4FPpc0u77TTC57OI0M4tw/8l0mrG9PyPqVu7enK4xFrCyk65eyqSagGoLK1
	igjFIbB/aLVgKWYix+E6QQGQeHnVBbSceFEImZkGDnCPBjBdgosE7NEY2gINkvPK
	/HqK8JXo+qvw0dezTKP36m07BnyDcOmEF4Px1WOkxBhwKwKrjQQIg75SGcK1B2fv
	XIH9to7szgfYYKo7fdRpW/njQ2CucprPT89S1pdWcw+jcLSYG9A3Pm7OXHPy1u9V
	2r77cd/hF+Iq+mcO0AC/CLFafQmIubS8GIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6u0x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:42:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7da0850c9e5so186224185a.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 06:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364552; x=1753969352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsUjJO0iLJb/UG0dtmULJPTzB+FcOPgkwsmDaJ4piAY=;
        b=uwkydOML7SgawDuLhUbscX5uk42LsO5KpHv6z+a9toAvFoXwxTY5kEYbVlfyHqd3NA
         vAtwkRl6W94cioBbxeAWIzll8N0vXQRvl7hr+3XaXos9UGILBXjfYC7nAMkH9/nzG3zZ
         sBXW3s2J6u5M1aZmBj+MwRKCEdLEV6dh5peBa6h4qFsKMF77W+Q16vqA+HbrjOvluSQG
         RmLcEJCjxk7wuobZ7SJYza9deSZ/qqsX2qYhUFB4foOzs+GnK7t3K0L7jmGIDmf12Ofc
         M3jbdtkSnhSUSfbjU/507d4sR3Jj/O3CkW+x9M9q5TVUPKWH/x+qCSELo342rAlegRsw
         aN0w==
X-Forwarded-Encrypted: i=1; AJvYcCVokTPVP8ySQahusE/5ZwBg2f8ud0t7RE1JJwPd9e7+q93uFXgKqhMWfCVJarYHeHB/ssXJM3JI+CMNGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCoB2cAtxkQxfyRMDSFgPUqwQ2wP6pDSc2v84jhFTTTUMNuLOn
	jbNS5y+0/TFahhfC9/LszM2tDxTUSw1dmjyJxQEdkYamglY3/bKZAZW05CYeRGrkUHIlhQlwOdA
	PmCmi9vh61yIUdsexRVIjFADlZvHF09s4Fe52k/dKq38/FO1+9hmG0brnDAWHRf97hw==
X-Gm-Gg: ASbGnctBOmqSidQhSE0s2aKDbDjnoD9a5cizKdgkPrYX438WBBvlTJIWszzmpHsu3SQ
	qfai6gQHb9fB8+5OVRLRvzVnUTrr8xlUIg+crha4xPuRFyU41leETsjHOTRaLFpTd29OdkwTQSq
	oGrVOsiPRgHKvTXXYESULEvYvx7480//D2ldyNGzwgRRghFp1Er0CxL12Vu6KhtHXdu9D/rLrz9
	vnA6QyrHMTHY97NY787Q008j4FkZmFtCHv0ANKAsLJFzDXud7eCrCeThUh1LwV9avdNW5tu2UaF
	z/MfjnU6aehWvX/+E1uewtounyosQ/AAH7NfMrxH+Yu5QdcNz5h4fA==
X-Received: by 2002:a05:620a:4095:b0:7e3:4413:e494 with SMTP id af79cd13be357-7e62a1957b6mr823188885a.60.1753364552577;
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaDLmi5F7qLiXnyBH4lS2oCZRlvOc0P2LHa/r9heMqn1DJzqor51NTb7bwX2PM8IlM8IoNgQ==
X-Received: by 2002:a05:620a:4095:b0:7e3:4413:e494 with SMTP id af79cd13be357-7e62a1957b6mr823183085a.60.1753364552035;
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:31 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: drop sm8250 lpass gfm driver
Date: Thu, 24 Jul 2025 14:42:27 +0100
Message-ID: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68823856 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FWHBK-Jb_X8E8erFsI4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qhx9xbReQrJdKKKiMpYydvbe1_Z1KIiW
X-Proofpoint-GUID: qhx9xbReQrJdKKKiMpYydvbe1_Z1KIiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNCBTYWx0ZWRfXyVSDKI1pwFAd
 9b3dAnNteOHyssGGM725x0950ueUl53DeHYvUo95JIqQReufp2LOkA57YK/JVxUThzrCXLvbbl2
 KfAs0wbF4GYL4z4LnOpZPEYijnuZS0IyZLy0038WIMRIbQyGPAaVZIOGJeat8rkWnxiXlJR9ouV
 Js/HtF40e3FBl9jq4s0A4n9066AtrjNmpwRKZIz5YDmZ+8PgD7SDJbngaML+Qkwx9jP0LRNE4+a
 GkU9Cj9LyowidVkUCA1Tc3xeYvsgjMF4V5qI8WNsVWN10mjev+YI63Hfh2KtjNsQrSINFL8Bmad
 e0Y41/IMHk4ugv6BRkVg9OQvU4yr4/hsAa2HlFRuwHmICwEHM8/+ZcdJ13lm1EF/g5CnvJGNNM7
 SSJE5GOdbvrvdqAStWOpHIYJz/iUsHWvp5xdrVuWKAYByc/BGlgILf5oxSS78MH4JqE2kQy/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=671 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240104

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


Its been more than few cycles of kernel releases that the device tree
has been updated to use dsp clcoks directly, so there is no need for
this driver.

iIts time to remvoe this driver, as there are no users for this driver

Remove this driver and associated device tree bindings.

Changes since v1: 
	- updated lpass-wsa bindings that was including a header from
	  gfm.

Srinivas Kandagatla (2):
  ASoC: dt-bindings: lpass-wsa: remove un-used include
  clk: qcom: lpass-gfm-sm8250: remove unused gfm driver

 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |   1 -
 drivers/clk/qcom/Kconfig                      |   7 -
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
 8 files changed, 473 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

-- 
2.50.0

