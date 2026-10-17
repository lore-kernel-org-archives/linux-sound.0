Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172631B828
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214134; cv=none; b=Yeqt8MJSSZvv0eUWZ6xBF57eikGshrOVAZASoU7Vq59hWfKBbmn+0RKJdbRjx7aaHKaAMt8/X8lRHI2cC6AeSKzuNBSYMXYcxF7uAmsbVXp092U8frGugLzHjJvyNrQ17L+Fl37mGM+S+K4rriT4ZusnQAZgfHvNuBEaYQubph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214134; c=relaxed/simple;
	bh=95SdnSdg3U+zWWAokMZ2g2KRRVCLQeq73KICUEfOvb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2439V7IkflMl8O/0SmTWu17qbdb4dHT8TZ8+0WzvQ51/ooIGMK4yiwkceMe/c3fIrrP6kb5ICKuIPTRDXyMR+aZYh0ZfM5H83uZyHWi4+Is8RWfg796Sqx/Ti0LLBi2NOVKs33DroZLsR0QVT5ZmQCQtEADyxE7MYwX2gCqqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e69dl9ha; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e69dl9ha"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so389133a91.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792214131; x=1792818931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8NkLjAJdUFmj5MLQvoJkW4xVPLRTNUGffFYw5vC+68=;
        b=e69dl9hakpx+ANYReUiFzvYEF2HNSG+geV7Kdxp84Zh7Qpy/rd6AMWlxvXT7/gi3DO
         QG/WYIck0y5fLEhBrxtkUJXP5tVfnblmWTRftHvk8IqUyZMCymmySG/pfF0EbCM8PbqN
         1OQLoEAj7Vo5Xl4608hz/YczqXv4d6L3A3LebTxsFUd9p1mujJ70m/h6ZB6hdlg2JVZ+
         gnR0ciNB4RrWXrI5ly0iuOkfrd74hldH5GnPV5QCoJXdAzs9MTNbBdBRU5Jqa5aq97Ce
         2HRJ7exlvtRWIeDIMPcmesEG7+5rbRMe1/Ebwl0Wu1JBBl1taZcRHRRDf9svUUip8pks
         tvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792214131; x=1792818931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8NkLjAJdUFmj5MLQvoJkW4xVPLRTNUGffFYw5vC+68=;
        b=hKgDv2kHeGSKtkzJMJgOcA8ZqJHpzo0AS0/s51lcHEIsEyaLudT6OtX4I4pK4GCHXL
         eWP8nq8bsAHi9JumxNbOnu42qGx6cesqa28ykJWpOATjoAaunenP7hGsZtpglGoEw0q3
         FYaaLMveJNUj1VnK40bhMRBm5HdpEv5ZpoZsefHi0jbHsL66AFiILG3cG9xtQgtIMwGC
         ZB48IwWX/iQf+XRxVUSaB7heUW10d0pjWCDNEQLY1ig4MVpnXMXzzUPkzmoFZ69QKG7X
         Rk43/xPi9iOpTSjYoI0FURERQAAXPf1cA3LZwOfM27Jmp46vUg+RyIz8y1vjnfBWZJ/Q
         /yyw==
X-Forwarded-Encrypted: i=1; AKwUvByGuXho6Pp1uojNApJ3Vgl7OQP0lYeNSavSIJvxPBuyzZZ85/3OBkrCdMAz7rxxrsjDGdOkpx73ZN+rkA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/42MbGVtZAIRCtL1J+s75mhK8weprViussXkrJV61hiARi01I
	uQHHyPL+ze3IIl/bN9FNA8erlJQD/xjsfp9dAalCFjaB3rmAZ4q3LnjN
X-Gm-Gg: AYBFou3fCyi/4i6JQCuBY+gJ8c9G2qeQsZdiaoJ/vLk7n6R9yKj7SFvVNnnuLnv9o3A
	SAq6YIVqpQIA87KSGIUv9E+OiaKIhGMRmgv64wOvEp9v20SdhwPDVHsgJBZ+vyIYFQ/JEr1uDdq
	K7HYSIIcHjw9CYDrISqGsCHi6KuRuqAnzqgLRxk4DDXjzKSp/0EmnBJoSwOWZlOMEpMTCqG2cAk
	+GQCitPb8auMOiR2P4sDrNsC//yptWouJVbNFFGIh+bR+DiS5wuoxObzslHemft4iZ8ElfCLut3
	Zc8njqrfOD/Sx6AQNIxH6h7HY7wQphqQ7ipaWDzZZgFMopmkWRR+7qICJzosP5Sb9WppTvqGzv0
	0ZB2qbfxi8CH5borjRDH/asKySYbvN+tMGWhSQ2lXp+Ct95U5NeF0WR/V+zRZP90bGKdUdcaDD3
	stxamQ2uI4CW61Iy7KZ4zewetVWusTkEyaZbY8mluWLRKgFOlEf9I6FCt8gXArxitd86kwtEZEZ
	VxMM6vw2pUL6vclGoa4mNfzHYdpojDhC6sx28/b1gyPxC1WDd1h5xaUOcTowuhWJ4GhWRuwYtEu
	sXyupfvzBlceGc9mspSrovSF
X-Received: by 2002:a17:90b:5623:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3acef6391ecmr1619670a91.63.1792214131334;
        Fri, 16 Oct 2026 22:15:31 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc38b457esm7443575a91.0.2026.10.16.22.15.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 22:15:30 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] ALSA: virtio: trace control message lifecycles
Date: Sat, 17 Oct 2026 14:15:26 +0900
Message-ID: <rfc-virtio-snd-control-trace-0.208f05ae8ea44e77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

While investigating capture stalls, I needed to tell whether a control request had timed out, completed later, or been canceled during teardown. The existing timeout log gives the raw opcode, but repeated requests need an identifier to follow their lifetimes (or cycles).

This RFC adds one trace event to sound/virtio. Its enqueue, response, cancel and wait records share a per-send ID. Wait records describe the sender's outcome, response and cancel records describe queue completion. Therefore a timed-out wait can be followed by a response with the same identifier.

The patch applies directly to the mainline base listed below. PCM capture staging, split-ACK accounting, workqueue priority and application recovery changes are outside this RFC.

Validation of the exact source diff:
- ARM64 W=1 kernel/module builds with KASAN and lockdep; additional object builds with BPF events enabled and with event tracing disabled.
- Six QEMU cases compare baseline, trace-off and trace-on for a delayed PREPARE response and cancellation during unbind/rebind. Each checks subsequent capture and playback. No KASAN/lockdep diagnostics or trace loss were recorded. These tests use a patched synthetic QEMU backend.
- Eighteen QEMU performance trials, 9,000 timed open/start/drop/close cycles, use a 4,096-frame buffer. Enabled trials produce the expected enqueue/response/wait counts. Steady capture produces no control events.

The added message fields cost 24 bytes per request on the tested ARM64 configurations, even with tracing off. Module sections grew by 11,160 bytes in the debug build. Actual allocation depends on slab/page layout.

A further non-debug comparison used this exact candidate with QEMU 11.1.2 and HVF, sharing the same Image/config and differing only in virtio_snd.ko. Six balanced orders exercised 90,000 timed lifecycle cycles at 4,096 frames, followed by three 30-second synthetic captures. All functional checks passed, as each capture read 1,440,000 frames, with zero XRUNs or read errors. Each trace-on lifecycle trial recorded 90,000 events without loss. Steady capture recorded no control events.

Observed medians of six per-trial p95/p99 lifecycle times, in microseconds, were 201.105/349.729 for baseline, 254.146/334.416 for trace off, and 291.667/413.083 for trace on. Median process CPU time per lifecycle was 70.437, 70.532 and 77.300 microseconds, respectively. These measure the open/configure/prepare/start/drop/close sequence, rather than audio delivery latency.

Native VZ with the unpatched baseline and internal microphone completed 100 lifecycle cycles, but a 30-second capture returned EIO after 1,131,472 frames (23.57 seconds of audio). Native VZ steady-capture performance remains unverified. Earlier VZ integration results included experimental capture changes and a different port of the trace implementation, as they do not establish performance of this exact candidate.

Additional ARM64 QEMU fault injection exercises the real send and completion paths through a separate test-only caller. The backend returns status `0xdeadbeef` and used lengths 0, 3 and 37 for a 36-byte response capacity. Blocking queue consumption fills 64 entries; the 65th send returns -ENOSPC. A held asynchronous request returns before its response, while SIGUSR1 interrupts a synchronous wait with kernel -ERESTARTSYS and userspace EINTR. Both requests complete later without another sender wait. Each fault is followed by a successful query, then the suite checks an additional-SG query, capture and capture reopen at 4,096 frames, plus playback.

The length faults deliberately write a complete response within the writable buffers and alter only the reported used length. Baseline and instrumented senders still return success in those cases. The event records the raw length with status_valid=0 and status=0; this patch does not change protocol validation. An unknown status with a valid length is recorded verbatim, with the existing sender path returning -EINVAL. Here status_valid describes coverage of the response header word. The raw used length remains available for opcode-specific payload checks.

Two fresh boots each of baseline, feature trace-off and feature trace-on passed all 42 fault scenarios with identical sender results. Each trace-on run contained 280 events with no trace loss. The original, unmodified production modules also passed six repeated timeout/reset regressions. Seven deliberately corrupted evidence sets were rejected by the oracle.

The fault caller and QEMU changes are local test fixtures, excluded from this patch. The production control implementation remains byte-for-byte the candidate tested above. The fixture modules were rebuilt with W=1; KASAN and lockdep remain enabled. These synthetic tests do not exercise physical microphone input or establish additional VZ compatibility.

Thanks,
Joonho

Joonho Lee (1):
  ALSA: virtio: trace control message lifecycles

 sound/virtio/Makefile               |   2 +
 sound/virtio/virtio_ctl_msg.c       | 156 +++++++++++++++++++++++++++-
 sound/virtio/virtio_ctl_msg_trace.h | 107 +++++++++++++++++++
 3 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 sound/virtio/virtio_ctl_msg_trace.h

 base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
