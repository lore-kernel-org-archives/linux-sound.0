Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFE3E1CFB;
	Wed, 20 May 2026 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285597; cv=none; b=fSEYWbmhpVRF1JgUBFHdO9BVWqeX+EzLlCVUaPcYBSeAUz7pruwHLA0K2iDHWhWVnPIGvmNPC5S3g/n0T1nwFjIrp95qbUMUwKBfTA7EsQQWPkNuPYQ6Dp4FoNshdCwuonq8lRBN0Tn3AxIKtJyAPXt2AMdEldzyfKTcO9St0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285597; c=relaxed/simple;
	bh=W7dRPreqSSjjSogL0LL+S4yDyyzdk28WwjHCEVZ56AU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzQeV+wWe720+04WKbjRlK/UmpQHA1BMqWbkQdLaJ8zXj2eM64fifx/xObcDwhy+V2et/8j6VQI0Dbp9+y0/C3ieniOmnLU22CiJhsi27+XznEODjI69GHVKNTGPfimYoSiTeFZ4ylZ0WYViYP9bhF54Zb55yGQ/g8LtJA6Rgn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWZGF1jX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWZGF1jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779285595; x=1810821595;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W7dRPreqSSjjSogL0LL+S4yDyyzdk28WwjHCEVZ56AU=;
  b=KWZGF1jXTzHR422Gbv/b5NoMZZLyQfZUqQXcXdKNWfelsh8P8F5N8fll
   w0wvTEgaZcD4IpEQgzQmcIcpF9wdKo5KFmcsohEynnbn7q2MWv+IFXODQ
   fEGNy1wr2bQPTHEWz28rf2EWpYF/IWWpdWWYwCODztFpeW6+VNXOXISFk
   15VAePclNiYHWXOhMoXIT89ICJqceDUFgz1A3rAgD8ugK+7x74vkSK8DF
   G6DPYbRxdRFB6xiE9cQQ9iALgGcL+lbN0O7npv54jCPEPZP7rLMWgtqen
   vwc8QbpuA88YBxqoYNCcIDDncH73S3GkV0IvPMwMm1Tl7G4V+LgEjIQtp
   Q==;
X-CSE-ConnectionGUID: 7fAg5a4QS0yljT7PiFV2IA==
X-CSE-MsgGUID: cmwGGtsXTCivCT9R4E6b2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80149509"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80149509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:59:53 -0700
X-CSE-ConnectionGUID: /St/5RycTo68Ke6rCrfK0g==
X-CSE-MsgGUID: iUyFutxJQsmc3vfqQFwONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="263702311"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:59:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	linux-kernel@vger.kernel.org,
	guennadi.liakhovetski@linux.intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH] MAINTAINERS: ASoC: Intel/SOF: Remove Ranjani Sridharan as maintainer
Date: Wed, 20 May 2026 17:00:01 +0300
Message-ID: <20260520140001.1375-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ranjani no longer works on Intel/SOF audio drivers and her email address
now bounce due to her departure from Intel.

Unfortunately, she was not able to send the removal mail by herself.

Thanks for the years of work and dedication, Ranjani!

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Jyri Sarha <jyri.sarha@linux.intel.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42cc9d530714..32cd9660f1b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12788,7 +12788,6 @@ M:	Cezary Rojewski <cezary.rojewski@intel.com>
 M:	Liam Girdwood <liam.r.girdwood@linux.intel.com>
 M:	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
 M:	Bard Liao <yung-chuan.liao@linux.intel.com>
-M:	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 M:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
 R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
 L:	linux-sound@vger.kernel.org
@@ -25071,7 +25070,6 @@ SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS
 M:	Liam Girdwood <lgirdwood@gmail.com>
 M:	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
 M:	Bard Liao <yung-chuan.liao@linux.intel.com>
-M:	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 M:	Daniel Baluta <daniel.baluta@nxp.com>
 R:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
 R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
-- 
2.54.0

