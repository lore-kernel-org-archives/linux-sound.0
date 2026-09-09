Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955E49250C
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945026; cv=none; b=FYjnSCi8b2srd1ooivYWI8mdkdpMEkhu9pBQnRz+e1kqaBRZSzpZJcooAj/O7jvJfUvVTbdlJHC6c911qG8+SXcioPdd4acl8NSdTNRS0dBmuUASB+SrrLP1cDdpq4LAT9azA/Wq4v+7G2f3L5KWHptjpATO8Ftf2l+p2QUtzSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945026; c=relaxed/simple;
	bh=+eivWGp6kA36VCLOA1IYgs85VOt67Q/FhDxsnIVTtZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIXmT6x5f2qRkRzn5IFo9TU2+hfBA9Q/bHv/83wdPLgvC1fe+uUnLijJmYOC+H5UJIQLCD27KdbSSR6JXEK5woZqqG71erGFyM/ETS3Z7SKw1chKzXoMt6gDfZZNUPXaHJsNjanBVuvKs/MF/GO4EA6ZHczpKK7/2kr2xqdpp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPUWUkh+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPUWUkh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945025; x=1820481025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+eivWGp6kA36VCLOA1IYgs85VOt67Q/FhDxsnIVTtZ0=;
  b=YPUWUkh+ABUgQnacjEw7NCnYomXCfZrjOEwhbpYIvD92V/I6NjNkvYyl
   At7HKc+29XtNAO2nb2oN9rwfGcf79wD/NEUfeKNvLUip7ervYnkvrflEY
   5UVpdiNppjCwg/ogZ/vnGqhIiqtSoG937zCS3gBJcML8IyQuX1qqvRpSt
   Ekt6jvhtVnsKkWUvAR+jQJxvGiI6RVkgOniuXdN8zN/UG7m5JqnTdbdf/
   wgYKuqd/168gNqVuuO3jxUFXejImD3im0BlJMXPqE7JzM5JusBJ8FDnFa
   hN4mlgNRVdQBeIk7Bt3th1UnB7QPIc0LrT5VkRPz0Bb2owcEJEhGbXZTF
   w==;
X-CSE-ConnectionGUID: w/dM/mKhSCa8Wlxq2Vf/Iw==
X-CSE-MsgGUID: evAqbZa6SKa1GeWuvpy/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200748"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200748"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:25 -0700
X-CSE-ConnectionGUID: oLcoW0WARrqufWQQakV/GA==
X-CSE-MsgGUID: QKLTXbMoQ4ezPxVRLqqQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973136"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v2 15/24] ASoC: SOF: ipc4-topology: Support init_ext_module_data for process modules
Date: Wed,  9 Sep 2026 12:09:40 +0300
Message-ID: <20260909090949.7503-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for handling init_ext_module_data for process modules, which is
going to be used by decoder and encoder type of process modules.
The support is generic and it can be extended to other type of process
modules or other module types than process with a small update of
sof_ipc4_add_init_ext_module_data() function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 101 ++++++++++++++++++++++------------
 sound/soc/sof/ipc4-topology.h |   4 ++
 sound/soc/sof/sof-audio.h     |   1 +
 3 files changed, 72 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 24a1175dd690..42cf444e847e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3263,22 +3263,56 @@ static void sof_ipc4_add_init_ext_dp_memory_data(struct snd_sof_dev *sdev,
 						 u32 *payload, u32 *ext_pos,
 						 struct sof_ipc4_module_init_ext_object **hdr)
 {
-	/* Add memory_data if comp_domain indicates DP */
-	if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
-		struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
-
-		*hdr = (struct sof_ipc4_module_init_ext_object *)&payload[*ext_pos];
-		(*hdr)->header =
-			SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
-			SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
-								     sizeof(u32)));
-		*ext_pos += DIV_ROUND_UP(sizeof(**hdr), sizeof(u32));
-		dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[*ext_pos];
-		dp_mem_data->domain_id = swidget->domain_id;
-		dp_mem_data->stack_bytes = swidget->stack_bytes;
-		dp_mem_data->heap_bytes = swidget->heap_bytes;
-		*ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
+	struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
+
+	*hdr = (struct sof_ipc4_module_init_ext_object *)&payload[*ext_pos];
+	(*hdr)->header =
+		SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
+		SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
+							     sizeof(u32)));
+	*ext_pos += DIV_ROUND_UP(sizeof(**hdr), sizeof(u32));
+	dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[*ext_pos];
+	dp_mem_data->domain_id = swidget->domain_id;
+	dp_mem_data->stack_bytes = swidget->stack_bytes;
+	dp_mem_data->heap_bytes = swidget->heap_bytes;
+	*ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
+}
+
+static int
+sof_ipc4_add_init_ext_module_data(struct snd_sof_dev *sdev,
+				  struct sof_ipc4_process *process,
+				  u32 *payload, u32 *ext_pos,
+				  struct sof_ipc4_module_init_ext_object **hdr)
+{
+	u32 data_size = process->init_ext_module_size;
+	void *data = process->init_ext_module_data;
+	size_t needed;
+
+	/*
+	 * Unlike the other objects, the module data is of variable size,
+	 * provided by the module which is being set up.
+	 * Make sure that the object fits into the payload buffer before any of
+	 * it is written.
+	 */
+	needed = ((size_t)*ext_pos + DIV_ROUND_UP(sizeof(**hdr), sizeof(u32)) +
+		  DIV_ROUND_UP(data_size, sizeof(u32))) * sizeof(u32);
+	if (needed > sdev->ipc->max_payload_size) {
+		dev_err(sdev->dev,
+			"Max ipc payload size %zu exceeded by module data: %zu\n",
+			sdev->ipc->max_payload_size, needed);
+		return -EINVAL;
 	}
+
+	*hdr = (struct sof_ipc4_module_init_ext_object *)&payload[*ext_pos];
+	(*hdr)->header = SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA) |
+		SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(data_size, sizeof(u32)));
+	*ext_pos += DIV_ROUND_UP(sizeof(*(*hdr)), sizeof(u32));
+
+	memcpy(&payload[*ext_pos], data, data_size);
+
+	*ext_pos += DIV_ROUND_UP(data_size, sizeof(u32));
+
+	return 0;
 }
 
 static int sof_ipc4_widget_mod_init_msg_payload(struct snd_sof_dev *sdev,
@@ -3287,17 +3321,17 @@ static int sof_ipc4_widget_mod_init_msg_payload(struct snd_sof_dev *sdev,
 						void *ipc_data, u32 ipc_size,
 						void **new_data)
 {
-	struct sof_ipc4_module_init_ext_init *ext_init;
+	struct sof_ipc4_process *process = swidget->private;
 	struct sof_ipc4_module_init_ext_object *hdr = NULL;
+	struct sof_ipc4_module_init_ext_init *ext_init;
+	bool in_dp_domain = swidget->comp_domain == SOF_COMP_DOMAIN_DP;
+	bool has_ext_data = WIDGET_IS_PROCESS(swidget->id) && process->init_ext_module_size;
 	int new_size;
 	u32 *payload;
 	u32 ext_pos;
+	int ret;
 
-	/*
-	 * Only DP widgets currently add init-ext objects here. Avoid allocating
-	 * a max-sized payload buffer for widgets that will immediately return 0.
-	 */
-	if (swidget->comp_domain != SOF_COMP_DOMAIN_DP)
+	if (!in_dp_domain && !has_ext_data)
 		return 0;
 
 	payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
@@ -3306,25 +3340,24 @@ static int sof_ipc4_widget_mod_init_msg_payload(struct snd_sof_dev *sdev,
 
 	/* Add ext_init first and set objects array flag to 1 */
 	ext_init = (struct sof_ipc4_module_init_ext_init *)payload;
+	ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
 	ext_pos = DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
 
 	/* Add object array objects after ext_init */
+	if (in_dp_domain)
+		sof_ipc4_add_init_ext_dp_memory_data(sdev, swidget, payload,
+						     &ext_pos, &hdr);
 
-	sof_ipc4_add_init_ext_dp_memory_data(sdev, swidget, payload, &ext_pos, &hdr);
-
-	/* Add following object array items here */
-
-	if (!hdr) {
-		/*
-		 * NOTE: Remove this early bail out, when struct
-		 *       sof_ipc4_module_init_ext_init alone has some
-		 *       function.
-		 */
-		kfree(payload);
-		return 0;
+	if (has_ext_data) {
+		ret = sof_ipc4_add_init_ext_module_data(sdev, process, payload,
+							&ext_pos, &hdr);
+		if (ret) {
+			kfree(payload);
+			return ret;
+		}
 	}
 
-	ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
+	/* Set last bit for the last object in the array */
 	hdr->header |= SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK;
 
 	/* Calculate final size and check that it fits to max payload size */
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index c9fe9f2e4083..5e78f3de092e 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -524,6 +524,8 @@ struct sof_ipc4_base_module_cfg_ext {
  * @msg: IPC4 message struct containing header and data info
  * @base_config_ext_size: Size of the base config extension data in bytes
  * @init_config: Module init config type (SOF_IPC4_MODULE_INIT_CONFIG_TYPE_*)
+ * @init_ext_module_data: module_data for init_ext object
+ * @init_ext_module_size: size of init_ext_module_data
  */
 struct sof_ipc4_process {
 	struct sof_ipc4_base_module_cfg base_config;
@@ -535,6 +537,8 @@ struct sof_ipc4_process {
 	struct sof_ipc4_msg msg;
 	u32 base_config_ext_size;
 	u32 init_config;
+	void *init_ext_module_data;
+	size_t init_ext_module_size;
 };
 
 bool sof_ipc4_copier_is_single_bitdepth(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 0610f2ab844d..151cfa9e6b7c 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -43,6 +43,7 @@
 #define WIDGET_IS_AIF(id) ((id) == snd_soc_dapm_aif_in || (id) == snd_soc_dapm_aif_out)
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 #define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
+#define WIDGET_IS_PROCESS(id) ((id) == snd_soc_dapm_effect)
 
 #define SOF_DAI_PARAM_INTEL_SSP_MCLK		0
 #define SOF_DAI_PARAM_INTEL_SSP_BCLK		1
-- 
2.55.0

