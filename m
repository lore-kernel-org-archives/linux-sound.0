Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0687FF4E7
	for <linux-sound@vger.kernel.org>; Mon, 15 Jan 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktbJRak/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705310476; x=1736846476;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vANmixJchsc3Zgx/4AiYk4TV0HCsdOXNCOxqo9P6VB8=;
  b=ktbJRak/UjWwz/t3o/P/9Ik+yfUuqdWo0o1h1Ai97LcpFpVHe7SQI/1H
   B/6nUFjI8QEdBVLngfIjBPg8pyj2E8bzPbup96dYsaHN9HR2cdGvzm1Gl
   0+yPkQoDzq5/MdnTiSW27VQSzYBz2mVz4n6X+6OBe/P8/Q6YfKHhQWNLu
   AVkmOj44kKyvSh/AbXbpxgxnJ4pJePhyb/MFbSddLxg+khCJK/gMDEcQT
   gntDMfBkmSD5aKgCSzVzOh9w4pZW30aAKdeHcQg0Xj3jyR8fvm3UeqWFh
   gRRnPAGn9+C9jzXu3LS1RoPQGB1d1KMKSJurfgUAI2hx3sIfDWSemeMz7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403332382"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="403332382"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="733250975"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="733250975"
Received: from jofuegbe-mobl.amr.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.54.217])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:21:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc4: Kernel log noise reduction for 6.8
Date: Mon, 15 Jan 2024 11:22:07 +0200
Message-ID: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

two patches to remove too intrusive prints:
no llp found, fall back to default HDA path
No CPC match in the firmware file's manifest (ibs/obs: 384/384)

The llp print is printed for all HDA endpoints which is not supported by llp.

The CPC info print turned out to be too noisy and it is not bringing any benefit
to users and developers.

Regards,
Peter
---
Kai Vehmanen (1):
  ASoC: SOF: ipc4-loader: remove the CPC check warnings

Rander Wang (1):
  ASoC: SOF: ipc4-pcm: remove log message for LLP

 sound/soc/sof/ipc4-loader.c | 11 ++++-------
 sound/soc/sof/ipc4-pcm.c    |  4 +---
 2 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.43.0

