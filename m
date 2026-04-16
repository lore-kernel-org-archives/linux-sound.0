Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB93274B39
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317794; cv=none; b=pFnH5b9pcgklbHJ5HAAJSoFFRxFKopG2hgsioyK/qkpoeOMUTrsZ5NnNfTcAILOfK52ebOqO8vN9YlnRFlre/YaVNyNQJcQhipL8fc72Nn8SNP1Wj8UOmIb9Q+d+mM39n/24vNDqaQDdTKBdNMHzy8RQlddWodbG5fOiB5Xck9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317794; c=relaxed/simple;
	bh=eNMcIu/0pbLB1lS0eIRHcLOYHx6BS1dYTr4sKlhid7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T13wlyhf3Z1yuTG9rWvdN0FNFEoGDl8rkwI3bw4cpZk/p9TM7MzGf8eHMdV7UobRBC5rfr5OZnOa2Qrb8fZ0dfxrW748NI3DB6j40Y+M6H8mhJCUoW6jKmBZwlvtEkmwKeeYcxkoZtioGVVKD5qoL9N9S6lpQFAqAKNXYV3xwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbmxMPma; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbmxMPma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776317793; x=1807853793;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eNMcIu/0pbLB1lS0eIRHcLOYHx6BS1dYTr4sKlhid7Y=;
  b=gbmxMPmaq7bnmQ4e7HtGHielbCjwAek5a5rifUebXhCuBiknXfIKA3wt
   juJONmSmSwZao4IRT3nulgl3fQbN9aX8/NbWNK63cfClgXXYKN+A4/r+5
   ETaXwQReY+MtBe4ERIlFxrea94tfMurKdhkO7Y8fp2sYUYBNqCu3G9Mu4
   3NQV0yvCDAypfNPSBQCZN6h772NdNSZPMuy6eNsG1BAQx88EaKRGrBcTw
   qJYjQqt+0eSZEh9MFBbofYzY8zzX70DZblEl4z96HPp8kao2pq9Nym3K8
   ny9hYW6HCY4qdgqQVRcV6gxnjUiUetVvVq4nuDjXl4o9rv2kaTS43hHT8
   g==;
X-CSE-ConnectionGUID: XzquC7KrQx2oYjTAKwiW4g==
X-CSE-MsgGUID: AYwJp6NjQg6rxQTaOaY0NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94712470"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94712470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 22:36:32 -0700
X-CSE-ConnectionGUID: 2iC4Ox7YTGCiWenpMrNaoQ==
X-CSE-MsgGUID: 5VgQpWTTRS6EbM9qLcgXlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230477948"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 22:36:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 0/2] ASoC: SOF: topology: allow user to add topologies
Date: Thu, 16 Apr 2026 13:35:50 +0800
Message-ID: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a module parameter array to allow users to load specific
feature topologies.

v2: add a out of memory check.

Bard Liao (2):
  ASoC: sof-function-topology-lib: add virtual loop dai support
  ASoC: SOF: topology: allow user to add topologies

 .../intel/common/sof-function-topology-lib.c  | 11 +++-
 sound/soc/sof/topology.c                      | 55 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.43.0

