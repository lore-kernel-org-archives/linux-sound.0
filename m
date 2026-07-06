Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E03B443F
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327814; cv=none; b=TdTCJZiVdic708xmXch9mVcmqNaZXYMUoo235dmkYe2VME0k/5uWcI8VYIwxPnN21v+BKLtQjNvA49N+te0StPwfIzNQSsHR6/N6nxCsVR+0NSK6K/QVie9zuY2NwuejmGFY4ySUQ02oUzYajbyoqCQuFc4lCtvZzFtiI75XnjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327814; c=relaxed/simple;
	bh=kSvy4L0NPy9Fas7XEsJYehW19X5hA9Lnm18bg/9W0xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CU9AQDwohf22sm/qssSbYGQCXkXZTJXs5bcW9BD+8HD7IG5f9kWbatIpNFZ5GDVHOGKPhKidWeT/019NcZHBOYGAKhq6ojiWfZ3SBe/OSlWrP2INf6tTVjShEKL0r5BtH8IjgbxLBe4CcfKK+zkrgK+pPM+iTVEaw3JrHYawEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APWjJmWX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APWjJmWX"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847a52edeb2so1963807b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327805; x=1783932605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJk1Bu93eE9kkB6dcLeTb17AKfMCqH8aCZOQMaTuPiQ=;
        b=APWjJmWXhoHgfqjqevaH9vD7exrCKeSopx4V4QcqP11yU7IRUwLfB8lQV1CJi+4Euf
         zBf5Phkcr2VSE2nrUKyarrYiq/8A/rlU9GB12K6xv4MrEwmdIBFhn6u/ouSgLvh2yrWS
         ez6sd7gz2STvspc8We8HHzeO1HyIPjMltgrK7rowoucUq9ddW7P7Yt6wQq7Wmu+TV17T
         JEgQ4WAs/2ZCJiVORMTi0sdUwCf4BLBALwJFnc3M37s8LvSs5Bsoq7gBJwQJMbr+nCUu
         lYN3CIRq1V2rTdEMAoj1QkqUFV6gpKAIVcngJzt2jSenmiFFR/7xWMsPiVZsLjd8N+cz
         1mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327805; x=1783932605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJk1Bu93eE9kkB6dcLeTb17AKfMCqH8aCZOQMaTuPiQ=;
        b=TD6G0j0Cmb9JPh1PVIx0QtLopJlLuOeOboK1r5RU7uqe0SjeUFliRyL3MtWQ/r6nq5
         3sdxqt2hmJ9GgJf8FnnWI7CSmq3OjVNVIEpd3TJ6XE1IXTG0fMQ5fg581jOzv3zABonv
         wpOX4PhjIJLvDzDSP1HXoujr8F+T2KtiZ/5jjVFbsCO8KR9sTtlIR852EskqdgzWqNRz
         S9VaH0nyo2xlAhA/7r4bx6lkBh8frtRYTI/070xd/sj2KIejLlTGskk2VJva1pTxnDzE
         DlE4cWddC141D6cYP2BJwBwBLot7/hQowm+J7NIPKxgorrXK/ZiUszRBBp7jmYUK+snF
         GQrg==
X-Forwarded-Encrypted: i=1; AHgh+Rpfmi2knOd2WSGF7bEqbu8syBb7u8MUnlwk8VqCf2FUw0AlKWx6jK0UFP3eB9OCyuvquG5hEPP1Qnp4qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYuk2Um8/XqrDp60ziv/20YFcigEaGeDhsfMaxN09q8dBnJ1hu
	P/mZY4wv/rYHYdQ6SXP3IpTJSr7ghqiydjdQFkPndHS5j1XOnAS15Jb/
X-Gm-Gg: AfdE7ck+Vq1o9ZdquEbYdx548eJtuzOqt5K6r1TIAcfSRGp8UjDJZsyk6jfV+iqYWfL
	NeY9nclHGh54qm2Mc0n+EY5aWyP1lxTU5v1OA7ez/lyEsSFBpsv5uKWtW4l8xPB7dXRvHDFLC0X
	4H8tJffXt6W4u9iSebF0ng/tJM2DHDv49fuKdRNHsM3EctSOVv9fQRny98jQlntDaD7EbW0SOYu
	B846qgaAzY9sFtT33Q69JgE11MyzHTZNMhmyqWxhYR2mGa4WBtbeI3dMcd3djcvKFd6Og4SolfX
	l1jgFCQEq1X2e5WGV5Wy50ol+3nqM5rnSV5LcAdinfMPw2GGsrCVGETmz5EYXHxnx+6Y6R3g5yF
	0U9gYqweuvNn1cUT3/zg4TXHUHU8IJdaDr4cvWc+Za/h+JYLBFMCff/EVj7nW5L/4PXtGCxY8kW
	GBTcw5vpiEOWa5wDbT/dE/hgyp2lgufF6L7g9SW6uBaCJfKW8=
X-Received: by 2002:a05:6a00:9a7:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-847f6dc6566mr8585888b3a.19.1783327805215;
        Mon, 06 Jul 2026 01:50:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:04 -0700 (PDT)
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
Subject: [PATCH 0/6] Return -ENODEV instead of -EFAULT on module-get failure
Date: Mon,  6 Jul 2026 15:49:44 +0700
Message-ID: <20260706084950.49331-1-phucduc.bui@gmail.com>
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
No functional change is intended.

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

 sound/core/control.c       | 3 +--
 sound/core/hwdep.c         | 2 +-
 sound/core/info.c          | 2 +-
 sound/core/oss/mixer_oss.c | 2 +-
 sound/core/oss/pcm_oss.c   | 2 +-
 sound/core/pcm_native.c    | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.43.0

