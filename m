Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180500;
	b=JhelxMBvMxfNhP+rEniyLr3Z/FcL7by55k7bjYB0GAeOuqR7FkD/cYxR5ZpwIKx/FmEu
	 Nf9KhCQRRwyExaKnju/+H6m2NKgQmculbv0SJxAvptkZa2t3ghtcUC8gArOwV7Ga1g9Ru
	 Wq222eXUFe/vYN9pHRGkdWyUb1K6QlDZkaokMbNbnPAM4o4McnE032zED2KMLlT0L41Kj
	 bsuu6imu1gr/AXOBkbC+3LyP2YW93tRAzAi+jwlvK04HzjKwjVVi6K5OCT7XE45bnSHAm
	 cwgw3KGVFd0kLqS1noveum3wXVGWfoDgc1dOLyjyyRueswaFO1xDsrvoMzhJ853+FKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZzC0BaO9ZgdLKo1L+nkEtyr8dtc0OiwBuBerUSBWik0=;
	b=tPHdQsPGhtYUmrCzpuSDZ4jeoGkvDBRGKHO8RyE0N9+WUMCGFfLIzZs7WEcVF6JmOLPc
	 KxAfK1p8AShmnkIy40oKpn66fjDD47QcrNDioyYhFtEjRNDsMgootOF43773y2OXqKhng
	 tpbAwjTorWz656VcMT3hfCD14fsdX/mwHTGg4ugRCKyHF9MdqoFZwrxSt4cbN0SrjfwsK
	 p0LRI1TUXzPg5nRLgMRP45ITHZLxCZ7s3w9FCqzH7RjVE/b16Tre+HyLY9W+u9Z2mm6g2
	 F2Az/h4NKU9dZ7QIRs2NWm4QSJ7Dg7/og7wIPhe4b1nSiApJQaS7L14fbxc7Zp4mEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1OTnA83;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52146606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52146606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1OTnA83
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so456064a91.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180500; x=1793785300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzC0BaO9ZgdLKo1L+nkEtyr8dtc0OiwBuBerUSBWik0=;
        b=c1OTnA83UeZn1DZ8iGH8F7BR48xpL0MgDWI6hZCEdw0ZU+7g4ivlb+0DCOTeeCpxyk
         MDTgkRPd/U4a1kAEJWYgFtb+17cdH8PZ86s5zmp8Cld7fbziZ3wIeL1Nzr8RiWXBViHD
         6bZuLXhcLmXun4CdxYMSgBX0LRRnnhiFI6rsQiAp/VLGespIfJk5R2Q/ikiPQYVUVFeE
         kOW+bJUooxSw6A+IQODUmu3i0dAgJzMe7HgDk8dVAuInmnpyijC6OmEuKODkmCPX30bi
         l/mvKMYQ65O42xsQI0JdwqbcvrRjjDGNFP1fWnipz82P5T17dTKHLQrIw0Tz5tI7J/eU
         DEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180500; x=1793785300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzC0BaO9ZgdLKo1L+nkEtyr8dtc0OiwBuBerUSBWik0=;
        b=o5NJ4LlhENIwp9kvoPwfHK1fP92hnygguSbR68whUOOlqzHnx9fv2BSIIca9S2ZdN+
         aEao3JeBoo+p2tBG6vWLsLNlfGrzPXlR9ZmBY2fFUbl2/TNAXazYfK68ApkuFARCmIHT
         ufg3W3wBpKoMbkwqHAcsXoFUL5mFmkTM0NttSawTS6QWkLetb3T5eBaum+C3wstArLiU
         9fcCd0qeVA6gkbQtU1mlU59qOmpfYvfquF4DfMTcyQQQYzlytnzI0OwhYvQUgrgECsYz
         3EVW4jeNs30X5ZIJudtjIIK5jeBdXMwr3/Z0n2M/S32thcnm48xRb1qPh2Y0KYJq4u4A
         /D9A==
X-Gm-Message-State: AFq9FYJAYahZremdAql6MZCIHHn/7Jy1yQlQYeoa3ZCC/9812IaiX26W
	L7kT94dlsy71u/5F9SCcKdTNVTnBftYNGFY6qXdiFAv8DPPBghUL3p5degCJwg==
X-Gm-Gg: AYBFou24323Y8q+lRQhiF7x+T4NtkS/v5CEe00oZlbaJcs9g1fpCzxi2vQkLMeJmSVH
	JbnOreIOYSVbVRAG1nixUaPH43REd6UQtGyjYwSJbFzoKp5R9FAij2nZqoxTe46v8n0vCCU7gkH
	gJATijJ/iuqHdtTt049tEdui1xH1Ywg2JBtG0xpxe6JfQFLhSSPnle5zbpmfLz2d0nxw0fNX0OB
	JcN/dMeak8cMQlbzkwYltYnuZowV+4rJ2SGaKK67/7flDqCBw5scP45DFSiAHcuW0+lTXIFIGgF
	RzwADRniuZcGKCUeu7VUNZqOYVmBEv/BXvML8Des+hpbyiImUEZjObvnY78ZVfOTre3CctN3qHG
	Ok/fpnYAnyPVE9CrG2wSDV1I/86ldW50SEW7Sy/tk+Ge2FgL/eywbpMaUffrvIYHEEsuDtHv6Vk
	g5PZS5+wPTU/fg2B+HhDMDnmuI0dHDOXtFjyyBed02nL/RD2ZpGxDYaiIfjMGJrqZt2b0RRnZ5D
	ZjsodCGldRxqrqT+dvm/wff5aUYxMmVT9wDuvWFnt39sKJq62y1zxyDYgykALE0Nib1AFUyB3l8
	VPiAvYcopN9fTSPRsZt01V/0xiRhAl3wG4UiIq2MGuWUAApLz7ZYs02jcQJuyHDqqgpzFm99Q0n
	iuNE6OG0Xd9We9M1UzL0duBSIcZ4FkUrdIRKShRMDLPwyfYE=
X-Received: by 2002:a17:90b:2641:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3ae5822f75cmr1311123a91.39.1793180499480;
        Wed, 28 Oct 2026 02:41:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:41:38 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 00/16] ALSA: virtio: staged capture and dsnoop recovery
Date: Wed, 28 Oct 2026 18:41:16 +0900
Message-ID: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

Hi Takashi,

This revision follows v6 and addresses nine Sashiko findings in the staged
capture and recovery paths. The follow-up diff is relative to the
submitted v6 series, which applies to sound.git for-next at
bcb4494239f57c98a8ef576566b03f2935b3000f. Targeting 7.5 or later still
works for me.

The existing request-lifetime, ACK-accounting, high-priority period-work
and dsnoop changes remain prerequisites. The capture compatibility
options remain opt-in and false by default. This revision adds no
performance tuning to the period worker.

Patches 1-14 preserve the v6 changes and commit messages. Patch 15 adds
the ALSA core paused-stop synchronization change. Patch 16 carries the
virtio-snd review corrections and depends on patch 15. All prerequisites
are included in this series.

Changes since v6

Successful START and PAUSE_RELEASE schedule pending period
notifications. RESET rebases the staged capture counters and callback
snapshot along with the ALSA position.

A per-stream lifecycle mutex serializes prepare, sync_stop, hw_params
and hw_free. The trigger path does not acquire this mutex. RELEASE_SENT
retries wait for pending RX without cancelling the period worker while
holding the PCM lock. Failed resume wakes an active runtime through the
XRUN path even when transfers have already been disabled.

Successful paused ACKs no longer predict a stop from an intermediate
availability value. The ALSA core change marks stop_operating when
snd_pcm_do_stop() leaves PAUSED, so subsequent sync_stop can clean up
outstanding requests. This affects PCM drivers beyond virtio-snd and
needs separate core review. Playback pause/drop/prepare/write and reopen
tests passed with the change.

Reset generations reject stale control completions with -ECANCELED.
Prepare revokes the previous prepared state before its early error
paths, and completed RELEASE revokes device PREPARE permission. Cached
capture tails remain readable in DRAINING and the supported released-
pause state without refilling RX.

Buffer allocation moves from automatic managed allocation into the
driver callbacks. hw_params drains old RX under the lifecycle mutex
before replacing the runtime buffer. hw_free revokes transfer and copy
access and performs synchronous cleanup before releasing the mapping.
Existing request-owned page and bounce-buffer lifetime protection
remains in place.

Validation

The corrected ARM64 kernel was built with KASAN and lockdep. Targeted
tests covered pending period wakeup, RUNNING and PAUSED RESET, paused
forward and wrapped reads, concurrent release/prepare, RELEASE_SENT
retry, failed resume, late control completion across virtio bus
freeze/restore, early prepare failure and non-staged paused XRUN
recovery.

The original RELEASE retry produced a lockdep cycle and timed out. The
corrected test completed and recovered through prepare. RESET and non-
staged recovery tests received 48000 frames after recovery. Native-pause
and pause-restart mode/lifecycle suites each passed 13 cases. A separate
two-vCPU test completed 70 seconds at 16, 44.1, 48 and 96 kHz, followed
by a five-second reopen.

The fault-injection hooks are confined to test builds. The normal
candidate kernel contains none of those hooks. Successful runs checked
loaded module hashes and immutable inputs; the corrected regression runs
reported no KASAN or lockdep errors.

One-vCPU XRUN follow-up

I compared v6 and the corrected kernel with the same kernel
configuration, QEMU binary, rootfs and fixture. The guest had one vCPU,
512 MiB RAM and two CPU busy loops. Four dsnoop clients requested 16,
44.1, 48 and 96 kHz from a 48 kHz mono slave with 960-frame periods and
a 7680-frame buffer (160 ms).

In 70-second TCG runs ordered original/corrected/corrected/original, the
original passed one of two runs and the corrected kernel passed neither.
Errors occurred at alsa-lib's client_threshold check while the hardware
slave remained RUNNING. In one corrected run, two readers completed all
70 seconds after the other two had failed.

With HVF, both kernels passed two 70-second runs and their five-second
reopens under the same guest CPU load. With TCG, lowering only the two
busy loops to nice 19 also let both kernels complete 70 seconds and
reopen. Delaying just the 96 kHz reader by 240 ms under HVF caused that
client to XRUN on both kernels while the other three readers completed
their requested frames.

These controls support delayed client consumption under CPU contention
as the immediate failure mechanism. They do not establish identical
performance. In separate 20-second TCG probe runs, mean period-worker
wall time was 343/359 us for v6 and 391/456 us for the corrected kernel.
The corresponding HVF measurements were about 22.9 and 18.6 us. Both
kernels made about 1000 worker calls per 20 seconds, with no probe
misses.

The probe measures elapsed time including waits and preemption, rather
than exclusive kernel CPU time. Host workloads were left running. TCG
and HVF also use different CPU models, so their absolute timings are not
a regression ratio. The longer TCG worker times remain an observation
requiring further isolation; the hardware-accelerated comparison did not
reproduce that increase. RX completion and period-worker function bodies
are unchanged between the two sources, although structure layout and
control paths differ.

All 20 follow-up runs were collected and checked, including three
ordinary TCG failures and two intentionally delayed-reader failures. No
KASAN or lockdep diagnostics appeared. Overflow checks and buffer sizes
were unchanged.

Scope

These results use synthetic QEMU capture. Physical VZ/MOTU, KCSAN,
32-bit and NOMMU runtime tests were not rerun for this candidate. The
buffer-lifetime changes were exercised on an MMU guest; NOMMU bounce-copy
execution still needs separate coverage. The tests check frame
counts and recovery without a new bit-exact sample-continuity claim.
Virtio bus freeze/restore testing does not cover physical host suspend,
and the core change has not been tested across all PCM drivers.

AI assistance was used to examine the review, prepare corrections and
diagnostic fixtures, analyse the results and draft this text.
The new patches carry Assisted-by attribution.

Previous v6:
https://lore.kernel.org/linux-sound/20261028025317.92450-1-mynameisjune111@gmail.com/
Sashiko review of v6:
https://sashiko.dev/#/patchset/20261028025317.92450-1-mynameisjune111%40gmail.com

Thanks,
Joonho

---
base-commit: bcb4494239f57c98a8ef576566b03f2935b3000f
