Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C2616726E
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007280; cv=none; b=lcHF0ImictRhexMlv4ucvxOckYvZF12DWpvHiaP8gJwRwSI4uNieLwaBivCLCCiL6DXvLwTRzctENboDaKoMni2aGLdK/RfKTV3L8Ij2sD0+cGFxNYcbSAr93gK5m8jed0Qada6Fxy7X0dbnCrzE0WAMOy15gPaZbKHFlr4xB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007280; c=relaxed/simple;
	bh=rkMcsNFNw1p48JJWRdlTkcm3Gt+NZ25CMesxXkL+5XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWMkst++uxfGe692GF22JYobqyj+vei4RroqVc9gSsHyw6Q7aQRwxSYPn6BZQvZBHddDaFCiSenJHwrzs/p3SrXB/DSQNepvrjlh2CkuquCrn6DbMbhmGuBuWeuLwhTSHZj6PcFibd0/xfVTisG+6D0hzmx95b1SRulolA+c+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmytSRDT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmytSRDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007279; x=1756543279;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rkMcsNFNw1p48JJWRdlTkcm3Gt+NZ25CMesxXkL+5XY=;
  b=ZmytSRDTiDu4yGjHx8eD5MekDax2ovwcTPrqXAnVURCLwN55IsG68F3f
   uecKecY4D0hvPsssVEVbHbXAJFoW4lAdsZQ+F810vSYO+IgGvQ6ieWVqu
   qcBBJWZ/E98FftyDfCES4EXxWG/7uTC8hyzkRdGjAbT8qvhoaN0dQDDVu
   1UCZ39F78Q7DPvWZqEkQoRQAT/B5YCbyLBgsSolrzJp6SRX+lXWcadnVI
   GjAzkgyQToect6UAnjLI5DIHPxCLcMA+14SF11J4PCP6SqllZnAUXcmG4
   t0xqLakVEb5IP+JYhYYUbKeGI+yD7j9unHu61sa8qkGisb72EdbhdeQeI
   g==;
X-CSE-ConnectionGUID: zgVhGvHnR9+L+R13eDxKBQ==
X-CSE-MsgGUID: KYktjhuHRqyQZa3Pfcs/ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26536429"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26536429"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:18 -0700
X-CSE-ConnectionGUID: ahM06SAVSDOfCARWT0u0wA==
X-CSE-MsgGUID: QpTlcqKQQSyocTBtaMHkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94665903"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/4] ALSA/ASoC/hda: intel-sdw-acpi: add support for sdw-manager-list property read
Date: Fri, 30 Aug 2024 16:41:01 +0800
Message-ID: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DisCo for SoundWire 2.0 spec adds support for a new sdw-manager-list
property.  Add it in backwards-compatible mode with 'sdw-master-count'

The change is in ALSA tree, but SDW_INTEL_MAX_LINKS was introduced by
commit b27404b2bbf9 ("ALSA/ASoC/SoundWire: Intel: use single definition
for SDW_INTEL_MAX_LINKS") which was applied to the ASoC tree.
Therefore, this patchset can only go via the ASoC tree.

Add "ASoC" tag in the title to make sure the patchset will not be filtered
out by ASoC.

Pierre-Louis Bossart (4):
  ALSA/hda: intel-sdw-acpi: cleanup sdw_intel_scan_controller
  ALSA/hda: intel-sdw-acpi: fetch fwnode once in
    sdw_intel_scan_controller()
  ALSA/hda: intel-sdw-acpi: simplify sdw-master-count property read
  ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property
    read

 include/linux/soundwire/sdw_intel.h |  2 +-
 sound/hda/intel-sdw-acpi.c          | 33 +++++++++++++++++++----------
 2 files changed, 23 insertions(+), 12 deletions(-)

-- 
2.43.0

