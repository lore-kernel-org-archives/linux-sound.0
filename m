Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE41471419
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322635; cv=none; b=j5p+6Xojnm7n3ZNVCFvEfDS/cL0ILtnTgZ7Ws+Jw1hp8d+QHrm+7CsOTWCXKIHNODZ6dO+Tj3s8099sTTiMDSNPSjZ8focwT3EqL01utbM8isbvWQTuZurLNI6dI6i25OcImI9ienFwvQACLrLx9IQzrMAnclGj/hV9fTh1l8CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322635; c=relaxed/simple;
	bh=+LJVqabFv1+2DhwLQp2RshikA9TTOg892yin8ocZ2vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mw02NfMbcc1PIcUsE8Sp+FnUeFlq12tboDHKy9b4BJqvi8MjoNV73pG2Sbshl/rbNVih+5JBBxSPtVt9aheuZrN5ng2HHvE0OV6u5X8WozBsUPaa3Sk+i2ijfiIE6sgmh6hlkJGqoa/lqa59bD8KLGL/a5kQklvXU/Ps5z9J4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b92Cc9hn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b92Cc9hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322633; x=1816858633;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+LJVqabFv1+2DhwLQp2RshikA9TTOg892yin8ocZ2vs=;
  b=b92Cc9hn1hxdQ9ubZs3Q/1Wf+IGWPelXEVzkfK74CKv2I4p05sCxWntu
   y2Lhzm/zZj+wcfKtyriw/jMiC7zxr2N7ic/8RuRasSwrskGR136NeQBi2
   eST1fgd3Vy6SZ05MypMwLFp9qLFij7L1ZWQKODk/wHWdzpg32Nc6n5lbL
   IWtd36/qNFAvCd5M7NA2sfs756YCt7XM9psFMH9dN1iCQNSPZokIPYMwm
   Ra6rLht6zbO94vwUV1pFR/k1uyND2t/tMUhRLLHC6+k7XFTpuC1kCtu6c
   ALLV3C6Dv3cHwGw2ScWPLymbalt38BkiChnS3sYgPurbhxCk8DOtcDHu1
   A==;
X-CSE-ConnectionGUID: iLMu9gbwSmCVWaChRym1MQ==
X-CSE-MsgGUID: TJWQrULrQhOBk/eNBuZq/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583823"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:12 -0700
X-CSE-ConnectionGUID: 7lF787CbTfG6/WUxyYJDNg==
X-CSE-MsgGUID: jj2YYQhYRKKcq445kGfqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675909"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/8] ASoC: Intel: catpt: Code cleanup and renames
Date: Wed, 29 Jul 2026 13:00:49 +0200
Message-Id: <20260729110057.342447-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Direct follow up to the cleanup from June [1] and fixes from May [2].
Patches 4/8 and 5/8 is what I actually started with, several years ago
when doing first attempts in addressing the long-standing problem [3].
With these, it is easy for a developer to move between the driver and
the firmware repository.  A clear example of why naming is imporant.

Patches 2-8 carry no functional impact.
Patch 1/8 slightly alters the suspend procedure as explained in its
commit message.  From practical perspective though, 1/8 too has no real
impact on the functional flow.

Changes found here reduce the code complexity slightly and rename a
bunch of functions and variables.

[1]: https://lore.kernel.org/all/20260603085827.1964796-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/linux-sound/20260528083444.1439233-1-cezary.rojewski@intel.com/
[3]: https://lore.kernel.org/linux-sound/20260528083444.1439233-2-cezary.rojewski@intel.com/

Cezary Rojewski (8):
  ASoC: Intel: catpt: Wrap the store firmware-context procedure
  ASoC: Intel: catpt: Drop redundant else-if
  ASoC: Intel: catpt: Drop redundant signature argument
  ASoC: Intel: catpt: Rename module header struct
  ASoC: Intel: catpt: Rename firmware loading functions
  ASoC: Intel: catpt: Streamline wording of offset variables
  ASoC: Intel: catpt: Streamline runtime-variables naming
  ASoC: Intel: catpt: Streamline control-variables naming

 sound/soc/intel/catpt/core.h   |   4 +-
 sound/soc/intel/catpt/device.c |  33 +--------
 sound/soc/intel/catpt/loader.c | 131 ++++++++++++++++++++-------------
 sound/soc/intel/catpt/pcm.c    |  45 ++++++-----
 4 files changed, 105 insertions(+), 108 deletions(-)

-- 
2.34.1

