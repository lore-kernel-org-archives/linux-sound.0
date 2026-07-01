Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4034F48F
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931544; cv=none; b=Q5nKZQP5mS+iY3JXh2dRALhi4Ba870M2d2nET9zYfTzWa3/vVlXvsPb3/yBX0d3fjVmRar4wpgO120BtILYx1c+w7omqH9jKq40YeFZmXnoknYErL9KNADqRxCb882Pimcpc2kfBSL5mvQZiVp19tn7VOBvUlY5DwLjzeCasQ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931544; c=relaxed/simple;
	bh=Wy3bGWEtEMsWIZDlPAvvQW/doKeTMQ33v50YEDsYwbg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TrndO/Fm02XrtVR5Bg5yfjQzjmp3y7as76jL/vtJaAcmGXemMe695i0JmbpH24WBbn71qgRU1HIwzSwxr95nY9T2M3qsnaQ1MAjpjFmneZ0FN9ula88oGBzQDz8tFljEtQ+D9E0J/jME/e1HyOfQclcVtIs3q6uePKH3Gv4b1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egMDaHX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PonbPZta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egMDaHX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PonbPZta"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmgvH1618352
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 18:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=diL7rhATDYnTzGQ/+UzJRf
	spvBHaQBuSaUwqFLsKjew=; b=egMDaHX1EGlV+J43M9yzs0AayDxMYAHuTUTwpd
	SVKW/taT2rFiCw7q01TeQ4MsyDbpqjxxLjXMEIjEgc4AQLtMaOwZ0rd/OslVAHKn
	TB2Eppl3JObT3zPbIb4+cqj3IuPEICZHQVQiVx/BmUMu12cKPES9UDI5LO5LGPCx
	SKKDjeII2dhj8S8T0LW3yCMz7NPAF4zGOhkKUcA1lbdEU35IGwleWE6yjpBkQNGc
	VyypP+jpBCKEE3Nyw9tV1Ez2zmBFNaGqjmM9pPcg2KRHr6sWTslj+1P1ZVz+3qbH
	Sg9VcrOrG7elafUL5RiioIXHV7AR5BHfi2tridd9DiqwN0Jg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502utg9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 18:45:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso856998a91.2
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931540; x=1783536340; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=diL7rhATDYnTzGQ/+UzJRfspvBHaQBuSaUwqFLsKjew=;
        b=PonbPZtaWQ0EaZUOli50a2DXXDBCWWQR+YWf3GslIIQRmDubkrdTFORE6eVl1IrgyF
         nCIsZO4Z+d3jXmOAAdZYUiPh0XW/I8hGI4McPojKXINICDfYCAvCYR3z8exyGK61vhEj
         6LNa0970X0/w3NWaLGLcfw2qx4BxHRJ8QV22tYsuk4yzkPB+mQa4hbYEqp/vHJJqETNh
         8xJQLqA972p3jxq9EUeyd29VkWnhRLUPS7z3UQDcEdASrPrDXuGZOxIAs6XKFpV+OQ3Q
         YXaSy1QyuDSrD3/20NezeRNhDQc+MbnKtGJpBvBKWdNEKhIJcnBWUA4W2U/H2yuzReDW
         ngzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931540; x=1783536340;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diL7rhATDYnTzGQ/+UzJRfspvBHaQBuSaUwqFLsKjew=;
        b=F93c6iEgpbr9C6Mh/1ixEj1a9XdRinjLRfPBzqHmNCVCAT/kMZ1B7kagQkyJT8H7MP
         oE7O4U5NijVtOxHBycL7+mpxWMb50Qvy0LMsGw0bgnAnfeSvSw6TyCURFm13kQ3PGUSZ
         L5YyXWu1SlzWFTfKn4YC9jdmFD9JCfXn+hudi4lOUKANRLC5FGXNZvvAg6RX8Uw6hvh3
         jmN+PJ9faiQ5VJnrjRSeEIrVfZW2gWeyPKcXJ8MTJYXauoJvty1NsBDYyVvuMgCIq+rJ
         kPZiuOZyTRvw3iqs3wI5t5i4toMmyGdW59bDFOv6MD4zg2TOkzu5bKEA5I12nisP4kl4
         hq5A==
X-Gm-Message-State: AOJu0YzDNyOU4s6d/2FqKPPgVvDS0l2bi4emov1ciXDCUZpavNoy58rt
	6jDciULgve9CCX319hPvbHKLtfVW65K68Ti/hhlTMTYwQn09e0pio1NvknrwQLxm2UmXSCCH7od
	D3DbrO9xSSvEG7jsQ9ykwKWCPqyn6t7Pyk5lvxYDO+prGeiAgbLgu8okgibTa3shJVA==
X-Gm-Gg: AfdE7cnYTNxYvstug7nTgR6ZmODE6QygV2s6Ejdgf4P7UjdkDKAR2QGvOOY4itUVKPA
	Wd+knUqdijTVpwtuVTySizu6MeumkkgKJqeXLgXXJdw0mj8Xze+UrApOJF+O5d0Frk7FA17adTE
	BzScGBrYvWZSLCBxoPhmH0bnyQyM4kzMvxPIHcKEhAmNsMzeW6a1yf3FHpWTDFss0WYlxi0u48p
	KHMpGgNym3c2lPFJ/K/djXZUo7+4sNw1gy4EOLvh5ec00TQRrX0GUDbp6geuJi0XPNexjYU6utU
	v2Ww6uPcgWfM19AhyAA0gNF1PZ9orhz/fC9eAlHDHeh3Jrz5iJ3DSLbLvjok6F+Z3wiASPubIqS
	SILPga6PiG+88H9iBPSD9FIkXzxAsnwyBXR2FCyc=
X-Received: by 2002:a17:90b:4d84:b0:37f:9cdf:f039 with SMTP id 98e67ed59e1d1-380baaafc65mr1779081a91.28.1782931540139;
        Wed, 01 Jul 2026 11:45:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:37f:9cdf:f039 with SMTP id 98e67ed59e1d1-380baaafc65mr1779042a91.28.1782931539549;
        Wed, 01 Jul 2026 11:45:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:38 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock
 framework
Date: Thu, 02 Jul 2026 00:14:56 +0530
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChgRWoC/22NQQ6CMBREr0K69hNsKwVX3sOwKO1HaoRqPxAM4
 e4WjDs3k7xk5s3CCINDYudkYQEnR873EYpDwkyr+xuCs5EZz3ie5VzA7IEsGG/RwKSgllCovLR
 aaHnUlsXdM2Dj5t15rb5MY31HM2yirdE6Gnx476eT2no/f/nHHzODphbKoDwpI/nFE6WvUT+M7
 7o0BqvWdf0AMzMqT8sAAAA=
X-Change-ID: 20260623-xo-sd-codec-v7-b4-8769da3a41ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX22div5StqC6W
 T0bgU7Yd7V+JuIho6DcR+ZyScXeac0/HyKbefErLjjQt+ZhmnJcpxgAZ+yyBbXIsu8mL3HeEQdo
 SkLRl31+cPr3ca9e3imwxGLplqUUFSM=
X-Proofpoint-GUID: Z8uT0zQV8joMvGYmXPPmELqGFQfZ5cOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfXxEawQOSLr1Mw
 VrWB6W6cDr8p86NcAuaGzcnZaaBM841Cx1vZUanAuKn28+si7LhAWT4Kt9E6C+UkPoCBx0aaL+8
 pmMWRXr77GcflMaOIQHU9fo+s2oFP1Vwr+zLWyhDJlo02YFgcmSu5XnTBtcNzAaw5c7YneLWiJ0
 Hsv6yO6W3NTxzm+QoJArntL5reQ7J3rp/BLSmUtNG5Thx4Gj7UIMkEgga7w3Aqcyubtvi+Qb4GT
 //8kD3hhhaN+Nwu4Ou1Ma978e4OIcigrZtQxw6mxXuy6aDaME8XjzEwcVm9SMhlwVBrukuGlu4W
 oPgFUIW9uFUFNxCwFKQZCI/8Y+EKOGoamoIynTZ4L38CPkqumuyir0lXQhugWeuemQHzjn6mo5b
 8QCx+FUNjqFbYdnBxSvkImXxwO5Dnrx1EbuKEcxMu1GO+0OhojDke7MPlx2GtTYlg5CiCQ/ds/X
 mJzp18mTKXHIM+3nVyA==
X-Proofpoint-ORIG-GUID: Z8uT0zQV8joMvGYmXPPmELqGFQfZ5cOn
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a456055 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=RprURHu2vK4Ir6F4JdUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200

Hi,

This series converts the LPASS WSA and VA macro codec drivers to the
PM clock framework for runtime PM clock handling.

The runtime clock enable/disable sequencing is moved to PM clock helpers
for clocks described in device tree, while regcache state handling remains
in the codec runtime PM callbacks. This keeps register cache synchronization
explicit in the driver and lets runtime PM drop codec clock votes when the
macros are idle.

The series also keeps WSA MCLK-output clock registration resource-managed
by switching it to devm_clk_hw_register(), which allows the empty WSA remove
callback to be dropped.

Changes since v7:
  - Dropped va_macro_setup_pm_clocks() helper in the VA patch and inlined
    devm_pm_clk_create() + of_pm_clk_add_clks() directly in probe, matching
    the WSA pattern for consistency.

Changes since v6:
- Dropped the now-empty WSA macro remove callback.
- Sorted the VA macro pm_clock.h include.
- Re-sent as v7 with proper cover-letter threading after the broken v6
  resend was accidentally sent as separate threads.

Changes since v5:
- Rebased to current linux-next/master and regenerated as a standalone
  series that applies cleanly.
- Added depends on PM_CLK for SND_SOC_LPASS_WSA_MACRO and
  SND_SOC_LPASS_VA_MACRO since PM clock APIs are used.
- Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
- Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
  patches.

Link: https://lore.kernel.org/r/20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Changes in v8:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v7: https://patch.msgid.link/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com

---
Ajay Kumar Nandam (3):
      ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 129 ++++++++++++++++++-----------------
 sound/soc/codecs/lpass-wsa-macro.c | 133 +++++++++++++++----------------------
 3 files changed, 122 insertions(+), 142 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260623-xo-sd-codec-v7-b4-8769da3a41ad

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

