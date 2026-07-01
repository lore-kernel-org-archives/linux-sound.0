Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290693DBD57
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934224; cv=none; b=h+evLwjm+E1Y6I6JVnHHiISFF5y1hy/ceRgBCDfZl73vIKr69b4TMl6IzktWGOko0YLJGKPNhCvG5EmCrKfpLJ/15RYNtLqaDdAKI+lskEnGs7DSaXEsTNO4hE7vmpzrCU0A+xbsDYWaU+QKTTAAcuKNQcEKUxYMS0jPdu2m0e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934224; c=relaxed/simple;
	bh=MYPoYRF0x1RELKNLtMu5ZwrPH+l0mMKrWn8KMLIpN2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7No4swh0MSdnKsurL15Cauy+lzeywLynJ8YzHBS36s4RipNp/mmwLDHdyxDUVj1om+dzngcwP9KwcmST1qUAtXFIW9iCTBkF2CjEb+6jscef9e4JqjqozQzlOKEwCnd4zHpWtfK6g8IdRwkMlGdFM1m6ZI03pxu0K+mxpnb6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCQxhiih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buA5rVAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCQxhiih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buA5rVAf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmibY1730720
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 19:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rnPd10WcdOH
	mEsRs91BWIgfBdXahim2EReLYaWIIX84=; b=RCQxhiihEw7iLyfyd+aKp8a75ge
	XYHeicJF2I3IBzh+wi5xH6597HOtoMeKDcO74pCUIFShezvLKpmLY0xQlpN7A6PF
	R+gLQFqInT/Lr9eRWmzBjXvVf029PiZ5cT8NSXAZHYovWrk8FZSqPcoUtsVC/p9O
	8inaehoFIlT9bL1ciFF35LxsGxUwb7HyMX0xRoWYI059cd7IAfMZ1KlgpMxHalH+
	F/3F9BnpIjRBAJSRIPjNgBmAK/cbRCimXRiVyyX9hPr0XTG+/1+WFXXQp11nPIlh
	q7MZu88eHWFCLrE9LTQv9uDZMIjX2OpayUZ0lH4JWvM3ciqGS4JMFBd5M3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ajaev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 19:30:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e632390d2so205988685a.3
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934221; x=1783539021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnPd10WcdOHmEsRs91BWIgfBdXahim2EReLYaWIIX84=;
        b=buA5rVAfepzJ9DxQkRfLH6dI+WDw+GPfhtEF3efEqBYMDrGCmlxViP1ruYyPtoPGUF
         YhBjdSVFis4bD9JsrcewBldiqhnzCCuffbjIa2xhKaBkjEFzinlTRKX/dLfQnHXakzsA
         nq5uV1uCOWLhB55Y/s9l1s+NgJN79ACDDmLkHQHZnI3cQJDzhP9oFMesAbqDIaOXvmzR
         hwIYYNrw5Ox5OtizzIuPyVY0NJl/GW08wS2rQtieWNTFSInUKOiEcmo5/b0m4mr8PlqM
         QGUNFJtC3FriJhjOt5sRRx3R7OYhSr0qb+fDJYRRa0kZahI2zxx7JZH6Rc8V38ywnuDZ
         LOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934221; x=1783539021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnPd10WcdOHmEsRs91BWIgfBdXahim2EReLYaWIIX84=;
        b=NnQa6m2kXiNg33/G+yqfiU7Est/qFMqBwoEv1107YzsyS0T+m5bn3iDvGe3pXEdmOy
         T2/RQL0OFXJM5h5o+L5o3PmCCJv9KOs4EUSR1x3bbXg3XUx8CvbRjyYQGvKXaqHzHlj6
         ZdNiBJFH9Sz9dcTD/aDlrvbPrRVsYPsAKg8PyWlv73cyJ4bdgW2GxL3XTJMmg4ut8Jdw
         G6jwGs3VrX5aHQrASsnoLdkwriucMSfxoDmriZruF2nlkNyJ7r7vo3Im0YYPVDkwoDAB
         nVT7CjIZAq7dUIfIyMQhkVQoel/VBhI2n8xMeV0tmLV/izsp5No0FMEkwG/7IGJAoXbu
         no/g==
X-Forwarded-Encrypted: i=1; AFNElJ90c6gfl7cyRbx6jjYmH9za/p7Nq3rut3xyp3jrVpw4al/fSvvQT+fT5INnHV38eW5/r0xaXM4znGSCeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKGPJfYQYTDyAnqq8YPE6alFZTy1lrah/dB30UXwSCm5V6ev2
	d8mStFl4fg2P8ppTPpvoqR+qwA6elcT6bn5wmZbFWcRaQqTJeSFYEHesVi8sHnvoLnk68Mgh8lS
	J1i0ndUREClOq+PUYEBU6CKzpXDF3hURVyOyL6MDCBHfF/bm40HwamPsVHEDPK4Dc5Q==
X-Gm-Gg: AfdE7cnaDjDzmuB1cpzeKYhlFbg/f60kDEEDGW9QXh3pYxzRHrlRO/J5TlKYkPvOh0V
	hM51Am73CVgmm4M58T0Z6DI9ZZXP3MR4ZkwOHXESjxtOburHG9dd0psog3PedQlvNrttWmDI14f
	DiFiVUCdgvL7RqMN0eX6devmHu4w/K0Yfod4xt1JfiBO7J2dM5o1E2Umd9FAixxofIzQ3xQt/pJ
	69NnXXZ/AF0xMuUKk433p6EQ3lkMGmLquIwV5+ITPAfO8XQUcbKg57eAn87JC0JZZYE3wLRwLoi
	IzCTuPsWTrgMHdNT1h4hw0FRuRGmZ1icPE5RQ+8m15TUSOBjZWghreT+PIF/WUefeR89SbkeZwV
	JE3rXN8Ax/aPtjg4RhVHLTIRA
X-Received: by 2002:a05:620a:1794:b0:92a:3679:7978 with SMTP id af79cd13be357-92e7afd903amr344423485a.18.1782934221268;
        Wed, 01 Jul 2026 12:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1794:b0:92a:3679:7978 with SMTP id af79cd13be357-92e7afd903amr344415585a.18.1782934220725;
        Wed, 01 Jul 2026 12:30:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm78261885e9.1.2026.07.01.12.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:30:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
Date: Wed,  1 Jul 2026 20:30:05 +0100
Message-ID: <20260701193006.4113-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n3Rs_EhJHabrB1a48fjAv9q07jhnVf5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX6c+zAJl1eRGG
 ZRgPpR4Xwtj3oSOhp+U8obU9cm6BVSD472deGx45bZwLOV8wSvqiwSz4y6kzakVYCNzH1gvkccz
 Gr/kzqq21EBJ3eV6ArX96K5AJqOtMxpsag92L9MKoGQoLZWAnga/PFaC2hsqtW3WecoQBS6FYeJ
 yn0SBRXKpwaTuwN8m3hPAcoiP/SQtWUkaWTwsThCgh1PMDiKobUJIDGIUAwMuL5/YKLf8Z6adaz
 XxgbcQirtnAVuZEKl9PPsCaxGPzU+BTQoFoC7bHs3VRK4Cr927jETbLJuEsX4lmqsCsyqw+pXgl
 8P8h5CQxfgKbiu1QMyeqZK0maP2rbsuz3J9QkYko7JuhjjiD++1vGWY/oLUPJabwY7qPP6sHOFL
 Sb3t2nO0RJdUBfxSjhtJdxifwwb4w2RONxu4g0R2F/d2zYKCu9RyLuOUZTMfAs5hFSP29YHkxjb
 oAW9odKJrPYh3mnjpkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX8a1PWnzcj/IC
 P9c7L3EKdWmJ70MLx3yDgX+PCHwDREsIxx8mX5eXjsrJihJ4JE+bQeRrJ+IJjeEmUAmjGtl1tZh
 gyyBN1+OURTPNK6ZbSYW/FB/8wjPrnU=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a456ace cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8nePQdK_g4Z6DuqQSbIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: n3Rs_EhJHabrB1a48fjAv9q07jhnVf5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010208

find_first_zero_bit(mask, n) returns n (not n+1) when all bits are set,
so the guard `pn > maxport` is never true on exhaustion.  The driver
would silently call set_bit(maxport, port_mask) and assign the
out-of-range port instead of returning -EBUSY.  Fix the comparison to
`pn >= maxport`.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81eff1..b288218f64b4 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1271,7 +1271,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				else
 					pn = find_first_zero_bit(port_mask, maxport);
 
-				if (pn > maxport) {
+				if (pn >= maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					return -EBUSY;
 				}
-- 
2.53.0

