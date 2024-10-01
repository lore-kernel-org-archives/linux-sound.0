Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A11BDA85
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766393; cv=none; b=j+b62cW7XZxx5L9KRkf8soD31gUakb/E/hb7lSz6CWDDmWDuZD57TfzUGmRnFMWIvfcfPnOXwYjjhETAiB2ReDaZYhAQ6mQpewHkrdWuWk0l9VgRBASTMbCmsbn3yvj0NN6D/VedIoIhHto81Jk0nHH96C/yNK2vEpqAUc3QMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766393; c=relaxed/simple;
	bh=mDY5o8AD6W/04rsJCL84/cv/LReCvRURM8YdB+lYQd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPK3tDGhY0gKY0hFXArqzjD0BaN1dWvoHs+ESOkcxiKL8JEGntsb1iEQAZw//9GO00ROqin1fqeWOJuOJJQMYIvf4oy/tRScOTYBVp3PlzO19mLw/TK/IiwikwvUR62zQX29ycB1fiCsway+QpRq8w2qNTTYgWG6V5cR3BFTXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPy267Hi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPy267Hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727766392; x=1759302392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mDY5o8AD6W/04rsJCL84/cv/LReCvRURM8YdB+lYQd8=;
  b=PPy267HicNQ6glkOkHXqzl5ptyUeDlYsI2TvlCAgNkR05NJokqXJYzIi
   EMw4kyYNX9qK2Ou4AsY9OzDwTqKfxqEEKReDNz3ue0ftxPzwVBrPJ8NeK
   2on1d4NIQCHE4E/A2B75w69XHvDrBX0MrwANm4moxxgKuhZC4Ozet3yAr
   xf2keV/7+riByXgiLbz1teRy0U+Yefao1xLQa8vkRbpt6qrvSFf1WsCzD
   5q41w9LfCIZHK7MSTOI5xRaqh9d1tgs/xFOrPoDMbyvmMTvBtc6o/1nN3
   pBlc+zlLnBwPq5xbhcsZLZEvacb3QUGhxz4/HzjjOTVMeNSF3zeXwawG6
   Q==;
X-CSE-ConnectionGUID: Vhqx4361SAm9LkuuqmcUSQ==
X-CSE-MsgGUID: mntNyuhpSaCJwpv0I4MecA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37556047"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37556047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:32 -0700
X-CSE-ConnectionGUID: nra8gxtmTOKul4bSsaig0w==
X-CSE-MsgGUID: uP7wppFxQBWsOsRM7jfJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78096811"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 2/4] ALSA/hda: intel-sdw-acpi: fetch fwnode once in sdw_intel_scan_controller()
Date: Tue,  1 Oct 2024 15:06:09 +0800
Message-ID: <20241001070611.63288-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
References: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Optimize a bit by using an intermediate 'fwnode' variable.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 770dabe0124f..7a3735e94545 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -56,15 +56,17 @@ static int
 sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
+	struct fwnode_handle *fwnode;
 	u8 count, i;
 	int ret;
 
 	if (!adev)
 		return -EINVAL;
 
+	fwnode = acpi_fwnode_handle(adev);
+
 	/* Found controller, find links supported */
-	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
-					    "mipi-sdw-master-count", &count, 1);
+	ret = fwnode_property_read_u8_array(fwnode, "mipi-sdw-master-count", &count, 1);
 
 	/*
 	 * In theory we could check the number of links supported in
@@ -107,7 +109,7 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 			continue;
 		}
 
-		if (!is_link_enabled(acpi_fwnode_handle(adev), i)) {
+		if (!is_link_enabled(fwnode, i)) {
 			dev_dbg(&adev->dev,
 				"Link %d not selected in firmware\n", i);
 			continue;
-- 
2.43.0

