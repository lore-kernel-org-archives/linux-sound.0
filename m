Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B16525EF9A
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476247; cv=none; b=P27br8qozT0gWqkzHIGaUpdRvxdk11cqSFMVmHidXlbl0n+p1opcqf8XHwiXY0x3vpBX7yr9/9+fKp6nuIqrvxjpeCNdtePdbKd0+0wKfS1gb22vfkOW8fctAqo8/yNZ/YCw6mrICwRRFhhZmkZ5VZPQVX+525FxjNVEyqVIcGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476247; c=relaxed/simple;
	bh=817N/dZbJa0+gFxCENWTTOs1XfTr4j6TpSDvqUNq2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tBvF+Axb6K+0oaZGZTBYEEGNT+4fANskohyazmZjC8DUW0DwXTff60GE5zrfbBUtu9kgCHE8luLQiRS3uyUaNz04HmF4LeKjXfxt/3hty0qbt1HSgWCCov9e1QQfguUwZGpQsGD3kiXe5Ec5wRetafjLAFalQqtzCXG+OBkDj88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6pZuG3o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6pZuG3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740476246; x=1772012246;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=817N/dZbJa0+gFxCENWTTOs1XfTr4j6TpSDvqUNq2yU=;
  b=Y6pZuG3oRmJlmBx2+kcCo9SB5qnQbTNhRuLcS8H+JOrjf6J7QZV9bwF6
   dRIXPJub87/C4lzv34GB8lBut1No4UBpIMu0gbMvP9rXcHwMCwXwZ0OTG
   WVvYQ/oPX+bsIML4dNAJfX/C+2mKABhykf79+KadNhcs67YqMHkJ1lx/N
   m8i1l3UME1H37x8HvQACIpaL0CxMB9bzru5lv3rentieOsdrziXjmmYxT
   HGB4cKWkOTffqIimjiDzZOJcyq7rsn4Gptit9BEv4VxTQ1+Q6b6JOXsUY
   zhhAFUfUWib6I0KyUei/Fgowi+/6QBhek5O7J1DzmyCbfwc4dGPW5MP9J
   A==;
X-CSE-ConnectionGUID: a7SghU44TNGM/tjCSSVlUA==
X-CSE-MsgGUID: UvRX5ZrcSa6d08qVskpS1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40458588"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40458588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:37:25 -0800
X-CSE-ConnectionGUID: 8RqLCoJ6S/S5eHRA7lIM0w==
X-CSE-MsgGUID: eGuCVr5WR5ybv7X+R/ncMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120439329"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.91])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:37:24 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: don't check number of sdw links when set dmic_fixup
Date: Tue, 25 Feb 2025 17:37:14 +0800
Message-ID: <20250225093716.67240-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we assume that the PCH DMIC pins are pin-muxed with SoundWire
links. However, we do see a HW design that use PCH DMIC along with 3
SoundWire links. Remove the check and add warning to let users know that
SoundWire MIC and PCH DMIC are both present and they could overwrite it
with kernel params.

Bard Liao (2):
  ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
  ASoC: Intel: sof_sdw: warn both sdw and pch dmic are used

 sound/soc/intel/boards/sof_sdw.c |  7 +++++++
 sound/soc/sof/intel/hda.c        | 18 ++----------------
 2 files changed, 9 insertions(+), 16 deletions(-)

-- 
2.43.0

