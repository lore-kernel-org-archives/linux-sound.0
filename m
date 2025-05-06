Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5472600
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531204; cv=none; b=WRMSFeYye6F4vGgx9wwJnF5ULtZX+6McxBnPGY3mxPsuZcmvIIF/WTtyHWADBHt/k4kzxr3QKlX0XPPdU1LOFiRM+kjOHj3TYuRRuQETeL14m33cq3b7t5Dfkw9yHqnrUKG6SraBktn4IvEKloLlI6OZEmovY7lXRBAquARBFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531204; c=relaxed/simple;
	bh=9hnt6a9xpl8cy2Vv0jIIAg1t4BmeBJnbbXoxdiUFD0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=daGnbMOJdMRxhjIh1yz5AU5YCUhC81Ano4uXtkGR75QdS2jmdNaKTv7InamsczZ4ATrtjwooulGsc0ld6VlF2FJt6AUPFNCws1VQvgXltHaVqnvu34TwDtnfc/N9j7MS9O0aswO5Up3/n+AoK/PGc9/C3T+FNmn3QWvK4qbq6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auv5AeUm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auv5AeUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746531204; x=1778067204;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9hnt6a9xpl8cy2Vv0jIIAg1t4BmeBJnbbXoxdiUFD0I=;
  b=auv5AeUmX8jxyQhE2NYEB/0pcio9GQgFInh1KMR1MZrCpTjXN4fMWLEw
   1kmCFgOHohnwxRor6q9OAp7rC7lV17jJ5ru6eB+S9J6yo3IOrJCwaYVFU
   NgGumXHu80LqLcq11ZcrmdAHW0ZKzBnp+5B1gYdxZfoKHGvGCWJgFbWSN
   m5jh7Qzmh6Any828rjxCarhbqybaYh0NerRJIZxUEwOCPix3XpylkD/1k
   P/gJJpjIXSWCrR2zx5AjcxEAj4BILd+lruXAveN3WI5g5o+p3V00b+paD
   0NDzyEM2JvlDKnC/+t7WVwmVspFhF9yhS191ScgDZAsCLnoU8x1AHKa73
   g==;
X-CSE-ConnectionGUID: 3wP9BoUPSjSVtSnhGaMpHA==
X-CSE-MsgGUID: 4k4MMaCxQheaJ74PAp6jCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48101874"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48101874"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:23 -0700
X-CSE-ConnectionGUID: KZApTeAaSyGRRwJaW6Y7Lw==
X-CSE-MsgGUID: 2r9j7eGtT0+3EkcHht73OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135478475"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/3] ASoC: SOF: add disable_function_topology flag and module parameter
Date: Tue,  6 May 2025 19:33:07 +0800
Message-ID: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SOF will load the function topologies by default. However, user may want
to use the monolithic topology. Add a flag amd a module parameter to
allow user specify the topology or not using function topologies.

Bard Liao (3):
  ASoC: SOF: add disable_function_topology flag
  ASoC: SOF: set disable_function_topology if override_tplg_filename is
    set
  ASoC: SOF: add disable_function_topology module parameter

 include/sound/sof.h      |  1 +
 sound/soc/sof/core.c     | 10 +++++++---
 sound/soc/sof/topology.c |  7 ++++++-
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.43.0

