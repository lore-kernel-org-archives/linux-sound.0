Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572788C1F
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793417; cv=none; b=LH3A/JFDYiT6BTUWmTijiB5ID+XhuGYKp8y8II9YDR0C0MSdGZwLhVTbbzTthG5/u9HxDvbLOohYAf1HRqRAVOnUsngoSwMKUS54psO+OZGFQZA8TJfAbWZ9LpE5FV4wpYPjtHd/oP1a4Hy8kcBhoRirSbWAo28wrfs/Y/cwSlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793417; c=relaxed/simple;
	bh=OuKmMp530kN3o+iCGvYbrNfezy20OtZoNrMfUT8y89A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0zVCcMex7cp6Du8lXNkMfnLzp2o3HZmbemMlkhRjWJvPJWuZQ8L/GHRBJw5rFnttCAK2HPxk3XRMPuibTGHeM/M1fyCE73/WZPsmW6Xir0afjGv+6eMScyBYzXhL9i/mR5x8kAz0X90+isu1hXWTOPAcbKDHjo6+0D/Jhi+peI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFlfcF4k; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFlfcF4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765793415; x=1797329415;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OuKmMp530kN3o+iCGvYbrNfezy20OtZoNrMfUT8y89A=;
  b=mFlfcF4k51YA2lzLHqjLUtbFEx70VXCd5gMaOpx5fXTwXKZyAP0RmoDE
   F9pCtQUEDnVLVp6fIS8eKNJFl9K8Hl49GYA2XWCUPU/T+/PraNNnzxAia
   pQ4UDr0Awq6yVoS/X4nmLdm3H4aphuxd6wKf6EN7m9MK00471jKYwSdcG
   wXrxM6jwWNPv3kiFMfwX7H3BzP9c+Btyec5U2QTeS3F0ceupys121ytev
   zJ19dPRUhZZUNFibn1eqH3gYc2vnhtCAZKsZObuLfxZ1I2qIbUU+q9gx0
   a6mO/1dNbB3hKpyIOcXSAuX8SXwQmMYbBTv4WLnoq8FiguCCIcx5tOKqT
   g==;
X-CSE-ConnectionGUID: 1wRxitcUQKmoFmhzHmBP8g==
X-CSE-MsgGUID: Et0FpptURMGZ6chnhI9obA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85282893"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85282893"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:10:14 -0800
X-CSE-ConnectionGUID: q1H599ZOSNSC4uxPLBuXSg==
X-CSE-MsgGUID: MWNSn0g/ROehiHT9leKXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201872291"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:10:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	tiwai@suse.de
Subject: [PATCH for 6.19 0/2] ASoC: Intel: common / SOF: Use function topologies for NVL
Date: Mon, 15 Dec 2025 12:10:34 +0200
Message-ID: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

support for NVL-S and the support using functional topology fragments for
Soundwire configurations is introduced in 6.19-rc1 in parallel.

The SOF projects plan is to not create individual topology files for NVL
as with SDCA and the functional topology support can handle most if not
all soundwire devices going forward.

However one issue have been identified with the functional topology only
support, which was masked by the presence of a single topology file:
if the device contains a dai link for which we don't have topology fragment,
then the probe will fail.
This worked with a fallback to a monolithic topology file - which made the
dai link to be ignored.

The first patch in the series adds a flag to instruct the function discovery
to make a best effort to form a card by ignoring functions without
corresponding fragment (and print this out for developers) in case there
is no fallback topology available.

The second patch removes the match entry to refer to a topology file which
will not be built by the SOF project.

Mark, I needed to wait for -rc1 tag to send this for 6.19 as the two topic
series arrived via different path and I did not wanted to case hassle to
create immutable branches to handle this.

We have been running these patches in CI for over a month and these are
needed to have the NVL-S audio support in correct shape for 6.19.
We were planning the move away from the monolithic topology files for
Soundwire for quite long and NVL/6.19 would be a great point to finally
do the transition.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files
    op
  ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match
    table

 include/sound/soc-acpi.h                      |  5 +-
 .../intel/common/soc-acpi-intel-nvl-match.c   | 49 -------------------
 .../intel/common/sof-function-topology-lib.c  |  5 +-
 .../intel/common/sof-function-topology-lib.h  |  2 +-
 sound/soc/sof/topology.c                      | 18 ++++++-
 5 files changed, 26 insertions(+), 53 deletions(-)

-- 
2.52.0

