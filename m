Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466176;
	b=ULH4po1z4Tejg7kjOAbxNt486goOWv1tV1HFB65O5YKT8mUFeMc7L7BPImwSt3X4YX8M
	 FAzNNDPqke8ENe7jjUVwNulJyPlVLY4/Q6A25kG6A81m552U/uAuA7eck7dHTveC/ESz1
	 S8ZclvBBDwqpSd2dMh6uSO+wf2n2rFWZeJPFd5IHl8T4rTXC/hTl569bJNNplOPQAnkBy
	 aD/2qtYpegD7ASpAf9kOUtT9CbzpA0bA4YG+htvWP6r7L3f76o8dI79i4QCwwez+1czeo
	 tM5WA4Mtoj16QbeSZgIng5U7yPy0okhMk5oNex8SUefoOOd06QH10mN3HW3LeeaeenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
	b=kA1rMeWQ8h0SP8N2pbq8JBu9mBhFPkH9hhlO6Gsghy2jSApHvrnzyTOxqFzptNYVZbkd
	 iYvBYbcPqBG7IlH3zkBCXcP0KHvCV+lh5QlsxIDQTv7sVdUTW0oEVVhupTBkODrqnqheL
	 J4zV+aIR76zEsZ8B4TMAJJwGHdo07j904tgavfiMRCf9OMk3Vax6kCQi34i+9UUfej3r2
	 CSmRzi22oKnjFlM7yAuNhZoWjqUM1gluIJCAAQEZnIQQ9UtAHcrW6aJOxUaORClZ/xpjP
	 bz8AHCcvXztWPNG+bsC5wHeBrnkswr2NGWSRFvD8v1pEd+fjJ5ey0lXkyU/xaCjZnmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrJs0ywH;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756C606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4756C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrJs0ywH
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2256004b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466175; x=1795070975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
        b=NrJs0ywHxwQmYxpFgdUE4ovjEw4keDZ4vEs91sDaR4ZOgo6GsR/kGgwoExi7uYiVRJ
         raVKFiUVvvurjbk4wYu1M/3iEgw4YVVQvU/d/VBpNS6Y8qA53+JS4kJYLZiPV+BkN38t
         2sL8/Ullur6oSL0dB39+0e8EwWmJxoegnY9vSXEMcTP7uwLiQhm9UwSZKr7FnIJQqCLY
         e9+QjwDYlCTT8wyfDPoucwCK4UEFF+/AQM/QbhTcv8rnb0hSL6YAqB+awj8VB+kzFLvA
         CKhFJY1J5BAJS1vrhfuHwBrfuOt9PHzQp/XDsqfuGiQbTe9xeIuhTMB/9cNB525WSKAH
         aqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466175; x=1795070975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
        b=SI8XHQFiW4Rf/hT7QS0h22Q5Ed0IOwYpgefkWQGum0P/UONCZfI3ScjPbX2Raw/7/O
         llttoFsG9pcJVK8aMLTx7PTEZbdEXVwOcANIX9OomwxnUJfTH/A6gR9nOhK6SqEH4oSk
         S8ouPUuXsJPGkHst89mNDLg98dpr3UddtmKWyVTxhKwwA/ANhu5pa4cWWcVyw6tpxTKx
         pgNhKG1cW8kX4V3iPW3c+AAw085n+F+m+MHLAr502XKTTVby44xUMJ1BFOsmfUqgOkyw
         40tkOA/qzaMbW7rUfftG/QDm5L76xquBCEpiAaJDrwZFlNqlSdBiYVFu9rx1D7KNTrvZ
         0dwA==
X-Gm-Message-State: APuU4Z+FH2vSis0jN9J6+NMPVmMesEqF5I9XLgMLSsGIiM8hJnlomW0O
	7yKfCnHcbl8jStY2knlmX0mcgvwUMGMu246LWg3csn36eEV9b6XETZ3nchcngg==
X-Gm-Gg: AYBFou2EVWBDZq/l3hHANPg3HFHRMYsGdjWvUXffRdFHHUxmTk8ttqj4qaP0tU0Zo7B
	YolCDH5LJMaAvFTcclA5W5gcVfOC/kA2VYKSAy4WHj0v8Kdfs5a0Il6aF4cOd3fcdpNtzmXJCnl
	NKV7SjzsyP/yjy0QbcsdI5bjn4YDE/8HweI5dleQMW+thlAdrZlkj8+FkhrjKdBeiIsny9MOja2
	ERzHYPBPJz4T3xw1nHHXgiXAqkmn7MgEXnG6/kRtVcWN+FUB1nkIOzcDDLvTOJBC1Bqig3hu7W8
	F08HmQbBQvQ04lY+ag6bl314pFqv0OgLmvBCXPf9MtMprrvHQVDfdOxpI49mgoZmbxYxsp6pPM1
	EIWaN2t86rGblUreveCFlH8Q2U+XA91P5D+xBRFya8HUXlu0ZO6SQCBVNbOc21pbk6UfQL/m+lM
	uSUyU43G/d159AUnQRrS5x6ZM1dIKYcQiF7jriVhMNcyO5yX25/yC8YMATZEkOUBixzzpLX4JSU
	Lubjfd266WE4SS608+c7Ij4BQftmnF8PlYFekhx4J+c94yyB80bZ2+bXIdiBi7fwwtp/fLJksa/
	KvXkdtWL4+wWgjK1dvTeTzeOIpAPUAcAFZfiR3ND6gsGMk8Q7jVmPs6wJZmHkyl7xhL8vAR3TL2
	apS8sisYQFwEGABXb9pCjWTZcpRsbtWMRHcYZbDL84jnHUXgPMwEedjFl/snzj5ZggIyH
X-Received: by 2002:a05:6a00:1786:b0:8b6:4eec:f50d with SMTP id d2e1a72fcca58-8bc1c49c6camr4569616b3a.12.1794466175471;
        Wed, 11 Nov 2026 22:49:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:34 -0800 (PST)
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
Subject: [PATCH v31 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 15:49:12 +0900
Message-ID: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

This resends v30 in full. Gmail rejected patch 4 after SMTP accepted it,
leaving the v30 series incomplete on the mailing list. This version has
no code or patch-description changes and retains the existing human DCO
trailers.

Previous version:

https://lore.kernel.org/linux-sound/20261112062446.159-1-mynameisjune111@gmail.com/T/

This v30 revision resends v29 with no code changes. Patch 17 clarifies
the commit description and moves qualification limits to this cover
letter, following the review. The other patch messages and code are
unchanged.

Previous version:

https://lore.kernel.org/linux-sound/20261112053446.73504-1-mynameisjune111@gmail.com/T/

This resends v28 in full using mynameisjune111@gmail.com for every
message. There are no code or patch-description changes from v28; the
existing human DCO trailers are retained.

The v28 documentation patch 14 was rejected by Gmail. Sending that
message through my Workspace account made it available on Lore, but
Sashiko grouped it separately from the other sixteen patches. This
revision sends the complete series with one From address.

Previous version:

https://lore.kernel.org/linux-sound/20261112043516.37010-1-mynameisjune111@gmail.com/T/

The following describes the changes and validation already included in
v28.

This replaces v27 in full. Apply all seventeen patches directly to base
commit a4311e9447bbb219044db38897f95be112f46a8a. The previous public
version is at:

https://lore.kernel.org/linux-sound/20261112004704.49758-1-mynameisjune111@gmail.com/T/

Changes since v27 are confined to patch 12. The other patch diffs are
unchanged.

I reproduced both capture findings from the Sashiko review. If request
N+1 completed before N, RESET could leave N+1's already completed
payload eligible for later delivery. After an external XRUN, rejecting N
also left N+1 buffered until generation cleanup. PREPARE cleared that
state in the control test, so this does not establish a permanent
recovery failure.

RESET now marks valid completed payloads present at the pointer
observation as discarded while retaining their ordered placeholders.
This lets the commit sequence advance when older requests return.
Transport-owned requests and data arriving after the observation remain
eligible to commit. Repeated RESET preserves the discard, and invalid
response status still reports XRUN. Rejected completions also release
returned buffered entries without resetting the sequence of requests
still owned by the transport.

The failed native PAUSE path previously reopened the queue with the STOP
quiet boundary and capture_stopping flag still set. A running stream
could then accept an empty completion without the normal XRUN check.
Rollback now restores the prior flags under the substream lock and
checks the reset epoch before reopening admission.

ARM64 QEMU tests use the actual driver functions with test-only request
ordering and STOP allocation-failure injection. The v27 baseline fails
eight affected assertions; the candidate passes all thirteen assertions,
including normal reordering, post-observation delivery, invalid status,
and STOP empty-tail controls. The running-observation test invokes the
actual pointer-observation helper. Full RUNNING RESET ioctls are covered
separately by the production regression.

The production driver module was built separately without those hooks.
Its ARM64 W=1 build and eight QEMU regression runs passed with the
matching v27 KASAN/lockdep kernel and core modules. These cover RW/MMAP
capture, PREPARED RESET with DRAIN/reopen, RUNNING RESET, and playback
PAUSE/RELEASE, HWSYNC/poll, DROP and reopen. Capture includes 70-second
RW and resumed MMAP phases. The independent backend-sequence oracle
matched 7,104,000 frames across seven capture phases. No KASAN or
lockdep diagnostic appeared.

The kernel image and core were reused unchanged; the modified driver was
rebuilt. Fresh KCSAN and physical VZ tests were not run for this
revision. The earlier v27 KCSAN and Scarlett results describe that
earlier build. The controlled tests use synthetic requests and a known
STOP failure before submission; they do not qualify transport
timeout/uncertainty or demonstrate out-of-order completions on physical
hardware. Intermediate patch stages are application-checked; the fresh
runtime tests cover the final candidate.

Review addressed:

https://lore.kernel.org/linux-sound/sashiko-outbox-210240@kernel.org/

Playback validation limits: The one-period reduction in the TX queue
has not been qualified for worst-case scheduling tolerance. The tree
through the preceding playback-completion change was inspected but not
run separately. The playback gate tests used ARM64 QEMU; they did not
include KCSAN or physical audio. They do not qualify the full series.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
