Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D883CEB92
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104187; cv=none; b=MunTC8Xl5ett9vWz7EmZUXulXQRFqYQ7S7LFI77+jef+qM2B9NSyYyjP2IzFXWjWGqhjO/YgH0k4LOLYtwD7XBUnDJyUKhWmeJzUCfOx5vhGCeKxv64WVNADMWL/6CdhE319WWQXG37BaIrngjmIRRQHjYCocQIVv0hCJ58xfrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104187; c=relaxed/simple;
	bh=l8D8RAjAOSgTjmig+yQnVyxj5I15TERYWKnxGCFXsw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LEMoUgwuCHk6Uf7yU2XCkSY8lAk9H6OprcOOTOdgXE7BvCvtnIoDYeCkW/z25HnLkH8BEOLc+ckNaGi0pYJG5QzyzRSPvyj6E9fJ4oEZos5prsshX5ag9e9jCUb6j+fI8c/DX4RoXRFgmubfRA2wXx9W/hHTSdUoAGCEowx46n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPipA1AK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgVPI1+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPipA1AK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgVPI1+j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hXrr2796465
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/ebKc9zjlknrJwTiFqOlzN
	Oehqv8iPiumObNh+c2x5M=; b=MPipA1AKJB5pq+/cCfRzZdS6a3JYRMziH1OfCr
	cb0i1fHqb0dtFOHY0QIqQSDUNtl9jkhJA3x+VHpfoO6imhs2ZrVX8+tJE2EZmBpo
	tktk4aDNf7vV6A/4Sc4QYcZCD/0DuJzOdj8neQhF/WQrjfPKKjAwm28hxlP71Z9s
	1r5LRACcex+Rfo6WXAq0TQTzX9FN7WiiQOjYZfazeogRi0xrn9BAXsfo9jROmJVV
	b5geB9RkzZFG8msHZXFfW+hmNbfSlJNLLrBIIxQwxw78iFMHKJi2O5EfdArd4DDs
	G/RyBsEXgMVimQZ/pEYUmjkYtkoHiZbR8ZrfNH23D+S5SZWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h8d29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:29:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so30714515ad.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784104180; x=1784708980; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ebKc9zjlknrJwTiFqOlzNOehqv8iPiumObNh+c2x5M=;
        b=fgVPI1+jeYLbDPKcyf2ZnxMIsl9oKWL9IEW23Hg3gfBVUxeh+BZqyL3pANLbxKIoMH
         t6Uo/SzRbmFKITFvsJz0iTSH+T2iHu4YqD0N7sH54kbbWU8W5wlcDlfM7sxB2GOx/woO
         5bUrQp8W6o5IyCurSJGcAA6PMNyCVlM/JIvEJ6p53fH7qD2xBMY14oEEQUeV18rOxaAK
         GHtaprOwp860MwJ6qi7zM76BdgT9ffEeEc0hwqQ3C0dpJ4huLBZ0D9x0DUtsXPXoiOCy
         hnRA9xEV6M5NuIf7w/WE2fSDdSqzNJRklD1T66bHE2eW2XB64CawOZAWu8cR73ysj5G9
         WftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104180; x=1784708980;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ebKc9zjlknrJwTiFqOlzNOehqv8iPiumObNh+c2x5M=;
        b=ALQrDyfVaPMkfT4NoDuikJoO4dDKixrs1yYcGz4LBhGZg4zK73ymuLicgB8tU0/bAm
         v2lhhv86qLSpVqg6V+WzpdIynTq23IqShLcG5m+GFCEp2KZoKup0x+38LWy4NS/vVn0J
         Q2Qf639Gs8RguNWgQGDmwTDvEUq+eDQFzyVjdXqANZAZobb9lT+7n826nXyP31JmHfqo
         HxCH4r/Vc0PLRw4N7jGSTq/wzS71929vqkmhe/UwBPqjXr/dZ6dthQLhTnbTX6K8dRmN
         FPoaiw5Ss19hkksS1Ws8ZnnH9J3HnM1lgayYBE0mtOB2gl4BtoHrZcuVisdMan3YfMD+
         TxNQ==
X-Gm-Message-State: AOJu0YwFBb1nGMl6Di8VouMPI4I+Eyw5zl3TwRjCjg3gB2pPledWlHqL
	FWZqqEGrnevrnQ4fOj9SMa/eIyzANyQFllo/UdralQaFDqNpCA9zdNozdoXvVrn3t3tQGpxOhVg
	gL8wfMrmUeX4nlLMSYPFprp/SdRDIJg30/PD3wySSgZYjygBbsvBRlGlqZfBOWjrOOg==
X-Gm-Gg: AfdE7cl5Q5R3qlZ22OIbXBC2QQe2usjoyZR4k631n8K6ceuUU3xs9xgHUXK5mhoKJwu
	yLvKWGrgv027YqhxPwcSbZP/pHAWxwJYe48nAb7o4mS6CLVLbf+KsMBZ9HLawbSJglEKZN4ehnb
	NOdexTn94m7vI//gCpaI09jOkMPOOc/cBzJNg1VN8PxYnim+/JCwDG8o6FUCxKK6xpCw+Bwkk36
	zA39EIlUD3mT9IwjKzXfe3d5zXJrCKZsrMSpVdN+GHYli2sXMw9wdnPn8O7HPmHQ9G9H53gYkj5
	QMt0xMfRbixV1ziEi/blSjvBlc2oSNl8NKzVnrP0yAX3+ZyeWqUd/oI/mgnVLwcpSFizTM3JKUX
	GdQilO7D1Az1Vm2NBShaQ9N517HHtfEjxL62HKKs=
X-Received: by 2002:a17:902:fdac:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2ce82959a57mr187844395ad.22.1784104180096;
        Wed, 15 Jul 2026 01:29:40 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2ce82959a57mr187844145ad.22.1784104179511;
        Wed, 15 Jul 2026 01:29:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb75fsm129260715ad.8.2026.07.15.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:29:39 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: codecs: lpass-{wsa,va}-macro: check
 clk_set_rate() return value
Date: Wed, 15 Jul 2026 13:59:22 +0530
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJEV2oC/yXNwQ6CMAyA4VchPduEEZnRVzEeSlegaphZB5IQ3
 t2px+/y/xuYJBWDS7VBkkVN41TgDhXwSNMgqKEYmrrx9cm1uEa0gByDML6NcCHk5wNNMibKgq7
 3nvzR+bY7Q6m8kvS6/g7X2982d3fh/M3Cvn8AQKQjO4MAAAA=
X-Change-ID: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX6t6WJzpMNQks
 xklTmcPXXMpb64rDa7tbd5m/hw2ZzxtYn20wpDh5pVY0xyG//OBJaf9Y5mUujR1BYEGjteCowlN
 cnAHXWLpYxFdFn/E7fB0K3TZCZNIsgs=
X-Proofpoint-ORIG-GUID: PhjdS5j9shZ96X9ac7_PB1VuAXMCNv6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfXwNJ6FyLTw7GU
 IYK022CSJVzFPUVerzXgWIsAg/ZQ0LnD+uwEaQuAVXc507kXLQEaP6PoogEF2BeR4wrS5lQmyXO
 G2kXFenwnvo+lJ3z99FrZ4A/+3ZFIlLlYbHLM76cQ6SJ3NvCrYGow5q4p13/Uqu6TyW28C9zXZW
 0YzDg0bi7+V5M8oX/zJcGgKDf2Ql20rLng3be4vmZilJzLT8j5QTvJGTrmeyQeQGT/R8vgBqD8h
 AAj+vIgA4seFVJVAa/sIfHYYlJIzRa8fkt92Fu1EgngKygejBMPU95MWT34WT/fzqu+izTyM+7q
 0MrTeQgkADqI9v8LvHqdgqguy9nMne6yjeCGfsKihAGMVccDr4pcT0m8dshmVRfwejldBQ5suEG
 M60j/9BIbBf76u1JRvMVl8ltInsRmVAuku8vZ303O+N8IfUgSeFmugxnA+KcJOS9BwwJtKaPgKk
 CtN8U4xEwHfkiuoYWxQ==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a5744f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z4yzVyvRmzhIkooYk6kA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: PhjdS5j9shZ96X9ac7_PB1VuAXMCNv6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150080

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA and VA macro probe functions were ignoring it. This series adds
return value checking and bails out of probe on failure.

This mirrors the same fix already posted for the TX and RX macros [1].

[1] https://lore.kernel.org/all/20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com/

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (2):
      ASoC: codecs: lpass-wsa-macro: check clk_set_rate() return value
      ASoC: codecs: lpass-va-macro: check clk_set_rate() return value

 sound/soc/codecs/lpass-va-macro.c  | 8 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

