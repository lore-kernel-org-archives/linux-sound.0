Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29B3C099
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725602558; cv=none; b=Bsad86SJWAmHtflmKeKQO+gFrhqFnkGw1hJYlTDto1YnQdZfdCwtj94ou03+C8Xczq7qzw6Iqr3p4XGwBhI0pemDmLphMB1pToAImyPhUYEccOYNdZr8k6z5A3GlNx+Uswg1+1GtIWUzS35APM4wOIzD6/zVTS7bLJdREDOiFsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725602558; c=relaxed/simple;
	bh=LRtWzHoxa5lSb8FGeDE4zWYYXxr8cHOyFpBaXCQ/quU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=D7TIh2F4h+NEgvYo2JVyrz8NBkbFimdIwi1seTwaubNl0YMSuIUfEZK9eSHJ1jQPF+zdIYxM4qILWFJ5gB5eucPYz9yUIg5jAPe8P8g9aVTyVDuOTSPs0d000Nf6Z5fAJAnSNmG9uPYWz3cbkpKXgyixApdGpCuloO2psXSUJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZy89k3k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZy89k3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725602556; x=1757138556;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LRtWzHoxa5lSb8FGeDE4zWYYXxr8cHOyFpBaXCQ/quU=;
  b=MZy89k3k0cR6Bs+VHRhbn5UR4xPKTv91vjs+iemzPCysjwlABwd+jkF4
   vCXdowe5Qir1NnSOcM9ZnMHJ/et2WVJmGtYc7p8A/WMaiFPucug0jy5OZ
   7XfMfASid0ek3oRAwENK4jjqPnmGwrnh+DsMkb05TKLOeYwKXRCeCOFsU
   k9BYEHY5q+UGaXlsYy+QCwHGfQtWKM/XTgDKqoTAOLjsusQP779uP7ihA
   +1xSqEGfcsTg6SJW1bNVi+1Su32qEpCc7bNfqOlKjUnRro4I/U+GEdHaV
   tXF3uv3qgC8bwNEqs1HGhDHObBhqZwMmnT3vgqqA4C0qrcAOySFmZyfb5
   g==;
X-CSE-ConnectionGUID: dPc3gbLlTbiGUXfky6DCiQ==
X-CSE-MsgGUID: r6/5ejjjSKWbAcGpTKtoOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49764790"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="49764790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:02:36 -0700
X-CSE-ConnectionGUID: h5D3+bSqTb2Rk3LkSHGAtA==
X-CSE-MsgGUID: RB4pHBzgQkWJdJEskLVKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65902211"
Received: from yungchua-ws.ostc.intel.com (HELO yungchua-ws.intel.com) ([10.54.69.90])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:02:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-lnl/mtl-match: add missing empty item
Date: Fri,  6 Sep 2024 06:02:22 +0000
Message-Id: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no links_num in struct snd_soc_acpi_mach {}, and we test
!link->num_adr as a condition to end the loop in hda_sdw_machine_select().
So an empty item in struct snd_soc_acpi_link_adr array is required.

Bard Liao (2):
  ASoC: Intel: soc-acpi-intel-lnl-match: add missing empty item
  ASoC: Intel: soc-acpi-intel-mtl-match: add missing empty item

 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 1 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1

