Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E526A3DCDBE
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793061; cv=none; b=AfzOiVBB0sLPrF4nqFg2NUPcTK3iGzPMIdEfqjhMgAPzsb22kP3aZmaVx+0tNSDFUszQJwxzuNGr7HtvotgCyKW4eXInHYRp/Rl1fF5fOWL5GLX0XF3oXfxuqCXP4gapsl+DgB5iCXyiwwltYTKxUZNrB4wMpIZH8UMiXZty6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793061; c=relaxed/simple;
	bh=PLQxhN7zQYSkJV7rW8ll6OqT7tam+4R2gB/C+Z0bwPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUlnWykmO4QOtgs1rDWXOy5vBo4TGG7Y5F3gr1fmJFp8qpIQl09nfr9EbogitHMSBU+Z/piZoBWcn3AJ6L48QEOEVRbVV/AuSuae92Smex10tZV4V8cbm7Qn/e/e0w54OjDWC0hJ9esDK1OZm5zAjrBw7GUb+unSL336kEaA7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+iPV4R/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+iPV4R/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779793060; x=1811329060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PLQxhN7zQYSkJV7rW8ll6OqT7tam+4R2gB/C+Z0bwPQ=;
  b=Z+iPV4R/w5zSdtWrMLjEF9Wk0Fq9B1RQwJv0GRWO2Y+ldpBK8jPdYomJ
   2PNbO3bzFheGj43E99DNJBabh+079z93CwhgtwNXA4h5Y1CFDQTJ3WrMR
   JxBR/2/1lnEElpqTfgjNaPh9Nt3oQaqfxMtXV4pJer74TshV1OMJNGaOJ
   yOobD3Jyc6W0tkZ8NjuxIIgo9AQfiga4Enq0kXVMPmsdsiokN0QbzGdwI
   f7JhonvSbOTUtPkJbCNT+u2Uo+ZOstzT9u1zdGALZcXcY61Z4pu6fBMgb
   fTUhV0zEm1/DJit6SPXITrVCoeIXerq5yehjEWfWfav4xMwg/ZQN0am4H
   g==;
X-CSE-ConnectionGUID: 05kw8zn5TMKU8c9aymuZbQ==
X-CSE-MsgGUID: curog9e/QUCpI5vV8Jd/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91709694"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="91709694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:57:40 -0700
X-CSE-ConnectionGUID: 1dCJhfQkRE2qxpy7Pe5lFQ==
X-CSE-MsgGUID: 0iP/Mo15R0unOIAc5wzcUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="238869046"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.49])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:57:37 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH v2 0/2] ASoC: SOF: ipc4-topology: Support for multiple src output formats
Date: Tue, 26 May 2026 13:57:46 +0300
Message-ID: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes since v1:
- new patch to validate the number of input/output formats to make sure
  that they are are least one

SRC can only change the rate, we can still allow different bit depth and
channels to be handled, the only restriction is that the input and output
must have matching bit depth and channel format.

In a separate patch do a sanity check for the number of formats on the
input and output side as SRC/ASRC must have at least one of them.

Regards,
Peter
--
Peter Ujfalusi (2):
  ASoC: SOF: ipc4-topology: Validate the number of in/out formats for
    src/asrc
  ASoC: SOF: ipc4-topology: Allow the use of multiple formats for src
    output

 sound/soc/sof/ipc4-topology.c | 64 ++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 16 deletions(-)

-- 
2.54.0

