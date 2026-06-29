Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27336366079
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727569; cv=none; b=HVcwahvI94Ie06f2etUuDIDUE9PDMVOP4KMbN1bR7kec7HGwjRzkbuhSAvRZBmwdpLsiZaFUfpOZK4cQ+tONmqU8Y6/6LxG2FwDK5NKtijJU2EFsXmhUeo4AL+TVM6F9FLBAB/RUlwaaY088MZb61tMdsZXQeuF1YJO03R4S6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727569; c=relaxed/simple;
	bh=P6eLxUIiE+lx2/w61gjg/sUcTAbBjxZX85JI2peNKhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=akKirSyvGU/O16wLk6KSs3oHxjxmz6AvyjGL+KVz/vq++mMEWoGLDDfwuaZlVkxtEACyKj4NFcQWieQ8SsjHlthmgH2DR+BKC7UuHfNm1SjCwYclgnKw4gC28ftPDb3MwFNpIMi4ztYgG9lDZNmYo6YWVt9vCxhjW6TdMIPBsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uai2HY+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVbq+bUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uai2HY+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVbq+bUk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9n7gq2529405
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cw/7NSANGSyxIv9D7/Y6yn
	h/9DTnfWawXENIPhr8xwQ=; b=Uai2HY+gR0nZ2yxWtulsxOuBw0GoVeSUckYZta
	LNedO3gDxhMgpAlFrygY3PhdcD3mCfHzDmwa2LENWaDtrfOgJFmP07glgeN7D9u1
	MaQhIQ+sq+JhZYn2D4Q+EM7td9K+ktQ8PrDGW5XaOT/ctPd83n6X3VsF4TiF2JXD
	t8OuJ9JPTE5VNpBypYijvpINBENpWumvK54SsPU4+uquQySCOO+9QAAEeN7cVl6V
	J151+FlMBCSbkrkPelufByq8XgoyxCdeUlv9KqJUMdMGO74aOf2Qz9pCywcshqsZ
	9QLDmAhb43H9OSfwCguWU6Fr6mOVVk5B2Tg9MbmrK1Up8Y3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr270-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9a700dc0eso12011875ad.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727566; x=1783332366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cw/7NSANGSyxIv9D7/Y6ynh/9DTnfWawXENIPhr8xwQ=;
        b=NVbq+bUkrvthmu0BvdC6Q9Sypyt+iRF/lGn98SLLoS5cl3NHfoCV9pkk9cWlHmQ/QP
         1qIMXjImc9MkPSzf9iqS6+dswd3VC/qjR9EyNoUvEEG1M3fNaxrS7L98ay3KPxnJdPdu
         EzomHwlX7VaJiZPGtKbqbELIv2scK4KF4B5O8JQuOU95ONICwP+ZztuQQA8Ik/GL6P9t
         +ksbn5brae4hdL1xmtAvb/dVB4Wxry4OJWiYbq4nBY2hZ6o6o/T3f7dTrevT42SavccR
         oKmwSOKAjzn8JAbbYIsxDxexDkAmaiNeICuvGYKk8Ev2QjUnhWnPv+XK0JWnkBVy97cF
         Y6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727566; x=1783332366;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw/7NSANGSyxIv9D7/Y6ynh/9DTnfWawXENIPhr8xwQ=;
        b=m9S/LID+Ps0rO+a3/Jw1lP6KFVrMlvvMxAeHAIcK92qdIPWYEjpNw+CQq+P1XkzfM5
         N5ZMowSaSliHeNI1atD0EBcf5kkvP6t59TLZbypyWVXSlEYL9u3/q8Rk5dpjt76QmopW
         JKanXLAPNLHEjxZhCa5HdCOvgbrJN6pBQHxeY11z6DgTwG9cNz3GA06s9A+OcyGVICix
         k8QKtJb8IS0siqIEsfEnkicS3+9RfH6qcBTxfz9/MqDFUtC+9ctTrB8zrR5TN7fdKqs1
         46iyHTGTG9suVdSsHBydDD7wJpS0S9VOJNKzQzSh+uL/wjYwRN3lRY+FAOBdalbUiIR3
         20Yg==
X-Gm-Message-State: AOJu0Ywl+jPGF5aQGvmVdXi3dBFT1XdkKN4GlQPvmJtGpxJ1ekKYZFbq
	3CAFNkiTrtKUNfEuuDUKn0GcaZ/F+i2TgufwjhKM3NILT9eDwHjzm7Kn1uiSV+m6SujClCY9J41
	+DpHu/jUVn/LoT8jg6djhu09SxGf1sbzvc55lPz6oGdirZZjzqQsrU9hC8NzY6aAH5w==
X-Gm-Gg: AfdE7cmsfiSR3arieRWiGLP6oJo+50F0RP6KM0RwgZMmCEO97hkHRGYcM1P/YH5tqX8
	76ZSWSsJ36u+5JAMl/MSYY0THHvAbmfRcp2Kasz755SSDdt+pzZaNa202a154U7vqhJlVhu+kvD
	yNQh5dokvIlnN98imRHmpCJIKabjCAn+n06j+YAT3AZf8dzntZyGFMDC29UAV7kHmw6jSlvujJm
	8DA1fLLepr6uKjnO5HrpMY21uzYkvw8bS9p/jaNJhmJMn74Alcqi8nF5qf6r4OhvCY+BngW5FSv
	+jagxGVbJuEXdJwh7cWJsPcLyViVA4U+JNPfDtTBt5+0NzqnpkAZeCItFwccNZFWhSxuojbtzwK
	zBWeT0Xkc8pNpUoWB8Z4h5KarFWyQGZuC8r0G6nA=
X-Received: by 2002:a17:903:2f0c:b0:2c9:97a7:b1f0 with SMTP id d9443c01a7336-2c997a7b396mr82682375ad.47.1782727565886;
        Mon, 29 Jun 2026 03:06:05 -0700 (PDT)
X-Received: by 2002:a17:903:2f0c:b0:2c9:97a7:b1f0 with SMTP id d9443c01a7336-2c997a7b396mr82682245ad.47.1782727565368;
        Mon, 29 Jun 2026 03:06:05 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v7 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock
 framework
Date: Mon, 29 Jun 2026 15:35:37 +0530
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFDQmoC/yXMMQ6DMAxA0asgz1iiASWlV0EMIXZbM5AqBoSEu
 DspjG/4fwflJKzwKnZIvIpKnDJcWUD4+unDKJQNpjK2sqbGLaIShkgccHU4NPh0tiVf++bhCXL
 3S/yW7Xp2/W1dhpHD/B/BcZy2DlJjdQAAAA==
X-Change-ID: 20260623-xo-sd-codec-v7-b4-8769da3a41ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a42438e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RprURHu2vK4Ir6F4JdUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DsPWyU8NPquPgtv5cW_LnRRBBujKyPBu
X-Proofpoint-ORIG-GUID: DsPWyU8NPquPgtv5cW_LnRRBBujKyPBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX2/4QWskoDYPk
 DCktc6aJUHDdaERIhovNCei96q6hBLLiufL2L5tgEjOVqKWYKM2po/diJtuGVSJYwZBT6I4iDTD
 6+dtClx2IsRgbkEIzh0MQVVbABcwzgTIIjVsjbwwtpMau5xUBvDCvk2ekzShfiWVH0IZ4XW1sE7
 fRzM6IxLFv+oJvVR22/CzYXp1mwp0AXYEoQAtqA8I9TSqJR8KP84dgIpuAGX7xLAaBtyiy8NwCD
 rp7oBW2NBuHiwOjzU8/AIauUjGZ4cZzWvkv4EeN5dY0+NOFVGT9WgvUkyQWnYgnLFJuDJ6OOVEZ
 vvHWKq/3/95SNyYsoBidSDy7+aIN3nIfCrSlze3iCCbs+IIxyGuDBAxuFutWzhdPEV0xWqQR3ZK
 avbh+fW4fXEC5ZH9S80XYqiOxy4kyiCMX6WVc3rj0x98MoAbsICOog1Q/DpAbggcuaezdliZQhy
 JeVk7ee+4FdP0IL92cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX08ydg3f1ixaw
 0hExB+9FVjqBxKT85QFZ618uNvUWUUi4RFyoxeDYbCV3v/W4WHBqnWv1suXeAyJep2qJ9ehHRV4
 TmwKX3ReArxwlWtmIxqAUTbvl2Wu+zE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081

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
Ajay Kumar Nandam (3):
      ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 142 +++++++++++++++++++++----------------
 sound/soc/codecs/lpass-wsa-macro.c | 133 ++++++++++++++--------------------
 3 files changed, 134 insertions(+), 143 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260623-xo-sd-codec-v7-b4-8769da3a41ad

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

