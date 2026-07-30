Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5696841B37D
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413817; cv=none; b=idqn3xcnKPpU8gX3Par5P15HvpRTRCcfTZ2OA8f13x+1yFMSiL8ZrHDT5d+UKry3CX112cwvmoWTndumrv6gZXRDsicXgKfKU4zLh8JRZplVAhUnD0+XnMXRuwwFzdqo504lD5rsiom++McQDNullijlxMN0EKln5arRPIkQSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413817; c=relaxed/simple;
	bh=5YlI5slP5sglFH9u4N/cj8eFG4WndsEnIOB5iNcKMNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2i5TtwHGMa+N+0h3ipNI+YdXLCgo8WK3i5hQx36io6R4zTy2CVSLRLCPb14daJ4IQqxQQEl3Qno9w3T6IXslqByaN+reXjXwxMHs1uD64vAGsl/5KCkcZPQiEq/TeFeuT730TfXsP4tAUy4fm8antT0pCItTlXwOvpEI1pq7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dyqjp6nK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dyqjp6nK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785413815; x=1816949815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5YlI5slP5sglFH9u4N/cj8eFG4WndsEnIOB5iNcKMNM=;
  b=Dyqjp6nKR5VxgfmqrJAWC/ofIFS5I0ln1ej8l3Wx0Gl+mbbHNEvLyjbZ
   jpxkAb1I7zSjG2V+QRptHIw/v0XLJmDchLbJEjemJD623EEx+8sJwxchc
   0P8rMtcNu7QR+MDxGcmOgoDgojx2WlNiX0xYrq/pcAGzT7JCXlu1XrurC
   aWFQm1QIxalSqjs0gO1vouTaG406VUawsFRi3EjMdAH+xMSr6lXQegrnA
   zniDx9nuRCY/5kJ+tINcBjWcvbvL6FFnuZkuVZFmfjQB7mB0rsiB3N/60
   aLAPzFMqB7kSrezGZKZDUENuOZL8eGUpmHL1i1AkLhImJZnKybl0P1WM4
   A==;
X-CSE-ConnectionGUID: ooXP2FJpQkGJDa0W7L4t0A==
X-CSE-MsgGUID: EkGCcRvkSPqHFMejHNVWyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97187657"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97187657"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:16:54 -0700
X-CSE-ConnectionGUID: 210eacU3QqaJKR93R67XQQ==
X-CSE-MsgGUID: JOtDFerxQDWBQFYP/fXmwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="259711245"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:16:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/3] ASoC: SOF: ipc4-topology: Pipeline params improvements
Date: Thu, 30 Jul 2026 15:17:26 +0300
Message-ID: <20260730121729.18673-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Improve handling of some corner cases that are not used by current topology
designs, but can be crafted within the rules of a topology file.

For example branching topologies, where a single input routed to multiple
output endpoints. The already configured part of the graph places constraint
on how the new branch can be configured.

Handling of process modules also updated to be able to 'guess' what
parameters can be changed by the module and allow flexible operation.

Regards,
Peter
--
Peter Ujfalusi (3):
  ASoC: SOF: ipc4-topology: Store the params change between input/output
    of a module
  ASoC: SOF: ipc4-topology: Correct the process module's output lookup
  ASoC: SOF: ipc4-topology: Update the pipeline_params of prepared
    modules

 sound/soc/sof/ipc4-topology.c | 201 ++++++++++++++++++++++++++++++----
 sound/soc/sof/ipc4-topology.h |   3 +
 sound/soc/sof/sof-audio.c     |   5 +-
 3 files changed, 183 insertions(+), 26 deletions(-)

-- 
2.55.0

