Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267656;
	b=DpyYxqwwMPxTj2s1qJ4meA87r7g+RKKWttuyMkSLNndybjKARQoj37ePWc+UqpE8sllw
	 sJcpMGqx/9FhAX3vKhnV4iBrqAqUFiU4LhTwOwuz4EYDiuRwru2OkPiwoIp4boi32ngJY
	 WWtkhG2nmk5BaZvOgp1V8gRQkKJVkdXzoVNqKAdjhA9Q2bv57KEdqLMBbn3PDYAM41nml
	 oH4Ib13z6ynMoFYYYfNf/f3aFOtOIpgYQo3wvs8v1F+xy7ZZkHCyx1ijs2rCLuoHP1w/s
	 +qtdUwTi/reL6TsWrKHdmw+y4euFuiyckTJeVCRDUzUJM80By9IJIFGtgI09Z3hFulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UYh9+NfHPKZajvTz1xi7cTDaycXDIClv3BtU5BxbMAs=;
	b=xYURK16oPx3vvCaJx/VaoYtfD1XexFIjQP9QXyMYki2E6HrDVYrjL7VDp+5ZMN5XlBzE
	 XnhFRADffxXW6mjAQU9qEMl6wmndSI5TJGUHzj0SRsXVMcvFBEkOEV6Nq5SJng7pUCffW
	 amm4WHXU7uuA11an9Mm9ZF+NzfHgEj1iNT+9evMbLwXdMUrUALDg2vwIyKhIyflyjxS6V
	 e/OlpoQw71a468C2pP0rhaGxT0fpQQKqgx36dCF/Faz6gf34OvtAdbvFilFyWwhpOLwZi
	 JAt1Jgb8gNSazI2xbVZLBybeJtWopDup57qA2ulnH7MeKUFRnYrgIdk4d+0g7P/UxZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qesG04od;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CE606A326
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qesG04od
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37000e7234bso2075650eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267655; x=1794872455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UYh9+NfHPKZajvTz1xi7cTDaycXDIClv3BtU5BxbMAs=;
        b=qesG04odxfpBZtfCMKTdwe/M+Hum56hQAH30/p3gPPawxpDGXutP5N+uUzDKwEYW0Y
         rLf4J2ajAtjtblJKv3j+F129cLfYIWr6sHzJOztYwi4lM8PlUxulmUBA+U6X6SVsCGnq
         UCu4icfIP4KFsz/gcIdLL/ib7TqSEh2DGQrGqtr0WJVUBBsKNh8heRQm4Pl9PGnmzxBW
         80iOyyydUrh7dq2Mf6ZxaEHhBhA3c3+r0Vy30+f3g5W0ETk46QVcfqp4aJhqh91BBbAR
         qtYSd0ju5yn5XXRZw/q+zUyQO4D6jZPT/VKclbdTkGroxAb8vjgGqc4rbJKAb0y7dmZB
         0XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267655; x=1794872455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYh9+NfHPKZajvTz1xi7cTDaycXDIClv3BtU5BxbMAs=;
        b=lY0olfEqjagzI3+kZQlyqiR8/Ax9cVo2qI3Z54H2h4oo/ikfAO+xW2qObYSe/EUL3A
         fHDE0bCXtqHY1xklCP3NKokP7PnfFqLkZumksOtT7yMOl3BrqsUvx1WTX5mj+opwb3ao
         EnGYA8VlDfj7WzqWTn/oJO4GCBu7oSm/mdd5Bi1kVb2FmJqsJba07onii0wXxhbFbh/q
         YeX0WVlBaiNpw6KSPYWB4b0G32hRAqFcsrT6ue0Tsc70Ix9dQH5+ECvv5r3JAkHdwUex
         xEuQNpkM8XU3nPRSL7Yz3UmKakf6V712xDaUF8e87xZkYD+uns6NtE4Awcb7VNJecdCh
         uc7A==
X-Gm-Message-State: APuU4Z/2BYhMqYB5aT2pBZCf42KoRqMyTGDsbfW/4IhZGiww/781xyTx
	J3s5qxPkgLokzHCHgqthNhXQQ9sfUdx1jVcppM/7aSbpbnfR6cbnGHRVtJLazw==
X-Gm-Gg: AYBFou35QgCSPwjl6UGpE8RAM8BRev0lStndwSXiuxfjt0vaZN6nQKcPIQgFUrcMnOr
	Gh50iwtm4/fh6Lgk+EyvKzdRJXrwEnb7A5XzwGOKKwR+UpPvVtvLVoajsaity7Ulco6R/YhCVNP
	xjoO6z6fu/7eIQM1Qt9jc3ktmhKsnBd3X7ufp6oKhk1cZM7t6uJY+j7WnaZfli/s8R1nL6eFUXT
	shEVzKyHPm6QuMuOWVVYV4Ada7ogFMeF3Ej5PCTMzeZ35AvMiOaZ6Qamk6oyJ8jHHxIfnQPQvog
	5VBlI7LZEClW2zmQrWG2tNcZa2qcN3VraSgtJ2oqnBYfSR5GWFJykEp8KBcTQ3reeDd5npI+6vx
	NOpun2K0f5FLJilUfI2DOYmCtl90hV5HsptFsxv71d+w41KG/AKLdmtXqQFqXHh6dPnSTfT5WJZ
	3UwRMw64emVV0t1kO5Sr79dAj22OXJRCZvc4U3nFEF6Fh8uvfJvuSfjP33xHJdfDkwIWmcYs976
	eVmFvXAbftJ7n2itlhmLOVphH5nhUmwBTJrfbUA4JlUfKwdHRu2RhS6EXvCx6KTeoxZ9WTTGy18
	WtUHGxynVaZgK96sLMsG1nJrEqIDSKHH1zU5pbU8m0wi2z319TB7VzzH4hpmaZ5gvE2H9zB9F25
	xJ6D+6hkpFp3A0Ljztj3HUByAWZO8YUAhAdx48xE/9DQftgsRF32M2UJkUj5ZfBRdrRTK
X-Received: by 2002:a05:7022:f4e:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b3b5fccca8mr1420330c88.15.1794267655107;
        Mon, 09 Nov 2026 15:40:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:40:53 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v23 00/14] ALSA: virtio: serialize PCM recovery and capture accounting
Date: Tue, 10 Nov 2026 08:40:35 +0900
Message-ID: <20261109234049.79534-1-mynameisjune111@gmail.com>
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

This series updates PCM error recovery, queue ownership and capture
accounting in virtio-snd. It also provides opt-in staged capture for
backends whose completion lengths need explicit compatibility handling.
The capture compatibility parameters remain disabled by default.

The previous series is at
https://lore.kernel.org/linux-sound/20261109051618.22506-1-mynameisjune111@gmail.com/T/.

The v23 changes address the v22 automated review and a separate existing
linked-buffer locking problem. Linked prepare now commits member states
and driver admission under the group and member PCM locks. Suspended or
disconnected members keep their states, and a canceled successful driver
prepare returns an error to its caller. Failed prepares notify only the
attempted prefix and do not generate a stop-timer event.

A separate core patch closes every linked member's buffer-access gate
and takes buffer mutexes in the stable group order. The caller-first
ordering and caller-only access gate are already present in the upstream
base; this patch is distinct from the prepare-completion API change.

The failed-start patch owns the direction-independent error latch. The
later recovery code keeps native pause admission closed when a linked
resume rollback fails in PAUSED. Paused ordinary capture preserves the
accounting-error XRUN path. Staged capture rejects unaligned application
pointer deltas before changing policy or counters. The DMA lifetime and
staged-capture commit messages now describe their full source changes.

The order separates the ALSA core APIs and existing linked-buffer fix,
ACK propagation and failed-start recovery, message and control lifetime,
teardown waits, opt-in capture compatibility, work priority, and option
documentation. Each patch is represented by an independently checked
cumulative source stage.

Validation used ARM64 QEMU with KASAN and lockdep. The eleven changed
cumulative stages, 04 through 14, built with W=1 without compiler
warnings or errors. Applying all fourteen patches in order reproduces
every cumulative source stage and the exact final candidate.

A test PCM driver passed fourteen core scenarios, including linked
success and partial failure, atomic and nonatomic locks, suspend and
disconnect cancellation, overlapping DROP, an active sibling buffer
access, parallel group actions, and old-generation ACK retirement.
The stop-timer change was checked by source review; this run did not
attach a timer client to count timer notifications.

The instrumented virtio-snd tests passed definite START and STOP rejection,
RUNNING pause restoration, failed linked resume rollback, deferred group
XRUN, DROP, prepare, real playback and capture I/O, and reopen in RW and
MMAP modes. Actual SYNC_PTR calls checked rejected ACK rollback and
unaligned ACK policy preservation. The alignment and invalid-accounting
inputs are synthetic test geometry. A separate stage-07 test verified
four START failure/recovery cases and failed playback drain termination.

The pure final driver passed ordinary and staged RW and MMAP recording.
Each configuration included a seventy-second capture. RW checked three
reopen cycles; MMAP checked RESET and a reopened stream. All fourteen
captured segments matched SHA256 values generated independently on the host from recorded QEMU sequence
epochs. No KASAN or lockdep diagnostics were reported by the passing runs.

Additional tests used the same candidate with strict KCSAN and lockdep.
The runtime selftest and an isolated positive-control race confirmed
instrumentation. Fourteen core cases passed at both default and higher
sampling rates. Twenty-four driver control and accounting assertions
passed. Ordinary and staged RW/MMAP captures matched all fourteen
independent signal segments, including RESET and reopen.

The KCSAN campaign did report an ARM64 saved-PSTATE race outside ALSA:
copy_thread() races with spectre_v4_enable_task_mitigation(). I built the
pristine base with the identical config and ran the same fork workload
with all sound modules unloaded. It reproduced the original pair; the
ARM64 source and compiled objects are identical between the two kernels.
The report remains recorded, so this is not a globally KCSAN-clean result.
No ARM64 change is included in this series.

Physical tests on macOS VZ used Scarlett 2i2 input 1 at 48 kHz. Direct
ALSA RW and MMAP each recorded seventy seconds, with signal statistics
checked against a simultaneous host capture. Pause/RESET, the first open
after killing a running recorder, and capture after VM restart passed.
These tests enabled all five compatibility options. They do not establish
bit-exact physical sample continuity or Docker Desktop microphone support.

Two test-tool problems were corrected before the final runs: asynchronous
ACK snapshots could evict a control-error record, and truncating an old
capture file after START stalled the test client beyond its PCM ring.
The final MMAP test prepares RAM before START and writes output after
closing PCM. Source, config and data-oracle acceptance stayed unchanged.

Synthetic alignment checks do not represent an actual sub-byte capture
device. The stop-timer change remains source-reviewed without an attached
timer client. One-shot command rejection exercises a definite error path;
uncertain control timeouts can still require device reset or reprobe.
Heavy-load TCG scheduling limits remain outside this qualification.

The staged path and its backend compatibility options need maintainer
review before they can be recommended for a production deployment.
