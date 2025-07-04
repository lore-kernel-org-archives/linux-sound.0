Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FED2D5424
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631160; cv=none; b=Zlin5Y62ZCbjM1b5iRaHfSCEdthT8bOCNB4p9s8L8GnXeKln336eX15VLGYF9ny6ViOQrEBO96WopthZPuJ+QreTwJN65saadiGO5BRHjjUlKM2v+RZCDEbhukVA0m7h9jZIIgpGhjeq6gxMHJm4HEdW0wkGS4E9KY+ER11NKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631160; c=relaxed/simple;
	bh=eY/8mPA3OuIFqBWX1Dtb3n86syoF0oEJrMuduR3BVvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvQcJCgYOSD+qxBkiBlP4j+R1F8zlnTwkGYpeLds21XhBM5UkzcoZmpLxXJFz9XThuAvsDGtwp39BqYreyCEt7CSGN4IjLKk8zEqZUnGEFiXcSAG/rXRo7r2auYIJGbVdmJoHdPMXceMBevemHDHN8WnvnhJwHXIG4QoJW5JUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/zRL8B7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/zRL8B7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644hrUq018581
	for <linux-sound@vger.kernel.org>; Fri, 4 Jul 2025 12:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P0ScYG836X0AMGgN04TcZ7toMg9xkq9JLx6
	2TK+uUEw=; b=H/zRL8B7njti7/MZ0kNxAs30Vfm1CqTQdADUdyq1nhk/yT8e3n1
	wYLlC/wPR6hhYgEAqEhW2Kc4dHYwo/piOhkZh01aXoFrymyllApGtO8XVi/nJEp7
	hKn/cQCoO5xRRa+gacLRnx+QIdDrDvTnAZO+BPy0cZwb+/ZQ18/JbWHQ9ynsjQrA
	rVSCUx5pK72tvpHe4FKFvr1Tn8Cmzm2kiG9KlJFw0dSVkrSkgnfKCv/aUWI+0dfJ
	fm9PtR3uq2wznLnDnjBuIznnK/lEKJpobV3UFzFOxXFZJ+yCJuul07z8JBdox+Tr
	3F8LV9Dh/oAnptEZlsiLGhjcO+OUTbEVkeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxuyfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 12:12:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso123228785a.2
        for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631157; x=1752235957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0ScYG836X0AMGgN04TcZ7toMg9xkq9JLx62TK+uUEw=;
        b=pYFvEJxgD0pWgf+5Y9lqkEVZy+53Ylz1P9I+131PHXlHEDord3E8QEacdWQz/Mti4U
         dgav/+I3tHoQrqFOf167LIHeK51swLuXWd41YWM/N93lgIqr4b+hetw93PWA6Hmn7XIa
         WYbpXcKZtzVWE9alF7f8i+novi8b9Jz2x5R0EtjN2FZmvWxr4PS0cBuEx9k3JPb0qY0X
         zuSuvqD9g33IY+TlVZ5TbQbLectCkkUVefhUP0qgMhdXGNdBB8pE49ei/wL5mf+/hZiO
         tAt8T4VdxgcLp9lcGfh+cg1/r+hQ68cPp3I8Cjh5M+1dU5/Krn+ifYYEveXuzwXN0l/f
         JdLw==
X-Forwarded-Encrypted: i=1; AJvYcCWhYRmZToU0rgx+MFqGlg3EQ97Aor0tX1UN2V6yA9RVQIgNixtWJNhBYiL/MG90gl929i4aLMH/6b8oow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTtuVlojDC4EbdCaZRJFWeSHzTti6TwbhhMWhwluzDTEsBHX/O
	XYu0aTLjP9I53iHlL8xEtVWl9yJW1g1Uoy8KDbHhkrUZ+jD2ISetHcMr0xD13GXlrAnHDHkx3cq
	mkrFdLJV8G20fGedfQs07z/3CUVI/fUeBSchYAJEkNGEEGOpLZvKFm8wNxNdRiEdoMg==
X-Gm-Gg: ASbGncuMkA4+pRDGkw+QuebbuOAn0DVKrBQCB2U/NJ94dSLGEIz3LWOSk7HVeURMDqJ
	pgV70Hk9E7y5YF3zr8F1/i/eND/z1ZqLtEEtu9IyZpK/NEzP4EQAzRvObsH6HrC2xonNkGVsjYn
	6W+fWYK1qXQ/+5VSW3Y5hNn1A644pVVF2s6CKsS3jIK5s8ogAsmJ6hb5nMneOa1x61YMC08QGA5
	kb3+FJ434E88jZF1pmDx4qXF2XqeTQTq+pPUTNbNLuoGvLFVP1OKunmJjVT6VAL8t6m8vKIv7/s
	x/N0Kyf08OH0sHpeOEAY5g6L9Ea1uISi6vypW0PP9/odvazZC4ZuHew=
X-Received: by 2002:a05:620a:1a08:b0:7c9:55b2:c3a with SMTP id af79cd13be357-7d5ddb1d7fbmr312463585a.11.1751631157136;
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Eg7B1FvZwpHU9t+neYQcsyfuDsXo/Nr59/Yr3Dx+yEtIQ5oCFC0zImUbON+UT2wj7aHy0A==
X-Received: by 2002:a05:620a:1a08:b0:7c9:55b2:c3a with SMTP id af79cd13be357-7d5ddb1d7fbmr312458085a.11.1751631156676;
        Fri, 04 Jul 2025 05:12:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:35 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Date: Fri,  4 Jul 2025 13:12:14 +0100
Message-ID: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX+pvAABR7KtnU
 xKrCHbsXPUeQaX8lKCq3S//JYlvv0Pths/Gwlsfbj1Xs463JYs+28FKnF1NzhrV4O5r2kbFgOvd
 GalXGppJwbEzt6eQSJXzUofHkSnI8aa0h/OAz2QsighiHZUcqfgg1M1B130OutD+ChuKMOD7wKG
 HHHq/mvmkrfBcyBCVxPPttxXquItEipUfDe5zyEU3gfTy9ZeNhKdp06PyxFosot3Qf8jM6eK9VF
 L1jI6nWqz67C8q7tFj4q9xJ3NtX5yQyzEUhnggUcjCu+FeXS2McTwsBV6ytGpT5vQ+cOmrHhtGG
 2Tsz6zEtMLd7jhqZ3nHfkxTTqqxOc7XTvOEDve85E/P8enaD1sO7SyDlAxvU/UAqdcipRw2gazf
 6rbcj0f7Hreu/LHbVQdPOg9LnzfDydBTbO3wHCc02bObwHIoNGk4UnHz8ocipaXWwIkiTJ1l
X-Proofpoint-GUID: 4-A8xH9GkOzrDPplguCEWu5SpNZCP87p
X-Proofpoint-ORIG-GUID: 4-A8xH9GkOzrDPplguCEWu5SpNZCP87p
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867c536 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ja3qRCn7lQV6jF_xop4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=663 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All these 3 codecs have been duplicating two of the soundwire
functions. Noticed another new driver starting to do the same, its time
to make some helpers so that we do not duplicate these functions.

I have added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.

Changes since v1:
	- updated sdw_slave_get_current_bank do error checks on read

Srinivas Kandagatla (4):
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper

 drivers/soundwire/bus.c        | 12 ++++++++++++
 drivers/soundwire/slave.c      |  6 ++++++
 include/linux/soundwire/sdw.h  | 17 +++++++++++++++++
 sound/soc/codecs/wcd937x-sdw.c |  6 ------
 sound/soc/codecs/wcd937x.c     |  4 ++--
 sound/soc/codecs/wcd937x.h     |  2 --
 sound/soc/codecs/wcd938x-sdw.c | 17 -----------------
 sound/soc/codecs/wcd938x.c     |  7 +++----
 sound/soc/codecs/wcd938x.h     | 13 -------------
 sound/soc/codecs/wcd939x-sdw.c | 13 -------------
 sound/soc/codecs/wcd939x.c     |  6 +++---
 sound/soc/codecs/wcd939x.h     | 13 -------------
 12 files changed, 43 insertions(+), 73 deletions(-)

-- 
2.49.0

