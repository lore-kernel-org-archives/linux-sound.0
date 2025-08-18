Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41302701C3
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755512434; cv=none; b=pb6yZa/uqZhYVDE7+JUPP/mWQGW8RABOEabhVxPgrIMMGCxKHtnz810XYV5y51TfUxnJepHm9XuJZrfCjj8SvLYoeJKkEpvKvr4gboTvX8XEKFHu69qXfJeT36o1JhwHEkS0c1+y50V5OLozWyYk0QwbCpl1/DI/aymZqrW6efU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755512434; c=relaxed/simple;
	bh=yKRz2Pkik5x//6HWGhDyeHKA9ehQnHH1o3DtuqB9gpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Xszz/p0lv9pd20mZk3FzcqiF21BqXu3JZGbs3F8PXRvwjpEvhP6Kf6hqKtbqfisPiPnRPP1/XckJB1/PXuj+3r47/SbPKERGgsEQf74UQfDhoZ/wNe7DR2GWkTRr5NVuvN7vRQLMbdWtleSeR1uijPNXk6iIsb4etWPetQy6x74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+ppY5S6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+ppY5S6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755512433; x=1787048433;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yKRz2Pkik5x//6HWGhDyeHKA9ehQnHH1o3DtuqB9gpU=;
  b=J+ppY5S6edIcf6aS70J//5W9/Tm2QNQSWpxOjKnuMMefQhEAiQg4Kw0G
   GQCdNdYyda/zexstckvWx2oYb5nqqnne6By47Gc9kXQeeiDBbJbZiOlPN
   40prpXtvuHqJjWOc8AMGeRzF2eNZugNmUF7rw4mN6MiiTS2+HzcWBG0/4
   FWLARc2iqy7AOurI2dCXRmf7BB+6j/41WIFyrI0RQtPefr87d35alaN83
   /Vsl92yGOS+5BA0/ltwUyYtke3cJtwg8GRoxMVgjfq3E2dSUnm40ZN43C
   t/lDLE/lRNOlSdTG/vthKghXfDNmpNJRwu2N/Vl3/K0A99M8KiPAuJVbd
   Q==;
X-CSE-ConnectionGUID: PyyefJfBSBC1uTHNRreYjQ==
X-CSE-MsgGUID: mDZnDeUPS8ynfsPGTvRObQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68825889"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68825889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 03:20:33 -0700
X-CSE-ConnectionGUID: 0wD5S7gDRXiX26E5gvrV8A==
X-CSE-MsgGUID: ftA0KfbrSQ+3hhubAFgr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166717183"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 03:20:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/4] ASoC: Intel: avs: Code cleanups and separation
Date: Mon, 18 Aug 2025 12:41:22 +0200
Message-Id: <20250818104126.526442-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set of patches that brings no new functionality but makes it easier to
maintain and read the avs-driver code. There is one 'fix' among them -
the third patch, described below.

First, debug-related code - mainly the data-probing feature - is mixed
with non-debug PCM code. Separate it into debug.h and update the pcm.c
file.

Next, as the probing-board is not tied to any topology file, it shall
not using struct avs_soc_component descriptor but the basic struct
snd_soc_component one. While on the first sight this is just bump in
LOCs, runtime is simplified as no topology checks and related code will
be engaged.

With probing-board addressed and debug code relocated:
- address the component-teardown issues when the
componet->name points to a string which is shared by multiple components
and/or machine boards. devm_kstrdup() makes this go away.

- streamline the naming scheme for the functions engaged in the
components registration. This is purely a readability improvement.


Cezary Rojewski (4):
  ASoC: Intel: avs: Separate debug symbols
  ASoC: Intel: avs: Drop pcm.h dependency for probes
  ASoC: Intel: avs: Do not share the name pointer between components
  ASoC: Intel: avs: Streamline register-component function names

 sound/soc/intel/avs/apl.c             |  1 +
 sound/soc/intel/avs/avs.h             | 89 +++-----------------------
 sound/soc/intel/avs/board_selection.c | 10 +--
 sound/soc/intel/avs/cnl.c             |  1 +
 sound/soc/intel/avs/core.c            |  1 +
 sound/soc/intel/avs/debug.h           | 91 +++++++++++++++++++++++++++
 sound/soc/intel/avs/debugfs.c         |  1 +
 sound/soc/intel/avs/icl.c             |  1 +
 sound/soc/intel/avs/ipc.c             |  1 +
 sound/soc/intel/avs/lnl.c             |  1 +
 sound/soc/intel/avs/mtl.c             |  1 +
 sound/soc/intel/avs/pcm.c             | 35 ++++++-----
 sound/soc/intel/avs/probes.c          | 23 +++++--
 sound/soc/intel/avs/ptl.c             |  1 +
 sound/soc/intel/avs/skl.c             |  1 +
 sound/soc/intel/avs/tgl.c             |  1 +
 16 files changed, 153 insertions(+), 106 deletions(-)
 create mode 100644 sound/soc/intel/avs/debug.h

-- 
2.25.1

