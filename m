Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1709514769
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991262; cv=none; b=Pz9wFbMkqUITDgqlvGH+3sFDQNMSi1VURRQyB8B+ruZOyaeKxZqRN40AD0SUryqLdbfmXKYZKEsfoWEYSmpy8qv43YQYie08G6hiu+PHQakjZx8NvXwKzp1NKWQBYF67XZmEeRYF9B9+0lfRZ1Je5WN4uNbOCsK/L1atz9VgR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991262; c=relaxed/simple;
	bh=PLxWEdHDhUnvBH7lu4lQL4zExhtrF9sPTVq/XJm2+IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HaRreFnbubH5nBiv2R7dl/A89jwJyfXjrP7LfqCf84BodVTOZwOthg6SmYt+z6NrTVsjUPUuRGcjOkRQIkt6kMShGRrWjC/uxIQxVf5lrdXH38rRt/lldQZtbHEZ84rNJxNwmJwxH35AxqCA23J0Y9Zwxqf5UcrzRnGea38PoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alPPItRP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alPPItRP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso462465a91.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991261; x=1792596061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDbRSJPPHMuwciSupVJvu82u31irQ6MMv35QtuADKcs=;
        b=alPPItRPF8yc8eiY6JmEh45qZHMXQxIZaJ30SARxKon0nA91/af+KWuvjur79NnkVP
         sDNZyrv01g6KGmYG2xEfqXLpzcuI3Rcv1eLGyQTh9do+BVWitdkosO1wgRUA2EJTzM9a
         NDzrmWPE+/93JIRZYYd0iwud0abDlD9wb7hpjpkiHOTHFN6b6VVcxPcyB4BluYWHucAs
         tbduEiQYPTzgL5q/nzoGjrMWqooG+7nM7FTXPKGMok0QkeTazGmFVD9Lza2AZRHM6HAH
         DxWQryr6Cn8uMmY7TJNWcpi6ElEsjSwoVJzlXHrFQYqBxlJ4wqE5sh3OOJmPz9Yr7Uu5
         ui5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991261; x=1792596061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDbRSJPPHMuwciSupVJvu82u31irQ6MMv35QtuADKcs=;
        b=EUWtWuU1TwBMK9bf2+QmHeDjojOGmuFxC5jy7n2G0xnW8ietGNMkxb+v3n/vipZk3a
         EfcncoDGw35M7jtJqBAC0q1AoBlVIvpXW4dimDStFHIS8PbFeyHLnVLNFY278ztUgZek
         FoAgEGUirYuXub/pVVKDK6G8LzQM4ofoHSdXL9WAbFxts2WCUMT9L3kc1CusIi9qstXg
         wfo1J3RLtHkj76yp3L60GGv4tS3dW5a1lT2wT1V6mBAJxk8v+psV6ZifkQ4GrDGSoh+y
         MFEEgoUD1mUoTct4UMhX7PDZcJ8mt32bEQS1SZRxdhTb9DHOdV6gKoDTmMkdksoIYhJN
         fCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDoRytkCd+az6LtbYo9sYWJixMouUPhstpZMzMjO09IkhpzzFRhwr2VFC414S/rxb/KZOdydRyD8auAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJiJKgynMcDucFQ8Y0xn9kk5bnTyNyoSoODYmmj2UAk6nCtYOh
	EzGT2fWftSC7yQ7H+2ijHwUHNQv9BGLTLwHSuTrs9Mkkdl8UgtZ/rsKo
X-Gm-Gg: AYBFou2Rz8rekzji4hofj5IIoVqdBZW2qhnQju/J0TjRXYNkiwCBYAI5+96NJ32FIel
	rxbwfOKNJQ/F/GIlS3ct3yzAZoR0+Kby3LdpkllJy5rvXA0oqIEAHb4QKLdUdFKU2hhBBxJGjbA
	m0HzgdoudBKDrogeQkCXxdXApxmC2prtmLEP1IzVkBzOZ+Y1yMhHOudZGjzK0zVIUPpVlpJ/5+z
	qVH76ANx2BeYePeOs91SbnXjxH0I+fjY/6n9HOTYOBrAXNIWIqOVuH1hctBdgT4YHEKuHhWPu4w
	VJVmmSlR2hLRFXrwJEymTwug4l2hLohh7LHx68pEFzDFL6RP9wviawmwVxmiBiG9X7zAD3JDXai
	O7UlURmvU+HoGU4u7Yy/q3gPlMzgT2lt84LnqPt04Xa+nxPtYqZw+b/UM5aiIOYC+iWquOZNIcS
	C6M1iOeYWcwVA+pLfotY+/CVBXLIoM9Drl5eICAJbOptaYHiarTouzKOk7ZYCH9UpndRSCc0Me0
	kkIKpyqS3yenEQuBxSjok26b81oR/iZnWw1y9VNj9DRen5wtwjh3m2OKoAzfftfdW3/2kb6FPoq
	vuwzmLHrgbmX1dE=
X-Received: by 2002:a17:90b:568b:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ac017c701bmr6727013a91.19.1791991261023;
        Wed, 14 Oct 2026 08:21:01 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm91997a91.0.2026.10.14.08.20.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 08:21:00 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] ALSA: pcm: refresh capture pointers before drain
Date: Thu, 15 Oct 2026 00:20:55 +0900
Message-ID: <core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com>
In-Reply-To: <87y0c0el29.wl-tiwai@suse.de>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com> <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com> <8733u8g0kh.wl-tiwai@suse.de> <87y0c0el29.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks for the suggestion and thoughts. I tried the smaller change and hit a
recursive locking issue with linked capture streams.

I used a test driver with two linked capture substreams and made the
later member's pointer callback return SNDRV_PCM_POS_XRUN during
drain. This led to the function calls as follows! :

  snd_pcm_do_drain_init()
    snd_pcm_update_hw_ptr()
      snd_pcm_update_hw_ptr0()
        __snd_pcm_xrun()
          snd_pcm_stop()
            snd_pcm_action()
              snd_pcm_stream_group_ref()

The outer drain action already holds the group locks here. Lockdep
reported the recursive acquisition of group->lock for atomic streams and
group->mutex for nonatomic streams. Both tests remained stuck until
the 45-second timeout. Removing the link let both tests complete.

I went back to the notify=false approach from your first sketch, which is keeping the pointer update inside snd_pcm_do_drain_init(). I also
added the guard to the early SNDRV_PCM_POS_XRUN branch, since that
path still called __snd_pcm_xrun(). Drain init then handles the stop,
while ordinary pointer updates keep their existing behavior.

With this change, all 24 linked test cases passed across both locking
modes, including pointer errors, tail reads and reopen/recovery.
KASAN and lockdep stayed quiet. This was tested with a synthetic
driver under ARM64 QEMU; physical-device testing is still pending.

One thing I wanted to check before sending a revision is, how should
drain report a pointer error?

The current change puts the failing member in SETUP and allows a
healthy linked member to keep its tail in DRAINING. A blocking
capture-only drain returns 0 if the rest of the action succeeds,
and reading the failed member afterwards returns -EBADFD.

Would you prefer that behavior, or should we remember the error,
finish stopping all members, and return -EPIPE from drain? My v2 proposal
returned -EPIPE and moved the linked group to XRUN, so this changes
what userspace sees.
