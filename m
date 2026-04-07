Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D33C279E
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576159; cv=none; b=oJw+CbHJYMYhgYQ6AKhcOt7KmLD8N0YM5wtdxqUPHLWPHr35RHmdzwxJGDkS6+YQKoUmcuyLXmwcUn7rdLMFyeaod7c6CbZHS7qzxolNREzecgwFXUfYcODlA+lOu7qONa0ktyM9xYqQyo6+i1kr9tJEzHf2FC1X2qEKfFqpRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576159; c=relaxed/simple;
	bh=fTo4OrTyCJg21p0SMTgnlLwhIO8CKev51mtpBpdcQaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=siqo9gAMQgLFm4mCd2a5gl0kPq2F99oWYHHDXDnCSXApwRa4bUyXrpJlVgQiL4wCRyrp21/oclFtZDo/48iq53G0TmD1PQBvOm6h9h+rSywKz4j6ZG3wgRvgGi2gsU0sZ6eRYqluDkPjg0mA4bVMBRHgPJ4ceAXlDyfXumy5374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6IZv7TI; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6IZv7TI"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ce102afb0aso3696222eec.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576150; x=1776180950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBbxMpMvHZXgrol/bD0lZAIeCKaIDH9RCspJpWARbaY=;
        b=K6IZv7TIJERAvwNu1BVE+SIj0nwfm7N+BlgEnaHOpv2LyBqwmW5y4EGSe4ZA4zlVSe
         eCQDF1OM1qeEHNRsCbHz+FhpheUvEqSLeDsopyrqCoGdhaJ7+FK1PmJ03NInAWmTsrkQ
         WNVXAWOfoBTAs/E19D9WD+xXJMbP9oCMU7m8Tcw171nNUYK5S10y3dGjla7nuGdKCsOp
         JQBsGLMRa7SNqmmkC7cXa5JfmKp92xmB9ToMzeeDvdsC1vcppPQZSS8RiF/MTMsBRDnB
         DngHrMt1HrskTD93/eXSvR70UWYwG3Y97WCs2qUW8ZX/GnwpmzBrWDJq3Hna9xBuH4Rz
         JmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576150; x=1776180950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBbxMpMvHZXgrol/bD0lZAIeCKaIDH9RCspJpWARbaY=;
        b=IsXgJyp5jtXzXf3rziawXTjdvMzGSM8o38p9H4/xg9PxTC8OMeKss333BMprtlI+q6
         8JFo0IVHRBg4gmDubyciS+26Pq3lX5vvaNZ1kXzXYJTGhoLBkZke9LLnQMq1Z0c9m1mh
         3zh2Tya/wtjl53OEuvq1mxRKLlivQB1d5Rte1sy2H8T5lRO7pjfko0Q6kqfSYV/XshV6
         m6nnmufAsdtCTe9hyp0IXa1OkMhskgRCucvHhMvTKvp0RnxaxHG2ZxIxFHWhJHFvfSR+
         sflZJfgDLPCv0fXd+E3vVfFgsTwHU8BRrixdj0o0mtQ4t8u9zj6ctDr4l4JUsYbqJFdd
         vdPQ==
X-Gm-Message-State: AOJu0YybMwmoQy5oAsBXTGr1AU9ojAOByiFczMHaoA4xXTU1gHpw9hZh
	7/nMZhfwCe1J4QM2C/xgfSZZGMmx1vRglyjw4BqMLzfo9DOhpRLsYebS
X-Gm-Gg: AeBDiev9zVGYtk0+VJ622Mc6dtSQt/tq6Y/pqd5vwlE37tLxc/TH5/U3Yrm1/g90IyM
	QpFTDLcFrM5ySgqe0Ls33zaTpgdlVuNVBm50/byp4+QVkNxbWtOmFkeGC29Doix+PNiIAKwn+PK
	msuDDDnGVST6UNUSmpvLtloZ4rF2CsnBvhULIOfwv0YvPJkEHgvOWStr3kVfNBF79gIvWSH/pNq
	8J4FceOVrimXxx4ANmfHZKuXNaeDYATY/feotFJcj6UNYsd5m/KroEmg7rrNeEw3Mj2ij5lp9QZ
	qp0/mq7C1f5+ayUkbDTJGyO/xa/+xR0jYt9DOWBoQIyvM7r0LNnQ5LF5YcQkyZoaTm2U+IZu8UI
	PD+Ual8/5+6AsVb7w/LkHg1XEFxgz12Anp7va9vUbB9g8rqBerpLEAuZ8KEiwe6f+ssYuDBaWI/
	pdbvENHf4PMZPBQnIiZmm7f+WW1BEtpKSCwaxtFOmxn1AMdQa7xJPmiKbnKNJhVYgA9/w4AY3FJ
	4tt
X-Received: by 2002:a05:7300:214d:b0:2c4:c4ef:48f7 with SMTP id 5a478bee46e88-2cbf9afd2e8mr9270214eec.11.1775576149998;
        Tue, 07 Apr 2026 08:35:49 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d1b152f3adsm2918397eec.20.2026.04.07.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:35:49 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v2 0/3] ALSA: add suspend/resume support for InterWave ISA
 cards
Date: Tue, 07 Apr 2026 12:35:40 -0300
Message-Id: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2jHTRlBc+R+GRWkHGcMrLVYN4
 d8FjDuXJzn33AkCe+EA52QCz1GC9N0CepeArU13YxS3MGjSGR0oQ9MEg9KN7J8mMg4tZpTrNHe
 lq0jDshs8V/Lamtfiy+FR3tmOa2g1aglj79/baVSr9+sf//SjQsITOaNUqqo0t5dba6TZ276FY
 p7nD6sFf/rEAAAA
X-Change-ID: 20260406-alsa-interwave-pm-609259dbdf02
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=fTo4OrTyCJg21p0SMTgnlLwhIO8CKev51mtpBpdcQaY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXVYJOdu23eTPLVtSR+cD6BdxCUpxJGtFeEebLNHdNt
 TMJF9nVUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABM508nwP7ZP1emqzvyNVdOU
 ZzNLhHVskWuUXyGSzCxw5lrTPb+pixj++/e66zqzWNwxmcW7uteM+8TvS8fy36058ZbHwihPoJ6
 DDwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This 3-patch series wires up suspend and resume support for the
InterWave ISA drivers and their PnP front-end around the shared
GUS PM helpers.

The first patch moves the remaining standalone
snd_tea6330t_detect() EXPORT_SYMBOL() declaration next to its
function definition as a requested small cleanup.

The second patch adds a small TEA6330T helper so the InterWave STB
variant can restore its cached external mixer state after resume.

The third patch adds ISA and PnP PM callbacks to snd-interwave and
restores the remaining InterWave-specific state that the generic GUS
resume path does not cover, including the GF1 board registers and the
detected memory layout.

The resume path intentionally does not rerun probe-time DRAM/ROM
detection. As with the shared GUS PM support, this does not guarantee
preservation of sample RAM contents across suspend.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Add a separate tea6330t cleanup patch moving the standalone
  snd_tea6330t_detect() EXPORT_SYMBOL() next to its function.
- Extend snd_i2c_lock() to cover the full device lookup/list traversal
  in snd_tea6330t_restore_mixer().
- Renumber the InterWave PM patch to 3/3 after splitting out the
  cleanup patch.
- Link to v1: https://lore.kernel.org/all/20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com/

---
Cássio Gabriel (3):
      ALSA: tea6330t: move snd_tea6330t_detect() EXPORT_SYMBOL
      ALSA: tea6330t: add mixer state restore helper
      ALSA: interwave: add ISA and PnP suspend and resume callbacks

 include/sound/tea6330t.h  |   1 +
 sound/i2c/tea6330t.c      |  41 ++++++++++-
 sound/isa/gus/interwave.c | 178 +++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 191 insertions(+), 29 deletions(-)
---
base-commit: e051f09ba003f8b93dda4a8d55a1bff797235c0b
change-id: 20260406-alsa-interwave-pm-609259dbdf02

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

