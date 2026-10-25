Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910445;
	b=j+8Z6wjQxl1dOrRa+dxT1xcMredCxDITQTbXL6DUfsJutJevRxrkB1J6rHSi3wRE6R8t
	 rrnZWIomiNfzsGAGYi1OkQYX/Aiu5JcvdO/brAKDmB5S4xa68lTxmiS13hmgcRMBzRPFi
	 ZQIb4cIYbYu31k3+3UZH/2fXOMXk6U/pzAFL8joLnkKbTtSCC80d5M/g6n0QSfYesuJCb
	 QT+WfqMCvmGgEex0sVbY0bxueL3+eilhH6kJJqrTZpBqUwTwG3Vmx5D+dthKIog9qpqRT
	 H/w0urTJfyZT58+f5wZIE3bo5O/NoVBV2H49xGuOmYFp/CHbPUOJTuX7m/F5zhX7PSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZOE0jx7namuFNQAILgAyIxxvCrkDcwa5wtjwYyQxQgg=;
	b=hMRzAAZnuTE6c5gV3ILaAJ3/h7kfOVU2SAKt8J5tuldvcABiXsT9yfTJLmdkzz3bdJit
	 CUkz0LDnqT0g2TeOiLpB+UjWLTdKj+5N0bt9RfniRU6SXBoEUGZYcAcaYyh38DehCO3nl
	 hlllKha/amcENGKjsdLXU9KszQTAKSEQi+HSzDa41gNmkahveZOiz2hDkUGno/PMZ4QWr
	 iklV9LN8yr6DSRzmuiDb6txOjydokUqd+sid9eepwtY4bIC5c+y6KIwFhFTLyJx0twPuu
	 pbLKGzw2LObr+0fQNqjMJmeGEIz0Mq+K/mPOG1ygff20CtcvmZ5cLMK1sxDiUHwv6uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rGKp3xU2;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492DC606A31B
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 06:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rGKp3xU2
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8246b13cbso18068265ad.2
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 23:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792910444; x=1793515244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOE0jx7namuFNQAILgAyIxxvCrkDcwa5wtjwYyQxQgg=;
        b=rGKp3xU2NC6YEtRR3huA75NNHVkNlWKHf1KFnq5kzOzB2ctLNFsFtXlnlIQKgJ7u0J
         39Ld9aHK+40aFkDkB28K+hHHV1931kzh7feIY6mynV+qajimNxqFPLj8FOyKsC85tGnd
         h9FvnsBRHRe6eqYx15mHPfCBELdZrKExI29h9kTqYG0ZByx6AXJ004rI8XxO3Ax+fQYC
         sjYVC9I0fN55y7/9cBKPQCOXPLjC3dvYb1wjknudYYfUmIW4KmLNfEGitBFeYrraigJN
         reH3H4LFq/L0Q92b6X3Fq0+cM/atrr6z71l3HRkgakJICYGtZmCARd9r92ds5LSDl28K
         dmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792910444; x=1793515244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOE0jx7namuFNQAILgAyIxxvCrkDcwa5wtjwYyQxQgg=;
        b=0zgrNsg+STL/Opc7bo3cGfMae1CtmhmgdB0SJzPF6VwC5pYaFtaElX43ZMc0+G3RyG
         l/wV1bmUvhM7lEAPBkyZM9pbdPmU9qMOJBJpK3P82dosy0FkgeLlCiE6HITTWXreAtYq
         ECmJOFJ1KTfXE2pO9wgfYXLhnkevpYC3QBgeA4ygu2XVfRswiLyBn68G5ixIvtHp69XL
         gLsUD0/IM+ABKKyG2wdt/Vd1apoOJ9M6nFgTqgGqndeEGb57+3buXhf/WyaXD+FsL+hS
         JVvBA9OKOJb/fT/fuAoT76ACJdjHe9FHUoIyyCSpia1EQAD8IrYgSWuSW3ypVejtefOv
         vw0Q==
X-Gm-Message-State: AFq9FYKf3N/htluT0ievTBrH/QAuwP1Yxi8IS+i0WPXVlWGU9AkusUJO
	jRB938bTW4kj2B2OMLyNrlBET/TnX1YbQ1l5wFKRRn+6vzqTK1iGnZlGaCGPzFa1
X-Gm-Gg: AYBFou19f+mJau1rFLuAJci6oVpSFoulWSw0Xkdi1tYt9S6njo9j03QpeYfFiWDYL2u
	RiZjBff+QhQBZXQc5w/GL1p3oBFTkspqDNRt2QRmAF50j0wzTgrXPDtkUnYOUVyezor1uB1C0DX
	Ae8gJBQoVaBjxN4waKKqDVIuHEhoMKjcOt8yNLJnvg82J6X9oKs6/0lTHAXneKyb9FjBp/g/mfK
	pyV57xKLeNqOh3sqFb9kGnfK2DInWATM7TSKPdJQSF6b5GKIjcAvMay8gxM4IOPmnW5+FCtyXOk
	u09FUxVCn854RX8W4KH2dkgoOPf6IbPwlPMLA73QLjZrNEL1Gq8bzGjgZJ1i59NZd6vFRa+75fy
	4aRe7Jq/+fsKoBR+eUc8KLA9G+mraxRP580+CCIZtH8BMVwqOr3ye6pFYe4WeUZ7XN28M+3fLRu
	CFKJ/vONUtrVFs1xJA72t7CNA0qzGr02K+If5gHDvyVoFnwdMJA5zrNgX+66Fgh5uvRWww+BMNz
	ErTOCeXH/DI5GcopihK3BLXPjLw9rl2lfLSLUWoKkagq3kSPZZi3LY+6Sl2tlLJVB0C2PzZLW4f
	4g2ID5E7mwHLmOju6B7arzOz8T+b/WwlXpy3ycOZBCQ5uRZi4GYdD08C0yAK4o9nUq0WjXOX
X-Received: by 2002:a17:90b:50cb:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3adeaffa088mr3030302a91.48.1792910444439;
        Sat, 24 Oct 2026 23:40:44 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb2fb2sm4462670a91.1.2026.10.24.23.40.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 23:40:42 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ALSA: virtio-snd: fix dsnoop capture with staged buffers
Date: Sun, 25 Oct 2026 15:40:36 +0900
Message-ID: <20261025064038.81674-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

Changes in v4:
* Arm synchronous stop before paused capture enters XRUN through ACK or
  period work, so recovery releases pending RX requests before prepare.
* Add read/forward ACK regressions for first-prepare recovery and direct
  close/reopen, with native pause and pause-restart on one and two vCPUs.
* Keep patch 1 and the prerequisite metadata unchanged.

Sashiko identified a missing cleanup path in v3 patch 2:
https://sashiko.dev/#/patchset/20261025055702.69259-1-mynameisjune111%40gmail.com?part=2

Previous version:
https://lore.kernel.org/all/20261025055702.69259-1-mynameisjune111@gmail.com/

This series fixes dsnoop capture on top of the staged-capture virtio-snd
changes. dsnoop configures its slave with stop_threshold == boundary and
can keep capture running without advancing the slave application pointer as
an ordinary reader would. The staged-capture accounting currently exhausts
its bounded unread capacity in this configuration.

The first patch marks stop_threshold accesses used by the driver's policy
sampling. READ_ONCE/WRITE_ONCE provide single-access annotations; the
virtio-snd state transitions remain protected by the substream lock.

The second patch caches the prepared boundary and samples the stop policy
under that lock. A completion uses one sampled policy for validation,
copying and queue refill. Free-running capture keeps requests queued and
retains the existing frame, payload and pointer-window checks. Returning to
bounded capture restores unread accounting from the monotonic counters. If
the outstanding data already fills the ring, the policy helper returns
-EPIPE without changing the cached mode or counters. The detecting RX,
pointer or ACK path then reports XRUN through its existing error path.
Native pause-release refill failures schedule the period worker to move a
paused stream to XRUN and wake capture waiters.
This does not guarantee a synchronous error from the sw_params ioctl.

The ACK accounting and subsequent queue refill each sample the policy under
the appropriate locks. Prepare and teardown reset the cached state. The
existing ACK-race and priority changes are prerequisites to this series and
are excluded from these two diffs.

New testing for v4:

* v3 reproduced -EPIPE from paused read/forward ACK, followed by -EBADFD
  on the first prepare in both native pause and pause-restart modes.
* The corrected module passed 16 combinations of ACK operation, recovery
  route, pause mode and vCPU count under ARM64 QEMU with KASAN/lockdep.
  Prepare recovery uses the first prepare without an intervening drop.
  Recovery and reopening each capture 48,000 frames.
* The native-pause regression and 13-case mode suite also passed.
  No KASAN or lockdep diagnostics were recorded in the six final VM runs.
* Direct close/reopen succeeded even on v3 in this fixture; these results
  establish the prepare regression, without establishing a persistent
  buffer leak across close. Forced RX/pause interleaving, new physical
  microphone tests and KCSAN reruns were not performed for v4.

Earlier testing for v3:

* ARM64 QEMU with KASAN and lockdep, native pause: v2 returned -EPIPE
  but stayed PAUSED, and a waiting poll timed out. The corrected module
  reached XRUN, woke poll with POLLERR and returned -EPIPE from read.
  Prepare recovery and reopening each captured 48,000 frames. The
  corrected case passed with both one and two vCPUs.
* The 13-case mode suite passed with the corrected module, including
  direct and mmap capture, policy transitions, delayed-reader recovery,
  reopening, mixed-rate dsnoop readers and client departure. KASAN and
  lockdep reported no diagnostics in these runs.

The following testing was performed on v2 before this focused change:

* ARM64 QEMU synthetic dsnoop capture: 12 files and 2,160,000 frames
  matched the reference sequence from each client's observed starting
  position. All 48 corruption, loss, duplication and reordering controls
  were detected.
* Default KCSAN: 13/13 cases and 619 policy transitions passed without
  race or lockdep reports. Forced RX/ACK policy changes and four isolated
  policy-helper branches passed under KASAN and KCSAN.
* macOS VZ with MOTU UltraLite-mk5 at 48 kHz: comparisons used one or two
  vCPUs and idle or CPU-saturated guests. The baseline failed all 32
  shared-client captures. The candidate passed 48 captures and eight
  recovery diagnostics, including mixed-rate sharing, client departure,
  reopening and recovery after an intentionally delayed reader.
  Loaded shared captures ran for 70 seconds. All eight accepted VM runs
  shut down on the first request.

The physical tests checked frame counts and nonzero input. Exact sample
continuity was checked with the QEMU synthetic source. VZ exposed mono;
these tests do not establish physical input-channel routing or multichannel
support. Aggressive KCSAN still produced dsnoop client-threshold XRUNs with
a 160 ms buffer. Further isolation supports a deadline sensitivity, but
does not exclude every kernel timing contribution. Separate generic KCSAN
reports remain recorded in the test evidence.

This series depends on the staged-capture prerequisite stack below. The
tested local base is 8d0d4c1a6c4bcb81ae9f52d1c0d979fafb2e22f2, consisting
of nine prerequisite patches above sound.git commit
5618f6837ef3314e2c581d4c05ec13b7ed975cb4.

Prerequisites, in application order:

1-5. Lifetime and error recovery v3:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
6. Generic teardown/control wait v2:
https://lore.kernel.org/all/rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com/
7. VZ staged capture v2:
https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
8-9. ACK accounting and high-priority period work:
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-1.f2737c95c12e45b4@gmail.com/
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-2.f2737c95c12e45b4@gmail.com/

This fixes the staged-capture accounting introduced by that prerequisite
stack. The reproductions do not establish the same failure in an unmodified
upstream kernel.

The policy uses the existing stop_threshold == boundary convention.
Sampling it under the driver lock avoids introducing a PCM stream lock into
RX completion. A completion overlapping a policy update may finish with the
previous policy; its accounting and refill use that same sample. Rejecting
a transition whose bounded accounting cannot be restored preserves
explicit overflow detection and lets the caller recover the stream.

Patches:
  ALSA: pcm: mark stop-threshold accesses for capture policy sampling
  ALSA: virtio-snd: fix dsnoop capture with staged buffers

Thanks,
Joonho

---
base-commit: 5618f6837ef3314e2c581d4c05ec13b7ed975cb4
prerequisite-patch-id: 39fb327a004c966ab90f66a34a64bbdbb3ffb475
prerequisite-patch-id: 7c6bc344656fd839ae0d697ba18d66ac0b47827a
prerequisite-patch-id: 9dd290ac3147fa7b49a475d7df8a6172778f2860
prerequisite-patch-id: f4c24a5e441343a690f4ac2437f181c815bc23d0
prerequisite-patch-id: ab4a5b770247a65272ab7af18a75a147daf81287
prerequisite-patch-id: cfe3e7000e695a2fda27993f4d9acf0a637cf24e
prerequisite-patch-id: 771e8815f2b874d98376f309dc60bc90244f378c
prerequisite-patch-id: fdea8eaa29a47360e19820e27301dd8b6b26e43e
prerequisite-patch-id: 67ffb5c72970e1aeace72b6537dab1b977a3fc6c
prerequisite-message-id: cover.1791881787.git.mynameisjune111@gmail.com
prerequisite-message-id: rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com
prerequisite-message-id: rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com
prerequisite-message-id: rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com
