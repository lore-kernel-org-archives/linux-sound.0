Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC553126DE
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882905; cv=none; b=OYCXIFGtY2zbcfznZ7fMMwri8Jc/BlkEqIXkmXz39MGagygkzIWnZOKOJ/mccEnmDo8bPg/lP0B30s8XZfrXZUpAhDCV91ZoNKuUp7Ua+EAA6RmvY8EhtPkpJI/j4mV2OV9ao5xXlBF5KedoNaAuV7+x8/EGYVQ16udCwcDwm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882905; c=relaxed/simple;
	bh=N2Nzu38480ZY9bDOWfT3LEIg5OyITg4DXgjnMztcw44=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KiPKL7s/0yRfOw3+ZNGwY4x7jZf30p8goNeFvt5u84835PKnTG9iAFE+CfjeLdUMAuTddIMZoRzdnjq9UCk0mi2n5cjgqMe84uD48sxhoyURWuiQ4f672ijY9C2Kh0hdgBiEy63rxDm0IK079BOZvYaLlLPlroLYL0ooajfJQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNTyIhAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNTyIhAz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MELWb6009724
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y1e6gV5g3kH7KN1Jrp5tcsFg+d8ORPB9zZ6
	0/NMHJ78=; b=LNTyIhAzcZfPVre0304ILSXkXOGN4F2JrDnli1AQdk/snrpQZ1Q
	pECCwsE/mU81PFc24YeJU9LlWTI2gZAj+2f4OhR1AuLsZDbw7uSs4lmwnNzbLaIL
	KYuUt13EPhZ97TdFvIvEmeaXrqYsiwMWBwKNVGwg4FuzOCQC+XggfeW96BRZMKMn
	7cZkYhQdvEaI3wfaseci/WzJ3Xl6AHjnmQ4Mfn2wskAyJ0CwPmOkssgQN2zF6EU2
	m8lsTLYLZm3GQG8Zseh9vvqzbs2Axui21IWc69LWYIPN4JOT0Y9DB5bK6Pnv0Q6V
	MiYmEM+jJLE/TLpfltDH0AQ1zsdV4p7ia3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pt7vggwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4716fc56a9so3756807a12.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882902; x=1756487702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1e6gV5g3kH7KN1Jrp5tcsFg+d8ORPB9zZ60/NMHJ78=;
        b=ExVQFFk/PfvFzuYXTwy0VbSXe+BEYxkVuZatnIw/OnlBbe2FXlDm+tojJ0LxZJB2V0
         3m/aTwRQbtChTZZEtrNIoVejrLFH9Low2QiEYSZzGh3bRva0SL9YIrGgcZ+VeC6Hv1RV
         PiP4D3hTDXbQtGOoRWBvtVNNEh7YC4K1SLxdl1wRYc5DC4VIxzAQkr7WNhiWaaSeyvz0
         YIkB+n04Zp4fmBimP+nx8ER/LZo7+2gDc0RjyJozODP079S3+c3jGrEX7tAdUqJNobpG
         rBSKtQUMPjQS9s8lr/WPfW2qDl8XkXPr946DUc12evza01EnOWY8ONxaULqrmr4mc2Eb
         cDVQ==
X-Gm-Message-State: AOJu0Yykrb51lceFKnPbLL9ZcEKCYLTbF8HYQu1Fy9DYvVLUJEPPhVDq
	h8eaGzC+fBXGPbKF14P7ilV6uIuYBAPaM78A8icOF5GkJL6QF7hjwfiLzzOBAPhFFlXMpXijFPD
	DOQQUCzuOa8zXjjnniePqvhK4HJzCQbdirE/nWRoRqgeY4OXRbsPq0s0g7se3U/fceA==
X-Gm-Gg: ASbGnctrMBYMCYPj/+GdR+LZuD5hvP5tRWou6Z1auwUfWYVFBvQ4bZV3Mq+zGFjCESe
	bEuxYAbgENJGKbhv3gsSZWigSYFl/00GtG0mWlucVh40VdMaCGcuV7mEd60uv/yo2u6HyXfN87n
	juX81DVbfUHJGDWyE146VAn40Oxg3d4wgRw/wRhkYg7yZOTPRdM9ecF4h4yJS9WfoUMwaeD63rz
	MCSQGuO/IXdxw7VZjG5b3Zu53UsB4u6TVuR93NbOCdoU2zOcdFlk+/Ilw0FmyAOfysjfdkPzHr5
	QIFMs7BWYuwdNlzkGNHjE0IUrPahLtTBKyFKLdfY2nCeKeR4RRGdJKEhJEznSgX6YDbUZSsFV4r
	R
X-Received: by 2002:a05:6a21:9994:b0:238:351a:6437 with SMTP id adf61e73a8af0-24340d1d2e0mr6022882637.43.1755882902088;
        Fri, 22 Aug 2025 10:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ2zJtVjuqIcQWtyOtIV1CzUmatZvFMwyY8CPoIo5NARmcWXDhSRRl2SCw/GI820eaq/xb4w==
X-Received: by 2002:a05:6a21:9994:b0:238:351a:6437 with SMTP id adf61e73a8af0-24340d1d2e0mr6022812637.43.1755882901649;
        Fri, 22 Aug 2025 10:15:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8afc56sm309995a12.15.2025.08.22.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:15:01 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] ASoC: qcom: audioreach: Fix lpaif_type and WS source configuration for I2S interface
Date: Fri, 22 Aug 2025 22:44:38 +0530
Message-Id: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ao/rySZV c=1 sm=1 tr=0 ts=68a8a597 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=ZqeqJFRRshZrXyHQ3DYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Itkz1THuwninPZf7brod-fVI5FNxYaEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDEyOCBTYWx0ZWRfX5USAjOotJOh8
 vKILfNrl4Yos/NoJ3JC06kI2EkpyLoEX+mBnBjEaxj7q3b9MC3hLPk37X9o/UG1GpYBePNafHao
 XD1PbwSr6Q3b6HAQmzMjC//qBAKEza4QmM8fHzCjo2YoOS6Sk0T7ltUGtMPywGlmbZChMV0W+Qb
 L+NVQf6Jx6PX/N5AWco7u30X6h1Za/lGWTViwgdLwPJSN4CvKCO+FG+4TBxaphKE5YUz8jjRMC+
 S1r1g6voEs4KSXIgwY2FuaTu9wdM+bwbF9B4KJ+A5fG5oUXZc5w8rldd83O2CwMAeJPg8yAdLRm
 6UL2l+5T5S8POUdCLd7NuGgCNfFDIgjA5wHnvWzX1VBjLR9eBE/aqU8mvljAaxIBchLB04PX1Ou
 3+eR6cWEPTlkwrYBuZmBSgvCo1gtvA==
X-Proofpoint-GUID: Itkz1THuwninPZf7brod-fVI5FNxYaEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508220128

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Resolve an issue where the I2S Word Select (WS) source might
remain unset, which leading to misconfiguration. To ensure proper
I2S interface setup, a default WS source is now assigned when not
explicitly configured by the AudioReach module.

For HS MI2S interface, the DSP need proper lpaif_type and WS settings
to appropriate I2S configuration.

Mohammad Rafi Shaik (2):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: audioreach: Fix default WS source assignment for I2S
    interface

 sound/soc/qcom/qdsp6/audioreach.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
-- 
2.34.1

