Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823F2609E3
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413930; cv=none; b=utcxowBEzd8qW0S8Koz2IoadGkMpkCjgdQjUW5x2a/5b4+gulP5x+3kJIhNe+Z6tofp42Qsc9WK4XRHIzAr5lvb5m82k3pNstUoAAbq3aQQmHohuNlvoIT4hKWD2aARihC92jqDG2mqhxJ3UkxPAFzP2EfEkAGo6TnyGgwpfsN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413930; c=relaxed/simple;
	bh=5p9TTw7N0OcNhnZYyhuf+Go4pVfPPPej5c6mWs0rovE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH8VCRqThv3urgw3UanGvrcHEopLUolvx1VwRxQMqb6+Yz0rCTsPzF5SkL/gqGnQB6yucDFntlc4iIiTXXyIUMMt2OUi3aEiLB2y13zA3Evi5B6iAgQ829nd5MAJZXI8adWisw86jAXgYWDRYdw7/ha9wMOJHQ4U7uwvQUNV//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgVBJMmK; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgVBJMmK"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so3116756a91.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413928; x=1784018728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b75Br6AUoIPfNj9HPwlz6/PkX6DUan2cfBw1hh8mGv8=;
        b=HgVBJMmKeclt4vc/ey2+0crvSjsiBOJ7H3T45L6oRFgjYatVloE8JQvUWZF48DJWRK
         AcJDgY554VXlvQYPLFI4f7RI5+h3CRdOyaz8Cj4XNwcNJOThehwPptAOvmIFEcnhRXeJ
         dbEPNGNzrPrwAvQd8ugwfe7zQ0QJ8tKcqmJVDCAPIc1fHEm8IJp4m0CTWn62Ocm4+DkI
         xmDOkPe5OAVOOJ9sG9C0xOHwfSYrHZW4JGJEQtfnrhObMBD4Qc3A3ZRuIpW9OT4OPnHv
         b1/YN4lQav/2lw+qQLtwMxQ/DKq475+OR7/BCR5W4W2GS20T5YfIffM2ih30VZ91xCKQ
         ugcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413928; x=1784018728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b75Br6AUoIPfNj9HPwlz6/PkX6DUan2cfBw1hh8mGv8=;
        b=D9rq/TlFT8Rp7OwvHdzF9wO2q7ic+8j4fqH5IvN6nXVk/YhPWypdm8SEs9BfEOv/hO
         C5s7R+nVaWuDayLXnFHjD4JJrJDYTZOaUTI0rzIMZejNq0+PwamsNX+A7UQ3vsE4xaCS
         YNbW1L23aCVTnAvto47Q4/PcKewNP8fKHuWJP86gfQItfm+15plO5eHZf584Ti6StaIc
         Yz+DOF2G2fH7rK8fpdXSPJuKN5DEkgplmK97FZSmENznG/7Uk6p41UndyVWTCbCxNXHO
         D2N+pMWQ7V+EjRVZ12C0IfkqBEYEESK3D553/YQLR96NfkeiOqBOfMZtEXwovxr4ackL
         g2zw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1gF8FDCmLdTyQdnbGkr+jp9eYEkKlgLeQyPxN0oY2E/8M7tWh7lURnI7UT2dfDz4fDbTyNsAJdG/1rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6W6TBTunITWxH0MCX/wv6fYiKE/1is9mdZQhWAkxd1eXWqOSM
	P8xliDt+YCx+uhmiynR1QW/3rlSVo/2gN0iJsFJbw/2QhCcEfy47pqOf
X-Gm-Gg: AfdE7clbJF8Lw7OKCUXZkX0xmxR03yhhA67o/24LJuQXmbS3tLnlUzi62GNv2ycThlW
	SQI9CS+C+B1xqG94BurZJN7rmoqNW9/HiCYgL2hift5ZsWqY0sTFNdBRX6iz9pgsiYzutu/jIs7
	XyIyoouburi+pc20af1VEwaI/uFO9bgKeqgqzG44dT1DHALtWey1F2wrO0+UMtJqxSJYaNk9ySl
	yWwWSa5T3l38/EkezjNBzb0jxsXmVKZAJNG4xnxFKjwBkGfES7m1PmMWGeR5WLltpXInKkzLdEh
	naVMp2yjvFr6n0pSslMQwPVnwLlGxjpBn7/OGciP3rApIGtK9WozdhU8AmEX4alJi0yGV6DNq+b
	ztkNiXTUuwWhyf9m93Q4JWyzHkxDZuTwVpAHUeWXtV/tJj3JYZ6dLNZybAfjxoW7ay2/9x1zUZP
	kmCJ59PSxZmZfxf/pJRZTlEKO26clJMOcXyedvYriyBJWJSp6lKpTiKXQoiQ==
X-Received: by 2002:a17:90b:50cc:b0:387:e0bb:57f2 with SMTP id 98e67ed59e1d1-387e0bb5bb4mr1826611a91.35.1783413928408;
        Tue, 07 Jul 2026 01:45:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ALSA: Return -ENODEV instead of -EFAULT on module-get failure
Date: Tue,  7 Jul 2026 15:45:00 +0700
Message-ID: <20260707084506.718583-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Several ALSA open/allocate paths call try_module_get() on the owning card
module and return -EFAULT when it fails. However, try_module_get() fails 
when the module is no longer live (i.e. it is going away), meaning the 
device is no longer usable.
This series updates only those paths, making the error code consistent
with the existing "device unavailable" checks in the same functions.
Other -EFAULT returns are left unchanged.

Link v1: 
https://lore.kernel.org/all/20260706084950.49331-1-phucduc.bui@gmail.com/

Changes in v2: 
 - Update the commit message.
 - Remove unrelated changes from the "ALSA: control: Return -ENODEV 
   instead of -EFAULT in snd_ctl_open()" patch. 

Best regards, 
Phuc

bui duc phuc (6):
  ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
  ALSA: hwdep: Return -ENODEV instead of -EFAULT in snd_hwdep_open()
  ALSA: info: Return -ENODEV instead of -EFAULT in alloc_info_private()
  ALSA: mixer: oss: Return -ENODEV instead of -EFAULT in
    snd_mixer_oss_open()
  ALSA: pcm: oss: Return -ENODEV instead of -EFAULT in
    snd_pcm_oss_open()
  ALSA: pcm: Return -ENODEV instead of -EFAULT in snd_pcm_open()

 sound/core/control.c       | 2 +-
 sound/core/hwdep.c         | 2 +-
 sound/core/info.c          | 2 +-
 sound/core/oss/mixer_oss.c | 2 +-
 sound/core/oss/pcm_oss.c   | 2 +-
 sound/core/pcm_native.c    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

