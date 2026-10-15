Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714D248880
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 00:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024567; cv=none; b=ulSm4VGkpy5mRcXi4ssdJBLR+ieD/3ScXt5ekGFA6Y0PWHmYK5Lmg5rQOCB238NqkZhnjxG1AxzzIT+LnS7yYr8WIV+bdebq7hbwO0uiRjft6lo/3uteFUqsf/VFjm9zUNi358j25390j28HXsn8pyeQbWXXeVMAJQMF1xQrw40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024567; c=relaxed/simple;
	bh=tSPi96q0gKsSRiasC6iBV/3WZ9GHJV0D/I9hhkAMllE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=goZV+qz7g7E9KK3hYbHJn/C7aSZgMhXg7cn6H1vN09ZJMfMzRlrrNlBVGGsgL0P3Pq02J2APT3sf3lGNkXKRX2FbpoqsMZolT5GMWXttnIoaL32TE5VDcGcgQBAJ+4RBq3KnAJ4UyeBHj425LDn1cfCJOpu9a5zvWfBrbvDHnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpBZB2KI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpBZB2KI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88c72646f03so556303b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024565; x=1792629365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jmI3TmHjjc2dO7/6GxNzkWpciqllTf2rNHSrqi8488=;
        b=cpBZB2KI31rx1UkAL7nlclVDnru8X2hwZIUNJ4kpXx02hkWbUCzDdJ8sMhreuF5Uxz
         daxtO2bL6WyxxnmNyVKaDhoR1MYLm80eVLr+bcrsAJhFRUXDBnBF+U+kBFkVTgZRbyd+
         whWhvjL7ZZdRuDWwlRiHrtjXxzbMA1waQoI0hk6pzH32DW51BqouBd89I/vD3LXpQI26
         PcXCuzlWaRg9cThsBU3t62M4LiMoFhcs9VQRk0VhfR2an1kwdzLRxOoi0/OYMTTjO2Of
         Jm3N11xPDf9qFBg/hEl6Pc92mmmQlPf7GJVlEaLIsU25E+TgTHcOzJ/Hu5emhL8BVr9n
         WdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024565; x=1792629365;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jmI3TmHjjc2dO7/6GxNzkWpciqllTf2rNHSrqi8488=;
        b=E7AEFINdktyeTrV/Ry2zxGVCuVdjc4lKa9D2Esix4yssEpFj3cyhCGhLxGv2e6mSg1
         Fuqe72i0NwuH7yQ3TSHQu630lzHdpWGTijHH94vY9P/pwmnFayBi/+3B+woDyp10oiFP
         /bGLkVnLzeO7J9QZg4mjHhFFrDn984/L3eUY0SgAKRkH87i2c1wD+3EkNSbLlec7PUEt
         B98S7b3uupaPWGuJbmsq4wAcE3sfLZO23Ha7KuKuXcw+XJRebTW6gPlcSzBcpNTF4Itc
         6/8WRB4Q4DdoKpe00227qdSOUeQrQ0c4fKVQmFaHlpRt94XOvdf/Y0bLBZ/lCIWeDG2/
         fbqg==
X-Forwarded-Encrypted: i=1; AKwUvBzHHM34edx1UwnkzNieRL1XEgr01CUSAjV22sY0sOZl90VbEsGKS5zK/TeXJEzlCSY9u69LKQVM5vP8zg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCqkE3PxO2TEhmhBcxMcPepwK8sRedhE8qCEEysqadMhok+z8Q
	urpHuajm2QNKgPbr5JG76OxL+GTTPEEx+mlfJ8sv5ar3Imi4s5k0Mn9QG44Hvg==
X-Gm-Gg: AYBFou1bEXvtX/7YEk8klJdsvA6I3jC2SLlpy9Xxbf1j5WN/tMUbFJCyLguambRHLcX
	bpM8SHcIBK0tWUiH5mxi0fXyv6NzGJfuGCNPL36otcvGRZV186r6WSaO+xm66iiXLfA5NPMsOg4
	BcyZIOhi72pCRZw7y8VkeacJ/vbZAu9NRKnHHam+gUgaufiwhiAmqx9gm9OmZVaDbsSaPP/lqr/
	4Q+GkK8NYaI4W4fsM1U3FtELVEkvFrT6NlCcSTYPn9GdkLYBxctVXstdCfx5vxUqsf5HSHBgjOY
	itweeyqj8OZYvyLwf8w/ZU8HEDK788l6dn2pO00nVUItwveUmROrzZy9b2nMVpkCGbKt48vC1u9
	MHQoTxG1e3HA7oA9xr6+2P33p/cnNnyZcK7VpMcq5NIcdTeQO5BzMK5ErpaU4N0deeZ/RoNQv6y
	OXrdz14hqnuh0Ex3nByLdsAa8U0vODixlX5/VaBCpK+Hxn+b29Fv8YlOE7TlRSTDUk9N3BiXQGg
	VoISCGYd+llzwBC0Q9pNQ7VF8dhuzZ9eviH9yAxbfihq3nASF5k+0AmoP14zUai+GtKzQ/YLUcE
	dh+f7oxCnaFBmfXb+g==
X-Received: by 2002:a05:6a00:3cc7:b0:880:e4a7:b1aa with SMTP id d2e1a72fcca58-897c8895ce5mr15777684b3a.55.1792024565315;
        Wed, 14 Oct 2026 17:36:05 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d8050da10sm1567176b3a.53.2026.10.14.17.36.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 17:36:04 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v4 0/2] ALSA: pcm: preserve capture tail during drain
Date: Thu, 15 Oct 2026 09:35:59 +0900
Message-ID: <rfc-v4-core-capture-drain-0.b56779f7976d4657@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This v4 replaces both patches in the core capture-drain v3 series. It
follows Takashi Iwai's suggestion to refresh linked pointers in a helper
before drain-init and fixes three tail-handling problems in patch 1.

Patch 1 allows buffered capture reads in DRAINING. When drain wakes a
reader waiting for data, wait_for_avail() returns the remaining frame
count. Capture EOF uses snd_pcm_drain_done(), so a linked playback stream
can continue draining. DELAY and SYNC_PTR(HWSYNC) use the cached final
capture pointer without calling the driver again after capture stops.
Sashiko's review identified these three problems in the earlier patch.

Patch 2 takes snd_pcm_link_rwsem for reading and updates each running
member under its own stream lock. It calls snd_pcm_update_hw_ptr() for
both playback and capture. The helper runs after the existing pause-resume
step, allowing a paused capture stream to receive its final update.
The pause and drain-init actions remain outside the link rwsem.

A pointer error follows the ordinary XRUN path and returns -EPIPE before
drain-init. This restores v2's group-wide error handling. V3 instead put
the failing member in SETUP and could return success from blocking drain
while another member retained its tail. V4 removes v3's notify argument
and the conditional notifications in the pointer update code.

Previous core v3:
https://lore.kernel.org/all/rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com/
Takashi's latest suggestion:
https://lore.kernel.org/all/87jynkcn60.wl-tiwai@suse.de/
My implementation and test report:
https://lore.kernel.org/all/core-drain-helper-reply.0c1099dbd0ca4a37@gmail.com/

The separate five-patch virtio-snd lifetime v3 series is unchanged:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
Apply those five patches to the public base below, then these two patches.
Remove both old core patches before applying v4. Core has no dependency
on the generic control-wait or VZ compatibility RFC. The lifetime stack
is pinned here to reproduce the tested integration. Neither companion
RFC is revised by this series. A future VZ revision will need the new
core prerequisite IDs.

Validation used ARM64 QEMU with KASAN and lockdep:
- 26 linked-stream checks passed across atomic and nonatomic modes,
  including paused drain, first/later member pointer errors, normal XRUN
  handling, tail reads, and unlink/prepare/reopen recovery.
- The three patch-1 failures were reproduced with the helper and the old
  first patch in both locking modes. All six corresponding fixed cases
  passed: a blocked reader received all 64 final frames, capture EOF
  left linked playback in DRAINING, and both position queries succeeded
  without another pointer callback.
- Four additional blocked-reader runs compared baseline and fixed modules
  in both modes with a stronger gate: thread sleep and a pointer callback
  after START. They confirmed the baseline loss and fixed 64-frame read.
- The 10 existing lifecycle and timeout/reset scenarios passed, including
  held STOP/RELEASE, SIGKILL, reset, and subsequent I/O recovery.
- No KASAN, lockdep, or panic diagnostics appeared in the 54 selected
  logs, which include the baseline behavioral-failure comparisons.

The full Image and modules were first built with the new helper and the
old first patch. After fixing the three tail issues, sound/core was
rebuilt with W=1 against that same configuration and symbol versions,
and the corrected PCM module was used for the runs above. The module
build had no warnings or errors. The full build had 517 existing
-Woverride-init warnings in arch/arm64 outside sound/. The exported v4
core source matches the tested source byte for byte.

These tests use synthetic drivers and modified fault/reset backends.
Physical-device and Virtualization.framework microphone testing of this
core revision is still pending. Concurrent LINK, wraparound, and
forward/rewind behavior have not been exercised by this test set.
The updated reproducer and logs are local; the earlier public package
contains an older core revision. There is no new reproducer upload for
this candidate.

One design question remains: the helper releases the link rwsem before
drain-init, and snd_pcm_link() permits another RUNNING stream to join in
that interval. That member could enter drain-init without a refresh by
the helper. Should this change protect the membership across both steps,
or should concurrent linking be handled separately? I have reviewed this
interval in the source but have not reproduced it with a stress test.

Do the restored group-wide XRUN/-EPIPE behavior and cached capture hwsync
semantics look appropriate? Which physical-driver coverage would you
want before this can move beyond RFC?

LLM assistance was used for implementation, reproducer development,
analysis, and documentation. I reviewed the changes and test evidence.
Assisted-by: LLM

Joonho Lee (2):
  ALSA: pcm: allow capture reads while draining
  ALSA: pcm: refresh linked pointers before draining

 sound/core/pcm_lib.c    | 16 ++++++++++------
 sound/core/pcm_native.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 7 deletions(-)

base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
prerequisite-patch-id: 39fb327a004c966ab90f66a34a64bbdbb3ffb475
prerequisite-patch-id: 7c6bc344656fd839ae0d697ba18d66ac0b47827a
prerequisite-patch-id: 9dd290ac3147fa7b49a475d7df8a6172778f2860
prerequisite-patch-id: f4c24a5e441343a690f4ac2437f181c815bc23d0
prerequisite-patch-id: ab4a5b770247a65272ab7af18a75a147daf81287
