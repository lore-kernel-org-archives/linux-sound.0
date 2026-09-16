Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E04EC643
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560266; cv=none; b=L+BoBTqcrUqJT1y5PKmTLDQKUE8XDwwjI4HcGCFC7jLJo5m5F/kUD4wHrKsiAf0bCA5L0RUrb7DYyJezyouIYQPdlfqpCGa53p/nBw6UZa0hwZjsVdtbHenkWnix90e4XdcR7ip7Iec6+Vs3oB+AVWWFJTvwRr8HizuxGz36nCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560266; c=relaxed/simple;
	bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9QXIx8CL80+flsp3wgb+lJnycqyNPlIG774jkddazLnbaZIvNTjQQW/+0NoKBMleloLHPDszbSSfoesROLywOtTglFC9akJSfvywR0xjkzs4/oxeAa5ymfHX4qqdBnBvjTGfOk2BZ9GZXPVgtnWRkKpFcnbkz2UwMNBHMNvuEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjMMvK6V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjMMvK6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560263; x=1821096263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjU2ekX2FZiltuBzFtSwSqz8zSGMeceBHhIB4++Srkc=;
  b=HjMMvK6VV2ddGhjGIof7rWRMyiAUFiim+X/HsdnfmfgUr8Qd+6oZLbbg
   rton+FyaDwj+awZmHnq60N+KY0Pp0j/LjqGALmWYivkxUm9eoTYBA3uqz
   oZSNcoHEOL4qMgA1FGtfViMCtHhLdFQ1BRtw/Vxk0/h4UVBSWqJSgSLjP
   xbQjW06FApGvO59lgOzAf4BB/nfOMoJrm+cjReDe3T7OpSKGuXxq51LGO
   aSm5S97hZCXj5R+au7nygLr+mnqu6VdyN7bWBLhPte1U+2n0/PfRm6I7E
   xA5MJonVixgVFkGIrKadoE+QvDDXe+9EGHQGHOnrMJpq5M6DfBLUgiz6h
   g==;
X-CSE-ConnectionGUID: ixsfGcoEQeOfeQOlF3CcHQ==
X-CSE-MsgGUID: 15bZk2t6Sc6yJIHIZsGq2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496524"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:11 -0700
X-CSE-ConnectionGUID: U4kKgyVCTpG09SiE8+jLgQ==
X-CSE-MsgGUID: cevCaN+DRr6CfdzDlT9luQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293716"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:09 -0700
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
Subject: [PATCH v4 20/26] ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
Date: Wed, 16 Sep 2026 15:03:14 +0300
Message-ID: <20260916120320.18318-21-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FAST_MODE allows the host DMA to work in opportunistic, free running mode,
which matches with the bitstream nature of compressed devices.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 3 +++
 sound/soc/sof/ipc4-topology.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 42cf444e847e..566913025cc7 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -744,6 +744,9 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 			sps->dsp_max_burst_size_in_ms = 1;
 	}
 
+	if (spcm->pcm.compress)
+		ipc4_copier->data.copier_feature_mask |= BIT(SOF_IPC4_COPIER_FAST_MODE);
+
 skip_gtw_cfg:
 	ipc4_copier->gtw_attr = kzalloc_obj(*ipc4_copier->gtw_attr);
 	if (!ipc4_copier->gtw_attr) {
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 5e78f3de092e..c2949ff979a5 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -222,6 +222,11 @@ struct sof_copier_gateway_cfg {
 	uint32_t config_data[];
 };
 
+/* bit definition in copier_feature_mask */
+enum sof_ipc4_copier_feature {
+	SOF_IPC4_COPIER_FAST_MODE = 0, /* free running mode of host copier */
+};
+
 /**
  * struct sof_ipc4_copier_data - IPC data for copier
  * @base_config: Base configuration including input audio format
-- 
2.55.0

