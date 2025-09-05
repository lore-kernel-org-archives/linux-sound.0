Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E382BDC35
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063591; cv=none; b=iouA/r2O8+H2jFR+YBiiq+VD4TnxLWQksfThYnMfjXw8EcF3deegrupk73sjvkvV1o9MKFI8b5aatINI95vBzKxQpjaN0AUU0fnfeooNR/tDtK7493ThTGBlRspIg91s2SdcBURkHqZCKV0Nm24nRMRgqWCWwXO4qWjqr0hiYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063591; c=relaxed/simple;
	bh=Ob0Fwyn083oNBTp1tDIB225mmugIdLq/N/S0ey5N/DQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DNxSgNSeWFSOb3sdtnNclAGxwICHIR3LRxL8LlWxw4GOHt/Ih5aO60VwAyEd5XjDBzeqrGV92FUnJdEpUqiFavPMkcvAG2nwSdX/w92ftx8JSkHmGcybCldm/Pv3zGasaAEXaxZa/Nz8apXG8e+TdX/UUZOJQj7E5U12x/jtHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VUGAzmMO; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VUGAzmMO"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3dabec38299so1212548f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063587; x=1757668387; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sBSpQ8ZRm6jb4tNdcmggvd2P095dWooz1uDNAN/Fzc4=;
        b=VUGAzmMOX1QMo4bTsR3NdFIzlE1CKGPe6976H4T7ohqhdSEbZykmlt/lPX5f3CtEWr
         iR81vaa4qpvDDcfrVlE7gCTxl5E4P5MnermkYdaR/uR5H72kkAql4VIR8aj/X4NTFgjD
         nZxLKlvU6WSzEGByYo6thAcpp4O3sIKwm7S+3rNtnvIj9qnXaUZmWxoffNMx5B+J+iuL
         IvJRc9YhIzLCo9Nr07hcV6kUzfJ+3cbnQK2iDhUTMoBDfey67zApP1MSEpJV0CqSKOGl
         AI7KARZX/bLL93lzpB8OQVJKFQBXWMiBSZjF1WrCbPAuFgtmtmKA3pFLDYwPpv963dRb
         SXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063587; x=1757668387;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBSpQ8ZRm6jb4tNdcmggvd2P095dWooz1uDNAN/Fzc4=;
        b=TK/xwg8hb+1+ppdeWAIn10FgVV/l39YTyGgh7lvTZv17ZHk6NQw1tteiG2+c20Bbp5
         JEN9WArn06oaHSDlzG66r79C869aWA2z/+htyoshoCSNym9v8u5uA34+FKE9f/Bq55ks
         sjybMsF69vCJ1m+Qw2Ia4CF3XPA922MUweuisHeFZtQMXM3OI6yhNlLNcSyUOtr4RFp5
         ieaWLfABqeTWdVdDnqAodkYQrNLezD5mH1My9T7NSd64KRCpedfMIA2ZqafvPi0CFrxM
         W8n4DfCouIu5gUNqW4VcYvHDZ/Ble1sfae9A74E5ZdBF8m1+qq1pdajjAn5fYjxQvkCd
         isuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv1wfJrJ5r97Q5BOqdOJhh94vQhVmB9ZgZDp0xOLyYTUXqCFwsA7qtkpzgi33YySww5u/5fyxIssXuSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+KjPKAtTDlZEWjmKhDUzbq9dSWfYNRe4Gm+k2Vl7ueJXZ3NL
	3uTARDaApaQNGu64ClqldUTPvL/1CJAn0n6F4VeuviriLZGyzfm5Aoz/T9Wz9eiCa+GbymK2R8h
	Ot3lAW6gCrQqM8MjpQQ==
X-Google-Smtp-Source: AGHT+IEwNpYtanMPGC3mKG9+dfs7GkoY0bb6zXivMXVtiUjkjgaYNYh142quSHeIfKG42UCVPz8Dde6RKOCNb/g=
X-Received: from wrjo18.prod.google.com ([2002:adf:cf12:0:b0:3d9:b79f:e8b7])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2486:b0:3e2:804b:bfe9 with SMTP id ffacd0b85a97d-3e2805b0742mr2921328f8f.15.1757063586869;
 Fri, 05 Sep 2025 02:13:06 -0700 (PDT)
Date: Fri,  5 Sep 2025 10:12:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905091301.2711705-1-verhaegen@google.com>
Subject: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
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

The current compress offload timestamping API relies on struct
snd_compr_tstamp, whose cumulative counters like copied_total are
defined as __u32. On long-running high-resolution audio streams, these
32-bit counters can overflow, causing incorrect availability
calculations.

This patch series transitions to a 64-bit safe API to solve the problem
while maintaining perfect backward compatibility with the existing UAPI.
The pointer operation is reworked to use a new timestamp struct with
64-bit fields for the cumulative counters, named snd_compr_tstamp64.
ASoC drivers are updated to use the 64-bit structures. Corresponding
ioctls are added to expose them to user-space.

The series is structured as follows:

Patch 1: Updates the pointer op, refactors the core logic and ASoC
drivers to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API.

Thanks,
Joris (George) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---
Changes in v2:
  - Corrected author and Signed-off-by to be consistent (Mark Brown).
Changes in v3:
  - Rework pointer op to return 64-bit timestamp, rather than adding a
    parallel pointer64 op (Charles Keepax, Takashi Iwai, Vinod Koul)
  - Bump the protocol version for ABI change (Takashi Iwai)
  -Fix linker error on Intel Atom (lkp@intel.com)
  -Rebase on latest for-next sound tree (Takashi Iwai)
  -Avoid changing return error code for ioctl (internal)
  -ASoC: Replace u64 % u32 by do_div(u64, u32) (internal)
  -ASoC: sprd: change current_data_offset to u64 (internal)
Changes in v4:
  -Fix compiler error on Intel AVS (lkp@intel.com)
Changes in v5:
  -Revert formatting change in compress_offload.c (Vinod Koul)

Joris Verhaegen (3):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl

 include/sound/compress_driver.h               |  2 +-
 include/sound/soc-component.h                 |  4 +-
 include/sound/soc-dai.h                       |  7 +-
 include/uapi/sound/compress_offload.h         | 35 ++++++-
 sound/core/compress_offload.c                 | 98 +++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |  4 +-
 sound/soc/codecs/wm_adsp.h                    |  2 +-
 .../intel/atom/sst-mfld-platform-compress.c   | 12 ++-
 sound/soc/intel/atom/sst-mfld-platform.h      |  2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |  9 +-
 sound/soc/intel/avs/probes.c                  |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 26 +++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              | 26 +++--
 sound/soc/soc-component.c                     |  2 +-
 sound/soc/soc-compress.c                      |  2 +-
 sound/soc/soc-dai.c                           |  2 +-
 sound/soc/sof/amd/acp-probes.c                |  2 +-
 sound/soc/sof/compress.c                      |  2 +-
 sound/soc/sof/intel/hda-probes.c              |  2 +-
 sound/soc/sof/sof-client-probes.c             |  2 +-
 sound/soc/sof/sof-client-probes.h             |  4 +-
 sound/soc/sprd/sprd-pcm-compress.c            |  6 +-
 sound/soc/sprd/sprd-pcm-dma.h                 |  4 +-
 sound/soc/uniphier/aio-compress.c             |  2 +-
 24 files changed, 172 insertions(+), 87 deletions(-)

-- 
2.51.0.355.g5224444f11-goog

