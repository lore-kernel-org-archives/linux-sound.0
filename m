Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AEF46EC96
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125736; cv=none; b=Rj4/gfrGnVbURqWAGzn+nNtlTTtoQBcBN3VEupCdvckEv+7xyeGDUFKAApk0fpLkFaIAVj/QA6I04NcUpi7VeJWr/xgFwN0bjiZWR58OJ/F+8Icd+AvQYCjKtWuM58t8oSzyek7f9xnwZYZHDiCPULu3so/2ptV50WeVIYHDLC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125736; c=relaxed/simple;
	bh=aZX1EN8m5aZ8+n819gvmEyHiJ7y9IMVdqfeSfUYQ5Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TI17dlbE5OoDfLDalzKF+n4buaUIyu+ZVcyX4Kiopr2lA97Hh0SAPbNvPPhS0O8d1ZO0ujGjTIF6TVuAPnDiMWwRh9o+tNuY0hxdEp0GTEQUR+5Bp2gvsDC8oyoDspvdPQKO/xMLu60zx7fE3k0XAFsfHwRfLtU2LlkFpfSvRsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyrMwH//; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyrMwH//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125725; x=1820661725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZX1EN8m5aZ8+n819gvmEyHiJ7y9IMVdqfeSfUYQ5Fw=;
  b=jyrMwH//oTmt0SfFYggpQcbif3DKHVvkYCgFM0P1s7koq4k+BtYranvY
   op98qeZAHjfHQgpfcNavOEEQzj3+hjTWCi/qKI8MDxOZ50jn869TNDgvk
   WTLiBh4MrGo4m2OlqjegjGM7/xCPiKfUvnEF0Isf2ayidFvvGSQ1oGPWt
   9um9QKUsAHt2iD+arFNUUXR2VkLS5PenYpPk9Epdq9Y1JxEQ/PoWOPPks
   pKUL+H3+ydAyRAj3jjoqVw0wCfC/opJ5arHvB09Oeiaw2WEwZD600PSCF
   xSNxADwAt+1WOoalWphvMT8jrqB+AbyJzz3PoAlqaRpqIncoQ4UrKwS7R
   w==;
X-CSE-ConnectionGUID: XlmYC4EaRdS0sXnMW5YizA==
X-CSE-MsgGUID: kcHpJJSrQNe8zHPZA0TqPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749899"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:57 -0700
X-CSE-ConnectionGUID: eF+TU2wVR3aKoFIYB/RnYA==
X-CSE-MsgGUID: u7wxbN3+RTeSyHyqjmvS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213264"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:54 -0700
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
Subject: [PATCH v3 04/26] ASoC: soc-compress: Provide a runtime for the compressed FE substream
Date: Fri, 11 Sep 2026 14:21:30 +0300
Message-ID: <20260911112152.28528-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a compressed stream is used on the FE side of a DPCM link, the
BE is still running as 'normal' PCM.

DPCM lends the runtime of the FE to every BE it opens and
dpcm_be_reparent() re-points it at another FE when the lending one
disconnects. The internal PCM created for a compressed FE by
snd_soc_new_compress() is never opened via the PCM API, so its
substream has no runtime and the BEs of a compressed FE were left
with a NULL one.

BE DAI and codec drivers can look at substream->runtime, they add
their constraints to it in startup(), for example cs42l43, cs42l42,
hdac_hdmi.

The other users of compressed DPCM do not hit this as their BEs are
DSP internal ports, driven by code which takes everything from the
hw_params it is passed and never looks at substream->runtime. The
BEs here end at generic CODEC drivers which are shared with the non
DPCM case and cannot be expected to know about the FE type.

Allocate a runtime for the compressed FE substream while the stream
is open, initialize its constraints as snd_pcm_open() does and fill
it in from the BE parameters once the mandatory machine level
be_hw_params_fixup() has run, so that the compressed FE lends a valid
and populated runtime just like a PCM FE does.

This also allows a BE to be shared between a compressed and a PCM
FE, which is needed to play a notification over PCM to an endpoint
which a compressed stream is already using.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 109 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 093a70a93d2b..b803e8cb4ea4 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -16,6 +16,7 @@
 #include <sound/core.h>
 #include <sound/compress_params.h>
 #include <sound/compress_driver.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/soc-dpcm.h>
@@ -131,6 +132,104 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 	return ret;
 }
 
+/*
+ * The internal PCM of a compressed FE is never opened via the PCM API, so its
+ * substream has no runtime attached to it.
+ *
+ * DPCM lends the runtime of the FE to every BE it opens and re-points it at
+ * another FE when the lending one goes away, so the compressed FE must provide
+ * one as well. Without it the BEs are left with a NULL runtime, which oopses
+ * in BE DAI and CODEC drivers looking at substream->runtime, and a BE can not
+ * be shared between a compressed and a PCM FE at all.
+ *
+ * The runtime is owned by the FE for as long as the compressed stream is open.
+ */
+static int soc_compr_alloc_fe_runtime(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	struct snd_pcm_substream *fe_substream = snd_soc_dpcm_get_substream(fe, stream);
+	struct snd_pcm_hw_constraints *constrs;
+	int i;
+
+	if (!fe_substream || fe_substream->runtime)
+		return 0;
+
+	fe_substream->runtime = kzalloc_obj(*fe_substream->runtime);
+	if (!fe_substream->runtime)
+		return -ENOMEM;
+
+	/*
+	 * snd_pcm_open() initializes the constraints of a PCM runtime to
+	 * 'anything goes'. A zeroed one means an empty mask and a [0, 0]
+	 * interval instead, which the constraint helpers refine against and
+	 * reject, so initialize them the same way the PCM core does.
+	 *
+	 * The hw rules snd_pcm_hw_constraints_init() installs on top are only
+	 * evaluated by snd_pcm_hw_refine(), which never runs for this
+	 * substream, so they are not needed here.
+	 */
+	constrs = &fe_substream->runtime->hw_constraints;
+	for (i = SNDRV_PCM_HW_PARAM_FIRST_MASK; i <= SNDRV_PCM_HW_PARAM_LAST_MASK; i++)
+		snd_mask_any(constrs_mask(constrs, i));
+
+	for (i = SNDRV_PCM_HW_PARAM_FIRST_INTERVAL; i <= SNDRV_PCM_HW_PARAM_LAST_INTERVAL; i++)
+		snd_interval_any(constrs_interval(constrs, i));
+
+	return 0;
+}
+
+static void soc_compr_free_fe_runtime(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	struct snd_pcm_substream *fe_substream = snd_soc_dpcm_get_substream(fe, stream);
+
+	if (!fe_substream || !fe_substream->runtime)
+		return;
+
+	/* BE startup callbacks may have added hw constraint rules */
+	kfree(fe_substream->runtime->hw_constraints.rules);
+	kfree(fe_substream->runtime);
+	fe_substream->runtime = NULL;
+}
+
+/*
+ * The BE parameters of a compressed FE are set up by the machine level
+ * be_hw_params_fixup(), which is mandatory for a compressed BE, see
+ * soc_compr_set_params_fe(). Once they are fixed up, use them to fill in the
+ * runtime the BEs have been lent, so that a BE DAI or CODEC driver sees the
+ * format it is being configured for.
+ */
+static void soc_compr_set_fe_runtime(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	struct snd_pcm_substream *fe_substream = snd_soc_dpcm_get_substream(fe, stream);
+	struct snd_pcm_runtime *runtime;
+	struct snd_soc_dpcm *dpcm;
+
+	snd_soc_dpcm_mutex_assert_held(fe);
+
+	if (!fe_substream || !fe_substream->runtime)
+		return;
+
+	runtime = fe_substream->runtime;
+
+	for_each_dpcm_be(fe, stream, dpcm) {
+		struct snd_pcm_hw_params *params = &dpcm->be->dpcm[stream].hw_params;
+		int bits = snd_pcm_format_physical_width(params_format(params));
+
+		/* skip a BE which has not been fixed up */
+		if (bits <= 0)
+			continue;
+
+		runtime->access		= params_access(params);
+		runtime->format		= params_format(params);
+		runtime->subformat	= params_subformat(params);
+		runtime->channels	= params_channels(params);
+		runtime->rate		= params_rate(params);
+
+		runtime->sample_bits	= bits;
+		runtime->frame_bits	= bits * runtime->channels;
+		break;
+	}
+}
+
 static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
@@ -142,6 +241,10 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 
 	snd_soc_card_mutex_lock(fe->card);
 
+	ret = soc_compr_alloc_fe_runtime(fe, stream);
+	if (ret < 0)
+		goto be_err;
+
 	ret = dpcm_path_get(fe, stream, &list);
 	if (ret < 0)
 		goto be_err;
@@ -196,6 +299,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	dpcm_path_put(&list);
 	snd_soc_dpcm_mutex_unlock(fe);
 be_err:
+	soc_compr_free_fe_runtime(fe, stream);
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
@@ -238,6 +342,9 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 0);
 
+	/* all BEs are shut down and disconnected, the runtime is unused now */
+	soc_compr_free_fe_runtime(fe, stream);
+
 	snd_soc_card_mutex_unlock(fe->card);
 	return 0;
 }
@@ -388,6 +495,8 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 
 	snd_soc_dpcm_mutex_lock(fe);
 	ret = dpcm_be_dai_hw_params(fe, stream);
+	if (!ret)
+		soc_compr_set_fe_runtime(fe, stream);
 	snd_soc_dpcm_mutex_unlock(fe);
 	if (ret < 0)
 		goto out;
-- 
2.55.0

