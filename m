Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F061E7C18
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534291; cv=none; b=fMkeGHUC9afS8b9Spje+17SolioeuhMxGQpXp1z6wACCqFPqRrOcZKBSBosM9wg1S30QXJhp8N8M8BNGozjsvtRB4IEOzPfccK6M//PqLx8vTiw+qeHq/N5Y9KWj/E6rWT+czuGLu7MC12j8J6/ZoKu+N2NSVaK+ZyCKGQM0as4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534291; c=relaxed/simple;
	bh=F2O3ZJ71qMH0ICSS8tWDibzVAxjL34Ltr6haPBzh4tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHK6vl40jKxpbhNoy6tuyBi45vbm62DImWt1uKs4iB/ZiCFkRagtw5U4xuMp95QO45D2h2tKDQplVb5zEQ6cN/3Xx7MNnIAEXzCIpJEreinga5//080M++pBeJLugZrgewTG7ujkvwxC3Ved58p4KST3Z6S2fS7Jy0awskFHzL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vj17OglB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vj17OglB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FApoAu017425
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bNq/k7frxt1cbgp5PvSrzLAku17t2q0t2kF
	clXsVJNY=; b=Vj17OglBzp5KHidDsIttYZvudc1FBUCo0APQYX6rRY+rDaUEoHF
	B7+cjUKOmNTGzU4kzHLjSnY92iqyKeZl7VmxoHn4+kPOyXXJ1E81pObLMJpdWQuz
	tsW1h2WeZvc3ENvQxRBpLZq7lOhxgOnUdzQoo5crPfwHi9t97YIFg/UXJT1WZCi1
	dfJdvxC0LqOYyB2jlowjksTS9bo7g/u+DY+VWpPT2j6+wxzeDjIULFBCorp2OOvy
	WFlx3MirWl07+R/VzovhHaq46Gjiuy5xzkgYfeZdJdkUKDsNh3KPXSTyoUvJjIQk
	FNvV295tDjm8r0JNf4OFkRU+TflgSnS+0Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt9ej6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8715f5037beso2692665585a.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534288; x=1761139088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNq/k7frxt1cbgp5PvSrzLAku17t2q0t2kFclXsVJNY=;
        b=DplvFsd0AacwD1LtNge7mFov6vdwzddk2pSFBq3Qp70ERiVZAxv3fZ7wmJ71hZtu0h
         88l8e6B1sJ8VJm+1ycu2AE6LWdGJ6Y0Z7Kwq+7Ji1Xjpyh0bVNCwsM7p9dNRw9H2OiMT
         9vUbd/B4YcyRChYrn81TWIVintg0PuqBHZT22VuKleRwc/ov7s/GDcrBD8+8/foKq3U0
         X0fZEJY4DrPvziZ35dU74tvzvuDyyoZ7KvY2rlWpn7bLHeDQ0N6X1vxEg3/genVB4LIL
         ZJa5MBAs6jAsIh/QTBZ0uJzyv1xfcVTbBUq3p2lWzVZlLu7//cGFtWHp1GUJQVjz6yMd
         KnFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv7BaGefqnRsFnx7N32cmRSRE48KslMMmr1YNx4zvE0HTT2asauGb+VJyMXkBjryu0pxUDFq45WUzkeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGvlxvnjMiowJQuFFzWyrAG7xnVZzrMyRnFmDpvpLPHh8mPVg
	i0qC7jJo/R149C82scwn4YiaACDgZ0U45OjFm+NUUDR7WNaUGtoQTLewth9YPO4Pdkes1nRe2EP
	7jG/6/I14MLHAqPTRC2/V8tFynxsjb+ZIa2AAJOM2KJieuKHWdJjz7I/Xi/7vk2Y4dg==
X-Gm-Gg: ASbGnct+le4tC1pnJnArW0SUnXurR2NI0gxhQneVAMVVGdEFIc/LPR5OdX563zx41GZ
	1N5IImfnHWGkv1vYrbV4/iHynTDiOdS/BQdif069EMND+HCVulDUMTV71kS/YPnqpZXhcirWF4F
	l2iLyDFNBS/MDDMXZCCNXoFuzi6ANa5Rj22c6a//DNxiWZP/rnCB3eoX94bHK2p6D6h/FXPQ8Np
	bxx8dHEI+PovII12H9ldfD5GM3AvZVXPakcbO5XVYkxMcHTujNt5xkwZNlGiA+W7HRPI+d2JC6K
	bHgJB0NoFUyr4THuU8alVjVnZ6wH+Ey3vpfM8mLeQJOBVH2rYz6mew==
X-Received: by 2002:a05:622a:1823:b0:4e7:2645:3ce8 with SMTP id d75a77b69052e-4e726453eccmr133348081cf.54.1760534287496;
        Wed, 15 Oct 2025 06:18:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5GkTrLEf2eyVpfcrbf1++cpUyKY45rCxFJ14NSiwgVZcXo0rIHi5DxLkxdId8UkVGLsuHIQ==
X-Received: by 2002:a05:622a:1823:b0:4e7:2645:3ce8 with SMTP id d75a77b69052e-4e726453eccmr133347221cf.54.1760534286750;
        Wed, 15 Oct 2025 06:18:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/9] ASoC: qcom: q6dsp: fixes and updates
Date: Wed, 15 Oct 2025 14:17:30 +0100
Message-ID: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PKyGOaDQFQzfkj6q4VoHT_F_jm-L-W6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/w6JX50iH4UZ
 Ik/H/jiSfAraVN4WDSvSP/z8qxygI2/0IPRNM+OVtK+fcpVDCmkpqCw7/Ikw8xczclj4ZsQc9vr
 GGgKj45WrLvUAwLOa13raHeLL9m7JqSNqLgmVyE/G9C5obk7+0P60RO+RU1ejlCCX6FcLUCgkJN
 7KCLFuT4B6p/gORUb6C8zxvH//O6dYvX2kuXPWRMeos/z6iMj2kKWa0rgkMf3Eri22TscodTpBC
 UKLsDHhXYUdQfg8jGIH6l1LtVPfxDp0bbFyl8JZ+bbWZiu+WDW/Q3H5Q4bXbTeUFrZ+9dhlEXnd
 R7SvC+Z1zN4qY4rGle37SX/a1KnSBE3jnoKGJ1FYOMbzHQBV+9ImdMEhEWJBMaRwc0ED23H0+qT
 8jv8IxZBzsAJACltOwIL8fBCixb7Yg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ef9f10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VIej19u6sp1ej13Lf-MA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PKyGOaDQFQzfkj6q4VoHT_F_jm-L-W6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

This patchset has 4 fixes and some enhancements to the Elite DSP driver
support.
Fixes includes 
	- setting correct flags for expected behaviour of appl_ptr
	- fix closing of copp instances
	- fix buffer alignment.
	- fix state checks before closing asm stream
Enhancements include:
	- adding q6asm_get_hw_pointer and ack callback support

There is another set of updates comming soon, which will add support
for early memory mapping and few more modules support in audioreach.

Srinivas Kandagatla (9):
  ASoC: qcom: q6apm-dai: set flags to reflect correct operation of
    appl_ptr
  ASoC: qcom: q6adm: the the copp device only during last instance
  ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
  ASoC: qcom: q6asm-dai: perform correct state check before closing
  ASoC: qcom: q6asm: handle the responses after closing
  ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp
    under-runs
  ASoC: qcom: q6asm: add q6asm_get_hw_pointer
  ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
  ASoC: qcom: q6asm: set runtime correctly for each stream

 sound/soc/qcom/qdsp6/q6adm.c     | 146 +++++++++++++++----------------
 sound/soc/qcom/qdsp6/q6apm-dai.c |   2 +
 sound/soc/qcom/qdsp6/q6asm-dai.c |  64 +++++++++-----
 sound/soc/qcom/qdsp6/q6asm.c     |  17 ++++
 sound/soc/qcom/qdsp6/q6asm.h     |   1 +
 5 files changed, 134 insertions(+), 96 deletions(-)

-- 
2.51.0

