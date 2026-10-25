Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905187;
	b=TBYWxjReBXEwWsP12wKP/quIJajiXSOkgrkR3lYwfz8It4DLz9gHErqCtAm/4A9cAiDN
	 m9jyQ/37CIhgYguAuzS713MQ+r/LIb5WQTZClo6EHCoj1pT8mk+eCUq1xp1CIigl8Ba2V
	 HFE8GOzNUM9DfuSZetTX3NrinyMQet6ADtaFNz/d7Avcyy/Xgqvqzkg1+ZN1j+0bjIMJX
	 sVNpV0y1VgDCmv12bQ1F9LkOXGhesyOYP1veAQqO78Be8qKOi5y9+PkCUkUEE/xt/nWMv
	 KVpEZhOOwSlRGXIBJzQWfp1tnXNJA0CHGTXfI8D+1X9JwaSHN7GnA1ZaSYurDnQydyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CeUUT3Q4JYEP/r8GnfprbKgPDs256aM4zq4jrxr8WPU=;
	b=c4hoA0Asxuhgk0IoFhd+xXNikEtloHDJldmxiWdgfIQf9bPBTmQG/Oybvp3PAYjkcJ0X
	 GoTTt4hqFsM85XIwqh3s/DJ59fVtGP7qqlDmlVQVn51wXv3NN9gm/ldS+mEaj80JyCAN1
	 ZTw6ohYAKcLCrAaOuuLT3vN0wqdiLmPigWKpjiqRKilhShmiSzgz5cydsCgOyoj+RDsMU
	 6DlewOKU1i1hzNX15x3xEewpJ9Cx02ilhJGVgY4EFj4S3doHpdT2fn5gR5pN5UoFFN9gZ
	 Alqh5k0w3W1YMfeo1OouElb+CZUE21YUuLUZCEmcRhKuutxAupjgdsraXCMPVpT/6TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b2CrKQXu;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA77606A31D
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 05:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA77606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b2CrKQXu
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35d0be18c71so3542144eec.1
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 22:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905186; x=1793509986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeUUT3Q4JYEP/r8GnfprbKgPDs256aM4zq4jrxr8WPU=;
        b=b2CrKQXuwNaOhsB4GJvQgVrSOHnLHJWOGtto5K2czZVUpIqFD5aTdKI7BctRZtGO7Y
         CCYx7y3+Ug4Td4Sk65aVjO7JKHLnHK9FP17a0AKugnduiilnP3nka1PSUegIY5jdgXPr
         PuYTwTATeIWtkvHjgEtqowAWpIKw9iaSRLjkGYQQgXeZ935+hRL7HSMRj9sVTi4h8IZP
         JkOfasuUN4KGUSWOB/uA6hu/2te6pm8EVlsCB7wBzyIiS6STgQuJPBvSZQyummyt0WxX
         oJnAGaJoVyu3muUPgm6sImMaHhGa3YS3jpHz6YSFrhOJ6XyrH9VK5yAen4kKb4/6E+Uf
         8vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905186; x=1793509986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeUUT3Q4JYEP/r8GnfprbKgPDs256aM4zq4jrxr8WPU=;
        b=J6oaS4Jfu0BZwSv84HIIG72JeoIaUl7ZhnRUJVWrexjJO8PB33P6OhFVHT2POwmrdK
         bS1Vpli+SNqzAQFWIfohm0ie4XMqLcw0k1no8oL2suGeypl6lRxyAKIbrxi/UK52d4vc
         pL50GWfQ5Tl2+16YUgTtkqqHOd5qf1eyAUJIUytYWb4EjoB1+vupwLmSSg1sF4n7+fHS
         +0PD2mjNK9j1iXZXe9NoNUbLbtepwkyJdxYCwhc1WZ7EKu80UgBG/WRsDw/43gLswdsJ
         gV32uYV++DskDB55NjwdyiWMt9ozDfCa/Jy1VLXmTQoRL0iTbC7L5Kye9FefBKP7v6Lw
         qJPQ==
X-Gm-Message-State: AFq9FYIhgSv5sUAzQyieAN7it78H3YymRWJ8kI7fEGwSgcKE7KBHRV9x
	34agejXaUsUxyH6m72wCLov4u7MmduNEERuC9KHVqEZ0cc78ONedHpCJSn+42zkC
X-Gm-Gg: AYBFou0vxXwYbeSh4K92LqTd/93vrnuyqEuje6Z54KPFSWXgNcFz5D2SgQ6SS/14YIg
	ZGzeVbUk5Vfj54uZcmxqkkO5dvgiJyjNzg7hKDnYXFhlfZJUokUwZmdFL7tm0CX1tmNL037+6rN
	bP773w//TGmW7Ag0D5G81gv15eK0Hpf09L0Vq6x/+ixxWfZDfamKmxIUWdYiTi71iwV0DUY/GjT
	pTtYIzy0SJyPueKcuob5gGKw0I+RoELb5g/I6rJak64j0qdl4U4zI9j9g4IuSdlqfvRqWjCuQ1N
	mUjT92oMpyiXjHHy4vWCx+PyMmnTxdOO0HKER9xecKyTmzIn2ZCYBt7Eqso3TYGzapKm69lx4kg
	m766G5t14z8/UmG2A6ei+KC6H3862jg1oOx94FFOZR5+/akUSsHPeGy4goeCU8eWFM3TUtTbyQN
	dQs+C3unKVF5mr7W4oPxoClsTLqtD+g/XhDJTdr6IaAZcRuJhDpEKGAMMLPe91+UTfCjiSAlMd8
	0wg+rlrTEdbOWGjJxOO96BzsrlJSofxLGDj1TOXpSLliwnPjnP6cSk2rDIpV9qENv/vGBFfJP0Z
	Hpqh7G4SpcSJjChC6ii6mer/ZvCwdhpq5yoBUiL9KsV56dZFBZYLRYPqOZdElZGioFYFrDX/6A=
	=
X-Received: by 2002:a05:701b:4554:10b0:19f:cc98:f603 with SMTP id a92af1059eb24-19fccb77ab4mr88773c88.1.1792905185931;
        Sat, 24 Oct 2026 22:13:05 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm12588456c88.14.2026.10.24.22.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 22:13:05 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ALSA: virtio-snd: fix dsnoop capture with staged buffers
Date: Sun, 25 Oct 2026 14:12:59 +0900
Message-ID: <20261025051301.54640-1-mynameisjune111@gmail.com>
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

Changes in v2:
* Add a machine-readable base commit, nine prerequisite patch IDs and
  four prerequisite thread hints for automated baseline reconstruction.
* Keep both patch bodies, code changes and existing sign-offs unchanged.

The v1 submission was indexed, but Sashiko could not apply patch 2 against
its default baselines. The prerequisite links in v1 were prose only.

Previous version:
https://lore.kernel.org/linux-sound/20261024023232.84448-1-mynameisjune111@gmail.com/

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
This does not guarantee a synchronous error from the sw_params ioctl.

The ACK accounting and subsequent queue refill each sample the policy under
the appropriate locks. Prepare and teardown reset the cached state. The
existing ACK-race and priority changes are prerequisites to this series and
are excluded from these two diffs.

Testing:

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
