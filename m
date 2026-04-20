Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD932772E
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688241; cv=none; b=FqumORi0oPwZbnU/krYWjeqCiZ3I67JEdo5j9n+o71wlXfTZ+mIQPHXCKM0gygPPExpdOR04iV74x4yIjjcr9xSNy39rMLma0SQOBF3sG6FbftO0iypNzv6WEcI7mtkYetE5+sZnPJ64rIPUEq4elpe8rZownPc/+gOjB8fSHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688241; c=relaxed/simple;
	bh=Fy380mKYxzNVWyk7M4l3yNtkmqQTJcsOpH73C+EtIA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BvUfRtxQ8A9vti2fHUIGnNSkK5f1CS06IydHzfe7L4j15Jg5bSeEQ8hXJj0IDs9iJWaNYZHgIXvHYqIuRDD9il64RCiZGznTjxwd+/ud8h7aJ/vq99t1HhfM9IhAjJ4s2kkUB63M0E4FACuDSdK6j+6Qqk3hnoeoGGjT5bhq+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCLBUVTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV2WGur2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCLBUVTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV2WGur2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9J3mL785485
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MtRfJbJ3ws5GO8kwn3pm6zcpXmCmpvkcqbG
	+nQI6Vcc=; b=XCLBUVTwn37ChUMdKEpEpHLBsAsN3KWSVWW9Wvni0b4tH3+bKTk
	pS2cSmPpnfbv8wlmJQGEm2QjXI2XN5YRntWm4ioOsS/ccn4wrmLtVdzr4Jd6tAtE
	fB4xFfxT4F2D0eT+DuCSvSZqYLMXbEe6l/ajkngF6HOxdCFfWLQctx2QEbEutGkt
	OC5qC3b3dSm6CGBR78FaBdwZF5LZlu8XTNcp4xQUzC2eh3DiyWDXXXqUHLu2tvdf
	56h3XLdTlWF4g4Wof9MCZp34KXpqmp+IV4JrpsXk+H5Unnm7Qf4SM81pRJPyBR85
	3EPuQT2IFxjQfxMf4y9J0Teovnb8IS8Gj0g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhgm7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:39 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79a670a5fe9so67561857b3.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688238; x=1777293038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtRfJbJ3ws5GO8kwn3pm6zcpXmCmpvkcqbG+nQI6Vcc=;
        b=GV2WGur2fxYJ4ZK3oq25SsBdqsiwXPCMi2ZE5e3cwQwcSp+ZQOHUGz09NsPpYRbO15
         RYGC1j7nRKOH4tPYdyK+oaMhYt/g2HfZJi4CiUTAuMzMu3dtEf9fVwREhxJYXexH7wfd
         bkxDCGmHZ49Obi/8kABn36L3kN0a0P4Rx3FA/Vq5TB2XRXKHSWZB+QAt8VHldHM+OIPv
         elGOLVZFKqUFDeb8KVXef3mi0TaBzFbkW3aO2OQWUOalOuKoLOhmK1D/PcyWgeM82w/j
         /2hNDY6ubkUrsPadSiaRB96vjBfiS/qvT2TkWTThMwDvCZtrI6yaLN9avVuU0Zt6PoUX
         Bc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688238; x=1777293038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtRfJbJ3ws5GO8kwn3pm6zcpXmCmpvkcqbG+nQI6Vcc=;
        b=OpTBKY9FcrmW6tS4OzJ59oMCxLoOkMRlExoNkA0OINaBjqdigbn82kJmMpzUUloe73
         ihnmYyMLrfNnRbz7QtWUdB9aiFSTzrWfGEewT5638li65UwKo6Jx012MhfY8MJldbcTe
         5Cl+9DqT3lWqYxMBSOLWVnglDPOzRiO5V2EhfuXJ9NvAYQL1n3gbac8YhaHqhBwVXtl6
         xXMxCSxpxeunezV04MkND75xdt8NnsT5M9XeL8VdZmkCbuf3dKhkVDGq4mvecthFL+UM
         fbpL+uwZYd4iwhVyFMbAV0jmTJmWAtJHvh5TiwdBNVM1PFoNM08bfBq8zjC6mfCqBlwV
         oJBg==
X-Gm-Message-State: AOJu0Yw23ifNIKd7FNcFNCJ0exvJhQwy11qhb8fcvo19/S3YwXfx3rP3
	0Q44zWk3zucNkp7UaXz22LW77CiGwN+6+C/tQLI2m+3TkBW740L/QKNb+S9OX4QrZghn7TZIqpd
	q9YXXVLfH7opG1wfqk1Wt7PtujI7YQl573S7gx82coVUx/fIGEuSMvdzJnvzC8fR4lQ==
X-Gm-Gg: AeBDiesMR7VJYSBTGn2Z/s2PVTtOf+P1Zw/NKlgqE7qitiW1OG3KxE+2beJUbpNQgz8
	deM2vEj28Xi60NHGgGK3hWoXqEGE+YRxXfdeqw4jn9hEMLJ0Zane48NsY65ZhFxlpIx3GtrTr3F
	4sDkswxGkdSmmdgP+3Gw4z43u4O2SrQDvEIXc9fCZwlsEB3w+1yxZ3565qvc661bi3J64qT57pG
	Px9Z79B+r7B+NAH69QG78eYer7zUpcyHraL57lP/cRkq4inGwpYtporbx+PeGTfGvgCxcnUgKhW
	+/CRCHchX3smDN0DR44kqosMXlHHbKe5uiaXZCebNIo2ahluzTXOj2CSA2vFCbd7vI21bTyFYfX
	d3oj6/sgzSBgFGpJ11pxsJdZAaWV05qyyJ1b84/XcFoSNbfUuHTllGXrQjYaG
X-Received: by 2002:a05:690c:c4e9:b0:7ba:f2f1:86b5 with SMTP id 00721157ae682-7baf2f18fb0mr26400887b3.14.1776688238570;
        Mon, 20 Apr 2026 05:30:38 -0700 (PDT)
X-Received: by 2002:a05:690c:c4e9:b0:7ba:f2f1:86b5 with SMTP id 00721157ae682-7baf2f18fb0mr26400457b3.14.1776688238070;
        Mon, 20 Apr 2026 05:30:38 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:37 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Mon, 20 Apr 2026 17:58:40 +0530
Message-Id: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iEi3al_N3ejw1N8eX8LwFKFpTbyS7Uw2
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e61c6f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gFaWXFso6UKOuMbSp88A:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: iEi3al_N3ejw1N8eX8LwFKFpTbyS7Uw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX38clZvqXLEwE
 O8fTVjwj+SkFr85esrpuPmiQPd+YEW9nXk98WwKmrdZRdd2jHQww6bEs1IkNUS196knAlfRLFFx
 ortTeA6UC83PZKtpYhBrfZMfLppp5mgQN9VRHqQCFrBBY9+dJ0RFHd4y2nd9d/gkfG0pJ43OYQx
 dg4oBx6d9zwuZYRice8MXdVg0JvkpIiB2sfsuB0e7nqxXV/265OQcseBe3ZZqDy7VRWros16p4z
 8iuF2kQNEQgiCwm21iXn4fMbdlpKXcwHRdXNVWuRP3xcADSOwdb8EXzyyDgD50qclAdpTUuQvKl
 YzH6iqEMvaHA9NJgKiMmlZP7EzML/lULQvKzUeBbmNRnPG5sgFn0cHSKcOALJdg7YQ8+d1I+Rg2
 P2zqINYHCOMbZ8yvvjaUZQ1d7pgKslPRBAvRan2i0aFDkk7wW1DT8Z0D/f4vvtDcMJAwWerLyI2
 eAGtosVTAd5awGjkCVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200123

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v1: lore.kernel.org/r/20260413121824.375473-1-ajay.nandam@oss.qualcomm.com

Changes since v1:
- Fixed runtime resume error handling in WSA/VA paths:
  - keep regcache cache-only on pm_clk_resume() failure
  - unwind clocks with pm_clk_suspend() if regcache_sync() fails
- Dropped the separate "Guard optional NPL clock rate programming"
  patch as discussed on list

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/lpass-va-macro.c  | 123 ++++++++++++++---------------
 sound/soc/codecs/lpass-wsa-macro.c | 115 +++++++++------------------
 2 files changed, 97 insertions(+), 141 deletions(-)

-- 
2.34.1
