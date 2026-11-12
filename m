Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461693;
	b=lOey60KZrIxNoZfSke6dSSYZfqLUUaJUFBk4GLGFituG3Tt4hRsYjkwZEx3wS1kchJ3s
	 r71aOoShJGtI212qqo07apk+TxsDPgTZpDe4oLBe2GpmpIcdxxLoYY9NnYzSNfZfWAZnG
	 3oLx8ppL2XswfPZzZVxB/EDZjQdHc9lxEYdvf71PPZe9kMlZifsaHdxymcQ3aCetJVxMH
	 rAy9wygGLdWkdxOT7OSe49fTdO44lE8eFXEHa1vbRy6LsGTB8/d67aUzz+9zjRB0+Sn3j
	 EVHsJPJmeY0YJBm2uio3kA5JYoUgsXZaqE/nFVmPnVER74N/aTBd1s2R97IE2GgfedQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZBzb0jWFuu4WC1vXCF6cW6GE7gHM+sCU4Tmo420Ip/c=;
	b=u+N4ph/FA+LunTNsjd7TOn9Pb5s6wlPD0Os38M4AStGzGuZXgqYamrphAWzlsvCvKm4o
	 5AvIv4yNXoV83EjEbHBdsL9ePSxz/nBk8Kwpe5qY8UxXjZsM+k/YEIXh0Pt0D908kt8l7
	 QDTzEZBSBn4FcVmBPDo3g678v2l/G15KWZegmxntAjZ/DHcvwElNnvUGgMwAouLUWNLxm
	 eb+O4oZR6X2OICd1tRxsT4QARn1hNCLrlgL34Bv1hgADTPL/A8JJPHxCDvstqKXXHwdjs
	 e+p5Nfy8zs9OwtTcbeD/DQCkn1MPj2+VIf/wS/Gla8Uql/xZViIqiGYM8UAFFl9fxJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKLyEyvl;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFD606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKLyEyvl
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so5941731c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461692; x=1795066492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBzb0jWFuu4WC1vXCF6cW6GE7gHM+sCU4Tmo420Ip/c=;
        b=EKLyEyvlzMKSq6OEIIQREfxshLeZnru40IjQZm2aIj1zYNJZARALaU5lfOvdaOuQ/+
         s3D4BNuqsfUo7HUW1p/H93MshLd+ofXu/Onr/ckGkw/DkFWziumdVNwFrf/Mwyp9B871
         vXdGkZVtI936EzjXpH9JPe3TLoz+PioUyyA0kNdfhK9I+9vrSTbPPI1OeJQR6yIYrmbR
         Q/Kut/BV0+GvsD9JHH/7O6UeGnR484jCWrKwFxGK8zYz5Uc4fq5RNkDuQ7a39uHSukh7
         5PQ6kTV0j+VGp5VFkErFaAGEKAq4jul6YcthGobHE11aDzOq/zxk1EP8TjrCddivdi8x
         fHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461692; x=1795066492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBzb0jWFuu4WC1vXCF6cW6GE7gHM+sCU4Tmo420Ip/c=;
        b=m5IhFcEs0bAArJckxEMQfSGxeeoPysZHa6YYB1vgSpa2wcWeM1P5GS92SV7nfWjbEy
         TnRdFa1ounSZiSvwtqoF00PnSjnlebb0ROYkOXtkEt9cc1PXa84Q1GF3KpolUmJFqV6E
         q8YWCzj8k2eMEhU+xaauzxCC6PpT4Vm21+UKVX1XjHUUbUXSAUp/8d2MdWjVRrt6HL4A
         IUgi2WWrRZKrBnCYJ4YHyw+e1ZTsw54uN6bYbcT0yAX9V3Pf/nmLEQmVGEAOJbV4RDjv
         oEI/WUaxVir36HhF03ZrATk8OTiQNTzTeuVzU50kpjExcUxus0jlisrkjhLp4kO4VN3n
         Q+Ow==
X-Gm-Message-State: APuU4Z/moovKbB4aBux7ulkE/3ejX+4bjNKhY5fBYs6lTApCCBjHkO+m
	bG6Wor5HJw367GDSYvLl5RRMwyRg16sP+MKFLfTaicFVqBh0aUTeNzWL/4A40A==
X-Gm-Gg: AYBFou0I6TspxF8n0nyS6NykvoFQervY2QB47PGezgYbqtExWbwpcqSNRpo164nlRBw
	8op1UBWq6XKmKnS37YTGuZFl30MkJ1xGZoQZETe5HPzbcILjjOK+cnJCxJKX/6KlPI+e6tKZT2L
	GdSDtGjbngtzXpe8GpsTd7nP5tuYURgz50gMhPOqsrhuwETIkd7yDbOqCo4KOGdKcHOR/ip+qbO
	6qQGlHY42RQcIZ8toJjgJfUAjISV+QD8hcoveNFIuf3KwX4vOcH0cSJC4Yp+ukOaNlm5e7GPkWU
	Iar63XExbnTf9O74tHSvWDKZba/Aa7blGFUXbsoHzFy4y8bzIff1cujYWFVtGFsFSaDpdVvA85a
	RGlcvW5cFZANFFPBQs4DCU41mc2D/l/G/TM3KfxQo2uZigaPkErU/3wLqTx+kyKY63dc3yIvMds
	E4nOh/BchvgE0AsTDh+9CzyNi8N3UCo5FjC69oCRA9IPL0qiM2TfBsX2hAzRqd2WrekFb2s6e2N
	y226IUNGd+TIn51Dmb7HAk5jJ3SnxraRbcYhPtNrnj4w58C7igAEp9OODf9X8VmCz8qsTH6yotS
	Vj/KctaG8b8H4TqVW73nNPpi72NdYZG2rS5XWeA2VLsjIv8KEV5prZ5l/YLFhy53ereNPrZPBki
	iWmhf2K3WwXXF88NIU3KJjiLiR1iA55YxO6KXn1Dq6cENgYC/RgWCiGl2h+Er1/oKmFNV
X-Received: by 2002:a05:7022:b0c5:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b3c27a7bc3mr2652841c88.10.1794461692054;
        Wed, 11 Nov 2026 21:34:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:51 -0800 (PST)
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
Subject: [PATCH v29 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 14:34:29 +0900
Message-ID: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
