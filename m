Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301045198D
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194325; cv=none; b=MiQqIyYwM9CcdcrKEaOeNWp4JnWGP4tlW1vIybTozt4Sf4NePsNrhCGaJ8VPdm/Sc2l/L14svDH2+OmNEmd8qTbwAqX5rII8s+qciWZ4EVPPBXIAIwLBrvdLteVkrB7ktKQDaOIgrcuJ/pylh+n3xIx5e7fJ5/scUmEFDQgdEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194325; c=relaxed/simple;
	bh=Vj50uZqQXef+6M2IpMB37wL0UyfHzb9tzwWBKD/reXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGJFD2KKoOHTCb6R/pL2ANv+HYygQp0+x+nlZjXiqN3m7Ymoert7YaDOESL+wwxgBMYTY657iqqgM0Gjt6xS+N5+MmqlrS4aIuYviitdO+w6bYYFh/LBof61iGQ05ja1KA3+G5+MPCbHkRn2hT0bti/xqMibUfdx9qD0HNiJ1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyulSRdI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyulSRdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194323; x=1819730323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vj50uZqQXef+6M2IpMB37wL0UyfHzb9tzwWBKD/reXI=;
  b=dyulSRdIYawzeLiaPThmQ8VlkSbbcihQcfqeqEqOCh8nRXzu6BlIuqT+
   Q5sPV5qPNe7rqUeYpDBOgxLc7oxq4UafA05HzHHyW1xZoJNkZ9ernRvia
   Rdg1m2yhoESKYa7g3fF0vDT1QqsJ9aHZMEq6uJmcLuyT5xOd8NRh8Ik9U
   FdIYhxURTs/Wis70xWcu5IDvRMCPleQHsHti91KYd7e4G9jYP0zgrgVvK
   jmdFRsOaO40xDORJyJnFFWQUvVMgTFyjcrUjaabh9iGqZiPIWGgyvfo3p
   cmGFwj1L/ec2237iEEdhP8+TFwSZa+NzJcCOfLtzR0UGKJMHVvA3RelBX
   w==;
X-CSE-ConnectionGUID: sFp9PBl1RBWvl8z5tDLAIQ==
X-CSE-MsgGUID: xbTZ/WSPRN2x+O2ghVYtdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379744"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:43 -0700
X-CSE-ConnectionGUID: q/loQTIaS7iBPfIe/Mdy9A==
X-CSE-MsgGUID: PtF8yFLnRUOEB4Y9Sx1OXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111836"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 06/10] ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
Date: Mon, 31 Aug 2026 18:42:29 +0200
Message-Id: <20260831164233.1487766-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

