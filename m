Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D11310785
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773864; cv=none; b=X29WuVAZO8vhQEQ6m/gHVo8izta0OtGs9PQJdke8MbBf44aHuZgs2N9AdVsqkHuklTgKOmVO+9sm78/6Q8zt9dizKoeFVatkRJdWly4udbvVxXCOlTbCQbVrVdHDwWqzXq5r5NE+Bpg/Ti1Vs8ASuHdW9me6CRTZe0Eyf+fZVps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773864; c=relaxed/simple;
	bh=fRJ2Fev4fjEht897lEm/0Hbw3BqK0zB9DFzNm0cCzmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYNEaSwj9oael8xffhC1iDYR5XQwDXVDI1uLq870f1OpMAX8usNJcg6FDKHrNtxfsR5slejJPZp8VE38YGq8KOEQcAsQwifrcypF800TGIWW5tEEf4WidwoGvk78semTbZL+Erq5g+FxcaZ8mlqcdhGy1wkxgKLBpGHlDUS8fhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNzKZ0SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgqhVL/w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNzKZ0SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgqhVL/w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRoZ3890937
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JaM+TEwHtLfC7f5MRaUoz5B2nc6Vq24PRov
	VUO5ViaM=; b=UNzKZ0SBnwOr8y6A2EYVtqGqXeujCGwhwJAIvS8akYiPjn64bFk
	KJvh/xUB7238qJAwBe0wweihJe7nSpH0YYKbX6Ci6eYNF3kAI+C++o0jgd1S59VF
	kXRSo2KYJAzmidnt8eYOv0uiwo99b/Z/GXzLba8g2gc4HEPasLnxiVoevL2mPDSO
	W/FTEoy5a6W1cEnl8XOhDQ+oxv1CvzF5FWYmFO7GJdgjTPfzYD4jMOgvb/zVwkp9
	Ovft0HY6EjP31oPHl8f/0kI+ivHrENiizYMgABrU6QjRGPyRCDmKJ86rtumfVEMs
	ob35aQlu0h37hd+rQUGrsf0u4YLDZZTZ7TQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tvr3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:50:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95f7fcf4f37so4272980241.3
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773858; x=1779378658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JaM+TEwHtLfC7f5MRaUoz5B2nc6Vq24PRovVUO5ViaM=;
        b=CgqhVL/w99SunYZ7bm9TUb0Y1ei3VdlNHuh6cOz0htk4M//yit7PT38FMAwPXxCOCM
         dABO0qNMSO5HESN/VGof34hLTcTkWqEeXE8fvj6O/6OvrZo2QKTFbvM62kzMwgeQDjvC
         8nSPH6IK65SkeN5GmExSFGbQ6Pq1GhEaMoiDZgLR/pue+My+uWp1TkBL6OkvAPzUuFK+
         S9K5Hq+/4+gUsS8z6DcNuj1+RwyANjv/B2E6jitASp+viFSwq70lkB3tNk/sQaHev/gC
         f1cDo9tTlF1DKkDzsQ/3wNFo/2SYOC61OTRt60rspToUcodNTQrbGNqk3fYoCqV+njWA
         U8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773858; x=1779378658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaM+TEwHtLfC7f5MRaUoz5B2nc6Vq24PRovVUO5ViaM=;
        b=OfozeUP9GULpbHy/Q6qZq3xwZsLqKhivhswCol4ukL+CFlJDldt/8pUU0+uk4CPpJ2
         zK6oMtA+xrR+jndHoGlDLnsCMLTZSXusa5WdSxoCbL7n/kp9B7rtLNOPiHMWvUz2VX4E
         W7otVdZR3EHT9Jg2sIJ9uHmWm4mW66T0t97p3O/D+4UKPwQugsNSNkm7hG2pNVdodptC
         s3lIQPwFTSKIz016i7BPMcQdvcQT0l0+XUZv1hw8AOg3yJj4ycJUEDuMXiHZBkw8rsrP
         DPEV141u1PU8/8AxwTT3es2VYzmUSNWHL6cL3aq3iMHEOsr3wDH/r9BwXGEHgVp+aMYS
         mJUw==
X-Forwarded-Encrypted: i=1; AFNElJ/+aavVjeqeie80clLkgG420Lzi2S6jkzFHSdtGCTDfiFttFDDDUnuTA1bNKGCBy7HOsTLPivYfli4gdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBHtjJBins35PPkfPiU3lJ5+AOboZI9f9UBwr1Fc4lJm/saGR
	RGmQyT2GeZJZWVT83Hqvktxq/olSlowcGvmXS7yzo+nS0uQ/U78wRDzBFWXeRGhwdLGz9zxFgyG
	wqJ8Kv9eMzBR/1mViki8ajfBS1dPQ65jsiE5OO4GV89QVbUvvv0bFH60J99k+dpZ1nA==
X-Gm-Gg: Acq92OGeiqO/sB+bRwLXAuUSjhao9n6PI38MIMa06vj7XS6e8/NNXJ9IdobtLAvuKjP
	IIVPjRT6o5sZzO8l1mSRFOzPwnjYO4WGxCWoAqLuj4lM6l5EoammjJjsD0yWp+vU9j6TsEoI/Tw
	tGvuIkwLoZWjz1077HVl3VTrJCKO9WXOIoJq12r0t/Bs9+2em/JuTJmjZfYW/j0BchgM/JEvK2l
	oz5bAYXD//g5yk7yS2AsHZJeYmMs6OZpVBmkFwJeIiq0QmhsbfdMSKBFF4Xj5NsR6iTSVVHGUZ3
	1/G8jzvRH1E+NTnhDzFVRge5/gWNxm15RzZKFkDOcWNbaVztEjr8Dy9DYq+7aarSm4k1BjlRvmc
	CITHHijllzlwcUfkdAyi4+roRzvY9DMTJWVbnqihE6c0Agmy5UV8me1Y=
X-Received: by 2002:a05:6102:3e0b:b0:637:ad7:f57 with SMTP id ada2fe7eead31-637aaa5a6f5mr4188397137.25.1778773858147;
        Thu, 14 May 2026 08:50:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:637:ad7:f57 with SMTP id ada2fe7eead31-637aaa5a6f5mr4188381137.25.1778773857763;
        Thu, 14 May 2026 08:50:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:50:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: apr: improve RX processing
Date: Thu, 14 May 2026 15:50:48 +0000
Message-ID: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05ef63 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=1WW9EnxB1D7kN0UGs5oA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfX6A6LK7OMp12B
 xj9FLQ2YFnjDeF2mi3f8ljIuAHBSDzTM7Uvng9fvQ7wcNTB5othXe/p7qMqm++7VOtuz/QfaiPS
 w9V48a/8ki6VenbO22pGfWTuVNZs3ybO/S4BFLuxi2oUpGWJ8gOSI3pWkNFDiXlOJWKD1EzrrtD
 hiAizK0zR3fxJZP4P99U5P2/1mE68TuDUaU+F1LVPNbe1MwUWDw7I3wW0n1jJwpU3XjoLQ9J0Eh
 R3sh7n7It5tyVanE2dEI7ggVI4EdmpNfeSYr08cy8xC8wWJ22wjyjyKw9M3+kByvEsoop5hgZEi
 z+MMUuohUBcilqtOlkeq53QpRJtKfr4Sn9P72gFyQSEe7GeS49U90CaB4OPQqrvjC3JXSeoF6wL
 TSyPheQKgtw3SpPZApih+9xCDWkF7PzARO2cDVSmRABrlvUXiZ3TRORcef399y63BGh1yHkJvua
 dEGcKR4wh+zbtaaVLWA==
X-Proofpoint-ORIG-GUID: aw7N9W4np0-HZufwA_wGillTRE5FYAzu
X-Proofpoint-GUID: aw7N9W4np0-HZufwA_wGillTRE5FYAzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140160

Hi all,

This series contains a couple of APR enhancements and a rework of the RX
processing path.

The first two patches makes code more robust for trival issues in the APR core.

Remove stale service entries from the IDR when apr_add_device()
fails before the device is registered.
Validate incoming packet lengths using the header size appropriate
for the active packet router type (APR or GPR).

The final patch moves RX buffering and work items from the packet
router to individual services.

Today all incoming packets are serialized through a single work item and
a global RX queue. If one service callback blocks or takes a long time
to complete, packet processing for all other services is delayed. This
can lead to command timeouts when responses are stuck behind unrelated
work.

With this change, packets are queued and processed on a per-service
basis, preserving message ordering within each service while allowing
unrelated services to make progress independently. Since queued packets
may outlive service removal, a reference count is added to keep the
service object alive until all queued packets have been processed.

The shared APR workqueue is also converted to an unbound reclaim
workqueue so multiple services can process packets in parallel.

Thanks,
Srini

Srinivas Kandagatla (3):
  soc: qcom: apr: Remove service from IDR before registration failure
  soc: qcom: apr: Check response packet length by router type
  soc: qcom: apr: Process RX messages using per-service work items

 drivers/soc/qcom/apr.c       | 283 ++++++++++++++++++++++++-----------
 include/linux/soc/qcom/apr.h |   6 +
 2 files changed, 200 insertions(+), 89 deletions(-)

-- 
2.47.3

