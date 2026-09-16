Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663635F5ED
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560255; cv=none; b=N0nnUOgSe3RUnh/kOgoU0i/7im25c7akPLC3V4m5PuaAKK2tsPpUXh0VgZEqvVyFRFIbnvKp2w84ckXDtMuA/ErjJ7Da8ECSlRO3WcBL01V3M1swbzPgpEnCw3e3L8B42ESRcTHUU5CHKJUbyovES7JNz1pJ57BJeRCENDdT7+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560255; c=relaxed/simple;
	bh=0uGDZKhZ8Tb8Veny1zDy1c6Q7szNzmBDSRCKCNnO8gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJQHSXnagoe9xCEbEdeVqcodumkgT3hBPwOt3qHnERwV6zxcesZCPK+5B4PUlyFy+QLMmyODaTNOEzIiMMnXWycdxtKBr9Ks5g/VVe7mPQfhclDRxP5I9MtYr0fBgCf9Mc781hSTjUMlEL4JDr07yXv44ybH2RS6s5KZGEpHlw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxrBDCzN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxrBDCzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560246; x=1821096246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0uGDZKhZ8Tb8Veny1zDy1c6Q7szNzmBDSRCKCNnO8gY=;
  b=PxrBDCzNPrQ9thYEzG6wmI9r9EwpMdPwkoT/C+zesd8oZujI4uQT7EQk
   e1j2GWbuFGDT2CuqbknFvpbP+KQOouJV2E4WOK+VcuE0WIqbzijToeu9d
   5BBA+9DPBUezJgnSBZtv+riy/4TU/v65pDka9LY0Wr15Akg9XuQEp0ODo
   O2VGB+RI1eTTWs2Q/goMYq/KOmYubCpTIsJ/j6uzqMbCw4yMfeV76qXC7
   tkQ7O7omSTCHql7V8VvzI9zSzlVV75QK97y9piji+vUZCYZNVrWnL8QKV
   y4IVrWliMc0KzJTO/Z4waHTkDHYl0iKALx7MTOXw5X/DJut9Ep5sll7x+
   Q==;
X-CSE-ConnectionGUID: CLM5pHCkRMq8fEVVp863Dw==
X-CSE-MsgGUID: qy8pEsKIRF6ABn39FDY5sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496443"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:56 -0700
X-CSE-ConnectionGUID: 73edzzAoSGWdHubtzjfbcQ==
X-CSE-MsgGUID: rxggIuP0QXKgXDBV6yd3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293477"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:54 -0700
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
Subject: [PATCH v4 15/26] ASoC: SOF: ipc4: Add definition of module data in init_ext object type
Date: Wed, 16 Sep 2026 15:03:09 +0300
Message-ID: <20260916120320.18318-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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
2.55.0

