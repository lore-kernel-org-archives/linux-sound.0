Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWkry1Gn"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB5895
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262382; x=1732798382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DrPNJB1Cx5nxS/6nHhyoCgL07ikrf7u4dP2TnnOz++k=;
  b=mWkry1GnB0OlV0BVj5PG9a0J47cStUGzZdYshEXBRT7okqE+uktOLqph
   ht1SqvG94OB11zoczPq78tdontNfE/JI9YiorGRdf4PNtIHXbKJU3Ammv
   NVjWRsHbeMA7eJXNoUyiZ3palYvofCwLvxAOmdLfR2SVxM1PPX5kmVDgD
   iFtqIwcJtxNXNXELMft+dak0MLBjZjzcnq+bzm8vU5UTdzncfpakpOhhT
   cFcUeci+bQhLeslMfLAPlI6TyIuReg+H9Ig7LS6l3BbZfTIsP049vbcLi
   evICqJd8M5AtW1wR23VxGbiXl5EWQ9pdj2WDWMxEr7+Y/2vJ0qIbCtrrC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022896"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022896"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174616"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:00 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 04/13] ASoC: SOF: sof-acpi-dev: Save the default IPC type and path overrides
Date: Wed, 29 Nov 2023 14:53:18 +0200
Message-ID: <20231129125327.23708-5-peter.ujfalusi@linux.intel.com>
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

Store the default IPC type and the firmware and topology path overrides to
ipc_file_profile_base

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 84a4a0a3318e..87c0c2edc4c9 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -87,6 +87,10 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 	else
 		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
+	sof_pdata->ipc_file_profile_base.ipc_type = desc->ipc_default;
+	sof_pdata->ipc_file_profile_base.fw_path = fw_path;
+	sof_pdata->ipc_file_profile_base.tplg_path = tplg_path;
+
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_acpi_probe_complete;
 
-- 
2.43.0

