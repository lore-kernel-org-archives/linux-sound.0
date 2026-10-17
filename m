Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A78491585
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792241484; cv=none; b=VcfAdYN2YEw0kd27kSDuBj7TEKlVJxaQHruCo+lpl6tRPFhDM4OQVL2dXMaQ43AL6WJlwMKd6YmwJysctCxRb+yMLGv4WaR3rUBGDCZXHxaQWfumFHpNuLwPEetIIMxKFV+MeSur7ecRk04MtBqJKPZYE1D94ckfVFsMjRf9M7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792241484; c=relaxed/simple;
	bh=ejhKqmQASVCjBpB6Zzm6onKZzFwjxIZTAb/mq8y168c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TExkBwfTv5Eialh1WKryZ16Aygs/y3MOS9qgruSjPAzzEH3WDqt+mTdq+/d6lTrJTp1X9jLs66xOe9UILy4R3OTNIF4CvlfU9WkvVBVHOUdCvLRsSQHNgoBiaDKcaB6xlDyx43MTlf8LIto6L+uYXEwBaH6DcCqLJqxDEkXBOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLtecz7k; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLtecz7k"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e86dce4510so2890345ad.3
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792241482; x=1792846282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejhKqmQASVCjBpB6Zzm6onKZzFwjxIZTAb/mq8y168c=;
        b=HLtecz7klVYY7tyn/NXtELa5lanybttTeR2gU+zEnB6ZccZtUf448HmuCIbEz9qJPu
         tTGK1T4RuqzOkHG1JWoxNvzYhuhBVdg0m+vPBNy7YeHLrWKMc9kmjCCxdZRbSq/z2F6I
         E4tKPVPxp5bzsEkfYE0ZdNhOR6iOsry860Fc4H7qCxbyYnwX5rYAvXJN9854eBHaCQ0j
         fI50l312PVIYDVYv2uk27Eo1ASlcOg5OdEWMH48iaZWmY5sUtyVzzpTq8S3qKWqIHMjr
         jTpMq0s2nTKWOX3x9oqxLjLILbaPPX7DZvVBZzKoy7CQqAw1Tyrce/i3vFxS+c7DuND8
         Du0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792241482; x=1792846282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejhKqmQASVCjBpB6Zzm6onKZzFwjxIZTAb/mq8y168c=;
        b=FzBGOaVr2Uz3/Rb1rZvr9Ihsk2JCAKc8zbVPiFSKbBpqR9qWwBx56B67caFwrk+jTU
         ssbXRKyZjkF7wJzojJqQSuEZ+C7YqKu/ipupBCyydsMDyiQi8a6n40Td5Pg1JtavI5N6
         MN2ZayfjLMzW+s+P0+fauuV/K3Nq4m+ZzPBTFjgSvgAGpsUiJ5CkUKIxiibjd56KNkk+
         G+h1WgxdimtNtwi7GX1DDyA+1aHTCYFpt/cRp0YzYFNcsL7L27u9Li3ouoYJkiL+2VlF
         0+7vMZsnoh2eqLmTThfAkcGeyzDhdVyNLJKiEQBr/uY8h/wvjnzzfdgWxAa7jgLih6Xy
         3AnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOp9kG5nEhxIRh6es4d5M0M47Y40Kxa/BITaXjUyDQDSaEFyW49nrf1skUuxHpuIM5b8AOnLOKgXQ6ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/ZvxcxlZv4/eu/qpn85wt1WUM9kywEX1p/4J55ciqJftNEo0v
	WH+SDA7onC88oyKa94c42Wx8HRh9dYydFO1PxVQcYGHvbPO0PqjHOKi7
X-Gm-Gg: AYBFou1Sg6jHNOePaSYRXGAChZyWXKlWUfJ/yvku6fUtp9s1Vm9bBpQMtFGt7avhBno
	dRxT1k4NY0UMjmPPSkq58W6odmlLFHHjlGtd6Y3cFb29cnTmyV4huxrgZjuJ50/oLQ4lks7+jQV
	Hbcamb1d3HIJHimO778lacRskYPYO2AuomPZBpv+l+TjUK33mUT0M4EX73lZA8KztmJasoeZ7f9
	lfprp6R5BIiWjkNnzUr7rusM63EzAOHfFpLmE1mNzOdorrLYvOlVsu5zeBicDFQR/zrVK0bUlE4
	TrouXqmZNC40tDWyY2rNqvdUMY78Zs47eHOcEr2Ts83r8W0qk/YcMDK4yWfxV18qVubuAGCS0cz
	m36mOaSW5/fJp/7p8J3YUj8CJAyjuD0PnPLptJHDLTUG43XIrHcN4pzdP8kuATTVMGYmGhFfKuv
	XEiYiPtJ3cSvKYUJjTpuN6DPGltVaf1OWFjUwFPHzUQOelleaDc+LtgO3JzzRrqazoH1O+cUoSR
	7hrfE4e6ZjZ596pHFVh9FX301fv4MMvcuwHY2QXoJjl689wjszOKM0/LpTYWXhb733Rt5N+k99c
	AVnUxCSe4flZamQ=
X-Received: by 2002:a17:903:acd:b0:2e9:6788:9373 with SMTP id d9443c01a7336-2e9a68d9118mr21964585ad.17.1792241482151;
        Sat, 17 Oct 2026 05:51:22 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm22014615ad.74.2026.10.17.05.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 05:51:20 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ALSA: virtio: fix staged capture ACK ordering and period scheduling
Date: Sat, 17 Oct 2026 21:51:14 +0900
Message-ID: <virtio-snd-capture-reproducer.e56fe77fd0dc4571@gmail.com>
In-Reply-To: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
References: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I've prepared the reproducer and build instructions for this series:

https://github.com/whatisyourname0/virtio-snd-reproducer/tree/88913cb432c3771d179a274e3b622a22b03bb9f1/capture-followups

DEPENDENCIES.md lists the exact base and prerequisite patches. The
preparation script reconstructs the pre-ACK, ACK-only and ACK plus
scheduling trees from those patches. Each tree matches the source used
for the original tests. The two kernel patches in this series are
unchanged.

For patch 1, ack/ extracts the baseline and candidate routines and tests
ACK ordering and refill failure with two kernel threads. I rebuilt the
ACK-only kernel and fixture module with KASAN and lockdep. All four
cases passed, followed by module unload and a clean guest shutdown. The
fixture supplies test queue hooks; full virtqueue coverage is a separate
part of the test setup.

I also rebuilt QEMU and the kernel with both patches for the capture
regression checks. All 24 captures across four/eight channels and
one/two vCPUs matched the expected file length and SHA-256. A deliberate
reader stall produced XRUN, and a fresh capture after it matched the
oracle. An eight-channel, one-vCPU run completed 70 seconds under guest
CPU load and a subsequent ten-second capture without XRUN or a data
mismatch. The kernel logs were clean.

These QEMU tests use a deterministic synthetic source. They cover
capture correctness and recovery; the VZ comparison in the original
cover letter remains the evidence for patch 2's scheduling benefit. The
ACK fixture uses the ACK-only tree because patch 2 changes a shared
helper. Both build paths are documented separately.

FRESH-BUILD-VALIDATION.md records the source and artifact hashes,
results and remaining test limits. The package also includes the QEMU
fixture patch, the guest build recipe and the channel/frame oracle.

I'd appreciate guidance on which parts would be most useful to keep in
the kernel test suite and which should stay with the QEMU test backend.

Thanks,
Joonho
