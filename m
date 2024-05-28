Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072BC14E2C8
	for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924595; cv=none; b=gGbqRRYYRNFR/EjT8zQdShQctisT0X9udDeUJb7IKB//kpHj5JHqTH/u/DIA41WvKo99l+IoYDLIZNsw6sFS0ABIC0bPDwY0LFo7BhF+r2GOKn7O5/KXd313Mm1zGt+ND9V1KW4TZpf0zbhulGV/YPZCYVG7OZR+yqwSMdQimnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924595; c=relaxed/simple;
	bh=4ERwcxQsvUfNv1qgUK6eoCOJi5v1+dTD+vRdxYfmqls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pT7HUoAV0bMqz4zeboQ+NVp0cg6Va25QI1NHj3VKBXNkaIa7DNeLQa2VOVuD7w/SGqv9THxB+5LwGL8zb09uYptwnTAxZ0hxt0uJEvgCwMY9csneGwXHXeHCSQWPi9tcGLDnkI+pevByXVayZIy7WJ6pvSCsJdnsRwPQbm5J3lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOBrNBRv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOBrNBRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924593; x=1748460593;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4ERwcxQsvUfNv1qgUK6eoCOJi5v1+dTD+vRdxYfmqls=;
  b=TOBrNBRvDlZ7DCCkFJQm+/WSLm+yYBVX1PaobPnr/3NEfJFfYkLUDvp9
   R6NMnezLTc1TAcVEj0bqkTfvrKYFpuUAe52CKr5nCsLaVG8qqlJjHq4TB
   +cRKnNUUoRyRjWrXnszHBSF17S+blOYL9f0UQFHtOz6xu5rzkBM+n5qlM
   BG5U7/yPOJmzz8L4INjYyBa7ixzufDTE825CD5JEgfXSOVdL0zzdHzads
   DqIYwAL7oWprwW5NbgGIkSM8yWjcTxVniXpdeN+xScNJOtGU6/N7oUdxZ
   cIhcwHFCNYaVkg3NgAEMo8aMOidUY4lOlXCqP/2+q80J3g1Qv0fI2V9pB
   w==;
X-CSE-ConnectionGUID: KOrWq/ljShidgI21ONgUjg==
X-CSE-MsgGUID: 1a1qfybITJqCkLGLsGNnpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24711833"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="24711833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:29:52 -0700
X-CSE-ConnectionGUID: qzfW3SnHSfGbj7LOEBqI4w==
X-CSE-MsgGUID: DJY626KCTJu6p6jlLXTKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35246716"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:29:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ACPI/ALSA/soundwire: add acpi_get_local_u64_address() helper
Date: Tue, 28 May 2024 14:29:32 -0500
Message-ID: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
extension where the native 64-bits are used. This patchset suggests a
new helper, acpi_get_local_address() may be renamed if desired in a
folow-up patch.

The path of least resistance would be to merge this patchset in the
ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
Device Class) that depend on the new helper.

Pierre-Louis Bossart (3):
  ACPI: utils: introduce acpi_get_local_u64_address()
  soundwire: slave: simplify code with acpi_get_local_u64_address()
  ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()

 drivers/acpi/utils.c       | 22 ++++++++++++++++------
 drivers/soundwire/slave.c  | 13 ++++---------
 include/linux/acpi.h       |  1 +
 sound/hda/intel-sdw-acpi.c |  6 +++---
 4 files changed, 24 insertions(+), 18 deletions(-)

-- 
2.43.0

