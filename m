Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA52E974D
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039501; cv=none; b=nvjr6uHCQ/uJ6M2JZb0HDjcdIh7THTc+SliqpVUq69wTT3Q3SN+SCTK0aCgGfH6wlZ4avqHn0b6g2y1/cqSBw1Vy+KT5EusoxfhwkfTSquUdjnr/HZ5NWWYIdUyAX4+2v1RyT/hQBrAQ1U0gk6d2g2Ejk5BqCPwgl/tZdJwSCQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039501; c=relaxed/simple;
	bh=5hD/cXUbagplk3UVhcm2A2EqQSEIHADTEb57WitDj/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mup3ZQSlRJacsxFY+ovqRoo2Ti8xEcedVa9ayw/WcZ15QeCDsJVdlAd4WFzsUkKECM5gfyJnGg2Iy6zqZ2JKc3dzRsyVog3EhiRY9PYCFMZZUx4TnPCVRZBPlAZKwa9mcfOSCbCZoC1+YuzCcRrRi02E+b2ANGYZ/y4YHBhhu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joCX8u5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joCX8u5O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCOqvW007917
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OVY990Jukt4echo3RExNnA9BOKm7fyhFlYx
	ouIGS2vU=; b=joCX8u5Ox4s3iYKTy220awF9UlwYq7mZJAzoEjecIBvrTODCDZa
	Y0brMQybHXtJmLbSY5zjnzKSsd7Ty0Wrx+uQGkWdr0l/df53ZIEA0Q1d8zMdLQ1m
	iTevFgEhKCOCMkuQcLmmAUZEBaNy6zj+c8/eEE1WLDjDdGiYFaHngRp0lMnrz5vz
	TEDuQcuY+5Z8YpPXXykfWcFYLCDssKxOnAuvyaCcUd1/HZD/AqCsijKIXQN3zVi5
	XxeNkql/yp688IZ1Zr2dzY9FKk674sAwtyKFZjDGpNu7MEdm+LWeP2Olwx8vTYNi
	ngoeAW/dqlWRCVgn2KdkPLh6iEQTrw+NrDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqwqst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so344464285a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039496; x=1751644296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVY990Jukt4echo3RExNnA9BOKm7fyhFlYxouIGS2vU=;
        b=ncQL8ZggCBoTj41K6Ce7Scmy+lFMzp+6uUD7gAWBNF4buW0wSixy1SPmyFOusYKpqZ
         IdJRQxNNsYsEQiR13ie7JxxByN/+BRYXnwYnDZeBQKRiKbCwfPPtr3N0b9W0zrWubpzN
         moKoio0ooAh5gGZKU80hmk5LqK6GnSBdDHsTdHSt/D+uMAtG+19PT2wMqfVbRU6wPfGo
         YcpYdJ8vE9bUEhYrIaG/Shqe+zcmE01ohv+pujUlAGi/NSDWGHHO0TLUths+L0/GFwwP
         YU0r3A0BqKbbUQrZRQsLUuA8u1lCGzz7Qn5Jy+i3lueZCeO+04EGKiNazX2DS/bdzLl3
         pPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV114xWn9S1FiLBfdkvLf3Wg2gLwDVO7ilZflv3a9f4FeI8zt6nDNFnHqUpn9iGB9M1t6dxf6j2Y6+GLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1oCRVN9TYnQKLr8A6rcD4EbyIY+xo+GGs5cBUSSycnAKdNAdC
	Ht3WEvp0vd3JLyBlwfpTutnoBsG3orVwtCS0DwtWvQfxggMg14Dyhzq1v0a1Z5wtTVGa5/sLcdE
	lvrpZD7MiI/CUpol9+/EL76WMUEd7G8DVto+JDONLagGoHLsoxhQs33VaAViuCC7UFQ==
X-Gm-Gg: ASbGncu9SUO6wiezz1wCWNGU1D1hML1obbvTdQ5tYyhBvE8x8y+03t862NtuAO2fN5F
	IVbbky8NSNcv0Jk+P1vazgePitJZPRNnEzY64UaOKqLh556D42IRr+psohll8J6kE2ZZ3vy0Opz
	2bOT2UzlfoE7LCes94mCC37GDDPaDree3gskQaWAtvfVvcXiUBb65BpLtKR3rjS9OS5xk7h7rTn
	a5cdzFR0AZyPYGGcdp1XEeR2B1f8MTOv9zBBBfmDRn/6lxaeYRksJm+PppC6jOGOlfvCyZBGkhz
	P9yQPW2ArjSD1tKwRDWNucIRAUs58jzlkyh/STu/wmpZ8rheJSO45Dk=
X-Received: by 2002:a05:620a:1723:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d4439b744bmr582492485a.50.1751039496143;
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ3ebcyYFds6UbAx+BvNEutdtfVQuzxIsWg5tnkn1hy8H8wtGUG+i3Ja19Fih2KXpJLlElNQ==
X-Received: by 2002:a05:620a:1723:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d4439b744bmr582486385a.50.1751039495492;
        Fri, 27 Jun 2025 08:51:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:35 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Date: Fri, 27 Jun 2025 16:50:59 +0100
Message-ID: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w9F6JbyEHpIm62Akx8XDoDhyYQVoTqeo
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685ebe09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ja3qRCn7lQV6jF_xop4A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: w9F6JbyEHpIm62Akx8XDoDhyYQVoTqeo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX4D+sp2xF0vy6
 w5Q05GEVfCyObQfJJ6mfGrCmiqszWQ8YboNlo0SSZ8rfBV5yurfn4af91BqCKej/cUcDpwAhH15
 yv9eKYHgP3pC0Z1JXUvb/zSiJ3tUtYv9OtmMlTPvMoup/41RthIg9reakjUcMnlW4ihOFTk92Lq
 MJcpzg/ZcN2JN9uAvTuX4BwUnQaySLyLygEid1bBLr70NpWgfjxLUSrwqCyOv2U4F2/9+bMdIqR
 v3iQjyDBMqnSfIft3FupADdIIIYgAcj2txQV0X1Nh70GuAls1TlK/ysGMRRrJhG7vFYbQbeIJGk
 ng4/TQgi6C7m0qAW+pPYRoKcAHdH7maU0RKWuTLPnXflvUaXe0wZlLOdLEyVyj27b6hx1q7viDT
 HmRu0cdsGdmL0/1Q+Cl1TdeCUdjhCYuHXuVq0YezxiyY3G4Mr7BQ4nIj8w7r7Voj1xhH3Owb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=659 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All these 3 codecs have been duplicating two of the soundwire
functions. Noticed another new driver starting to do the same, its time
to make some helpers so that we do not duplicate these functions.

I have added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.

Srinivas Kandagatla (4):
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper

 drivers/soundwire/bus.c        |  7 +++++++
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
 12 files changed, 38 insertions(+), 73 deletions(-)

-- 
2.49.0

