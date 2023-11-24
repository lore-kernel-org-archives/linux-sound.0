Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfLgMCJP"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E5819AC
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 07:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838505; x=1732374505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sAbL/9fT4i9PcgRw+oqz5zY9NBNgphu0jOWdBEs6aj0=;
  b=IfLgMCJP1YGebK4MR741VfSiP+0D3RMKmYqZflev2/OAZ7i8Kaz/7X8D
   aMNiCyANYF1oq5xUOgm9RZTO4qyP23dIpgzwN9tbvST7yLMMD9vjLh59G
   qhm9YpTVAX7szJVkKnpDnSaopsKvhN7x+9SHewtPAFfBZj9Y+rHpEAZrN
   qlvShb+/srusdNNwsKhd/N7Y4PWyg52sCkavGIvxexlAoBuEKQ+jwX77n
   xxyxwqjbYdpV0xsaNNRzBO5RJmG6swGD4bhiQ+oSNK7W/lTasJQYT/+88
   MQeX4wpeGJyAOFimYGZQWwIS3atfoXs37UcjHqGKdl/rVIOUOHi69+dEj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477035"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377477035"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915676"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="743915676"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 1/4] ASoC: SOF: ipc4-topology: Helper to find an swidget by module/instance id
Date: Fri, 24 Nov 2023 17:08:50 +0200
Message-ID: <20231124150853.18648-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sof_ipc4_find_swidget_by_ids() can be used to find the swidget of a
module instance.
The lookup parameters are the module_id and the instance_id.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h     |  3 +++
 sound/soc/sof/ipc4-topology.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 9e69b7c29117..fea93b693f4d 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -115,6 +115,9 @@ int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev);
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid);
 
+struct snd_sof_widget *sof_ipc4_find_swidget_by_ids(struct snd_sof_dev *sdev,
+						    u32 module_id, int instance_id);
+
 struct sof_ipc4_base_module_cfg;
 void sof_ipc4_update_cpc_from_manifest(struct snd_sof_dev *sdev,
 				       struct sof_ipc4_fw_module *fw_module,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b24a64377f68..8ab9c42069ee 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -167,6 +167,26 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
 };
 
+struct snd_sof_widget *sof_ipc4_find_swidget_by_ids(struct snd_sof_dev *sdev,
+						    u32 module_id, int instance_id)
+{
+	struct snd_sof_widget *swidget;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+
+		/* Only active module instances have valid instance_id */
+		if (!swidget->use_count)
+			continue;
+
+		if (fw_module && fw_module->man4_module_entry.id == module_id &&
+		    swidget->instance_id == instance_id)
+			return swidget;
+	}
+
+	return NULL;
+}
+
 static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_format *pin_fmt,
 				      int num_formats)
 {
-- 
2.42.1

