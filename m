Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F02F852
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319653; cv=none; b=D/O/bGybg7aYElsa6SOSEIsPKmLKBCspAZov0alqF/FTfJ2pD+g4QWLTam63KhraIfS5a7qyM8mvaLkpNr8qr4PfZDIMBaxUfeBmVbRNbs1MkVKJWx2J8KBfsKGSBLvl0z5Y4tsD20ulCWn7jqAIktuYwuwyvcF5HCuzRiPQbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319653; c=relaxed/simple;
	bh=IehKtDLA+RNh1RvQFNaLDWdTXm0d7NA9nwCzrDoIswE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUiagb+59AmIqvibRlHZTqe2GNODkaSymkairyP12TyxcQGwDD2NofQuXStXRc8jWuvvtkgzEI7nbNVDhVMiPUS7yLbToloZ+o1Vt7PMZb2KVyGF0jYa/zjjkXHuwJJrjoN0pvG7g4GkYzKxJUqsKQS9bYA4WJ0K1+ztzX4iSQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bH7+UvyF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bH7+UvyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319651; x=1765855651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IehKtDLA+RNh1RvQFNaLDWdTXm0d7NA9nwCzrDoIswE=;
  b=bH7+UvyFGZmbHXik6ahV6Gon84TbdbCkk4/QYhtyRy5oZY0VvYN9ts4Z
   Ca3BfgH77gUZddd71oer/izM1b55WcMNrM19fxMdE2lQ66OfuUirKJJtB
   Kx+zVWTL73isZ3TMox5nms/Onso5fUGlKOBHdWaRvfbTRhCYvFN+FTzXE
   AH7JR+UVjquEnNZIcDBYNdD6mR0YWDPXCmrgAfY7+k8DiBc8sAWsIf51S
   KM9qnUhdx7DAXFJ0fFbeDF7wF0wwlJp2pZype/2G5V49U5J2o/U35RzAz
   F6dVEA9EtiUw2sPvjz5TStKUDOpluO2NsKqREGHVdK8uhc1WH+Ohqq2zD
   Q==;
X-CSE-ConnectionGUID: gr/K8X76SAWya7WjrsDIOQ==
X-CSE-MsgGUID: W+p7WetoSH+z04gWPVvxRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34606086"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34606086"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:31 -0800
X-CSE-ConnectionGUID: x/IKxp3RRUWT8MSKflo5HA==
X-CSE-MsgGUID: FCCcHbYGRyyeoMpdj33gOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102100012"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:29 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/3] ASoC: Intel: Add matches for Cirrus Logic CDB35L56 boards
Date: Mon, 16 Dec 2024 11:27:18 +0800
Message-ID: <20241216032721.131227-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds TGL and MTL matches for configurations using the
Cirrus Logic CDB35L56-EIGHT-C board.

Richard Fitzgerald (3):
  ASoC: Intel: tgl-match: Add entries for CS35L56 on CDB35L56-EIGHT-C
  ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C with aggregated speakers
  ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C 8x CS35L56 without
    CS42L43

 .../intel/common/soc-acpi-intel-mtl-match.c   | 213 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 194 ++++++++++++++++
 2 files changed, 407 insertions(+)

-- 
2.43.0

