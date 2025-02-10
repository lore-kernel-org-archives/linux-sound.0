Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37B33E1
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739157605; cv=none; b=mELvLsc7r4geau9iwqhFSSu2hg2jEheWAUSDbNtllvKp8KVt26GMBc02t8Oki3Rt/GL7I9GzOMB/MsFdAjsCB7CI8xlw4ijZHptAb7EHMG6SsBUG1nOY1mGK+nAt7vNAC/BDjEsxD6HUvnc61W84o8DWboYKouPrmCIPwjz+bQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739157605; c=relaxed/simple;
	bh=cAEbeYxkbpObcyjuTnE/cXIdJgJGLgfNSNJFkU8iKzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOSLmrT9xgOjs+9Hi2v12NhDvOdE74ea8UHbnQv6RwEZoOgu0cLWzynR0EcqBqSoLSn6dfAVsEDz6DajphgRNMcuh1c6vKN3cwjWRZtrzzfaWUEB/nTeqcNnffMYasevo5Xb69bGwqSY9KmyZen0oqvwr3HDiZ6mUEtxLeoq2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzvxpD+W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzvxpD+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739157604; x=1770693604;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cAEbeYxkbpObcyjuTnE/cXIdJgJGLgfNSNJFkU8iKzo=;
  b=GzvxpD+WuCzD2JL2XdZLxerECdzzPsJ318ykqTxWwpfTOjsap64W5HPM
   OvbjUbqkHx4VkugdbsqJxy5spugVpWLCxIp/53F13h4OkEL8bYsyiRPcz
   x11qPYAQh2BsvoDjZXKM+5bIRockpX+8eICFLhFUVnuNCcmoyi0Qcm35E
   Rfdel4tzIAOo5KKdmqxgRQ+mjOkPFSLrdPxDn4yVrvwE2cWBfLbb2UlBB
   iytoZYbH5uwURVp7K5/7NpHiMpG8uHU2X/rbSlNhW7Itw3ibvgN9X4EBd
   bI/UPTvJQvBNdl7TAG8I9GUid0wTg+nf3dzWN0mgTNSKS06VfgaoCFbTJ
   w==;
X-CSE-ConnectionGUID: CBpuxQCkRbq6gDwaWuRalg==
X-CSE-MsgGUID: f1UBHwBASm+WSrTqSUnXFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43488594"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43488594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 19:20:03 -0800
X-CSE-ConnectionGUID: fI9uXlQUSuKvl1KLaZjByQ==
X-CSE-MsgGUID: 0ZmIJe0fQWSzknlD9w6mYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142945811"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.124.221.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 19:20:02 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 0/2] ASoC: Intel: soc-acpi-intel-ptl-match typo fixups
Date: Mon, 10 Feb 2025 11:19:52 +0800
Message-ID: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix copy paste of lnl into ptl.

v2:
 - Remove "fixup!:" from the the subject lines.

Peter Ujfalusi (2):
  ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt712_vb +
    rt1320 support
  ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of
    rt713_vb_l2_rt1320_l13

 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

