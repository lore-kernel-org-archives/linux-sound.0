Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307A1A3164
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 06:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112346; cv=none; b=PKoMaVQ4t47iYZX8NeBib+C/viXZ8lKheiqAuRBysY5pUSh2tGFD5UhexU5FglU8zag02wwlli1/UStMmOPlC57P+tJsM1o6DDuddfZW6F6Mh0HA4PfAJTbUPw4Ps2xOCFtg59HKrR4gM2OoVGQgQ4Ui0xoRS2TXmQM6grcbR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112346; c=relaxed/simple;
	bh=4M6KhqXO21kbnKtl+kv/lzedBxSqDIZwPee+upoqlI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuVyqpZSd+SfYECwNizvnladvptq1u+shBllqARw1ESlXUyY/uoT6VuhDKBGwmKX0NvSgN34TrJEMr7Zujouo6Xl3cDbAZl6el86N4QS5Is8jRkbXgrDE9fYVKai2bH+TiajgVF2EhYF6v0RnT6L7NB0U7OweR5VRn6posmqj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwsKoef3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwsKoef3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775112345; x=1806648345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4M6KhqXO21kbnKtl+kv/lzedBxSqDIZwPee+upoqlI8=;
  b=YwsKoef3v/coteapt2xLfW5+8pOJqesEF01LqrqmSUeMBbpmo7BMT0aC
   buUc9ILJRsa25jyfyY46Ifa/hzReGStW6xdZlwNsaa3CxaOkS50azqvsa
   3p1xkaMaLBsgqvEfccNGo7WCv0zgtuGSRQkb59ObJ0KOpt8kwYn3K+d9i
   vF0E2bIioRZj6cOBnf72ziP2+0RB/gHymFPc/LJ4LxVoc3jbO1gzzidpm
   eVwEyeOwAP5jEP63q2ZW3h0svolJvNBncRa94fvbkBideoQmBlZU/iGkT
   ekKs424RW2xBo4H314f0WHh233IgqGqnBeYNYf/ur2xJn7gjoteW4pY6B
   g==;
X-CSE-ConnectionGUID: alK0VHxYSiuCv2nNsqvfsQ==
X-CSE-MsgGUID: ERVx1jmRT6+H4gg7mwpIvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63715022"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="63715022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:44 -0700
X-CSE-ConnectionGUID: 7RPdDYzPSey9Y8B3fMHJuA==
X-CSE-MsgGUID: epO68R/qQeq5PIZEzwpLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226059154"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mstrozek@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: Fixes for find_acpi_adr_device() when some endpoints are missing
Date: Thu,  2 Apr 2026 14:45:29 +0800
Message-ID: <20260402064531.2287261-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make sure find_acpi_adr_device can work well when some of the
endpoints are missing and do not map 1:1 to codec_info_list.

Maciej Strozek (2):
  ASoC: SOF: Intel: Fix endpoint index if endpoints are missing
  ASoC: SOF: Intel: fix iteration in is_endpoint_present()

 sound/soc/sof/intel/hda.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.43.0

