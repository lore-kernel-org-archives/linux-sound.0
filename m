Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF1196446
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980993; cv=none; b=u7r5+tK7RKZMbcAqqpNAW7On19yLhxalMEAga/EQmRnpJK13UUx3gjDCBpZUfuTbiqDOtJFMP2Gamj0/TMcSR/BI5Hu2Ri9BG6zU9tbEKcV3NYBE0eshB+oXvqNPDmvjKza9+O4Xzlw7XGWNieXvRWawRXLr5tPLbYlySrxv9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980993; c=relaxed/simple;
	bh=fYJCkNUw1tiD6lNHMS2QLcGP9fm+pj5P313SD/WSKmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXBLeAYpEfKpU97h57YcV7V3Ze7jucezA5st019R+1VjL55ThkRKBmV5RTGRj/4R5crQxEWZ4Q1AFwgeoV2MAcTWNmalZtszBfsOkXnaKT18Ebh6q0VlttteqqXuQX41TG9qybUh5QbcvXzMYOaqmWLTfxQDkCLJym4uiB1nWOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGix7xp1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGix7xp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730980992; x=1762516992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fYJCkNUw1tiD6lNHMS2QLcGP9fm+pj5P313SD/WSKmc=;
  b=nGix7xp1nrjWXSy0wLHrGc0WPquWJ9OKHN5MmKR/bkw5MMTdGfZhZ7HQ
   qkfAh/v7DNR51SdzlLRYJl4dl7x95KMsRkgkVpNwD1L0LqR2Nk90lz9i/
   YWwWYxiUjhJ3FLpDw0a+GIFMTBc0K1gRVqiryXWhhHVgwPtiYbdnh+571
   K92y6yiDg26ovCyCLJ4/1O1oCOvoK2uCrFU5bJa73rXsxF7Gky9mc3wGB
   xs26IrFTWK/ry73H2U+pYxZ6vWy4sT4E7ES4ASbROKa7XF8sykfFlmX++
   /qhb+S7KN57S0nhHXdKqkWkr2f9rAb4ZEsdxLdbadWaiwDqKAXwFPcIQx
   Q==;
X-CSE-ConnectionGUID: sZD+06ViQqakXlJXZ/crvg==
X-CSE-MsgGUID: R/A0X2NuRCKf4eqe5aX7cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41437373"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="41437373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:03:11 -0800
X-CSE-ConnectionGUID: VlOficAwQbSnNAxxoqT/XA==
X-CSE-MsgGUID: +uSiKB+XSaG8f0GrnPbDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="85849564"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:03:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc3-loader: Handle PROBE_INFO ext_manifest type
Date: Thu,  7 Nov 2024 14:03:04 +0200
Message-ID: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The PROBE_INFO (ext_manifest type 3) is not used by the kernel, but
at every tiem the firmware is loaded the following is printed in
info level (user visible):
unknown sof_ext_man header type 3 size 0x30

The type is known, but it is not handled, the print is misleading.

Regards,
Peter
----
Peter Ujfalusi (2):
  ASoC: SOF: ext_manifest: Add missing ext_manifest type for PROBE_INFO
  ASoC: SOF: ipc3-loader: 'Handle' PROBE_INFO ext_manifest type when
    parsing

 include/sound/sof/ext_manifest.h | 1 +
 sound/soc/sof/ipc3-loader.c      | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.47.0

