Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A8D29BD95
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814284; cv=none; b=LZNDi8W1YWhzmt8hHJ+jvE5OMXqUU5d2xVDdr7+QEgClq3MettHE8cG3G6/ICQkLf7FHml9NLcQ3ryBDqkDHK8ge9Zy8v6URjrlKyIx7Xc1zgFl0XFncGzJlinp6LlbLtq9Mjeu70YA9XQF5+0J0pxZ8gWHlIDsd59+YSvR2qF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814284; c=relaxed/simple;
	bh=4iuTXigTHTXOYl+ocBW3SOJeHhw+2sRRFAEdRPHVkLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G2/o4+8sGVfgtlETv3et3aKiqQ8SuUG8KRrDmyJ2bgMBYGL1pCWuRWegYNTJRtJRZexQNfRAhmY9smt7hBGmIBZg8DrtJKmpmlsxGnNIrsJiLtLY9KII9rAeWUhihS+FHPfueBCCVBJX62RweezmOHwkm8kYtH192tLYZj+xqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHbNLhM/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHbNLhM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768814283; x=1800350283;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4iuTXigTHTXOYl+ocBW3SOJeHhw+2sRRFAEdRPHVkLw=;
  b=HHbNLhM/9wDGZ3ns+gi9sUw5IZT5ooiRaLvAOf/ARTl/EYsGXmNFewh2
   qlG99cO9P43KYM3N4nsVhHcAfHADiC19RT4dQXwaDqjcg++AePh/+fC4G
   klqh4hG9aB+2IZ0WpqV+YRlvON+gRbBl2mXjKHc291QXuQMFDLR6EN6E8
   oi3iRpHENmoZjbG/sTAPHDWbQC/IJ8Pw6K08C5ZDuvZI3i0+EOUe5xPSD
   1qFeCfx7KMP2iae2MLnReUT4UYx8qG7tf2UMk/Fr1Cd9pM7or7iqe/1ya
   v9YBWoBdgmoBmZ/Wcqz7RQBXHFU4INKs2PwGMv43a3h29VdVdOzVJ9gNt
   w==;
X-CSE-ConnectionGUID: x4SrhVdlQFa2tcGnrrn/MQ==
X-CSE-MsgGUID: GRlMoz6eRjiZVkkq2vrWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72613224"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="72613224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:18:02 -0800
X-CSE-ConnectionGUID: ToR/wlFFTNytRN0FwX4poA==
X-CSE-MsgGUID: Ago9WlLMQKe2HeWQZ2Vd8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="209958954"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:18:01 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: soc-acpi-intel-arl/ptl-match: use aggregated endpoint in rt722 configures
Date: Mon, 19 Jan 2026 17:17:47 +0800
Message-ID: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When rt722 work with other amps, the rt722 amp endpoint is aggregated.
Set .aggregated = 1 to represent the fact and avoid unexpected issue.

Bard Liao (2):
  ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to
    aggregated
  ASoC: soc-acpi-intel-ptl-match: use aggregated endpoint in
    ptl_rt722_l0_rt1320_l23

 .../intel/common/soc-acpi-intel-arl-match.c   | 23 +++++++++----------
 .../intel/common/soc-acpi-intel-ptl-match.c   | 13 +++++++++--
 2 files changed, 22 insertions(+), 14 deletions(-)

-- 
2.43.0

