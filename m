Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D9205E0F
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358115; cv=none; b=RrL5m15GoAveBEyTHuY9sdly7quMAilcand0sqBXUYDw123EwY2MxMgIqd4ReD1cR56pe6YTEwRcX3CILyg200TBUIYI1TS9b2xyvvGFmI2IL2TaPYKgBm+F1kUaPtNA7Ubi/vXIvKCrtnr+WdN9MTkzL56Nxl73FfRTCMVKlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358115; c=relaxed/simple;
	bh=Y/MjXM8GZQbZ0tA0u6kcyHv4eKnoVc5qHZ1qnVqvvJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mk4oqifO2UZNBhFB76/0DDwu5CGZgjK4TB8SsUC9agxHgHN1+/w5R1LLD60uVt3ciLJ0npEg7eid3TpLJv2JiNzXzEA5OzSfiX8L9mFkGwkUQn+ICGpM5kNzhz6RCI8w1oz8XaSqXtoInFoAsze8JF/ja6zZ5ukgLT21OTzVIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDINuyrH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDINuyrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734358114; x=1765894114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y/MjXM8GZQbZ0tA0u6kcyHv4eKnoVc5qHZ1qnVqvvJU=;
  b=MDINuyrHS6K/RS5K0hKPSu2HIgsg/19vAK8DCJFa4H07QUqjze6a1b4P
   FGHTOXvWUTMq1M53g9PQT7FL5F6aXwv1MAYI9zpvEXKjYE6ndgRJFejjb
   n4G0+JUJAyyOyCmu/WZ1Q8ESANympY6XFTTNh0NjeD4hQUZ69GN7MsoS1
   7M5je7xc/Rw866PhSEHmpDo5kQVr0EMuJrsPsxxXVDCRkIQuMeo3WHdVO
   trs2cj8w75mjb5QcYzLaML2PtXKueUtsePCSjqE88n5xQ3YH8XV5WDgtM
   SKs9ForLX3p66LKy7Qy6zuTawqQNOAnprYcPpNCwYTWKt8+0lWevC1973
   w==;
X-CSE-ConnectionGUID: JPNkRHPxSUWs5O7kt2HdBA==
X-CSE-MsgGUID: WmsWLMQjSEq+LYQnFaUa+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34063283"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34063283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:08:33 -0800
X-CSE-ConnectionGUID: tQ14fWbbR+21sLwsuvkuSA==
X-CSE-MsgGUID: RRV+xBNaQoS5pcPvsE9gcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97446892"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:08:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 0/2] ASoC: Intel: sof_sdw: Update DMI matches for Lenovo models with SSIDs 233b, 233c
Date: Mon, 16 Dec 2024 22:08:19 +0800
Message-ID: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMI match information for these models has changed so the match
entries need updates.

v2:
 - Correct the commit id of the Fixes tag.

Richard Fitzgerald (2):
  ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
  ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB

 sound/soc/intel/boards/sof_sdw.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0

