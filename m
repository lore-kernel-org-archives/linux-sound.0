Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0227C1E25E6
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222746; cv=none; b=IQJKIwKlC243+geXkz3fwsAAGXhmFazShUCbRi11ICJ0LjNhIuOkgbbalbMTb4CO80/VfjrF/CYmSYhO2H+zn4+6gAcFKA0KDY3HVD4FneqnEZAoWF+q6chk0/qWspT67EySs0nSOXBkrAa1vFGsRbx9dKU1doWl+vwitw90aIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222746; c=relaxed/simple;
	bh=QIU0KGfyc/+xX/ldqFinfjeEEzrQ4jSpIJcyofoHUqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b1/LsLAy04LszInE0LduwM+dJod62Y7lazMNdaHx9G1KqSTRv2I2oLH/Y+Zn8+pWZf0OKih3RIwGM3+feCv8siooOuyq1J7laKOTeJ91LXDQ+x63XF3WTk+wGXNwXtTJWpNshBZHw+Ro84G6YXyHU20+akrX4IgX+IU+Cz+5p8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7Qsmfqm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7Qsmfqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733222745; x=1764758745;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QIU0KGfyc/+xX/ldqFinfjeEEzrQ4jSpIJcyofoHUqQ=;
  b=M7QsmfqmR349gGJY8x1sDarAfQBrVSEKPP5T94cIOn03cH1Deg33X9qo
   OAq5d3pI+agXD/TYQ0m5A5XTzwZikk3DEVHKz4+xodFhSibkDr6nBI856
   kEYn9lfaZA35iCUvkXzecvo4+mMBqhYd2KE8obf6fI/AGxfW77XCgop7Z
   Resy6eZcX15YqguFoUYzGnj60eQ2p+nnlnHi4CuGJMVxcEw/cUl8YYNjr
   8JGKxDCb9Oy1CwvjUHyAsEWAyD7W0hO2T37vGI1q/pfvTKGobG3OTZICz
   dnu4Pc04zh//MM673PrSy6w0ysf5gyjlal02WlJ8ghCepSnHBig8SzsS+
   Q==;
X-CSE-ConnectionGUID: 9P3f9f8GS4+ylLHC75VWZA==
X-CSE-MsgGUID: f5Z1Fp6LRuiLUP2jkbmleQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33559897"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33559897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:45:45 -0800
X-CSE-ConnectionGUID: yQX0PL02RDKHPk0ov3pABg==
X-CSE-MsgGUID: 9nDJgEtkSBmsvhVQU65yCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93799171"
Received: from ccbilbre-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.75])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:45:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Splitting cs35l56 SoundWire DAI into separate playback and capture DAIs
Date: Tue,  3 Dec 2024 18:45:32 +0800
Message-ID: <20241203104534.56719-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series prepares for dissimilar aggregation of CS42L43 + CS35L56
speaker playback. The CS35L56 SoundWire DAI is split into separate
DAIs for playback and capture so they can be routed and aggregated
differently.

The cs_amp driver is also updated to enable different TX (capture)
slots on each CS35L56 on a bus, so that the captures can be aggregated.

Richard Fitzgerald (2):
  ASoC: cs35l56: Split SoundWire DAI into separate playback and capture
  ASoC: sdw_utils: cs_amp: Assign non-overlapping TDM masks for each
    codec on a bus

 include/sound/soc_sdw_utils.h                 |  2 +
 sound/soc/codecs/cs35l56.c                    |  8 +-
 .../intel/common/soc-acpi-intel-mtl-match.c   | 76 +++++++++++++++++--
 sound/soc/sdw_utils/soc_sdw_cs_amp.c          | 46 +++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 13 +++-
 5 files changed, 133 insertions(+), 12 deletions(-)

-- 
2.43.0

