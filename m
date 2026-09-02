Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D437A839
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336862; cv=none; b=UGqLkOVE1hqvjLvGqFYVBuBtSteeyEdCiInEqqsZwAlC0XdSRLS7BnM9LiaWWks0CvX8E5C9rX+jTMnGMcRqRbcWwgehtmkFIV5HDXz51lUHxF5iyhL2Cc6xd7u4roWKbH2pqJ3mPuqbiDG9WculHhya68l/XdFnEOhTbcRtqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336862; c=relaxed/simple;
	bh=Vj50uZqQXef+6M2IpMB37wL0UyfHzb9tzwWBKD/reXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RhWHj/xn2arm2N15gJm/0G4wdN0+cvmfKqTaA5CBAGzmR6bXHsJLK4Q3XUuopZ0s9VXgmE5XuJeImxTdB+2kSXg1Aw+nqxU/dS1nB2tV6GiJl4l4NiDFYZLd2Vb2gafWkGXzNXQA5IfdmENEPiGruUgEFDS6Xncn1Z8Y/ulnfQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhkMoBS4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhkMoBS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336859; x=1819872859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vj50uZqQXef+6M2IpMB37wL0UyfHzb9tzwWBKD/reXI=;
  b=WhkMoBS4dL3yE01w+CWjbmQaRUyJKkJVlbu480/05rYeDYhs/RYSQgjb
   oBnbk5lN5bfwqR2MFe1GVNkk5hCUtGUWimtk+E2Ej57jAAr5coBDPAVjR
   bto7z79jegfiXKQSR2H78XIEjDYO7XGfvy4bu/XahXf6iff3bTtHA/qaP
   2J5iRwVMdOvsLnPjepQDjfyR25vj0GJM4PmjCmobumYtnn2Zxvz1PULR4
   woedoH2Q6th5nNRKKMwLMu2Dytdy5uBcfunXuPJeAmFNwTYr5HEHt/b7N
   2p3eFuXAzyt2orfX1LnLMNDnfVm+uj4vHPOxDFTCmy9AFGoVHqtbTegsc
   w==;
X-CSE-ConnectionGUID: JXz0O9IzTaSu6gnFsKe5Og==
X-CSE-MsgGUID: wyz6Hp7cS7W3fEw9xxEHNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120999"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:14 -0700
X-CSE-ConnectionGUID: pap5Q9WORvuy7FmHHeL08w==
X-CSE-MsgGUID: fdAkU++hR92KgFVr8qNQHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099079"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 06/10] ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
Date: Wed,  2 Sep 2026 10:18:10 +0200
Message-Id: <20260902081814.1590883-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avs_load_topology() combines request_firmware() and
snd_soc_tplg_component_load().  The fallback mechanism introduced for
the HDAudio based boards honors -ENOENT and checks for a generic
topology if no specific is found before giving up and failing the
component probing.

However, if -ENOENT is returned by the latter function -
snd_soc_tplg_component_load() - is shall not be ignored.  That means
there is an actual problem with the topology file and no fallback shall
be attempted.

Fixes: 739c031110da ("ASoC: Intel: avs: Provide support for fallback topology")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      | 34 ++++++++++++++++++++--------------
 sound/soc/intel/avs/topology.c |  2 +-
 sound/soc/intel/avs/topology.h |  1 +
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2b886fae8209..ad25bd355769 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <sound/hda_register.h>
@@ -987,13 +988,25 @@ static int avs_component_load_libraries(struct avs_soc_component *acomp)
 	return ret;
 }
 
+static int avs_request_topology(struct snd_soc_component *component, const char *name,
+				const struct firmware **fw)
+{
+	char *fullname __free(kfree) = NULL;
+
+	fullname = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix, name);
+	if (!fullname)
+		return -ENOMEM;
+
+	return request_firmware(fw, fullname, component->dev);
+}
+
 static int avs_component_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 	struct snd_soc_acpi_mach *mach;
 	struct avs_soc_component *acomp;
+	const struct firmware *fw;
 	struct avs_dev *adev;
-	char *filename;
 	int ret;
 
 	dev_dbg(card->dev, "probing %s card %s\n", component->name, card->name);
@@ -1009,13 +1022,7 @@ static int avs_component_probe(struct snd_soc_component *component)
 		goto finalize;
 
 	/* Load specified topology and create debugfs for it. */
-	filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
-			     mach->tplg_filename);
-	if (!filename)
-		return -ENOMEM;
-
-	ret = avs_load_topology(component, filename);
-	kfree(filename);
+	ret = avs_request_topology(component, mach->tplg_filename, &fw);
 	if (ret == -ENOENT && !strncmp(mach->tplg_filename, "hda-", 4)) {
 		unsigned int vendor_id;
 
@@ -1030,18 +1037,17 @@ static int avs_component_probe(struct snd_soc_component *component)
 							     "hda-generic-tplg.bin");
 		if (!mach->tplg_filename)
 			return -ENOMEM;
-		filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
-				     mach->tplg_filename);
-		if (!filename)
-			return -ENOMEM;
 
 		dev_info(card->dev, "trying to load fallback topology %s\n", mach->tplg_filename);
-		ret = avs_load_topology(component, filename);
-		kfree(filename);
+		ret = avs_request_topology(component, mach->tplg_filename, &fw);
 	}
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_tplg_component_load(component, &avs_tplg_ops, fw);
+	if (ret)
+		return ret;
+
 	ret = avs_component_load_libraries(acomp);
 	if (ret < 0) {
 		dev_err(card->dev, "libraries loading failed: %d\n", ret);
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 673ac31f2fea..d5e641c73faf 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -2194,7 +2194,7 @@ avs_control_load(struct snd_soc_component *comp, int index, struct snd_kcontrol_
 	return 0;
 }
 
-static const struct snd_soc_tplg_ops avs_tplg_ops = {
+const struct snd_soc_tplg_ops avs_tplg_ops = {
 	.io_ops			= avs_control_ops,
 	.io_ops_count		= ARRAY_SIZE(avs_control_ops),
 	.control_load		= avs_control_load,
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 1cf7455b6c01..b5799c994b88 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -230,6 +230,7 @@ struct avs_tplg_module {
 	struct list_head node;
 };
 
+extern const struct snd_soc_tplg_ops avs_tplg_ops;
 struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp);
 
 int avs_load_topology(struct snd_soc_component *comp, const char *filename);
-- 
2.34.1

