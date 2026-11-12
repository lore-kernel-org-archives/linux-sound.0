Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444432;
	b=tKe9rIo/AfehpDzbiVtyl8eR6Vz50nedsouUXzNTuaxqqMakVy5XmKPBENi/vZx2UdhC
	 cH/VNqGyHgT95xbFyF5tLUaiz/gaeay9TC9qfzCBgNSQvskL0xX8D4AuAS1/GPisPA+a/
	 sqDnU6T0upNdaYsNBSQ1GkyHK/A6cFQ4+oTor8tJWCJ7k484aIu9sXOHnmDbEnvrqM+y9
	 Ro3ngv9nYctp32LHSksie0mcp58/7WO62PG36u+2NyZJUsGMhr/EVq7vFTW7QwGA//Vcw
	 /+qJdpk2lmpWpRfgzaZy+26OlVS3IZX2J/piY3APwvvXYLfJ7+W2CDtSYx4lBcNi82g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fAFxYRrida1pHK+o2wBbcMW3d1AOWkL58P23yqKUQ1c=;
	b=eLUJituvrIkeGU7NWeu28yCnYFDLbLwE+ElccrEvJx7mrYwQH0i/1raoFCkXvUT/nd2X
	 /okWmTYFLZgLMk0CRAua3x1LWBVnOGwZmMsC08BESqwPmYZC/T2dU0KM1EQ2kYWC3w6o+
	 yJphcq6r7Q0Zp+ZOFa01FA64ScEbuY3OL2dbQLCdSvzhvqFDpyLVoHdJuYbb3W32QbdzY
	 5xzx42rK+Ityn5IRwfe21P34/Gg9aoNwNH/RU6NPe/h7YIfFB+tY6Ycpq6SK6ceHGSpZS
	 1XsVvOmlaDmybj7hnpstaJyWUPv/ZTK3knX2yrrXonmeA4FiRocRpECxHr9CalZUmUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fORmNeNN;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562F606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C562F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fORmNeNN
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so5703892c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444431; x=1795049231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAFxYRrida1pHK+o2wBbcMW3d1AOWkL58P23yqKUQ1c=;
        b=fORmNeNNDswUQ/behPqds5Qrq7iQNvs0SoZwy0f0MWmxEpoy6giaAOpxlm8bXpUplL
         n02/NJ18Hiupgu8d+WeGBVZgtv5pbLmaYZKogC+3fPgXjJ5RvEdTibrcPun8Wn/E7qv8
         DWzPmXBJhDi6/HzZPhLVb0igr4o7kFI/Tu6YZIVmFWLNh7QaTmIJAYNoF+zbzgdKfuNW
         ok7jWXnNQUs9MiHhy3YtrmtB6BVMvM/GHsZ3GEiRKtYw0tvPrEHKsghlRk6qd1lsygrv
         61TKvj68lY9eETF3LLZ0h2DGYB98pc0vDO16KP5wgwpcpMQaE2K313vhqMMSf0CUOL3f
         ZUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444431; x=1795049231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAFxYRrida1pHK+o2wBbcMW3d1AOWkL58P23yqKUQ1c=;
        b=zLMP4bZjNBleubbULQOOrZHJHFm7xVxoZydf8TC/vbAhweSh4ewGQLVH3U+MSLGjBI
         RHviGNLwOyeQDe31nh0Aa+Wg071UWTzU3YjVd6VMrBC4EmtLc+/k38jmAwj+iG7N8Q2d
         msZiitBtxbWecMlydzypGwhH7TMS4Tfbahtk9dnp3I9bvAzKLYt4lrwXFkxWnaNnVbfj
         ppA2gbwTMwF86bN7FCCNWZEE0Qbbb5kSFcD2gPDla43GvSz5SHLDs73mYGYQsDmgkjxO
         THSTe5z7sG+dm4eKNbqdNVNTVXs66pkRI0crejOsVKFL7C5AHrxbQJxwLe9nKe8K+giI
         LRTA==
X-Gm-Message-State: APuU4Z8Dr2nS2HarPPPkQ5IyG0ZD0hnGBa3YW50hDIrk2YJRg1cCU00f
	lBILXk3HPcCGmsCJ/B4JoQIDVd3DcpeTAVdmMrQJ3Gh0mUWPqc62Y5OWollHNg==
X-Gm-Gg: AYBFou1b3xxQkN6/M1Ff2okHBMiMV7tUW39SD4DnJx24Ctj47BTzE4MJUYVYGt7TpgB
	z5imYdwOR10hm/dlem8SUazySPG48qrz5FvRtfvgUZSZC4dM9VbLfy+pkJytZMw+rdnYZUFS4sR
	ff252j1ThBMVPnT0sgUuvP8H7qeuchLlxTGl/8+YfAaNVteOZxi5RkOoPzWyaBKYtSsUSeT3JSD
	lKAKF+HluXF9Lo48qs8ur/QTNIRVkgSuKBJ0kYNpi+iYm7v0NVdj2KsBEbMDqe9fpjZkSTsga9F
	811NYPv8pgUfd9Tp1XeUjnIoV/0SH4VPGyhff3DyJJcAxUN+YuUjenlrrn30MCAs/OiOdLsGXgh
	BaUTW9ULWPOzZRwcEuVbIB5vR5MJKhYpw+NhFHt1adOIFV1WpkRMpVWCvkUQWQnUmexEdl5VADt
	kqivUhVU0fkVoTs2AsDvurC2JneNGaaD/9hwkVM+LAQLwI/X6HQlSIE2s6z3MbMAa0I6TYyuQG3
	ghWZ/Yb0rSj5uTow9YCmNzwACJ4U42tCGqbAOcPeF8psyUfuppqRFHQQcm32NnE8zVqFhrbikv8
	jNFoVqlHeImUbsEfKnHB3pmu/Xzg0ZvoxuzDF+wUtA9k3q/IvDs595phz519cUCzi5npsEOhYCH
	B38RQyQ+6bm7EMm41lKnH0VlM/343xT7d/3bDRu84qRcfKUPP
X-Received: by 2002:a05:701b:4583:10b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1b3c034aac5mr3255515c88.36.1794444430392;
        Wed, 11 Nov 2026 16:47:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:09 -0800 (PST)
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
Subject: [PATCH v27 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 09:46:47 +0900
Message-ID: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

This replaces v25 in full. Apply all seventeen patches directly to the
pinned base commit below. The previous public version is at:

https://lore.kernel.org/linux-sound/20261111025655.63951-1-mynameisjune111@gmail.com/T/

Changes since v25:

Patch 4 handles linked prepare revoked by a concurrent disconnect or
suspend. It invalidates affected opted-in members to SETUP while
preserving terminal DISCONNECTED and SUSPENDED states.

Patch 9 adds the missing Fixes tag for the original virtio-snd control
and I/O message handling. Patch 14 documents both default-off capture
compatibility parameters and their behavior in the ALSA configuration
guide.

The capture path receives into request-owned buffers, appends valid
short completions contiguously, preserves a valid STOP tail, and reports
overflow through XRUN. PCM lifecycle, request ownership, and recovery
are serialized across prepare, reset, stop, and teardown.

Patch 16 adds an explicit application-pointer form of the ALSA indirect
playback transfer helper while retaining the existing wrapper. Patch 17
preserves playback progress across pause and lets the pointer callback
refill already committed data while buffer-access admission is closed.
The playback queue remains bounded below one physical ring; this reduces
queued buffering by one period. A missing ALSA control page follows the
common playback validation and XRUN error path.

The final candidate was tested on ARM64 QEMU with KASAN and lockdep. RW
and MMAP passed boundary PAUSE/RELEASE, HWSYNC/poll, DROP, and reopen
with two-period and eight-period rings. RW and MMAP also passed accepted
RESET from PREPARED followed by DRAIN and reopen, and accepted RESET
while RUNNING after ALSA reported the full 2,048-frame buffer available.

A separate paired gate fixture compared baseline and candidate in RW and
MMAP. The generic ALSA indirect helper invokes ACK for each pointer
callback, but masks its internal `-EBADFD`; once `hw_ptr == hw_io` with
no completion outstanding, virtio period-work progress suppresses
further callbacks, leaving no ACK to retry the refill. Baseline stopped
after 3,072 completed bytes with 1,024 bytes in `sw_ready`. The
candidate drained `sw_ready` and completed 4,096 bytes without any
further client ACK. A hostile test-only hook changed `appl_ptr` to 2,560
while only 2,048 frames were committed; the candidate refilled only
committed data. ARM64 control-page mmap is unsupported, so this
injection used a test-only kernel hook absent from production source.

A separate strict KCSAN build of the final source passed eight QEMU
workloads covering RW/MMAP playback pause, pointer queries, DROP/reopen,
PREPARED and RUNNING RESET, and capture. Default and enhanced sampling
were used for playback; enhanced sampling was used for RESET and
capture. No KCSAN or lockdep report appeared in the qualified workloads.
An isolated deliberate reader/writer race confirmed that KCSAN reports
worked. RW/MMAP capture, paused RESET and reopen data matched the
backend sequence oracle across 7,104,000 frames.

On macOS VZ, Scarlett 2i2 capture passed two VM boots, 24 captures and
20 reopens with capture_packed_status=1. This included a five-minute RW
capture and 70-second RW/MMAP captures. Repeating the same matrix with
the recorder stopped and Scarlett used only by the test VM also passed.
Each matrix captured 27,360,000 frames over 570 seconds without recovery
or KASAN/lockdep reports. No physical PCM recordings were retained.

Physical tests checked signal and delivery rather than a known sample
sequence. VZ exposed capture only, and the guests used poweroff -f;
orderly SIGTERM shutdown was not qualified. The default-off
compatibility setting was not requalified. KCSAN is sampled, and these
finite workloads do not establish full-series qualification. The tree
through patch 15 was inspected but was not run as a separate control.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
