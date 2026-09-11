Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFC844F542
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125794; cv=none; b=MwmGC8Md3gnu7Rkgled5/YrJUJxbi8uxCF1H3UwTARDoTsb/JkMkDLa25wl+kXsYi9phL7X8ZukfmbiRHrQozSdGJsIDLgjpK29/vYELye/fzvYFoD9Z/fRdR2uvqLrk73IeA+xJlz2xX+3I8ylFJUw7Cybf2JnRfzPIfjrpzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125794; c=relaxed/simple;
	bh=0uGDZKhZ8Tb8Veny1zDy1c6Q7szNzmBDSRCKCNnO8gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIBVEGU41xmJLf48Lom/xsKotOihutilAsZqpovMqE/tOznBlOlr74HGBn4/BGwRngHeV+3KHPGsJ3A9GeNtOrx1CmZGpKoEjL1Lmh8HzIEqoKdvKrfWSA9Bj6NeYcUVT1gE/bNhvcje0Mb0xNe/RMD1XdTTuisRITTPuUEiP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGuA6qmW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGuA6qmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125778; x=1820661778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0uGDZKhZ8Tb8Veny1zDy1c6Q7szNzmBDSRCKCNnO8gY=;
  b=jGuA6qmWxKqvOyqsaTkqEIPijz5xWfjqm6qdfG64iW/C1XexR/r+kgM2
   Ak9TPbzSB03/UJLd+SuctjFvHOuy3HYp96H0qlro+k9BRkELp2eNSERXN
   9D19URojaXrMn9USMvxJxTxM2/NTS/PZIHcqaaDBz/VruiaNl/ATwbWar
   vEI2lj2ARRYg9NKKbC5NAJSBIsD0R3njoe4n5aYIKmmzkH7VZ/ZBMDMQf
   BeokL7VfHNwNAAgjpQfsezT4/HBEYDpjVGZ71ruBOB+zTM3IJWdCEiNDC
   tt84tiBoSYb4iq4WuRMlagvMAvHtp9dlf9TS7sSsAXIy5k8KCzCqDbqJS
   A==;
X-CSE-ConnectionGUID: wipu0A5wQLCIhzPy7RjXJg==
X-CSE-MsgGUID: o2jL1xN/Q4qTN9flhWLT4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750003"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:29 -0700
X-CSE-ConnectionGUID: pb4G0d/mQwyBLWux7ixGLg==
X-CSE-MsgGUID: NMqUWPYzRIGdm5qLYERQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213335"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:25 -0700
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
Subject: [PATCH v3 15/26] ASoC: SOF: ipc4: Add definition of module data in init_ext object type
Date: Fri, 11 Sep 2026 14:21:41 +0300
Message-ID: <20260911112152.28528-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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

