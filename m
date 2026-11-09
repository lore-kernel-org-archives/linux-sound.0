Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201385;
	b=fQM5HKKiS5MV3mntUe03Er6pRHvvgh/yOda/KF7HdGwr/p0ZUBbDA7OhXKn0md81gD/B
	 SfychyddNLxWHapLMS0yaGkQ0P1Wu/u/EBc8Ar6PgXkq/GDoX8hPwFkJ6MkCiZhnRvlUd
	 FB9QwLowdhFYHo8QCYvzXTRZ66qU9KB71vR3YBm2bhQ8eTWDpsqfpDHosPVMR8WqGfMrf
	 RoM2+ZxUU0G4qw7R/ZqZ5PSfIU81Rh+YpTXnLHmj2frQuUf9hsqV18GBBJNu6c8IaLvxY
	 Je1+nlym1i5HzS4SROah25WShactyRnIDoDOUMyCYUZHZuXLV9TUCVP8QLKgCiI9W4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
	b=395HJ4uKdWF8rolBJ2u9sw2HqnW63bnUg7lgHetl2zcUuwT61J/0eaSlm/hQcsim9ZVC
	 8S0kXuQCjAEY7qJ5z5e7akgdl64Z6+/brIxlsnQJvyzc+J7vaug8YsWkEcxfTYORjmo6L
	 rB8KGTHox3sYgUr+/6JObV047uxA7OjOTgvOjPseVCfVHSRMB5pEAbMUQHpUhJlRdqM3O
	 Xay9Tu+FXpdrZrgv0zQrGY1u5J0jAuP0KSf+m5FfSEcf/e3FQZtXFZGBCeCWPuaNP6ydz
	 /RQ31lzK+Yw90A/1Y1FresSw4zN1S55CU1C4bJ/Z0c3pYNh5S9THMBkg90h9QQHlUVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYXvoIId;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A4606A325
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC2A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYXvoIId
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so843002c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201384; x=1794806184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
        b=yYXvoIIdM5xFxQUGoLsAq32Y/XeeSUHJ8SoLEgdxZpswbiSUdGMaPpgsaMzEMzKHzo
         8tKee/tcbD/5uTM/XuXWnA9TitmfBCX+hrNYqn+zk60YBQVXnUcf9osk5FrFfFSBeUTZ
         JwPyRln1W3CvY+808BXMx5RJJH9DiFmJzwrWh8LiHh9k2uzn+AQfi2kUWbkG0fUAv+ah
         IrwEEb9VYkk9HA4+mzAVHbuqn/6NN/BJL3Jnz3oFNola/rduWqpyFtVevnus1TNGwMQ+
         uvzmEgMydgPaO8EqE5LXHoQhVhRbQTu/JVzHY3b4c+tWlXrIZB3jgz7wm+8UoZiXA4su
         chDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201384; x=1794806184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
        b=r3aBc9KSp+f31kjhOLOsysvDAkKeeIO0vePostcd3hXmEToNSeauDvIV5XJ0HgmjBo
         CXBNL/Z+8ViaUd7godfMS3NRyg627Ziyta57HhK2P/9HFlKaROIW9GUYisxuoom7yFFh
         s4lQmXvzwbvsG8MQ7eGKIpKJlm45AvFNsgyaXEKUfXxOUU51d/J1OgcY5bO/y3QhbpJ9
         VlLblnZjapSNqsU8f72PeWUIruOXu2k1lATdYl09Btm356Z61HTnBr6iHHNESQMldkqu
         TZnkOVMq9yOPRtL2nohhIcWpIffPCjKvAdbGxmXsC2QaQDNkmwRvkZvwXvcfI2ah0o0o
         ImQw==
X-Gm-Message-State: APuU4Z/J0SzTszpWwSyhRn2EuQbPi+X3y71fmzBiKXh4HwrBCuBNIIFM
	fu3idB0drxhuT/okg29jyfflliU36BtOUIV6A28SwmdnJesMrqeJhcvw9hJjWQ==
X-Gm-Gg: AYBFou3TyqxDknwCniBJHsp4I4POWGiMJftU7IEvW8XltU+dc3W5mXziFdjIuhRJmW0
	JFyEwv/6cRU45gKo6HebUvO9A7eM0ShNFu+X2sIySD0vq5bUt2JtyQXhMgKc+iN+AsDXBZQItJo
	/XKfqL8LX43jkOh1Kk0ppmdKpdAnTqgzDyjXkPV8xfeiqC/0YgA4HYzOraUpNbuDDQpthtYX1WF
	fssSH+e+E1xRiMYWaFQ1SMW7Xa5x8xkPV9dPxFJgC0w8qfDnZP7LHdQPw3VsB2MI14tkqBdkhHX
	feMTmV44leyGPIaII9k3p1t6EiUOsk/icfFFYom+bHOnLRqLbZhhqkQFQbr5VZvESe5eb0E7NhL
	evc/P+nWSnHi4vXERyYRhBKFvsFzOKJB+Opk8ZtAlIxMb5tvop9M8VWK90fk7R1Vjb+ksaLuwJ2
	/U8Kqm1p3EqmlvarPjaIPV0MfRatk8ECXPVm+ZX5wvi9s1XJbeNBRAvsO8IrCbGuDF3mI9z7920
	zFDH7GTPrbsYmVelTQaJTGYzyj6hgCnHmOV3jDjzG3xYKRUbgpbctA4rLmb0CXIwxmM4UlpAYR4
	pJw1z0/+Ek66Ws/JFto+8jUtPRa3kdVyP3UFSPf2REFyM1ZO84mZ0a5CuJTI45MGE/B/3Cjw1Kj
	IZjIcFarn7Pifk/K7m/Oh5/B/ReVtD2kKlR0iwXdfkf17Wpw=
X-Received: by 2002:a05:701b:420f:10b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b39ff1d2famr4693747c88.45.1794201383745;
        Sun, 08 Nov 2026 21:16:23 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:23 -0800 (PST)
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
Subject: [PATCH v22 00/13] ALSA: virtio: validate PCM ACK and prepare completion
Date: Mon,  9 Nov 2026 14:16:05 +0900
Message-ID: <20261109051618.22506-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This cumulative v22 update adds an optional linked-prepare completion
hook and validates playback ACK accounting before indirect transfer.

The core hook runs after all linked prepare actions and post-actions
succeed. If an action fails, callbacks cover only the attempted prefix;
the core moves opted-in members in that prefix to SETUP before calling
back. Pre-action failures and standalone RESET do not invoke the hook.
Drivers that leave it unset retain existing prepare-failure behavior.

Virtio uses the hook to keep ACK admission closed through the core
pointer reset. Patch 5 also returns -EBADFD for an ACK on an already
XRUN member, avoiding a second linked-group XRUN request.

Playback ACK validates normalized boundary deltas, frame-to-byte
geometry, ring indices, signed ready counters, and total queued bytes
before the indirect transfer helper mutates its cursor. An invalid
paused ACK returns -EBADFD without starting a linked XRUN.

Validation: The exact-source ARM64 W=1/KASAN/LOCKDEP build passed;
final-r4 snd-pcm and virtio_snd modules match the previous build, and
Image executable sections and System.map match. The W=1 stage 04–13
build chain passed without warnings or errors. The v22-only checkpatch
delta reported zero errors, warnings, or checks. The bounded playback
ACK helper passed 23 candidate-only cases. The prepare-completion QEMU
probe passed six lifecycle cases, including a later member's OPEN
pre-action abort. Normal playback passed in QEMU with RW and MMAP,
including prepare, fill, START, supported pause/resume, drain, drop, and
reopen. Four ordinary/staged capture paths (RW/MMAP) passed with 14
oracle captures, including post-reset capture checks.

The prepare-ordering diagnosis comes from static source inspection; no
baseline runtime test was run. KCSAN and physical-device testing remain
pending.
