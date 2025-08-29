Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637EC257826
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756456112; cv=none; b=OVK/1GWqWggqS08aX09QCame3VLxnvJhDkJiBoR0L4fdPdKyEa3AgjX4GHd9oJcxBFg3ggVKl0C6glFCXAO0lyrCMcOC9p6X8neRAQQg3fFFByNEU0XSaQf6OQ6HQbmAwjxaprzxzcXVOjExinOCoWPTuqxsD9JLR6H87l39tKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756456112; c=relaxed/simple;
	bh=9MmUl6+OvXwaXitcg8ugoo/pCnlavYsQnq/usl1T56g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RuCxTqN2/Srk+xFZTvjauitM6USut6+heHt6yuMBHAL+OtoalrJUjhcbxn8WvbIHcupKaBsLLJjUHv0UzCJXR3DrlK43C4Yvq+xs2qMgvCD1gzTIA5eCZJl9mjoD5YtgQWMSE4TvJYBp5hLYcE8g1eE3sJTEuRuk4enz637psDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMB0hYOg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMB0hYOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756456111; x=1787992111;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9MmUl6+OvXwaXitcg8ugoo/pCnlavYsQnq/usl1T56g=;
  b=cMB0hYOgJ0sqeiYmhXhJxzWwTHb+voW8uiQp7wlrPZP2jwfWJujEVlNg
   vNDir1XbiWyEBTrhRvAhf5uy4w0m7vYRh2PTuod9UimAle/c+MAKERqkD
   M70U2mVNHVVrZU1d6l6sJ6iP8Z8KS+rNscj/VSdyIkoE8qyrJT+TNncHe
   Y173VcKiTO9sBlQXxP8VLHh5SgKV0cguoUz6BMziMAYRNzfsMlWXroOv8
   bO24ZSXmpBWmB/Yu9QeOrB5pqozFmgiMFO/Zrpo+1Gu8mZSMoJAD+zRN1
   95sBNC+KouC+c4wyql9w7TSYa25kdswNgme2exmu1ORD1qQBU1rGjo2q2
   A==;
X-CSE-ConnectionGUID: Y6vEKTgyTHagWhq2QQ/Fpg==
X-CSE-MsgGUID: Gyyq5PXYR/GK7WWBiCRlJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61373544"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61373544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:28:30 -0700
X-CSE-ConnectionGUID: rmEYU5VITymsYm7uWdfAJQ==
X-CSE-MsgGUID: gO1YJgZeS1Kf6PGiYgWAqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170494476"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:28:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 0/2] ASoC: SOF: Intel: only detect codecs when HDA DSP probe
Date: Fri, 29 Aug 2025 11:29:06 +0300
Message-ID: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

SDW codecs use the global HDaudio WAKEEN/STS to detect wakes since LNL. But 
the wakeen is handled in the SDW driver. We should filter the bus->codec_mask
to only include HDA and IDISP codecs to avoid clearing the wakeen status
before it is handled.

Regards,
Peter
---
Bard Liao (2):
  ASoC: SOF: Intel: split codec mask detect and programming UNSOL
  ASoC: SOF: Intel: only detect codecs when HDA DSP probe

 sound/soc/sof/intel/hda-codec.c | 3 ---
 sound/soc/sof/intel/hda-ctrl.c  | 8 ++++++--
 sound/soc/sof/intel/hda-dsp.c   | 2 +-
 sound/soc/sof/intel/hda.c       | 2 +-
 sound/soc/sof/intel/hda.h       | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.50.1

