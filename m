Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE113BACB
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231336; cv=none; b=nhEtLKnxbMeVJiU5/hkxlVekAOtH7uCuWj2kP1pfCXRmKsXbmMBH4zGKgptAlb6gbuPPtCqc0KXRhSHLvpoyuRHLTYKvoRQ6hpHEamUTGSr6odveEE+qgIk8sqeAPdDeICxx86+4qvP29r5DcybhHAM712MA/Xw/BsK/af1/f8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231336; c=relaxed/simple;
	bh=ypVj1kOcQKPVzg874tmGaY6DH8PkKUvfSI8EZn/UH4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2mEyd+Beo5q/VXfjs/IOdo6iIgBgoGLFa0k2d2t9EsmaVGkVHOJw5DD/AkvGuAj2FXBE0KhkbNRUmqQ0M0Sn/fyNtBcHBzCOU14ps7wP2sj2tkLEeba//TcnboZ/VXVUi7opy/F128IccH9lRAQvBFb4u7uBX27n2pS/yDujzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpdX9lrZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpdX9lrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231334; x=1750767334;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ypVj1kOcQKPVzg874tmGaY6DH8PkKUvfSI8EZn/UH4o=;
  b=gpdX9lrZhaM/RVj0cRf8YGRRjcMKvo93eB7owAvu8p/7r4YT187kKLXA
   eoyw/AGRhwjv0mdgRo9HFY+ipfn5WhhmKN3yNSjsSxaYDRIcH0pFi+t6w
   +ApILu5OjD5T2XNDMs1AofI4n0xbGqOew1gsKd3j3ZHmAIEGoYse0pEbR
   dlX9bbvlqk3pNjWksjUzZEsz02lxbAM4T3LkmaH5/1GtMj9tv9LqntSFK
   X+bSWDid4s+CZBRL423tbjRFbT7r7BynY3IF2WzU92hme1BghqGTXrMcP
   26C0DKIjE3y3xkAq9/GIFopG2W25JnIKXbG/oRmaEPJutDaH3K8pSfpuR
   Q==;
X-CSE-ConnectionGUID: wMRWRER0Q56U+h8mcRlNiQ==
X-CSE-MsgGUID: 4+p5qwxVR5SqV+UYhHVSYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888036"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15888036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:15:34 -0700
X-CSE-ConnectionGUID: KqkAnxPBTZWJmgYwT/F3KQ==
X-CSE-MsgGUID: sh7uVb38QcCv75+fB0Ayvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43358806"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:15:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ASoC: SOF: topology/intel improvements
Date: Mon, 24 Jun 2024 14:15:16 +0200
Message-ID: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two updates for corner cases seen with new topologies, and one
correction for the number of periods reported by Chrome stress tests.

Peter Ujfalusi (3):
  ASoC: SOF: ipc4-topology: Use single token list for the copiers
  ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input
    pin format
  ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by
    MAX_BDL_ENTRIES

 sound/soc/sof/intel/hda-pcm.c |  6 ++++
 sound/soc/sof/ipc4-topology.c | 57 ++++++++++++++++-------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

-- 
2.43.0

