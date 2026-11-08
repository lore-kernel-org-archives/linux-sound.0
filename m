Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182105;
	b=Mv3ijCFIi9A/+6KMFMP7DBQI4jUf7xYHX7ybn5i545vrNSr0fs9Jvru8MSOBA/2Alb6s
	 KDCdE7PCWBc92M6mx13DZB3XQ2Ao5MRS444UMJ9vPaJb9k/wdrZlBOhOdlkQR2R0IqX1Z
	 NMagxK28MmFw3lat4d4Khr+h1GFSEFIRQf9XHHUNopNOTPc/5i9q310dBF5b8OzkuN2Dv
	 XHnUH/kQX0BohOMmFK11lEd8js096qSDBuwSScwKynfg1jr87mu6hV5+Muiyy9P8YRmzZ
	 /rVUK6kCRJ+feDdwTtaJ9OjZ8X6qPn8w6hY8U4J1mWAsQ4at3JrF/7CxgpK+us+jJ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
	b=Y3BpTyqP76P0l1DWHnIx3t/aR4y7mC1ZAll9879MqavMygGy7nSAknvrSMVjeQIJrL/1
	 4makv9hkAQk9uOHAkaJWJfpB60yQpQ8N1T3AFUMuk0ZnGtvo1xk5/x+pHqViXZog6+7D9
	 Y7BpPBdrwCQnT/JSx/EqmFYQyxKQSppPWvbPNKOiZQmJnxPl8i0jdhM1fIXW456IWH93B
	 EwrGO7a2AULDfs63UqB+J9JPXiCfEdn3gh4SkFH+rK/zR6llTKFLsP9fCbkUBrdGurlSD
	 gBfQX3HWbVQPReFVkWXSk76Q3JB0onMr6AVLv9rUBDLwKj9+/vpTukum8w5NgXVj1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFHIbKjE;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D985606A321
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D985606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFHIbKjE
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e977109392so1488155ad.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182105; x=1794786905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
        b=sFHIbKjEJRaY4JsTqNuS3RtpuMM5gvvAOlg0e4OnoEsdETN0c1AReW99EapQ7+EaF2
         wla1gubVvVOPIJdmnRBIEn9bVD4kyFrBzteyiXL5PCVr9n8ZBVbFOzh+lKsHBr4Knoca
         Kc/qM/oNlN2xFza2aMAFL3EFKKZBLgSxF9nZ+qEUq23dJOiHYl+LbpuOTPPLp05w9sGN
         rwUOhbSNKWGM4lz8pgEkF4pw+UuoPGqpnVlDopQRJsAt5keblN4eLxdLOBiiTKqD7txc
         5i+02yuWu7U9/bUp+kax41mtdr8DFaAWu+62YUK8MY7jSeETdpKh3YO6xSgRsJ/DuiPc
         yPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182105; x=1794786905;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
        b=wHOhw5r0yNQoqTTpsrcrApZqbTA6inFPiXpHRhDW7iAUFy7PtytNIxef3i9JhkGyvc
         UEkE9T6sd9YA0YWP1HcuERgGI5iobnYWds1jZFsOo2D9E1uAakBNVift7qv7jjZMhL1D
         JGtF3V2TbiaVTmrfmjug2urmlewLdCGZSArbZMPF6IinfI1kVW/6vRci689W7OuwZdWC
         CuNVdqBlvD6XrHky14gyUK8B4nyqR1xb+xwE0wXsecvQC2TzEQrOyKDPcyeQWSnQBgH7
         1EIUgPA6UPJ/wmGmb7tEo1OILmpV9JhcIMBWLRvxXELHhRsvlhx105GcNqeeTXMEq+iw
         xxRg==
X-Gm-Message-State: APuU4Z/ztO368cNW/vsmQxX6Jt25jZrPZj47OBGDHqMFjdzw5nrDltKX
	Wjs/TsVjDC7Y6+3FEX2iWiDTJTk2dXsLkBn5RvAkanu08yUWfY/j9VWKsfEIsA==
X-Gm-Gg: AYBFou0exRFcy2nrnNsJqOADuqVjzdwfSVLJNjlYRVzms+mMoqFWYkKGuIaUsqVZOoY
	LJeg3mbVWWwHIZyi66Oamo6+fmY14IjrBOtcFhp7LJlfhKRd2FFZqgcSSe7ni7f7gbOK1TKpT8L
	8CTgXIKoz9hQyoxYAus/ZRFDqctAQuUUaor/tuwUNkRzfmQGOl3VB29/Hm4CUoVy4kSYhlcsHau
	QjRgdUmAC32uRljDx+TcZuhEky9IMRsVWuhLVv7GW/GtVfYau4svbijYpi22anv4MVOHHJEXnHL
	WLG0zmz7cAyIYFM3J8f9MgbK4KdqVajKnex9bEak11oMg2wjVE6IHUcdEmJeYIH9kAEYUciWuZ/
	KznMF01zYi3PD71NHr3QFDRePb1DUXHes7sgO6/hf4WL7zbr9e7ukDQ0itBhs7oarDpFRMKo4QP
	JIBOqej3E2F6KXY/p+KrZitlNl3OiOmplX5HhxH3ZrJ7EJ2x4EfksUGHpl2jL01vKQMh4S9G0kC
	4r7f2ur1lZVZSHEmaGxf1WwNi3iiJo76a38OgTSS7NTaA/QTiKb2jNehn3FoN7o9pRE/bGngImm
	FcHFZwedv7JqW4deZDxmkVnvGcuAzXjuWwdJ4ni05bsi7CqSoCTI4KhzJdjyb+yKEQyf6hy/+xw
	H6ymeIjG+Ohwab59SZMi35hxdbpPd0pI0ubz3l2Hfaoq+AZM=
X-Received: by 2002:a17:903:3846:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2ed833c45c7mr24963405ad.8.1794182104822;
        Sun, 08 Nov 2026 15:55:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.54.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:03 -0800 (PST)
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
Subject: [PATCH v21 00/12] ALSA: virtio: fix capture accounting
Date: Mon,  9 Nov 2026 08:54:45 +0900
Message-ID: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
a4311e9447bbb219044db38897f95be112f46a8a. Relative to v20, the source delta
is in patch 10. It gates START and PAUSE_RELEASE while PCM prepare is active,
before deferred XRUN handling, and repeats the admission check in the native
queue and pause/restart helpers. It also retains the stop_operating teardown
marker for a stopped stream after pause/restart RELEASE has drained device
ownership.

Validation:

- ARM64 W=1 incremental module builds passed for cumulative stages 10–12
  with KASAN, PROVE_LOCKING, and LOCKDEP. The stage-chain build used an
  isolated copy of the frozen v20 build cache.
- A separate candidate-only hook build passed five bounded lifecycle
  assertions for prepare-time admission and paused teardown-marker retention.
- A clean no-hook QEMU capture-only run passed RW and MMAP pause/resume,
  DROP/PREPARE/restart, and close/reopen flows.
- Ordinary and staged capture passed RW and MMAP reset/reopen runs. The
  14-capture oracle matched the QEMU sample sequence.

Lifecycle attribution is static against the immutable v20 source; no
vulnerable-baseline race reproduction was performed. The combined lifecycle
and playback healthy fixture exited 1 because its playback probe failed at
raw HWSYNC with -EINVAL before attempting pause; that run is excluded from the
PASS claims. No physical-device validation or KCSAN run was performed.

Previous version:
https://lore.kernel.org/r/20261107143422.29319-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
