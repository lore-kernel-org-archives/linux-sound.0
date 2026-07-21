Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136133C9891
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629582; cv=none; b=J7qu4PDsRnLEnmrGmuCgI+OCSsec3v5mqCG49n1EIl9FlL+LDMUHeQikaQZ5YfuwzsLQMg692JxhhDO9gnfzCjgczOZR6EmiVw7V7bEn170Vw3HakbvdJinR5bwdkXJzJJRIy7hL8EMqqkm9t4IsS62N8Ey/DASvXjKsFgfG9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629582; c=relaxed/simple;
	bh=+29AR44PnhPvIOc32YCrP0t1pVEUsI3d6CZnHSt4JPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jm4VmcGGaikCLIbo39ElXLlymxaWaTBTukqTdgrY+qukbfrwQ+9fSldwzDSvZeCyJdbrRvvS4/6kmKRDa3E8pzWDAUKJGES0TSMFh/eyvdc96x7lCtLkX2IYJEHjvLhyhN/NUuiYhlUFLClB/Mtkr3145reHPg8zfkMtUSpZqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VucZGTqm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VucZGTqm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so100029225ad.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629579; x=1785234379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=VucZGTqmOZomcEPX0+80faOKrWU4sEcVMqqNyuT1hy4gQ4MuMKbayq0Ig65UiA7+Zn
         3idTNSnlPLwbvW+vnskExELIponZEAPM2M2spyQTAGmECtTgPuzQJMTN+Jyi/EPhqcHW
         sZRpFZMH/IPm3K7lfhLeROINWbSF7UEhq4VjGYPXR/zUC6kQ9Uq/SMZBm2PAIE4sq1AD
         VPe8NYk/MYjl0Hz+voNb85n2sjB+DFoxcck7JJph0zfSV+VX1rvBgFi6eQBSeAeTC8Ie
         ykwgENMDclqzI5OJIO28MYtUj4zEW76j/+XifdkOsYtB/c0sor8IyH5Tmh+rabE1xsrr
         Y+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629579; x=1785234379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=LHd4OkvdaNMQsRJglJX6B3V69tC/5i7txMA/KHsKEPaOnhdvVhf9xr605/k2HZgXtL
         Bj52kJdYoYZ5eCB7SAdG0ffefh4QgWq+A9pYpt4y56+RwgWCSBRYEOZ5f2GFlLxeSBkV
         jbbJs9FacrYts3kE1uY19N18SlSKSUnYjSdqF/fQuH19mNVU8AVYHiYJnYMnfJe3HSo/
         NvEwGoNeH19sOn79tJJuikSM8xBi6rWmmaRK2ASyGkomoKyX33pcuh65fFOFONJUETsv
         4hntAyFsthAqL2vnGVCijVpH4JNxggV7SoIR3Tct7HkXn6Mt/4wOgKyAOxh9JeHzSlsM
         endw==
X-Forwarded-Encrypted: i=1; AHgh+RoFuIybYVTXjYwkhzwIE/HCjlnLoxdh/BmIuA5/rq6U5AlhKioMT5buDPWHIF3ls+nFrEh2dCFJuuXZWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziLj3YMLkbmNzwKCD2KIdBzFjG0rj4yD/bvJkS9WQ5i/lrbj4P
	RKdEDvfnroldx7grhYrYjINKP0NIsMrKjYLf6KVwD6mKdOBNdEbpM4nl
X-Gm-Gg: AR+sD138ZiV3oPve8iu2jFafFQC851CMe2pQIvrXDFPu29XbUAMb2rnPE9PyhgHxp5y
	hSUmkfZ8Pk6AQmSAY2yGVCexdrhIc52YXBneJ6X03m7E9BuNAcELKQEIwtg88K5HV1RnMXkb+PI
	hQ2E2ptVohEoXD6c/PJE+/nUm1zBto2mS20bpL9o9yU3ZeM1I0oG4wh41hHc894vwzUu/ASoBpG
	5G4OWNB55cBieMmlAWlE/t5EBNykNWtJj6u0ENCVW7nU18VNDrrThhxRsychMDDzBWld2V2u4/P
	jzh+HGicRuYf1fDSoVra+/tqAOrtW9U/rZiXVyXdjDDiPFXBkBvxUL63WRrEboksmYCDGuZ9m2+
	ubTB1mAdBpLeBgolpZyJnh3Ju73VCbMTln7zqlUow1Y/F8XZo6sRRd8a6lyabGs3xu/zV8dF+9J
	oP86qTD4F4utem2Y7Uy5P7GkqtyBJwhLAPAs1r
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr183821275ad.25.1784629579348;
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 00/29] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Tue, 21 Jul 2026 17:25:31 +0700
Message-ID: <20260721102600.523199-1-phucduc.bui@gmail.com>
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

Compile-tested only.

Changes in v4:
 - Included 2 additional codec drivers for cleanup.
 - Simplify regcache error handling in resume for both rt712 and rt721.
 - Remove goto labels to streamline error paths and prepare for guard 
   cleanup.

Changes in v3:
 - Rebased onto the latest broonie/for-next.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v3: 
https://lore.kernel.org/all/20260709045902.498848-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20260708141734.578926-1-phucduc.bui@gmail.com/
Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/


Best regards,
Phuc

bui duc phuc (29):
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in
    resume
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in
    resume
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks

 sound/soc/codecs/da7213.c             |  37 ++----
 sound/soc/codecs/da7219.c             |  62 +++-------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  89 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 144 +++++++++--------------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  39 +++----
 sound/soc/codecs/max98095.c           |  35 +++---
 sound/soc/codecs/mt6359-accdet.c      |  13 +--
 sound/soc/codecs/pcm512x.c            |  19 +--
 sound/soc/codecs/pcm6240.c            |  25 ++--
 sound/soc/codecs/peb2466.c            |  16 +--
 sound/soc/codecs/rt5514-spi.c         |  21 ++--
 sound/soc/codecs/rt5645.c             | 160 +++++++++++++-------------
 sound/soc/codecs/rt5665.c             |  15 ++-
 sound/soc/codecs/rt5668.c             |  10 +-
 sound/soc/codecs/rt5677-spi.c         |  36 +++---
 sound/soc/codecs/rt5677.c             |  75 ++++++------
 sound/soc/codecs/rt5682-sdw.c         |  24 ++--
 sound/soc/codecs/rt5682.c             |   5 +-
 sound/soc/codecs/rt5682s.c            |  17 +--
 sound/soc/codecs/rt700-sdw.c          |  14 +--
 sound/soc/codecs/rt711-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt711-sdca.c         |   5 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  50 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  50 ++++----
 sound/soc/codecs/rt712-sdca.c         |   5 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  49 ++++----
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 587 insertions(+), 753 deletions(-)

-- 
2.43.0

