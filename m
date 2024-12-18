Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA1019C558;
	Wed, 18 Dec 2024 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508949; cv=none; b=YeyxRxJhI6/zzTTEUD1uij/iKTa9wfZHJKx3XcuP+uLHzxmYmTNRlnotmkH0zW2vC9JDoZ+9UZoKPOEqKEpiDOnanVHnXTD/BDEKLMZYtykzok/yvcNCMTVS+wsb+fMwQuY5bvUSM1rqDIPWD+x6SRm7jGR67U1GFrlYniyPRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508949; c=relaxed/simple;
	bh=l3C1DNKZuZgwzTU3jGcdFt7RGjCXX2MCNcdMqZG+jIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqMvTKHVqBGB0GAARqb7CuB+6f979SIokDS1qM+gelkDigU0YAdat4oWwCvQTiaoCyiXp3M6KQlrMRDKcdz4OwL02wCTy7NEfmI5LsFoPw7XJdXX5bMEVMkAC8Rz8x0NfsgJ4wl7xbZKYDfd54i9oJ7rRY12qmasyhR3L47J9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEscAD7b; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEscAD7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508948; x=1766044948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l3C1DNKZuZgwzTU3jGcdFt7RGjCXX2MCNcdMqZG+jIY=;
  b=hEscAD7bs34Qnd601LLFwDY/nrpiGblLa0dS4HkqXec3ZcRIFtQLFS5m
   bo0tbH3SRHj29734Q1KsKsYfOAIPBEc9Op0aeytXdKr5+QIYmpsMNxs2m
   sTSmOZjNu7yCvXBCqLaiOrU42QCN9GPGmP/twkF8L+sW5nSKdXx40vpjA
   zVZ2UTQJAoJOIqgetKCQ5HB912HhDxOgYL37saKwwxbffHMKuuABY7HhS
   4wtz71a+X4LsiRigCLcD/2+Er1cNfpGV2s+ju6Kr7U2cB2rd6ZCkaERsV
   yiVftKdWtu/Q8VadISvM9ISUvtn58ownVaVIUhAnm5HKPXpOLuWvnxgXH
   w==;
X-CSE-ConnectionGUID: nHtxvcejRQKi2DQYUGZMTA==
X-CSE-MsgGUID: cSe4H/12Qe6tZ3AVU4s0qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978647"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:22 -0800
X-CSE-ConnectionGUID: Lil4Fy2ITd+Kkevz3jhDPg==
X-CSE-MsgGUID: 2JHwjhqxS6S62hFiAfEc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914722"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 13/14] SoundWire: pass stream to compute_params()
Date: Wed, 18 Dec 2024 16:01:54 +0800
Message-ID: <20241218080155.102405-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
References: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The stream parameter will be used in the follow up commit.
No function change.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/amd_manager.c               |   2 +-
 .../soundwire/generic_bandwidth_allocation.c  |  11 +-
 drivers/soundwire/qcom.c                      |   2 +-
 drivers/soundwire/stream.c                    |   4 +-
 include/linux/soundwire/sdw.h                 | 182 +++++++++---------
 5 files changed, 102 insertions(+), 99 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index f47d4cd656ae..0ee792176f22 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -384,7 +384,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	return slave_stat;
 }
 
-static int amd_sdw_compute_params(struct sdw_bus *bus)
+static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct sdw_transport_data t_data = {0};
 	struct sdw_master_runtime *m_rt;
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index faf04d82ba0a..062e7488b226 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -170,6 +170,7 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 }
 
 static int sdw_compute_group_params(struct sdw_bus *bus,
+				    struct sdw_stream_runtime *stream,
 				    struct sdw_group_params *params,
 				    struct sdw_group *group)
 {
@@ -319,8 +320,9 @@ static int sdw_get_group_count(struct sdw_bus *bus,
  * sdw_compute_port_params: Compute transport and port parameters
  *
  * @bus: SDW Bus instance
+ * @stream: Soundwire stream
  */
-static int sdw_compute_port_params(struct sdw_bus *bus)
+static int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct sdw_group_params *params = NULL;
 	struct sdw_group group;
@@ -340,7 +342,7 @@ static int sdw_compute_port_params(struct sdw_bus *bus)
 	}
 
 	/* Compute transport parameters for grouped streams */
-	ret = sdw_compute_group_params(bus, params, &group);
+	ret = sdw_compute_group_params(bus, stream, params, &group);
 	if (ret < 0)
 		goto free_params;
 
@@ -592,8 +594,9 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
  * sdw_compute_params: Compute bus, transport and port parameters
  *
  * @bus: SDW Bus instance
+ * @stream: Soundwire stream
  */
-int sdw_compute_params(struct sdw_bus *bus)
+int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	int ret;
 
@@ -603,7 +606,7 @@ int sdw_compute_params(struct sdw_bus *bus)
 		return ret;
 
 	/* Compute transport and port params */
-	ret = sdw_compute_port_params(bus);
+	ret = sdw_compute_port_params(bus, stream);
 	if (ret < 0) {
 		dev_err(bus->dev, "Compute transport params failed: %d\n", ret);
 		return ret;
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 2b403b14066c..fd98f05bf56d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1072,7 +1072,7 @@ static const struct sdw_master_ops qcom_swrm_ops = {
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
 
-static int qcom_swrm_compute_params(struct sdw_bus *bus)
+static int qcom_swrm_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	struct sdw_master_runtime *m_rt;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 892409cdb88c..e9df503332bb 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1419,7 +1419,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 			/* Compute params */
 			if (bus->compute_params) {
-				ret = bus->compute_params(bus);
+				ret = bus->compute_params(bus, stream);
 				if (ret < 0) {
 					dev_err(bus->dev, "Compute params failed: %d\n",
 						ret);
@@ -1721,7 +1721,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 		/* Compute params */
 		if (bus->compute_params) {
-			ret = bus->compute_params(bus);
+			ret = bus->compute_params(bus, stream);
 			if (ret < 0) {
 				dev_err(bus->dev, "Compute params failed: %d\n",
 					ret);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index fc0a203c3ae0..2d6c30317792 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -855,6 +855,95 @@ struct sdw_master_ops {
 					int dev_num);
 };
 
+int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
+		       struct fwnode_handle *fwnode);
+void sdw_bus_master_delete(struct sdw_bus *bus);
+
+void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
+
+/**
+ * sdw_port_config: Master or Slave Port configuration
+ *
+ * @num: Port number
+ * @ch_mask: channels mask for port
+ */
+struct sdw_port_config {
+	unsigned int num;
+	unsigned int ch_mask;
+};
+
+/**
+ * sdw_stream_config: Master or Slave stream configuration
+ *
+ * @frame_rate: Audio frame rate of the stream, in Hz
+ * @ch_count: Channel count of the stream
+ * @bps: Number of bits per audio sample
+ * @direction: Data direction
+ * @type: Stream type PCM or PDM
+ */
+struct sdw_stream_config {
+	unsigned int frame_rate;
+	unsigned int ch_count;
+	unsigned int bps;
+	enum sdw_data_direction direction;
+	enum sdw_stream_type type;
+};
+
+/**
+ * sdw_stream_state: Stream states
+ *
+ * @SDW_STREAM_ALLOCATED: New stream allocated.
+ * @SDW_STREAM_CONFIGURED: Stream configured
+ * @SDW_STREAM_PREPARED: Stream prepared
+ * @SDW_STREAM_ENABLED: Stream enabled
+ * @SDW_STREAM_DISABLED: Stream disabled
+ * @SDW_STREAM_DEPREPARED: Stream de-prepared
+ * @SDW_STREAM_RELEASED: Stream released
+ */
+enum sdw_stream_state {
+	SDW_STREAM_ALLOCATED = 0,
+	SDW_STREAM_CONFIGURED = 1,
+	SDW_STREAM_PREPARED = 2,
+	SDW_STREAM_ENABLED = 3,
+	SDW_STREAM_DISABLED = 4,
+	SDW_STREAM_DEPREPARED = 5,
+	SDW_STREAM_RELEASED = 6,
+};
+
+/**
+ * sdw_stream_params: Stream parameters
+ *
+ * @rate: Sampling frequency, in Hz
+ * @ch_count: Number of channels
+ * @bps: bits per channel sample
+ */
+struct sdw_stream_params {
+	unsigned int rate;
+	unsigned int ch_count;
+	unsigned int bps;
+};
+
+/**
+ * sdw_stream_runtime: Runtime stream parameters
+ *
+ * @name: SoundWire stream name
+ * @params: Stream parameters
+ * @state: Current state of the stream
+ * @type: Stream type PCM or PDM
+ * @m_rt_count: Count of Master runtime(s) in this stream
+ * @master_list: List of Master runtime(s) in this stream.
+ * master_list can contain only one m_rt per Master instance
+ * for a stream
+ */
+struct sdw_stream_runtime {
+	const char *name;
+	struct sdw_stream_params params;
+	enum sdw_stream_state state;
+	enum sdw_stream_type type;
+	int m_rt_count;
+	struct list_head master_list;
+};
+
 /**
  * struct sdw_bus - SoundWire bus
  * @dev: Shortcut to &bus->md->dev to avoid changing the entire code.
@@ -915,7 +1004,7 @@ struct sdw_bus {
 	int controller_id;
 	unsigned int link_id;
 	int id;
-	int (*compute_params)(struct sdw_bus *bus);
+	int (*compute_params)(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
@@ -928,99 +1017,10 @@ struct sdw_bus {
 	unsigned int lane_used_bandwidth[SDW_MAX_LANES];
 };
 
-int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-		       struct fwnode_handle *fwnode);
-void sdw_bus_master_delete(struct sdw_bus *bus);
-
-void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
-
-/**
- * sdw_port_config: Master or Slave Port configuration
- *
- * @num: Port number
- * @ch_mask: channels mask for port
- */
-struct sdw_port_config {
-	unsigned int num;
-	unsigned int ch_mask;
-};
-
-/**
- * sdw_stream_config: Master or Slave stream configuration
- *
- * @frame_rate: Audio frame rate of the stream, in Hz
- * @ch_count: Channel count of the stream
- * @bps: Number of bits per audio sample
- * @direction: Data direction
- * @type: Stream type PCM or PDM
- */
-struct sdw_stream_config {
-	unsigned int frame_rate;
-	unsigned int ch_count;
-	unsigned int bps;
-	enum sdw_data_direction direction;
-	enum sdw_stream_type type;
-};
-
-/**
- * sdw_stream_state: Stream states
- *
- * @SDW_STREAM_ALLOCATED: New stream allocated.
- * @SDW_STREAM_CONFIGURED: Stream configured
- * @SDW_STREAM_PREPARED: Stream prepared
- * @SDW_STREAM_ENABLED: Stream enabled
- * @SDW_STREAM_DISABLED: Stream disabled
- * @SDW_STREAM_DEPREPARED: Stream de-prepared
- * @SDW_STREAM_RELEASED: Stream released
- */
-enum sdw_stream_state {
-	SDW_STREAM_ALLOCATED = 0,
-	SDW_STREAM_CONFIGURED = 1,
-	SDW_STREAM_PREPARED = 2,
-	SDW_STREAM_ENABLED = 3,
-	SDW_STREAM_DISABLED = 4,
-	SDW_STREAM_DEPREPARED = 5,
-	SDW_STREAM_RELEASED = 6,
-};
-
-/**
- * sdw_stream_params: Stream parameters
- *
- * @rate: Sampling frequency, in Hz
- * @ch_count: Number of channels
- * @bps: bits per channel sample
- */
-struct sdw_stream_params {
-	unsigned int rate;
-	unsigned int ch_count;
-	unsigned int bps;
-};
-
-/**
- * sdw_stream_runtime: Runtime stream parameters
- *
- * @name: SoundWire stream name
- * @params: Stream parameters
- * @state: Current state of the stream
- * @type: Stream type PCM or PDM
- * @m_rt_count: Count of Master runtime(s) in this stream
- * @master_list: List of Master runtime(s) in this stream.
- * master_list can contain only one m_rt per Master instance
- * for a stream
- */
-struct sdw_stream_runtime {
-	const char *name;
-	struct sdw_stream_params params;
-	enum sdw_stream_state state;
-	enum sdw_stream_type type;
-	int m_rt_count;
-	struct list_head master_list;
-};
-
 struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
 
-int sdw_compute_params(struct sdw_bus *bus);
+int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
 
 int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_config *stream_config,
-- 
2.43.0

