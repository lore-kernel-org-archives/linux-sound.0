Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20DE7353F
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405116; cv=none; b=PfoRFoeHhTZGKFzan8tXceA95ldsPyvkKqSN5CSEXwvCksRf5phPwnQfu5Eg+0xveEmeBWehGX1tcti3qaxCxzms07L6eGeA6mGHW25XXAlYk1RxJcQtJzxQZr0a0zyaH8mewzJaPhZIZG8RtTuPE613GJc0QS6XK6FW9duW/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405116; c=relaxed/simple;
	bh=JM91qWLrzz5r6vN2DJex8F2XuWORUzWJO1ZJmGsLDOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fq2o7+MkPxYRpxWpVXQl8POLGtAj1enfwPK8OxLyPsUWnPCjkcCtHf9F2onaAaEt8HTnjJ7g8sFxn0Qst7Qnh5iUwXLlj3U6l+jy/jynzVvCrLmUliWU8SJJl2rdozQTJyum8icw4b0zhTYFv7crksdk9mfcOGb0oYYTCa2mGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzZq+glG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzZq+glG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405115; x=1742941115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JM91qWLrzz5r6vN2DJex8F2XuWORUzWJO1ZJmGsLDOU=;
  b=lzZq+glGxdte9sv3lRdtAsIpPhpkPCkHDX324d9ryLVfzgrBMUO3vXYC
   3j6D/+0AfHYy6yUJvfWP9cOYXYB5rYD0KHgN2tJrcbwttB7Ck1fzBDFV+
   ySdqqbtTlu93ynWXSJt8kgsU0BLe8FaDYNWxxnljP/RpfSsJnR5nTild0
   begLAEpnrvDP0J+1G03c4Buk7gFNCzQGO+tUOt4Inu7q/FEgn2FL/ojO4
   BVqG3C0RS4T5iC0qi+Zr3ohaS+dK2v2P1a0NaUCAXTZu8qThRbvKNu5Rh
   mlC9gwMjO+vGIMkbEwmtwDMb9kMTtP1253Kjp1JYaTWmFUU0c8CsQcpN9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300378"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6300378"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="20309647"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>
Subject: [PATCH 4/6] ASoC: rt712-sdca-sdw: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:15 -0500
Message-Id: <20240325221817.206465-5-pierre-louis.bossart@linux.intel.com>
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

Fixes: 7a8735c1551e ("ASoC: rt712-sdca: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 01ac555cd79b..36d0dd532b8d 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -438,13 +438,14 @@ static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt712->disable_irq_lock);
 		if (rt712->disable_irq == true) {
-			mutex_lock(&rt712->disable_irq_lock);
+
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
 			rt712->disable_irq = false;
-			mutex_unlock(&rt712->disable_irq_lock);
 		}
+		mutex_unlock(&rt712->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

