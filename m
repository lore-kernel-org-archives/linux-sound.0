Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B124217F33
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443783; cv=none; b=TKKFNwEF+tPIgsPjdZPypN2bG0wUdTAvsJWEghVLBwbif4LzP3TwB7dLmzpJKnMTlvjYYLjdXgGM/FHnf48CwhLKBHKx4pRjHSySHxb9OjF1drA03IOGs0OvrLr3RaUjR4C0BgCOTWo0Z72MDu71kot+StF//aP7S4HKxJKDNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443783; c=relaxed/simple;
	bh=iA/hyGhetbS2gRaULrRQIK8ommfvKWHeynd7Bi9FakU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MgqCQThL+47veiSV49Ap1gNxDSJbFsWN2x18VL0CSbj//u9RuXWV6snrvBh4d1viV34vSjgxQ00wgAUGGvON1hdjA7/L0zizTWh/anXLLmhg17LGQO3lB1n9Guj23JFou2JAuj4dm4OolyGo5EvaBpHQNukcBxIvA8f+r6fqIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCHtdZoM; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCHtdZoM"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a58939191eso840526f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753443779; x=1754048579; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fs4WIMRpWwIcuHXQawsP7PuMKJnOQxUvgvwqbySpiXk=;
        b=CCHtdZoMkBcEyprUHkiKLDUvQsHyE21ok/Jumk96Ll5WuWWtuYXsDF3f8TjytolzsO
         T+0JuYuoBtsrxkXXn5RgcONUwz+eWASXrfJj+7VF4Ud1oRoiq7QCyXGggd+UqvB7ddpB
         VhvuCImdBAn4Q6I/Syi1AnZHac1TeSzVntsiUOiCRXGhyhWn2E2No/iK9dN34oTqJBnc
         /whatFaVC8w2UV8Xge2R2dv6OZxjuBJE7vQ/YZHkAgQhkQjhmyaXcG5h7ZoLOTIGpiHg
         8v++fKvCeJWac2TgTTVBfXjL4XviRmGbE9x7fbuEPrJmvXGhc+Z2eRMeI/EQP7g17tC0
         O8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443779; x=1754048579;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fs4WIMRpWwIcuHXQawsP7PuMKJnOQxUvgvwqbySpiXk=;
        b=DYRn1EVcpQLiwzBQiTMAomDW2/KF6+uMZlj2wnz+QJjvRVIu1DEy90uyrNyaX7OV/U
         H7Y/GXcJl1G41Vq60aM9wrEVXHSV3vLaf9BO7ExK0tRPniBhqtg/HIIzLJjF9bFCMsDq
         ntbx85O9fF1fCfBnC+drHMgdLF5lmKp01JipekLIG0bcOiPDQrlzCykcoJq4dwx1hK57
         s0bSd8iln7E0+WM9kQR0oTL4OBdxdDWu7wmV9FQDefxhJ64hDHDpKghJ+kZ6BIiJ/zJq
         LFPsvtr5PNOPGu1C2omi6MQktzLbljDxJhFXqw7Vj3XyCsRVIrUGHC7fiMVPQx5j1KLu
         Tgjw==
X-Forwarded-Encrypted: i=1; AJvYcCV8cBz7rGgXAjTE6yJX+PHxZveM91m9qosQy5/ellfwfqMJe21Z3ujCu2JpOA3HgOfjHDXIB4QpPHTjhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqPbieL/reHwmVdARXy/pCI68CXMn8WLcPCSXlIHvtNg12LI1
	A65nMZZw4fDxFJydTA2gEppMv7okWm0fZm/iVH9yqYC1IHcZfJHmI9TAn3yVVKmp1gMyKySZLcc
	KKkQ4100Oq6IBwJzi5Q==
X-Google-Smtp-Source: AGHT+IEVYehtHEprrhiAHZ95g+2gC92ze98k0Qt+xZ5aG3XGkuNcSUyzwUUV+kZ0DY9YfP8j0y302pUuBMzx3Ko=
X-Received: from wrs26.prod.google.com ([2002:a05:6000:65a:b0:3a4:eecf:ec38])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2905:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3b776688508mr1531386f8f.56.1753443779538;
 Fri, 25 Jul 2025 04:42:59 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:42:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250725114249.2086974-1-verhaegen@google.com>
Subject: [PATCH v3 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
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

Joris Verhaegen (3):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl

 include/sound/compress_driver.h               |   2 +-
 include/sound/soc-component.h                 |   4 +-
 include/sound/soc-dai.h                       |   7 +-
 include/uapi/sound/compress_offload.h         |  35 +++++-
 sound/core/compress_offload.c                 | 100 ++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |   4 +-
 sound/soc/codecs/wm_adsp.h                    |   2 +-
 .../intel/atom/sst-mfld-platform-compress.c   |  12 ++-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |   9 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  26 +++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  26 +++--
 sound/soc/soc-component.c                     |   2 +-
 sound/soc/soc-compress.c                      |   2 +-
 sound/soc/soc-dai.c                           |   2 +-
 sound/soc/sof/compress.c                      |   2 +-
 sound/soc/sprd/sprd-pcm-compress.c            |   6 +-
 sound/soc/sprd/sprd-pcm-dma.h                 |   4 +-
 sound/soc/uniphier/aio-compress.c             |   2 +-
 19 files changed, 167 insertions(+), 82 deletions(-)

-- 
2.50.1.470.g6ba607880d-goog

