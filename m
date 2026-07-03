Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD63367F2F
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077043; cv=none; b=EZC151NOeFe8wZjbkMTW50ln+3KgT2/U6e/bDpcD2XQRv8UL6AA68qd2I30/+n98+huDFT8lc2yOVVV/RI5VsYGKZ3F/eGV7G3Ppbbnuv/ScrRPl8KiUAYi7NSoA4Tjq+wTiq2NAxjENth31wzLBXcDwX1g3miwjbcYLHqqqxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077043; c=relaxed/simple;
	bh=6Kne9SHF5TgjE0VibyQ0aLbJJjhNGSb9bnFsRqFEhuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IYiDErGgDI36TnmRNWT7pDUZShdYoz8bd0P+3kI3eSUNp3tDgAlspEOsBMPMVYeAm0eFAGnvahQoxZ+bCeSonCBOQlWci7s+IsBjErWzm0JiBEUs7M3cl9FAPERzOqTh79JxI4R5j78QdizyvL1+aNr8Mt2PgcJH0muA0sBqAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REq2QXeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEQB5FOm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REq2QXeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEQB5FOm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfqO2994880
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXvHOt+3maIcxX/mM5iThF
	59AG57jKAB1ekI7t7BEKE=; b=REq2QXeAashjPtHHDTJOqBjLDZzP2rzBa9ykrn
	zqUJC/JYuciTvWoMPWI6DdP+USIQO7hI29lGcvQF47k58aG0cBmsa4bp6wIcgNoF
	Kty+MUIxw8f6/fgO8RsRHP+8h++gYwnlf9cAiwEp3jW/yLUcx7jt9QPUcos83YJD
	zKFemrjLZqkVcHJV5zhkjO8uSdIBuImIUACpNYFAub4ETRMYAH/8hya1n1jYWDZu
	BaXy/TPIkgOAc1Y2iNOTrBxKb71BgkyFIcAjzJ0yQdJ3Hyq0wwNE3CqPYLRVW7aN
	qQXGliBku1FTLbvk8Aenja/m6mV1iyEfCXrMNC+KJpp6UO6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n21e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 11:10:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84786d85ec2so596569b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077040; x=1783681840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXvHOt+3maIcxX/mM5iThF59AG57jKAB1ekI7t7BEKE=;
        b=UEQB5FOmepapjrIZZj6tAHPYjBQFgQRXThBjJqDgtUTT30JZ4byQ8xvA+CRUwgl8Q5
         cQYCCR+wtKY8YgdH19PZqhgIK2SyXGfezTBgpUwvc5yOr9e4f9KyCeM3+HpEQ2cVYpR+
         fIuX5qwkInh9IFSL+SlhcU07lkAtdOLRgbOh5G/vp8pwoeEP5MjeYm6om7a+Uxu9XTQw
         oVBqCE5lVChZcz6p84EqpvnEk1xsYlayR+KSDeX/+wwo3XHLrUe5fe0xPR81uyLQP/d8
         KzMdlSo6CvkvKctchgREtOTvaicNDUvGvdVc9WjJUuvW61s/Av0lhxZpFCSGhLyq7NTN
         0jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077040; x=1783681840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXvHOt+3maIcxX/mM5iThF59AG57jKAB1ekI7t7BEKE=;
        b=cuF1rmocrBinkhgQCbKVCg5YqQp9IwbQZlhHvCIsQbiaEOGGTnLcdvTni4/TOT6IjB
         5RyxpRUCMRyYuq+iyKEDXxhh9jHYMGfN7ARRg7GFQo9p5NpicN3qZubwQ0c6wktQw7Fe
         qE595ut85XEFjN/vTkQdc2KGbtCb6FId2wrBb3S50nJtbUWIAaIk6b2P/LKtnRyw/yU8
         JcBJMYywpjtWVir4GIDbaXUvFkEl9lXZuWKwL19LCiBK0CNz4No/tXTKvYL4fx1vEzIY
         CuIyXDfRdRLd1bEps2u/5AcZpwN3CIHwc8fqKtTgNbrYvCC5jq9eBcROzMYvE6/aO2RM
         VbqA==
X-Gm-Message-State: AOJu0YwhWT/KeuBbKj55YShn1+m4gHY3rxjUB2OPsoLCNM74DNFTT9ti
	vuPNnYCjAsE/VdfkI7cPPO3rLUENighaDd7QDXmHlekGFJ26LXWZ4DX5Pe9lXIu0PvUW6XgK/CC
	Hn3bIO9qZHPTITfqvmQ0KucPSYU9k6Rpv88415hVm1qRjrdwABj79tETPNy4wTu7mJw==
X-Gm-Gg: AfdE7ck9xJchfna//Ma3GvySMivbxc804MQ43AriXfIZ4C9fWGmEfSH+FjZ8vcSpR4U
	193I/ubC/IGm12r7xztGFh/hFM6BydjWl4hDmLhrQGGqJ2eCUtMSnuL30muAQMxVl31J6sSFZ7E
	DzzqlqOJ3KjTiwkdIj26BgobvHXzfSRs099PSawusMaiWFRJW8CJ4Q0pilq674sC9Fhlh6VSGI/
	RWMGqCAqwynyjJLqL544VzhKOYjZMEuypLExt4r3MaC/cYyE28Zg3JS8s0KWmUZ7nXgF3Jq0sfl
	D/6E5mvKg8SBlkR3M5A/J+ezFJ1/IilN2SyN0gNDM57fQycpKcvkh1bJ9yyWkc8rgj8CLRjI49l
	GM/bV7kG/JCGZzEn+Qc/Ej1rJVcTLIQx4dOCAHQ8=
X-Received: by 2002:a05:6a00:340a:b0:842:6849:2180 with SMTP id d2e1a72fcca58-847c0988a1amr9359609b3a.37.1783077039670;
        Fri, 03 Jul 2026 04:10:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:340a:b0:842:6849:2180 with SMTP id d2e1a72fcca58-847c0988a1amr9359579b3a.37.1783077039181;
        Fri, 03 Jul 2026 04:10:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm2836444b3a.27.2026.07.03.04.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:10:38 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: codecs: lpass-{tx,rx}-macro: switch to PM clock
 framework
Date: Fri, 03 Jul 2026 16:38:50 +0530
Message-Id: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOYR2oC/yXMPQ6DMAxA4asgz1gKgfJ3lapDcNzWDATFtIqEu
 DuhHb/hvR2Uo7DCWOwQ+SsqYcmoygLo7ZYXo/hssMa2pjM1poDqkYJnwi1hTDg0t7p3llpX9ZC
 7NfJT0u95f/ytn2lm2q4RHMcJSbPVq3UAAAA=
X-Change-ID: 20260703-xo-sd-codec-tx-rx-94538a2c6a18
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX2iEV/xLX2HdM
 U3/ergZox6B2Y1p2Z4HfnZmOOqJ8WoaILOu19hw/V08ZwZHYp2ekfZxt3cqdFBvjFNi/O4d3XJl
 LFr0erqO94WlYRblFatHMTSrMruLvlw=
X-Proofpoint-ORIG-GUID: i-_lx1qCBcs1mWNtgVkmPQD8bIGXGDV5
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4798b0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N2Be1dCzRr3-Ybzih1kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: i-_lx1qCBcs1mWNtgVkmPQD8bIGXGDV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX67fg3oY3MgM6
 0F17Enf8lNUW2lOYYZqJSQdUqXSL0ECMnAAahmoAG0qJFitbC989x82ynRsKcaz2/4NFoFJbsLj
 8tU9fHMrmMzHeifU1KMcVvEVMk32rqUz5ROp/G8ds4Td6o2pRdLbmArYpjjqCIW/k3z43mwwiGR
 1MBjPcGpPi6R/IGwugB/C7BNTWqLS5Ek5bqeZCXNgghFmBqXaYNTnidVcvPskD2rzKyXjpvXPs1
 9ubJOiHehlNhAgzM6qfxHPESNE47VX/gKc1qBFB12JFbZp5z7rofiHIRWgY4QilwDRXtU6IwsYU
 o1JGeylatM1j5iHI5ixqh7MHROrFRNS3Aiu0002g81CvTrtRSYvgQKWuVO8yIFQAg1YAgtRq0uS
 jdZzMRrOTNDR0YvjwpDoOkPvzV39CsM5EjCsvEz1CIU/c5/+8p+MS5JI5FFJrW+AAV2J9AcFyDI
 dHjyF5yps3c7F4OxvGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030108

Convert the LPASS TX and RX macro codec drivers to runtime PM clock
management using the PM clock framework, completing the LPASS macro PM
clock migration started with the WSA/VA macros [1].

The conversion follows the same pattern established in the WSA/VA series:
- PM clocks created and populated from DT via devm_pm_clk_create() +
  of_pm_clk_add_clks(), inlined in probe (no helper wrapper).
- Runtime PM enabled via devm_pm_runtime_enable() with 100 ms autosuspend.
- runtime_suspend: regcache_cache_only first, pm_clk_suspend, then
  regcache_mark_dirty only on success; rollback on failure.
- runtime_resume: pm_clk_resume with regcache unwind, regcache_sync with
  full unwind on failure.
- SWR clock gate prepare/unprepare routed through pm_runtime_resume_and_get
  / pm_runtime_put_autosuspend.
- Probe error paths tightened with dev_warn on PM put failures.
- Empty remove callbacks dropped (devm handles cleanup).
- PM_CLK Kconfig dependency added.

[1] https://lore.kernel.org/linux-arm-msm/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com/

---
Ajay Kumar Nandam (2):
      ASoC: codecs: lpass-tx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-rx-macro: switch to PM clock framework for runtime PM

 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-rx-macro.c | 114 ++++++++++++++-----------------------
 sound/soc/codecs/lpass-tx-macro.c | 115 ++++++++++++++++----------------------
 3 files changed, 92 insertions(+), 139 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260703-xo-sd-codec-tx-rx-94538a2c6a18

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

