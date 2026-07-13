Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68529349CC4
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965317; cv=none; b=JLSLEtPEhPv7rwEUQyFfDvSrVSqktaFnJ4tAaCWmX2Mas9u3ls1/YTuKtDBnbOqfJhgD8OGASo+zqi1xit+2+o0Jfa+QzzI1xNR28JyRheFVNJkKKAngsu72M6yhs4AHDvPZXEb+TtGlrhn2aS4JOfvZHUs96sd5ZJf4QYW6BP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965317; c=relaxed/simple;
	bh=0+KB2FaE9jYS4A06Hqul24oFw8PFDJT4rsVtpaa8xxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sroGqGXINA1wZoO24p85pHxFTMwZDVENq7vHdB7ljZHCFBHGSFJc27bCN/3NbLAYNUQaB9SdNQ4AhDqurcI+EaiWVIiS9DhalLE5eNTfzlVIgJVB93UdvtMO5FDrUjJsY1UBG1xPgpiO4FxNI2foDFZrLRrWn+bPpWPdv9p61Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=5BSx+dOb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="5BSx+dOb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EijbFDQdsOvevGQVCfHaHxg8RUgF3geDkwMQ8z45jn4=; b=5BSx+dObpfhK9kX7JT9suZnpm+
	n/aecss5o9YPwqAFI0hTW4YwvcWwCEO6T3ov44IIOCw5ZrFd55QvZ3OlhyKnzr15IWhKzYvgZNqkF
	Qa27xOKlHGE+X6t046sxLC+azPTeGZrFLECMXD67oQZEZxOmNAmTaesQGGD5Yb+Kx6DT9EbxaKIRg
	ZvsZBUyv9a2+31rDM5vueXnd6/nkajom1laFVt6lbJ5GsN79mZZvKzmnxOYxwW5V3ZzTCa4WsPxfE
	lOgfopNxk9TCxQGqGbV/kECgGimUsWjfcLyBr2n+GWIJOzeKp648rZ79Qz6hqmmG7Csvjc0h+Kngi
	rRvPvDzg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKs4-0000000A9bo-1UHv;
	Mon, 13 Jul 2026 17:55:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: repair struct kernel-doc comments
Date: Mon, 13 Jul 2026 10:55:10 -0700
Message-ID: <20260713175510.524728-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713175510.524728-1-rdunlap@infradead.org>
References: <20260713175510.524728-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct struct names in the kernel-doc comments.
Add missing struct member descriptions.

This prevents all kernel-doc warnings:
Warning: ../sound/soc/sof/ipc4-topology.h:176 expecting prototype for struct sof_ipc4_multi_pipeline_data. Prototype was for struct ipc4_pipeline_set_state_data instead
Warning: ../sound/soc/sof/ipc4-topology.h:307 expecting prototype for struct sof_ipc4_dma_config. Prototype was for struct sof_ipc4_dma_config_tlv instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: sound-open-firmware@alsa-project.org

 sound/soc/sof/ipc4-topology.h |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- linext-2026-0710.orig/sound/soc/sof/ipc4-topology.h
+++ linext-2026-0710/sound/soc/sof/ipc4-topology.h
@@ -167,7 +167,7 @@ struct sof_ipc4_pipeline {
 };
 
 /**
- * struct sof_ipc4_multi_pipeline_data - multi pipeline trigger IPC data
+ * struct ipc4_pipeline_set_state_data - multi pipeline trigger IPC data
  * @count: Number of pipelines to be triggered
  * @pipeline_instance_ids: Flexible array of IDs of the pipelines to be triggered
  */
@@ -210,7 +210,7 @@ struct sof_ipc4_available_audio_format {
  * @node_id: ID of Gateway Node
  * @dma_buffer_size: Preferred Gateway DMA buffer size (in bytes)
  * @config_length: Length of gateway node configuration blob specified in #config_data
- * config_data: Gateway node configuration blob
+ * @config_data: Gateway node configuration blob
  */
 struct sof_copier_gateway_cfg {
 	uint32_t node_id;
@@ -285,7 +285,9 @@ struct sof_ipc4_dma_stream_ch_map {
 struct sof_ipc4_dma_config {
 	uint8_t dma_method;
 	uint8_t pre_allocated_by_host;
+	/* private: */
 	uint16_t rsvd;
+	/* public: */
 	uint32_t dma_channel_id;
 	uint32_t stream_id;
 	struct sof_ipc4_dma_stream_ch_map dma_stream_channel_map;
@@ -296,7 +298,7 @@ struct sof_ipc4_dma_config {
 #define SOF_IPC4_GTW_DMA_CONFIG_ID 0x1000
 
 /**
- * struct sof_ipc4_dma_config: DMA configuration
+ * struct sof_ipc4_dma_config_tlv - DMA configuration
  * @type: set to SOF_IPC4_GTW_DMA_CONFIG_ID
  * @length: sizeof(struct sof_ipc4_dma_config) + dma_config.dma_priv_config_size
  * @dma_config: actual DMA configuration
@@ -321,6 +323,7 @@ struct sof_ipc4_alh_configuration_blob {
  * @data: IPC copier data
  * @copier_config: Copier + blob
  * @ipc_config_size: Size of copier_config
+ * @ipc_config_data: Copier module config data
  * @available_fmt: Available audio format
  * @frame_fmt: frame format
  * @msg: message structure for copier
