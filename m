Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268D1B87C1
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084676; cv=none; b=BDJuZHG6hxndiSe3IPlJ52n7YlRhGBcVV5fx1WRTGELP8p8++YnkH1/yTqvctCLgbwpHjsaK7zvlyGuDWd6Kdkk8WldX4boSGzarTXbz1kkqUnVioIGi5tNT1da8GjlH1Qd0jta5vo9pZ5GpCn2lwSAH36TpONqB9Dg9Qecqsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084676; c=relaxed/simple;
	bh=fTps+wA4gBP5FpSZ9dCSfZ5m1Nwfyte581h6+SK7+AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr9ZN3+UIZMzU0GKQQkBdhnptAXRC4dezxL8I5Y1m+f8lqA46NKjhJ0oKXjhIHkU7ONbxx9WEPHkkaBbh57+FG4A1pYmU49j1zer8+x5ER5VaPp3wIOeoiF6ZTIXTr0sgWRNbngryC0kp2Z963q8JyJi2P6iaja0x0PcgBKVIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyctCMMt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyctCMMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734084675; x=1765620675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fTps+wA4gBP5FpSZ9dCSfZ5m1Nwfyte581h6+SK7+AU=;
  b=lyctCMMt5yZmiyw5pmSBjkJaVVl+RUAyAE7ZweNSSuBdl8SF6XGEq6T7
   bH2dKz3ILoj2GJgerFWCP4PTel2VtLAHu2+xvrGySKsmTVVKosT8CP7A0
   sPGYlrsOlwLm1xopyZivRoFZOFZTRGvSruadF7yTzQazFumxfUsLuV5iT
   4Xzm7AskTq6wcc+ZOkuCF46iQb9qzVgjEu7fx0Gdj00hk5MKERzdKJSOK
   dt0x6cOZuhrAdyPW1Lj72uB3LkXd4VaQJiHRzAlZj0f1C7Ut2tYH8yPHA
   ejo+Go6PzzzjRjZiIG5KH/d8mhhfC2ZIHYBLJOuUMKkyc79Hwa/uf1JPC
   Q==;
X-CSE-ConnectionGUID: QvJbzrEZRAWY4VIXAf6uMA==
X-CSE-MsgGUID: OJW+2V2UQHytK0U60J4+GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34263344"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34263344"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:11:15 -0800
X-CSE-ConnectionGUID: KUXPyIX1SbSH4+aR2O1cZA==
X-CSE-MsgGUID: O1y5zkJcRLGK5OooX+CMrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="96570737"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.190])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:11:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/2] ASoC: SOF: Add support for pause supported tokens from topology
Date: Fri, 13 Dec 2024 12:11:22 +0200
Message-ID: <20241213101123.27318-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
References: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New tokens are added to topology:
1202: SOF_TKN_STREAM_PLAYBACK_PAUSE_SUPPORTED
1203: SOF_TKN_STREAM_CAPTURE_PAUSE_SUPPORTED

The new tokens are used to advertise support for PAUSE/RESUME operation on
a PCM device depending on firmware product, use case, pipeline topology.

The snd_sof_pcm_stream.pause_supported is updated to reflect the advertised
value for the PCM device.

If the token does not exist then the pause_supported is set to false.

Note: it is up to the platform code to use this flag to decide to advertise
the PAUSE support for user space or not.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/uapi/sound/sof/tokens.h | 2 ++
 sound/soc/sof/sof-audio.h       | 1 +
 sound/soc/sof/topology.c        | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 0a246bc218d3..c28c766270de 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -153,6 +153,8 @@
 /* Stream */
 #define SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3	1200
 #define SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3	1201
+#define SOF_TKN_STREAM_PLAYBACK_PAUSE_SUPPORTED	1202
+#define SOF_TKN_STREAM_CAPTURE_PAUSE_SUPPORTED	1203
 
 /* Led control for mute switches */
 #define SOF_TKN_MUTE_LED_USE			1300
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 01b819dd8498..62f3c11a9216 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -332,6 +332,7 @@ struct snd_sof_pcm_stream {
 	struct work_struct period_elapsed_work;
 	struct snd_soc_dapm_widget_list *list; /* list of connected DAPM widgets */
 	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
+	bool pause_supported; /* PCM device supports PAUSE operation */
 	unsigned int dsp_max_burst_size_in_ms; /* The maximum size of the host DMA burst in ms */
 	/*
 	 * flag to indicate that the DSP pipelines should be kept
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b3fca5fd87d6..688cc7ac1714 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -407,6 +407,10 @@ static const struct sof_topology_token stream_tokens[] = {
 		offsetof(struct snd_sof_pcm, stream[0].d0i3_compatible)},
 	{SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
 		offsetof(struct snd_sof_pcm, stream[1].d0i3_compatible)},
+	{SOF_TKN_STREAM_PLAYBACK_PAUSE_SUPPORTED, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_pcm, stream[0].pause_supported)},
+	{SOF_TKN_STREAM_CAPTURE_PAUSE_SUPPORTED, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_pcm, stream[1].pause_supported)},
 };
 
 /* Leds */
-- 
2.47.1

