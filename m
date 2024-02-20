Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3730679ED
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429757; cv=none; b=IqlZlA8i5YMz2lm831E+DsiC5geCRxSDtE5bBzBcTnnbezV796wnNF8KzKakAjqYbrLmqlOXIfgvrK2IsYKz7hNzSiltqkspZPUj4ChAflJS29QRxQ7rKjorYiIR/YwJUeafrXGx1vGAhSfktCtk8gHeQfIW4efcM7SIgz+2hjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429757; c=relaxed/simple;
	bh=PSuwt8gUlDe7NzcuMHOSHhuplX4hK1PW0oy7ABkpxQk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ac/wUgaeK9BIy6qxN0Q21yucmiKY29glGtUPL++gbSyNjzYDm+wP5CSIYspQ/9ycgIpJBi1z3OzcTZeUINquLxkDUUEZSSQM3HSPPIPOeEobPLtJ5HIt0MZXRNt/6mEw+cyTtDNucFhFn9T+nYahuTNy7tN1Vln5rvqw3o32Y5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gW690COC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gW690COC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429756; x=1739965756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PSuwt8gUlDe7NzcuMHOSHhuplX4hK1PW0oy7ABkpxQk=;
  b=gW690COCy69Bt5IgfPtbXTrVlGX9mAdo4wErGO0bJLXn3pBZPfF7pROt
   yAktgrzd1Jp17tDP1eBsy9R0nAYec311FFs+2PVvaKqcMf4xaAxxEtby9
   QyvuGuMWjgFZcVqR4FlkfnT3vvqFBZ/Ck2kpcNzlTrDLMFaxTmR5ynQDr
   PJL3wceTE/nidJD8xlmE1vLGVB0qrr2RCNQUsiIZFJPtlSLZgOEzpqta+
   xWxU5VXA0hwdZrXL5nSguk1VfVbDBbzKNoggWPOMoWkEVymg60ZcXN5qo
   7XX0mhy3rlCHOIaU8IFzUw7cQQVq0X51VXMAZquAFLWb+cSh/YFqgllY7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988910"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4750929"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:13 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/10] ASoC: Intel: avs: Fixes and new platforms support
Date: Tue, 20 Feb 2024 12:50:25 +0100
Message-Id: <20240220115035.770402-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The avs-driver continues to be utilized on more recent Intel machines.
As TGL-based (cAVS 2.5) e.g.: RPL, inherit most of the functionality
from previous platforms:

SKL <- APL <- CNL <- ICL <- TGL

rather than putting everything into a single file, the platform-specific
bits are split into cnl/icl/tgl.c files instead. Makes the division clear
and code easier to maintain.

Layout of the patchset:

First are two changes combined together address the sound-clipping
problem, present when only one stream is running - specifically one
CAPTURE stream.

Follow up is naming-scheme adjustment for some of the existing functions
what improves code incohesiveness. As existing IPC/IRQ code operates
solely on cAVS 1.5 architecture, it needs no abstraction. The situation
changes when newer platforms come into the picture. Thus the next two
patches abstract the existing IPC/IRQ handlers so that majority of the
common code can be re-used.

The ICCMAX change stands out a bit - the AudioDSP firmware loading
procedure differs on ICL-based platforms (and onwards) and having a
separate commit makes the situation clear to the developers who are
going to support the solution from LTS perspective. For that reason
I decided not to merge it into the commit introducing the icl.c file.

Cezary Rojewski (10):
  ASoC: Intel: avs: L1SEN reference counted
  ASoC: Intel: avs: Fix sound clipping in single capture scenario
  ASoC: Intel: avs: Prefix SKL/APL-specific members
  ASoC: Intel: avs: Abstract IPC handling
  ASoC: Intel: avs: Abstract IRQ handling
  ASoC: Intel: avs: CNL-based platforms support
  ASoC: Intel: avs: ICL-based platforms support
  ASoC: Intel: avs: TGL-based platforms support
  ASoC: Intel: avs: ICCMAX recommendations for ICL+ platforms
  ASoC: Intel: avs: Populate board selection with new I2S entries

 include/sound/hda_register.h          |   2 +
 sound/soc/intel/avs/Makefile          |   2 +-
 sound/soc/intel/avs/apl.c             |  58 ++++----
 sound/soc/intel/avs/avs.h             |  66 ++++++---
 sound/soc/intel/avs/board_selection.c |  85 +++++++++++
 sound/soc/intel/avs/cnl.c             |  61 ++++++++
 sound/soc/intel/avs/core.c            | 160 ++++++++++++++++++---
 sound/soc/intel/avs/icl.c             | 197 ++++++++++++++++++++++++++
 sound/soc/intel/avs/ipc.c             |  66 +++------
 sound/soc/intel/avs/loader.c          |   2 +-
 sound/soc/intel/avs/messages.c        |   1 +
 sound/soc/intel/avs/messages.h        |  38 ++++-
 sound/soc/intel/avs/pcm.c             |  77 +++++++++-
 sound/soc/intel/avs/registers.h       |  21 ++-
 sound/soc/intel/avs/skl.c             |  59 +++++---
 sound/soc/intel/avs/tgl.c             |  54 +++++++
 16 files changed, 807 insertions(+), 142 deletions(-)
 create mode 100644 sound/soc/intel/avs/cnl.c
 create mode 100644 sound/soc/intel/avs/icl.c
 create mode 100644 sound/soc/intel/avs/tgl.c

-- 
2.25.1

