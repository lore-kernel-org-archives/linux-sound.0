Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A2301468;
	Wed, 25 Mar 2026 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438929; cv=none; b=X2IrsNEqdT6+BJWSi8TmP3Ff0M3WoMOK5Jq/Exf49Z1CCAw0fCu/ebV8VlDCJNIuVDyTrSCST54OXshKDQcgNV8NANxoLvQbGV3OOVq9Iq4pTTTWlShGjLyj9HDbJxlThTIyTDTNVhBG2D5FmJm7+0N/G8KCietFjBsbCNL4vxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438929; c=relaxed/simple;
	bh=GynvA9uUHXUuiYWG+A3PxDwF6gugwPOMtCdq5bZhtMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dN86dlVbSDH7Lp+4P94hz939HXOLT5uy1sC9aNJBXDZmsfnkBrh3t+LCya5F5z2f1tbpyjz/0DUPYVNOhIx6tK0M4Orqx2XWoRGcrUB8F1g/j1xydwNiPPj0TIybwNnK0YVItH02bVY1jStvqyyk3m2Sg/zUxwk1TSCHq580Mc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXv5ntk1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXv5ntk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774438928; x=1805974928;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GynvA9uUHXUuiYWG+A3PxDwF6gugwPOMtCdq5bZhtMI=;
  b=SXv5ntk1FlvebPStVR0BXbqNGS/hzgY2j9TdNqGOoQaznv1jJOWAASDt
   E+tPn7JqI4Etxc0vE46n/fok8438bGlQDmDm5rDamqolqyopCL3rm+wA9
   PbQUe2//23XV2XyE2O4/+li/W9QwMH1x0iCw/UgW+J1/CF9QJH346nIR8
   E8ZOFjySkEaD3z+aAQLTj8uPQ3J3R2DHDIv24+RLcChmgFQQxPrY8xmr2
   KE9AZJiHcMKmGR9B/u7Uk6jJjbjZx2y9f0hsPpZI4emc0qpEL6E1iJUxW
   GAQOlI21+euRWR7arXJOPvcgR/KqB9ilNut/mw7S7j1BEwJoDqeo5k/PO
   w==;
X-CSE-ConnectionGUID: RJMeQ5UfQcmZO1RlmvWWIw==
X-CSE-MsgGUID: O0Ucjn6YQKSNtmAspuLcAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="63020044"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63020044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:42:07 -0700
X-CSE-ConnectionGUID: wPaS1WUJQbOVEPPmckIbeg==
X-CSE-MsgGUID: rbbBPtmKRQy/GpPfhcA6fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220253771"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:42:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/2] soundwire: remove unnecessary scale_index programming
Date: Wed, 25 Mar 2026 19:41:54 +0800
Message-ID: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can skip the unattached Peripherals when programing the scale_index
register. Because the frequency will be set when the Peripheral is
attached. And It is not necessary to program the scale_index if the new
index is the same as the current one.

Bard Liao (2):
  soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a unattached
    Peripheral
  soundwire: record Peripheral scale_index

 drivers/soundwire/bus.c       |  1 +
 drivers/soundwire/stream.c    | 11 +++++++++++
 include/linux/soundwire/sdw.h |  2 ++
 3 files changed, 14 insertions(+)

-- 
2.43.0

