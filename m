Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862536;
	b=5evQS/l5MsT2lVzulQUgbBTE+WneaJN3pVKazAXx9nuTfqk/1AXun0vqul3lQjGjoLQP
	 t3KQCNPMpmnrBbUASR4klCOy4ZQzgLB1Th0BlSbnE2ggrCJQY8lKnh9AllvX9LrAvIFAK
	 fUZIV+wjSaftmHRZJZp/H3MDbzdVSY4DHhnKt+Dpxvq5RYR00WMNqsJQ/qj5AykcQR8Q6
	 eITHFdjYIb7QFlH8OcT+7cxzCdJeHiP++6XcCpz+ZXFJ+UAP3L8e8wM+MaTb8n/Q/BiHS
	 0NIg8AlEYR/+MEp63vCMPAbyQE8NpqbBOo0x79NRIOM1aSTGk8y5wYK7SRUImWy8P3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
	b=WMGW6DpVAW5wAREFfp9d6Zz+JySIaLEXrTTJAlTBPbJvqPU0zGjBdFgpT80Iy/JkAAYk
	 2WXLLww6oEJi/ogzABwqKsA0efN4Q8V5VRSfE+b03xv8VtUpTekimMAlcOBCpS5Zbwpiu
	 5UHS5AVxK0rJRJKDxYhWc2jdMuGgL9CvwX03+nQ1sJvNEm2D0tfD/tohE017dk3JRly/i
	 ElFZVZIhTmCutO49ZewU+WcqfhtR17KQ280WjVb6GbRLNRX4C9ckZ52IDIrBpfAMri2wh
	 HaIH9Un25FwYwYagI7w+gU5VCTWqihhmAj252I+dgb7brrxTqzHaqe9J8Hudd/JcYyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8vJaLNy;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160FC606A328
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160FC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8vJaLNy
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso2044481eec.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862535; x=1794467335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
        b=g8vJaLNyWdK/2IwJZX87OinpbOSbz1AbzBqDx/r9PNCRj7gx/giJfw5qv+KHxpT8Ea
         m0okD5WVPkaK1r1dc9ypYrL1bcsWXabUAEnyvHgKRXf42UnDbNaEtzqN1lYChqqZmLnL
         PdynBAI/2lnw3d57FB0NLENAxt76wBUE5iyvJ8YFgwT7iEiZKCAp7g6oL7Ifo3wDLpjl
         WPu2dV5cuTIiWH8zL9C1Il0wUqCoGzu5HWGC8lXbuj853zQq9MNnztipXFpP+N/R00+i
         s2PtGX7PViqxqZtr3abHvLs6IrL4BdJ3jj9aDRpSOVJBKmKbWBG6xv1hz9AYHJ9Z1gDf
         hdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862535; x=1794467335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
        b=r4JxqdSbXNTM0Xh3n5nI9RC29Nb6WY8oe3oK1jMA71KstMQh0FX1iqn5iJUvqG5+nL
         vpm9gzQ3M5firU9P6QtaFxJQinwIneKnrEe4xxqdV8usEyDYoM9I/3t+mRAx1/im1S9A
         3E7T1eWQYl0uWexcDGSE8pRENrQnQnN7PeBsEZAYS4LiG2IYVSOVA97wPDePP8HWvqzA
         P5zOfDoUud9IdS1b2yUc9RLnIY1kj7OdxQ4L0sEf58KNqW/1cnGruFEL8fv4Bsldv8OJ
         RLYuykH54OUOiwTTjEomr0loJ1j1vy/p1Np2UDE5i9BTZFUDRnIUbdvD40T9Cak9+CvX
         0Cnw==
X-Gm-Message-State: APuU4Z9++Cm656m2pJShOAxuWzXrkjPhvXsr36WmSlNxB4zkSunGEDWl
	aZIYArnJ+3km7GYfob708870rFueTMu1F00jygkU5ZFqfRP24ssnk4OB6PzDzA==
X-Gm-Gg: AYBFou2tbA/cfOTFCDEeqEwKuMktGA5Jof/tQiAbggGh7vGl3QxhVRX1R70fPJ6dCfJ
	EQjnVoo1HdXnVkHznLopZt4ejG6pZFPjX9AvQOgz2uN0Bi66MmwxmuE6phHe3+9r23HQ85EWYV/
	wd0rF7v+OBFmlE3Osd+O+UNfcvjkIusP0UU0+e6skER5Lf2s+frxR5Caf6NBcER/oFjUr3u9UKx
	UIFNQUmjyhBboIDe2L/HB4TPwlmOMCpmfiCfHhw/r/FKZEmoxl9hi0NSK/9YCjg4rfojAVCj01P
	iIgzdDkYrR2ET8O69uQb46uDBM6Vl6akc/I9HZXyU7N2IQMu2qCLubeDgFCASeD5K8k6YwUYLlv
	KIR0PwaK2i0qcl+8E5gI0BIRmBakhY3aRDsruUlUBit3MnhKIsf7VZsa1SYXKvTTNrjSpVM3QOe
	hRXnIHU9olgz4QuAlyJ8zHpTUg6P07hHbI3HXEApdOaGGRB13Ma99Iy9ULmvfudFaAtRYV4jnfx
	DofBZUF9sHnhNDdRvkIVBvokqLlb3CRcCW32vfiglNJifizx6GKnkb/T2L69wtY0LziKdVcGMOi
	32Pyo97SJ4G4exaM5SPDhYz5eRHtMleVtll24GqFnIGBG3lQkyEFU0D+EFeM9rAKmeJRo8hOPsI
	TupHAAjRvzcGTSmxGnThM3kwegllwL2ML+aTicb5uR9onIWU=
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr26992906eec.41.1793862534957;
        Wed, 04 Nov 2026 23:08:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:08:54 -0800 (PST)
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
Subject: [PATCH v17 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Thu,  5 Nov 2026 16:08:33 +0900
Message-ID: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

This version addresses the v16 transport and timeout findings. Patch 6 tracks
successful virtqueue allocation so rollback does not call `del_vqs()` twice,
and so queues are released after a later event allocation failure. It also
keeps freed event-message ownership clear across freeze and restore. Patch 9
keeps jiffies timeouts and completion wait results in the kernel wait API's
return types. Patch 4 keeps ACKs rejected with `-EBADFD` during XRUN recovery
until the core publishes PREPARED, preventing a duplicate linked XRUN.

Patch 10 retains the staged capture lifecycle and DMA ownership work, and
defers linked-stream XRUN delivery while paused. The v17 follow-up arms
`stop_operating` for every member on pause, keeps a failed linked group paused
until a successful resume completes, then reports XRUN through ALSA's normal
group stop path.
Inactive `sync_stop` retires stream ownership even when the stream was not
marked stopped.

Validation:

- The complete cumulative stages 04–12 passed ARM64 `W=1` builds with KASAN,
  lockdep, and OSS PCM enabled. Candidate r5 changes one line wrap in
  `virtio_pcm_ops.c`; its stages 10–12 passed incremental rebuilds against the
  successful stage-12 build cache.
- The MMIO partial-allocation test failed queue setup after queue 0 had been
  created. Baseline reported a duplicate free-IRQ warning after transport
  rollback; the candidate completed reprobe and remove without KASAN or
  lockdep reports.
- A final-source r5 PCI test completed three remove/reprobe cycles and final
  module removal with no kernel diagnostics.
- Linked PAUSED XRUN tests covered native pause and pause-restart. Baseline
  moved the group to XRUN while paused; the candidate kept both members paused,
  accepted `PAUSE_RELEASE`, and delivered XRUN after resume. DROP, peer PREPARE,
  failed resume, blocked read, and close cases completed with clean fixtures.
- The final-source timeout pair used `msg_timeout_ms=2147483648` through
  `snd_pcm_hw_params()`: baseline returned `-ENOENT`, candidate returned
  success. A separate HZ=1000 synthetic completed-wait probe confirmed full
  width for jiffies and the wait result; it is supplemental type-width
  evidence, not a device request.
- Final-source production RW and MMAP reset/reopen capture ran for 70 seconds.
  Seven final-source segments matched the QEMU sequence oracle; fourteen
  segments were compared across baseline and candidate.

These are guest QEMU results. Physical Virtualization.framework devices,
NOMMU systems, and KCSAN were not tested.

Previous version:
https://lore.kernel.org/linux-sound/20261105023140.18373-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
