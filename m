Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382844605B
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363027; cv=none; b=i78Y/4uFbwQ4g6pmin437xOKjZbXbzzE1PcA7r/xgQrESq8ygZ8uhAWYL6gSqeKxkkFXUrbt1vQI4JGZjPhBzC1bAsybyr7aLYImNQnav9KIKbOVPfC1wEUzhRg9kkwV4KOqL2wv7zqIHhDkt7IWlqsDM8IWi1hpFt7yYR5Q1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363027; c=relaxed/simple;
	bh=aNJKeVrPCzrFC5QdQEnC2/2c0/EyMkddsG+8Jzyf7DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6I/yrcp/NgWnD0tDufBoXpwHoCfGlf8ATpYjlhhBwD41EACInjV+5NP+YBZjwjwUklBtPZV3dKX+WvXkSeNjyZds7kkv/ug99pLI6wC14eOYOoFr/Ou6k/PJF/YhiQFUH29qmu9D+YzQ1W9z7Neii4WbCxOFWjsE45my9vDK8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk05UAWj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk05UAWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363027; x=1822899027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aNJKeVrPCzrFC5QdQEnC2/2c0/EyMkddsG+8Jzyf7DU=;
  b=Xk05UAWjpglww2J5v+H7G23Z2PVuVzgDnWIp+IaHqF2XET8d0ED8cCRT
   kXzvEOrdN5VVx7HcBl9BVGD+CeO2qZuEmENCt53ulCsTJXtFhxnTbuNgy
   hbHMT2hHyOUpU8nkrxHfNhpDmKFsZzNSzmLbYNRN52EeKQKErLWR+ZX/R
   Xfbro8kGSO1Zshwbu1MTp/h79V/cSVFXbazHrgToFrMKmK5PaCpwXJiWS
   Xd2FlRd1Mvwa2KCjkKl21veiEVElQMUXT0aOGfBdQY6ZMf+sdc7y7ceL3
   lpEPekh0bXwHhkO4FKz7tw3wzFvZIjzUTRXrgxeaTntX7ZTHaSfJrNXxP
   Q==;
X-CSE-ConnectionGUID: p4xHcA3KQxaV0rImCAgJdQ==
X-CSE-MsgGUID: N3BIJsQaRVGH41phWzpw5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113984"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:26 -0700
X-CSE-ConnectionGUID: E8XTciZ8TgKmkgBTIQUADQ==
X-CSE-MsgGUID: KnfoamQVROGlSNYAN44eyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670732"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 16/28] ASoC: SOF: ipc4: Add definition of module data in init_ext object type
Date: Wed,  7 Oct 2026 11:49:43 +0300
Message-ID: <20261007084955.1256-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The object array of the MODULE_INIT message can carry different types of
objects, identified by SOF_IPC4_MOD_INIT_EXT_OBJ_ID in the object header.

Add the SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA type to pass module specific
initialization data to a module. Unlike the existing DP_DATA object, its
content is opaque to the driver and its size is variable, defined by the
module itself. It is going to be used to configure the decoder and encoder
process modules.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ipc4/header.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index cea3d9453b84..e5161f0a37e8 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -706,7 +706,8 @@ struct sof_ipc4_module_init_ext_object {
 enum sof_ipc4_mod_init_ext_obj_id {
 	SOF_IPC4_MOD_INIT_DATA_ID_INVALID = 0,
 	SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
-	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
 };
 
 /* DP module memory configuration data object for object array */
-- 
2.56.0

