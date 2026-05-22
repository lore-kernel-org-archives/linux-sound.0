Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1F397AEF
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455102; cv=none; b=uiqATCXLx20OcUgT7B68Y0Wqq6gFO5sZ7dW7/9LIis1BXIwjWN17PL3rDyBdSbuVJpGQMM8a3P3AMNXwEbohM+sCLrM5b5k9aog6J+E6Jmuv0LMqg7AqpDw1K5nNCRbGL4wXjD/hZfzIoQz7gqhVUbMtfCLIAGSJoJERx4RlaBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455102; c=relaxed/simple;
	bh=WO+NVaJ18uz3PmvgEahgw8uWHr29nAhUmZu/DB8hBXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=r2CTAQIs7K6gRzicKq24Kxq4E2uqvElLxZyCEAt/rLW6SFUG1uni9rt2e2QBoWSLjQZn+VLV6WFgiAzvBRtRpRdIBp/DoDIPrE2AEHQKKOAj0AaHESznqn5Vs1h4xWJlrv8sOqrIgmU68RmHiM4uNsA3eoG378Iu1taIQBka/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnX3w96W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOUQTBgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnX3w96W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOUQTBgi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8tQEi1816086
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fzhhXoNbvLrPQvIAEkuEUv
	lBgp4KgxOpzH4SvVu1Ek4=; b=MnX3w96W/rRNyfVyEFtO1L/KzPxXF8KeMXJdZw
	BRlLftUvJBB7hCGRMiZDf6HcoVbSzzFBk+NyiHQvMw5PO36QO7bSDyOq5XLZb4Dp
	z2ODbkTBIS54bUKYf8y/Ra+fiWxNfNhJcL0NgquowJRJ2luiR8/3SQ9ZOh4XVcYm
	XTbvbt5VKW8cLL09qrCJOu1qrpJV0nAcwGKwarXYpUEuF2i9GRhG/J6oZiHQ5u/E
	rO8FBJBBJjECWpkPN/RfVSkoQYemqae9Ij2xB9o2YFBqBYgsWS+QSxVEzmyllzpp
	UxWsVuSzlsQhMbusb2jfYkjoDl4Ia9dluonFEBkU8kTCansg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm21v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so8351517a91.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455099; x=1780059899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzhhXoNbvLrPQvIAEkuEUvlBgp4KgxOpzH4SvVu1Ek4=;
        b=fOUQTBgizqfHQ32JmgnYzaC1ppa3zBjSMVajZtK3tAKyH8TDgKu5pYSJPM3mPm9cjF
         BlpP06ozssR10lZsRztDjNTU/1+/iT4vGxOLKnbQUtudzCQ8TBctjSfrKgrnju9xev/R
         emw1ww5hZQHHWEncmKI/cX34U+7ox1WZhytu7P3CFI8s0JQjoaDAV71FkxXEgfVV6CBA
         F8Tzo/8dct1NjR2Qt7pLj3d20eb3SKnvmUDOK69lOLytKXgU544ngqgngav3Xm3yFb2n
         4RQ9483YyJNs4x65YSn4wiGEvOz1+VB6vQ3G2bGyLm+FmEU0c2PdfnCnEI2hG4xYxCXI
         CJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455099; x=1780059899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzhhXoNbvLrPQvIAEkuEUvlBgp4KgxOpzH4SvVu1Ek4=;
        b=JX2XyHisXbJDY4hFPo5Z924IgsYxBxStjSDTEIelrENx0NcHdc1vLY5GYRXS4hwE8M
         biQHrIqMMRDSIs+GKuhxECl1aSZas2nMW7091wZowZyd/0IK5gI/4j9sxgO2OnlhLNug
         YT7GWoo4TAbbdiSjokIvbdxV+dROO+bZhCbm8NfPVNgqn/Ic8O8v0wUYhBdmo1u5z8jf
         V+13zpcZaVqFHYogVvJdfIeknN6gj/aLi+j0dDKxEvYgqnLWZRwObFBs21gxJ4Z10eJK
         IZyL5lYRHGUw98c2MbCKZ+vFF0+WZrzAC7UvSI0sHyx08lchjbny22+Wst48iMvnGUeP
         nNFA==
X-Gm-Message-State: AOJu0YxibplmPMaF2m5xCjB3UaE6/0tZ5GF9fcz1RHhiHXWdD9JFf5zU
	T6cHi7UQ/lLMdafZVq8vuKP0xJAniZFXVDEuTvt+OpE2xUlkbQ1VYu3MU5FmmENSXzT76bgJS7Y
	M5jlH+0brC0O/kQmxSYuDhisiCQVDWuIV2agdVjON29sv8BYuKuuTAvLV68jA29jQAA==
X-Gm-Gg: Acq92OFnbdFq3eBiPktYhJF3S2k4oezM3naDFp3lRpByF3VJ1YFGyqDb2CgGG3+QS18
	UsIE6eyw2ZxvbdYpLYJHQELWgLkGn2feO1TP74SHTPSCW0obsdXYu3JAi8nK6OxB/HB9A4Kzmzp
	4ltkpRoLlNarQWoSs7iPOF+yGgNu7ruI1bbO290KF5RoWO3OounR07qReY7aSCGqoqEKW0CGmqe
	LIsDKIIabSAWwyZ/6HiGYIYbJ5NhY+otAbZso6ZkSG4tgE8PHUCO9IfknOk+dBvjumMRd0exwJj
	diX+RV2HA2ZWXBPWyGD+3CyfAGmK/Y/osxCFmM6d8IP4N3wRgzoFyVr1e4Ptgc/WpepxSn59n/v
	CjzcCrzLvk5Ozl7T2EqwC9+bw51KMMwxuOpFtd0uCH8ixW1kiLg==
X-Received: by 2002:a17:90b:50d0:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36a674b6931mr3485432a91.0.1779455099311;
        Fri, 22 May 2026 06:04:59 -0700 (PDT)
X-Received: by 2002:a17:90b:50d0:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36a674b6931mr3485362a91.0.1779455098673;
        Fri, 22 May 2026 06:04:58 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:04:58 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v5 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Fri, 22 May 2026 18:34:39 +0530
Message-Id: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fKIpYDif1F0ZnA45_lhKxwOaTX4105p-
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10547c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=usA1xA7VnIIfQHlxnAQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX1IJhtqRIIV72
 dXeaFL7auzMwhajk5MIudXPlWTJM56j+Mbm5GVaE3ssPoaCLU4qc3uQBSlnAUk+VR3KK1gpYERI
 0k2Xsz3ieERQuOQDimaDmRoU8/S+jnsmcm7PDZDBoSvoEhDWzEExYo+ymu2JG4xCCYIfuy2R37g
 3OhKc2/pT0H3agYjGgFXPpfdRBxaA1kK6otyKV75mcPMBiHY1LLBrq9GOELFbOljBb5OzU8+zvm
 NRMggay1uI8fvNsmo1r3DMYTVqyZmH1z34VrKzKvZTqDDNNPScep4VT8vYVBBHdFaLEYwIXhHWU
 oCKA9FFVXjKGYeZgAew5ksf9sdxgh0X9PHL4QTJ4nqh/PV5uXqDzmh/USEXbk+mbbe1Qp9moJMn
 XBZQ8fcDKY39pdA1XuaAeoh4bcWwJbLf0OcnIOqVeL0vFMRCtfeybk1nvndNw9eHtFhNA/RuJHl
 c05S1N04CUo3EpEEscA==
X-Proofpoint-GUID: fKIpYDif1F0ZnA45_lhKxwOaTX4105p-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220130

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v4: https://lore.kernel.org/r/20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com

Changes since v4:
- Added `depends on PM` to `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` so PM clock helpers are available when these
  drivers are built
- Moved `sret` declaration in WSA/VA runtime_resume() from nested
  error-path blocks to top-level `int ret, sret;` declarations for
  kernel coding style compliance (no functional change)
- In WSA/VA probe error-unwind (`err_rpm_put`), check
  `pm_runtime_put_sync_suspend()` return values and emit `dev_warn()`
  on failure so runtime-PM unwind failures are visible

v3: https://lore.kernel.org/r/20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com

Changes since v3:
- In WSA/VA runtime_resume() regcache_sync() failure unwind, capture
  pm_clk_suspend() failures and emit dev_err() to make clock/cache
  rollback failures observable

- In WSA/VA runtime_resume(), mark regcache dirty when pm_clk_resume()
  fails so a later resume attempt forces a full regcache_sync() even if
  no prior runtime_suspend() has run

- Added `depends on PM` to `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` because these drivers now require PM clock
  helpers and must not build with `!PM_CLK` stubs

- Converted runtime-PM enablement to devm_pm_runtime_enable() in both
  PM-clock conversion patches; probe error unwind now uses
  pm_runtime_put_sync_suspend(), with runtime-PM disable handled by devm

- In WSA/VA runtime_suspend callbacks, moved regcache_mark_dirty() after
  successful pm_clk_suspend() and restored regcache_cache_only(false) on
  pm_clk_suspend() failures to avoid leaving dirty/cache-only state set
  when clocks are not suspended

- In va fsgen_gate_enable() error unwind, replaced
  pm_runtime_put_noidle() with pm_runtime_put_autosuspend() and added
  dev_warn() logging for put failures so failed-enable paths can
  autosuspend and drop PM-clock votes


Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/Kconfig           |   2 ++
 sound/soc/codecs/lpass-va-macro.c  | 133 +++++++++++++++++----------------
 sound/soc/codecs/lpass-wsa-macro.c | 121 +++++++++++-----------------
 3 files changed, 119 insertions(+), 137 deletions(-)

-- 
2.34.1
