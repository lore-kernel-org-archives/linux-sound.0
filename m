Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDyVFDIO"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AE01707
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262379; x=1732798379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=paGtmFywowXIennU78XonD4EbtcdQ1JkutrJQ5ngLcs=;
  b=gDyVFDIOknlGSxdXhRPskqs1muZDyhT3ztSa2hGINIUjxS8aGfqN5btz
   UF1iTesXssT8ZaZiUzC5KfEi7jQqa5Y9coDrEgLXnZg2qOG6JGKFCT2Vj
   IDkh04ZYcJWHx5T95+XnOp6wNR1+XBLr8RSLG3Mjpnir/yngDYGHWszLo
   2CA5EVlNwZ/wa39G9qKXH4Tv4wjoJ61ODzbMnqfLDGp0keHV96e3DsynR
   zLad9qRiZwFYP8qV0JSAOaRYV9/pKjRT/vgUCD0Nkq4D3mUeiX8z3b3fz
   kba5Aa/Ca49qcj0OqjhgiAzNCEoLPt5pF5M49hB01n4cK2hU3LabyiKcL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022891"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174608"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:52:58 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 03/13] ASoC: SOF: Add placeholder for platform IPC type and path overrides
Date: Wed, 29 Nov 2023 14:53:17 +0200
Message-ID: <20231129125327.23708-4-peter.ujfalusi@linux.intel.com>
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

Add a struct sof_loadable_file_profile which can be filled by platforms
(sof-acpi-dev.c, sof-of-dev.c and sof-acpi-dev.c) to be able to use common,
generic code to handle path customization.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 268d0ca0f69f..05213bb515a3 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -57,6 +57,18 @@ enum sof_ipc_type {
 	SOF_IPC_TYPE_COUNT
 };
 
+struct sof_loadable_file_profile {
+	enum sof_ipc_type ipc_type;
+
+	const char *fw_path;
+	const char *fw_path_postfix;
+	const char *fw_name;
+	const char *fw_lib_path;
+	const char *fw_lib_path_postfix;
+	const char *tplg_path;
+	const char *tplg_name;
+};
+
 /*
  * SOF Platform data.
  */
@@ -86,6 +98,9 @@ struct snd_sof_pdata {
 	/* descriptor */
 	const struct sof_dev_desc *desc;
 
+	/* platform's preferred IPC type and path overrides */
+	struct sof_loadable_file_profile ipc_file_profile_base;
+
 	/* firmware and topology filenames */
 	const char *fw_filename_prefix;
 	const char *fw_filename;
-- 
2.43.0

