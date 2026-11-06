Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923611;
	b=2Bw5znwvZSfP95DCtcdGl+FCsCSbcktYEW+RKUF3ST1tSkIhdgTvLovGONEY9e5Uo/No
	 VnEgvCbS+Q13SwfhjKoXa8ZprapXt6iisxdGM6WbQfQOyFmABULtM1QIH8iYcFlYf4Uvh
	 Zpj15vcGzzeAH+jfWz99/TsqRErsotsN81TvXsIUEbRSw/xkKMrVBF3wa/S7erP7fuClp
	 hr6Py4gc10pYHY+KK9Tdupt5hZKwulbz4Gk/3302WEIzFBb5v3VBudnoLbzdgnr62IACb
	 nFpSEK290EzR1zZUhO9GD6Q2OhayvVAdo/BhsXkAyB4nL+fKbE1xll5oLee5TyUAZxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
	b=RlHMqPzVVY19G0quu8iPlVsz9X7WtTUhzbtPTmPn2sELYU+anaUvaV8kew+xjK6NKofe
	 oQ7XHaFqmXY6Im1UY5z9zWRX/d4sR/mlDxx8GPtAKZZWqLpe8soGW0Dc5xPvDdy3kUkO/
	 +DbqTVQpGqHm5NcNQpjQPZp7wNkw6rk6H8NRDP5A6zUlyC77HlrgNnEYSoS+NNe9B8coX
	 N0JKOE1NHDn76Q9cmraKXDdpyxY/wTx7vFozFNxnl2AhfZgr1AeVAOsGna13OfVyyH8Jg
	 NZeVFp6bLjafCDe77KEWRTSTXVVv2nMlNirG8otCPAsk4wSpvsnSrmIl+uy8a4l794g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUzlzjXX;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CE0606A31B
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 00:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUzlzjXX
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso207209eec.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923610; x=1794528410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
        b=rUzlzjXXQrgeZVhDtCIi0p2CITRdKKsknqZzQuoRnEyAn7+S4LAkHs5nmX3aDL1P/d
         0KGgqq4kJw6sr8G8yU9Hj9E9wcG2dYfMLY4lq3snbaOylEyYJ8rn0l1z747y9h+7G7DZ
         Em8PM2qcC+DGcSyhJWaCZJGafTlWd+WiJTyyjn9wIgVzwhsSzTDnJrzGL3tJGeWGgFQI
         m4e5XcQBSH2r8eFCQ0mJqxicwdc6+3lxNyhBBsGbYqmDw5KGy+qN+Ezg4LMkCErePYG8
         tBjDA3aNSf5gkt49Qa0NB/DWIGgVV7bybfYEDX2zwKRcFI2z09QcEmwXx5ddiAOx48c7
         /xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923610; x=1794528410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
        b=BbugRH9tzqTIMJX1K670/oYNtGX8BPXBf1QcHI7bGwsul+lZiYCI9d95QbnnYgUNOx
         5R7oIcJ8b0ZDFwEoPmUjxh8Hrekzhgrs1TjhyvjfrbcuiA3063ttBdlBiGTvkCIM5KUs
         o3aRqDClCWj7ZWbOTYOjj8J7ofZ6MsPtBJpdb8+UTf4UNgupUSxNjQ1NpEDZsF3XoMlH
         I1ST/4Aog24h6iUvBDxZUrfymJMSi5e7RrU2Z+j4JuyVzGgJtwslBHagSXAyN8x9uOBh
         rjDNDyihw/p4H8eae4IcN8aTIfTAZvIaXvut6+JNEeZ4zacsrOg44DSEq67FQwT4lYl6
         cTOA==
X-Gm-Message-State: APuU4Z/41ywDjr3WUPR5vRCcBPAfeUCt65POAhteh5eK8OMPPLfHRt5l
	SVP4mIu6xoXkW8rHyGzVOcPecXSBr9u6PJxcqK8e09/k1mItV+HTQ11unk+Jxg==
X-Gm-Gg: AYBFou14RW/2uQSNx3wT7JxUZIMNLsPKy5uu8nsbHi6GPAE5kuGQo4/cnlEoZCd5GXw
	7WAb/Z1sEKCSfu6JZpCTUwikuASGOp6EPt958V3FezMB6WBlmQ3qt6h10W6gOQ65Pne5mZOsLLv
	K19Vieh1dfkFtoAbGiT865Cblh4WgQnB8MgtKRb/bC1dJ1hpHeEw2wViEecOdogWzJPnbTYA1ix
	ihdt1HyMbxeg+5KpyMYkLLx9fuBvau7QxGlBlpBwAdZyBaduAOblc5F5l2O3ZTzePHAXqSukFu1
	FEu51Ppv06xfBDxZehmcIpnTI4VbdrHiaGsv2gdpAerV37E8EXmyqM2g1qly1BvvrJpbJJDgjf6
	JAKOCYbPPXmYsF7KksD2z+b8dPASZIJLebwlo8EltrQnVl5PpTahWfcAPdW1QQo+elJBZ6FSul7
	8THSX7bT4QtAAfQGvVRstp5ISoxQmufEpV6LwvIMPT2XA6eFWLUvBma6HjHrpyr/etwU+NpbvV7
	Y8J9fk5qS+S/CwseRHlaZR9Oc0CtlEJZltHeztJBxfGqKlIgb7NpsFOrfJ8fMgOsIxwe4AnQw7G
	0Rl5g6pkBaiNK33wqLlsRo11ERnZzh+/ns6uPJoZ8nWe60goISK98wL2iDBHT1+nKSKl1h1kZxw
	56hNvB0qwJjh2XfV4xFKz1OvqmpTngjFjCVir0eUfG+Kux8g=
X-Received: by 2002:a05:7022:170e:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1b25d29403dmr804327c88.5.1793923609691;
        Thu, 05 Nov 2026 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:49 -0800 (PST)
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
Subject: [PATCH v18 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Fri,  6 Nov 2026 09:06:32 +0900
Message-ID: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

Relative to v17, patch 4 adds the transfer-failure XRUN latch so later
completions do not advance PCM accounting after a failed ACK. The existing
ACK and prepare recovery behavior is retained. Patch 6's partial-restore
rollback and event-message ownership fixes, and patch 9's wait-result type
fix, are carried forward unchanged from v17. Patch 7 retains PCM DMA lifetime
and fixed-slot completion checks, and now reserves the successfully seeded
ordinary capture ring until userspace advances appl_ptr. Patch 10 retains the
staged capture lifecycle and paused linked-stream XRUN handling, and restores
full-ring accounting after active and native paused RESET requeues completed
requests.

Validation:

- Cumulative stages 04–12 passed incremental ARM64 W=1 builds with KASAN,
  lockdep, and OSS PCM enabled.
- The no-hook production candidate passed ordinary and staged RW/MMAP QEMU
  capture. The 14-capture sequence verifier passed across both modes,
  including RESET/reopen boundaries.
- A slow-reader QEMU oracle reproduces unread-period overwrite on upstream
  a4311e9 and v17. The candidate keeps the ring slice unchanged until
  appl_ptr advances. Separate active and paused RESET pairs reproduce the
  same baseline issue and show the candidate preserving the unread slice.
- Synthetic ACK-failure QEMU probes cover capture, playback, and DRAINING
  admission. Subsequent virtqueue completions and recovery paths were also
  exercised.
- An exact ALSA-helper model covers partial-period capture accounting.
- MMIO rollback, timeout-width, PCI remove/reprobe, and linked paused-XRUN
  evidence is inherited from the validated v17 candidate for source paths
  unchanged by v18; the manifest identifies those inherited checks.

These are guest QEMU and host-model results. ACK failures were injected by
test-only hooks; the returned VirtIO completions were real QEMU events.
Physical Virtualization.framework devices and KCSAN were not tested.

Previous version:
https://lore.kernel.org/linux-sound/20261105070845.6449-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
