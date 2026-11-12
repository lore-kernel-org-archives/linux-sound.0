Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464693;
	b=YmgWADaZULEHyBfO0Wkb8PcCNapAagZfQYzJyERfTItOZca5JjBKjCaYl0KaGs1TR2Vk
	 Cw41XUuxzkeBz3gmUm1ZOjbMNq17u5ZbqfH0aBUMwCGprHvWMLMwZW6I5E6EZ+aJKWYUe
	 AgyQw/Nv87FrbwIruXDvDKFS9HQb3yYPVysfzFxlXWjuwBUR9qz8iLjQkGtbghzrSBi88
	 ivFucb6V2EFSo/sxy1tDVtJOrVVDdfyQSl+/fYfqWxEMrJT3a61CbBUT2/aXxxN8EX8sL
	 KdrjAaPtWh9dxBELvpur8rcid3JtZKwurXg86RvuAXpHSSOfHP/zfRYZ31WDgcVN4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
	b=Z0cmW7N5CCgUTLEEZKlFqTefdQkUrs9TD3zhv0dpgXKswyj+8AfX1/wVvO6zUN7nd2A/
	 +rUZIPwRQCsJbguXubfctZxyAseZ0dtjGpgVIAVFYcwZO96EgsfV1rcpkEBkeENUauVqq
	 8rAJuBi0SdBX3lrWl0DtcKqacuP6GkmOEYVrLzZrYVEIXMghWIBtavPSeg+i7rQE1HcAK
	 D0FCP0srhz55AgKWfHwQ6CgVF0wHgea5vEaonuWz5mAlqCSvPry2U+aMq5hREJwkvkd4a
	 7OgF0xgwQR4LX4l7VpwAfXNTLzGndKHQ/gxoNcmq8Nfs0Zw4YFy/5tFQq0g1FRft+sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaPUHdyE;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DFA606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaPUHdyE
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed0e2015aaso16704785ad.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464692; x=1795069492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
        b=YaPUHdyEhUEkOcR6aPnH+zXrYeNOPl/EbbDIJNEAh8SJMCPUXOIo+ikMQJQfH9zp7h
         GXErPCmTGuP8DpP82P7tdRliwFgcwVcqsNS++xYzyNjketv4tqDWRkDnVhJeeS6GjqKP
         TAISUyVmXsJO0/Xouf1WotFCU95eSPJjeyZi+7GvTLgNWXViHPjCF5Qj7ERNTOVz+UAs
         hjQf8MsCuD7gNyHPESmt+Uqz7G4ZloiUZYB2pOGl3zcCrnFntv2ngTPZcUEwvzlsqP6m
         ArwvOjjSlwIf7rh/99g7c91QcJIBtS3w8pobGnmAsE6abKlSKKJS49SFfeq2XYFXV+hs
         XADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464692; x=1795069492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
        b=fnYG74yX7szZXVDAP1wcfv4bdSDJq/GZNn82HrPLdwVrSUFki6rdJjSMj24bHsKpal
         ValVBFUVIu7lX3cxgYNoccFGN7zScr/JKxinO32JuGSNR4d0erna+syhxnsd85fGe8ul
         0Vo/LRx3IU+qVg9dKX/03s1khEHcz8EETW/x1cu6oJcF5T+Rnk3tHM2JU7wrQXgNuEiR
         Z5qqGjuu6EKzC+cP6sL7Vf2wKR4OBOAnafNEn7tXQznDPgQjrBr0182kLYMiU7APLt1K
         WCr0tQFeNcNPqSlcweFPjdMlj8xf2ZLP1X03/jq5muJ8+uCeVFah1Xs8qPAv+QIs+vyb
         CSCg==
X-Gm-Message-State: APuU4Z+rMjqurBLe21P+UIIeE4QWl7oRTrmpT+PGwJTUAn8AfBn8WJ8I
	nv0kt4gLjG9WyU1Ova6Eb/3FqtR+tnffP9hhk7UeFLaGZHzS/u1DRImDdwMx+w==
X-Gm-Gg: AYBFou2gQfoT+Fx2MmW/5LqVvyf3IgaYdoDxq5AMeN+z6B3q5Pg4lE45goGhHH3TaSI
	Clv2R4kqKWdUE0U0fhxKDhallnq57lp778jd1DOtvHfbT8cw9oaJOKKvQEV2gRmEAlT9Miui/Lw
	SViaoQ9djw0quIAnBIaV+r+VeEc5EomX4EGHlvQ5blv+3wEseF/rzGrTmg253yfjPfgNUBWKsFI
	TKZNY0u0vtqZHMpxbSaHsy0dTn5XTq1sF7J6fGXE1GKpdUmUYmGuDSYn903ijiuPG0445olnW5g
	JIFSfezah1l+WXdKJBMpTZRJ2yVPwsA8gNXReao6AUpge+xMDrRWR9D1NJK8eD9GT13QrnpTobL
	iqOKalGG67X1DFjRBNUYnijV7fNANz6ZTUFsYSb16SkyU/7ZAl2Bjabt5agRlNXL+nOEd6l5ft9
	bdx9a7JIyTIaxwBHkGtV72hu/a7Ez+ayBGwC9n8elnb0wDnPc9DySBn8titCxxX3T7XcFJwzbFf
	FPz+RurAACa24yqLkXnshH5z8jei/DkWkcrEFcek/zPQc3GMLCHeKrd6PKsOTPVfw6VlDvg7JzX
	zAjZLv8ZYrCNAkOf06rlCxBDnHg8qO5EvJkSb9G/MFg4rwERF/nZ9xcJ+O8BYlM7KFzuRqUBxWO
	Z3BHF4iOZmOU21YQxaTImTJJp6r8nYUCaccWP5lYEMpCh9/8=
X-Received: by 2002:a17:903:1a26:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2edd7b394cbmr42229315ad.34.1794464692369;
        Wed, 11 Nov 2026 22:24:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:51 -0800 (PST)
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
Subject: [PATCH v30 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 15:24:29 +0900
Message-ID: <20261112062446.159-1-mynameisjune111@gmail.com>
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
