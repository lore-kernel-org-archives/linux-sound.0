Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044D19DF5B
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545617; cv=none; b=NCYy7NUiFaER4jZfez2fdw7Qqyfz95plYnmbIz4Wcb7XnOZgp8H79QZV0pWZvZEl/7GX4O+nTGLJJoP1iB/ASQlaYkkU3xQLT+r9BOO1LpjO/fbvIoWCxY5dzcPa4OJ+GXItko1e2BrW30skEMzHRGusl5xMoYbUjSbm6/CeFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545617; c=relaxed/simple;
	bh=zlMOkaW55Wb66ZAqUMFifodcdXXAMdzKlT7oh+mWeJQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=azUBQnB9dnXaVZk6Fg11aRNmETw22bZwpezGRYAA/6WPPhvXwN7Ml51Hm0Vt0lxikXe0j1qeCElRimUJ50HgUjj4gxlFDcXoS/qF4MXGsrUB4CBPOEvIX5xgzXbyN0elTsOPX0tfukkFewbVN+QTuYbjlnJT4V0m/QeS/cJwARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zt4sgAw3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zt4sgAw3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42c94e59b93so11218745e9.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545612; x=1726150412; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQuewzaNngjcDOOQ0Aow82vVC6J65OqAycs2DlUmkZo=;
        b=Zt4sgAw3ZmtstHYPGrRGwNVxcNtrCbQj/marxRit+NlF5L8h239WBS/G2V0S+mze4w
         tSH3iDpV2oZeXiUOoX8Fq8h/RRdGHaaEVAlP41gv4wjHMI1GoA8ok8VkysdVp+QYorrU
         axrfYDS+ALids/VSYnDaP+mxa94a7HuK9iA/dBgKlZ+eHC+9QohlHNqAaY111d0SFLwf
         Q1gYiPWsc5iH3QG+hMV+UvI84QUpMpijRhwMOlLOQrsdQjE4PoxWz0zte2LU0YemPp3E
         AekdXJ+jbsnbVphLQg9eDzQ+xMwa6vbWHSgJGfguZWnqFCMYgmUYn58GizXWaiZ2T3Sr
         f4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545612; x=1726150412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQuewzaNngjcDOOQ0Aow82vVC6J65OqAycs2DlUmkZo=;
        b=a5dvsHxovwgdt10nU6IZNzXHdzmJQqcULELx6ueI+Lw1aWq1LQ1wchCEsk4iMIdPHh
         DDzU325pWV6dRQxEnZFvPlLf0orvJ31w2yoxwM4gfUUDAA3BduPPPlOetFN1c2Ml4xqJ
         eIjFUINh7VlXiCh8Lor0dBfTPB/N5F5w255PD7ozBwg8r9tUXZaCZR4wDfz/bM8SMDCd
         bC0Wb3UFFit850lRx1L2y5NozzNGhnZesVSQ9/psSL3r1pkG08dFIlgh5JkIxrIztftM
         DqnuDkTIL5elhmuCNeN8iqRSszY+SpQV5TsBX9ty7d1T/ERCrfPUkal//Xf9rLOCswxA
         O+0g==
X-Gm-Message-State: AOJu0YwklTPIZxJOHWDurSpgbMRcy1wMH8utJrKNTQ0GnhPoXk9WkTzs
	rRYwi3ukE7CpZfhdeVSRwdiDdm8tM8D3pceyyQaGtC2euFDU5k9yz/I+gsFQVAU=
X-Google-Smtp-Source: AGHT+IEqMw+2kphBD8AL47tz8mEmZuHpdof+C2fJJPrSK7gGZlJt0fkH5qGDaTFGsntWoEZveuTOWw==
X-Received: by 2002:adf:a456:0:b0:374:c613:7c58 with SMTP id ffacd0b85a97d-3779bd185fbmr4162384f8f.29.1725545611138;
        Thu, 05 Sep 2024 07:13:31 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 00/13] ALSA: update sample rate definitions
Date: Thu, 05 Sep 2024 16:12:51 +0200
Message-Id: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGO82WYC/0XMywrCMBCF4Vcps3ZKMqSSuPI9xEUuUxvpRSZVl
 NJ3N7hxc+BbnH+DwpK5wKnZQPiVS17mCn1oIA5+vjHmVA2kyCinOvRj8agJydS1aDn5YKKyKRm
 op4dwn9+/4OVa3csy4ToI+3/mSFYTGXItKW1V51DjPchz5vUc/GfMQbiNywT7/gUSmCnRoAAAA
 A==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3160; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zlMOkaW55Wb66ZAqUMFifodcdXXAMdzKlT7oh+mWeJQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx9Rt27YuEl+t/28l1DzL0bq/aw0aPG+xyMs
 P3ISqYgUY+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fQAKCRDm/A8cN/La
 hX38D/9ovEPkT3Cdm6h/ix/ywvp24EQmKKZ3cy1CIVrIDMqy05UHAjwcsPllY7DezngTTiaeejA
 stPW/OsTKkDllAAbw8PX7q0eKTp0udn9BRQaYfKz9vSkDaXDgpM4f82Yj2mGwSzHtby0EY7WmO4
 CUYLtTavSyEtndrRnq056qUDZnwMSFHdRNLrMwkhHZPMOuMYcu9Fg/cdXVzopgFC0cPWcNXv+xt
 mxOsOvlwQNBbziHBZspOcvEpocfhL/1OAXurjQRtdYinwyg3tokeIlDFFZXe1szwSzOq3XrtLcE
 e4jcQi4cO4NHjcngVCHclnJtNMFNQIG5b54I8Fx3VjrqTmk7Ru/dUzqerln/WoUH3DYYFsiOsbg
 V6J1Lvbmq5pcFNKkm1R/w6gPmKAMrX68f4oXMz0Sn8n7YKng4GocbREm5LzIcqXF9vOki8GZUbg
 WJwskALFndic23zjavZZ2honWm+d8rZNqzJQHZbWslukrbpPTUEvorrajC0mS7jrf3BowWTslhS
 kjkNERBX8LTdPCbT09ll4l881blOSlxxz/rT/fUBMW5h2jexZ8YuRKisA77H+x8KeBAfTlXSN9o
 cR06agIcgoG8PusLU8buKcXLfDHfxQB8p6T2MRJOLRLkLFIAvhkteDdcDV1kIh7MK0m/JfGir2I
 O865q1eD0MuKh6Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.

It is follow-up on the series/discussion [0] about adding 128kHz for
spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
clean up the drivers that no longer require custom rules to allow these
rates.

Identifying these drivers is not straight forward, I tried my best but I
may have missed some. Those will continue to work anyway so it is not
critical. Some drivers using these rates have not been changed on
purpose. The reason for this may be:
* The driver used other uncommon rates that still don't have a definition
  so a custom rule is still required.
* The constraint structure is used in some other way by the driver and
  removing it would not help the readability or maintainability. This is
  the case the freescale asrc drivers for example.

There is one change per driver so, if there is a problem later on, it will
easier to properly add Fixes tag.

The series has been tested with
* ARM64 defconfig - spdif 128kHz at runtime.
* x86_64 allmodconfig - compile test only

Last, the change adding IEC958 definitions has been dropped for this
patchset and will be resent separately

[0]: https://lore.kernel.org/all/20240628122429.2018059-1-jbrunet@baylibre.com/

---
Jerome Brunet (13):
      ALSA: pcm: add more sample rate definitions
      ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
      ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
      ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
      ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
      ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
      ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
      ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l34: drop useless rate contraint
      ASoC: spdif: extend supported rates to 768kHz

 include/sound/pcm.h                  | 31 +++++++++++++++++--------------
 sound/core/pcm_native.c              |  6 +++---
 sound/pci/cmipci.c                   | 32 +++++++++-----------------------
 sound/pci/emu10k1/emupcm.c           | 31 +++++--------------------------
 sound/pci/rme9652/hdsp.c             | 18 ++++++------------
 sound/pci/rme9652/hdspm.c            | 16 +---------------
 sound/soc/codecs/cs35l34.c           | 21 ---------------------
 sound/soc/codecs/cs35l36.c           | 34 ++++++++++++----------------------
 sound/soc/codecs/cs35l41.c           | 34 +++++++++++-----------------------
 sound/soc/codecs/cs53l30.c           | 24 +++---------------------
 sound/soc/codecs/spdif_receiver.c    |  3 ++-
 sound/soc/codecs/spdif_transmitter.c |  3 ++-
 sound/soc/intel/avs/pcm.c            | 22 ++++++----------------
 sound/soc/qcom/qdsp6/q6asm-dai.c     | 31 ++++++++++---------------------
 sound/soc/sunxi/sun4i-codec.c        | 28 +++++++++-------------------
 15 files changed, 96 insertions(+), 238 deletions(-)
---
base-commit: 785f4052380684dbcc156203c537c799e2f4be09
change-id: 20240905-alsa-12-24-128-8edab4c08dd4

Best regards,
-- 
Jerome

