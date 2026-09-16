Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAF3DD521
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560218; cv=none; b=imp8iQlcJfAZeqmqxGoA/lKuagyB+y7uQGa5MJ9bzkPZmLiev5S4UXVx09sWQKRidpWK43vtgJ1fcdjokTOrBGRc9XNmckpGGR7hjTJqcxHJT8kRgarMBo/8a4zV7lyaBfvX0NVFhWs1h6Yvuqe2vxJxQJ4b6QOS7sdTupvYpus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560218; c=relaxed/simple;
	bh=aZX1EN8m5aZ8+n819gvmEyHiJ7y9IMVdqfeSfUYQ5Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQ0ffnC1jiOGKFh7SmMQ823SHBWZ+b94mAH/ZJUhSXirLporwnFqQslnSeTpxNXSmu7tCtm7eZI+hqDngapwZgv/biMJmuuJ69gp23bY+nq5KTGKq9QC5UDzwHq6A8Ylu0byPpViTbScApS5LSRFYydfETWBZbTm4qIgWhzY8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1ZZUjdA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1ZZUjdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560207; x=1821096207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZX1EN8m5aZ8+n819gvmEyHiJ7y9IMVdqfeSfUYQ5Fw=;
  b=f1ZZUjdAVfCJxToZQxesBuuVWHcIveIk4EQAyjLhvaXqTk+g4aUfP12H
   ynkBvb0I1HJnviZoDNvBJIY9CSRyEjvW85yyNWLuBqilxK1dfZSSaogNx
   rSyt8j4Ty7Mi0Wt8LI4J5A8m6EVuxkokKWUDzhmAaQqbAEAEKBv8rjEt2
   PRvIXOTsFaHqvOJmeuoT0H43WzVpo9bptK+rzypt8lNaJhm/xYsT85nZg
   CmEq/FNj+unt7kV3Wey2Ay8rZXraXcwusENJdw7xWR3zEA5vuK3YrrNVz
   WCtZuUAkkWkWr5Dz8VmzO/m7rGbc0D+/Qx1nYn/TSX0X1m06eR5ySsm1X
   A==;
X-CSE-ConnectionGUID: Ldd7M1tWT4GBm1Xavj8Ddw==
X-CSE-MsgGUID: I4XGXVlSQLSAxy19YAXKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496252"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:24 -0700
X-CSE-ConnectionGUID: Yy4Jca+WSE+THLo4PK5U6w==
X-CSE-MsgGUID: TGGFCrGvStO4o0tm6x8DdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293342"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:22 -0700
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
Subject: [PATCH v4 04/26] ASoC: soc-compress: Provide a runtime for the compressed FE substream
Date: Wed, 16 Sep 2026 15:02:58 +0300
Message-ID: <20260916120320.18318-5-peter.ujfalusi@linux.intel.com>
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

