Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837362;
	b=p7h/zuluuk//CFdAlZeP04G8N8BhFSyFKyWUYHGzHFsZGKSb4KOqDD/Bx7PiRyEfTSXu
	 PPBy9Mbi4yG5mVF1+N3S9//4VrJwhapqiMM5rp5KuGuTUd+/cy+RvtVC407gnC1F9BWhJ
	 8CY5VE544/b8k2eRsFk6Nlf8Cjxu7pTXdolDCxJ8A8BXH/YBAragZZJyTvQN8NdGvgH00
	 Jdj9vivNUy9lJu3vD5Ayh+thdpI3CWsywWfRnDSCEqQSSHSnXhZkZbXvW/7K0iA8WEo+f
	 WG3VXpR9btmuspSrQxH/VkJ9QrTESj+SqQxQNSU4bAR5nTv1g78qSrH5U+eCVgjt3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
	b=xpwgmgOFW2jQciVACKDLe92bi6hbPvNA94VB+hsJU2yi2h7BH/o+BQ6pru5m5+DZ9glR
	 XQEn5K0KqKYM/VM1BeIZuSi0EXFuQt4sLfnZi05Z2b3EKR14X2wopym6/Iq3HFZXY/l65
	 93uWHT5wP4TnFvSCZrSU/qbTWiJS3w5pnsppCGPLOffJPZV/ovlWx5rLlXcMj5djvWlkr
	 QCxrrGz1frDvWRbmWUy2OW1eQ1DegRRGZmlJXRbvjHcBMAjecfoKpf4aiKJfvDgB+eC/D
	 FreS5uRRhbET7t+oc73nFkz9tRf5vnH+T4YUvd1e2I+LpD4ifgHqufIM6fMctUowDdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNLgfPbH;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C6606A329
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588C6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNLgfPbH
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc502d509c0so549969a12.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837362; x=1794442162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
        b=ZNLgfPbH7vUmYfIeS9V0roTfzAAefwyXv0a+VKA/+NezG3VMXCTqt/w41TWm2V7ye2
         v6JhDIsU5BB+OD9P4libjsoLfnr85WDlefj9L2sBhcdXrNPZUWiWIDjWC/HcBYLjdBum
         sIOW+6+eZaq6bPwydSTBRK40gesxjKFo3fcBjIQCRmBPutlP/EftFTdPspj6OzXG6Cx8
         w/MoRgtDoV6JppMpu/WqrXJcg599Xuf19Ip1da7/cLHXvX6Gr6i8ti5xH62iveYJHzGC
         WSbAZeTIIEFYMSMyLHx3JAb9RONTjCR+vHXfVrLQXyz+8pQowrKLDmn8Mv6n0J3ldINb
         rXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837362; x=1794442162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
        b=LnKcuoNNPmDnKYRjzJ+ta8fqOdzEDtjISpUSxu59CBNZCPrORlJtfDO2fQMoOufcit
         qapLzJgejxVkjHGc5Pnke7Dr0HRKdV0t3qjRufEOO0Ul/b2736yswdSVu+cTwzF5fx3Z
         S3NRy7eAl2t3UJVEe6B/Zwx/1Wbbdwe3upYTAzlykv+ndLKwsVnWroUIP9OvaF9IuhzZ
         aXWrkC9JDtlgTBcTDrTQ/O92Br5vk+VCbRC/soUOnrsFCmhnXrx7eeN3uyJWNPGxwSaL
         AtjD+TkpQ9mDzPlYM9ONaQ+ZN0HTVFKny68JnqkbRUGurOaFR5V+0EWvZR6QF6jO2EFa
         InmA==
X-Gm-Message-State: APuU4Z8kYJmf8mYOBaavS4Le0yhzcfZI0DmYl23v0G05K9u2E3BOgMmN
	kB6yb0ivEbMGHYyQh85XfENhNYnEDoTmfOIfEeDFWb7kCvENVUSbYqhzGv/5fQ==
X-Gm-Gg: AYBFou3K3ZA+pSJDu0qQIF1xxogY8vDHv5A/4wAKoNEWyoux7rxXN607iHNFCRLx7gc
	ajIsqG9rTLGPzYIw77wEM43F2v2k80GTgc+79SthQns4vUPZybl5b2434UFdjAW/F2/Kk7x/7SS
	VjG6NGH6R6+hlu0VoHcqmdrBt6A5JJAPrwEfx8rzQOhQpSIXEdB1u5yxbqnPEcWg/w0xVmnZHmW
	ZSd55j3uX+dyToG5xrlZLIvFxJpXsuXvcKI5otgmQ5UJa1SXX5Ck4ypfhZowAab5xS+olGK5c/4
	4p/0Tf9dAW+ocNUt9irHFZMDfyPG7UL4lS9H4czShCx3ceZXsVtjQs5PNuZqg5ueuDqCgvBYgiH
	etEAnxSDIUfJ+h9gJ91X59mBflTRzjjCiqOT67i6YYizohnG1hm/DmK0+NAhlxNSDRdurMvG/yF
	o4Kvm7NkPeK49V1xNUW9KvtuCNImhBfaBVecAd5zSce7FQ/2+h3JZRq3VoWG7h3eTg6x74n0mQU
	8u2FOk6KMI1TV4mT/9SRealFG2w0u0i4YRtJjWzaaXrluGJuIXkDN/qAqVfRmhsjQYmAKqppW/8
	L4O2uPWBfCmq8iJMAgQzmaYNDOmK6NTvQwKVnq6TyXcLUN8sxoIWm0AY5L60nWTAcVOreTEMwsQ
	WgA5yD4fm/5Q8sxOBTf2rznnpVP6gzb11vseagSKYxWL8kNs=
X-Received: by 2002:a17:90b:2e07:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b09e2c9e85mr2639557a91.2.1793837361622;
        Wed, 04 Nov 2026 16:09:21 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:20 -0800 (PST)
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
Subject: [PATCH v15 00/12] ALSA: virtio: staged capture recovery and PCM ACK handoff
Date: Thu,  5 Nov 2026 09:09:03 +0900
Message-ID: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

This twelve-patch series replaces v14 and is based on
a4311e9447bbb219044db38897f95be112f46a8a.

The follow-up closes a PCM ACK race after the core clears stop_operating and
before sync_stop finishes. If a substream is already stopped with a transfer
XRUN latched, playback and both capture ACK paths now return -EBADFD before
they can re-enter the XRUN path and re-arm stop_operating. A transfer XRUN on
an active stream keeps the existing -EPIPE behavior. A capture tail remains
available during DRAINING when no transfer XRUN is latched.

I reproduced the race in playback and capture. In each baseline run, the ACK
returned -EPIPE, changed the PCM state to XRUN, and re-armed stop_operating.
The candidate returned -EBADFD and kept the stream PREPARED with
stop_operating clear. The capture comparisons cover a synthetic stage-04
fixture and the real virtio-snd module at stage 12. A separate instrumented
stage-12 QEMU run placed playback ACK in the core sync_stop handoff window;
its production playback ACK functions match the candidate source byte for
byte. The tests also checked the clean DRAINING tail and the latched-XRUN
case.

All twelve cumulative stages built on 7.3.0-rc7-virtio-next-kasan. The six
ACK/XRUN race comparisons and three ops regression runs completed with exit
status zero. KASAN and lockdep reported no diagnostics. KCSAN was not enabled.
The stage-04 fixture logs include ignored notices for five module parameters;
these are recorded separately from kernel diagnostics. No physical-device
capture or suspend test was performed.

The harness leaves behavior_passed unset, so the reported behavior is derived
from the guest serial markers. The attached evidence records source, build,
image, module, fixture, and serial-log hashes.

Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
