Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0043786F
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013874; cv=none; b=uq+LP7yCdi+XQzm4PNS4CzZlcyZHU7v284qmPxSJozpz/4+bY7CP99X35D8K0mJX5+uv3mRSrGhE5TVJR+5b/B2ld6UagkoWzM2R1stoGy0JYl18bKSGIMJGfSquAF2s8wla3Q4vO+s6X3oZnQLQxG4lyIj7haMosqv4G8pkGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013874; c=relaxed/simple;
	bh=PNnfJYWyqN+hJSwWZ1imOgDdFKw2plvqVcbc1NskFVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRANQksh6UKBTuYLHXNSgc5O3wJkqCB3IlZ1HlaJOaLWhSr5YeB4n+cQCiGcB3zanW5QKd2stdTLA8hh+LYwPRlR5DqsgSanF0++EK3oFGdRFj2Lf2EUucgzc9SuKZ0OByFUT8V7oB+zSP54IiRxwuhsN7xXKuD42ZNQUQujV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxY74GiE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxY74GiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786013872; x=1817549872;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PNnfJYWyqN+hJSwWZ1imOgDdFKw2plvqVcbc1NskFVs=;
  b=OxY74GiEzK5aot+dbNbShpqkMkoT0BEx1MAp1br+jtYxyu+sCyWBpFPL
   1Y022OhP3gKzAAuP8p7Tjv7jPaGjKJJcTOBFpSJDEWd+ILyl/jbutxOiB
   LHy94jGcJIZlAOR1a1iR17Aq2RhDAJec60F8XlC/zBkbzEgyhRpqk2jPn
   05u/n0AvfF7OSVi1PDcMM2i0YC/20uq53j7pn/fXelvX89D+WsoRpdc9E
   0vHJBq5Lwx1w0j8Z1b/2dm3oaukcU6zLwnWAsX3a+y55RuSE/vKbKWl+o
   fGphtjRR0lNMWCASWbsnXRY6iSJGo7lV0gjBy5bw/3DhkVTT+h3lJKDjy
   Q==;
X-CSE-ConnectionGUID: DomWuAB4Q1ePUvfN8CSwtg==
X-CSE-MsgGUID: /Cty23rqSpm8RZKjjimpfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="98114677"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="98114677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:57:52 -0700
X-CSE-ConnectionGUID: 0UI7gzCtT9aMnYK6pKybLQ==
X-CSE-MsgGUID: mrNpZzIlSN2KalA6jQmqwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285452198"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:57:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: Add HDMI-In capture match table for NVL
Date: Thu,  6 Aug 2026 18:57:40 +0800
Message-ID: <20260806105742.2676322-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add I2S HDMI-In capture with rt5682 I2S codec on NVL platform.

Balamurugan C (2):
  ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in NVL
    match table
  ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
    NVL.

 sound/soc/intel/boards/sof_es8336.c           | 10 ++++++++++
 sound/soc/intel/boards/sof_rt5682.c           |  7 +++++++
 .../intel/common/soc-acpi-intel-nvl-match.c   | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+)

-- 
2.43.0

