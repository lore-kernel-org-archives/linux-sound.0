Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E42420010C
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623000; cv=none; b=rh+vzGRz0wtnyrlIljaxkrwiJt7KS+k2763emjjRtuIXT0KflJ063hVNzYhXUt0Ec9sDNfoum6jd6qxGhlTJNO+6zDHgyDGG/UbIkHJEr6XZP2BSoOc5mP3jQC+J/ye6z0I1zoo3F0RlrBtj0Xub80tOfODhilSisyFnr6Nt0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623000; c=relaxed/simple;
	bh=e2puF5tEv38I+62V0YpOfpTvLRUYX+Xzv89N5c8ESrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9qCg5viZBNK/hATQ7+4tuz0TjsGZIsM2TGBRjcG6MSAEiDUPDHwxUWXKhBWFGy6ZixJxy40jsN+0QrZXiXdWgdpWEKIA/jWCIxd79KZaBIiNidXED0QvzqoLds5mndLlskxjkINPYeuExICvTH8WQJtIMaLsyi0Skt8eFMa6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZzvOppN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZzvOppN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773623000; x=1805159000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e2puF5tEv38I+62V0YpOfpTvLRUYX+Xzv89N5c8ESrA=;
  b=BZzvOppNoNotZqp1thIFYVXlDkKZ5gqp2keeXiFmLsmOpzC8akIsAkCj
   gUGm+apXQIkGBKJgvpInq3IQYgjDpC/0msdvfCC7GeiZlwiwOg8NkmJfc
   nNvJW41gt2qzezZymUVPztonvBBwZtUdcuraoWGxSplmEPCuTqwiKQxDg
   Ib02lhRClxDC/0/ERh2FKz6lv2uaW6ePGWn+iT5f55QpNy3keFSKsAk9a
   qCDlJVPb7UBc6iTkTuILSOD5NRwI/lNNFMoHUzY+MY4DfO2ZlwIIAZ5af
   dJxzyFhu7Fn+DrUvMrcrbX7KXBYfGNq0KolQRr3fvEKt/ZT3qLcxDhPAc
   A==;
X-CSE-ConnectionGUID: 2CXHqSxUQJ+4pSfNuFmjDw==
X-CSE-MsgGUID: u5y/l/hoSeaFaw3eTmqUHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78486092"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78486092"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:03:19 -0700
X-CSE-ConnectionGUID: Ei3WAowgTey4Y+iff6ZyUw==
X-CSE-MsgGUID: T9YrtQFBSoCp734V8frx7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="244794697"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:03:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: soc_sdw_utils: remove snd_soc_sdca codec name index
Date: Mon, 16 Mar 2026 09:03:06 +0800
Message-ID: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The index could change if any endpoint is not present. Remove the index
and let the machine driver get the right codec name from the registered
components.

Bard Liao (2):
  ASoC: soc_sdw_utils: remove cs42l45 SmartMic codec name index
  ASoC: soc_sdw_utils: remove codec name index of snd_soc_sdca codecs

 sound/soc/sdw_utils/soc_sdw_utils.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.43.0

