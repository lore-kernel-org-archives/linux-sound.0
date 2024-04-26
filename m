Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DDB18C1F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145955; cv=none; b=XGMtsghlbPJrp5z5ndsGP63lxYdwWqWurTa94AeatdUEWLj6yz6bkQReBpYmZ1WPSU+mJCBPBguS7mV6CXm2nMG335tWK7lx5JylyCai5fNmQk39Y97ljtezxW1Mt6jPI01fhthyvNfZ+WLb+3I8XIC1RUJAkoHllh83iMQqlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145955; c=relaxed/simple;
	bh=8MLGSPpRbokfwbPdOKbZ3oBufJnpAtGiJAq0XBz63do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KN7a8Ge7kW9OQvoLhV5dBm3w0f8ODaXqws09XADpYRZOJb+f+AdcPbevP6m7KOglqOvBWSihLmFbzvwoGhRM1Tb66fzjULNF9PphBB5dEV+55SR+1HfeilBhjyDLy/66zN7QSu9sDU+GmZo6RAZ3WUl6UFRCDvzUWqtE+NW8J9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoJGisxc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoJGisxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145954; x=1745681954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8MLGSPpRbokfwbPdOKbZ3oBufJnpAtGiJAq0XBz63do=;
  b=YoJGisxccYKmqYkMTojvs8FepUM6fJNVBqYXNLNYUXCMkrXsp/c2bSnd
   tB6YpwETZFNf085v5XbB9WvHlD595Uv6qgTNig8n99QSrHiYPK6HWnwsv
   dB5un6l67z787kyOk6L/5aHaix5l5qEosyD9+JlMybSrCcw+Xxs/FFdDW
   IRJzEwFuWh11HzcMx14ECWJnVcujM7VxydFO+NhO9nfV+2EBV4W8dgF3P
   3ZtgVyJmUdzXJK9Ml0OIwv7gZS+rCU1lwUzFdeiVoaUlwCXebxWbMuOZ7
   MTNXct4IQ6osorO1gOZgCz+cNsHWWtgTVlpdgzKmIrZoZVU/vW2f822EJ
   w==;
X-CSE-ConnectionGUID: X55RC5VITJ+I2zeG7vc6uQ==
X-CSE-MsgGUID: 4F6X3Zq4SzaVrI8UazQb8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718430"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9718430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:10 -0700
X-CSE-ConnectionGUID: nEyCFAHgTFuh+0Cisk8NNw==
X-CSE-MsgGUID: Z1bahMjnTdua3tUON08/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56623536"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/5] ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
Date: Fri, 26 Apr 2024 10:38:58 -0500
Message-Id: <20240426153902.39560-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The firmware libraries are not supported by IPC3, the fw_lib_path is not
a valid parameter and it is always NULL.
Do not create the debugfs file for IPC3 at all as it is not applicable.

With IPC4 some vendors/platforms might not support loadable libraries and
the fw_lib_prefix is left to NULL to indicate this.
Handle such case with allocating "Not supported" string.

Reviewed-by: Marc Herbert <marc.herbert@intel.com>
Fixes: 17f4041244e6 ("ASoC: SOF: debug: show firmware/topology prefix/names")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index cf282c8b18af..bf635cc96ede 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -326,8 +326,27 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 
 	debugfs_create_str("fw_path", 0444, fw_profile,
 			   (char **)&plat_data->fw_filename_prefix);
-	debugfs_create_str("fw_lib_path", 0444, fw_profile,
-			   (char **)&plat_data->fw_lib_prefix);
+	/* library path is not valid for IPC3 */
+	if (plat_data->ipc_type != SOF_IPC_TYPE_3) {
+		/*
+		 * fw_lib_prefix can be NULL if the vendor/platform does not
+		 * support loadable libraries
+		 */
+		if (plat_data->fw_lib_prefix) {
+			debugfs_create_str("fw_lib_path", 0444, fw_profile,
+					   (char **)&plat_data->fw_lib_prefix);
+		} else {
+			static char *fw_lib_path;
+
+			fw_lib_path = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						     "Not supported");
+			if (!fw_lib_path)
+				return -ENOMEM;
+
+			debugfs_create_str("fw_lib_path", 0444, fw_profile,
+					   (char **)&fw_lib_path);
+		}
+	}
 	debugfs_create_str("tplg_path", 0444, fw_profile,
 			   (char **)&plat_data->tplg_filename_prefix);
 	debugfs_create_str("fw_name", 0444, fw_profile,
-- 
2.40.1

