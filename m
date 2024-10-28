Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223218FDC6
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100401; cv=none; b=eY4a40W6xS33w4DWnHK/E9/XoPSQqUxGnr+wO521PkYV55ExA6T/Or9Dbv5E7MCyPDGUdORw6jTqjuzrSqzTpDAnsSdeLrW4eGc/9BLrOW5N3jCemRj6Hb4i+QhFtm/g5ZLvLyoqo5ztEKX5MhXyYmlEHRupPt0bUFlHfwB2ieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100401; c=relaxed/simple;
	bh=IieH5UbIHBVPTm6gdc25/5HBZ+ihIJbcWdkuPDNcH3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpzBGcfEruX8HON49WuHx+VEF/VXAGMaqbqyd05DORLtjByUwWeC5DVAl0x4cj88Ik0Lp9qMhFyO4sLH1Qw8OTp0QqkP45BNKg2/nOtjSRgUXsccQx5Cw/tj3RTUl7X29TiJ3cMgvhOJiB0HDgBKgGNZ2TXAaLHNFH7n40egYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwR1LBvo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwR1LBvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730100401; x=1761636401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IieH5UbIHBVPTm6gdc25/5HBZ+ihIJbcWdkuPDNcH3k=;
  b=PwR1LBvous8RxdG/fs1YoT8s8izgmcl+QMbnFJB6C8+XEhMNKCogAkdB
   HYmTyg9WdTm8OHr2MMhaE+qQUa9BAAVCY6G7B8c/Fuzmgg4cJ2hiBJCrY
   s/GZI+vTir5Vnqdbor30lZQriwEUObJqLZ66tnKM6GlMVmgXGqh1cFJ93
   ICw7iTA+uUwll5F+xd4clPkRJKJVDkZVgj2IbLU5L+r6bPXJFRjliz+EW
   1Xp88FglNuLNHcHXwVfOxM8OyJteWYxsciMS4fRsc0YutwN6ZrgZkUvHZ
   9ozuDBN97hLdA0lZUVlEQ0F9WUNeYDDS8VDdv4TAnVNaEDqd/gbBJt/DM
   Q==;
X-CSE-ConnectionGUID: Bj2P/9vdRQST1/jzoK2K8g==
X-CSE-MsgGUID: YVRZQzFrSm+gysRbOko0OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47145525"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47145525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:40 -0700
X-CSE-ConnectionGUID: N7PYvWwUQcWG4KV40H7UYQ==
X-CSE-MsgGUID: u2kovzKoS/Sp2LnAboq03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81975568"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.159])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/3] ASoC: Intel: add rt722 and rt1320 support
Date: Mon, 28 Oct 2024 15:26:28 +0800
Message-ID: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add rt722 and rt1320 support for a new Dell SKU.

Mac Chiang (3):
  ASoC: sdw_utils: Add quirk to exclude amplifier function
  ASoC: intel: sof_sdw: add quirk for Dell SKU
  ASoC: Intel: soc-acpi-intel-arl-match: Add rt722 and rt1320 support

 sound/soc/intel/boards/sof_sdw.c              |  8 +++
 .../intel/common/soc-acpi-intel-arl-match.c   | 63 +++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c           |  2 +
 3 files changed, 73 insertions(+)

-- 
2.43.0

