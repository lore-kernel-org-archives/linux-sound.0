Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FA832ED40
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460135; cv=none; b=dUWshOWTsh6Y23/161vYjmxFwJrffUWSDUAbe+m+lD/Mu19vFYJyqze9AIRSDnCO+z0FVE8e8jyj61+ZGYMq90emBU0ge4WXhBm7UIW5DR39TNeL+9oVbzSaDBL4MwCJ/aAPvwDHmBUDfYIYV6OsCNSSzSn0SjVwPjNzd/ccFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460135; c=relaxed/simple;
	bh=eVwq/4gEkODxQjANnf8GBdaYp533e/tmmhRH3w6klWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=azjGz0iSvJMpzePhw3T7kQwk9mA5L0ftCsQG9xqacVdvR2ZFiWTvdxAc+YZlZkYKXmu0R3hnAJ0v9/gHlsjgd3tW3GKxj4DqwtR1rDGX/fWkQDs2OT6F3iEKU5di4wXWH4zJIvzg4IygVdZurhMddmcTba9TBVxZ7PHebQOaDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gic1KLzt reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gic1KLzt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6V9k0384218
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=29WbPMmZtHkdt1qZy72QL7b3tVBAUu8SaRr
	fvguze8o=; b=gic1KLzt88O5Ae71pzXC+/whLtANXH570MlpmLxYPiDYNuBfZQp
	q59fgELenUPmd5768ECPqT4DT7xo5PiRj0pK03OFtNAMzLcEGjY38Ouz7XTph39N
	CiwMJASV6hqNKPPW1S2fIux8l0FbljUpAduQOmiKKSN7YZqfNHMfL6JQ7NcpXPGk
	nAlTFmbTGAkri3WKaXMe/DFPUQeXdKo/CWaq6Kx8v3kNT517jQB1Rl+VJX3wvo38
	ALYVGR/XJ+eSs1jmRD0XNxEz3RX5TKG+6JbMI2AJVnAWe3E3rC/nLmZLZVMJxmFe
	ytX0nus0/EcMNAzpu2I+6GZFtcb9qxOt1+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8j1yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b895b520a2so5388279b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 02:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460131; x=1764064931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29WbPMmZtHkdt1qZy72QL7b3tVBAUu8SaRrfvguze8o=;
        b=j2wD0mEh4keeXCVJKAMY6EM0Ii18z5f+XrKXw8uNnKNN7s1IY3OyP/gTd+0CfwKB8l
         Kqkrc+LD7rZkrX+zUw0kmisyI2qtl0GVRakdINBDm66nPxTNd+PzqXhWdGTHVsQlXfco
         1dh8dKj0aOoFsifX8sFT56M1BOSF6CIfnuwsuVBa8LUG2q852yBWtPoFHJ9qwuHOzviK
         YRD1NBE38P+OCJxhXy+FsfhHrHCWOiLSZkiibvaPUaU5Rz+5ip5m12ypbRtIpnWozR3O
         G9+lym89V4cS2kAqsQ3U2/nv3GAIU8CMikKVv1gXJ4OyF8oH5Z+EEOPWKMHPI1CeOnt1
         N3BA==
X-Gm-Message-State: AOJu0YzeBG29tN1l4MsGR7eoN/FhdyCoqVtoqWZQWse3ZusDy2HWiIxh
	zmrsF+37MQkSSWdYOUcsHW0rB1F9XynzPayN7BOLsbQlQKue6olLDtfIpDsIdgQeeWVxfccM38h
	WK1b6eshHhBQpJNbLdED6iN3z2hXP4qfdG1A1K8cMBSUpJ7AlcomBDXTB81ovDFQ58Q==
X-Gm-Gg: ASbGncs42J5dc7f7xGyChY1OUyKVk5I5EqcRC8YUXTSdhdWKhdkX9Gekpabi4c0QKYm
	YAyRFsrAC5l/jKhNTZWlPwLQ3UXpQdHgemaLeLw5Otjhu/+rPJ32K5u+Q/orPNoZZzFP11vLTIz
	Ifln28bxQkiGPfwOz9vul1H4gzEtNvmwfiUCKPukq+IwVuYcdtA6LDcRL2FpJTHAoPmcE4D/II9
	0ahCJHD1IygcKxebgcHLdXeEZekGMySgbY+cMLIXDoeU+V9znK4A3iiLzEe8BoZbD6vwgk0B2ZO
	DBHEoqF0BdJhr11L46so3UVPPJv3mryWfngVnFitOM23wUSPKL9sTb/AU5sFrfkcKSoV1oxHksB
	F0cQ=
X-Received: by 2002:a05:6a00:9508:b0:7b7:5dc5:75b8 with SMTP id d2e1a72fcca58-7ba3c66bff6mr18534018b3a.29.1763460131118;
        Tue, 18 Nov 2025 02:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETb/+Zba0ifp/N+rXlcAF1v3+Xzy/JH2PnjhndExG2SVkRHLUm5qIp3UI+fN5+vOwZYmzw3Q==
X-Received: by 2002:a05:6a00:9508:b0:7b7:5dc5:75b8 with SMTP id d2e1a72fcca58-7ba3c66bff6mr18533964b3a.29.1763460130535;
        Tue, 18 Nov 2025 02:02:10 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm16120030b3a.33.2025.11.18.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:02:09 -0800 (PST)
From: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] ASoC: qcom: q6dsp-lpass-ports: Add support for extended sampling rates and PCM formats
Date: Tue, 18 Nov 2025 15:32:01 +0530
Message-Id: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gP4FCwqkCt7723ZV1niRAC19uqkYu6J5
X-Proofpoint-ORIG-GUID: gP4FCwqkCt7723ZV1niRAC19uqkYu6J5
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c4423 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dGAPf8r0MKmh5P99Hx0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfX33zL1ohAb14X
 D2Sw7hfSg8qZzX8jNA09R4ZCCk03re++OxL1ccFj7jgL+nws/nDJW3D5I+bGT9r+cq4KBUtdQu2
 3InD003RchRxBnXZ6guveAzD8di1gp/YF+KIxlZQzX/9zlmydFvMFyCbqG4jiNN0n9OKLzpAF5S
 NAwvE4CP0C+bpo03RgxDM2gb5oSIGWOja+o00A5VJZmSz43gIF+jt/8hDxoFn4knqWWn8tzfq5F
 um09KU09c3bfFVXRdM9Bx/eQ5LJAE3Ijncrdr9gnr17Rs58AOvhx7Po7h1SBsgB7kMLziy4Wuvm
 p2ThBXG3nn/7WhtpqZlvmtm1eMowrbCoQtXDDQXaLwTvX8rQZ3GsOexX0epglrlgJ/mF50W5wPl
 ItTFp58mt8bxi008MSBD03EcXxd+sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180079

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

This patch series enhances the Qualcomm q6dsp-lpass-ports driver to
improve audio flexibility and support high-resolution audio streams.

Introduces support for a wider range of PCM sampling rates,
from 8000 Hz up to 192000 Hz. This change improves compatibility with
diverse audio hardware and allows better configuration options for
different audio use cases.

Add the support for 32-bit PCM format (S32_LE) alongside the existing
16-bit and 24-bit formats. This enables handling of high-resolution
audio streams and improves audio quality for supported platforms.

These changes are incremental improvements aimed at making the driver
more versatile for modern audio requirements.

Ravi Hothi (2):
  ASoC: qcom: q6dsp-lpass-ports: Add support for multiple sampling rates
  ASoC: qcom: q6dsp-lpass-ports: Add support for 32-bit PCM format

 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 108 +++++++++++------------
 1 file changed, 52 insertions(+), 56 deletions(-)


base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
-- 
2.34.1

