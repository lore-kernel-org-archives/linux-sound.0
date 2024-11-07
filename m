Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB8196446
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980995; cv=none; b=TpuzCiVj2x+GDTJiKUsqYeUzDOLaEUo6LoZrcSgIeMl4VcB5kk3Qd6fFZTpWkBz6xQTqgkK2Ka1vOr+zX/3evcSGgM+ImAkEwDWWJWEWfVMVknaDdS89OUZ662+EQJLh/d0dyynf8rnqS1VjOlyAs5BydaLcYFI94gm6BYPgTak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980995; c=relaxed/simple;
	bh=zkuhKP7c/53hsuQifURNkOfRMc0hgIlN9UzisKUbbDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHVDZKe1Qoqc6rx2QvyVDrw30LHxFMYc/Y3FS9ZckSNWSfjfuYTPpC4r0ONxzLvpYfUt5pLGQKZfX3Z/yHxoEWySx8zPqhTWL3sTDSAi0Z2nYQB4HEXmGK5gkFzleud1NAa5Im1pqHM+JcTtFg1ztcbZL9SDtRqzcsbVJefMPuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMdeVf26; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMdeVf26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730980994; x=1762516994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zkuhKP7c/53hsuQifURNkOfRMc0hgIlN9UzisKUbbDI=;
  b=CMdeVf26fHcmJ/vKZqS25Wi000wnuGSwugthdEEm0Qmf+HtcsbR3whmC
   FXOwSHXeLRXOPVr6XX5CAsh6Dp8i+T7zf2561fWnyqQP4YS0MQwaXiryg
   YIz/IMCQixQMOwd9M+DDia/U6IUy8+eZr/f5CtKqTswAwanVcELBJZnZF
   7Jf4XgVHgTQISJNJdlORw15+8ZgVAHqgbrCpPgcvhcQSXIUnCefghhS2L
   HqFvVnVw1mDjBTO3577GU/opTfXIUv7gbHFfn4NVDkgf5jY/e7hCrhAlA
   rocFvsrDOT1MhMfh8t3q5Vrzph9qYm7OkHDEHU/fU1lq6Y0RpkOSE3GaD
   w==;
X-CSE-ConnectionGUID: nSKqgyWPTA6WKYnLgrqhSw==
X-CSE-MsgGUID: ldH4U/AnR6+M8zt/nMqZMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41437380"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="41437380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:03:14 -0800
X-CSE-ConnectionGUID: kLCIqSNlRXWSarI2Br+gGg==
X-CSE-MsgGUID: ieF6MhjGTrapQ98RVF9hog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="85849569"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:03:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/2] ASoC: SOF: ext_manifest: Add missing ext_manifest type for PROBE_INFO
Date: Thu,  7 Nov 2024 14:03:05 +0200
Message-ID: <20241107120306.30680-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
References: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Elem type 3 is PROBE_INFO in ext_manifest, add it to the list.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ext_manifest.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index fc0231d04a94..7dfe3ccf1fe4 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -60,6 +60,7 @@ enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
 	SOF_EXT_MAN_ELEM_WINDOW			= 1,
 	SOF_EXT_MAN_ELEM_CC_VERSION		= 2,
+	SOF_EXT_MAN_ELEM_PROBE_INFO		= 3,
 	SOF_EXT_MAN_ELEM_DBG_ABI		= 4,
 	SOF_EXT_MAN_ELEM_CONFIG_DATA		= 5, /**< ABI3.17 */
 	SOF_EXT_MAN_ELEM_PLATFORM_CONFIG_DATA   = 6,
-- 
2.47.0

