Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64373ADB89
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881879; cv=none; b=lr//fcwaBc+U53U6ELv7P6WT/ixtRAZv/NS1tOtTs+sHrZYdF+cvzlSbKcZeWYhJnJqj2KDGc26qw4InNmgCTxBEb7tmQhszOEzzAKPRrJjGZS6drhwPa/vTDuAhONDvuQuNelAB/ynQiyElMtfJ96qcwWDVkA/EBygBJYUt4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881879; c=relaxed/simple;
	bh=lYJGf+muHCD1eVAUKTuW/9iJgLeoqKbg+w62GkKkB7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ES3IN6tdylvFOm5/SVq/tKrIdksLrH1GsuWm5TYKk8xmmV0FJZxchsC1RMGYe8AnSe3WJWgt9yRLeJ3HATrPr/xZBBp2/JlUccMHUZjIkiMZeJjpveCHTui3uPewz6fH7rCj55UzsIpLTyWvqDwx9iVAAtgWE08HixAmm0CImMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qbw9E+Qs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qbw9E+Qs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso2175756b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 01:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881877; x=1792486677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdgLBlwXA+05WisR6qNktOAyZ+0TTRkW7hNmWtduX/s=;
        b=Qbw9E+QsqoWh1vx4q4VS45rRwAFRPUzT4Cgr2UQs3iHXu7DjrVCQAl2zzDuAm3y7Yi
         QzWlYFuTFVYwJtfScy6VYihks+t6/K1IrrOKbhOe77G2y1uBFBk8aadqtObx0WYCe1k0
         9yu0udQhn21Ky3bcxn63/wTPFrl51i+f/tbiGANGIlFVIhBPiCiKidg2KpuE0eB3ENWo
         9aGrNg6SIdgwZzxMb8injd2/V8QaECeE3iCv/mOFUsrTD5DLWrRdNxRNqktD+OXvPHac
         3KvVbYmczBI3hy0cfYEv9i5k9vcOpENh+j3SpIeKUP60eprV7M8SYWV7P4iFSghywjO6
         y60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881877; x=1792486677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdgLBlwXA+05WisR6qNktOAyZ+0TTRkW7hNmWtduX/s=;
        b=DaFD+W5zME8vvCmR7Wm0kQKx9Z6vtvijHqEh/uYvwyPXlkYsmZoFzWv6KyZqt0WCXx
         ivzU1s8NDZp+xZG7Gq5/I1ly8PW32EaSidm1ZkJ2620qcT0B+qnPijY/Ejt3IcOwOUi6
         L6F2c/JKQwanqWEMY1kEXT6u4ET9m/DhPFNvWAjRPcFrrUn/lv3VDWOA3ECfKKf3m9wI
         g2OWpSqO289R7uFWiaT2r+IupL3FP4XWKaAT4uUvNfsoYdm5W9w5WJ78ZP5RLl5V3p2d
         rqKd3QZa2qcjw7Xpe1sR64WRM4MkSqX+hPWiCp4Y1+pAnyCXCtJU0BGriBPKmk+ddNJ8
         pOIw==
X-Forwarded-Encrypted: i=1; AKwUvBxm3PHOoZAXNavYCePSNF3ovi4W5a63cCYUtrJYxsH4qvZRahfrNbs5EvBwip+DKVcdEpu9ChOMMjJG/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXmSVoZt3/JRcUBCvr2sjgoXI1220TFXX4D5u1IKYqLaB+R+EA
	oiTNyrQX0KqYOx4OR5ASGN+TTkNs1e+7G41h6rK4uxSYlE0PYlVw5gtW
X-Gm-Gg: AYBFou3Z+7+NizpavCJbp6UDkiIbk6vRNFB1rrkTYukGL8+uMiviMhtqOH2JIr+tx97
	qxtfeEXRCMbxCXuxNxxpdeJ2Lp3i1oNEMO2Apz4stbtxEKupYBeJ5MEPR4e7Z9zM403VAIZV4YV
	OumcHdwJGvP1RqZEDkb8DstLskEGBygQntYyU/YcHcPupw0+ZO/jTvwIcv7TQ5GGYg+TDLyqNA3
	eOSn5JLxV99CcJEeh77yudJTc9C7BDpbBRWBXZJOjdLMG4mGlJw8pcBz5GZtWKXfCeNfkGZ3PFs
	7QH2tXbHZ/j3wQ+kIOQsQjB6E435R7SLhzPthOGqOe25scgsM9bQo4Tlo5dB3S0Kj2RTAzb2I3+
	NX9NJkZ9kcYqqNuNKYxJhyutWjo4Xj3+i/2H2yIcIEFAVqXaa/cNFL2tNHvaal6Hb37d5zQixI4
	Vhd42glcDTTM/I2jMlOHCQ2J49HZeGsnF29WQhGmlDJX9Gfswlxf5agdr9oYvUNTw+VuYwlPWzK
	OOGXRKGffDJjUVO6snv7gmJwOKq3HnsSNdDvRM1tb9SUXPH0aNUNKXvbTGQw/fJ+MC3ipoNgP/a
	B7fDoeCn94qgqHVI
X-Received: by 2002:a05:6a21:b98:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e16be94558mr8871796637.50.1791881876834;
        Tue, 13 Oct 2026 01:57:56 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6063d31dcsm1838592a12.3.2026.10.13.01.57.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:57:56 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>
Subject: [PATCH v3 0/5] ALSA: virtio: Fix request lifetime and error recovery
Date: Tue, 13 Oct 2026 17:57:47 +0900
Message-ID: <cover.1791881787.git.mynameisjune111@gmail.com>
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

Changes since v2, following the Sashiko AI review:
- Patch 2 protects all stopped-state accesses with vss->lock, including
  hw_params, prepare, open, STOP and sync_stop completion. The RELEASE
  decision and stopped=true transition now share a critical section.
  Sleeping operations remain outside the spinlock.
- Patch 5 aligns every DMA region for both cache maintenance and typed
  CPU accesses, and removes the initial +1 offset. This handles coherent
  systems where dma_get_cache_alignment() returns 1, as well as odd
  region lengths that could otherwise misalign later payloads.
- Patches 1, 3 and 4 are unchanged.

Validation of the final v3 source:
- ARM64 W=1 module build and ARM32 CONFIG_MMU=n driver object build.
- Source-extracted ASan/UBSan PCM, control, reset, ACK and DMA lifetime
  regressions on macOS arm64. The v2 control allocator produces UBSan
  misalignment diagnostics; the v3 allocator passes typed header and
  request/response integer64 accesses with DMA alignments 1, 2, 4, 8,
  32, 64 and 128.
- Deterministic stopped-state lock instrumentation catches unlocked v2
  accesses and passes 73 lifecycle assertions for v3. It covers ACK
  failure, RELEASE failure/retry and ACK during RELEASE, and checks that
  blocking operations do not run with the spinlock held.

The stopped-state test instruments extracted source; it is not KCSAN or
an actual threaded kernel race test. NOMMU was compiled, not booted.
Physical non-coherent DMA hardware and host microphone behavior were
not tested by these regressions. The QEMU ARM64 KASAN fault/recovery runs
reported in v2 have not been rerun for these v3 changes.

Reproducer source and instructions:
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/3ee5c7c1e864dae50a127b0a25cd122532daa6de

Based on sound.git for-next commit
8d70e364e866bdfca81eee24d0688fac9472cfb9.

AI assistance was used for code changes, tests, review and patch text.
Assisted-by trailers are included. Sashiko's findings were checked against
the driver and covered by regressions before incorporating the fixes.

Previous series Message-ID:
<cover.1791877396.git.mynameisjune111@gmail.com>

Joonho Lee (5):
  ALSA: virtio: Propagate PCM send failures through ACK
  ALSA: virtio: Recover PCM state after a failed start
  ALSA: virtio: Retain queued messages through device reset
  ALSA: virtio: Keep PCM DMA buffers alive through device ownership
  ALSA: virtio: Keep control payloads alive through DMA completion

 sound/virtio/virtio_card.c    |  44 ++++-
 sound/virtio/virtio_card.h    |   2 +
 sound/virtio/virtio_ctl_msg.c | 307 +++++++++++++++++++++++++++-------
 sound/virtio/virtio_ctl_msg.h |  28 +++-
 sound/virtio/virtio_kctl.c    | 104 ++++++------
 sound/virtio/virtio_pcm.h     |  17 +-
 sound/virtio/virtio_pcm_msg.c | 295 +++++++++++++++++++++++++++++---
 sound/virtio/virtio_pcm_ops.c | 165 +++++++++++++++---
 8 files changed, 798 insertions(+), 164 deletions(-)


base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
-- 
2.54.0 (Apple Git-157)

