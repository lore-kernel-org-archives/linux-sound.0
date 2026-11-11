Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355549;
	b=hPLiPwGf5vEPsujJE5ffY5nii8q93lgFBNjh+knkEBUnnqXGZuFB83RNWvkwQ+/OgPXm
	 76WbStajI3q8PjZnbcPEffSfh1NCPECAI1EAIZUOZj/qhbWsNlZqgs4hSJNXurPHc6o7j
	 VVt/OaT1ju3xCoYOnMmNnk6tl0vxkk3XkIOt8vAea9oikPgDF+rKr8Tk6U5BUHVhnxhqe
	 J8SN8ZbjDnD2EK/d41p5g+DnjLxsvBdO1zc8YpYQ3nHV7Yo3MQVq+uglwIqdJFIsuab82
	 uK68UHdYegHaIVtxMwG16BLkFtUPgEWEw5GzwfzuqfuYLb1dq7E4VeD0lvk6Y6KUkUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
	b=x+G6S32Nlu2ZACfPup2UQtj3aQQUo0E48JRXtrUt43kxwQd8YZDd0Z6adZtyp58nmvB1
	 YinXB1OT9wAaw6L7WBufX+GeqjKarwMHG7AiwzQZrHEXurXVerEs0BFrg9eD0eM0WMxMt
	 qWe0XlRaU6kIjYcZFiYqj4mgU8ZaRMriHzqicLJkD/R1DMgt3mHZgYlxaJ6GQKQdEYSho
	 Jfvhn/K99C5bzh/o9+ui9bUVvySMA/2iXFuS1ZWDEVC04aNjLfV6iUq7u9jH6alM3BW7y
	 FUIHuin3PPONz0SFinmvKACU7Wfvd1sS+qUZP8cqrP2Evm7o6RzQOMiEALtUgCUyAcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f7e8poz/";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71807606A321
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71807606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7e8poz/
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so2046655a91.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355549; x=1794960349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
        b=f7e8poz/5Clox4WDRyNqP1Jp6o7MT/306TEdwMySi6LiSghlBcSVIWpUQ4K7LzBI7h
         R5xXkX2l+0WYf9XLbb8f7SBfTozr3F7Jwp4GQxpDCcBdqLhiB1vdmlBSU50ppMATBUBo
         mF3CWHd1VrkddqeilPjFFb0gD7aXtiBbtoX1PRKTtR6zsix/56FfS91XfT4OVzz+54ZM
         mMNVT/CHzCTLPBP6WALCcFLDuuFyNz5mB4GGC2lT0VL8X4ZUFpRhO01/qyEcUJkyTyPK
         Xgwg625Ed8CGDSJ0cVUoemiEVa0pkB7YbcZ/SSJmwiZECuzGV40s/P1IGzxzGOC6etHQ
         HUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355549; x=1794960349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
        b=E4S/qv2dIaaiJTYPleqNpA3DSTp9toRxG8bATCp+IMVsL1Ib6gBO2dG7Jfxepn3Nh/
         zBR+aDdepk4rk2CV0UuBTNAEC1ZBjwqBEnQekbhIDv/vc92wOyTiBoH0HGPDLacWd25Y
         FtGVlstuJ35TC9vZwCpUcGK1dZqWvuHkKTLIz1sQtL1blT5WOMfbMV5vn1FXVI3GwFyW
         0I9NwMVu3Ze328TeLxmBJ705ImlqWN2mn2PBqBbbralrJKyBq+KOeL+cDHKyloIQRoM3
         TvGX8M0KHkLY1WW7iP0blAi+w/Sd5dMbI1ZSxRnSAkNSAOS+r+rIw1DK/q2ZLSKRr7yw
         Er3g==
X-Gm-Message-State: APuU4Z9d/bwaqwCN5cyVXAuK4IeVEFeOAJCptJLtv9O+ABinKYWTAT6Y
	Kgu0Vaa/M2CuvLIvFlMH4pmRzZaCrPgQFIe+AQtE4JmX1yoIzotOQSAraBgoCg==
X-Gm-Gg: AYBFou1RkAF8v7nB/nuNVNLDnYuZ215gGP8MT2BG1Z8GXwA0/++PKxsVJ3Gt5mtLM4x
	li0RTNv49lpIgnJNWFDz3J+gdsLIA0wzSH2ZtS7a7XVMP8V0k2kTLG15e3MrfQA/k6pfZjz18tj
	2AKBV2z7UpUJ7xaOrH8rS8QWsUrMapa1nvtpCP5DOa4+DxxynYjNQN8s5M5d52/OmBCCNrJ45Z9
	hZjxj9fyXwAx4Wsy0ccvkGCOWUQ5MwuBuOk9LYOdi7mNy4LAvVbR0fOES1UZDuxOJSVAPzJtNGq
	Na1+9j2p7Qzrnf4Yq/iSFl9ShbY+yKI+Cyr4kQRAJJoH1Cyo9szTEvOUpm2Ns/o1FUyWt3mNFhs
	Hl0NsmOgQkjD3X2O2bwB8Chbc6GHXpiuSoNtPlJjS/jLejly76pNYsACPt/5UqCyZxXnu697+qY
	Q1sDiENXGQ2qCqyoWo4zcoeaOYw2PuVhU3cUug7IYCA0Ux5+0DF0adzb0WSJmIXTHEZzbucGk58
	/mHxmLk+dPI97kdOpYfofTljQOe6RsSBN0EWBAcQ7QS/yuSRJa69QCsGJo4f2VRWkxt3OViqkGz
	mOYwWx0489Qd3ok5sWS1z7JlQ+bBZ0RUeUX7Y4nykUBPBBXDUwHtHEw9oyx+05RQiUBbjl/V+3T
	77eX/BcjlSLuc9L3sgz5JVe8Fn6B9KwCuQEtI3hWTsnjr5cw=
X-Received: by 2002:a17:90b:1c11:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b182def9e2mr675655a91.2.1794355548631;
        Tue, 10 Nov 2026 16:05:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:48 -0800 (PST)
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
Subject: [PATCH v24 00/16] ALSA: virtio: serialize PCM recovery and preserve capture and playback progress
Date: Wed, 11 Nov 2026 09:05:27 +0900
Message-ID: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
It also changes capture to request-owned RX buffers so a valid short
completion can be appended to the ALSA ring without leaving a gap.

The previous version is at:
https://lore.kernel.org/linux-sound/20261109234049.79534-1-mynameisjune111@gmail.com/T/

This replaces v23 in full. Apply all sixteen patches to the base commit
listed below; do not apply this series on top of v23.

Changes since v23:

Capture now retains frame-aligned short completions and handles empty
requests returned at STOP or PAUSE. The final tail can update capture
DRAINING. A paused RESET observes the last committed position, discards
samples through that point, and keeps subsequent data at the matching
ring offset. The earlier direct/staged capture split is removed.

The intermediate bounds patch accepts a bounded partial RX response.
Initial RX reservation, ACK validation and refill enter together with
request-owned capture. Earlier patches preserve legacy capture ACK and
completion behavior while adding bounded payload checks. This avoids a
partially converted PAUSE path between the ACK and RX conversion
patches.

Playback response validation and pause progress are separate patches. An
invalid used length or device error latches XRUN without publishing
successful progress. TX completion caches latency without dereferencing
the ALSA runtime. Resume and failed-pause recovery schedule pending
progress. Limiting the indirect queue to buffer_bytes - period_bytes
prevents an unobserved full-ring completion from looking like no
progress.

Matched pristine-base and v23 QEMU tests reproduced the capture
regression and the playback stalls. The playback missed wakeup and
modulo ambiguity also occur on the pristine base. This comparison does
not establish the first affected version within the earlier revisions of
this series.

The final candidate built with W=1 without warnings. Cumulative stages
12 through 16 were rebuilt after the DRAINING notification correction.
Unchanged stages 2 and 6 through 11 match the earlier build inputs
exactly; stages 0, 1 and 3 through 5 have no fresh build in this
preparation.

A delayed-RX comparison establishes DRAINING before returning the final
completion. The earlier local candidate left the cached pointer
unchanged for a full-period tail or a short tail crossing a period
boundary, and left an invalid response in DRAINING. These six failures
reproduce across RW and MMAP. A non-crossing partial tail succeeds in
both versions. The corrected candidate passes all eight cases, including
marker readback, XRUN delivery and reopen. Cached state is sampled with
SYNC_PTR using APPL and AVAIL_MIN flags, with HWSYNC disabled, so the
observer does not refresh the hardware pointer or invoke ACK. This
checks autonomous publication; blocked-reader wakeup timing is not
measured.

Earlier R5 tests cover partial, late, empty and overflow STOP,
PAUSE/resume, DROP, RESET and reopen, plus playback accepted/rejected
PAUSE, immediate HWSYNC, two-period queues, stop-threshold XRUN/POLLERR,
and malformed TX status/length. The R6 change is limited to capture
DRAINING dispatch; playback and running-capture notification paths are
unchanged. R6 repeats the partial STOP, PAUSE/resume and reopen checks
in RW/MMAP. Final-source RW and MMAP captures each ran for seventy
seconds with RESET/reopen checks. All seven segments, totaling 7,104,000
frames, matched the unchanged independent sample oracle. Eight
additional final-source cases with stop_threshold set to buffer_size
also pass in RW and MMAP. All completed R6 runs used ARM64 QEMU with
KASAN and lockdep without reports.

A delayed-TX test observed completion, close returning -EIO and
continued guest execution. Its buffered log does not establish
completion timing relative to close return, and its backend hook does
not read audio pages. It therefore does not establish post-close payload
DMA safety.

The default RX conversion adds request-owned memory and an IRQ-path
copy. The capture_staging, capture_allow_short and capture_allow_empty
options from v23 are removed. Existing configurations using them need
updating. Packed status and RELEASE/reprepare pause remain opt-in and
disabled by default. The new default path, removed options and cost need
maintainer review. CPU, IRQ lock-hold time and worst-case resource
overhead have not been qualified. The playback queue cap reduces
buffering tolerance, especially with two periods. This revision has no
new physical VZ or KCSAN qualification; the earlier v23 physical/KCSAN
results do not qualify this changed RX path. Uncertain control timeouts
can still require device reset or reprobe.

I would particularly appreciate feedback on using request-owned buffers
for ordinary capture and the playback queue-capacity tradeoff.
Preserving full-ring TX capacity would require a larger exact-progress
interface.

The new STOP and pause fixtures are local and have not been published.

The pause option documentation describes the STOP/START default and the
optional STOP/RELEASE followed by SET_PARAMS/PREPARE/START sequence.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
