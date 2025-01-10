Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AFB18787A
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507987; cv=none; b=ul62KThOr3OS/wdvAmEZQOP7+4qi6CP1kwZr3YCZXwzzwVzspY+30PTjaeqESb/H3hld/VfrkBPUT3B+iTcqZiDXVDu0ZWf1h/L86JVumtISKfiS5bC5hGV/AwHWByD385hofsU1dqhQ/EIc7nrjG7ixMf+4A0n7aic42Acfr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507987; c=relaxed/simple;
	bh=zh6YNPkdR9wZJe9g9qBWs/Q9Y68XOTXgu96Gb+NSFj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A/U8iQuax/pIbfjdKfaeZiokF8IKyY1mQRJ3cLB6ACRLG2vjN1EFeD5VPCEDr8QH9vviTPO6JN1NXaiMvhMRRKT54JbJXmFjGNzUaMqGnmLD1PyjpvAN77dA3g+kiYmaVD61KIbWXDvBx1rfLWKcKoPnzrJZD96252FUWJN4tQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1LuFg9C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1LuFg9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736507985; x=1768043985;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zh6YNPkdR9wZJe9g9qBWs/Q9Y68XOTXgu96Gb+NSFj4=;
  b=I1LuFg9CoE9mPTQjMLY8sKGkPA9BmjOL7VI0IEoQzYIC3Z8Fy0fu4Cu4
   brZvphT7GIOp2nk1C9sefwcvrJ1RYyHuyOQJldLc1ppI7FsQAr1Ce07bE
   M1yz+FAGbXHLpH2n82v9KT0QVcaXLbPvolKhvNXs+K+VANZZL5wfcR3Ns
   1PpdQIqvmnP8c+l4OXxsDhXD2gbT/le/Oy/IccPg9HSDT55RtbNZ4zlEw
   nKP6LYPoaiqEzR73qlfCcmZUmbQqkIvZNm93hqEUsOx8+zl+vo5e1z/Dw
   ahGHf7IjHEbPB4nhxNrZRj0i/n4JKX9kYh/KDdxZW27eeav1O5cL2yTFb
   g==;
X-CSE-ConnectionGUID: QQp0kT9TTO2Iotm9u2L+cg==
X-CSE-MsgGUID: HcBlHYnsRF62cH5ih0ifWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47373014"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47373014"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:19:45 -0800
X-CSE-ConnectionGUID: 7AMF8Nb+SYWZKrr0PX56Aw==
X-CSE-MsgGUID: tPs0vtjEQd67aBVP+QqltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134609908"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 03:19:43 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/2] ALSA: hda: Compilation and firmware-loading fixes
Date: Fri, 10 Jan 2025 12:33:24 +0100
Message-Id: <20250110113326.3809897-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small set of fixes, one of which addresses the compilation issues with
snd_hdac_adsp_xxx() macros utilized currently by the avs-driver alone.

The more impactful change updates the firmware loading flow so that the
binary is loaded in two chunks rather than just one. This is to follow
recommendation from the hardware team: SDxLVI is expected to be at least
1 (0-index based so 1+1=2 BDL entries) when performing any data
transfer.

Changes in v2:
- removed the type-mismatch fixing patch as suggested by Takashi
- relocated snd_hdac_adsp_xxx() macros to avs/ space as suggested by
  Jaroslav and Takashi


Cezary Rojewski (2):
  ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
  ALSA: hda: Transfer firmware in two chunks

 include/sound/hdaudio_ext.h     | 45 ---------------------------------
 sound/hda/hdac_stream.c         |  3 ++-
 sound/soc/intel/avs/apl.c       |  1 +
 sound/soc/intel/avs/cnl.c       |  1 +
 sound/soc/intel/avs/registers.h | 45 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/skl.c       |  1 +
 6 files changed, 50 insertions(+), 46 deletions(-)

-- 
2.25.1

