Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81E13C80F
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483494; cv=none; b=ATrNZRgxJnHaL0e0JKU0T8sChjlaYwzKluNlN9cpFTaZXGwb4/BVOo29v8mfhB+Qyx8HXaDfP5frr6LQYHcEDw9qbDUTOX/ntoze5F/O0up4SnOH/THtCNCGFZPC9ob8QtZ+2wiu8MMYI58Ka3Y4ArJx2YttJbV/G6WjLYgGXUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483494; c=relaxed/simple;
	bh=G8KXhQ4M5CGQSwm5YfP9f1fDeE+I6jW/6vutvWG7ATI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=m8DXp9S86yCpy8PjvNOYsAM4KETIsvHgdfDJlML+pRhFo23PAgNvCl0NFA1Id/lVrtgKeuD/U5eHfu+c9tKaY1ScAo6L3BJPnh10asdG+tDqKj5yqYAWsOsPNl0Key2kJEiBO+FuW+Mc8asX+4EOQJO+IinDu2oH/Wmu0TEDcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3PXdCzy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3PXdCzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483493; x=1751019493;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G8KXhQ4M5CGQSwm5YfP9f1fDeE+I6jW/6vutvWG7ATI=;
  b=W3PXdCzymOlyPx96uzxyweQ0yFK05pZjPUX/ELTsqlTtTtxfmzujzMql
   duHRwCbZLxhy351tXjUpuemAhtcQFtY464KvgBU+sxLWLj+PtVc2DxwXJ
   c7zgRoDEw8BJcgvQF3OEr+Q0QB1irz4+xw8evdhyY7J2Tx/dSB4n9/g/F
   DSsaJpvHk3lQHmcRLTtc9xxZg2Dx8uY7XzXDZXQ5okue3DnCn6HkIjSUo
   nwTtKX9ohNoHPsP5Oxh0gWMTfvelg1qGr/JjmpsHIVQ3kontBscMBY48z
   YBzBtGUUWdCDPPcJhzavqv5ehI8Jo+Ca7pcq6TXEJ1YBPi85psOuPu8+w
   A==;
X-CSE-ConnectionGUID: EMOcCX6mRymIf7JeodGaAw==
X-CSE-MsgGUID: sqhmYs2yTwO4wmbyTXlDDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487561"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:12 -0700
X-CSE-ConnectionGUID: gtpWdtHQTn2nAgoEfM1a3g==
X-CSE-MsgGUID: SKpBrRcnSrq+6BQ3fPiNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45079955"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:10 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 00/13] ASoC: topology: kcontrol registration cleanup
Date: Thu, 27 Jun 2024 12:18:37 +0200
Message-Id: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Code used to create standalone and widget controls is mostly same, with
with exception that in standalone case dynamic object needs to be
registered and control created directly.

Following patches clean up and unify kcontrol creation code in topology
code.

Amadeusz Sławiński (13):
  ASoC: topology: Simplify code
  ASoC: topology: Do not do unnecessary dobj management
  ASoC: topology: Properly initialize soc_enum values
  ASoC: topology: Cleanup soc_tplg_dapm_widget_dbytes_create
  ASoC: topology: Cleanup soc_tplg_dapm_widget_dmixer_create
  ASoC: topology: Cleanup soc_tplg_dapm_widget_denum_create
  ASoC: topology: Correctly set shift_r in soc_tplg_denum_create()
  ASoC: topology: Align dynamic object initialization for controls
  ASoC: topology: Rename function creating widget kcontrol
  ASoC: topology: Reshuffle function placement
  ASoC: topology: Unify code for creating standalone and widget bytes
    control
  ASoC: topology: Unify code for creating standalone and widget mixer
    control
  ASoC: topology: Unify code for creating standalone and widget enum
    control

 sound/soc/soc-topology.c | 568 +++++++++++++--------------------------
 1 file changed, 194 insertions(+), 374 deletions(-)


base-commit: 2b1281d6ae7b47c654f5be68e0d270f76f7accd2
-- 
2.34.1

