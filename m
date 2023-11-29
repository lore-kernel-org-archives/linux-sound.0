Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk2eH2Ku"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23DE10C3
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262386; x=1732798386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCpn9ZNcLLcLhZMJvK9OlpkgsWy+ExRNpQspOpbl0XY=;
  b=Rk2eH2Ku7fTmPFtweKms/Gt3i0se6phXWnbxvFIrXF5fUv6d0TupA7qb
   91kvv3CpDe4yfJUbXE/Ufa6it5w9LeCnExgGfoEzbeOF7mpE+SHPqXOBR
   Z3wqc7BZ8r2Xb93N1ldOOnKgLPBkuBY2cc5x53Q2La2ZR5hL7gq1Sx3mF
   z1aKpHPNQqhKkkQhdqRk9ftdd3qgvz/gryzi7vKGVbCP/q3KOv7DZZ60x
   vhT6pFDhuVPakQrc27n6RhR1I+oYSr2nBdJr99/yoLJzejqbwcoyZ+Rqx
   Gsvv5NGsVm/x7ecTBwYNcp29NH2DSxLuB9s2Yk4VlwGuGAfEoHiDsVF2H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022923"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174631"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 06/13] ASoC: SOF: sof-pci-dev: Save the default IPC type and path overrides
Date: Wed, 29 Nov 2023 14:53:20 +0200
Message-ID: <20231129125327.23708-7-peter.ujfalusi@linux.intel.com>
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

Store the default IPC type and the overrides to ipc_file_profile_base

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 64b326e3ef85..becc85b27d51 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -190,6 +190,7 @@ static void sof_pci_probe_complete(struct device *dev)
 
 int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
+	struct sof_loadable_file_profile *path_override;
 	struct device *dev = &pci->dev;
 	const struct sof_dev_desc *desc =
 		(const struct sof_dev_desc *)pci_id->driver_data;
@@ -334,6 +335,20 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			sof_pdata->tplg_filename = sof_dmi_override_tplg_name;
 	}
 
+	path_override = &sof_pdata->ipc_file_profile_base;
+	path_override->ipc_type = sof_pdata->ipc_type;
+	path_override->fw_path = fw_path;
+	path_override->fw_name = fw_filename;
+	path_override->fw_lib_path = lib_path;
+	path_override->tplg_path = tplg_path;
+	path_override->tplg_name = sof_pdata->tplg_filename;
+
+	if (dmi_check_system(community_key_platforms) &&
+	    sof_dmi_use_community_key) {
+		path_override->fw_path_postfix = "community";
+		path_override->fw_lib_path_postfix = "community";
+	}
+
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
 
-- 
2.43.0

