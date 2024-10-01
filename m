Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8101BC9F9
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766389; cv=none; b=mtHUZpuRhJZNIpRDqul5QyvlkFItRjCP6RQazE/63lpmVqYTB0+4BST90g89REmIE4JLirYcsCTvxeO+SNa6YxUk+sQmt2rBgmxoSLvtTLz4VKkze8ehOzl+Tg5ZfqVP7zDgGxt+ZnR1vOijCY6WWoiLh01dMH/F58MjMOHVmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766389; c=relaxed/simple;
	bh=b/MtIDbSOtxg5RqlblDDlz9XlB8NEngCmN0dvp0dcB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxurTAYX3cZLfLGDa69g/UlZ1dsbrZzvJ957nSuIUYGDDwiJI68CziORZmPJgRbkvf9nhe6abfnxFUgNutbprfLFnvZ1kFCetv1dcVLS0BodaUSs8IyrJsibkgQa8asyi5JGyzRcK8xrWrl8pMLMdfyiojS2FMZ2RFh3BNOnWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oah8keQP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oah8keQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727766387; x=1759302387;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b/MtIDbSOtxg5RqlblDDlz9XlB8NEngCmN0dvp0dcB8=;
  b=Oah8keQPAJIGbUi6OZnkqo2DJ59hm8OQDm38rydR4BQrR+Mnu+zozP+c
   6Cjqy4GUTofx0qkeQ/7Lp6kP6nErIsxVHlzTe964HgX+Ng1eYjapFijS+
   KB73s1FE0Hk5ii1IIRAY1C6PUkiQAQfEAHL4jmj8ZCz4xUi4TW8lAwy3e
   84uoINE+alY5AnP6fNgIosgiqKKtCN4N7PEAc29+NLM/I6ZcxUCUOSrO8
   G0UqZ90XZOTL0ztF+gGJlxMXbQWTgC5DbAXAZneUNDLwUnVCfMVVB0/Dx
   iMe7ELqGo9djUXIkzss2pWmWBlGl3SXluadLYCYzGbR4iqE8a6ugGsHPE
   Q==;
X-CSE-ConnectionGUID: y35nIGKZToaLt8ydwo8dKg==
X-CSE-MsgGUID: ieSvs0i1RBe7EE3YkZS+rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37556037"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37556037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:27 -0700
X-CSE-ConnectionGUID: hctEa8QySfGe5s+MtUpcLA==
X-CSE-MsgGUID: z7psveHsTe6hnadxrFcxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78096797"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 0/4] ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property read
Date: Tue,  1 Oct 2024 15:06:07 +0800
Message-ID: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
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

Takashi, this series can go via ALSA tree now.

Reviewed-by: Takashi Iwai <tiwai@suse.de>

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

