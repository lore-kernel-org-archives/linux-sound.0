Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E112153FF
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567668; cv=none; b=Jw52Cu0BzIXgVxixqOVyi9alF9+/gp8OQiSDWvA/rttenD9MCyIceU/wB8Jh3S0zy05tZEYqV5+a40MpGahIdNh3J1iIvto9UR/dpphJXsD0EjrDI3gAi9ClLwt5C7CU+bknevaxGgoBNAInayeFzhH8olmbWSWYVfCaoxDOCnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567668; c=relaxed/simple;
	bh=CtcjxbxSMe9+UWegxhwcaOmTq/vY0kvzO1AvhGKXPgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T/QCk8I00eYI/TZyJzXlY7hT2rNCaoubNopSzvwu9NUC0qJAVMoBXojtZ+2Nk/JQxLCyuxicIrpN+iUzDy6jMMSPPIlFuwzoaNQd05itY2fkdjbEM2+6cUXGISiRByOrt50lPkN5Onh12x2wfFxrmvVutzX3TbLQTMcI78NEyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib8zQ5xn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib8zQ5xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567667; x=1769103667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtcjxbxSMe9+UWegxhwcaOmTq/vY0kvzO1AvhGKXPgk=;
  b=Ib8zQ5xn7MOcIZnC9Izu6ErfEAUDvP7GvATcyerIelQSg9CFI2KJ+Csw
   qvVlUVJ3xK0/COrjqAJhQKqj/toFqfbzX9xFykURy9lUm+uWDDhbPannZ
   z6hKHSuhFASvV5wrWaOwp60K+lJ9IkdxLVUwWw/svEXCWx0D17dwjZJmO
   QDF50gUDWDBGKmFih3z4RhkxQRqKBolG8sVEjrEgytzXd2M9XTv47zlZ7
   0zNMEwAUIkHpiW0nVgYGlfIqZ8V3JAfujssJN3THjnA7ntigJjoK93Dqf
   ivtJwJcjqnZy03aRMHgQZizcAYijQjNf003G5q2KE+3hXfQ4MvUASmBkY
   A==;
X-CSE-ConnectionGUID: pI9DFFLnS3atmPOq1NHPYw==
X-CSE-MsgGUID: gQJIzEyPSvmVEKKitqKCEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434792"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:41:07 -0800
X-CSE-ConnectionGUID: GkPTt/LKTA+GaNDCOH/q5w==
X-CSE-MsgGUID: bzDi0RUxTmi/i/JzS97rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185370"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:41:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/11] ALSA: hda: Select avs-driver by default on MBL
Date: Wed, 22 Jan 2025 18:54:26 +0100
Message-Id: <20250122175426.1369059-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The avs-driver is the recommended solution for MalibouLake (MBL, also
known as RPL-M) platform.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index f564ec7af194..9a8ead75be17 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -108,6 +108,10 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
+	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
-- 
2.25.1

