Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD713FD9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125420; cv=none; b=rfxT7ykybKEIkWmcXjA7H2Qn9eTHcNiOr9tHkTqlaHT7BBDLm3KzBVT8ezKJ+J+I3zXBADn+EgxmqbpUxyi5HSIyVemVZUQJr8zyZtsMHxXUyR9EkmFmmYYYGTEJS1soVekEiCXFYZRy1KGyV8hBe2AWbbuk7VBT170BpVpZhyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125420; c=relaxed/simple;
	bh=p6C6SKzHWunPyU/UTVA3+lQ7OyWR4ICR+xObO73m00o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ads6iBUh4pi7AtWNZqjI//PTbYqi38D6qMb0pWe3Ksh0qhBUlaOBqEuqQ17XJGoTkKJUgfXUlsnKYSZ5QM8N4e1XOdb1DB4pdwE97Jb+loDR1A+QQQRaLIeThQu8otiYLizHoWJ70Jh0C6mWlkSrTDDj6j+KeZd0w0JoAb8R5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiMIbbAX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiMIbbAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125419; x=1745661419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6C6SKzHWunPyU/UTVA3+lQ7OyWR4ICR+xObO73m00o=;
  b=iiMIbbAXhsfj0OyTVNo25kGqzoGhF/zfMp4dJNPXtEoifIjt4rlKiNmY
   NpaImadKQj0VNM9SEL7jFniGLxYmVw+qNf99OoBUlqL4GUKySlM3u+a6e
   eUfTYRY4lpqy7piaKH8kObh6+6tyvXR4kDWxBm9D+aSrvz87K1DEOcHYK
   KyEuHvssqscD5p4GWeWakaFR3x3xp36iS+6SGs6hPlrRSYPSF/h5Ze7bj
   ri0zyZA78PwJjm1yNIjR731Gx2l7gcxhWrqD1tDAoBouWmYMmXe5aO2oL
   zcg8NfsdpLWwL5dN7+uVtjdi8xCpNjE0FdkBiQ98qunbbEJjeJ50ruWNi
   g==;
X-CSE-ConnectionGUID: xPbT/IcoSxS8ECO9f7EwAQ==
X-CSE-MsgGUID: RLJf4WD7RC2vj97CGw9Ing==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409210"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409210"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:56:59 -0700
X-CSE-ConnectionGUID: lOAyboRJSJqCs86Mt7mWQQ==
X-CSE-MsgGUID: qgvNodMGR8yWTZe/5iWcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460600"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/8] ASoC: Intel: avs: Remove redundancy around DAI startup
Date: Fri, 26 Apr 2024 11:57:30 +0200
Message-Id: <20240426095733.3946951-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Half of the arguments in avs_dai_startup() are unused and can be
dropped. With the function updated, it matches its template in
snd_soc_dai_ops and can be referenced throughout the pcm.c file without
need of any wrappers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index a3a04115216c..0771a9716f4b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -57,15 +57,14 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 	return dw->priv;
 }
 
-static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
-			   const struct snd_soc_dai_ops *ops)
+static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->component->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
 
-	template = avs_dai_find_path_template(dai, is_fe, substream->stream);
+	template = avs_dai_find_path_template(dai, !rtd->dai_link->no_pcm, substream->stream);
 	if (!template) {
 		dev_err(dai->dev, "no %s path for dai %s, invalid tplg?\n",
 			snd_pcm_stream_str(substream), dai->name);
@@ -174,13 +173,6 @@ static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *subst
 	return ret;
 }
 
-static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops;
-
-static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	return avs_dai_startup(substream, dai, false, &avs_dai_nonhda_be_ops);
-}
-
 static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
@@ -265,7 +257,7 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 }
 
 static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
-	.startup = avs_dai_nonhda_be_startup,
+	.startup = avs_dai_startup,
 	.shutdown = avs_dai_shutdown,
 	.hw_params = avs_dai_nonhda_be_hw_params,
 	.hw_free = avs_dai_nonhda_be_hw_free,
@@ -273,8 +265,6 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
-static const struct snd_soc_dai_ops avs_dai_hda_be_ops;
-
 static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -282,7 +272,7 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 	struct hda_codec *codec;
 	int ret;
 
-	ret = avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
+	ret = avs_dai_startup(substream, dai);
 	if (ret)
 		return ret;
 
@@ -479,8 +469,6 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 	.mask = 0,
 };
 
-const struct snd_soc_dai_ops avs_dai_fe_ops;
-
 static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval *interval = hw_param_interval(params, rule->var);
@@ -509,7 +497,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 	struct hdac_ext_stream *host_stream;
 	int ret;
 
-	ret = avs_dai_startup(substream, dai, true, &avs_dai_fe_ops);
+	ret = avs_dai_startup(substream, dai);
 	if (ret)
 		return ret;
 
-- 
2.25.1

