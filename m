Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CE14885A
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145263; cv=none; b=iitzVGa3+cB+unpUe2L+jtDdisPV7ZblgDwa/Os00HrJQTfOWbxr8uJWI95sgKYIooxTT6qjV60k68GHt53odqWv5FjEZRnJmVUXnkXqZNLvIKaIz5drXMNvwv2EVV3ZJB20jjW3NX8tdCIy2Lwprapsge+p1HEfGxNqU8VAqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145263; c=relaxed/simple;
	bh=3F6/tVa/XcMgdmfcS/i1sZkh26FGdmmuq1waL6fYv60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PC87/zXqCIjliMGSVaWXejSK2pe93MF7P916865Jk/KxGg8ufy6jHluPzkBJwJfYR8hDKCK/DlRQ8xnfePfOGSD1bh9yTSgeLK5IRdK8rvxwfiY9Z3wCkwofyjItb8fY5KnG4HMbLGAGrKfrTu03aLV8T89Pa04UX9BdVPMUp78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BC6Cd0hA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BC6Cd0hA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145262; x=1745681262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3F6/tVa/XcMgdmfcS/i1sZkh26FGdmmuq1waL6fYv60=;
  b=BC6Cd0hA6DY4t+1wR8b7MiXQdqSpEaYAZRdo2Vxyb0O94V+9zxRLQXZ8
   WAZZllD/m3FkWndQMPs3PnhEmZUbarMN2aXwPxrARusFma9alKMLwcxpS
   pcrqSkssw7tsgxfPUqotSDWI0N+IFREdADRIecLAUCd+nzSMkRul90fWI
   u2bsi5z7cFci+2L2Hxi+B1iULhAS9gIGcy4WIj+jmF/SJvbF0sonh7j8K
   HcDbGnwzA49pNX9YeHBQ5Wl10CZh9SVvqcM0rhUE8d6inrV9UbxAWXbo+
   VXf2d+kNNVQNnhYVTjw9fEx6/NCsRIgtqHKBykO8urJ5ihh/IfL+xEuaU
   Q==;
X-CSE-ConnectionGUID: mVCEM7c+RCSN3SVE9JGEPA==
X-CSE-MsgGUID: vVmsTnFNRkauYdhoTcK3eA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27400383"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="27400383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:27:42 -0700
X-CSE-ConnectionGUID: 3XZWoFiAR0CZBTfs5WdqfQ==
X-CSE-MsgGUID: EUPyBMB4RmC0/UpJm+svGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25420913"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:27:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of device_get_named_child_node()
Date: Fri, 26 Apr 2024 10:27:31 -0500
Message-Id: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation for device_get_named_child_node() mentions this
important point:

"
The caller is responsible for calling fwnode_handle_put() on the
returned fwnode pointer.
"

Add fwnode_handle_put() to avoid a leaked reference.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 5f60658c6051..d7417a40392b 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -45,6 +45,8 @@ static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
 				 "intel-quirk-mask",
 				 &quirk_mask);
 
+	fwnode_handle_put(link);
+
 	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
 		return false;
 
-- 
2.40.1

