Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B55D737
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405113; cv=none; b=QONmTXGK1y7+ZVOaBKpS+cqW+L2xi2GFxIawFzaO8QrVxN4voa0M6tU0+3qTLzz/ykSINx0W8a16qrVRh/De8Xujr11U52QVixTUE2qhLy8eUFf8wwFlK0ms8Utaea96R2upGkQWOvnH01DsnrlSbHVGbYdfS1ADWks9xx1Zijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405113; c=relaxed/simple;
	bh=g/QRW5fvRPz+ffmR59vuY3h4Vh0EA15LjWXIGhzPgSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fAn0d3DvfDbpPXeQD4abB8V13yvEZWnJhHr/rECB9u3aPjBMwf7YBY2NXZE9tZ7GFFJOpVYD38ZDWUnokLDtKTO+SWc3luD1ei+d5ReKauhMQDyzJcoamFxbD1OSgs+EpRBC4KytucoxpOJYspABYJtrm15h+2yV0Wq9jR352jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf+divy4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf+divy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405112; x=1742941112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g/QRW5fvRPz+ffmR59vuY3h4Vh0EA15LjWXIGhzPgSo=;
  b=cf+divy4BHPOC+GE/kmJqpzI3yHW5Iby7aHfVVUOQSSlzGMJ4cJ4igX8
   M/Tv4lKlvBfIaz4658x5xiXpHSsQ2TkOIip0fOZ/CK1ds+bpBdUwyEopZ
   VFcJgcne34jtY1JkP8SG/rrj9jJw59FsaaLa8FIEYz6MaY0SQyf6PtXuI
   jQ1FZE7E/SVr/x98s3Kcuyq9KOjx7YpWmsJVCXL0w2i2Hxu8WBskLCCMi
   fqoVLE5d2O5lHBc2YljsyzLwKN3dUqHmH2c0pE/88qWGT040vilf3Tlv5
   1ozbCGKpwPrPHtWaYNF4bZKJgBzEBmx/j4sWxJN/NsNb7AZ2zPTnbuyok
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300362"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6300362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="20309641"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/6] ASoC: rt-sdw: fix locking and improve error logs
Date: Mon, 25 Mar 2024 17:18:11 -0500
Message-Id: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a set of problematic locking sequences and update error messages,
tested on SOF/SoundWire platforms.

Pierre-Louis Bossart (6):
  ASoC: rt5682-sdw: fix locking sequence
  ASoC: rt711-sdca: fix locking sequence
  ASoC: rt711-sdw: fix locking sequence
  ASoC: rt712-sdca-sdw: fix locking sequence
  ASoC: rt722-sdca-sdw: fix locking sequence
  ASoC: rt-sdw*: add __func__ to all error logs

 sound/soc/codecs/rt1316-sdw.c      |  8 +++---
 sound/soc/codecs/rt1318-sdw.c      |  8 +++---
 sound/soc/codecs/rt5682-sdw.c      | 16 +++++------
 sound/soc/codecs/rt700.c           | 16 +++++------
 sound/soc/codecs/rt711-sdca-sdw.c  |  6 ++--
 sound/soc/codecs/rt711-sdca.c      | 18 ++++++------
 sound/soc/codecs/rt711-sdw.c       |  8 +++---
 sound/soc/codecs/rt711.c           | 16 +++++------
 sound/soc/codecs/rt712-sdca-dmic.c | 24 +++++++++-------
 sound/soc/codecs/rt712-sdca-sdw.c  |  7 +++--
 sound/soc/codecs/rt712-sdca.c      | 20 ++++++-------
 sound/soc/codecs/rt715-sdca-sdw.c  |  2 +-
 sound/soc/codecs/rt715-sdca.c      | 46 +++++++++++++++---------------
 sound/soc/codecs/rt715-sdw.c       |  4 +--
 sound/soc/codecs/rt715.c           | 24 ++++++++--------
 sound/soc/codecs/rt722-sdca-sdw.c  |  4 +--
 sound/soc/codecs/rt722-sdca.c      | 21 +++++++-------
 17 files changed, 126 insertions(+), 122 deletions(-)

-- 
2.40.1

