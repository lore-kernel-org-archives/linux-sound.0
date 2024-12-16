Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB32AD20
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319929; cv=none; b=lTmcIor9g/7qgFqxngbN1dVBYCyumS4EM6XO8WkjTYTffAomssOQRadGfiFbpeCfamQ9u8UYGEQY56ggkvX1K9FX6hmtncbUKWp35LX8xEXI6kebm18v5IW5FMgGD/5jt4ZKK7KO1SWMBPKs5rm9WBBKbfdUW9fSTcaYe1BNkXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319929; c=relaxed/simple;
	bh=gsFicS+WVaYj2AEDcUpskV8UWnrkz4ETOflvhkCDq6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZAHaW5v6let5CJOXZG5raSgiyuLIS1cSPyzRhY4FkMABBM/+oHXi74Fec0Sl+HwCGTBp0BTQMVYb6yasRPLj2/MNoESS05J4SVlFHtH/JPzsdxJW/sts3uBSY1PyIztIOwUFxok8iho00ymcQIWPLeSOxp7ungIlcKmyhWCos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inxHtAmp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inxHtAmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319928; x=1765855928;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gsFicS+WVaYj2AEDcUpskV8UWnrkz4ETOflvhkCDq6s=;
  b=inxHtAmpzUbj8QpzMQTvNF9ReiJRbYCPe2H8QLo/j0U5SvuHKz1tO68I
   Sf9c1IR+1KTATVifg6E6tN4yQynxy5glrfFBL1X9LKYGDh1qbshRTO27e
   Q0KBahHmIR9elmJPXGQLJJ1Pti07vPOD8qXFCF3eG7jRJX1liNU4qYQ8c
   BjZHL1hOhuAxJSJ8iQIXGglJe+yFjI4VddH7LJiqeqVa0i54w0w84YAc1
   aF6BL2OVIsgPFilSa3p1HcVn0U64PNRgzjCsNJfv0EpA4NJuZDsN8IFHf
   vNAKaOqovQF6bKfv6/o72lc1Q/KDgq9Y9gP2AyqfZRQu+0kUf4Qbl9tec
   w==;
X-CSE-ConnectionGUID: ggbo6XGOR8qQOV1UgZx2ig==
X-CSE-MsgGUID: VR65Qn6OQTCwoj7Y9slCmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="38468361"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="38468361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:32:08 -0800
X-CSE-ConnectionGUID: rfTX6Pa9QtC9qTPpKAJO7w==
X-CSE-MsgGUID: 6aC2N2s/TO+WHeyL6HVyFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96978232"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:32:07 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: sof_sdw: Update DMI matches for Lenovo models with SSIDs 233b, 233c
Date: Mon, 16 Dec 2024 11:31:57 +0800
Message-ID: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMI match information for these models has changed so the match
entries need updates.

Richard Fitzgerald (2):
  ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
  ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB

 sound/soc/intel/boards/sof_sdw.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0

