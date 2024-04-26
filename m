Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C3414E2EF
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144906; cv=none; b=DzJya5rh9DKtXtGnkFLYXL8x5EhWr0ZGedWbOBf9unZBLRiie6EHF/4X0QMJEqC4JhO8nznDKpoEO4k8qmHY4SMbA/LMUcKMJm0fvf4q4GdWuEsUsn2rrg6ZWBJF4xoMrExQyGzWqT7l9vM11aVha+HtUouvTktp/tLKvhlM2FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144906; c=relaxed/simple;
	bh=B+qnbfKGxF53UUuVHpaWIUfNY181CpLVuoKVGa7skpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aHlZc0Nf/AicRXAEMZlMv9iOt0SLVGfur8jw6OBAKX0eIc7gZPfa4tAyanaqr74pkKMyIYlIDfjsrwyrkbvs0Cz90ui9BY2As6sP4gR1Wp4EgwrIsmCyCWIrPgpuDpXx1T0FuoFUSFscb3K5WAl/y7b4g4gEhcMQsFR4c6/5Of0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsLemxf8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsLemxf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144905; x=1745680905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B+qnbfKGxF53UUuVHpaWIUfNY181CpLVuoKVGa7skpQ=;
  b=bsLemxf88MMtYl+g7eUbfgg3Vct0hroDcs83693fu2rBQrGIVA9/9sug
   o2LdeVu0+jHGegVJ0R7maYdNT6CgAeIvrt8R9q6FzdRFoCqrbKzuR9DL2
   IJzcAHRUhWh4ZkXg9RRS+7cn3keiHMUla43DGNXLsGY4uEzDnSJ3edH+G
   exDXaIK8N0cHx14fFuL7A9ofMpBbKtCs64likncMd3QKfzKAEPjMl3P6g
   6PiV7oXIVevImzcQB0khfF3gmRWU5qKInjDAGdPzygper1Bb84bkJMwfp
   xwSIb3W2aRt7prxgULXQlEgpHLblGRLwsGS2bgqRWuVKYvUuJocCmZqKC
   g==;
X-CSE-ConnectionGUID: qQJH7nNkREOVzWyT0MJVgQ==
X-CSE-MsgGUID: 4OlmpVKlR6Sq4kUit3PFcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290629"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290629"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:44 -0700
X-CSE-ConnectionGUID: Qp10kG6pT8yVpCgnhl65ig==
X-CSE-MsgGUID: U/5AsQU4SDu6nu5qMrIOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259033"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/12] ASoC: Intel: sof_sdw: add a space before cfg-amp in components
Date: Fri, 26 Apr 2024 10:21:19 -0500
Message-Id: <20240426152123.36284-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

UCM parse amp with Regex " cfg-amp:([0-9]+)". The "ASoC: Intel: sof_sdw:
remove FOUR_SPEAKER quirks" patch removed "cfg-spk:%d " from components
which removed the necessary space as well and cause UCM can't parse the
amp number properly.

Fixes: 744866d28fe6 ("ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b9a5fcb42847..f0622aa1b748 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1983,7 +1983,7 @@ static int mc_probe(struct platform_device *pdev)
 		amp_num += codec_info_list[i].amp_num;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "cfg-amp:%d", amp_num);
+					  " cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
-- 
2.40.1

