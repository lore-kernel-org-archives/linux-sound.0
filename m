Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7347A0B2
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577323; cv=none; b=uiJRDBKsiYdjzK4Y3qXthkHHA4TqEU6enPg32hGZATxDqH8aXGueRJIO24Lq3W9yY+54Z94veN5/OC/4d8cFjwcT7+KgO6tEY4X+hVYZ5g+Yca88UgyaTVKZjgAkti4y7WFA+Daw9P98TJyq3v7/IvI1Vn9ypYupxwH7nF3IqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577323; c=relaxed/simple;
	bh=vo6xveCTcHb9cNQ3BQYzxEVs0uKejx18eF6seucc+ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FrlQPy9ToD5ULtYclR3rJ9tnr9V3sSpkhtSSmcgXY7h+z8VNRDMgOIFBVbHMeN9nxtWz8g7Jdt8j1XWMRjFUqkfzlNXW1mKWnrcbAHyVS2+ijhqjZD5H+BCvd6qaVEHgoWiDtvKGayFD4fNuWAg4slyAuP272msOgAHvvQfF29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtjFN2z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jyg+mDtg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtjFN2z3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jyg+mDtg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546usF42477913
	for <linux-sound@vger.kernel.org>; Thu, 4 Jun 2026 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9
	jekdVq8k=; b=QtjFN2z3QBhXzX8H7V8vV4PDXPH5D4lgXMpEoJ8/t41vHmPcdYc
	0mkHVtFzSQxRPSx7Ipb2NVU88Y8HMLT7uMQlqMHW5dXDrplOgj/9fqXR1G5gJB9b
	6CHZoM4gS/s4dLvRAxmm24XDwDuRAan1vcEHx9uy8n/bhRogm2XbJB0nWEuqXbJO
	rnHb+yKcieohQ7lQPofZrh8zhEQAQPAPimekPQ0eKVl183sZ0qlUq6aK0gHifGwh
	6PzZwB+RA6sf10j5dOsQPWyBYSbYVjfkNDchsODEFkSl28iGCQmZBMhsgTqtsqn/
	Xb789wGFW5d6XjSLjKIcZB84O1plxmiJ6Jw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvha63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 12:48:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so431430a12.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577320; x=1781182120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=Jyg+mDtgSAOxphZTZvFU5afD5thhFT/HIBSVfIGMRAtSfu7xZMO10cPmxmqunhgw7R
         DGZpmVBB8Ow538bReb71P4KiM9vxp9bdwhH9UERDtAWhSR4jRq5rwKrMbRq+EjMe3tFE
         wI7xQCJ5VZr5gaxS0i4sMTw4NwZoLeLAqSOuqzRfETAZ3FGvF+DUed/5CLJkNXUArAZi
         P6vEEqyJNVwd65aNc9HO1cskvmqFuRRGWJ2wLRs167BIHz7/TDrL1EL8qlVTQkoVCR3Z
         YksC2IFAT3rG5TKAo02g6Mszn+btx23AiGUN7HvIb0KaGfUjndPqiF2o7sVA8WkQ7hot
         UdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577320; x=1781182120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=BrGiTJdFuYyEMJd0m9IEI0z/Xev0Go8MAwj9oJrcPa7UsfnPrdc6R+5Tw7HveuGRZw
         VsT8ow49TVIgkwQ+7CIQH82CPmDsBH2ckQZXHC/9TA3NjEM+/kNctTtQr7mKhiVjAWiq
         k/WALbzTLUFIwuC+BrE/WMZvBn/XtwJZ43fiSDLv7ofhz+DUO6tJScNTAvLBKMc5dpUN
         XlCfrvrTWu+roh7XFDrCqMjg+DCSj10HxK1X8howdNYaK9j+YiRyKGn8tP1pXuMRWjPk
         0BP7N6bQFFtkeYFZVW7E6tfB1neA/eoun1dp1Kn145v0Z/1GX35CssG8qxxPGvDYNMeL
         iY1g==
X-Gm-Message-State: AOJu0YyrFBbwoHZNnQ1du6BqEmZYhFZaGamGokXEYJA1PJdVk8pC2GvQ
	+chaShVkAAvGLlJAEDJv451LHayX2mghwX7qWZwxdD8pJm/DrtNo99p+t1Y0z60gw6+496bi0tg
	xbYWOZb2BOQ4pept+6kGZrKp+DrwJje/4BVafL1WhwPjBkMXBbr7fBB8T2qn8PSaWbQ==
X-Gm-Gg: Acq92OFH1sBCfY4gRXmi4cFUijXZH2fHoGh8X5im6hxN+4HLBMwTRnwfw3yixBR6eT7
	/G/7rPsVmFSmfflhkENs7pulLQ0lChKq00jbryXCHmT81/1zASVmGWnz96od2ggXTghuc8SeH8E
	Bv2g+hZRK8c+CMmAPIaVaSCaOlhzaxASCfU8WxFtUJ+v3qEetHi3UHiIIIZk+O1XzBfTVaKpY4J
	anecoNs9hxbvCF+qpitKj1VXQ7JZrvvsrrGUKDEXfB8Qgzm7b3exSiQjqfMyskEtkKrtsEM/AXI
	Zu1JFGgd5TMzzVRhhwPebr2AVzw+fGM0cSrDBfjDe/s88MSG6r43KZ4z4SFB/44uAGt9kx6q7i2
	q68/GGxBjX1sQyy7lL4Hq9XckaNOUBLVno+2ZtJxh4Tpzx8g+sbimDljlEZcY
X-Received: by 2002:a05:6a21:600e:b0:3b4:7163:a7e8 with SMTP id adf61e73a8af0-3b49732f26dmr8783437637.10.1780577320229;
        Thu, 04 Jun 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:600e:b0:3b4:7163:a7e8 with SMTP id adf61e73a8af0-3b49732f26dmr8783405637.10.1780577319761;
        Thu, 04 Jun 2026 05:48:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:39 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Thu,  4 Jun 2026 18:18:20 +0530
Message-Id: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D2KU9cre4HsxzKZHmk_ze2HEx0d0Tq3A
X-Proofpoint-ORIG-GUID: D2KU9cre4HsxzKZHmk_ze2HEx0d0Tq3A
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a217428 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JpAD5C703kRQSb3sVZkA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX8xfwf6xbuNlk
 BKCoNraUJwHpfpiN7C/66T/be+Ed0PM6m5ZXvhJRBYCTjAQUrIyh8QggPkA5EKDXtDuF8ly9ykz
 r3rwC/t9UdWTXjhOl2WbJz+1H4ZBQkgTKJ/NNZB7cRqsKYb897qs6SB2kwS5Hoqxwx43sQEIPCb
 Hd20wo1J9Oo/UAqG3LeJPyp/wXDTD7OfpBLE+sKgCc+nZ4E8ru73tidCyHqDqyn6v8ZaBRTKxnR
 jo0u8ljiGT56Hfti713czL/AiOI0T4g6W6RVNsrNI5qwkxjmMBaUaQog9pW5C0YAXxhMMkqoyrr
 JgVaqRuscSgcC/44NBvnm+wl/ckH9w+x03CtOU3njfV7LgOgO1j4PqP70Wj/iRMHMw+XwrjvA6o
 o8cICdBW0JOoPEDcx0zWubKRSzqtzeohh+ZVezA6FtIjVTGjiAurEyqzCoAZu0emfCmFMRrKx+U
 uRPucqqqFn0BXnuSEuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124

Hi,

This series converts LPASS WSA and VA macro codec drivers to the PM clock
framework for runtime PM clock handling, and keeps WSA MCLK-output clock
registration resource-managed.

Changes since v5:
- Rebased to current linux-next/master and regenerated as a standalone
  series that applies cleanly.
- Added `depends on PM_CLK` for `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` since PM clock APIs are used.
- Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
- Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
  patches.

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 142 ++++++++++++++++-------------
 sound/soc/codecs/lpass-wsa-macro.c | 128 +++++++++++---------------
 3 files changed, 134 insertions(+), 138 deletions(-)

-- 
2.34.1
