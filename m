Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EAC70CC2
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405114; cv=none; b=tFyMesiKKbHcj86vueuhywV7FpFyXoBv6K+OmwiES+N6uHFcqNyaip8+gtQYxXy7RraBWp7U67Sbjpxb3nS+/08c/FLvdX5QNytldE4YsBzUapLMkmiqO1Mq1DnPfMwjGUlwjL88H6eq31gJq5NlWHtLFNe4CChZvNgh6dnBXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405114; c=relaxed/simple;
	bh=LsfXWzcl5OsXzgaN9liYKZEHKQDP9vHjurMHe5iJAkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ihJihGL7F5p6vOf4G3sSFASqnMGolgy/TKCdKqPRC3ykxaJW1O+15VSw3xs3BgmMquRuRlkRoHRYHyXN9gUUrwsck5WDzubnzHEz7laqACsJR64H+hEEL2KK/j7UYQJnSt1ZJJiT9bLHcXFAEz8vYzfI5r7WPh16vaXAy+r5zKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGEeL9jz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGEeL9jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405113; x=1742941113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsfXWzcl5OsXzgaN9liYKZEHKQDP9vHjurMHe5iJAkY=;
  b=QGEeL9jzGXweeE63EetmFH28G7b/Ni5hlmb5/bEKOeuKrmWGODY7kC3d
   4yzWON3eAwlSPRf9/lfpw0QhuIHkUY9uWAyrAikiaS5+mXcCDHnhyZVd+
   94ahwXtBSZgckyfN3iTGH4PTM4dgvHWiTdEp+W24Yrz4gFo6VUR7AaZqb
   tvbwuVSNN+dZYwlbUYk+9zBVCOaZZvwW+nH16RIf2hmiJMqltOKGkhQb3
   efstTFZq8uHlAYZHFZY+ouUZ6EQ/GPtz3N2+i6lL9GF6aFCUPS1DwVJlu
   rZWUYMXIRoDuTYejq5/oVXaFu1KgEsrxDyNrFCU4T1BRodu44o2cKEpQB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300366"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6300366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="20309642"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>
Subject: [PATCH 1/6] ASoC: rt5682-sdw: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:12 -0500
Message-Id: <20240325221817.206465-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The disable_irq_lock protects the 'disable_irq' value, we need to lock
before testing it.

Fixes: 02fb23d72720 ("ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index e67c2e19cb1a..1fdbef5fd6cb 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -763,12 +763,12 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt5682->disable_irq_lock);
 		if (rt5682->disable_irq == true) {
-			mutex_lock(&rt5682->disable_irq_lock);
 			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
 			rt5682->disable_irq = false;
-			mutex_unlock(&rt5682->disable_irq_lock);
 		}
+		mutex_unlock(&rt5682->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

