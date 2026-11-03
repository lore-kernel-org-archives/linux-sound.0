Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693308;
	b=KsNoW4LMvKcXxWUcXKBB64c8SW4eOQ9B2iH5yqGpxaTQQDWE4fItAvFdfUjvPQ/rjh3h
	 ZKTeetlJO0EAaLgrHH45LMxRa+8JKnXXOD2BphMHZrgV6+q6cMgCt7Yxtl1/BTsv5GRqK
	 1WoHI1dQkqfFBBzls3EFtL84IJoxPXMTDsUHsHse60S4HFNUHGMWmzcXhe5LBRfP3JTbb
	 rCmKzia7QWhIRzkBkeqXIXH7mpBnGcX2VeDyLc0xUiblXSt47aFa3UItkkWDJXsnwSntw
	 UWIrhYHqzc7S76k0tWRiyfgJFnUq2NlSKvHGoifpd7615QQaIDMDF9tEPWDDduSOZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pXz+ijE9EUDzSG+3qju7ZVTn1bPYlfF6y8GttsYWRPU=;
	b=Gr8rH+NFFVpqlihs9tLQBLw58FV6La7OqJjLUdNBMYMsazJMa5snI6xeh/qlLi3C/vix
	 PnMZrlX/PVWPss8QdrSIQC6h0xTDNZdGwDobuG+Q2Uyt1fM934OSaZRzwgBvdT7qJE4+S
	 F07abtmtQA5OymS42ufj9Coz/OlcPo+2EtuMpcMdhW6gjMJOMlYLe6K4rEhgJRu6k9Wag
	 wR0DKCbZ3sNAvehqzh0hBoEqxS0GwkM8M/ZQS3rAwg8sAQ9MqNNgeDMv4oqaElTfsIlMC
	 7HendOKWnKpJIONOF07MhU4+vtPpsvbHR1kYdJBFzaPz+cyaQpe6uOFnxF2ZV1f0KIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIDvOHiQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCA606A336
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FCA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIDvOHiQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36c9a93a1abso114244eec.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693308; x=1794298108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXz+ijE9EUDzSG+3qju7ZVTn1bPYlfF6y8GttsYWRPU=;
        b=gIDvOHiQA62EY0OhRERy0FS56JN7ggqgiTUAPuG/rYwzPoBp9Cc8DWwLPSFzb5i05z
         RlaVeBWgolcZC9FOZf2wQ66AUMiC6yDX7oa8gqO06N2Gvzh3TmFj5iqWkdWxajc2uGFn
         l8iUxCLQ0+H+Ot3L1usXT7dGPlHaW7HZcEbLlMgjZSYk6KjdiJHC6Q8V0uFaDP9WOLuI
         eua1JgO6kHawTnir8t13F+GYAd16WxWM3G/sr1uytrLegMjAohjoxLFuTsf+PdjkQJ8O
         fGm+rHRZUiFCxhjh36oRwjCXq6daVYxPlSkM4ZH0Ar9LrCUzCDx+HHHHlyq11sbN1vmL
         T9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693308; x=1794298108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXz+ijE9EUDzSG+3qju7ZVTn1bPYlfF6y8GttsYWRPU=;
        b=tWYOm5Gh2uUv08ObEPMlgw2vHvZSpSRmSrve9fW0sY9I1K4xEN0Om37Il+VOKp74kN
         /CoSQPG3b4L5jY8BVxhpEFe9sSzbi67zxZ/PaDczmhSf5xyk6KBaZeJqUVO4T1Hxmir0
         ftx+SdrNc5N5QYQYeb5GdApqxrwVX68ZGKD6LJtrKdFxw8m2YheQhXCZo9nDmPfCUOs6
         Fz+ton3il6kd2jWQFohYODR9qP+YCFwo+yB/JDEbuQPNVvtgchltAjY6UlFwmyhdVakV
         NiJoXKaUgPUAmZP0CEQdUvlcUZ9/eRIP1LYEl+cTCWT3yiWU3MAbUeed+g9gmfLjTe/b
         jJog==
X-Gm-Message-State: APuU4Z9ksST2AO+ILIY9obQ+ztixjo8loBvdMwm4ajpUV/B6M4gPVyld
	97ColXtnvymsv1AefaiDoCN6zwLTqCBAwnSDSwfocTVbNFY1kVzBPZ3fp5QC2A==
X-Gm-Gg: AYBFou3LsT+8STzO/SfDNthsZvG3c1IgNW3rBa38BmWgH7kXu/yC4kgFIwWtPbGlOgE
	KBX6Mp5rhM0TOiMfW2+9fVQeiatis+RgGgwwmhr2C8izs89ZJ+G0hkOBFmiMSu94idMniMyx6xO
	hyi6H1UtpvpSawgTgTfQblU0dntc+8RJwoMvwR0GJrltU77Vpy3iEs5zwJzh92CsAimiqGAfOjk
	J5+tdDSC0yem05xPQqpclAQlO/a3QzYckPWIQBIMIlXW2QN0utsSLgliboVj50sQhIXbimTjq1k
	n02dP9N9o025sMFzXT0CgLjZPgB182aYkfHADMIt3e/cIL1JhyuIehhaNzFae6r71Nqv6sEwpU9
	xwz9CInhaplDsQ62+KDGrPpd4m0Hdvmo4O9uL5+2MetOKSPk1+Sr6X229O5BNycjtmiEk8DQCgb
	lwhbwSJCgySYCjmPU+qcgGu//Bh/3xig52IQKkAxb5vJc6oNxl0IBsgBR/JE71QZGK1UU6YaT7A
	dpoesJnc1c8y/3ZBKrJ1X5TGyIhEXM5burJvavgIsDshPSf2R29JD9DIyuczWxQVekhT+hLnHzy
	jY/gP6VrxOx2a7mNX7GvOaPPF8c+L10W7iChncGufJJcQzdAIogY7uNMAloLYv6xVTI2yp44nWd
	pKjIp8ERywgfHhhZ5QSjamVtlSXKFQFR6nkNUCdMbumRStkg=
X-Received: by 2002:a05:693c:2184:b0:36c:9a25:8073 with SMTP id 5a478bee46e88-36c9a2582e2mr543808eec.2.1793693307306;
        Tue, 03 Nov 2026 00:08:27 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:26 -0800 (PST)
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
Subject: [PATCH v13 00/12] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Tue,  3 Nov 2026 17:08:09 +0900
Message-ID: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

This revision addresses the v12 review and Randy's formatting comments.
It replaces v12 and includes the unmerged prerequisites. Apply patches
1-12 to sound.git for-next at
a4311e9447bbb219044db38897f95be112f46a8a.
Targeting 7.5 or later still works for me.

Previous series:
https://lore.kernel.org/linux-sound/20261103000403.67106-1-mynameisjune111@gmail.com/T/
Randy's review:
https://lore.kernel.org/linux-sound/dbf3b343-0af1-4297-b78a-bed68865d59f@infradead.org/

ACK now checks the PCM state before changing transfer state. A raw
SYNC_PTR racing with DROP previously changed SETUP to XRUN and re-armed
stop_operating. The correction preserves SETUP and rejects that ACK with
-EBADFD. Event callback admission is protected by the event queue lock,
so a callback pending at disable cannot dispatch into freed ALSA objects.
Enable and pending-event draining use the same lock.

The prepare gate is cleared on failure and device reset. A successful
hw_params clears the suspend flag, avoiding a second SET_PARAMS during
prepare. Staged pointer queries reject unavailable epochs while retaining
the released paused compatibility case. Playback pointer and ACK paths
honor latched device XRUNs, and TX completion preserves the latch. The
pause compatibility START path reports a latched XRUN as -EPIPE.

Staged ACK retains an unconsumed sub-byte frame for the next complete
byte, including appl_ptr boundary wrap. Capture RESET completes the
private cursor rebase on error paths, retaining the XRUN latch and
notification. Synchronous teardown owns a balanced work disable until
the next successful prepare, preventing RX completions from requeuing
period work after cancellation. The last completion always wakes the
release waiter.

Playback RESET changes behavior when TX requests remain device-owned:
it returns -EBUSY before changing the pointers or queue accounting.
With no outstanding TX, it rebases every indirect offset and clears
partial message fills together. DROP/PREPARE retires a busy generation.
This affects playback callers with capture_staging disabled as well.
I would appreciate review of this busy-TX RESET policy.

The refined partial-period test demonstrated why the accounting matters:
a 64-frame partial write before RESET caused a later 960-frame write to
submit a 1024-frame period. The correction waits for the remaining 64
frames. Linked RESET retains first-error and partial-completion behavior;
both member orders and group prepare recovery were tested.

Full-ring capture overwrite protection remains enabled. Delaying RX
observation can overwrite the ring before drain. The candidate still
returns -EPIPE in that case and returns the correct 64-frame tail for a
normal drain. The post-cancellation worker issue is handled separately
through work lifetime management.

The suspend-flag findings share one correction. The playback state
finding overlaps the ACK/DROP correction; its remaining XRUN handling
is included here. Capture compatibility options stay opt-in and default
to false. Every patch includes a diffstat, and the virtio_snd parameter
entries follow virtio_mmio in the documentation.

The series layout remains twelve patches: request and DMA lifetime in
1-6, core stop-threshold access in 7, partial-progress notification in 8,
the optional PCM reset operation in 9, capture/lifecycle/RESET handling
in 10, work priority in 11 and parameter documentation in 12. The core
source is unchanged from v12.

Validation selected 19 ARM64 QEMU runs with KASAN/lockdep and separate
KCSAN_STRICT tests, including expected-failing original comparisons.
The correction passed native and pause-compatibility lifecycle tests,
prepare recovery, reconfiguration, XRUN delivery, repeated teardown and
both linked RESET orders. The staged 4-bit ACK and pointer/error-reset
checks call the real driver functions with isolated kernel fixtures.
They do not establish negotiated hardware IMA_ADPCM capture support.
The suspend test models the flag before real hw_params calls.

Uninstrumented ordinary and staged capture each passed 70-second RW and
MMAP recordings with RESET, pause/resume and reopen. All 14 segments,
14,208,000 mono S16 frames at 48 kHz, matched independent sequence
hashes. These results cover ARM64 QEMU TCG with two vCPUs and 512 MiB.
Physical VZ/MOTU, host sleep/resume and broader format, channel and
architecture coverage remain pending. No general high-load scheduling
improvement is claimed.

LLM assistance was used for analysis, implementation, fixtures and this
explanation. The patches carry Assisted-by: LLM.

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
