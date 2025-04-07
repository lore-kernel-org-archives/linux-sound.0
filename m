Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE724EA8F
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029645; cv=none; b=A/czWVkmeDN0JDyLMyB7M6sl3q/kkgGkV5qvmgp2iIRsVG3XybZEudjm+7Tpr+0RdxDaNPC3zkT5z/vBnDBFltSnbKDvnflEbBh2Dx3+MD1eFoETO0omsZBO3NC/sRLP7a40/aRfKRIp4iJMH8Xzb2hP9HjMTYaDBQWbJE1JA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029645; c=relaxed/simple;
	bh=ijnvRzCCqrcxk/NeSqHI86mZkMUkwPfDxk/NDaRU9Zs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UDXibf+oQUeJskkerASbhNgXNRUNtt6dS/8siKtwt6Wxba27C8DCFkDrsnxasyKQ3oYo71L7POGHTsZ12PBb/He89tCgLZftd9k5JEmXBrh00Uow7o/BZ9yAta7Z+uwcSKMcmFymIfT+1wYHOOYFfqzWVpSRh+uDPB6TswTthUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlS4FWbQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlS4FWbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029644; x=1775565644;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ijnvRzCCqrcxk/NeSqHI86mZkMUkwPfDxk/NDaRU9Zs=;
  b=IlS4FWbQOvz+mmKqH95lmqpRhgS2x5c0/LqiZRTrN7V66NyzYP+78mc5
   orB3w0fkUoajZJTpl1zrZJRjDcZhQ6Cc3CyDsguqgHFzEWUxtV9MYE5T/
   p1Fn2bwVo6/c54p4QU+sQaY/1tX3//X/WPAnODqFhRM6kic6YegQIdtMy
   rTdLT6GwAtjdtlyfvf1PDuIFLjEpEUYGksylNSyrvI5cQ+Dt8oACArlNA
   16HM+4nUqat/iUydF9Lbtu1DePBufqX/4zmvfjtk7COShvN+FWgF+3/Ji
   dYnCQ6aJur3pV1+920IAZJyuQXcruw1vd0UgM18P9JFmeZ+8Jkki0he0i
   Q==;
X-CSE-ConnectionGUID: /rf4URpWQDGHgBt6U+fbFw==
X-CSE-MsgGUID: 3JaCH38qQDKde7i41SIpYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778958"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:42 -0700
X-CSE-ConnectionGUID: KDpteurOS9S2ztIO/i+N0w==
X-CSE-MsgGUID: Yok05iSRRWuESIRn+zSUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134001"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:39 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 00/20] ASoC: Intel: avs: Update machine board card names
Date: Mon,  7 Apr 2025 14:41:34 +0200
Message-Id: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed in user bug report [1] & [2], it was identified that HDA
card provides wrong FE device numbers to be used with UCM, at the same
time it was requested that we change card names to better names.

This patchset does that, by adding option for going back to old
behaviour in first patch. Using existing way of enumerating FEs from
topology in second patch. Then setting new names in all cards while
providing fallback to old name. Only exception is probe card, which is
used for debug purposes only, where we just directly rename card.

Do note that patch 2, will require updated topologies if topology
exposes more than 1 FE on card. Old topologies didn't assign id field
and it defaulted to 0, however when we use this field by setting
snd_soc_component_driver::use_dai_pcm_id field, we need topologies with
distinct values in FEs. Necessary changes are provided in avsdk and
avs-topology-xml repositories ([4] & [5]). linux-firmware update will
follow as soon as this changeset is merged.


[1]
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219654
[2]
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/499
[3]
Link: https://lore.kernel.org/linux-sound/20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com/
[4]
https://github.com/thesofproject/avsdk/commit/a879c8ae4ba7be53b8ed528da1361a8c62475b6e
[5]
https://github.com/thesofproject/avs-topology-xml/commit/9b94d52cbc5c1e07c8d9503c86329cd62ea4c9e7
https://github.com/thesofproject/avs-topology-xml/commit/bdbc8d6ba9ea6db67daed9cbbaed3c23ff112ecb

Amadeusz Sławiński (20):
  ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names
  ASoC: Intel: avs: Use topology information for endpoint numbers
  ASoC: Intel: avs: boards: Change da7219 card name
  ASoC: Intel: avs: boards: Change DMIC card name
  ASoC: Intel: avs: boards: Change es8336 card name
  ASoC: Intel: avs: boards: Change hdaudio card name
  ASoC: Intel: avs: boards: Change sspX-loopback card name
  ASoC: Intel: avs: boards: Change max98357a card name
  ASoC: Intel: avs: boards: Change max98373 card name
  ASoC: Intel: avs: boards: Change max98927 card name
  ASoC: Intel: avs: boards: Change nau8825 card name
  ASoC: Intel: avs: boards: Change pcm3168a card name
  ASoC: Intel: avs: boards: Change probe card name
  ASoC: Intel: avs: boards: Change rt274 card name
  ASoC: Intel: avs: boards: Change rt286 card name
  ASoC: Intel: avs: boards: Change rt298 card name
  ASoC: Intel: avs: boards: Change rt5514 card name
  ASoC: Intel: avs: boards: Change rt5663 card name
  ASoC: Intel: avs: boards: Change rt5682 card name
  ASoC: Intel: avs: boards: Change ssm4567 card name

 sound/soc/intel/avs/avs.h              |  2 +-
 sound/soc/intel/avs/board_selection.c  | 37 +++++++++++++++++++++++---
 sound/soc/intel/avs/boards/Kconfig     |  8 ++++++
 sound/soc/intel/avs/boards/da7219.c    |  9 ++++++-
 sound/soc/intel/avs/boards/dmic.c      | 10 ++++++-
 sound/soc/intel/avs/boards/es8336.c    |  9 ++++++-
 sound/soc/intel/avs/boards/hdaudio.c   | 23 +++++++++++++---
 sound/soc/intel/avs/boards/i2s_test.c  | 13 +++++++--
 sound/soc/intel/avs/boards/max98357a.c |  9 ++++++-
 sound/soc/intel/avs/boards/max98373.c  |  9 ++++++-
 sound/soc/intel/avs/boards/max98927.c  |  9 ++++++-
 sound/soc/intel/avs/boards/nau8825.c   |  9 ++++++-
 sound/soc/intel/avs/boards/pcm3168a.c  | 14 +++++++++-
 sound/soc/intel/avs/boards/probe.c     |  3 ++-
 sound/soc/intel/avs/boards/rt274.c     |  9 ++++++-
 sound/soc/intel/avs/boards/rt286.c     |  9 ++++++-
 sound/soc/intel/avs/boards/rt298.c     |  9 ++++++-
 sound/soc/intel/avs/boards/rt5514.c    |  9 ++++++-
 sound/soc/intel/avs/boards/rt5663.c    |  9 ++++++-
 sound/soc/intel/avs/boards/rt5682.c    |  9 ++++++-
 sound/soc/intel/avs/boards/ssm4567.c   |  9 ++++++-
 sound/soc/intel/avs/pcm.c              | 13 ++++++---
 sound/soc/intel/avs/probes.c           |  2 +-
 sound/soc/intel/avs/utils.h            | 16 +++++++++--
 24 files changed, 224 insertions(+), 34 deletions(-)


base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
-- 
2.34.1

