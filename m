Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF074395AD1
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 19:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934223; cv=none; b=ONpZkUPVKU3IKVq/f/Bp7vpqjDe9r7gWkQtYZ1H434oHAUbZhj8c3NfsGl1SNZl6cjaQ1haSCt1P2mI8JUjCVn2xPb71ezV4Mj7OAqdKOcTDFHUt2PPnRW1cWIckCMDAnuMqGgu0flvmthRcLZPR+DF7wtEkiXlWsaWHjHrANCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934223; c=relaxed/simple;
	bh=+3usITQGeBP/caOcJ4T87j2VOX2nM25kO9QIY38/XTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOBF1cEb1M3rF5lQmKEcSca5Ku2r1F7A1nMJBmZg3+rBiDft4U6td1iSHIMG2G/fVU+kV1yKch4OIRxSvBo5+AaM9eRffa5XvFwsUi6kmnFN2CJcW76iOvrgrhOKbWVZvNOF5wO/PuliUepqDqSuFOANcxctyhH1zkVlVdMsGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAueNVVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXCxUj9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAueNVVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXCxUj9k"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmqHj1590097
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 19:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JP1731msC651BB/VkadNagnugoH7NQWr3Ce
	rTNsZZTQ=; b=dAueNVVkEUzv0SkZwGkwUGB5GoTSViPBT2TU5cjXB8d9NS8t1jt
	Zv9WG4leVSVa0wubhu/PAtWYwd+yLQcXz+vSIZ2v8QMZOrZ/D2QQIa6whbNyVNl5
	t+cRXRDUTSjeMdCAFloDxD9WhQFkypj5NG9jBIZmstMAWWEdKY3LFI+NgUd9DCxe
	PxH5QyjrdghEwAOgo3Bq743rVw40x0ffT06pPU7w77LSjTNau8p6iE0hocTT80Qc
	pvfWifDmRYUC4VQNne3uyTQZpethTiAws6UyBsbIwX5AcNbRLo1klRULzT8qiyHU
	evmsVeuRN24HH/Td7qXHUTRwCBLXl9jr74A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q09gqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 19:30:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso303916985a.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 12:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934220; x=1783539020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JP1731msC651BB/VkadNagnugoH7NQWr3CerTNsZZTQ=;
        b=hXCxUj9kyOzlQi59MXnMCkk8a0bnbwnOpkorVpvn+xSEH2127vE5KoF0ZM5zeo4psg
         CNTn3xcf53tfAWegFG9D09s8gvHJyKnZkeMsW+iCgISf5uAvncywsfyrHI8Ydvdsh2tg
         zJKZFHHqW//q+hNJGIuB+jLmWXk3EcXrOtFitcZv/Juwplj6cUV8m0pAJXYVMN+k5Pm6
         gcYVfkS1/NDahwMNYSQoSnxHhk7IRdhGIhkP15L9JKPMsYDO1OWpCl5Knqklxq2uM+ew
         H+IXYnkSgt7QCUv8jIm2sO5nMQQP2PW8P3MEUrvywUmmax8qlRt1HfDw0NoHBw8XMq39
         03Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934220; x=1783539020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP1731msC651BB/VkadNagnugoH7NQWr3CerTNsZZTQ=;
        b=qzloIn8fyadRhXHpmX8jCzpU7PxLVzbPjFoA8Ypwuk/0LVil5g1XThYEbvCVQuuUTM
         VqVGNzbAQDr/4kR6GV7V4bQkp6XVLijjb75PckvMkDomKwC7QJRhPW28p1IMHp4FyJ1V
         Zmpbcazre6R2mnQJdvlplObNqw4Mr0mLBy6qxqicZtn0C4avk3hmVPv31vMSkdpHngXF
         mWsojL3z8AWR7VQ4qOyEhOALmRKd6XqO9PwY5EIvU1xDDeOjyIKZ9R33XmLdBB0KlbCQ
         PqDj253ELJmDBLXGEx33LE6+wjmgFSsdMRJ6WlYB98AUI7DsDk1y1FI+Gjo0X048AU5r
         n6OQ==
X-Forwarded-Encrypted: i=1; AFNElJ84XMoeTxFakci/VnBZnw1n9vJYzOmCDVS4/3yZwEFvuJsY38O2mKB9e+UTo4XoOPQ8CpSOMJjx7JnUqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGJ+YXt2U2ElTVGLBJojTLOk9NkP+zoOBer1hDvFZLR5U4EFF
	miKJ/Ur7Y2+rfzZvu6dAi5tLPtpVxjVpPDoH/m+WP5ZSS54l+f3LU3qe/S/fQQEDu/7oilvVTY9
	akDi2jO94lN6szbF25qP/xkLjdHRG8ueYlX5PbbVw0G6ho1U3f9sw5NhkO2StEk7RPg==
X-Gm-Gg: AfdE7cmoVuvK2pG463bTq+cSSBJt1TJY2LmMcTard8zOUJt71GKrTshFlTvzm3s4do6
	abM3BT//V0NVTo20xX0xEeFivc8ezDWTM50faO5qIo9QW/d9A7eB1EHmqa6pQEyY+YqnYmYP/8y
	E2dwbdwHmkL1GwkXH2lv8bi5k2PeEX+QB60NwQ+o/PG8NrxVm9Xo+oAheR2DWmd95x3z6KWxgpR
	TM+W0XzI/7H1C9LaI+gR1QRiU6JDMtzr24mm0mc3QhQjm2aPIeYh3PaLqsLMVhE2EMHbqn7Pyi4
	yZyRq1NFMgtKL9RZlVmc2LVybBMJ7nOyMIrtmuSISOQacZdoCxKPU2hRYnttoTwMcGS4rZLQIh4
	tGBfE+7tIqVaUpa/9C5WF2oXf
X-Received: by 2002:a05:620a:1b8e:b0:915:9eb1:f08a with SMTP id af79cd13be357-92e6971d04amr911843585a.18.1782934220071;
        Wed, 01 Jul 2026 12:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8e:b0:915:9eb1:f08a with SMTP id af79cd13be357-92e6971d04amr911834185a.18.1782934219296;
        Wed, 01 Jul 2026 12:30:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm78261885e9.1.2026.07.01.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:30:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] soundwire: qcom: Fix port handling bugs
Date: Wed,  1 Jul 2026 20:30:04 +0100
Message-ID: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a456acd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=fR8blbD0ELB2GWmyDQ0A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uKcbMiYrf9uRI1SiBWrzZ64e9vJ9B6ja
X-Proofpoint-GUID: uKcbMiYrf9uRI1SiBWrzZ64e9vJ9B6ja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfXyEx7LAE3qt4K
 nig0fHV45vac2kpOqlLV64/NYKzv6/Ou3W2IKYykihY86QJG8goUwuRoAILhPJIyrOVsGF+G4Jm
 ooXH7zPWQsGhaMMWlWeQ67K9IfbUcG9oPWm5HJOelQX2JVR8s/ERfKy4uBi23Fw13uIarYPi20Z
 8VgFWzOgLexfcxQUk9N77mqwx44fuq4SWihWDf7r83CVraoF0vTsqHVjdht9NKihRbIjc3iPZ48
 OY1r6A3WkDPWhaSzzhHGJewO1/2io3aMFEfhd2tRX0VWbzuebuStN5gRd6hplE8u8KP0l3V4OMp
 Stb8CcN2Tx84lx3xha/F21z5vIYoKT8F2/WCHu81YFwgPRTGULfmb6gumICy0ErTAy9UvOZzCoq
 s+eh2N4GJytt/D29Y+MmskGUk3eqg3COpUbaj7BDahOnC60jEkzGTt+ECV3amIjomJu00rjal1a
 lPMDD7UnKrZZZlR7W4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX4aFw0JeX+uL5
 pcp580zGhWuX01ZbIsWIfbeBVXrtSuBbMX2ln6HAxy3idqSpES7R2324Vn7oeU2eTCfgTVk9IHM
 wotDkPiUVGMSx/TnVxAIS+R7xxB2/dA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010208

This series fixes two bugs in the Qualcomm SoundWire controller driver
spotted by sashiko-bot:

1. An off-by-one in the port exhaustion check: find_first_zero_bit()
   returns the size argument (not size+1) when no free bit is found, so
   the existing `pn > maxport` guard is never true.  The driver would
   silently assign an out-of-range port instead of returning -EBUSY.

2. The sruntime[] array was sized by a hardcoded SWRM_MAX_DAIS constant
   (0xF = 15), while the actual port count comes from hardware and can
   exceed that with controllers supporting up to 17 ports.  Switch to a
   dynamic allocation at probe time so the limit tracks the hardware
   automatically.

Srinivas Kandagatla (2):
  soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
  soundwire: qcom: Allocate sruntime array dynamically

 drivers/soundwire/qcom.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.53.0

