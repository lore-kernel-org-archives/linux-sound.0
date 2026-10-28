Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156003;
	b=M+tYECxL8KPfHLvf6LIHC3pgYV8S2cp0N1ohXC/muHVMBKasDclsvbqYgV7J1NTwvpAd
	 wGM7j21cmUwq0gLeVuxNmGKimWK3A+yeT4bymGjTxTTRCuGV4vuiYlbPz/3JAF5Q37LBX
	 sVdP6fHb+IjK8m6rsq4Z0hjXjPFwZQ73j9f3Z0VoDPu3dlKpsrBebknmlDaj+7T6xXi89
	 twmlmZVyplp2ke5JRuPat5CHDpgOTt6N95M0NMkc/lwOvPKGspL5XXegiVLkLVBP9hDpF
	 3DcQXhZ68WARXLcAghxaJQn0CeIT66LB28UE+2B8v2EZ9IUY87+OP5SCS6pKYsskJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MFltAnN4KbJLJHAjYR8GHiau2832NVeS+N4nXWFF7jM=;
	b=g3KpwXVdNknSsg/Lzc7IQ/Ry5tErleNVacj2mH0gmek44IGGuWlsXGHjR0LPTYQT88bi
	 mT7K96Bra4lrBCgwoReEwNlFVUzSdgET8SS1TeGxi2ConS0xjQzY/TqxAgvsLnAt+SES5
	 Le2fI0kMvkzLywmhwzD698XgOJ7WWIEWYcPpM4mLCkoOcV/Z05lfod9wqpdPtlkPtWpob
	 2JAoTO22D62l+Gp6gAIBvyQ9v2iOPFEzjYEScLG0t9w3JpqoXNxRwvcP00At7opwY7VFp
	 rlZSfz1I4xrsgvNulExw9beKo67HfLnM1qaTq6wkFp3XtrbW8mo1YUb/H4JLA5iHJsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cl96z0W2;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3673D606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3673D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cl96z0W2
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f33df08eso974824eec.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156002; x=1793760802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFltAnN4KbJLJHAjYR8GHiau2832NVeS+N4nXWFF7jM=;
        b=Cl96z0W2+p/NG4GS6og+oX5YT0/aiv5M1fEt8p74BMN0gjZESdsgzugC0IPtL/6SOx
         MmTx+CNWAUP0wnLUvbXFmFzn0eegQMAMRijcJKGkxDGnZ9PJ+hR2ufU2AoRXlgD4lynL
         Es4X01vmFES9M80MF7ipZMsuS5i827BwKXzhba/AiJ+PNa9SJnUIeHITw9E6t9i5XIqd
         4mcNvVt01TBynXWGrrTt69ZjNwLLjZwlNBR3FZ2XiTCBB7oSJd9wmPmq22ZM4RkINzsg
         AJtvgzIiIBAJDT3DoNaRXK0rwgaxi7W6pd2Pg4R70TRC8qyw4v4GXfAcivqy9W7B9a9c
         fT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156002; x=1793760802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFltAnN4KbJLJHAjYR8GHiau2832NVeS+N4nXWFF7jM=;
        b=GShc+pYvPpvor3zDDnBCSsa3k2G9VfhzDVURg2I8nnwz7rjNXwNEGL+nvXFddOD9MQ
         gna5HuKt1SWGuqgaeyCt1ah+DLvOG+VEPDN4ByuX1UCQXe51MB+P0X0gNXme0xdl9Zkr
         lwF3yBluBzp0uqU7YqoVv7ddOjrxAmlRI8qHKw8lqrNtCuDn18pdHw+5aTtNU/+L8zzW
         hmJdfsPPyuLfaqct0eBRM350aR2TTLMltIGPN1HUOlsx0Z+9yk3hh9263Mr5ct8wW1X6
         4OvSE2l3x6K6zsQeWdKRnFp5PjgCc9e2dW84uecwLDWQAmiHliSn2+wU9YcLMjaWobta
         DFOg==
X-Gm-Message-State: AFq9FYKHuNSPh8RepKidkzsSRbVCadbqvRQgDBFiSmb3wHakzM5+/vjP
	1dKC64XCSnFPHtXlqpQHgdwrv69rBosPA57WyxS9rFUfD09JaJVHGOAKW3OyLw==
X-Gm-Gg: AYBFou060GUtwDniZCfATdTYcyulhU4Q2CpF7SNOBNsgvQQ6M2YyaFZ4I0JXW6WJtqg
	bXixTlHqV+ykHQgnQuL+rtnuIw5Ad9E7Z6UCtIqWX7Q07rzPg4j/WseVbXb7bi9XPtKpHNSQceH
	Oa4bOe39ungS1XljufsLIupDo1MUad3oazaLgAnPt1DXev0nGVMtlvWSQ9xIlNfwCjQGvxaJ3rz
	dQz8K68g7ki7TT4GhKz3njANsgFSnW5rWm/Ymc+hlRHHwGAOKGESPmVNjh81sOeCHHzRB9muZ0z
	K2bfOcP+jH1yAIUf9OqgK7lSESp07MpWeJHSAC7rguftI6GEAuQ37regBQup56fbT+7MNZG5D8u
	B1A7lBv2SKB/Kv1L1nvvFHLkDzj2/NMNMs3umMoDE5FF6ZTz3Ba97mwuKQqkzC8N2Hkfl+UJ74C
	eQg4fY3SeVp1MnY/dci9JrkNDoyy9HlY/RLHhJ+CWhcMhK/6oeM31ZBAyPBUBfp6Q66KCSJkk5H
	XoZKTVZqhVnFUPDU4rLBHvXiLaUUh2+q9mVG1Yw/oXsuR5/J8qo6J+NqZEH1FHDcLr++xIzPP2D
	5ddjljjABZ7dMFwkh9croB6w6h+Ns/1x0dd2J8dNl8xWqi9tbnWh2Q71y6o5jbwf2MKb3V4J6sw
	1/q7C4NUgO6pdkuh9cp6ZiZdFTsbOiq5F3CQTIX0eKhR4oU3NUxCSWMr9ylLxTf0pj/d3
X-Received: by 2002:a05:693c:240c:b0:369:b75e:d24f with SMTP id 5a478bee46e88-36a20108feamr1659593eec.24.1793156002025;
        Tue, 27 Oct 2026 19:53:22 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:21 -0700 (PDT)
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
Subject: [PATCH v6 00/14] ALSA: virtio: staged capture and dsnoop recovery
Date: Wed, 28 Oct 2026 11:53:03 +0900
Message-ID: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

This revision addresses the Sashiko review of v5 and includes a closer
look at two intermittent XRUNs seen during the follow-up tests.

The series applies to sound.git for-next at
bcb4494239f57c98a8ef576566b03f2935b3000f. All prerequisites are included.
Targeting 7.5 or later still works for me.

For this review, patches 1-11 retain the v5 code and commit messages.
Patches 12-14 carry the review corrections separately:

  12: control-transition waits, aligned control values and capture drain
  13: prepared/reset state, failed-open lifetime and pause/ACK recovery
  14: documentation for the five capture compatibility options

The earlier dependency chain is unchanged: 1-6 cover request lifetime and
error handling, 7 adds staged capture and pause restart, 8-9 cover ACK
accounting and period work, and 10-11 add policy sampling and dsnoop support.
The staged-capture and device-compatibility options remain opt-in and
false by default. The VZ compatibility assumptions still need review.

Changes since v5
----------------

Capture drain can consume its remaining tail without queueing fresh RX.
PCM state-changing commands and pending-RX teardown wait through signals
within the existing timeout. INTEGER64 values use aligned response storage.

Transfers now require a successful device PREPARE and a live queue.
Reset fences transfers before resetting the device, cleans up the queues
and period work, and makes prepare re-establish device parameters.
Failed-open cleanup cannot leave period work using a released runtime.
NOMMU capture copying also accounts for native pause.

Pause recovery distinguishes definitive command failures from uncertain
submitted commands. RELEASE_SENT retries wait for RX drain, preserving an
existing XRUN for prepare recovery. Pointer and counter reset is locked;
ACK cannot advance past the position observed by ALSA. A successful
partial read while paused also arms cleanup when it crosses the stop
threshold.

Validation
----------

The corrected ARM64 kernel was built with KASAN and lockdep. The
non-staged drain test changed from -EPIPE to a successful final-frame read.
The paused partial-read test changed from prepare=-EBADFD to successful
prepare and 48000-frame recovery in both pause modes. Queue-failure,
failed-open and virtio bus freeze/restore tests also completed.

I compared v5 and the corrected kernel using the same QEMU device,
48 kHz slave, 960-frame periods and 7680-frame buffer. Delaying a bounded
to free-running transition by 120 ms caused both kernels to reach XRUN
before the transition call. The test had already used half the 160 ms
buffer and had about 80 ms left before overflow.

The shared-client fixture also started clients before creating all reader
threads. A controlled setup delay caused client-threshold XRUNs while the
hardware slave stayed RUNNING. Starting each client from its reader thread
after configuration removed that startup gap; both kernels then passed
three repetitions with the same delay.

Delaying only the 96 kHz reader by 240 ms during capture produced a client
XRUN on both kernels in three repetitions each. The 16, 44.1 and 48 kHz
readers completed their requested frames. The hardware slave remained
RUNNING. These results give no reason to weaken the ring overflow checks.
The original intermittent failures lacked per-client timing, so this does
not establish the exact scheduling history of those earlier events.

With one vCPU and two guest CPU busy loops, both kernels passed the
13-case mode/lifecycle suite. In separate VMs, both completed 70-second
captures at 16, 44.1, 48 and 96 kHz and a subsequent five-second reopen.
Each client received its requested frame count. KASAN and lockdep stayed
quiet, and the loaded module hashes matched the intended builds.

An initial combined run exhausted the QEMU fixture's finite test signal.
Those failed runs were retained, and the long capture was repeated in a
fresh VM with enough signal. They are excluded from the passing results.

Physical VZ/MOTU, KCSAN, 32-bit and NOMMU runtime tests were not rerun for
this revision. This round checks frame counts and recovery, without a new
bit-exact sample-continuity claim. Not every signal/late-RX ordering or
RELEASE_SENT retry timing has been forced in a runtime test.

AI assistance was used to examine the Sashiko findings, prepare the
corrections and diagnostic fixtures, analyse results, and draft this
series. The affected patches retain Assisted-by attribution.

Previous v5:
https://lore.kernel.org/all/20261027234334.32551-1-mynameisjune111@gmail.com/
Sashiko review:
https://sashiko.dev/#/patchset/20261027234334.32551-1-mynameisjune111%40gmail.com

Thanks,
Joonho

---
base-commit: bcb4494239f57c98a8ef576566b03f2935b3000f
