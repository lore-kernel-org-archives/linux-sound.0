Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4EE3A255E
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762855; cv=none; b=pqPRJv9XUmHSkPr4LnceFn8Sof8mWJv8em4kRgIuhxbe4QI8oFeXsUCUr8teG3GyHs4Yi+16b6vSvFwM18Ot/QYhHvyzKFs63q25XTNlWPKUoJ/FE7h8rpXSRQqkO0Yi5YNgxVfsF6IuF4Ce87/JyiYnObiyU99kZTwNkPoE0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762855; c=relaxed/simple;
	bh=t1Lytvz1jhpj44MPWHvEPgXFNTGxQUGw+9a2JES4vm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sEYE8mQngCQZTUe+Fm/Tgs2qsZD0mD75aKr+sozBWIsaOI7g6LuyZ24Ra1OfTFdLasLRQao8JnJc7/Nzxdu38/A420W6I1sXmrZcwJq97Q0m5H2yMxgoLmsWYyJLQuxschnrIrelYwsPqyeCtMd6GYxkNnNJxtbMhDUe/SAuWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODjXTwqd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODjXTwqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776762853; x=1808298853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t1Lytvz1jhpj44MPWHvEPgXFNTGxQUGw+9a2JES4vm8=;
  b=ODjXTwqdTNn7z0wsiKket6etuvlT9CIp0mA+ASWsEe78NKl0wogjTFxD
   Gjy/1UkF2MSWcIm8upuzit0oWHaMARZpNcQUQPhpFZGwTJfZkMFOdZz3V
   IGybp/Vy6YMg6qVhQeRw1vDrK8lrn7lRmeW8oBzlFUhqyXIqMgGzZkdai
   ekko2ANgoxpxhP/Uugf5e0iiOaeX13w2aqJ1xTuPN+MIdj7lQ6DdW+8Pq
   7pb6YdG49oZWpbYKcbcHA0J6VDF6sTuGSfObu7LikLSas09KLv/pFn/dY
   IEATokFi93PmXiYBcnnzicW5WsuL7o75TZ6djnMMzxLQV5eEyd9OnoLMn
   g==;
X-CSE-ConnectionGUID: +167jRH8Qz6J9YrZJ0/7sg==
X-CSE-MsgGUID: rdzR/wU+SbSK1pmg1KP+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88308965"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88308965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:14:13 -0700
X-CSE-ConnectionGUID: 2lt4IARaRBaRXL5yV5ZQpw==
X-CSE-MsgGUID: +taAibn0R763Y5rI/P8bLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255254623"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:14:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v3 0/2] ASoC: SOF: topology: allow user to add topologies
Date: Tue, 21 Apr 2026 17:13:49 +0800
Message-ID: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a module parameter array to allow users to load specific
feature topologies.

v2: add a out of memory check.
v3: fix the module description.

Bard Liao (2):
  ASoC: sof-function-topology-lib: add virtual loop dai support
  ASoC: SOF: topology: allow user to add topologies

 .../intel/common/sof-function-topology-lib.c  | 11 +++-
 sound/soc/sof/topology.c                      | 55 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.43.0

