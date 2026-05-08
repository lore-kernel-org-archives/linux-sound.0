Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE030F95F
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240121; cv=none; b=qwa14KFPrBryZBnEc71LPYTAz/r+oDPUviPgJCExs/2cZOSLFt6D5uTrmsZGXxRRPce0jhMZeWzVQ7/I2Il8HPWB/YmDEoonKbYGTvu2mN8Ej1TvJeGsPcBVOxnHUvnnnpl1RuocdLkYFDV6txY59jwgz653zSdHP9fqlhn1eEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240121; c=relaxed/simple;
	bh=jKEViRlBVDcXO/+pJjAbxj0Cx9RvUSo/rDsw1uWkgXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i3pvafFJdKn0L81Jrm/J5VM1DZmihmvlRheZYwXwjNuVWlublKnP+J2behvGpc+idhgNLybThL/j8iG0ItbVcuOW3oVkDva3LgW8k6zC7CvDHYyRkmQCTukx0tYiISGa1oJBKTIO/rGNfCTqyz+YmlrzDX+5rCUdmSr05RO7wPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4rVdddZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/nQCF5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4rVdddZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/nQCF5q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AG3jk2771001
	for <linux-sound@vger.kernel.org>; Fri, 8 May 2026 11:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JM+qNnuaOX5MkM8J1WAEVwH/p83LvDIlMva
	UboBFk+8=; b=j4rVdddZKrZ6MOdr0pdI/u+/sCQk+S1kZoKXi1zdfXq8A4PRqKh
	0H+ayn/gZqn3/gI70uxpI57aFiH50mX8mO7lOiJUish7m7IN9bzyZEnIUhxxIHG9
	f260mFputdg8pC9sZ/E5T6662ERi+LktB25DpdJrp3meCQ8v/Tp2czzhZ8ccg1OU
	ou0mFD52AnZNL8WcLJ7fLYTyXAvgRXDBRjhLUp59AxW7oY1SkdquVk4Hh5pJQBXP
	cG8BHRMYB9SCvvnL+zgC2xjcgww1nI/NNwUD7McgWS4krpKvQPcnLDcK3yGrXA6o
	u8a5iwMg8jmpqcIAVZJrhgXO+A+V+tfeGow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kg94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 11:35:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba15e384c7so6070315ad.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 04:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240118; x=1778844918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JM+qNnuaOX5MkM8J1WAEVwH/p83LvDIlMvaUboBFk+8=;
        b=a/nQCF5qR5Mb2TXqPKIhDnzC7bIWLdEBh/cuoMuDcCAxblm4UrPkoDVdUTiwKRec5A
         7rzuSo5eD9Bm5ovao1tTprYlqA/4I8vbD/7ca+yDiG/tR/f/TGnXsneSjIujqbPWdVyI
         PHqi0FqpOZ3wMZnAk8GUP5QHw4saDGTmmROGzifaM9mIZX1KP30Yy2FS59NWhSm4/GZc
         hEOJn/F+pglxViTTQ7iSN20CWbrl2Ft8simAsOh9dYpX/QasOXt40EE9S8Cd0zi9RDoQ
         r7w2pCKK7weV+qR9+hTP8GVzhX3iw/KyEd7J5os6ONCnX8qYg6/h3+E6s9RInGI3uF4b
         Wvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240118; x=1778844918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM+qNnuaOX5MkM8J1WAEVwH/p83LvDIlMvaUboBFk+8=;
        b=F/MmqA6YSqvmhiM+eLtht0Q2B+PHlbxFQVKEmxTX48e3v8+7gXGYepJodr+2/BTI48
         JqlZAAUcm1+/jHCirng74ee5DYjBs9nc10zVGlj/4bzEojBH2kwOLPGGglVgXYz5Craj
         q0m+3WUzfatnjwTp/trjaJAUvCv6sstMADoZo0ytDvPS/HoYbaxF0GqrVCAGhgjUCQNU
         NUvcHoceFVo/a0O6rfO7AQIqxo5JfPo3re+0Iviy37qklZU1mJPMAgssOzQLXx8zjXEC
         gtj3/uL6oxiBAEQ53dUzZ/Cek/gQFEP1rs+UlEXo7zi362VoZAYKhjVh+Ii7MDZ2AYOy
         bi6Q==
X-Forwarded-Encrypted: i=1; AFNElJ87XAu8l3Y0NDeTLyMXw3wRB7Ca7NQBe9dHKrWbPfBaEfbw9Yj1IJ4nL9VneyUjuSgd7saN0c6H2GvqOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqr3cIbQ1lJfp4FVb2P2R2Amt7wKzoozH6vurnYlEGrqVoTmG3
	dHidZB7xUEByLILkAloe3TA5THu2z2/BoRZXzViGzurHQNfal25hm7WSb7u14tFvqiP+UJPnz+P
	TJzoMTSq67i/ovVZpL184DX+gkdS6WCoh5+/YXCWK6J3K81QwdoRwxrb61bo07C+iag==
X-Gm-Gg: Acq92OG51D9yQIe6EHSFTR6dzKcb0MD/0l1ONHBbTVGNZp4j6SUV3Hs2Hyx34CyWAV/
	6KSvkgUQ+E2j7McwgXn7hMZhszj47Tx/c60riUxAQqE3EyKfGsRNg+n1r9K89SonRpzXZsxOI56
	0cl6ShYbBseXIcZ3iOrzv050O7o6KbRRSvzYkvnsUmQ1u5lDt7LwS7PpL0W6xuA9VuDB4ucCyf0
	v9mX0cXy37rHyNwH42cbS89KmQGmU1X1i4aa+RsouiJJ7BziEXjhMuwbaDPk7JAjYa5rES8aQDS
	DWVILMep+AF0WhnBWarXk1ag7jkLR6SBi5ed4UZ4zSAMWw+3hMf4dDi6TNbKCu0RrV3KadAX1dj
	jXgZEHpgk/XfmGQWqcuCtJR5B7PTqxBGN0HOKAZU6e2CL128Hfw==
X-Received: by 2002:a17:903:98b:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2ba839e1af7mr125659655ad.27.1778240118383;
        Fri, 08 May 2026 04:35:18 -0700 (PDT)
X-Received: by 2002:a17:903:98b:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2ba839e1af7mr125659195ad.27.1778240117872;
        Fri, 08 May 2026 04:35:17 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm26616005ad.36.2026.05.08.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:35:17 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Fri,  8 May 2026 17:05:00 +0530
Message-Id: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdca77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iZtHHlB3kCPTry1w4UcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ivyFFoP7Zqs7hWag4OSJ4KmGXdvz5Dhm
X-Proofpoint-ORIG-GUID: ivyFFoP7Zqs7hWag4OSJ4KmGXdvz5Dhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOSBTYWx0ZWRfXzEeWSKwJ3bcf
 BP2u185L7qUqFeDJo8YGis8gkMUrikTptOXbdEFLWaQI2eIJY5MJNFHYZ071ep2YX3PDkAGuzFD
 rToUInCSZPkUV1bHszw57qp0WAh6Lv8nW0pE3g8qao098AR+NA/pJ8Zg4egCVGiubOcctRIYyWc
 NoFpqXt2qitCWnguO8lwzv4CcKeGZMTr57Oz5JgT+Nnz3tqX1v7VAhTpqLCfYRbWvCtFzHGoqp6
 M//v3jL8Ppj2gh0iK7GEzAGO2r/83zCuSgjUSVGQ9K1eO3UJpdPwP00VjNQNHS8iJYRrSFjbkQb
 3VbgnSMIcidePgraiudBBjLl967x9HlfXXy8TzJW1oxKgy1+HAjqbgAbshNaFu7EwrwPknn1pez
 GRuGxX9DD9i14S2VCoF2IBhSdxMxaX8rDUYHAhIa1V6hYhZZhf8zDwciHVi+RCujBvU34AI9ClJ
 czilyXb80AQ2v9vk7rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080119

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v2: https://lore.kernel.org/all/20260420122843.327171-1-ajay.nandam@oss.qualcomm.com/
v1: https://lore.kernel.org/r/20260413121824.375473-1-ajay.nandam@oss.qualcomm.com

Changes since v2:
- VA: drop redundant put in pm_runtime_resume_and_get() error path
  (per review)
- VA: switch fsgen error unwind to pm_runtime_put_sync_suspend() after
  successful runtime resume
- VA: fix probe runtime PM unwind labels so pm_runtime_disable() is only
  hit after pm_runtime_enable()
- Rebased on latest linux-next

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/lpass-va-macro.c  | 121 ++++++++++++++---------------
 sound/soc/codecs/lpass-wsa-macro.c | 113 +++++++++------------------
 2 files changed, 94 insertions(+), 140 deletions(-)

-- 
2.34.1
