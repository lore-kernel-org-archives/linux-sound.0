Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494ED205ADE
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358117; cv=none; b=HTaI/U8OafQdnzFsvoo3yxXmit+XY3EFNUutDNOOOX4Yi/5wf0C+7aWHwbhy5VBkne0OuW4+pf6W3RekHfbMHgRlGneV9fAdQu4UTGtKqzElxxsggCccj6vmZxMZ3S5r4iAaiS50IU6fl/bh7m3JTfT2VCjla92DMaTw6cXQE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358117; c=relaxed/simple;
	bh=pdpUrexsVimiqdRPrbJnoEPjX3JXsFQFKaAqVtkXB7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4HeHDXN/Ekp3Xo5sj82HXoSO0TnLr5j9+OYSacDXQA0UFzyT2KwyR4tXPKM0hbUL8bCJ74iWP+VviLnj+V22rCsC7OarMJXbqKYv5lMlHNqPQHsI3kNoqCOXuEy0tNRWDU0XYeXLxuVFnnqb6EZZ7r6Ls6v0jWLGRiaT0B9O2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldqpV2Gx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldqpV2Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734358115; x=1765894115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pdpUrexsVimiqdRPrbJnoEPjX3JXsFQFKaAqVtkXB7E=;
  b=ldqpV2GxgPXYLwsAgPHFzPd1swjfk+ZO9LKaADfNKbPzKjy249ler+q5
   xMA+AfY1QzRYdSaw43df/4m0i812GRQkKiaeh8EAawzp7NgHHg9Ys9oQ+
   z1B9EtxGLOYI8ttRr0JGlDFcTXCsMsNf9c/dhXG+4PDMqBE06opF+VGXd
   WKf1ZVIighi3aaCQKTXWmy/O7ln0716aV/Ryw3Nl6c00GsA+W/6pwaSnR
   ew4MKtb+XEjz9p38kmwioxxPkilGP6dsa3zb3zITmx8TvJA32pk0I7mob
   uTH1OUiRlZe4uU7oA2isfj9Kfo/jV8TwBOwfpgM1D8bjsgdl6Dj8LToUy
   A==;
X-CSE-ConnectionGUID: AqlzW5vPRLORwaTknoaU+w==
X-CSE-MsgGUID: 07jAakieSkyuNnChCg8Fag==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34063293"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34063293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:08:35 -0800
X-CSE-ConnectionGUID: MMNZnNE1QWyiOE52glfozQ==
X-CSE-MsgGUID: +0ej6XtqQguCY8SU373wQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97446900"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:08:33 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
Date: Mon, 16 Dec 2024 22:08:21 +0800
Message-ID: <20241216140821.153670-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
References: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Update the DMI match for a Lenovo laptop to the new DMI identifier.

This laptop ships with a different DMI identifier to what was expected,
and now has two identifiers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: ea657f6b24e1 ("ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 139f4306dc87..9f721b88e606 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -637,7 +637,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "233C")
+			DMI_MATCH(DMI_PRODUCT_NAME, "21QB")
+		},
+		/* Note this quirk excludes the CODEC mic */
+		.driver_data = (void *)(SOC_SDW_CODEC_MIC),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21QA")
 		},
 		/* Note this quirk excludes the CODEC mic */
 		.driver_data = (void *)(SOC_SDW_CODEC_MIC),
-- 
2.43.0

