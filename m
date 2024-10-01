Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E111991A3
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727763473; cv=none; b=HeUeU+NJkjkkvj7l0DYsPmQBzjke8jeiH28vPVoso2tvjo9jgQvE+QLcI0W4z7KhkZVF2Y2FaSQ3RD2OL5kiR8NwQTqdc6WuDv9nNjKH55agq0VgYAKgGNVfVJIIOuly51hJ8cWDxTslJE8+4sjsdGKcJ/ufru47cSt+pPLsQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727763473; c=relaxed/simple;
	bh=BikwRW/FfgDZEVbA+5MVlV5/GmWxbzofZSkbXzqsCVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MN5msbal0IIb/JT0d6Kqwoh0PkwiZIf+Bc/5WGFT8nbM9cjOnG0ESKlBYclWrk5XX/vnCs+rIbUbVbrYsTl2nJnc06w+QV3u/Vj7oMCtXXlQ3XGmQyMUl7REudqnYLpCb1S23kiDLpWAk7v5fohRDNyowW8QkZG85xsmXNUZsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm8PeeOx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm8PeeOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727763471; x=1759299471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BikwRW/FfgDZEVbA+5MVlV5/GmWxbzofZSkbXzqsCVI=;
  b=Vm8PeeOxCp9cW2ianQdTMRNwtekz0wbBwun3W/l0eRSeUOt3lXnuuDcA
   zQjh4x0rg88GQi+l2YosqFxcuA/Hj3Q3qXmWsOWIUVrr5KCif3sre3JF3
   R0ArMRV/ACWU/3LVNwgtKcyEmFHKb30jHC1w983eTc4j9Ytj1wo+r6F3j
   WByspWzqra7JCLoBafv7QavNXA1goIjQd/ObGugJWVmiebLJrFkdhg8ev
   kmiCzvQkHGzms/OlG+V1E0XE0HaL7m6JMyiiP8VfKB+daqa6NJsNpEzmW
   PUBe3AszlhPFepNlb8xDlZmSnZViLkutwssjKDjIe+UzX9PrVDfh6Avd9
   w==;
X-CSE-ConnectionGUID: RekTLV2VSzaECEolqQ3JBA==
X-CSE-MsgGUID: +Ca3vC7xQ+qrS1pVptGzKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30762009"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30762009"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 23:17:50 -0700
X-CSE-ConnectionGUID: xgxETWiURvOu3d4dDx/jkQ==
X-CSE-MsgGUID: cCXzpQ7oQwOi8xJDcy8wog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73509307"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 23:17:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi: Fix missing empty terminators
Date: Tue,  1 Oct 2024 14:17:36 +0800
Message-ID: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Bard Liao (1):
  ASoC: Intel: soc-acpi-intel-rpl-match: add missing empty item

Charles Keepax (1):
  ASoC: Intel: soc-acpi: arl: Fix some missing empty terminators

 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 2 ++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 1 +
 2 files changed, 3 insertions(+)

-- 
2.43.0

