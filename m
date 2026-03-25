Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3123D1CA1;
	Wed, 25 Mar 2026 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438933; cv=none; b=ZO+csnrrMDWXV2y05/85dlSk5aS41hGZC0fEopPyDiL/7+zOAWEHx8CTkf8uW4YC24YZBc8gVEvJYKn81+MZXN7zqezjy4lN90iMmLspGwUwbULiUVuEVchNRC1JuvP5dugicV1n1J8E0OUzci5EhkQLwLXAcKqI756M/3hTgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438933; c=relaxed/simple;
	bh=EEzTDrRVElDZCxSW3TfsuQS88eL8+ot70SAwElORFx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRNHyKmdKlKMZ9d5p96m5MrHoqMnrilJttaKsGal0iB8AIC61Pg7CLeMha0lfkVlxWFYuyMNaBjVVfOksQeVFpTY1hae1y3h2nkNka+Kv/jgJe3eiEWoLLtVZzCBId/moqmsWXx+VwrtlSU7fzzrxSczkWTlYMXTxPHuMx2yC0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fddbZGxL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fddbZGxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774438932; x=1805974932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEzTDrRVElDZCxSW3TfsuQS88eL8+ot70SAwElORFx4=;
  b=fddbZGxLqRDDn947eWigLh9XJH0U2x9gacZkfM/LwCp8Imne64LgLmCx
   MWTk2+6zgd3yNFqM5DBmBRs6w1SZNrV/TwIuo09l03pQk4P4UPtDKJdA+
   IGhJ3OTZIcijZWeASDQ46UtA/hrKqFs5Zqb/Gah5Vh6vAnJRh7NZkfvA4
   Ob51dF/W+JujSdFpZzAHmSpQPLozrHFF/ECjWv58P/K6pX2EU2CGguc3w
   deknXbBpr/E9fYTunyA4l76q9UGw/HktjGL+iEDYF6kWP1cihOvK2A7s2
   1v7bZwoFTAnVrQ6zrYLAW+K+FlFLy/CPC9Ge2iDdq5SCR1m0r53r5UMkZ
   w==;
X-CSE-ConnectionGUID: Cn0ws1XvQU+yrjlQg4k1dw==
X-CSE-MsgGUID: LIFH19d/SiC9dzmapWRAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="63020052"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63020052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:42:11 -0700
X-CSE-ConnectionGUID: OOgGV11NT6mKag0HdxGccQ==
X-CSE-MsgGUID: b8WYPSJeTJaVHstfuFtO/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220253793"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:42:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/2] soundwire: record Peripheral scale_index
Date: Wed, 25 Mar 2026 19:41:56 +0800
Message-ID: <20260325114156.1028118-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
References: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we program bus clock scale index unconditionally. It is not
necessary if the new index is the same as the current one.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/bus.c       | 1 +
 drivers/soundwire/stream.c    | 4 ++++
 include/linux/soundwire/sdw.h | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe5316d93fef..acecbdcf52ec 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1411,6 +1411,7 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 		dev_err(&slave->dev,
 			"SDW_SCP_BUSCLOCK_SCALE_B1 write failed:%d\n", ret);
 
+	slave->scale_index = scale_index;
 	return ret;
 }
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 0b9626838028..a6f0255c1c25 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -697,6 +697,9 @@ static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 		if (scale_index < 0)
 			return scale_index;
 
+		if (scale_index == slave->scale_index)
+			continue;
+
 		/* Skip the unattached Peripherals */
 		if (!completion_done(&slave->enumeration_complete)) {
 			dev_warn(&slave->dev,
@@ -709,6 +712,7 @@ static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 			dev_err(&slave->dev, "SDW_SCP_BUSCLOCK_SCALE register write failed\n");
 			return ret;
 		}
+		slave->scale_index = scale_index;
 	}
 
 manager_runtime:
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 6147eb1fb210..0845182f75f9 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -661,6 +661,7 @@ struct sdw_slave_ops {
  * protocol for SoundWire mockup devices
  * @sdw_dev_lock: mutex used to protect callbacks/remove races
  * @sdca_data: structure containing all device data for SDCA helpers
+ * @scale_index: current bus clock scaling index
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -686,6 +687,7 @@ struct sdw_slave {
 	bool is_mockup_device;
 	struct mutex sdw_dev_lock; /* protect callbacks/remove races */
 	struct sdca_device_data sdca_data;
+	unsigned int scale_index;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
-- 
2.43.0

