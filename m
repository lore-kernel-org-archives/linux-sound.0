Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62B321F4C
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480224; cv=none; b=OfnvRWDTTzvW2IGXHrUoMIXcT/IkFzVvbJWYXhg7P++Yph4fDfvCg9uBaGGtdiptSMtENZMmrSNBqQ8dJhbOg+QNPgb836kwQ13230olvgarmBlquv+ehGeDXBcyyj8QMuY76FiCKRT0ZcqDPyWFps9SqGQrVmVtdwtyiLAVMFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480224; c=relaxed/simple;
	bh=kfSzKdeJxr5Iyb/w4lAoO53wey5wej8t7IVqkLQC4VI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WTYpPZby//4JMxkyZVdjAfTk0EV37kJru9zipevFbRj5SZ5xzf4/iLYoAzdkMfQwTyM0F/WLVrzG4195Ih1qrTDO2M34Zv0YWLoAZYLnaykF1Qfgw63zsfCHKZLLmmnlRc5Q5a68S3PbchpQ2JSN2klGCuYTshkTWhUfHHIvarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VI93Iath; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VI93Iath"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756480223; x=1788016223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kfSzKdeJxr5Iyb/w4lAoO53wey5wej8t7IVqkLQC4VI=;
  b=VI93IathtXzrmppa6kdMjY+BNfc1aVLCoKkmk6M0H5wLY4zcpsZAA5LG
   KTol+++R8SIm5bx3lNRc2mlFbzJ/gzeY+Wn6vpv5m6tq1xfDRTScsfENu
   +uC1LjyCgSxyWwUEUUmi03SckMTCatSj0ZdAuShmHPswQACWYtr1SKvDV
   BQ5jZO+V+GA+NtSd47HWj+YxIYwiXjN5g5lrSAF8CmN3jU1knRMzYwmcy
   5V6SGhCKRS2n3NPfFqE0OTd4Y0buVOT7Mzak4k6wW9VvTC9DCBo0+gM66
   0gllX/+uBAsn7GgfXTbW0x/qtZ+q6tE1bhoa5+t2WnKctPZGWZSM7y+fR
   A==;
X-CSE-ConnectionGUID: EPGUNxX6TMuvy6lLuZGqcw==
X-CSE-MsgGUID: 4Gj4Z6R8TmadaUZ642WjkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57791716"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="57791716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 08:10:22 -0700
X-CSE-ConnectionGUID: 3vR/eqONSJKFlNeljfljBQ==
X-CSE-MsgGUID: /xwqaIl3TqyBP7ITOhh2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170309697"
Received: from carterle-desk.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.76])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 08:10:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH] ASoC: sof: ipc4-topology: Add support to sched_domain attribute
Date: Fri, 29 Aug 2025 18:11:01 +0300
Message-ID: <20250829151101.27327-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add SOF_TKN_COMP_SCHED_DOMAIN and connect it to struct snd_sof_widget
comp_domain member, with new get_token_comp_domain() function.

The logic is such that if the topology attribute is not present in the
widget node the corresponding IPC4 extension value is taken from the
module's manifest like before. But if the attribute is found and
recognized its value overrides what is there in the manifest.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  2 ++
 sound/soc/sof/ipc4-topology.c   | 44 ++++++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.h   |  7 ++++++
 sound/soc/sof/sof-audio.h       |  3 +++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index c28c766270de..9ce72fbd6f11 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -106,6 +106,8 @@
  */
 #define SOF_TKN_COMP_NO_WNAME_IN_KCONTROL_NAME	417
 
+#define SOF_TKN_COMP_SCHED_DOMAIN		418
+
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
 #define SOF_TKN_INTEL_SSP_MCLK_ID		501
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 591ee30551ba..74a1319d4bd2 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -38,6 +38,36 @@ MODULE_PARM_DESC(ipc4_ignore_cpc,
 static DEFINE_IDA(alh_group_ida);
 static DEFINE_IDA(pipeline_ida);
 
+struct sof_comp_domains {
+	const char *name;
+	enum sof_comp_domain domain;
+};
+
+static const struct sof_comp_domains sof_domains[] = {
+	{ "LL", SOF_COMP_DOMAIN_LL, },
+	{ "DP", SOF_COMP_DOMAIN_DP, }
+};
+
+static enum sof_comp_domain find_domain(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sof_domains); i++) {
+		if (strcmp(name, sof_domains[i].name) == 0)
+			return sof_domains[i].domain;
+	}
+	/* No valid value found, fall back to manifest value */
+	return SOF_COMP_DOMAIN_UNSET;
+}
+
+static int get_token_comp_domain(void *elem, void *object, u32 offset)
+{
+	u32 *val = (u32 *)((u8 *)object + offset);
+
+	*val = find_domain((const char *)elem);
+	return 0;
+}
+
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, lp_mode)},
@@ -127,6 +157,8 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 		offsetof(struct snd_sof_widget, uuid)},
 	{SOF_TKN_COMP_CORE_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct snd_sof_widget, core)},
+	{SOF_TKN_COMP_SCHED_DOMAIN, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_domain,
+		offsetof(struct snd_sof_widget, comp_domain)},
 };
 
 static const struct sof_topology_token gain_tokens[] = {
@@ -497,7 +529,17 @@ static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_
 
 	msg->extension = SOF_IPC4_MOD_EXT_CORE_ID(swidget->core);
 
-	type = (fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP) ? 1 : 0;
+	switch (swidget->comp_domain) {
+	case SOF_COMP_DOMAIN_LL:
+		type = 0;
+		break;
+	case SOF_COMP_DOMAIN_DP:
+		type = 1;
+		break;
+	default:
+		type = (fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP) ? 1 : 0;
+		break;
+	}
 	msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(type);
 
 	return 0;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 14ba58d2be03..e8e848233314 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -109,6 +109,13 @@ enum sof_ipc4_copier_module_config_params {
 	SOF_IPC4_COPIER_MODULE_CFG_ATTENUATION,
 };
 
+/* Scheduling domain, unset, Low Latency, or Data Processing */
+enum sof_comp_domain {
+	SOF_COMP_DOMAIN_UNSET = 0,	/* Take domain value from manifest */
+	SOF_COMP_DOMAIN_LL,		/* Low Latency scheduling domain */
+	SOF_COMP_DOMAIN_DP,		/* Data Processing scheduling domain */
+};
+
 struct sof_ipc4_copier_config_set_sink_format {
 /* Id of sink */
 	u32 sink_id;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 36ab75e11779..db6973c8eac3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -451,6 +451,9 @@ struct snd_sof_widget {
 	 */
 	bool dynamic_pipeline_widget;
 
+	/* Scheduling domain (enum sof_comp_domain), unset, Low Latency, or Data Processing */
+	u32 comp_domain;
+
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
 	struct snd_sof_pipeline *spipe;
-- 
2.50.1

