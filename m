Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CFC3CF956
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179158; cv=none; b=Vx3CxQv2cMjJ7KgsQXKaWQwRUu07d4J1hMVAyRT+iOZpTp+hZ24JXSK4yFGVATFzjSuKMV+ZRmHUZz8g/L/Ut2E15N184to87RPrI4yePubuFnP1nERJqAr+ZOizqJ3Sg5lBOavh9u7YMen4KQVoHh/dJZEon+tQCinLjFVxuYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179158; c=relaxed/simple;
	bh=utVOYVp9qp68LCSOMYNLPnwiFVy3TdeNBuCUNgtw+7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Go2BvuBLd46ilDXcsXxC8o0617e3p/sE8I2nxCLH8LQTnpicGg7pRrodquP1IzhczgJItHSuasc88AknN32i8Gx/lY7BXoInQhM2kyx0deB38w88d+tOqDDnuVF7Ns3YGqZq1jFH6PiIH/ezMZF2WKEnoUvGja+cuiQ086mU4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1HqzyPF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1HqzyPF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso4644330a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179155; x=1781783955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwDURSfFZWI0LYaF1I3RF5swX12C9Yg3hS+CdzJ8gaM=;
        b=S1HqzyPF0BNVme4StsqCAi8o1+Uru+AXyB6jkSZaXfNGSyAH95GJmkFr20TsuJUp4j
         +aoT91pQHFibsoQUxCBTZtdLVPlVdxDZhG9g6MyJJdVkd8ELuETsSbbuGgkfo8URkBvN
         rbeQ/cm9Ceak5/czitIy8MxuwFsDimLPiSfLA/VbdURhDO297GHRLSzF1U/fanDUgaIT
         1d27ZI7NPm5QM9V3zOx2RVQd+KtWVQunUnmdwcbeptzPySIVIWrBclqnFk2Jz2k+qbCB
         D2WsYaTjvv+MZoVnRnfXSp5kYC+n/fWkvqcskizdoyuQ5Y+jbe98JoGlYOvi0UwIVWqE
         PIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179155; x=1781783955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwDURSfFZWI0LYaF1I3RF5swX12C9Yg3hS+CdzJ8gaM=;
        b=tOfDWNHfZQtRoeF1kP0xwHZX86s+DvDWJepccNvzl1l1PS8P+D/kJk/ANtgNOdwFJo
         MKfPu7aW7xc+sFNgA3QqfWVtyOi9trCnIomZjvsaZrIkTkuLFu0P1GqIyFDrT4yxl+b4
         WyncY8tioPAa1/xqQOSGhRzUkQU7XtKEIuUMudbY63ueTJs8B91QHoxXjpTP03HrU/gK
         ymRUQMWUXfTiEpxK+FsjJ5TQ+QTxjqFOlwXGYr/haWINpDvICyGKzd250v7aWrQho96z
         zRCKly0SaYtOJjlP8gEtZoN6HMGhpz9DtvOgX92VCYPS/3JZfQWIuvSztqik+7O3OJz4
         k1jw==
X-Forwarded-Encrypted: i=1; AFNElJ9h8l3haqVhW3lyrksfJ7UWjHpJryquHmYy+4i30LnP810Oe/kLBMSgP+rKi0ubDAWc2AvSc7TxNskzTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8mSEGlcyhBhiVre1UZ9VqoZNWH5ne8g+e22/w8BS2ft2TSMZ1
	pGXcTZjvblh0UwAv89Y/um/pYa90x5dv3xPzi/NXjrzYBsc+kwmDNwtl
X-Gm-Gg: Acq92OHMB/HFUCgOJdmhrqFKuw4FmwQYm0WKfqUKbtz3gUYhDP/2TqkvBOjEB+fsG5Y
	tynLHQE6B9Uc3RPfaG9LRfH3PfkypYVN6o7HYbbDQsgjINRMKwNVKMs0icXWhHF8QrzdKDpflte
	xLkJxCLbR1xHmVS9ZbjP3vfc/HD8W/uxYPubdAT6mo6+6L4LliQTtK1v7ZFguYsKxaJWTTjHjVj
	/c23DtmMMQU0/PLY785XfmZBbvtAL6/eR35K9/IhBrxN7o5Tv1Si3rNHwDCFunK0whx92sfvaHU
	IMm6KDKHEPZjH1ErRXRoUdJFdcA1FeZKGHcoA/VwfnH1jbD4RD5H2LgTgpJN6hg1eiSVmyk8UC3
	OvwiVI3Miwv8xWbVgXkbM1UXIeG4IoNbfDUevFgLjZqRD2ABtQb0M5MfPfOuRswFeLUcOXso8ah
	ps4fBfk5x00WpFURUcV6EZqRFqJ5j0kbiXo4IxgW/jQulaJPbUxiKJvtSj3loYq6dJDApN
X-Received: by 2002:a17:90b:1a84:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-3778ebecbeemr2984536a91.0.1781179155190;
        Thu, 11 Jun 2026 04:59:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/20] ASoC: Intel: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:41 +0700
Message-ID: <20260611115901.80438-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in Intel ASoC drivers
to use guard()/scoped_guard() helpers.

Most patches are straightforward conversions. A few patches include
small cleanup changes as part of the conversion process; these are
documented in the individual commit messages. Overall, the series is
intended to simplify the code and cleanup paths, with no behavioral
changes to the affected functions.

The series has been compile-tested only.

Best regards,
Phuc

bui duc phuc (20):
  ASoC: Intel: catpt: ipc: Use guard() for mutex & spin locks
  ASoC: Intel: catpt: dsp: Use guard() for mutex locks
  ASoC: Intel: avs: utils: Use guard() for mutex locks
  ASoC: Intel: avs: probes: Use guard() for spin locks
  ASoC: Intel: avs: pcm: Use guard() for mutex & spin locks
  ASoC: Intel: avs: path: Use guard() for mutex & spin locks
  ASoC: Intel: avs: loader: Use guard() for mutex locks
  ASoC: Intel: avs: ipc: Use guard() for mutex & spin locks
  ASoC: Intel: avs: icl: Use guard() for spin locks
  ASoC: Intel: avs: debugfs: Use guard() for spin locks
  ASoC: Intel: avs: debug: Use guard() for spin locks
  ASoC: Intel: avs: core: Use guard() for mutex & spin locks
  ASoC: Intel: avs: control: Use guard() for spin locks
  ASoC: Intel: avs: apl: Use guard() for spin locks
  ASoC: Intel: atom: sst_stream: Use guard() for mutex locks
  ASoC: Intel: atom: sst_pvt: Use guard() for mutex & spin locks
  ASoC: Intel: atom: sst: Use guard() for spin locks
  ASoC: Intel: atom: sst-atom-controls: Use guard() for mutex locks
  ASoC: Intel: atom: sst-mfld-platform-pcm: Use guard() for mutex & spin
    locks
  ASoC: Intel: atom: sst_ipc: Use guard() for spin locks

 sound/soc/intel/atom/sst-atom-controls.c     |  85 +++++++--------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  51 ++++-----
 sound/soc/intel/atom/sst/sst.c               |  37 ++++---
 sound/soc/intel/atom/sst/sst_ipc.c           |   9 +-
 sound/soc/intel/atom/sst/sst_pvt.c           |  19 ++--
 sound/soc/intel/atom/sst/sst_stream.c        |  52 ++++-----
 sound/soc/intel/avs/apl.c                    |   7 +-
 sound/soc/intel/avs/control.c                |   7 +-
 sound/soc/intel/avs/core.c                   |  11 +-
 sound/soc/intel/avs/debug.h                  |   9 +-
 sound/soc/intel/avs/debugfs.c                |  18 ++--
 sound/soc/intel/avs/icl.c                    |  10 +-
 sound/soc/intel/avs/ipc.c                    | 105 +++++++++----------
 sound/soc/intel/avs/loader.c                 |  14 +--
 sound/soc/intel/avs/path.c                   |  39 +++----
 sound/soc/intel/avs/pcm.c                    |  21 ++--
 sound/soc/intel/avs/probes.c                 |  11 +-
 sound/soc/intel/avs/utils.c                  |  39 +++----
 sound/soc/intel/catpt/dsp.c                  |  11 +-
 sound/soc/intel/catpt/ipc.c                  |  12 +--
 20 files changed, 231 insertions(+), 336 deletions(-)

-- 
2.43.0

