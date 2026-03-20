Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB740DFD0;
	Fri, 20 Mar 2026 05:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985309; cv=none; b=Ds+Sn8D/Fj7/GUPV2JXK5EDCYySxuGyaWtNatd4yYlFRGnDt+nXt8lDMM97c3qyFtqA5qkjjQEoY3h3cFVmqp70psYtbh6XWx8tGv1xpeYeJfkz5WitNaSK/JZPZGCyNoPwz8ru3ua332yeak65oM2hEU/ZINUxMQ/JItZNmv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985309; c=relaxed/simple;
	bh=al0ysfY8/DDDHlBWLI1kEOADpBNyFguER4uDIL2+YAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXc3pGd2FY1qIPJ7FdqL1sT/6gbr7YcJc/+B1pkT8BqRad6vYyrxQfzDgMrAkOXNuMryyNeP1lq5ifcUtbcxPlvP9FdYSkqPiEaCA5OT5EhlkMXyXKINcs9TS9Yqim/F9SpBabdz33fWagwsSNXyXFJwkTz642JooOi75McDR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xosz+/Y2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xosz+/Y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773985308; x=1805521308;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=al0ysfY8/DDDHlBWLI1kEOADpBNyFguER4uDIL2+YAI=;
  b=Xosz+/Y2RcZT13P/7JWmpMjpuQyctAxiEtRGvZVIdmoblTAlNWuC+lXF
   8C7PTe26/wNA2XW+BfFN34nyr766RwTJNmwbEkfIWdkC8qzZzUUuvOejO
   v/avwSlIlZUQI6qYTemXnVvao6WEwLufILCrLNJu5q9C/H/Cg7swcVvik
   JjLlJ+XJ39zpGTnwqfyh41VgOQrvWdFbrWiXFKnufkyvqaq3JGbXpl4Za
   Sz8RbHBRUlltBsLYcff4yrzNT05o5LHmi5kkimS6vOTRQ1C+2wmlELLcK
   MOqNxTg4vxXpGTVd/c4i17MFHS9UkvclwQCXBTxb6uH+iR2mQEsN/Y2Sd
   g==;
X-CSE-ConnectionGUID: /Udaq3NkQgmvYuSkMvD1qg==
X-CSE-MsgGUID: 8kkRfojrSNaGX0assreB/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62629453"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62629453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:47 -0700
X-CSE-ConnectionGUID: j88cXKBLQoO1deylvg0WyQ==
X-CSE-MsgGUID: v478vryAQ6W+aj42wfDRkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223404405"
Received: from emr-371.sh.intel.com ([10.67.116.154])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:44 -0700
From: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
Subject: [PATCH v1 0/3] drivers/soundwire: fix memory safety issues
Date: Fri, 20 Mar 2026 13:33:21 +0800
Message-ID: <20260320053324.738100-1-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes three memory-safety issues in
sdw_add_element_group_count() in drivers/soundwire.

1. Fix out-of-bounds memory access caused by incorrect boundary checks.
2. Increase group->max_size only after successful allocation to avoid
   leaving the group's state inconsistent if one allocation fails.
3. Use krealloc_array() to prevent integer overflow.

Baoli.Zhang (3):
  soundwire: fix bug in sdw_add_element_group_count found by syzkaller
  soundwire: increase group->max_size after allocation
  soundwire: use krealloc_array to prevent integer overflow

 .../soundwire/generic_bandwidth_allocation.c  | 44 +++++++++----------
 1 file changed, 20 insertions(+), 24 deletions(-)

-- 
2.43.0

