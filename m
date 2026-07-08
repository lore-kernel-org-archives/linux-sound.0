Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCFF372EE3
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515032; cv=none; b=fEEGckYMTwmjbqD+9BznHf6eWy1hE0gaTZpyE8Adkpn4EE5XEfIgo0A43s8Sm8BSV/mKzfQo/dFkBaiCr59UO6/7xTGygu558zV/2kaA5tE673I/TgZBYur7JUcupK+/zhLFiCQ4ZgXCEfrkJ2Dt+Euq4OKYxKk6Ib+rAd87lpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515032; c=relaxed/simple;
	bh=w11QooIMUNCBToWMi2codyMg1YXbxG7zD9BvFPZfqrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uw2p4KSBQKNz+Vl+prxDP3tsxXTo2OmLOZLyA0KNmsRbCqe2LO2hrtX01QqTrsPvyoAboBvFJUuGvQFDZqaI+dtOHlRbZLGWJCCK5OtuYhCYj2XglH+LhGUDz5Bv2TyXGnOy4mhzjIE1lea9jX/PV2avgiXLucX7cBl35WmZXCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtqMIg30; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtqMIg30"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-382ef647e20so717421a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515030; x=1784119830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+8LUBht7Ch9JyJgm4hJtusVhllo3ouZ+moFwd0Yi+U=;
        b=UtqMIg307WWo+0J2mmaBx8jw9+Ya9ZNHQqt5y5UcQhFP7UEYBDAVj+sYoqTCEE4dps
         rivIM0bj1p/++zv0OVJF8oEd+PqxC8wXTmqKvgwjUN7za8cZ7CmbPSwXsOKDbMe0Wwtx
         7htsJ6KHmyo5/cnTvPNW8V74T1sKy53KAt7BmV5P23qwNcfb3kujcTQJ4t1ifOlIBXkR
         lMF/e9J1quk2i+uUn/vMQ5XQISufWpRu5xKcn3IxNKcKoipD0fV5DK3MmZ2Q+jmcqTiU
         fbxPifQ3ipZOYfmxFYRJYMNE2d1yLa5jxEMbIbJzmZ4pwc7OM8rS6u7h3tpz29EtTxdJ
         TvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515030; x=1784119830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+8LUBht7Ch9JyJgm4hJtusVhllo3ouZ+moFwd0Yi+U=;
        b=sFSrdPdgvLVr/+r2GOFaPBhXMe296Rs0qV8xx3eRfWd5vRo7LADSjrjoCETcW8pFeX
         LQJ/bZalU1ecY6/5yDZgYxMTQjU1Ezo8AhnEqS4iaHOnGZYKgjSuh5XjHoLhfBmYvCx4
         LPePFyixKNRu62/aEwkuXS6GRy5a7LLTgSsq/irF0CBpD4imhViGWOiPgN74UiGZEaSv
         jkvr9YxhXHdkqSzqEHfkdhNi0V0v4rRTtHkuzuXBtvTsXjGUI7/PGCpRutG/+04qYM5K
         733nrvesmATodlssymPt1JoYpD1NaTngWavU9KjRztPQ1KCAIUm1MzpdUPZR+VX0RRzr
         2KdQ==
X-Forwarded-Encrypted: i=1; AHgh+RodGQ4RClsMWgXgP/JujqP9cxtX249SFzpjjOWAJdb+JTYrDmmDLWX9nYNr6aoM/jXvP80o/a1ujajFAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PpaAtK7NfxptlE3jNmJ4QFgP0GYC5zneEvdVZt+k18I9SD4W
	A2IoRn7K5SylWyijJbWNV/ivECvvaGFTXQNjgZqX7QoDd3pGN3cxGDPw
X-Gm-Gg: AfdE7ckblotqFiFaYpzxY0u5kxtLhvfUkygXtd2edt12aRqItwU0A+8PkIEXYby3+6a
	gqC6t3oV8Y1PgSvVpCAWxq04JjaNEZ9lfmInXEg37qryJoBnCSIPtxROQdHjkrblUgrkUP9q9XU
	Pfyv2Voy+jwgX0aP5orcNZb/azCCACw4/6Xsuyx5wFrkp9kR3PPtMjf9QeJ0RGyftwG4UneSs4Y
	HNeFDc72EPWqXuxsSJoxll7RnkYbKN3MLlGYFiFtTMfsqEb75n6w1f0FCAUZSMVcHEMieqDW1T5
	EogdMGXRz+bD5lNO56hX/iPChqv5Fk5+EUcUnJc+3SfzM7Xd6QpecXnrLTfp9JGzKC8L2NVcUu2
	jg+zjroFZ8Pdc109hi5n2Y5oqkGR24/p2lvJoIH/jtlVFdnBo2XegtCC4q60aqcPNKddWnMN7Pj
	+abIt79vb53/TgXamugHYZM+VRaTg/vpSjg2NKE+N+uOhuaLw=
X-Received: by 2002:a17:90b:2f06:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38941101dfemr2493491a91.7.1783515030068;
        Wed, 08 Jul 2026 05:50:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:29 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 00/24] ASoC: codecs: Use guard() for mutex & spin lock - part 1 
Date: Wed,  8 Jul 2026 19:49:37 +0700
Message-ID: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Link v1:
https://lore.kernel.org/all/20260626061329.23264-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Link v3: 
https://lore.kernel.org/all/20260707051006.20058-1-phucduc.bui@gmail.com/

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

Changes in v3:
 - Added Reviewed-by tags from Charles and Cezary.
 - Incorporated review comments from Richard, Charles, and Cezary:
 + Remove unnecessary blank lines in arizona-jack and cs35l56.
 + Remove temporary variables and return directly in cs42l43 and cs35l56.
 
Changes in v4:
 - Added Reviewed-by tags from Charles and Richard.
 - Correct the patch subject from cs2072x to cx2072x.

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
  ASoC: codecs: cx2072x: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  12 +-
 sound/soc/codecs/ak4613.c                 |  83 +++++++------
 sound/soc/codecs/arizona-jack.c           | 117 +++++++++---------
 sound/soc/codecs/arizona.c                |  26 ++--
 sound/soc/codecs/aw87390.c                |  10 +-
 sound/soc/codecs/aw88081.c                |  18 +--
 sound/soc/codecs/aw88166.c                |  24 ++--
 sound/soc/codecs/aw88261.c                |  21 ++--
 sound/soc/codecs/aw88395/aw88395.c        |  24 ++--
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++----
 sound/soc/codecs/aw88399.c                |  15 +--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++-
 sound/soc/codecs/cs-amp-lib.c             |  11 +-
 sound/soc/codecs/cs35l56-shared.c         |  22 ++--
 sound/soc/codecs/cs42l42.c                |  54 ++++-----
 sound/soc/codecs/cs42l43-jack.c           | 138 ++++++++++------------
 sound/soc/codecs/cs42l43.c                |  16 +--
 sound/soc/codecs/cs42l84.c                |  10 +-
 sound/soc/codecs/cs43130.c                |  72 +++++------
 sound/soc/codecs/cs47l15.c                |  11 +-
 sound/soc/codecs/cs47l35.c                |  11 +-
 sound/soc/codecs/cs47l85.c                |  11 +-
 sound/soc/codecs/cs47l90.c                |  11 +-
 sound/soc/codecs/cs47l92.c                |  11 +-
 sound/soc/codecs/cs48l32.c                |  26 ++--
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 353 insertions(+), 464 deletions(-)

-- 
2.43.0

