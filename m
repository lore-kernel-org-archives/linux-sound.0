Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33E3EE1F6
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993835; cv=none; b=m9PRLNEzrGsi2sujMp/r0FRPNRyjGG48dxuIoAmMBbTU09XkY7YsfZn5xMYbZac51hFGbD4uSMmH6w5okE+VszrwnYa/tSAPhM3bU1fYpJhTUVpgSlfzAeblZQ6v4ZqcbEmQFbm4W5zGU8jZVOueAGOLF2DtZvCp6NjO6BIPy5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993835; c=relaxed/simple;
	bh=ulFiS+uxq1jUcroAqoQgN0YZJut4XLWAYBUq1gB4/rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=irCNBICXTmXE+psvoPPUFYx3JX8IK3tw3F+SK2wzm6QGL/7Xw3VK6MBl7F5OjmcHqA8Frc29LYVPHgK/27Ti0xbKLKkXa+4ZcubA0eV07bo/kEt2wtYUr1oNJgMN4O5XscsBT1rqzlD24/dCpUhO2fNJ4GLkgRZT7/BPLX+GH7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIvmZnHE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIvmZnHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780993834; x=1812529834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ulFiS+uxq1jUcroAqoQgN0YZJut4XLWAYBUq1gB4/rc=;
  b=nIvmZnHE/FgZpXlI9JjHApm6SF732s8ue561xDZaGfieSlDnVQdhxQ9f
   7c5HijtXlvajfDFHNhPNDGMGvrofN5S75PsolouBvMHlys6LgmBN0ztbn
   HUfBCh+58jJlOIMge8qOav+sKqNrQCq6CZ7QVLv18G3+J/ddBKM8DBXvi
   xrd1QiQ5ogBkQzbXgZuBW3Y5D22v16sA1EdzSTE/sTSj0MQghOsdIoAp2
   h03S8HBoD4SPKS6L16bLMZKQeALbb3qRQi8GOFegeVlW3HKSvkwmmVShK
   ZCu1AvQsU2hvqeY0Om9omEYqAyo5SwbTW15igCavE+nU1+gkSD7ST3UkO
   w==;
X-CSE-ConnectionGUID: FhR5w5xvTIWQFl6au2Zspw==
X-CSE-MsgGUID: iJaAGtJaQ360/Wh80/eYRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81600384"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81600384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:30:34 -0700
X-CSE-ConnectionGUID: tEpO95RnQCS0uUhGZEsYzA==
X-CSE-MsgGUID: fVRtcrGrSKuZKRBDm1m8+w==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.253])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:30:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/6] ASoC: SOF: ipc3/ipc4-control: harden kcontrol payload handling
Date: Tue,  9 Jun 2026 11:30:35 +0300
Message-ID: <20260609083041.29093-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series hardens SOF kcontrol data paths for both IPC3 and IPC4 by
fixing size-handling bugs in put/get/update flows and tightening bounds
checks around firmware/user-provided payload lengths.

The changes include:

Fix TOCTOU-style size misuse in IPC3/IPC4 bytes put paths by validating and
using the incoming payload size.
Add notification/update payload size validation before parsing control data.
Use overflow-checked arithmetic when computing expected IPC3 control sizes.
Ensure update/copy bounds are validated against actual allocation limits.
Fix IPC3 bytes_ext bounds checks to account for struct header offset, closing
a heap overflow/over-read issue from unprivileged userspace TLV access.
Overall, the series makes control payload processing robust against malformed or
inconsistent sizes and prevents out-of-bounds accesses.

Regards,
Peter
---
Peter Ujfalusi (6):
  ASoC: SOF: ipc4-control: Fix TOCTOU in sof_ipc4_bytes_put
  ASoC: SOF: ipc4-control: Validate notification payload size
  ASoC: SOF: ipc3-control: Use overflow checks in control_update size
    calc
  ASoC: SOF: ipc3-control: Validate size in snd_sof_update_control
  ASoC: SOF: ipc3-control: Fix TOCTOU in bytes_put and bytes_get
  ASoC: SOF: ipc3-control: Fix heap overflow in bytes_ext put/get

 sound/soc/sof/ipc3-control.c | 79 +++++++++++++++++++++++++++---------
 sound/soc/sof/ipc4-control.c | 34 ++++++++++++++--
 2 files changed, 90 insertions(+), 23 deletions(-)

-- 
2.54.0

