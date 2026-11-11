Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365823;
	b=h0aBYZUXWJnESvAu5ddP7cwpgJYXaU+wnoAqC+PCD369GbZKq8JFX3NwQF8ZvsUy51nN
	 yxiwGaFOc3buOcLpK/8yjrLM7VGJKOATaIwtheDim81oEPwSQ2rUeRUM/mN8rKPrMyJSR
	 Bf4PVkzOAFM9eSKuOSfYrA99QMQeFhHiEdAEsJuhrF1JXeDSSOOX8663UeG6JVyoC79zb
	 P6ISh9OPhbRsZIRSfF00OnID1WTRhLGyrF02yk479CNonpoAz3Qi2JsmeFcA729RWpFmi
	 DV7H99udyjgxKgaWtrbRk4VqsWvxyg2MntBh+mNV7pVu7SN2YILdF7tJAxVx8YAZ82g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
	b=TKVDDkaohVgjvbafqfjW2zLsODQ4N2Dfc2zTyWRmzLdTjjJj48Q4dWGw0znIk3Ylzi6H
	 qf4VsJzQgLbhm/E0S41PMsPfhRj2b3HiaprwXud68TXhLU7p6psZQwqeJOIVo49HWdS72
	 GeBaHGnLWT+yQnR92UL8bQw9nkrp7qmfuihXL4qhQs/IrutPdDG0Pck7+KxCvXWWo9Gc6
	 EpgjNjZ8Es9MANPF8Q5vNT6SF51HtYyCaGCYfxPqlWarykqjt6nTF8S5i9nB8Fx+hpE0n
	 KuQZ9b0FCfZdYJ8UvT7kwnQUomo9bDiPtFSuKLwrrkK1SBBJguNT4Rb8HuFUfBCqt/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRnwyNK4;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84CB606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRnwyNK4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4190244eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365822; x=1794970622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
        b=nRnwyNK4+QgxDLZzdUu9b73ahM2d1sl08rYnO+5mpeJnI+ijjzki+f+1wpSUL761PG
         X08xPA8vR8t6+HjDpo6t/3TsOwlJfgO++OlIxFdQKzVrx3R45DnjXdl1HSeODB/K2JS6
         OPnaR7Z4Bssb/aveSf6xD+p0pVrgqGVvdi9ELDhTb+ny7//QIXQZDX5/4Jqj3mvpsaPY
         Jfk+cNqvhJ1jGZtvloRIaZsWi690zZi92IhlzA4EXMj3/1ITfdNk+O29nKxM7sTlJ3cx
         ozPVl/u/cXtkcJLYfwLaR3QinTV0TjGLVhuv3K2Xw1uEBsQbeyviiJiRo+2t55bXj0SJ
         UgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365822; x=1794970622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
        b=HKKMkBP3Idhwabk/6h4TNj9oJIFTPs5xJOtW8ifUNUlbt58asoYZdOl02zaR/glPi1
         F2wOM3liPI3ZEYFuP3biNVuRS7aI65Ohi7huwdBu9v2UdzC2dFRwVLrf/bdXTz/yiiQu
         VAzKEXEeKRuvz9r/9i1ABQFBkvBNHzdB5VUM/MQoS4zGmqymZkmWTetIm13UdzXiX1Uc
         vSa96+itDp3EN2ztTIY0fmn7S1QOuBfYKLSKFthZZBSUHF/IGtG9Box9zu8sSmaDnvcF
         MFi2LFZiko9e0j2w8sqUJE2HwY0kuGQ5vNPqTDudcSLxr2np4P94Frur5y6r4uAmjv4K
         yXPw==
X-Gm-Message-State: APuU4Z+N1QQE2Aljdvf1r7YQtzKh333LOxww8chmWs1Ab3IiK5i0vxJB
	Gg+EZ2wGXY4+3Wdd0E6izQXMLxsZzc9luxJG6baTNEl4Ma7T4++5dEOgubSVOg==
X-Gm-Gg: AYBFou0kTX/1vYFAr+Gna9Y0tcWqWbzcyn8/EMtElePnAOsptV1Zi3sYRXa1U4yzdx9
	Scg4YytjjHuF7dC97oTEvLKlf8jfqnOhV02EMsfS7tD8OEuF/eFEPY+XdmffHylQhxtUsjjFugz
	/sLtaWBIv8tjBG0BL4Gk5X2hNh+6SFSsWWRJ4RrmBx8iTHmA6mFeJw607fUlgRKKg40/YPQmJP6
	m5iv3mYmZsePobV/K4lQkk8/MW+rePh+Su3qXi7TtOtqKxQNfkIDHVLZ6HMWmVQzg3CsV/L5jsM
	T4vHXT2DlohWnvFChmrXTGlq5gyLQiNiX1mIMIHveYCARkoJgvcoWkUt3NIbO/YJnZSDnj5y5GH
	lnb20UnQc4MBVT/ow6u3NuFvSdMl1Lt9kpEXCLrMPpTTW9HqOeZykw/P95zmHElr6Ism18YgZVc
	VRj2qk3mc43uboAVVfb74WiB5hlzlMbj51tJvlTOYZsSX+EQOdMEVVfVYJhtUDwNzMwyyaFJJxB
	ZE0lykvLO0NcHTUU6DebkdfW+jYrGn76JNSH2B1Zj/SSsgJu+d4+89jp0CS/jGBV1rKVtXLNm5J
	+9CfSdG+udGFVXije3smlCNoaNTpd7OIbK0JiqKQzP6cKIdTHTuEGbYva75yvIWmq/y3m0knNU0
	GUnmiv3kCviuAEeNPY1dljaCWPzgW8XnPpGMOK/gILBz4EdDxDfcOLbXN5/YTqB+7Hxo+Wg==
X-Received: by 2002:a05:693c:808b:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3768646897amr1766149eec.21.1794365821641;
        Tue, 10 Nov 2026 18:57:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.56.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:01 -0800 (PST)
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
Subject: [PATCH v25 00/16] ALSA: virtio: serialize PCM recovery and preserve capture and playback progress
Date: Wed, 11 Nov 2026 11:56:39 +0900
Message-ID: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

This series updates ALSA PCM recovery and virtio-snd request ownership.
Capture receives into request-owned buffers so valid short completions
can be appended to the ALSA ring without leaving a gap.

This replaces v24 in full. Apply all sixteen patches to the base commit
below. The previous version is at:

https://lore.kernel.org/linux-sound/20261111000543.28550-1-mynameisjune111@gmail.com/T/

Changes since v24:

Capture DRAINING keeps a full buffer readable and reports progress
beyond capacity as XRUN. The read loop refreshes availability after an
unlocked copy so a tail published during that copy is included before
EOF. Playback drain completion is unchanged.

ACK checks the core buffer-access gate before entering the transfer
path. The existing PCM lock barriers in prepare, RESET, hw_params and
hw_free wait for ACKs already admitted before the gate closes. Internal
RESET pointer observation retains its separate bypass.

Playback period work checks for new progress or a latched error under
the PCM stream lock. This prevents work queued before a paused RESET
from publishing a duplicate period after resume. Prepare and RESET clear
both the cached device latency and runtime delay.

The capture allocation and copy description now lives in the ALSA
configuration guide. On MMU systems, per-period page rounding can make
additional memory exceed the ALSA ring size; the request buffers remain
allocated from hw_params until hw_free. Pause documentation now
describes STOP/RELEASE followed by PREPARE/START. The ACK
error-propagation and teardown wait patches carry Fixes tags. Patch
descriptions state their changes against the pinned base.

Validation:

The pinned v24 baseline was rebuilt with the saved KASAN and lockdep
configuration and the same builder. Fresh cumulative W=1 builds cover
stages 2, 12 and 16. Each passed with no new warning lines in the
changed audio builds. The full baseline build retains 517 warnings in
unchanged ARM64 files; other intermediate stages were not rebuilt.

Matched synthetic ALSA PCM tests compared baseline and integrated
candidate. The candidate preserved and read all 8192 frames in a full
capture buffer, returned EOF on the next read, reported 8193 unread
frames as XRUN, and returned both a 1024-frame prefix and the 512-frame
tail published during an unlocked read before reaching EOF. Playback
drain still completes. These fixtures exercise PCM core behavior, not
virtio transport or physical device DMA.

ACK probes on baseline, isolated candidate and integrated candidate
verified the baseline admitted a gated ACK and queued TX; both
candidates rejected ACK with -EBADFD and queued no TX. All three also
verified completion of a pre-gate ACK before linked prepare crossed its
lock barrier, and the internal RESET bypass. The integrated playback
probes verified stale work across PAUSED RESET/resume and clearing of a
synthetic 256-frame device delay after RESET and PREPARE. Clean
integrated RW and MMAP capture runs each lasted 70 seconds; all seven
segments totaling 7,104,000 frames matched the unchanged independent
oracle. These QEMU runs reported no KASAN or lockdep diagnostics. KCSAN
was not run.

The default RX path adds request-owned memory and an IRQ-path copy.
Packed status and RELEASE/reprepare pause are opt-in and disabled by
default. CPU and worst-case IRQ lock-hold time remain unqualified. The
playback queue cap reduces buffering tolerance, especially with two
periods. This revision has no new physical VZ or KCSAN qualification.
Uncertain control timeouts can still require device reset or reprobe.
The deterministic review fixtures are local and have not been published.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
