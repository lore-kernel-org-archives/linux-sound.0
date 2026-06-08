Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A503955DD
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 17:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941246; cv=none; b=Jn1dELf43Ez8j4/evzSK7xVeNbbaXCF4SbtSAkndZof/Mulx6geleGXmFy+pyroys2HRCKsTMkFSLtV39soeeVdhu+JHRXxVTaZr4215wXw1/onoM8I/oC8rngesQxOF6yxa/N207gN0kc7RD9jDKLrgE33Sq7wX4g41JZ89QJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941246; c=relaxed/simple;
	bh=bDkRxLlAlWZzxLQ2Kt6FCFRCVafDaXMIspOTHA1osNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFfC5fMQYY63kJf5Yen+oW3ry6seOnxlFvfOxJr1C9u2ED6LfjjZFdDPN72FRcRZsS3fJSjdsCMm2VwjppECezlVXdKi+/dWuAoz/WHR3gzuqjKvts3W0MshPb6eUbGScwEe32huDoMXLtJxbDq7jqRoTFNzim2oY2XzPbb9I6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqzjkByw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix3XFUaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqzjkByw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix3XFUaL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFV9S4041673
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 17:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QD/j3wLGU+hI+sIm6mQ03Pg2eMQ2R+PhiKW
	/UfMvO8s=; b=DqzjkBywaXpmDRmTfbGxzmEjQjejGxcS02VMBgjNdRG+x9RKFSX
	sABR0qUhhYWCfdrFuV2fagzUcIeMi70ElnT22Qj9yoQoNZr/gWVyxx0ZytXPvgRc
	sNNzIWQ1cRZ1XCyKX5YyuSmlyjodjwUuIa9Vke6nQIizxEygsPBtt+DJfJ7fLuFW
	OFdORLgDXOfEeh8WJK4FtfBHlevLliKiT89gKSSBT9iK6P/xGx+XCA9e16Tzsp7Y
	Th6AbbaOlENh7Ez7xhmNAY1Bltbk27pUtlZZeofIBoPr4mCcUsNywJ9CrtAymSwz
	GwDPKuh3sLKQ0SrLnStMgqjd/x8Mz+mi+tQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9pec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 17:54:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so2654983a12.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941243; x=1781546043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QD/j3wLGU+hI+sIm6mQ03Pg2eMQ2R+PhiKW/UfMvO8s=;
        b=Ix3XFUaLodxvYhLA9HSXX0i7NlFGt+/o4M5PYTVoMhfeOeWZ2l+mD7gDiVEyv0sjUh
         Y+fjaRfwtH9D3m5CTNZNJPbXbLHA5Bt+MRj/YH5aIMyf5awnRe/dxHVM4DfFAxGsEpeX
         +P7jl4vKFTWcwPBswtA11Yin9xD9qguA6SZLgBLrwFMqJsQf+3ccifo03oT3PL/gg00x
         91I5VP7biI8V6KoFV8Mm6TUyNq72+n5HXxXSfA5jxVoy0UcDzfY6ImLQw5uCJnVVg0wr
         yQiENoobnDPx+eAzCphJguUBLcK3SgyUSuZD678uiVFMSOCEAUumJYqeJA0aKE9SY56e
         tpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941243; x=1781546043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QD/j3wLGU+hI+sIm6mQ03Pg2eMQ2R+PhiKW/UfMvO8s=;
        b=aS3LFhUgMvyT6PhPpSucXwxh0uG/dZeobkhWxFgRRlbqBqkDRkL9NJAmm0mfM1I+lF
         xyrjcwh+Rzlw3QyxoANyaL/tD1qQKj2Q+6ReswgcqHWHjUSooAAo55Xbw9Z7HXe1R7k8
         xrjzP/DyNNBTc+b1+KZoUTRFnQ5lSuuqbatMWzNiFBzZXHCGeqQn78W/o+HvfmK48c9O
         3zahylYBI93wSZe/daDbaTWqEs1uqKL589Zi1gQk7xpmPP7gzrip6CQ+zjwv9Qe+FmCB
         BIlAHD+DSo7y3lnuTNxnrLybwO0Q3bLKdS4lAWoEfXgKQtww4IKYVitQgwK7RVlqEz1c
         9D0g==
X-Forwarded-Encrypted: i=1; AFNElJ+V1+uPToZIoURc2SM99KQky/O/zAKrUt9SnwJoCK4jP1tJgiPLPGQ3VzGmklrRSTaArKYNuHj1/HFL6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQM8Vs+Te5A+uQSBHYLLMYv8BrJc9pPsjcfVImf6Rkl8MNX6a9
	9xhan5B+t7BBazSLZi75M5ITL9KKhKa6SzYXqU5WkE9V6jXr8jYbVMUj+6JdvQLyoSSSRPE1gUL
	uhmh1jcURgE5s9ro60qJZIkxu9vxsky71T6n+s65KmMXR7W3D2O+WkKfO30dupCwHFA==
X-Gm-Gg: Acq92OEgoOd8dFdWJTXgOAsmw4iRSfF+3HipC3oklUian/o9t0lX6n9/7rkrkNx3lEW
	Qfj9PWR9AaW9UwotAXNj9j8pgw63nUsFYlFi7wkRGghAaE6GwTFAVxR9Qb2E3OU6ZCpadGKdDGY
	50ZLiCqirHJVE9rU7PiyPD/hCBztz3JfujKow91xIKnylbB0je7W367vlSXzQkF+EcETl5MnNTw
	bOkEellgRvjOc0be8MfXYQ2WLv5vcOygznRVJXFsJJ5UFUHnBCN8W9c4Uc06I9t9h7QiI/kFNMd
	HzqgDoT+BbtzRu/oBht5s4hGd9EhdXcHxXS9+fWgd5B1KrtZcegBheecuv52ViQDkPp5yL5hPOc
	0gT08ivNv29DwWBMNjDPAofWijUrKES2+Qsmzz9WEaM+YPsc8xc+x+rVq4wmYnj63Y9Jz
X-Received: by 2002:a05:6a20:d043:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b4ccf35b24mr18718835637.27.1780941242862;
        Mon, 08 Jun 2026 10:54:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:d043:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b4ccf35b24mr18718797637.27.1780941242382;
        Mon, 08 Jun 2026 10:54:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register layout
Date: Mon,  8 Jun 2026 23:23:43 +0530
Message-Id: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qCGRAei6xJJ43L578l1H4yCUGyPCqrf4
X-Proofpoint-ORIG-GUID: qCGRAei6xJJ43L578l1H4yCUGyPCqrf4
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a2701bb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pUmdQMMffi5nh1osYxcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfX9ZXkSrJ1GtnL
 hjLPWtHQuWvmChF7utjtM/BRXccX3kMGrHItt00KAT07eCM9S70C05YlymLyw5D1RcViXysunb2
 IKa/Lcsn98falnm4mFVmhP8cBRgiXpfDqKeTtsW2fARf1S2Z96qS1OE4tHYFCHb03lpEWNCgmoH
 qKMGQ3CzW5KjuJQ4TZYEIN9cYG2U8nr5FIehXcZfhEp51prqVzlJQlE1jkz+PzRJHTR76zAA+n2
 ppB0ZDp7GGLgQPA85qag39qroL5SZ9oFOFBOhtcRt61k9Dek7wr9OuzFhWrU9ZY3ySyt4raeuVf
 FGaOFHeTk7+X4TQsuBO6O6VoMY04ragoxGG/EhLN21p8+n74ro96Ec4FdVIq1I704HhBOnaHRKW
 FK1A2mvKsvokpySWSGdGJTJV06ISzCyKXEJbbYUc5POneKPeZcx4vTEAbc45tsYj/MAlqmuBLXS
 972XL1GUQGViK5qJYGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080168

This series adds support for execution environment (EE) aware register
layouts in the Qualcomm SoundWire master controller driver.

On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
status registers in EE-specific windows separated by a stride of 0x1000.
Typically, the driver assumes EE1, but platforms like Shikra have the
controller routed on EE0.

To support platforms with varying EEs, we:
1. Introduce the `qcom,swr-master-ee-val` DT property to configure the
   target execution environment.
2. Add remapping logic to adjust the register layout offsets by the
   EE window stride on v2.0+ hardware.
   
The first patch adds DT binding documentation for the new property, and
the second implements the EE-aware layout selection in the soundwire
driver.

Mohammad Rafi Shaik (2):
  dt-bindings: soundwire: qcom: add qcom,swr-master-ee-val property
  soundwire: qcom: add EE-aware register layout and cpu selection

 .../bindings/soundwire/qcom,soundwire.yaml    |  6 ++
 drivers/soundwire/qcom.c                      | 78 +++++++++++++++----
 2 files changed, 71 insertions(+), 13 deletions(-)

-- 
2.34.1

