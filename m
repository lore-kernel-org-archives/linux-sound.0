Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8D3C099
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 06:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725602560; cv=none; b=VsPP3PM0Rq/r7FFopwI3bLHNp8Gnc9o9yz9G1PBf++Jqjxzmx5m0Z586hx+BTM2qhVCmEqdEoYzuzOKge65acm/xOmB5uA6TV4nKCwEdQWQxd1C8KmQHP0VGUEeyGfyTYAPjHhngUH4Bgunt3KqPP7flBvUT/i+LTZ2sl1WJ2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725602560; c=relaxed/simple;
	bh=ZnyTTyKOw3sYiAtenDcXPF5UvxrtoUInfIqMOPBIjqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzRgv+YabscgnRPjqU+VfCwffDqys3m/BWNcxD2Y9UWVZVZGZj+efcasow1KyjBnMo7KAjQZAKJmDqSl7EZA10h5j68r/pd2CA8FYXF3QudUlY6u4/35gamrcRYb/8jHRxbQt9PwBRQEQIlQpPZpZ5VxUseQb36TW3npxW6+Zeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+eTePuI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+eTePuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725602558; x=1757138558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZnyTTyKOw3sYiAtenDcXPF5UvxrtoUInfIqMOPBIjqY=;
  b=Q+eTePuIaoscfFdpkKUj0AhH8ugH4+nUTcb1+Fn2aftNo/p0v1v3CTw8
   KFCB/xPgauzt+7BhLYhPQ2C39URVN0WhptVKyalPC1iArAg6gEn7UKQ0w
   VpFvLc/m3/oWlV11cOqM7KReJj3VOvfKEU+aTxwUYHXLE9MlF0Io6H7AD
   RDgqmTsw3PQJ5xR3Ry+8M6PGQlMLZdJIFK3vAEXuU9SXSzhfaqpv5Evw/
   tkRgN7B9oVqOzQGZ87v8wWD4OpS883j8Tv1NIMkQ0hisFsbZh9tMFd0wC
   FC1unXTDccMfoXf3CfVdFi5lRbUos/cMwhwa55WYta01XvZ8c/61ytCdl
   w==;
X-CSE-ConnectionGUID: E0mMoCsQTyGNW9z6t67lLg==
X-CSE-MsgGUID: cICEmeZpTziRz9Li5jS1aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49764794"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="49764794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:02:36 -0700
X-CSE-ConnectionGUID: RTSyTPN1RBmwAbmpHW75wQ==
X-CSE-MsgGUID: ikCLTO2uRamzv1BR+PuygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65902214"
Received: from yungchua-ws.ostc.intel.com (HELO yungchua-ws.intel.com) ([10.54.69.90])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:02:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi-intel-lnl-match: add missing empty item
Date: Fri,  6 Sep 2024 06:02:23 +0000
Message-Id: <20240906060224.2241212-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
References: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
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

Fixes: dd3bd9dc4708 ("ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 only support")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 2522e6f11749..3c4e0c7ca8ee 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -267,6 +267,7 @@ static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0[] = {
 		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
 		.adr_d = cs42l43_0_adr,
 	},
+	{}
 };
 
 static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0_cs35l56_l3[] = {
-- 
2.34.1

