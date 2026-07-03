Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037CF330301
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058058; cv=none; b=b2kvHY0Gcx1D9AX9RlPu0el+xMND2lWK2fndjgTMVScmQoE7ApiI7cLDWrecsCANtXjyK8zf2eJ54JJljhNnTvjv1zRdsyEuLRX+m/oT+eCGu2fV8/rKn3+FT0yOETlSZN9X0rN2sGhZJTYXjRwGQPjN6VpRcMLZDht3ajPCM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058058; c=relaxed/simple;
	bh=UGkLrBuL5irW/Yht46QG6DEBFfiJYbXFRCF2TdC6c7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNqNimG5GyyR8CmFhArDMrWwdZ42HwnYSa0PFN67sy70MjerlB3HUZtQaefkFOSgqJZVZH7P+O9U1vCt3i8VWDrVgd1Mn1AAOdM5Ktsxu/bAfyRHoIK5FGQz1RH6MtaVZQS3xpmtEY/HHmamK6UhFi4chmtUDTrzRjlZ4jzXLL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFj4GZV5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFj4GZV5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847a483e344so166971b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058055; x=1783662855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcraQoI+SjGv7MwiOE2COsWrr3yT+rAbe2XY9Shc+ak=;
        b=PFj4GZV5hl4ml842XoiBSJlSRZk+A621AJpbOvQ8AAOwp/HQ2jLZYmJHHlfIOxhOeX
         jKFtm24jcFnscQ2XaLrSdf2EoL5WOHOhe9yQ8QlAHkYQ/RwQgCq1lxej9FZk42Fmbz4W
         if9io3cGy96Roeh9b6dhxnJrgWJjP+GUrSROB6Ny62Av5NZHmCfuzj1zOMATkjATDNVn
         5XHeY7w/KxKxTIO31Cl0YKDzLNyGofZCwOxtLvzCSjp7biuDurcZGFFyYJf40IhMvlGO
         6PsciI11r+cFICxRr3jRjgMGr07O2xIp+7aKEgsLy89hXZwZWAa6kEh80S6PZcDUyDvF
         riJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058055; x=1783662855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcraQoI+SjGv7MwiOE2COsWrr3yT+rAbe2XY9Shc+ak=;
        b=rkv12iBqAwLzuPOgAMK7flUVYX/Dmq1kAPgyUCYRuqsH5B/vTx4sDW+a1xhczkKsxD
         EwSiW6C15waoDwgc758DEPwFEPsbfFUOhPHPgXUObbTK65tKgGqGQeGnBlPNdmE+/B0y
         tlwHHjgB2FYlbd8zlPPBpoOmvazHqNBKUZXxux4hmVqS/nJpA0K+7olLP0ad7rCKdBeq
         A0zmR34Naq3U3aZvfcI50quGmNFpq54Yt2oLKCDykZLfNeoI7/JEtI/BMUsY8OCmyq9+
         zO8BY4W8nQ+CKuPz17CJiIslrqeHGuIH5+7tZIH0+cP3or/OqMxyAd1p4Sy6ggrYYhLG
         C0eg==
X-Forwarded-Encrypted: i=1; AHgh+RqkYhoDsKVea8yoUQbMoYW5uCpb5RrJiuMhid4/Om8JgOpqilfyDm7I3t1qYw5VSnH7bIqgUlM6ms1Izw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf5Ysh4QhkUC1FjxVW8eb+13d96mBCyM8VfbmeDpKOqlu9m16q
	W/+pNoUK0mPqz7ta3M/42Sikk+v36eFxw9ZRv6bLNNrHDTQH3NljHW4a
X-Gm-Gg: AfdE7ckFNkAEtbJlqIXHE8BHSneNhcyiR67n+tPM8Yssj8hceRhwXbAKEe3/cCWMDJW
	X5A54etDx7pEnfqa38lAzseA5SyMb3c5hy/wDT7QJXmrIhM2vN/QL44IRP92cjLPkvD74vjs+j4
	A0mMSyE2EiZVmiu77M33sDI9nZCJHfeNXDBNpAygFlGf1mvvLVp2pnGrmZW//dTyZmxLcAZZFPO
	ZS3mEyQykhifrjkiOSOnsPEHMy5iNnQ/p18JaEdiQWYF9wZ6Sk+3tF9ig+e8YdloOiPTVbFORcm
	TfbWV/LD7X5sIo4icRnnR5C/26e4SktnPdp2WWRqmCETwEfoBtJOCbGQxAviGDvRh274xsa8bHD
	leAICZcODX4LFTuRDIFts1rSglqnDxEm4Ww7roYok1D4UrbzVZ8nyZFYiZ0mfQeCWP1gXxdG/CA
	jq+qDD0N31jy2h39ZwMz7ZbwfBdhqtQD1biBCW/O4EeZURaaI=
X-Received: by 2002:a05:6a00:a253:b0:842:4982:82f with SMTP id d2e1a72fcca58-847e177a4ddmr2707503b3a.2.1783058055114;
        Thu, 02 Jul 2026 22:54:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/24] ASoC: codecs: Use guard() for mutex & spin lock - part 1 
Date: Fri,  3 Jul 2026 12:53:31 +0700
Message-ID: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This series is split out from a larger 78-patch series to improve
reviewability and allow for incremental review:
https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.

Compile-tested only.

link v1:
https://lore.kernel.org/all/20260626061329.23264-1-phucduc.bui@gmail.com/

Changes in v2:
 - Added Reviewed-by tags from Charles and Richard.
 - Incorporated Charles's review comments:
 +  cs48l32: Removed the unnecessary else block so update_bits() 
    is not called when no changes are needed. 
 +  cs42l43: Switched to a helper function to avoid code duplication, 
    while keeping the guard() conversion since it eliminates 12 goto 
    labels.
 +  arizona-jack: Reworked the code to use an if/else structure, 
    avoiding code duplication after removing the goto label.

Best regards,
Phuc

bui duc phuc (24):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() cleanup helpers
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l42: Use guard() cleanup helpers
  ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  12 +--
 sound/soc/codecs/ak4613.c                 |  83 ++++++++-------
 sound/soc/codecs/arizona-jack.c           | 116 ++++++++++-----------
 sound/soc/codecs/arizona.c                |  26 ++---
 sound/soc/codecs/aw87390.c                |  10 +-
 sound/soc/codecs/aw88081.c                |  18 ++--
 sound/soc/codecs/aw88166.c                |  24 ++---
 sound/soc/codecs/aw88261.c                |  21 ++--
 sound/soc/codecs/aw88395/aw88395.c        |  24 ++---
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++-----
 sound/soc/codecs/aw88399.c                |  15 +--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++--
 sound/soc/codecs/cs-amp-lib.c             |  11 +-
 sound/soc/codecs/cs35l56-shared.c         |  19 ++--
 sound/soc/codecs/cs42l42.c                |  54 +++++-----
 sound/soc/codecs/cs42l43-jack.c           | 120 ++++++++++------------
 sound/soc/codecs/cs42l43.c                |  16 +--
 sound/soc/codecs/cs42l84.c                |  10 +-
 sound/soc/codecs/cs43130.c                |  72 ++++++-------
 sound/soc/codecs/cs47l15.c                |  11 +-
 sound/soc/codecs/cs47l35.c                |  11 +-
 sound/soc/codecs/cs47l85.c                |  11 +-
 sound/soc/codecs/cs47l90.c                |  11 +-
 sound/soc/codecs/cs47l92.c                |  11 +-
 sound/soc/codecs/cs48l32.c                |  26 ++---
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 346 insertions(+), 449 deletions(-)

-- 
2.43.0

