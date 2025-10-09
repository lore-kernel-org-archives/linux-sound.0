Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E91862A
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002840; cv=none; b=WR62Uz4lsVS2hMXhEzRUalUgAkNGwmkFhVvqpL+IoOe7/WP9l54XON//gYuZPGZWDdUuAJ1Mme8vSFjB6GqDjV05Q1PQENTm3uEO6rQFxjT+AEwLVvN0yvofp+V+J+aN3Re47n+olkg6d7pITIGxsksgqu3/KoqBvh1tlnoq9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002840; c=relaxed/simple;
	bh=27TeOjzWGL88BsHq8I+/3kJCFaElsAI91q9Kxz4itOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Azrksb6ZcHhZQD7qmRCsnLb8QdtXlcXzbNGDgcaj3BYqQKtp2RdHlw8EDhKZoSYvNGnlbDHpZg/MbFESi1VpdMUuIbP5jrKSlwOlu+W2Y/JrSZRAg3b58O2OgvSczs7cmUV+bdkOcb4bSMFZyVzrpvcbQk2stKnUi1y3SMmHEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbntYiix; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbntYiix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002839; x=1791538839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=27TeOjzWGL88BsHq8I+/3kJCFaElsAI91q9Kxz4itOE=;
  b=gbntYiix6dK36JhndDMuzZAmtdwfltFASmG3TvB70egq9QNYevKZTRkD
   +wbKPXdn8mnNnfhHkqOy9pHD7oKCl+FakkCHpSzLn54K3mB0QdcgrGhjY
   RoA5evVtsAZN2bRFJaoC/nKdX5ZcyavpNqXwbpPdOZsrVOIlsp55b+ekx
   lbeaq9pn6AQ/abpRmM/AOscIcnozM+UVt4WNACeCyTwD5AG83PgE4o1yC
   eq2867FqQk2mnIAg1zVu5xPkf0cGWXRFvXk1pFlPSMwafVBrGGFBmFChB
   sVR3E4vekSSaUZi1PLlZdS4mbGwy9thrX9s1pqJukj/TgQT/Q0h6V+7H5
   g==;
X-CSE-ConnectionGUID: kjl34uLbRbi2M2G0PKo13A==
X-CSE-MsgGUID: SrG06eKQQ8qdfZ+lqixr8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113213"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:36 -0700
X-CSE-ConnectionGUID: mR/9PJ1ITQKies2LLHdarw==
X-CSE-MsgGUID: QDZpBb6lSe2Jk9zikAZBLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437947"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/9] ASoC: soc-acpi: make some variables of acpi adr and link adr non-const
Date: Thu,  9 Oct 2025 17:40:16 +0800
Message-ID: <20251009094023.3474895-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we use predefined snd_soc_acpi_link_adr tables to match the
link adr from ACPI table to select the machine driver and the topology.
However, with the mechanism, we need to create the snd_soc_acpi_link_adr
table for each audio config. The sof_sdw machine driver is used by
almost all Intel platforms with SOF and we can load required topology
file dynamically today. In other words, we can use sof_sdw machine
driver as the default machine driver for Intel SOF SoundWire codecs and
no need to create snd_soc_acpi_link_adr table for every new audio
configs.
To achieve it, we need to drop the const for some members and edit the
link adr and acpi adr data to match the data from the ACPI table.

Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc-acpi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index b8af309c2683..90d73b9bddab 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -114,8 +114,8 @@ struct snd_soc_acpi_endpoint {
  * @name_prefix: string used for codec controls
  */
 struct snd_soc_acpi_adr_device {
-	const u64 adr;
-	const u8 num_endpoints;
+	u64 adr;
+	u8 num_endpoints;
 	const struct snd_soc_acpi_endpoint *endpoints;
 	const char *name_prefix;
 };
@@ -131,8 +131,8 @@ struct snd_soc_acpi_adr_device {
  */
 
 struct snd_soc_acpi_link_adr {
-	const u32 mask;
-	const u32 num_adr;
+	u32 mask;
+	u32 num_adr;
 	const struct snd_soc_acpi_adr_device *adr_d;
 };
 
-- 
2.43.0

