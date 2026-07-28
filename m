Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A23AA9D8;
	Tue, 28 Jul 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242811; cv=none; b=nwlhWym98+2e6kPPg66m+frdV0rq6yd8s9Y2cjqCfVklsScKEa4wRiAca2ocu2w83ak1qGcNCOICVG548eqccQ+feUYEX73NLpkYTPsGCPENfX/ZAd20BhdPZ/PzpVs0wmfhuY5Sjj4LNvgGbx4cCXsYBim4EfyajwPS9Yu0yrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242811; c=relaxed/simple;
	bh=GxmbrJ0PqYuqnBSUuSgcvdWmxqzfrNbZS/935D+1KVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=shWimiTUqQ6RpH2Fn2euGvFP+P3usz8xZ5NWORqrmSJm9PePCFfxWSglkVk6letbIkkh0Ty0HgSwKyPd8stBeXvjXat5V5YXCYEqCkPCQk4U6JlDyDKYD7jL12+ho5bzIBBZ4jSf0kKo5YCOaqyVcIoQ4K4SzRi/KCPk7Rds8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fS2aS3F/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fS2aS3F/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785242810; x=1816778810;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GxmbrJ0PqYuqnBSUuSgcvdWmxqzfrNbZS/935D+1KVQ=;
  b=fS2aS3F/ZU2g4linErVZZfo+KypvRM9LyoBDFx3oXFqZdJyDdXEPzoBS
   Q90GHVFsg8Oacli8KGYng3cQPqvRXJx4mWBVFbuVhVyMBZDdyZ1QsNAWA
   3vfwsJ/zIamY7WYRSm8wUULw+gZ/nYaez26K9OHOO9+G02BcAblEZkllD
   wq1XgK9Jlyz8Woudx1PKbDCq2+HkTtv/pwqdapEvVcoXB2iU2PGYAwBm6
   1bqkbo6Aa5CtKFHr+tj52Yif0GJeb6RLLO2e6eeoDIgz6ye4RtGzzwM7G
   mDBgVGipYlLIU3Gs1biItMBexk9+wsCdbqLYHO4Tc8soXZ194+EHfF9eH
   A==;
X-CSE-ConnectionGUID: NDZe27FxQQKs7ovLOvjnYA==
X-CSE-MsgGUID: +ENTeccpTGiJ/hA3z+vKWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88361237"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="88361237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:49 -0700
X-CSE-ConnectionGUID: V6idg3b1QCCkjzIHAFMpZg==
X-CSE-MsgGUID: LT7IrHaDTHCcnPIb3Zg/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264695487"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:46:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND 0/5] soundwire: add BRA properties
Date: Tue, 28 Jul 2026 20:46:34 +0800
Message-ID: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds mipi-sdw-bra-mode-max-data-per-frame and
mipi-sdw-bra-mode-block-alignment properties support and fixes the
BRA_NumBytes[8] support in cadence_master driver.

Bard Liao (4):
  soundwire: cadence_master: add BRA_NumBytes[8] support
  soundwire: intel: handle Peripheral bra_block_alignment
  soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
  soundwire: intel_ace2x: handle the max_data_per_frame property

Richard Fitzgerald (1):
  soundwire: Add bra_block_alignment property support

 drivers/soundwire/cadence_master.c | 35 +++++++++++++++++++++++++-----
 drivers/soundwire/cadence_master.h |  1 +
 drivers/soundwire/intel_ace2x.c    | 20 +++++++++++++++--
 drivers/soundwire/mipi_disco.c     |  6 +++++
 include/linux/soundwire/sdw.h      | 14 ++++++++++++
 5 files changed, 68 insertions(+), 8 deletions(-)

-- 
2.43.0

