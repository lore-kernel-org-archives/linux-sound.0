Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577904;
	b=UREw5H+RsT+ZJSeWl3RBD2eXt+pHV/thWPVhfjUluJO2rxuj2qbO1MHFfL4gwlOKNArR
	 yeWmhVQXOgzgg2jg8dq1mX/OByrlQQq//+L5Ai69rGuqBYIosqgVNwsYCsgVVm5jID/bz
	 tP62CKNYQ9yeN8v5fAmEKaf2j//E7kkvnYL2VfUWlZFjIlFwxhjB2Prkb6GkehR/+BZEO
	 h4BSbOI/lZ2g+0uV7QOsYZzLVhC8ZI/qH7vtkv5Lqin2IuYTH8cxbvRbS41qUxX58rsU9
	 hlBvyDEZpEawI+z+643apdqugW+1pQsHkZWSvSKUGF8qHNPFixpsXZbRhAGxso6DQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577904;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=JtvTp7Odlr8V1Ob/0GaCt0VD7vHod0w8CxroTBrKriU=;
	b=ZQc9QHGi43K0TPEGA+wOj8EKecYl/26AUXdfjP0tTJqui6yZxpeljndIAHNVIGDry+3m
	 F72y0CW6XwSo5mgrzWnnzoCvO48z+ZN8gBGiUfHA99ehtTzUH9lx3fhgSxG2rxxVP5icH
	 /Upa2yn16Yl7poXsukzghogSQEkSV2zsyI9L2NYglwU8QWRfdF32mcDe1lJsqlcUFMDT3
	 X5VBzIcuPqC6AmbHfKBLcaGtlo5BnAmlyAgBpOrcC1Bce7eu607UGU9FdE1qVVXI0Yqtg
	 ioeaDm7wDNCJDw/aryG2QhJiARna031bc8tf8hfdUk0Tivm6lfKF+kinoeAF2fDvg7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rnM0jaRF;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD9606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BD9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rnM0jaRF
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021101816euoutp01c8ed848a6cfe41f59917b944058a9441~ghBlc5xMR0816808168euoutp01D
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021101816euoutp01c8ed848a6cfe41f59917b944058a9441~ghBlc5xMR0816808168euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792577896;
	bh=JtvTp7Odlr8V1Ob/0GaCt0VD7vHod0w8CxroTBrKriU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rnM0jaRFEDpHA6Zv5nvHLLcnFklHcucL+4auYLCHHZOlaWU12B7P6tVssBNBVUxDK
	 Ph5J2Qn2YFtV4bWfmWI/qdDVv6vut+H5xmen/uCLEkGFUvLWYOHmj+zK1DScethh+g
	 2kYYXe4Ci7Qmh0VYxxisAaQzFYnnt1sElOT7CMS4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261021101815eucas1p2f6dd40fb230ab01b36c7d8f3eada0f45~ghBk7mNRb2888028880eucas1p2M;
	Wed, 21 Oct 2026 10:18:15 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261021101815eusmtip272499edd4b704b0ed1e020e608a6ff08~ghBkci1v50104301043eusmtip2i;
	Wed, 21 Oct 2026 10:18:15 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>,
	Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/4] ASoC: wm8994/midas_wm1811: fix codec clocking issues
Date: Wed, 21 Oct 2026 12:17:41 +0200
Message-ID: <20261021101750.3297770-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261021101815eucas1p2f6dd40fb230ab01b36c7d8f3eada0f45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101815eucas1p2f6dd40fb230ab01b36c7d8f3eada0f45
X-EPHeader: CA
X-CMS-RootMailID: 20261021101815eucas1p2f6dd40fb230ab01b36c7d8f3eada0f45
References: <CGME20261021101815eucas1p2f6dd40fb230ab01b36c7d8f3eada0f45@eucas1p2.samsung.com>

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
   from a stopped clock until another user enables it.

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


Marek Szyprowski (4):
  ASoC: wm8994: fix MCLK gating for AIF clocks sourced from MCLK2
  ASoC: wm8994: don't lose the AIF clock ratio when staying at 32kHz
    SYSCLK
  ASoC: wm8994: fix MCLK index used for setting MCLK rate
  ASoC: samsung: midas_wm1811: run FLL1 at the AIF1 configured rate when
    idle

 sound/soc/codecs/wm8994.c        | 126 +++++++++++++++----------------
 sound/soc/codecs/wm8994.h        |   1 +
 sound/soc/samsung/midas_wm1811.c |  14 +++-
 3 files changed, 71 insertions(+), 70 deletions(-)

-- 
2.43.0

