Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6E287515
	for <linux-sound@vger.kernel.org>; Thu,  8 May 2025 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728019; cv=none; b=KqkZKtWTjqiv5vYx82hERHPT9EpGR130ifEk7e/UVA7420fTFAGXwWcgXXM2qV+Sakx6LTbkl/WKpWa6Kcyu2Dx2ld4aavdZhliUHvVcbL9nkBq8MX+5bpQjbfbD43MZ2V/TC8qjY2AKP3fMa3JHhD4WylDlL4KSYn3RmDSlrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728019; c=relaxed/simple;
	bh=Anboq26coX/tMtPUJw7l1upUrwqBBNqgV2duQkHBhBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OM4rCWFOi9wASgzPq1+jVxqdwfU0BBg2c+h1+bGoloGhth+32WPK3o1HvjM6DeHYes1XiKq3ZEsFTszisoQcYJm8JS8/cTlq6OLKZHfdEvOSulLfuUxCUJOxpSRYoU4FCYUnYWNy9MyrAQ+7dvtNEyps3DPq3AFX9hwbHwYAytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCGBeq3i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCGBeq3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746728018; x=1778264018;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Anboq26coX/tMtPUJw7l1upUrwqBBNqgV2duQkHBhBk=;
  b=OCGBeq3icKwyl6dFAFX9r20zgqEcljoQLgPgMQ8jJntgqvJA3NtO5K0/
   O51+R9RZKQGCxHDgrSYMwbMxllCpn74GiRXRLQV5RyVIEhYAIj76+dqh3
   rM2/h3DJvVS7KuF2EsqDv/xCuP+V9nyZuWUqRr4wnREuElGwy/6Ws6ge3
   hgRQ2h9eMxpcfvJVMXU4crcZtAzW45s775iIr71YDfj8jMWCHTxzE5RRf
   wlRuA3j+U27KkoDfzVU+FEAj2GWvNO7AZpsDEGHt5M6Hw2TbiGFPbSbcE
   Mlb10AIDGNeBEiYOMKUlmLSa0nSve60SaDwEBMvahhKqBJ+GeSI0UU853
   w==;
X-CSE-ConnectionGUID: +BSyQOb9Qviaal3ZYYMoog==
X-CSE-MsgGUID: P6kyOcNERF2eZuM0toIuow==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59161516"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59161516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:13:37 -0700
X-CSE-ConnectionGUID: a/lbO3IBQnGmIKelx0LbOw==
X-CSE-MsgGUID: 8V6SX/nHSgeA83vVsaqI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136314345"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.123])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:13:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ALSA: hda: intel-nhlt: Print errors in intel_nhlt_ssp_device_type()
Date: Thu,  8 May 2025 21:14:46 +0300
Message-ID: <20250508181446.25323-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not fail silently when the intel_nhlt_ssp_device_type() fails as it can
be for two reasons:
The NHLT table is missing or the SSP instance is missing from the table.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/hda/intel-nhlt.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 088cff799e0b..6d72a871bda0 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -350,8 +350,11 @@ int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
 	struct nhlt_endpoint *epnt;
 	int i;
 
-	if (!nhlt)
+	if (!nhlt) {
+		dev_err(dev, "%s: NHLT table is missing (query for SSP%d)\n",
+			__func__, virtual_bus_id);
 		return -EINVAL;
+	}
 
 	epnt = (struct nhlt_endpoint *)nhlt->desc;
 	for (i = 0; i < nhlt->endpoint_count; i++) {
@@ -366,6 +369,20 @@ int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
 		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
 	}
 
+	dev_err(dev, "%s: No match for SSP%d in NHLT table\n", __func__,
+		virtual_bus_id);
+
+	dev_dbg(dev, "Available endpoints:\n");
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		dev_dbg(dev,
+			"%d: link_type: %d, vbus_id: %d, dir: %d, dev_type: %d\n",
+			i, epnt->linktype, epnt->virtual_bus_id,
+			epnt->direction, epnt->device_type);
+
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
 	return -EINVAL;
 }
 EXPORT_SYMBOL(intel_nhlt_ssp_device_type);
-- 
2.49.0

