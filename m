Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2A1A4F2F
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756410; cv=none; b=Oqad9TkOztJJXYoU/TVTL8Y/anSLRK+cqFnOlsHoR+oh3kwDP9oWcd2rFRRlIcrc8lI9ML7cvEkGyRNYPT3C5246d6x4+fLVwEifl2prcZlL0zpuC6e4VciCw3idRL+fT9qO0TWH1eigzKjSiZGUM9m+nEAcrJrcyDLssxVhRTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756410; c=relaxed/simple;
	bh=yoc0w8a4H3KJkNdv8mUj4MYqIus1JnhQoeSdG3HGMjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWHUiUjDw9Idc1CBLuhU7H4ExtfpoDAcrw79BeYTMUgxX1GB/0Cp/qcWBtPdIFz6m3AB0hpv32bOd0JqxGlv0tR38FqGSPIl/Xy4JcAoipeXr96Cr37Pfu4fMtOOEpl+h3i5Jk7qV+Xi4pH32GgJXg9V3MaSWBpx0KR4QQTGYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgma6YVD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgma6YVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756408; x=1775292408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yoc0w8a4H3KJkNdv8mUj4MYqIus1JnhQoeSdG3HGMjc=;
  b=Qgma6YVDnhHldss4JaGQTVpOWcpI1CMwh5PmiP56byuxV0671qshPIPB
   ttsC7723L/hZJacnxIRu92YNpKfB190RHY+25dPYkYhTVlhVNP8CNQ6p7
   F6oKcnptfddbvuSDks0zE9Mpx1FLHcCfx2zPIbPqE8cF7+FTK3ZvnGqVu
   xhIBxMi4uQQNX77CNIS3z02EJrFLbBHYfiJoJFbymcfS/BA9XbVHhnpmS
   FgUdoXTSY00FT4FjL4RFWYumPZKSitWb7gY/HZ76JBUnnPq7f5XgW/fCA
   gzG7QDCyU1hVn+NAaQ152vWC9D04mpQRUAIo5gWETDfM+sXN1p1bJAlQv
   g==;
X-CSE-ConnectionGUID: shF+1md2TFy/GKM8YlCA7A==
X-CSE-MsgGUID: fkX+xFmqSxePRZRGFhaCug==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854563"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:47 -0700
X-CSE-ConnectionGUID: bMmaoKVWTIiZ7BFx8y81Ww==
X-CSE-MsgGUID: AtNz2MBQQKSAAokUm90bzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464217"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/8] lib/string_helpers: Introduce parse_int_array()
Date: Fri,  4 Apr 2025 11:03:30 +0200
Message-Id: <20250404090337.3564117-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Existing parse_inte_array_user() works with __user buffers only.
Separate array parsing from __user bits so the functionality can be
utilized with kernel buffers too.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/string_helpers.h |  1 +
 lib/string_helpers.c           | 39 ++++++++++++++++++----------------
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index e93fbb5b0c01..3fb88a1e9898 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -31,6 +31,7 @@ enum string_size_units {
 int string_get_size(u64 size, u64 blk_size, const enum string_size_units units,
 		    char *buf, int len);
 
+int parse_int_array(const char *buf, size_t count, int **array);
 int parse_int_array_user(const char __user *from, size_t count, int **array);
 
 #define UNESCAPE_SPACE		BIT(0)
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 91fa37b5c510..ffb8ead6d4cd 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -138,6 +138,25 @@ int string_get_size(u64 size, u64 blk_size, const enum string_size_units units,
 }
 EXPORT_SYMBOL(string_get_size);
 
+int parse_int_array(const char *buf, size_t count, int **array)
+{
+	int *ints, nints;
+
+	get_options(buf, 0, &nints);
+	if (!nints)
+		return -ENOENT;
+
+	ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
+	if (!ints)
+		return -ENOMEM;
+
+	get_options(buf, nints + 1, ints);
+	*array = ints;
+
+	return 0;
+}
+EXPORT_SYMBOL(parse_int_array);
+
 /**
  * parse_int_array_user - Split string into a sequence of integers
  * @from:	The user space buffer to read from
@@ -153,30 +172,14 @@ EXPORT_SYMBOL(string_get_size);
  */
 int parse_int_array_user(const char __user *from, size_t count, int **array)
 {
-	int *ints, nints;
 	char *buf;
-	int ret = 0;
+	int ret;
 
 	buf = memdup_user_nul(from, count);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	get_options(buf, 0, &nints);
-	if (!nints) {
-		ret = -ENOENT;
-		goto free_buf;
-	}
-
-	ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
-	if (!ints) {
-		ret = -ENOMEM;
-		goto free_buf;
-	}
-
-	get_options(buf, nints + 1, ints);
-	*array = ints;
-
-free_buf:
+	ret = parse_int_array(buf, count, array);
 	kfree(buf);
 	return ret;
 }
-- 
2.25.1

