Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8130ACF6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426034; cv=none; b=miu87ko7j83JPDhEflBz3zlxh3wDzYRWTyJiOwYymzRMnarOsKf1rIuGWgN9wOmh1F5oyOudrDhH1I+VAtpnJ2ukfGe2VpgQcPjSYlG9pmKrsZG/ndpXNYa0zs/64gaqJWJtACmzKdcrIHYLBRKUe92POYTwqjynzyhiLBa+1kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426034; c=relaxed/simple;
	bh=27TeOjzWGL88BsHq8I+/3kJCFaElsAI91q9Kxz4itOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFOM4FwNByyobYbae6biCTYtRY8bcuK8nsKR81Pzi4ykLYDI8pldgpzTGbGiRh9hmr3vxJAMAKb7uWzBTVrqeg9jwLLdhMXthy2lc29j0cgO734G/C6pAuGZPCLwzHT6xrc1BpETprP7dfmXHoHwk+Vy5yEmT9BmBgdiqdYUn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh3y4wla; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh3y4wla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426032; x=1791962032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=27TeOjzWGL88BsHq8I+/3kJCFaElsAI91q9Kxz4itOE=;
  b=eh3y4wlaWILFzc69mlEBdXg5EjlUIucXj+LkVhoYVrx54sLRLteWbZSL
   R1xZcngvsPKlyN2HOi+dga13bc3tz8pWxNgmCeqqgbuNqZ8SdYJhRW70D
   5b4cYV7+8+kc0zZInYZg5jbMrtSi7mS3Ubm6LJh34a7p+rhcDEKi4ybXO
   xKlTLWgUdMUH7c73Hw51WVlp1P89beAXW1Xp5lXoFuL4K5lnqsBnP5TF1
   uGsjJ9P2zOeyavocsNe1diXq54oSO//Qt/OYo1Ipm+jywHLItBqq+6UIo
   GM5LuLXAuHJU6nU1ccFMTQHIYuk03xvaEtkcYXpIL73amgkkDbz4W/Qx4
   g==;
X-CSE-ConnectionGUID: ESMfbjWgTiys/hseAta28w==
X-CSE-MsgGUID: ZPdNqjYLT/ufgfeUSq9xIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233663"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:52 -0700
X-CSE-ConnectionGUID: wloulvNqQ9iNMDJ0FMVD1w==
X-CSE-MsgGUID: L4m+Sr0HRp+z4m/2m/73dA==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 2/9] ASoC: soc-acpi: make some variables of acpi adr and link adr non-const
Date: Tue, 14 Oct 2025 15:13:28 +0800
Message-ID: <20251014071335.3844631-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
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

