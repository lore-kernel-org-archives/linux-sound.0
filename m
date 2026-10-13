Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA2A39FCD7
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877438; cv=none; b=OL4ukdRK5ZsMDaXNDpEH0O06+qB5nxUW4B8HZWnaz3WT9W1AtFK3tH/15VkRUcrwom+M7OJB9fh9Nz4j87aIoORoYKYdZJKlE5sSCCsL0MuicSx6pRFpzgv/yOuorQgnMRTvWSNQbu+hVzfwhyAbqx9gnk1MmAqVQNPrhm8AjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877438; c=relaxed/simple;
	bh=DgZc9TaOzYmHYSvKJq23geFrfrxuctba2uQ61M8yVKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSLnf/5rut0fYdekKFQrQ7Kz/aNvX58W+flXwgaBs2fKdYKz93Qe6h1Gn+q/PjZjODcO2CEREjzUt9VTQh1EBNG8dSdMqVO4DfoqdgstT8fGiWg3uaPWrRtjP/1E0IKbpPBtnRhCE2+VNiGYzGh4PIFe50q70IxcYFPqGDb53kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWpy+7MW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWpy+7MW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1592819a91.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877437; x=1792482237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZK1NeHdcHM35sHEDjJ2Bqzc2/PgsQjYGP/lMmIlnTdw=;
        b=PWpy+7MW2HrjjKxdUyB5uzBtTmBE1oKDszK/ZLHgHXbiymkPOYdUtYijfPYzzZzcxs
         cBWTU52I+vqE2ztG7NkU8htO0t3ZaeLXkv94MVB4QPT+L8eorOJYeyMjciZB8a11XgiU
         u2rdJinZ9+RUxaUlsaejk5BRTdADTWIrzCfbVH7s1BBjT7CLc27tNmdsK2n4zjkSsEl2
         ySfdqISMbHfqd2Vt85EMpujbjDRoVw9IUWAHO7MB4h/yAiSfM+MVUsAcLoZeafBwVGlE
         wY9bHrT7XP1IJ7H1jsdMM5uy29TMEJenzL/7G+4Fe9mVqbrwELnHQwRcj08LYj5TlEti
         B2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877437; x=1792482237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZK1NeHdcHM35sHEDjJ2Bqzc2/PgsQjYGP/lMmIlnTdw=;
        b=XpkqBXUmiu2bPhdqBarq1gDjYrfCNKYkq1YWrL/DdgTLGc1f3XG86jPZCVnQaXsFVV
         5BHU7RVhdGGrZmErUIBO0bGCsqLxLgI36UPkfV3Dgjro2QxLAa542cjhtA7z/OYyLSdH
         B/VElqEqbpbWL3EEY5s+jyagqhGKKeo+m9nMWxSzFX+XELnWlxOJHPqfHMmIaaElU+BV
         kl3zoWOm8az1NgKQLp9oPry4KBXzbbBqr9ElSyAjwdog43A5Xyp3R15kEw9VDY50FLT4
         DnL+xUDT05iU2Cza8i1U5NtFAq2j6LLmKpIsS7UcnNF8OcvwvA57uR6wTsZnibv0SqXH
         hSBg==
X-Forwarded-Encrypted: i=1; AKwUvBxUyZ9F6z760am2gen1Fm4ayiczbb51/dblLzCk43W9obX4oOtl2iYKHt69+Jzoui/qUAEc/Qu1+pxP0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMptssCReacmeQndh9GerpMui8h/dL2wHShgv93Tof9Kle+jOn
	vryrhd88DYEY+FGjBuVhYQLjmrVkkngViwYFIzGLA3RX/NZmKkIXmyDP
X-Gm-Gg: AYBFou0J04zuqn0cZUvPZr9vi7Bmz1oVr01wBKdd1zPQJouOGQ5SwLkEuITBZAtyyTW
	JCxJZG7IdoxcR2QRzkKIZfCXc4i8R29jH4jw+HamdSvanC07LfxbFfmcfQllQzXTaCpymOomzdw
	tcRfFZRWILGGpW9um9JiOhHRB4oNFrd814bfYpOoIiveBd76/NlTUD0WuDiwhZmnYS2v8MOyAWI
	RAfgntNc/QxzhIOo4UhpNc7oKhQ6XWBL7rTzkblOX+aIjbR4Qtd2TMtfoLuSmQhuuuv7BjidO9y
	TbGwUcfpiOeN0MDhvfOJXWqne01UyCPy28DO3eW5hE/5W5Jb5v+lWZr+KmCpGM/tPxVR5b03Jz0
	6JvIY+DQi+y59DPOR+Z6RuVdIZ4w39e+ZFfghsf9F/Bc4m+iBAOzQrGgAULbZyWIE4dSo/O3qNs
	4MwSktaX7Zz+6l8d5sIczRnQI/dWcsMcdu21wwZVurNe5/FSliVb1v8Ay/EZ9gav4CBYRrzAhJy
	DprdhrNkyM7/wafNcRq/tGpS700jhTXVsmi4sYtgicyxDFDdaeUXdJZxJ1FPU+/MZS0qwmVpCqA
	WKNqHnNDWwCJzcQh
X-Received: by 2002:a17:90b:4b:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3ab3a9a0c59mr6091973a91.16.1791877436619;
        Tue, 13 Oct 2026 00:43:56 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm20552825a91.4.2026.10.13.00.43.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:43:56 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2 0/5] ALSA: virtio: Fix request lifetime and error recovery
Date: Tue, 13 Oct 2026 16:43:45 +0900
Message-ID: <cover.1791877396.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed PCM start or a timed-out request can leave virtio-snd messages
owned by the device after the caller returns. Retrying can then reuse
pending messages, and freeing ALSA or control buffers can leave their
addresses in a virtqueue.

This series fixes enqueue-error recovery and keeps the memory referenced
by outstanding requests alive until completion or device reset. Reset
also detaches unused descriptors before deleting the queues, releasing
their DMA mappings and cancelling PCM messages without reporting them
as completed audio.

Changes since v1, following the Sashiko AI review:
- Patch 1 propagates enqueue failures through ACK. Indirect PCM state is
  committed only on success; a failed transfer stops the stream and
  returns -EPIPE rather than allowing an out-of-sync retry.
- Patch 2 is unchanged.
- Patch 3 detaches unused descriptors on all queues after reset and
  balances PCM cancellation and control-message references.
- Patch 4 supports NOMMU with an owned, zeroed buffer instead of rejecting
  an ordinary kmalloc-backed ALSA buffer. Capture copies are bounded and
  disabled once the stream stops.
- Patch 5 separates CPU metadata from DMA storage and aligns each DMA
  region to dma_get_cache_alignment(). Control-send cleanup also uses
  explicit, balanced locking instead of mixing scoped guards and gotos.

Validation of the final source:
- Source-extracted ASan/UBSan regressions on macOS arm64 and Linux arm64,
  including expected failures on the v1 ACK and NOMMU implementations.
- ARM64 W=1 module builds at all five patch steps, plus an ARM32
  CONFIG_MMU=n driver object build of the final source.
- QEMU ARM64 KASAN tests with delayed PCM completion past hw_free,
  delayed PCM_INFO completion after timeout, and reset with pending
  control requests. Each case includes a subsequent recovery operation.

The QEMU tests use a synthetic audio backend; they do not validate a host
microphone. NOMMU coverage is a compile and source-extracted test, not a
booted NOMMU guest. Cache-alignment checks are not a physical
non-coherent DMA hardware test.

Reproducer source and instructions, pinned to the tested revision:
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/ef97b69baea51d952ddd7c329a1894150f41849e

The reproducer currently obtains the same final driver source by applying
the archived v1 patches plus review-v2.diff. Its full kernel/QEMU rebuild
recipe has not been rerun end to end; the reported runtime tests used
rebuilt candidate modules with the existing matching KASAN kernel image.

Based on sound.git for-next commit
8d70e364e866bdfca81eee24d0688fac9472cfb9.

AI assistance was used for code changes, test harnesses, review, and patch
text. The Sashiko findings were checked against the driver and reproduced
where applicable before incorporating the fixes. Assisted-by trailers are
included in the patches.

Previous series Message-ID:
<cover.1791867377.git.mynameisjune111@gmail.com>

Joonho Lee (5):
  ALSA: virtio: Propagate PCM send failures through ACK
  ALSA: virtio: Recover PCM state after a failed start
  ALSA: virtio: Retain queued messages through device reset
  ALSA: virtio: Keep PCM DMA buffers alive through device ownership
  ALSA: virtio: Keep control payloads alive through DMA completion

 sound/virtio/virtio_card.c    |  44 ++++-
 sound/virtio/virtio_card.h    |   2 +
 sound/virtio/virtio_ctl_msg.c | 305 +++++++++++++++++++++++++++-------
 sound/virtio/virtio_ctl_msg.h |  28 +++-
 sound/virtio/virtio_kctl.c    | 104 ++++++------
 sound/virtio/virtio_pcm.h     |  13 ++
 sound/virtio/virtio_pcm_msg.c | 295 +++++++++++++++++++++++++++++---
 sound/virtio/virtio_pcm_ops.c | 147 +++++++++++++---
 8 files changed, 780 insertions(+), 158 deletions(-)


base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
-- 
2.54.0 (Apple Git-157)

