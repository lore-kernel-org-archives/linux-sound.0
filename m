Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A637D3F3
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707410284; cv=none; b=ZeTUtbJAd39u4HcT6e4lLY9yhcr7kYhEIvREPPyX3PP7esSswvwgPkON+eJaT0cMt1fEXCh5BVXh49p068cbWyFD1GRv/zQhftSRVtqZL+2VkeGfSeRnBFgH57kKLUrrBkyBNmYQF+2j8LHytQeHmP6ZzNJBSPN71umch+eum7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707410284; c=relaxed/simple;
	bh=GopZ5/61N+an8PeekkcsbURLOIv13SaQfkgk42FcmK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hf/TsEUKjbqtGvve79gag1cTLm0RHeCGnoDBpKwAUWKvZ2DKXvSAdc97wW3Se+ZWOgJa5kYfyjHrkYg1jwEIFVXP23BHHTNpFt0x2k7HoGsV6BwMCBR4Ga9wRa8WP1PKTM1tiXzQWWKTFKCxgzr/djD6N1c9ydtfhmDq9XWMzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAXB/jwh; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAXB/jwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707410282; x=1738946282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GopZ5/61N+an8PeekkcsbURLOIv13SaQfkgk42FcmK4=;
  b=AAXB/jwhnpsFcyaAm9huPRBbhUYmtovX4MhNoR2jzyPGxrz04x7Q/DNK
   DIFlsF76bM2y/VptoQfXIT5jwKb0GA7W6eTkzIdozfy3mLAlTCu8lN+Ah
   +2EddumpsU332AA1uIT2vncjEC1Su7Nbbm2zMoNB4edzrgm1iJZObWQki
   4eSBPR4CihSnl+I9AjTe2QD3KYsIZnsjyIamy8czgHHFDBra8m+hHs5Zf
   MCcIPf/ICE/UL7XsmUlkrB8EqLflaYDeEXNg/4utXgK3ujBpnDSRdPlNq
   euSL9euWzTnWQOf75iTtm9X6mss5DbdJLf9WQNaZBoctd7HNTOyBbIesu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436392516"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="436392516"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="824883735"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="824883735"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:38:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ALSA: HDA: intel-sdw-acpi: add kernel parameter to select alternate controller
Date: Thu,  8 Feb 2024 10:37:50 -0600
Message-Id: <20240208163750.92849-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing DSDT or SSDT platforms hard-code clock and frame shape
configurations. For validation, we'd like to use alternate
configurations. It's not always possible to generate new tables due to
missing symbols, and modifying existing objects usually leads to
AE_OBJECT_EXIST errors.

The mechanism suggested in this patch is to add a NEW ACPI controller
device with a different _ADR value. e.g.

 Scope (_SB_.PC00.RP08.PXSX.HDAS) {

  	Device (SDWP)
            {
                Name (_ADR, 0x40000001)  // _ADR: Address

The desired _ADR can be passed as a parameter with

options snd-intel-sdw-acpi sdw_ctrl_addr=0x40000001

This solution leads to minimal tables with just what the developers or
validation engineers need, and without overriding any of the existing
firmware definitions. It's consistent with the recommendation to
extend ACPI definitions and not redefine them with a risk of conflict.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index b57d72ea4503..5f60658c6051 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -23,6 +23,10 @@ static int ctrl_link_mask;
 module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
 MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
 
+static ulong ctrl_addr = 0x40000000;
+module_param_named(sdw_ctrl_addr, ctrl_addr, ulong, 0444);
+MODULE_PARM_DESC(sdw_ctrl_addr, "Intel SoundWire Controller _ADR");
+
 static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
 {
 	struct fwnode_handle *link;
@@ -141,6 +145,9 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
 		return AE_OK; /* keep going */
 
+	if (adr != ctrl_addr)
+		return AE_OK; /* keep going */
+
 	/* found the correct SoundWire controller */
 	info->handle = handle;
 
-- 
2.40.1

