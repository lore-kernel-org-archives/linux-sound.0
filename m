Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0B43B4EAC
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657566; cv=none; b=C08bFPfjwYk27GEfi6N2iEteleyD1dKnYdcAl4zX58LoV26R7DaFVjB7Ix/taeSrCXyN6JoeMX6piCE1cIRchLcgBo0jCuL9VztmTuYuXTJuENhuMpmaTw1qYKCPYt7TAqGzkXNSsnc1gEPLmIEWV2PZuGRDj6dWFRijY3ZLDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657566; c=relaxed/simple;
	bh=E8V/x1G6mWLKxmhw+H2N0U4tbZHI27YliCj8HcFUUwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d5Pj7cHhWvSBVyHRj1wULyIkolsMkDQuKNMAy6kmty9GkXJVL0yQhkrjZ31RwuOv4YzLbhN8tYi0l49Yyvi1Z886Pohzpx00Q1aF8VjVOXG0/7IeD84Ao03m1G8uOi2GyPC55cPMDCeANb58b57nNDFCKaJezU6YNUnun9RnCdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHgL6v8B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjMSsZtJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHgL6v8B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjMSsZtJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPIbk2114906
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 18:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=it5ObXphukeKeuw0f0OcIK
	DADQBa8BIXKiD+JocV0wI=; b=kHgL6v8B/Lz49X32GHoMH0MLFxrhQt4GHydOp0
	BZipTzbHbqtV4k7xJmpieGBHGjkAK+DxT9C8PP5fT2HOY/nKMJdPfYiNEgi+dHvF
	Rizla3hG9fGbonzTRFEm+S7N9zRg+NNMjlbU5vcBYbtjSaitbK+wRtR0Qhnfd7nE
	/r0LhdnDrcyo2KRxXc+/s0ugDc/aSfjrL0vs4eC0abINDTj9O2cc3Ypp0O0v70Ml
	Gq9bdq6hapN2lJcs1B1/BHiAYXJyjm9gD8I3wz798I7rK9+adnKnMAxWMhbbc4Du
	tGwtiKi84iphAYk2lVVqCavWHdXqV5Eftpo4sobuHwULT6iQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e07cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 18:12:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74748e3a5b6so6564212137.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657564; x=1785262364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=it5ObXphukeKeuw0f0OcIKDADQBa8BIXKiD+JocV0wI=;
        b=YjMSsZtJ5e84BzjatNQFS+L5uZcKbHPqGL5z6EHLRQd1tM7gEZa2Euit6JxpBnLkGd
         atKg01JTUqfsDEbnsAOjm906D7MclMbwEflgyhw4QrXK+rnqJG7PeX4zM2UZGRrCIpUA
         ZUJrXsfcM1e7C0hTymhApEEHJqp8e8D5kdNiLSai4OAYvno5nBM1J9Cmi3BtjFqCwnfp
         Jcpv9qA6r/W5etmPIQPZa7T1yDLXXKTt+mYdaAoMUwrxIKtCVwNoHL5V6lLeRURHrtuS
         AVagbDtQHbv2W4Dieuc60684dCf9xriDhzX6CZDZtUKC7TEdEVUg6hlJwXz4M4LI4FEN
         ecog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657564; x=1785262364;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=it5ObXphukeKeuw0f0OcIKDADQBa8BIXKiD+JocV0wI=;
        b=NR2Ae10VXD+EbPBl28oZ+z1k5GvnCM7vN3U6WWfXiNX4nn+kU3yQBppItqH7v7ZrO4
         enxY9qPc5YHNjM9zTGGI5dShW3Kauq56zezKQsMnKDhlwjbH23up/cfwd3f0jSIbGZ4d
         Cc5fmFdS6NMRhwWjKBEIHTD+QVJ3vX2BaAqPTZ7teRERU5TrviVn9KGxKB/rEP+IvQBX
         iSE80Wb9Ig8Oa9DagnQZ0H6D575hGAY5r/3RCCFLxFgMahkQTMp+hqGESqRJraYDD0oK
         afTEcAlRizMMIA9DS3bvCRkzhDjkP3hXGDXWbBD/OlMZ1t4B6CSoW1BdkQi62cEl6ncZ
         yJCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoB/4khknmKm/JJx4SJH3p7Wlv078Nhzh/1ODHWTpZrg27Ud2t/Yeyn1gTo34fOkbe3viU4Js0xc+nvew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpoUy7NyV28dOBslbO6YVEUbnWCPiZTagzGLr2VEL628mfYfQ
	AEgbhWk4lFxRXeaJxMGXjsHK56zYCpcYJdOK6fvN8Stx/quYYpZ+r/QYNpA9VnyG8ni7LcWDHy0
	eMu6qlixKvqWm/breDia8JTP9kBKzqepqos6Jol+aSKqHxvlryc0rl5PAMrtw8R504ML1iIgDjg
	==
X-Gm-Gg: AR+sD12TcvCw3Iexo9gJZPYqIBFHmiAhKw8/+5Vt06YZ5oCKrDg3sZLJgRWrC4qd5Bk
	QsSTPGnRVYGVJm7oF4kV5JVHCniKHPbeq4snsxhq339iHdrUKNKlPcODJkuj0fHadOYjC1Oh4gU
	9ylQib/Iu35STCvTGbuZK7QZQ97jCOK3PTtstAbJzurZYS7WfyAoOHIpdt1kdUbMkMX0SXhMccv
	/RdSpjQ1X/QUyusOHO3dMNQ53DvhtsnvBYHWnQ7uvdnpi52Xoc2EGkZjIjQowT+YbG9A5n3erIx
	hykELWE23rTf9EoU1UKcHWKjvGeH0nrmJ15ZAImIVj+VfB2Rb5NukqqWpMWi/I/iQsdUgGh6BQC
	b8/0veREuIPPkB3icFi+PmX7SrPe+tiE5sjR8tTmoNruv8nLMBU5TL03T1k/Cua9tofJZZCRLix
	jFB5tJg9CdzH1ZiA==
X-Received: by 2002:a05:6102:2825:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-74ad172a9abmr242583137.11.1784657563699;
        Tue, 21 Jul 2026 11:12:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2825:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-74ad172a9abmr242568137.11.1784657563253;
        Tue, 21 Jul 2026 11:12:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41c9bsm596921fa.19.2026.07.21.11.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:12:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: qcom: remove the ipq806x Storm audio machine
 driver and binding
Date: Tue, 21 Jul 2026 21:12:40 +0300
Message-Id: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJi2X2oC/yXMwQqDMAyA4VeRnBdoA1PZq4wdZhtnBFtJVAbiu
 1u343f4/x2MVdjgUe2gvIlJTgX+VkEY3unDKLEYyFHtGvIYNc9oeU0Rbck6YUNUx953ob07KNm
 s3Mv3t3y+/ra1Gzks1weO4wQc9v/BdAAAAA==
X-Change-ID: 20260721-drop-sound-storm-7226df1bc850
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E8V/x1G6mWLKxmhw+H2N0U4tbZHI27YliCj8HcFUUwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqX7aZLl3LkSjmfDqTlXAqjPA4Da0FLPsJYVcbd
 Xf9nhsi/hSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCal+2mQAKCRCLPIo+Aiko
 1RfDB/4xuCceM0X2tbgufpxts0hkuihwIZJR1fzJ7D1ftlVhUeOJ3SRF7QLDprSax9n/SgN7s2g
 hLT3RRWaalry0RfxwYMU5FKJCNGPE2XxM2JwkW+BTOCu7YAr2lKQ2/5rlVOvGFEnMOafllzty37
 4LU3WjWda3QrvZJs+yR4AzKngED99ZhwmQSTkXaXi/r2uRiQtB6gwJdflcoabJKDDFRYTAWcW5h
 ro7phYSBhEUgbeYTjLNOhwhDbbJJ+GlyS6EZ5aMKyEy9W9XqFeGB2OS9AKx5JIJKqnyfEImU4EY
 4evWQUuAVRqKg3yDOuM7Ff/IaYQE19TWk6fg2kSGhp66iJOe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9XnsP663OhyLOeJ2NHF9BvcfWMtRHbPB
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fb69c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rruK_xjPGYUd9-Um4F4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 9XnsP663OhyLOeJ2NHF9BvcfWMtRHbPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX8ugRNMveVOaN
 gOcbQPsxULVAAQ49FdWMXtZGIHgyiqcXTNZXZgslTWoyKU3pXyETBkfnVPCRhqr18JHt+uQ29qh
 +NFlmLdBPIqWoVTWgGHUFhimbiZBwjensUGECpjH3DJ861l+T02EqJUNbDC5Jb7CC4yQ+BYigVn
 TdjtOcBaTpnPmGZSgN/RD4MPGleFQgg2238KRSp+5FONH0xUXPmdyS3LJQyQQNscoDROIxq9J+B
 TgJOHFsAn4NTBkNQ8Yn7p9VuO675arT2fP76Owtt99+aWeS0Mkyhk4GyQY+4+Qh8NE7Ne2jktD2
 WjTUYh+UDav3OVoTdXSDR/9VNJHlYBBpUy1cTHxaE1ab3ZuidAgOUvhB+dsF3yK2Yxpw+2aJUOt
 xQLHjFiVskToDMugFz8PSEU3XihXPt58EbC5+FVkA5q2R6S+AOa1KL2bpKDzrxNf61FUx8Ki4VC
 NZVZlGCQEPJNY9fEOeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX6OM82P6zCJhS
 XoeBLX9w67pXlVwUfLvpVQFa6EzP4uM0Z1a5l1X0tyHFMxuBogfIwxknW6GS19OCDVux6sNfVgb
 K+ZlfA7EvUU3hqZFn2hPqlXcC392yzk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210191

The Storm machine driver targets Google's IPQ806x-based Storm reference
board, wiring a MAX98357A DAC to the LPASS I2S bus. The board has never
had an upstream device tree, has no active users and has seen no
functional changes in years. Keeping the driver and its binding around
only adds maintenance burden for code that nobody exercises.

Drop the machine driver along with its Kconfig and Makefile entries, and
remove the now-orphaned google,storm-audio device tree binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      ASoC: qcom: remove ipq806x Storm machine driver
      dt-bindings: sound: remove google,storm-audio binding

 Documentation/devicetree/bindings/sound/storm.txt |  23 ----
 sound/soc/qcom/Kconfig                            |   9 --
 sound/soc/qcom/Makefile                           |   2 -
 sound/soc/qcom/storm.c                            | 142 ----------------------
 4 files changed, 176 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260721-drop-sound-storm-7226df1bc850

Best regards,
--  
With best wishes
Dmitry

