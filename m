Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655276;
	b=GKXY4MOdAxm4AFJ3px9YhiTto5uOtkzI8JVTCHYgcylDaugYc/eQGZVR8setwQGGKtPy
	 EOgjVZn4otICnRsX+Z+tgmgSN+45EVZr9vP8aVep1bzg6AVUZGO6ECWomEwTPFl9GQ9Pq
	 l0/1LDdylDkVPPw9yX2b2QdfLJz62U/WOG0dUA7ZPmieNmw9gBHpBhUxVOWruVAKBgBCQ
	 CPDgrJdorx4mk6VzcS0d+l51cT+JPwM3Rwm0MED4CW/NskjmOyQkj83s0FMIkBPYj04K2
	 8rs2MOEnxSh/XEfV8aT9bOCH/MPfLXJwz6Ky2GbhbHuTUhTCa9cLqMysIT6xF83tuCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655276;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=aukrz5++RcuAb+1YfxGRljuvPhNb5Qby4iTCNUXX/14=;
	b=bVQsFjyUKy0WcQj/xL0Oqi8agOgqKQsijF3n1BhMCt3P8asLn8UEOWq9/slw/OFiEKRF
	 z+RcLvf4y76QMtaEuu8/NCudtX0rl25EtEqzBngOZg63IZ4tppf8jNgjpR8whcj/zLXn8
	 qBZF4vQltp/BSMhZv8NCNMy5UKrccv8UB+fCr2NH3YqWufcgYajcfQQ/+HXALf/wUYTfT
	 yT5FIH8hY7D2BTKFhslvkiUPQ721U9UR295L5bO/JBXYWCKi4dlHZyXk/APD/A2gApDSR
	 Pr++ik7abS37j7UCekLNeRhoMWfgZ/yD8B3guTIJrs/+wHMfXm3RSio/Pd9GYLDnhjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s5fWSZJm;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46290606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46290606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s5fWSZJm
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261022074753euoutp0243897cc9244e937be53e08ab21181efa~gynkXfbB71328913289euoutp02h
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261022074753euoutp0243897cc9244e937be53e08ab21181efa~gynkXfbB71328913289euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792655273;
	bh=aukrz5++RcuAb+1YfxGRljuvPhNb5Qby4iTCNUXX/14=;
	h=From:To:Cc:Subject:Date:References:From;
	b=s5fWSZJmpF7T5Hd9lgilB1YYbOHQaAJvWR3htQeE0I/glBhW2w3zB3Livs4T9+gZs
	 8jWY6Tsw01sewjpfbVD/eHPVgStJ3tb4hOhyAg2BmdZBcBvBdgNltLVTX6vn8uiQEh
	 86GYAUJ2jJX6fOkMMx7mRKK9e3Mv3MoYZLyvBBu8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c~gynkCgMix2511225112eucas1p2Z;
	Thu, 22 Oct 2026 07:47:52 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074752eusmtip2cbbc7f93b0eb674ede75ffbc8dca9825~gynjmehhu0771307713eusmtip20;
	Thu, 22 Oct 2026 07:47:52 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber
	<aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 0/4] ASoC: wm8994/midas_wm1811: fix codec clocking issues
Date: Thu, 22 Oct 2026 09:47:38 +0200
Message-ID: <20261022074743.625223-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c
X-EPHeader: CA
X-CMS-RootMailID: 20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c
References: <CGME20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c@eucas1p2.samsung.com>

Hi All,

This patchset fixes a few issues in the WM8994/WM1811 codec clocking
code, which show up on the Exynos4412 Trats2 board. On that board the
codec AIF1 and SYSCLK run from MCLK2 (the 32768Hz clock provided by the
PMIC) when idle, and from FLL1 (fed by MCLK1, a fixed 24MHz clock) when
a stream is active.

The symptoms are the codec flooding the kernel log with FIFO error
interrupts every 10ms once any digital path is powered up, for example
by the mixer state restored by alsactl, and FLL1 failing to lock:

 wm8994-codec wm8994-codec: Timed out waiting for FLL lock
 wm8994-codec wm8994-codec: FIFO error
 wm8994-codec wm8994-codec: FIFO error
 ...

Both issues disappear when booting with clk_ignore_unused, or after the
WLAN/Bluetooth drivers enable the shared 32kHz clock. This went
unnoticed during the initial Midas audio contribution probably because
the WLAN/Bluetooth drivers kept their clocks enabled that time. Several
bugs contribute to this:

1. aif_mclk_set() never enables MCLK2 for an AIF clocked from it, due
   to a missing shift of the AIFnCLK_SRC field value, so the codec runs
   from a stopped clock until another user enables it. The MCLK enable
   also doesn't follow the AIF clock source changes done while the AIF
   clock is running.

2. The AIFnCLK rate ratio saved when SYSCLK drops to 32kHz gets
   overwritten on each subsequent clock reconfiguration done in the low
   SYSCLK mode, so AIF1 ends up at 128fs instead of 256fs.

3. wm8994_set_dai_sysclk() passes the AIF index instead of the MCLK
   index to wm8994_set_mclk_rate(), so the rate of MCLK1 is reported for
   MCLK2 and the low SYSCLK handling is skipped.

4. The midas_wm1811 machine driver starts FLL1 at 11.2896MHz when no
   stream is active, while AIF1 keeps the configuration of the last
   stream (or the 48kHz reset default), which needs 12.288MHz.

Patches have been developed with LLM assistance and have been tested on
the real Trats2 board. The built-in speaker as well as headphones jack
provide proper audio now.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:

v2:
- patch 1: move the MCLK enable to the newly selected MCLK when the AIF
  clock source is changed by configure_aif_clock()
- added collected Reviewed-by tags

v1: https://lore.kernel.org/all/20261021101750.3297770-1-m.szyprowski@samsung.com/
- initial version


Patch summary:

Marek Szyprowski (4):
  ASoC: wm8994: fix MCLK gating for AIF clocks sourced from MCLK2
  ASoC: wm8994: don't lose the AIF clock ratio when staying at 32kHz
    SYSCLK
  ASoC: wm8994: fix MCLK index used for setting MCLK rate
  ASoC: samsung: midas_wm1811: run FLL1 at the AIF1 configured rate when
    idle

 sound/soc/codecs/wm8994.c        | 153 ++++++++++++++++++-------------
 sound/soc/codecs/wm8994.h        |   2 +
 sound/soc/samsung/midas_wm1811.c |  14 ++-
 3 files changed, 99 insertions(+), 70 deletions(-)

-- 
2.43.0

