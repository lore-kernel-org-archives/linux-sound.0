Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEJviu3D"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65181AF
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262393; x=1732798393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHREn2IODvN5vXs5e4ohVj9Yrc5o/eFDFzSVB5NMoDs=;
  b=jEJviu3DW0Naurz+vEBjA1kx6Uhqv5lYkBBW9zxqgeo9oeV+Idixhngl
   ruNabz43eg6tA7uUzY3zzY6AjYwufCn3sEJ77ShTteiomVjMp/S4+yNgn
   Jt2x/jrfkfczgSgMDbqPoUdD3yBogdG60Nvv/ma/rqusIZufdwN7ySTUP
   cu6v6XHkZvbN7fs71Ogcbme4xViJnuGS6uOPMldhbzuxq93Y0zkuyONuG
   GH9MKd+Wx/ISZm35Aa2C2GllgfEhAVxcRul/4q0stKqcaF8KYBA+y3urq
   fHhM4RY1lHxVweVPzxAYz7YovIpV62+WjlhXEDPH/m0zvVjF3OqUon0H1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022952"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022952"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174645"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:11 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 09/13] ASoC: SOF: sof-of-dev: Rely on core to create the file paths
Date: Wed, 29 Nov 2023 14:53:23 +0200
Message-ID: <20231129125327.23708-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core is now using the information from ipc_file_profile_base to create
the paths for the loadable files, no need to set it in here anymore.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-of-dev.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 7b58f45790f7..fa92da5ee9b3 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -87,17 +87,6 @@ int sof_of_probe(struct platform_device *pdev)
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC_TYPE_3];
-
-	if (fw_path)
-		sof_pdata->fw_filename_prefix = fw_path;
-	else
-		sof_pdata->fw_filename_prefix = desc->default_fw_path[SOF_IPC_TYPE_3];
-
-	if (tplg_path)
-		sof_pdata->tplg_filename_prefix = tplg_path;
-	else
-		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
 	sof_pdata->ipc_file_profile_base.ipc_type = desc->ipc_default;
 	sof_pdata->ipc_file_profile_base.fw_path = fw_path;
-- 
2.43.0

