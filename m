Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC72F7EFC
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903745; cv=none; b=GzMRRK1xUqNOn38uPFPO2Xy0KSEKWBES55/uoC6DV4TWKennCgV3xy0jE9lraxC3O2FzHWKdzWzAPdEanfprseZGEjxf2p+/TprGdX9ny98L0oBb5+WakNAzIT0H+JdCwl0TsY3fdzPcWLOOizktsU1FDhmmSViywY5Y5Sg4a48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903745; c=relaxed/simple;
	bh=9KqghvwdXIRR0e/GJhC48I7fwYf2pFzFP80DYjlgEms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZjPt2II7PjcqIvPj3OhQ3YLD1vDIBMJytX557gbeWa5LfR+wR5hrj/89tq/8c8C1zJQfQ7NYogD7un+eCo8N2/0GIju0OuvtPWpodhP8yxazu39wCw15Pj8K0SWxAdeRTv1x+LnCBvRxbeb2h6MvNoWevKBHZbDAZ5f6BnTS2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJYPRd7Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJYPRd7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790903744; x=1822439744;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9KqghvwdXIRR0e/GJhC48I7fwYf2pFzFP80DYjlgEms=;
  b=eJYPRd7QuqXRicCrRt4yofjnr0Iu6VyrTk43tOCfuWPIibbJRLDyEhcS
   MVltHyie6drv2hGA+xVirkY+NJbGX+Nl8vqtPwoTh0HmSOACSuQtSGrun
   w9T5mcl59kFtq3lor/TJmJH+6kXkO+y7zWtISXDXGrFq9Q5bvcoNZ1PfN
   68EegjQckv58jWN2bav8QYA8Rno7E0O3DB5DBVkhhwuxomm0LA7/TnaIO
   GeR5jmYA+cbAeDd57RiOeveZc6TJagxkV4E1UJiXC8qoFkWrPvojdvurG
   d+Gdzh9sdc5swDd/IeUc7nhD5jNhGC8FO0FNLTYVNapbZoccu0cimsuz4
   g==;
X-CSE-ConnectionGUID: MbhdFSXnT/+tIu7L69zqFw==
X-CSE-MsgGUID: TG0UHYU0R2ufpKFLdVWamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90442077"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90442077"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:15:43 -0700
X-CSE-ConnectionGUID: E/iYHmrzTDGUjU3oW84L8A==
X-CSE-MsgGUID: 5cYij02dSpqKEUHy1lhzng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279894203"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:15:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-arl-match: add new
Date: Fri,  2 Oct 2026 09:15:30 +0800
Message-ID: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add rt712 and rt713 + dual rt1320 configurations.

Bard Liao (1):
  ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config

JJ Gault (1):
  ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support

 .../intel/common/soc-acpi-intel-arl-match.c   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

-- 
2.43.0

