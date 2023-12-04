Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCV+ktzE"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A170D3
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726444; x=1733262444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UzQfgyi6f/Ns9JeIOkkZcFHXWNAG6ZJampyO2n/2NNI=;
  b=nCV+ktzEZfrweLQv0+4aNi5ckp6azZXkjX6vACvknYJ50M+Ksvp+fB0z
   Z6GJqzAWmXdMLtf//oQmXiX7C4k9vScVGl/Il+VBKgNVUaTs2bNHe9nai
   9MlBZSJhnkRheRIDLMhhJqTyRD52KhkJyTZqth5631pRRBUl8BySLlLlo
   pKb/pS/SpzC4HIcn2BZ13uO+Y5aedYlHNGNwRujOciJlBVzwzNBehiX1F
   wyl1tOC3iobief3spllmmu3yZtRF3ZP6KyC5qVjOEbk7eWe43iRzpvEkd
   XD504OdLhz0mJVN+OWn3Jb7S6ptLq9RBKK1y5QpWrF6/2NuLpt0CSKrRj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373249510"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="373249510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746978892"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="746978892"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: topology cleanups
Date: Mon,  4 Dec 2023 15:47:09 -0600
Message-Id: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Header alignment with firmware, addition of new token and partial
match filters.

Baofeng Tian (2):
  ASoC: SOF: align topology header file with sof topology header
  ASoC: SOF: add alignment for topology header file struct definition

Bard Liao (1):
  ASoC: SOF: topology: Use partial match for disconnecting DAI link and
    DAI widget

Curtis Malainey (1):
  ASoC: SOF: Wire up buffer flags

 include/sound/sof/topology.h    | 61 ++++++++++++++++++---------------
 include/uapi/sound/sof/tokens.h |  1 +
 sound/soc/sof/ipc3-topology.c   |  2 ++
 sound/soc/sof/topology.c        |  2 +-
 4 files changed, 38 insertions(+), 28 deletions(-)

-- 
2.39.2

