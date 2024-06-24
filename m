Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C7213B58A
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231096; cv=none; b=G0fO4ooMOR0TzGHpQGBqjt6f+gLFgteuN3Qe60C1YKWfCPepPHYOK2F5x5rT9FM1GscFhC4Sa7ueiz3QXgylO6D4UsHT7VXVC1Pi9i/DRh9cu/V2wFfLFX5f6fFoZlFGEqoDxUdkx1iUFGSgyU+Gqb6mqj7BaVje3/gnLUuWAoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231096; c=relaxed/simple;
	bh=vHfQoMBGTxMfLLJpnpM8vO0EymrfohqvJcIC5wK1quE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fiwLjJulwAf8oAQxPhdyTQUd2/rJfboVQt7ccwcd3fJM7UO/8NuGk6Sgl9u+IswajxurimW+JvEqX63nflagMc7q5hZKCzPPxaG4psjC8gCpY3rh3XsfZzqZ2rhuAeGt+KNug+r042YiroqKRgUc0XSAPG8sxHMSVHMu0Y+2LnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lO6uw4U/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lO6uw4U/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231094; x=1750767094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vHfQoMBGTxMfLLJpnpM8vO0EymrfohqvJcIC5wK1quE=;
  b=lO6uw4U/W63e3PZRRza5y06aXF9RcHJFrJSCLcDhIS/Bmtyz2hIIkEL4
   eGEKR77rAx1bVwZEPvNd2URNPno3PAClg2t90/5ws0g1rJm/Y0/O3hKWq
   J//slafMScJi9bbXuzmpPefbJ9awFptPIaxRyUqtfTJVDHNwwWzlP80GC
   gIU1ZpBW2XXt+qMlY10Vq1xYsAn1k/DLeJbWUxtg5T0uUf8qbBRP0W5Fn
   dPtYemEr7qQTQJO0USgSHY9apSPyFxptlj2t88+QVo8MT10gE7MQzkCw4
   a6HsimF7J+B9lPuIT1HvDXakdsuTGq6UemXBaa8WR3ujqNWMzc8B6FpTP
   w==;
X-CSE-ConnectionGUID: O3cPyOxwTtOd6ud/Cn32Wg==
X-CSE-MsgGUID: rb2l4lHBRVKcwaYjy/LseQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887530"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15887530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:33 -0700
X-CSE-ConnectionGUID: g58QZ+PTRGmQPRc3EeZnkw==
X-CSE-MsgGUID: aFgC8FldQuaxa2TXgO2YIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43091205"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: Intel: boards: updates for 6.11 - part2
Date: Mon, 24 Jun 2024 14:11:15 +0200
Message-ID: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor additions and cleanups this time.

Bard Liao (1):
  ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43

Brent Lu (1):
  ASoC: Intel: maxim-common: add max_98373_get_tx_mask function

Pierre-Louis Bossart (2):
  ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
  ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C

 sound/soc/intel/boards/Kconfig            |  2 +
 sound/soc/intel/boards/sof_maxim_common.c | 56 +++++++++++++++++------
 sound/soc/intel/boards/sof_sdw.c          | 18 ++++++++
 3 files changed, 63 insertions(+), 13 deletions(-)

-- 
2.43.0

