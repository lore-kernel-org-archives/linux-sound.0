Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0E3DDDB4
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793062; cv=none; b=IdamiUpQTaCU6KGkaG5XuPpCzK9RGm82EsLdLQoRJuwJK63PmaHTb/7rjw213yUY6JP+87sgmtzc/bXnDuVacxDujPoDTVeaMpeWUuTB/xZ3NBNz4V3ED9em+X2HPVmq5n9OqkLd60qhQGjNrRRtjKdYSJstPxvx8JmMtnR/bmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793062; c=relaxed/simple;
	bh=tqg6AvnIQG8yHgCIljNT20OFX3+1avF5PAU3bH0lI2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7gxV1Cge17oq30V8XMpNFB+SHokkXfclhgtunBF157IuG8dTqRn5/GkJ6UL95LhVJsztHBQuUynVsOlmrjJnAkMxzyM9pNNBK1vFfhH8/wTD0HEZc92mMcM8zW91bxMBZGrFYIZk7IJwO28Knl1rbtrh9/RNrYfpfQxE37mcB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiRCHHLo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiRCHHLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779793062; x=1811329062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqg6AvnIQG8yHgCIljNT20OFX3+1avF5PAU3bH0lI2s=;
  b=iiRCHHLoCw9jPQ68Y8BopsYYkXsYMmFy2utFESBfAyJfyx5POjoIrkMS
   FCQTTbPhsT9yxe2vUZv0oMQ4FeZweIUK6Otmoae8TuCy4hN6DRAeBk2iB
   lS12gKwMuodLl/276Vx0gdonaaYf/lzhkGJw4ilIhOwYFJKVu+9cNdLyd
   t4DESmE2/qm6/3YuMPDaqTODnOHU+Y3u27LQH9I3Jmv2B1mt7DXo4zLsW
   BWZRHLA1Igrjdw+R98jnSGQLIQEnOsOQt7QW/8fHv+0qKpknp5UYbjFol
   D0v7ALfWZ7aEHGDyCItzzLyLgAHnx58B88l6Zd4CM1nnWHPSJE5thi5Ob
   w==;
X-CSE-ConnectionGUID: 5Y0/8Mj+QmOYVaYXxM1Tyg==
X-CSE-MsgGUID: +IIaor6GTfC9DbVtPGw8kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91709700"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="91709700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:57:42 -0700
X-CSE-ConnectionGUID: fB151GLyRn+dT3A6Iw9CUw==
X-CSE-MsgGUID: a+aAUjuERdKATP6peLsP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="238869047"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.49])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:57:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH v2 1/2] ASoC: SOF: ipc4-topology: Validate the number of in/out formats for src/asrc
Date: Tue, 26 May 2026 13:57:47 +0300
Message-ID: <20260526105748.26149-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
References: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SRC and ASRC modules must have at least one input and on one output formats
to be usable.
Do a sanity check during setup type and fail if either the number of input
or output formats are 0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f61ed271f23b..cefb7fdcfb5b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1121,6 +1121,15 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 	if (ret)
 		goto err;
 
+	if (!src->available_fmt.num_input_formats ||
+	    !src->available_fmt.num_output_formats) {
+		dev_err(scomp->dev,
+			"Invalid number of formats: input: %d, output: %d\n",
+			src->available_fmt.num_input_formats,
+			src->available_fmt.num_output_formats);
+		goto err;
+	}
+
 	ret = sof_update_ipc_object(scomp, &src->data, SOF_SRC_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*src), 1);
 	if (ret) {
@@ -1164,6 +1173,15 @@ static int sof_ipc4_widget_setup_comp_asrc(struct snd_sof_widget *swidget)
 	if (ret)
 		goto err;
 
+	if (!asrc->available_fmt.num_input_formats ||
+	    !asrc->available_fmt.num_output_formats) {
+		dev_err(scomp->dev,
+			"Invalid number of formats: input: %d, output: %d\n",
+			asrc->available_fmt.num_input_formats,
+			asrc->available_fmt.num_output_formats);
+		goto err;
+	}
+
 	ret = sof_update_ipc_object(scomp, &asrc->data, SOF_ASRC_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*asrc), 1);
 	if (ret) {
-- 
2.54.0

