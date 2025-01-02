Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372841ACEC2
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735821225; cv=none; b=bNqBr5VEaOZ5gLfXOvHcJvI4WxZcC3EFMYYN7boyj6APvLKhgHi9pp9oiYEBDHxDXVa3V61iTzHNupSNoylvLEXVa+muuN10gnYLFEqpS0pxyleEIfIrUqj5bshYnr4mBrll/Engc6ChEcehtQXACBa7+VDlchllATJau2C2ZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735821225; c=relaxed/simple;
	bh=GuzL6by9/+zFScmu3dazDXUSWZ5sMMJ69FOocosYQBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6pquerbCiuqVKIR6NSzpGYCN1wcgRxtjTImTKmdjDIgMxyWobQ+ezYO2CMclc6vxe130bvh/oENhKxEJo5FgDiZl6VF+EG/5cCHoXcPLn8ffw5lBkcHojZf6rNDq/4Gczm3E1Mud/r8m7tQnS317feeiZ1C1zPqYtmjW29WpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDTXLBJm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDTXLBJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735821224; x=1767357224;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GuzL6by9/+zFScmu3dazDXUSWZ5sMMJ69FOocosYQBU=;
  b=QDTXLBJm141OxnuNJJRbTe5zm1HhCgsrrX+9yypVodiRbjY9XI3KhQiy
   cQIgO4jgbXG0gdDSmyC80IzzB7iFGIOeEnUevsqF5q4Wo+YaRd9DKl+UT
   xFsKadUFLh37MLzuf+VMeLrQjIqxF1xMAS1iUECA2jku1MHoDxqhOOCzg
   FYqsAavJKKmwjVIIgs8cb+6JIp2p6g6sJ2Dfv6uRR4OAVQFUSI/lLucEA
   2IrZoDqO/Jn0BnmBI4n4EKJy8RiBJSf3LBylRs2IA0d75aTXD9jJMHp2S
   mxfhh+sOT5D3+mj0TIO9qNWgFDoeGYQW+QQWlMlvuqgU0XRflK+3i5cl/
   Q==;
X-CSE-ConnectionGUID: xdqT57rDSA6r1dGAz95Zgg==
X-CSE-MsgGUID: yoBivKYERjGO84uWDhLNyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36073871"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36073871"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:33:44 -0800
X-CSE-ConnectionGUID: iHlqHUeLSXayBhBp2FEiMA==
X-CSE-MsgGUID: +wX6Fk1vRXW46V3hIgUtOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101681369"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.231])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:33:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: sof_sdw: Fix DMI match entries for a couple of Lenovo laptops
Date: Thu,  2 Jan 2025 20:33:33 +0800
Message-ID: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those laptops use host DMIC. Correct the DMI match entries.

Simon Trimmer (2):
  ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
  ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM

 sound/soc/intel/boards/sof_sdw.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

-- 
2.43.0

