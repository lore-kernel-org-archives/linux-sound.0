Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097EA20298D
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222333; cv=none; b=N2imRYABQb3MazuuL93KQpaqnCWMQ43RMhAbg2WiMXxNBtUR1w/+nIj/MRcgvOv45ontjBUA6hRm28rO+bwQJy5jv188kIv+ar/LABOCfmfJ+sh/4cuFkR16aKQtUgH9A05tZ8eNDNlfhhlSlxa2bzLuhpdR9nfF/E8kdjXs/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222333; c=relaxed/simple;
	bh=n6dLC10d+kitIccOY3VPfg3CmhHlP4Yq5/nhKOKyNeY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XiHs1hBhYBwovVPEV3R/N2j6NTcD9d1nHS3d1X3fgICjpyjXBVHNOOHQylp+a9fqQOS7rxbLRw7elXlNooXnWzHzxZOZn1XCtEDzI7ZS6/iiHnmybGGY4b+uqwSOyosZwxWIbwlyQYsWYDjlvKHSgnzEO91zuHB5Zvad47Zeg4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMq5odH+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMq5odH+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so9967175e9.3
        for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222330; x=1752827130; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=;
        b=oMq5odH+MeS5IXn6pT2asCOx4XnablO/iWKRoL2gkg9eZd+x/bf6+JtJ8EPZumsrjf
         ppHAuHbDv/kZNyffFQRnsvl0oQ1pHWHuSR9n72nVSYdWBUlEbuZgyUgXNlYl4kgCCJt/
         9nSQZVbaa/IR8n8/yoUNcPy2U8sPDZ80+ExZhMUnPhDXWLbPUrAqXy4g4YZoZAm8rZgo
         tBl8MoY6AISztCmGOsR9Mnu30eJgkt6E0e6fiNcNSbZI5wBIWPCQupoaY5iIhLibu511
         39G/zeg2vjvNQ+Nyz1vsIb+9ZPMNjJiu2GqYO9K8FUBkiTukQY8PSV6kQdvhIcqHSl0Q
         y9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222330; x=1752827130;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=;
        b=CWgM61N8B1qQPnTGIYP5+MkPKc4h9UW5q86pkwds2mxe4OyKspgfKBCImrmShmYilm
         oV1aVNVT6Y0Kkr5Iv7wH6PUhfG/46XXXHaYLcpXRdcD8PzKJpAF92AMG3+BwBoRiykMY
         ogXknV4B8WhId/nToxlBQ0VcFRmolIyknL/BdTYcHAi+hEvcB4SKlDXTZ6HtZaYZyZAY
         ys33ZdrY5KkBmoK4xfBq1Zr5RP7supRVCjjQ+SRs0701MOYYlXlU5IcmFZdU8u+pWaSV
         DpB6/Jv8sjYCujKCkNbUeekGxesQBuLD8D3uiHbWoU53bXa6Ij3N1PIqH/Ba+2jEJrOL
         FYrg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zHuaPacwHKsC6tINi8dysWH3xIlCKLikNXeP7+Y0GY3j0POPxtpq4bbkqyFAE62kAXEFeg/DPCJ2/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RdD7nRhKp/ZvnXMjlabcPGJyrTXfgXFKkv+kLQTy3+QvZPV+
	ew+UDF/1T5H8yfgjEh+cSc89S+ntpTb6rXlmfvHj9nnw9BRIER2NQiwcOeYyFwvNPPKj1zAawba
	qpK+MQVTBmdbldxyTiQ==
X-Google-Smtp-Source: AGHT+IEnBWvD3yYNtRkBdA6/Yih7Va/FMD2Vu65hycrlK6/K05a3ktnefi7uyOtrMkeRanxj4iTfqvVTmG4Ou5k=
X-Received: from wmbel6.prod.google.com ([2002:a05:600c:3e06:b0:451:edc8:7816])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3491:b0:453:8a62:df34 with SMTP id 5b1f17b1804b1-454fe0f9436mr16161995e9.21.1752222330362;
 Fri, 11 Jul 2025 01:25:30 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:24:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711082441.4193295-1-verhaegen@google.com>
Subject: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
From: George Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Joris Verhaegen <verhaegen@google.com>, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Joris Verhaegen <verhaegen@google.com>

The current compress offload timestamping API relies on
struct snd_compr_tstamp, whose cumulative counters like
copied_total are defined as __u32. On long-running high-resolution
audio streams, these 32-bit counters can overflow,
causing incorrect availability calculations.

This patch series introduces a parallel, 64-bit safe API to solve
this problem while maintaining perfect backward compatibility with the
existing UAPI. A new pointer64 operation and corresponding ioctls
are added to allow the kernel to track counters using u64 and expose
these full-width values to user-space.

The series is structured as follows:

Patch 1: Introduces the new internal pointer64 op, refactors the
core logic to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

Patch 4: Implements the new .pointer64 operation in various ASoC
drivers that support compress offload.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API, and no regressions were observed
when using the legacy API.

Thanks,
George (Joris) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---

Joris Verhaegen (4):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
  ASoC: codecs: Implement 64-bit pointer operation

 include/sound/compress_driver.h               |   3 +
 include/sound/soc-component.h                 |   5 +
 include/sound/soc-dai.h                       |   6 +
 include/uapi/sound/compress_offload.h         |  32 +++
 sound/core/compress_offload.c                 | 210 ++++++++++++++----
 sound/soc/codecs/cs47l15.c                    |   1 +
 sound/soc/codecs/cs47l24.c                    |   1 +
 sound/soc/codecs/cs47l35.c                    |   1 +
 sound/soc/codecs/cs47l85.c                    |   1 +
 sound/soc/codecs/cs47l90.c                    |   1 +
 sound/soc/codecs/cs47l92.c                    |   1 +
 sound/soc/codecs/wm5102.c                     |   1 +
 sound/soc/codecs/wm5110.c                     |   1 +
 sound/soc/codecs/wm_adsp.c                    |  53 ++++-
 sound/soc/codecs/wm_adsp.h                    |   3 +
 .../intel/atom/sst-mfld-platform-compress.c   |  17 +-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +
 sound/soc/intel/atom/sst/sst_drv_interface.c  |  43 +++-
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  41 +++-
 sound/soc/soc-component.c                     |  20 ++
 sound/soc/soc-compress.c                      |  21 ++
 sound/soc/soc-dai.c                           |  14 ++
 sound/soc/sof/compress.c                      |  44 +++-
 sound/soc/sprd/sprd-pcm-compress.c            |  28 ++-
 sound/soc/sprd/sprd-pcm-dma.h                 |   2 +-
 sound/soc/uniphier/aio-compress.c             |  40 +++-
 26 files changed, 503 insertions(+), 89 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

