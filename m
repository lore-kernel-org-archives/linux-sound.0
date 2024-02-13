Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D33B189
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707824629; cv=none; b=HhbJIK5XLNUQaQ8O3+8E/ZLXBYg7R47YM4xLfw2JSWVYhYhjqkhVuQWbtm4eL72Rdwg1y2QEpHjsMIcvNjayN15aF+JsXGM5NxMRR3GlshlHKbqvSw2lXRlFOtkTOKyNPoVK3uTPzJAKKM3pps2e7zxjUxn8whIwC7px+to+M14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707824629; c=relaxed/simple;
	bh=+CuZhbTdvU6+aEjbUkUfZNX/dgA3zQkM0dXuJjvs4BE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvSWMATi5pKcWdBV34eo52ebQCL6hSuPurZ1qfTfvt0P5c4qoluG6AQ+M3UufWoLcDez7t2G0gYlFlBfYTgWGfOT/0oDrMTgUUSv8b+zJP0hGSnQb2QdDpUbCHeRMpjzKUFIyg5MCgo7eYJ6GVBDVskgTSw4DEV4Mgp05LfpOkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqxqSS2p; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqxqSS2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707824628; x=1739360628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+CuZhbTdvU6+aEjbUkUfZNX/dgA3zQkM0dXuJjvs4BE=;
  b=JqxqSS2pWwHE7QLP73t+OO5uUrdRmewOHbZgdwrCe5TIzYNdp4elOvM7
   Gr0vYVVlYJIzCtEDFSGzev/p+JdDIdDqUq395L8txWiss0jnpVm1wMXw1
   cqOG/vPzKAU1x4t01NzRpUgY+kuxU9kfPpI0pEtagI11RwyxvKm4NkhP5
   b5BwtW+kH/6m2znAYcP5k8z7yTZfpkdQOoIhBH/s14yN63WgejaJj+mgf
   7rA/kybyEoA6kI+oHz6GqcsSO2/UyBzXPp27x67/SgzZDfovags4mM6Qa
   6Qn/xvZEFKBETDrQKfZT/9KqnGIO3gjBYNm1hZu7X6dEsgAA/jdvb+pTn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12917020"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12917020"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:43:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826086189"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="826086189"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:43:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-mlink: update incorrect comment
Date: Tue, 13 Feb 2024 13:43:54 +0200
Message-ID: <20240213114354.32579-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Likely a copy-paste error, wrong CONFIG used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 228114aca415..d849d9b24f13 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -181,4 +181,4 @@ hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enabl
 {
 	return 0;
 }
-#endif /* CONFIG_SND_SOC_SOF_HDA */
+#endif /* CONFIG_SND_SOC_SOF_HDA_MLINK */
-- 
2.43.0

