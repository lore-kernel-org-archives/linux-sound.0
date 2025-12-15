Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999D32ABFE
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793419; cv=none; b=ldgpeRr9ZOoF6fAr5moS5pfZldfoDVyN9wFl8OXqkeoz+8OOIUvMeQoNrUWtDgTN0Fv5fzqtPEVQSwTkxKCo7YlPUSB45KDA8mKlDStBZLDORDNyXaXN5aDndW629XuZFB7S+g4RyGUGmviBPSv//qKS099sCEsaKKaMiNQOs84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793419; c=relaxed/simple;
	bh=ayhbtDwyU7RGRsAgFvTZuU5gsHh+PT4eLffwndIb6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6Sz8hxjcJ4b1LYECVaDLh5bSxxyhmA1nAulU/ktcwI3+90cibRZW+QkvvZMqQAon+Sf+/NN7YV6w7F6PoDaHRJWFWBdA0gRbif7ymBZMZB4dQz/CYtBW5dbNdVcwZEOPh0mdM5gXFXMuRfV3UqI7xEr4XczERdobhRoL+QNuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MY/XUzo0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MY/XUzo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765793417; x=1797329417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ayhbtDwyU7RGRsAgFvTZuU5gsHh+PT4eLffwndIb6Q8=;
  b=MY/XUzo0DYOCFr0ZVfA7ONkwmDMeVvZMsbS3Xkep+Ohhu2dksAK7n2Ys
   hnADOw1UdQUVAcJwYp5Ajxd4WTm4VQPm82sPHSIdpGja5h+QCyph9ZIGX
   PXLKDY5nZkedAq9HjuYG4JHWm0jbEPji9oBT9YuG+t9irxBESvGq9IDdQ
   09YqCxDEyptbTSyCWo47X2Y9QaQDfB8yuqS4re2eT2a8xVeY4WXrjXkfd
   SWGdwEyiZcOOUrUElMQl1jzac6hOsQwPFusois6Cx4DUSt+S1SzpODMJa
   o9mcZmr/0Yp+PRgVCc0HisBZWUtOoH9ki1huR6zoGN5/3GejStB/K+xox
   w==;
X-CSE-ConnectionGUID: 4ym4z/gZTyiXqkyA00HgoQ==
X-CSE-MsgGUID: c3btdC9qT4K116J4Fv9lnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85282899"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85282899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:10:17 -0800
X-CSE-ConnectionGUID: MBfKlEJSQQuCR8L4erGXKA==
X-CSE-MsgGUID: 3CEeCsqqTPakvXbl/o00hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201872308"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:10:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	tiwai@suse.de
Subject: [PATCH for 6.19 1/2] ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files op
Date: Mon, 15 Dec 2025 12:10:35 +0200
Message-ID: <20251215101036.9370-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
References: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there is no fallback possibility available for the function topology
use it is better to try to create  a profile for the card in best effort
manner, leaving out non supported links for example.

As an example: some laptops present SSPx-BT link but we don't have fragment
yet to support this. If we only have support for functional topology
without monolithic fallback then we would fail the card creation.
The reason why the monolithic topology works on the same device is that it
does not have the SSPx-BT link handled, it is ignored.

In case when there is no fallback possibility we should try to create the
card with links that we support as best effort instead of failing and
leaving the user without a card.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-acpi.h                       |  5 ++++-
 .../intel/common/sof-function-topology-lib.c   |  5 ++++-
 .../intel/common/sof-function-topology-lib.h   |  2 +-
 sound/soc/sof/topology.c                       | 18 +++++++++++++++++-
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 90d73b9bddab..0519afd7217f 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -203,6 +203,8 @@ struct snd_soc_acpi_link_adr {
  *	@mach: the pointer of the machine driver
  *	@prefix: the prefix of the topology file name. Typically, it is the path.
  *	@tplg_files: the pointer of the array of the topology file names.
+ *	@best_effort: ignore non supported links and try to build the card in best effort
+ *		      with supported links
  */
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
@@ -224,7 +226,8 @@ struct snd_soc_acpi_mach {
 	const u32 tplg_quirk_mask;
 	int (*get_function_tplg_files)(struct snd_soc_card *card,
 				       const struct snd_soc_acpi_mach *mach,
-				       const char *prefix, const char ***tplg_files);
+				       const char *prefix, const char ***tplg_files,
+				       bool best_effort);
 };
 
 #define SND_SOC_ACPI_MAX_CODECS 3
diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index b10d4794159a..0daa7d83808b 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -28,7 +28,7 @@ enum tplg_device_id {
 #define SOF_INTEL_PLATFORM_NAME_MAX 4
 
 int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
-			   const char *prefix, const char ***tplg_files)
+			   const char *prefix, const char ***tplg_files, bool best_effort)
 {
 	struct snd_soc_acpi_mach_params mach_params = mach->mach_params;
 	struct snd_soc_dai_link *dai_link;
@@ -87,6 +87,9 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 			dev_dbg(card->dev,
 				"dai_link %s is not supported by separated tplg yet\n",
 				dai_link->name);
+			if (best_effort)
+				continue;
+
 			return 0;
 		}
 		if (tplg_mask & BIT(tplg_dev))
diff --git a/sound/soc/intel/common/sof-function-topology-lib.h b/sound/soc/intel/common/sof-function-topology-lib.h
index e7d0c39d0788..f358f8c52d78 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.h
+++ b/sound/soc/intel/common/sof-function-topology-lib.h
@@ -10,6 +10,6 @@
 #define _SND_SOC_ACPI_INTEL_GET_TPLG_H
 
 int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
-			   const char *prefix, const char ***tplg_files);
+			   const char *prefix, const char ***tplg_files, bool best_effort);
 
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c1083ea4624a..c76545e70860 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2506,12 +2506,28 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (!tplg_files)
 		return -ENOMEM;
 
+	/* Try to use function topologies if possible */
 	if (!sof_pdata->disable_function_topology && !disable_function_topology &&
 	    sof_pdata->machine && sof_pdata->machine->get_function_tplg_files) {
+		/*
+		 * When the topology name contains 'dummy' word, it means that
+		 * there is no fallback option to monolithic topology in case
+		 * any of the function topologies might be missing.
+		 * In this case we should use best effort to form the card,
+		 * ignoring functionalities that we are missing a fragment for.
+		 *
+		 * Note: monolithic topologies also ignore these possibly
+		 * missing functions, so the functionality of the card would be
+		 * identical to the case if there would be a fallback monolithic
+		 * topology created for the configuration.
+		 */
+		bool no_fallback = strstr(file, "dummy");
+
 		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
 								       sof_pdata->machine,
 								       tplg_filename_prefix,
-								       &tplg_files);
+								       &tplg_files,
+								       no_fallback);
 		if (tplg_cnt < 0) {
 			kfree(tplg_files);
 			return tplg_cnt;
-- 
2.52.0

