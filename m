Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21116130B
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839105; cv=none; b=TEh5APlsWH7H9+wjK1Egg1TISJaBMY3s61M7p5jwXYGqQ6EXxWNgCsHF0XutqlMGHargG1HFUcUwzWXlWCHHbQfUwK2HDhYeCH1Kwqyka1VKd8onBPGrPv4wsuAT63p1cWVJh8Jyf6b49/3tmTTMvVtH45dQRyrAdwsW4GhrwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839105; c=relaxed/simple;
	bh=i/Sxzx7HEvn6QqI+A26bFfrZ3QFeVcHTmAAQt647UdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxEkgem2XlfjdBriwdRAzyt5AgsFMZU9WSILMiQW6qwBYOziTD0WOOHVedO//tCqOGBg4bZAZYVNo8fEQujZHVu1bJq1g2qWkVBnqFlE3BmRUsxN8Eg4wopBauEkxRLvrsGmsPd7R7Z0N+uVwCGEMc4lA1bADkRi0TLOEnnQzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFGp/l5C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFGp/l5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839104; x=1748375104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/Sxzx7HEvn6QqI+A26bFfrZ3QFeVcHTmAAQt647UdI=;
  b=EFGp/l5CuIM0n38AGfE91NVdkwkdg+nLvLOoCQ5tSn+G6zDdt6+Li2fw
   LauBjmmtgfsWeltcrM/vPYgehKpz+qVB+2tGKfwDm1aS76jrX4MFpWABv
   psRDPhY08TW8kjOCJQRfrkpoNd2zwEWu1D+3TKcb65inLHm7k79MSYy85
   TNF19u+1ns8CVmu5TFAhGe+Jzg0CB6Nj7Hz4GA6q/2bHC4YJi3cKi+90G
   0U6nc0qhce71C0R/oatQZPcEQ8wK8XdF6ISaP8GeeC/46rPwaklYUCY+p
   C62V7+Z5Nlw2L+yDebuCbBzW1FOWD7kqsaKvYppeJxNM1UjqyY1gtc4Rm
   A==;
X-CSE-ConnectionGUID: 31MMX0SBTLWu87X1lQLJRA==
X-CSE-MsgGUID: bb50isxTRIGJZAOfT8gdiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679485"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="30679485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:03 -0700
X-CSE-ConnectionGUID: EllWY/9bQ2+ZGIsdbRJKYw==
X-CSE-MsgGUID: qr+92Qk1RNCQQREPu+TGnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39280545"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: AMD: group all module related information
Date: Mon, 27 May 2024 14:44:12 -0500
Message-ID: <20240527194414.166156-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The module information is spread across files, group in a single
location.  For maintenability and alignment, the arbitrary Intel
convention is used with the following order:

MODULE_LICENSE
MODULE_DESCRIPTION
MODULE_IMPORT

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/amd/acp63.c       | 4 ----
 sound/soc/sof/amd/pci-acp63.c   | 1 +
 sound/soc/sof/amd/pci-rmb.c     | 1 +
 sound/soc/sof/amd/pci-rn.c      | 1 +
 sound/soc/sof/amd/pci-vangogh.c | 1 +
 sound/soc/sof/amd/rembrandt.c   | 4 ----
 sound/soc/sof/amd/renoir.c      | 4 ----
 sound/soc/sof/amd/vangogh.c     | 4 ----
 8 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/amd/acp63.c b/sound/soc/sof/amd/acp63.c
index 9fb645079c3a..9e6eb4bfc805 100644
--- a/sound/soc/sof/amd/acp63.c
+++ b/sound/soc/sof/amd/acp63.c
@@ -140,7 +140,3 @@ int sof_acp63_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("ACP63 SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index eeaa12cceb23..fc8984447365 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -109,5 +109,6 @@ static struct pci_driver snd_sof_pci_amd_acp63_driver = {
 module_pci_driver(snd_sof_pci_amd_acp63_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("ACP63 SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 2f288545c426..4bc30951f8b0 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -99,5 +99,6 @@ static struct pci_driver snd_sof_pci_amd_rmb_driver = {
 module_pci_driver(snd_sof_pci_amd_rmb_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("REMBRANDT SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index a0195e9b400c..e08875bdfa8b 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -103,5 +103,6 @@ static struct pci_driver snd_sof_pci_amd_rn_driver = {
 module_pci_driver(snd_sof_pci_amd_rn_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("RENOIR SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index 5cd3ac84752f..16eb2994fbab 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -101,5 +101,6 @@ static struct pci_driver snd_sof_pci_amd_vgh_driver = {
 module_pci_driver(snd_sof_pci_amd_vgh_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("VANGOGH SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/rembrandt.c b/sound/soc/sof/amd/rembrandt.c
index f1d1ba57ab3a..076f2f05a95c 100644
--- a/sound/soc/sof/amd/rembrandt.c
+++ b/sound/soc/sof/amd/rembrandt.c
@@ -140,7 +140,3 @@ int sof_rembrandt_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("REMBRANDT SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 47b863f6258c..aa2d24dac6f5 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -115,7 +115,3 @@ int sof_renoir_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("RENOIR SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
index bc6ffdb5471a..61372958c09d 100644
--- a/sound/soc/sof/amd/vangogh.c
+++ b/sound/soc/sof/amd/vangogh.c
@@ -161,7 +161,3 @@ int sof_vangogh_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("VANGOGH SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0

