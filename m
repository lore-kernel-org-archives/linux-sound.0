Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42415C147
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235447; cv=none; b=KrAJX1+8bsWhDyyi8hK3fHIFeRcdvh90w+zC4h0VL/Yi4GxrCzJIaZtfQB6GYEuFtIp/JKYU0ujrYeSQ4j4HSLkb+ObxtqC5dYgZ8stQaIlOE9qzUbHlvH9JK6MeRf7zHs6WdA/BI7F7/au9DkyiTsWeXcvR8Dc11ZvYgTkfSyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235447; c=relaxed/simple;
	bh=E1ociNNv1KRdMHcLloqymFf9bLZ09cmgIu5wCou37rU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PKLC5XsyMGctZXMWNyzSiZBeuraRA+110RUYInXExbyFbMSfKfQgLoOT0lqP+xtVSPJVZkfirqx7gSuYxx3vyq8t8xycEFN6eKawinDaozFhdHv+9s87EwSMS/c+Qhn9dO0ye8nCVyaPQl8ghM1wFc3PfoSiejGpGZEunbOlmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3SRDGO/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3SRDGO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724235445; x=1755771445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E1ociNNv1KRdMHcLloqymFf9bLZ09cmgIu5wCou37rU=;
  b=C3SRDGO/hf9fkPIdx6gvOHzyFqiYdV9euCNVPXTSfTSLbSOgvyVwJt0s
   0bfnWrQVHhncpz5qKFKVXh2uVZ7blX4bubquKX1iHePGhozBWblUQr3Dl
   potWom15Uc1mvKA11l4LKCNJ05IGraOiKDekx0fiRt7jk5YZwMfxdUDC1
   oUO/Pt3NPZaBYuZ7i4CAV7LkpqjnZ/Cuoujyb+IP/jGZiBlRq6w/aBmEX
   TFRaAnHtUyuPHDv8i15VH7VU+Gelg3VhemkHWofk0ckq0UkynCAVTizpU
   HCU9wbQWbTInU53J8UuYbipU+sVC4Z5XVsaooygKPsFiAGv25PW0/tiOL
   A==;
X-CSE-ConnectionGUID: WV3rxSscTAeqmYf627ug6Q==
X-CSE-MsgGUID: Nmv+Ue0HRiWZedJoeGRL2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22720436"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22720436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 03:17:17 -0700
X-CSE-ConnectionGUID: dSrxHJFhTUuwkoBRGcftNA==
X-CSE-MsgGUID: DrSQIeSLScavjGGoubzGkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65880802"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2024 03:17:15 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] [RFC] ASoC: Conditional PCM support
Date: Wed, 21 Aug 2024 12:18:16 +0200
Message-Id: <20240821101816.1494541-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conditional PCM (condpcm) helps facilitate modern audio usecases such as
Echo Cancellations and Noise Reduction. These are not invoked by the
means of userspace application opening an endpoint (FrontEnd) but are a
"side effect" of selected PCMs running simultaneously e.g.: if both
Speaker (source) and Microphone Array (sink) are running, reference
data from the Speaker and take it into account when processing capture
for better voice command detection ratio.

Which PCMs are needed for given conditional PCM to be spawned is
determinated by the driver when registering the condpcm.

The functionality was initially proposed for the avs-driver [1] and,
depending on feedback and review may either go back into avs -or- become
a ASoC-core feature. Implementation present here is an example of how
such functionality could look and work on the ASoC side. Compared to
what was provided initially, the patch carries simplified version of the
feature: no priority/overriding for already running conditional PCMs.
Whatever is spawned is treated as a non-conflicting entity.

Assumptions and design decisions:

- existence and outcome of condpcm operations is entirely optional and
  shall not impact the runtime flow of PCMs that spawned given condpcm,
  e.g.: fail in cpcm->hw_params() shall not impact fe->hw_params() or
  be->hw_params() negatively. Think of it as of debugfs. Useful? Yes.
  Required for system to operate? No.

- a condpcm is a runtime entity that's audio format independent - since
  certain FE/BEs are its dependencies already, that's no need to do
  format ruling twice. Driver may still do custom checks thanks to
  ->match() operation.

- a condpcm allows for additional processing of data that flows from
  data-source - a substream instance acting as data provider -
  to sink - a substream acting as data consumer. At the same time,
  regardless of substream->stream, given substream may act as data
  source for one condpcm and data sink for another, simultaneously.

- while condpcm's behaviour mimics standard PCM one, there is no
  ->open() and ->close() - FE/BEs are treated as operational starting
  with successful ->hw_params(), when hw_ruling is done and hardware is
  configured.

- cpcm->prepare() gets called only when both data source and sink are
  prepared
- cpcm->trigger(START) gets called only when both data source and sink
  are running
- cpcm->trigger(STOP) gets called when either data source or sink is
  stopped

Simplified state machine:

			     |
	register_condpcm()   |
			     v
			  +--+-------------+
			  |  DISCONNECTED  |<-+
			  +--+-------------+  |
			     |		      |
	condpcm_hw_params()  |		      |
			     v		      |
			  +--+-------------+  |
			  |     SETUP      |  |	condpcm_hw_free()
			  +--+-------------+  |
			     |		      |
	condpcm_prepare()    |		      |
			     v		      |
			  +--+----+--------+  |
			  |    PREPARED    |--+
			  +--+----------+--+
			     |          ^
	condpcm_start()	     |		|	condpcm_stop()
			     v		|
			  +--+----------+--+
			  |    RUNNING     |
			  +----------------+

What's missing?

I've not covered the locking part yet. While some operations are covered
by default thanks to snd_soc_dpcm_mutex(), it is insufficient.
If feature goes back to the avs-driver, then I'm set due to path->mutex.

The locking is one of the reasons I'm leaning towards leaving the
condpcm within the avs-driver. For soc_condpcm_find_match() to be
precise and do no harm, a lock must prepend the list_for_each_entry().
Entries (substreams) of that list may be part of number of different
components and the search may negatively impact runtime flow of
substreams that do not care about condpcms at all.

Has this been tested?

Unit-like only. Typical case below with avs_condpcm_ops representing
bunch of stubs with printfs.

static struct snd_soc_condpcm_pred pred1 = {
	.card_name = "ssp0-loopback",
	.link_name = "SSP0-Codec",	/* BE */
	.direction = SNDRV_PCM_STREAM_PLAYBACK,
};

static struct snd_soc_condpcm_pred pred2 = {
	.card_name = "hdaudioB0D2",
	.link_name = "HDMI1",		/* FE */
	.direction = SNDRV_PCM_STREAM_PLAYBACK,
};

static void avs_condpcms_register(struct avs_dev *adev)
{
	(...)
	snd_soc_register_condpcm(&pred1, &pred2, &avs_condpcm_ops, adev);
}

[1]: https://lore.kernel.org/alsa-devel/20211208111301.1817725-21-cezary.rojewski@intel.com/

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/pcm.h     |   1 +
 include/sound/soc.h     |  65 ++++++++
 sound/core/pcm.c        |   1 +
 sound/soc/Makefile      |   2 +-
 sound/soc/soc-condpcm.c | 348 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-condpcm.h |  17 ++
 sound/soc/soc-core.c    |   2 +
 sound/soc/soc-pcm.c     |  11 ++
 8 files changed, 446 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/soc-condpcm.c
 create mode 100644 sound/soc/soc-condpcm.h

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ac8f3aef9205..7e635b3103a2 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -482,6 +482,7 @@ struct snd_pcm_substream {
 	struct list_head link_list;	/* linked list member */
 	struct snd_pcm_group self_group;	/* fake group for non linked substream (with substream lock inside) */
 	struct snd_pcm_group *group;		/* pointer to current group */
+	struct list_head cpcm_candidate_node;
 	/* -- assigned files -- */
 	int ref_count;
 	atomic_t mmap_count;
diff --git a/include/sound/soc.h b/include/sound/soc.h
index e844f6afc5b5..32a6b5092192 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -426,6 +426,7 @@ struct snd_jack;
 struct snd_soc_card;
 struct snd_soc_pcm_stream;
 struct snd_soc_ops;
+struct snd_soc_condpcm;
 struct snd_soc_pcm_runtime;
 struct snd_soc_dai;
 struct snd_soc_dai_driver;
@@ -1154,6 +1155,64 @@ struct snd_soc_card {
 #define for_each_card_widgets_safe(card, w, _w)	\
 	list_for_each_entry_safe(w, _w, &card->widgets, list)
 
+/* Conditional PCM operations called by soc-pcm.c. */
+struct snd_soc_condpcm_ops {
+	int (*match)(struct snd_soc_condpcm *, struct snd_pcm_substream *,
+		     struct snd_pcm_substream *);
+	int (*hw_params)(struct snd_soc_condpcm *, struct snd_pcm_hw_params *);
+	int (*hw_free)(struct snd_soc_condpcm *);
+	int (*prepare)(struct snd_soc_condpcm *, struct snd_pcm_substream *);
+	int (*trigger)(struct snd_soc_condpcm *, struct snd_pcm_substream *, int);
+};
+
+/**
+ * struct snd_soc_condpcm_pred - Predicate, describes source or sink (substream)
+ *                               dependency for given conditional PCM.
+ *
+ * @card_name: Name of card owning substream to find.
+ * @link_name: Name of DAI LINK owning substream to find.
+ * @direction: Whether its SNDRV_PCM_STREAM_PLAYBACK or CAPTURE.
+ */
+struct snd_soc_condpcm_pred {
+	const char *card_name;
+	const char *link_name;
+	int direction;
+};
+
+/**
+ * struct snd_soc_condpcm - Conditional PCM descriptor.
+ *
+ * @ops: custom PCM operations.
+ * @preds: predicates for identifying source and sink for given conditional PCM.
+ *
+ * @source: substreaming acting as a data source, assigned at runtime.
+ * @sink: substreaming acting as a data sink, assigned at runtime.
+ * @state: current runtime state.
+ *
+ * @source_node: list navigation for rtd->source_list.
+ * @sink_node: list navigation for rtd->sink_list.
+ * @node: list navigation for condpcm_list (soc-condpcm.c).
+ */
+struct snd_soc_condpcm {
+	const struct snd_soc_condpcm_ops *ops;
+	struct snd_soc_condpcm_pred preds[2];
+
+	struct snd_pcm_substream *source;
+	struct snd_pcm_substream *sink;
+	snd_pcm_state_t state;
+	void *private_data;
+
+	/* Condpcms navigation for the pcm runtime. */
+	struct list_head source_node;
+	struct list_head sink_node;
+	struct list_head node;
+};
+
+int snd_soc_unregister_condpcm(struct snd_soc_condpcm *cpcm);
+struct snd_soc_condpcm *snd_soc_register_condpcm(struct snd_soc_condpcm_pred *source,
+						 struct snd_soc_condpcm_pred *sink,
+						 const struct snd_soc_condpcm_ops *ops,
+						 void *private_data);
 
 static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
 {
@@ -1161,6 +1220,10 @@ static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
 }
 
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
+/*
+ * @source_cpcm_list:   List of condpcms this pcm is source for.
+ * @sink_cpcm_list:     List of condpcms this pcm is sink for.
+ */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
 	struct snd_soc_card *card;
@@ -1172,6 +1235,8 @@ struct snd_soc_pcm_runtime {
 	/* Dynamic PCM BE runtime data */
 	struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
 	struct snd_soc_dapm_widget *c2c_widget[SNDRV_PCM_STREAM_LAST + 1];
+	struct list_head cpcm_source_list;
+	struct list_head cpcm_sink_list;
 
 	long pmdown_time;
 
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index dc37f3508dc7..12243cecaa11 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -663,6 +663,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 		substream->pstr = pstr;
 		substream->number = idx;
 		substream->stream = stream;
+		INIT_LIST_HEAD(&substream->cpcm_candidate_node);
 		sprintf(substream->name, "subdevice #%i", idx);
 		substream->buffer_bytes_max = UINT_MAX;
 		if (prev == NULL)
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 775bb38c2ed4..8004de7c500c 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 snd-soc-core-y := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
-snd-soc-core-y += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
+snd-soc-core-y += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o soc-condpcm.o
 snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
 
 ifneq ($(CONFIG_SND_SOC_TOPOLOGY),)
diff --git a/sound/soc/soc-condpcm.c b/sound/soc/soc-condpcm.c
new file mode 100644
index 000000000000..786b3fafd714
--- /dev/null
+++ b/sound/soc/soc-condpcm.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Conditional-PCM management
+//
+// Copyright(c) 2024 Intel Corporation
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include "soc-condpcm.h"
+
+/*
+ * condpcm_list - Stores all registered conditional pcms.
+ * condpcm_candidate_list - Stores all substreams that passed hw_params() step.
+ */
+static LIST_HEAD(condpcm_list);
+static LIST_HEAD(condpcm_candidate_list);
+
+static bool dpcm_prepare_done(const struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	enum snd_soc_dpcm_state state = rtd->dpcm[substream->stream].state;
+
+	return state == SND_SOC_DPCM_STATE_PREPARE ||
+	       state == SND_SOC_DPCM_STATE_START ||
+	       state == SND_SOC_DPCM_STATE_PAUSED;
+}
+
+static bool dpcm_hw_params_done(const struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	enum snd_soc_dpcm_state state = rtd->dpcm[substream->stream].state;
+
+	return state >= SND_SOC_DPCM_STATE_HW_PARAMS &&
+	       state < SND_SOC_DPCM_STATE_HW_FREE;
+}
+
+static bool dpcm_start_done(const struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	enum snd_soc_dpcm_state state = rtd->dpcm[substream->stream].state;
+
+	return state == SND_SOC_DPCM_STATE_START ||
+	       state == SND_SOC_DPCM_STATE_PAUSED;
+}
+
+static int soc_condpcm_hw_params(struct snd_soc_condpcm *cpcm,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(cpcm->source);
+	struct snd_soc_pcm_runtime *rtd2 = snd_soc_substream_to_rtd(cpcm->sink);
+	int ret;
+
+	ret = cpcm->ops->hw_params(cpcm, params);
+	if (ret)
+		return ret;
+
+	list_add_tail(&cpcm->source_node, &rtd->cpcm_source_list);
+	list_add_tail(&cpcm->sink_node, &rtd2->cpcm_sink_list);
+	cpcm->state = SNDRV_PCM_STATE_SETUP;
+	return 0;
+}
+
+static void soc_condpcm_hw_free(struct snd_soc_condpcm *cpcm)
+{
+	cpcm->ops->hw_free(cpcm);
+	list_del(&cpcm->source_node);
+	list_del(&cpcm->sink_node);
+	cpcm->state = SNDRV_PCM_STATE_DISCONNECTED;
+}
+
+static void soc_condpcm_prepare(struct snd_soc_condpcm *cpcm,
+				struct snd_pcm_substream *substream)
+{
+	int ret;
+
+	ret = cpcm->ops->prepare(cpcm, substream);
+	if (!ret)
+		cpcm->state = SNDRV_PCM_STATE_PREPARED;
+}
+
+static void soc_condpcm_start(struct snd_soc_condpcm *cpcm,
+			      struct snd_pcm_substream *substream, int cmd)
+{
+	int ret;
+
+	ret = cpcm->ops->trigger(cpcm, substream, cmd);
+	if (ret)
+		cpcm->state = SNDRV_PCM_STATE_SETUP;
+	else
+		cpcm->state = SNDRV_PCM_STATE_RUNNING;
+}
+
+static void soc_condpcm_stop(struct snd_soc_condpcm *cpcm,
+			     struct snd_pcm_substream *substream, int cmd)
+{
+	int ret;
+
+	ret = cpcm->ops->trigger(cpcm, substream, cmd);
+	if (ret || cmd != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+		cpcm->state = SNDRV_PCM_STATE_SETUP;
+	else
+		cpcm->state = SNDRV_PCM_STATE_PREPARED;
+}
+
+void snd_soc_condpcms_prepare(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_condpcm *cpcm;
+
+	/* Prepare conditional pcms only if source and sink are both preprared. */
+	list_for_each_entry(cpcm, &rtd->cpcm_source_list, source_node) {
+		if (cpcm->state == SNDRV_PCM_STATE_SETUP &&
+		    dpcm_prepare_done(cpcm->sink))
+			soc_condpcm_prepare(cpcm, substream);
+	}
+
+	list_for_each_entry(cpcm, &rtd->cpcm_sink_list, sink_node) {
+		if (cpcm->state == SNDRV_PCM_STATE_SETUP &&
+		    dpcm_prepare_done(cpcm->source))
+			soc_condpcm_prepare(cpcm, substream);
+	}
+}
+
+static void soc_condpcms_start(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_condpcm *cpcm;
+
+	/* Start conditional pcms only if source and sink are both running. */
+	list_for_each_entry(cpcm, &rtd->cpcm_source_list, source_node) {
+		if (cpcm->state == SNDRV_PCM_STATE_PREPARED &&
+		    dpcm_start_done(cpcm->sink))
+			soc_condpcm_start(cpcm, substream, cmd);
+	}
+
+	list_for_each_entry(cpcm, &rtd->cpcm_sink_list, sink_node) {
+		if (cpcm->state == SNDRV_PCM_STATE_PREPARED &&
+		    dpcm_start_done(cpcm->source))
+			soc_condpcm_start(cpcm, substream, cmd);
+	}
+}
+
+static void soc_condpcms_stop(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_condpcm *cpcm;
+
+	/* Stop conditional pcms if either source or sink is not running. */
+	list_for_each_entry(cpcm, &rtd->cpcm_source_list, source_node)
+		if (cpcm->state == SNDRV_PCM_STATE_RUNNING)
+			soc_condpcm_stop(cpcm, substream, cmd);
+
+	list_for_each_entry(cpcm, &rtd->cpcm_sink_list, sink_node)
+		if (cpcm->state == SNDRV_PCM_STATE_RUNNING)
+			soc_condpcm_stop(cpcm, substream, cmd);
+}
+
+void snd_soc_condpcms_trigger(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream, int cmd)
+{
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		soc_condpcms_start(rtd, substream, cmd);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		soc_condpcms_stop(rtd, substream, cmd);
+		break;
+	}
+}
+
+void snd_soc_condpcms_teardown(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_pcm_substream *substream)
+{
+	struct snd_soc_condpcm *cpcm, *save;
+
+	list_del(&substream->cpcm_candidate_node);
+
+	/* Free all condpcms this substream spawned. */
+	list_for_each_entry_safe(cpcm, save, &rtd->cpcm_source_list, source_node)
+		soc_condpcm_hw_free(cpcm);
+	list_for_each_entry_safe(cpcm, save, &rtd->cpcm_sink_list, sink_node)
+		soc_condpcm_hw_free(cpcm);
+}
+
+static bool soc_condpcm_test(struct snd_soc_condpcm *cpcm,
+			     struct snd_pcm_substream *substream, int dir)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_condpcm_pred *pred = &cpcm->preds[dir];
+
+	return pred->direction == substream->stream &&
+	       !strcmp(pred->card_name, rtd->card->name) &&
+	       !strcmp(pred->link_name, rtd->dai_link->name);
+}
+
+static struct snd_pcm_substream *
+soc_condpcm_find_match(struct snd_soc_condpcm *cpcm, struct snd_pcm_substream *ignore, int dir)
+{
+	struct snd_pcm_substream *substream;
+
+	list_for_each_entry(substream, &condpcm_candidate_list, cpcm_candidate_node) {
+		if (substream == ignore)
+			continue;
+
+		/* Only substreams that passed hw_params() are valid candidates. */
+		if (!dpcm_hw_params_done(substream))
+			continue;
+
+		if (soc_condpcm_test(cpcm, substream, dir))
+			return substream;
+	}
+
+	return NULL;
+}
+
+static int soc_condpcm_walk(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params, int dir)
+{
+	/* Temporary source/sink cache. */
+	struct snd_pcm_substream *substreams[2];
+	struct snd_soc_condpcm *cpcm;
+	int ret;
+
+	substreams[dir] = substream;
+
+	list_for_each_entry(cpcm, &condpcm_list, node) {
+		if (cpcm->state != SNDRV_PCM_STATE_DISCONNECTED)
+			continue;
+
+		/* Does this cpcm match @substream? */
+		if (!soc_condpcm_test(cpcm, substream, dir))
+			continue;
+
+		/* Find pair for the @substream. */
+		substreams[!dir] = soc_condpcm_find_match(cpcm, substream, !dir);
+		if (!substreams[!dir])
+			continue;
+
+		/* Allow driver to have the final word. */
+		ret = cpcm->ops->match(cpcm, substreams[0], substreams[1]);
+		if (ret)
+			continue;
+		cpcm->source = substreams[0];
+		cpcm->sink = substreams[1];
+
+		ret = soc_condpcm_hw_params(cpcm, params);
+		if (ret) {
+			cpcm->source = NULL;
+			cpcm->sink = NULL;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/* Called by soc-pcm.c after each successful hw_params(). */
+int snd_soc_condpcms_walk_all(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	int ret;
+
+	list_add_tail(&substream->cpcm_candidate_node, &condpcm_candidate_list);
+
+	/* Spawn all condpcms this substream is the missing source of. */
+	ret = soc_condpcm_walk(rtd, substream, params, SNDRV_PCM_STREAM_CAPTURE);
+	if (ret)
+		return ret;
+
+	/* Spawn all condpcms this substream is the missing sink of. */
+	return soc_condpcm_walk(rtd, substream, params, SNDRV_PCM_STREAM_PLAYBACK);
+}
+
+/**
+ * snd_soc_unregister_condpcm - unregister conditional PCM from ASoC framework.
+ *
+ * @cpcm - the instance to unregister and free
+ *
+ * Return: Zero on success or -EBUSY on if the instance is in-use.
+ */
+int snd_soc_unregister_condpcm(struct snd_soc_condpcm *cpcm)
+{
+	if (cpcm->state != SNDRV_PCM_STATE_DISCONNECTED)
+		return -EBUSY;
+
+	list_del(&cpcm->node);
+	kfree(cpcm);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_unregister_condpcm);
+
+/**
+ * snd_soc_register_condpcm - register a conditional PCM to ASoC framework.
+ * @source:		predicate for identifying the data source (substream).
+ * @sink:		predicate for identifying the data sink (substream).
+ * @ops:		driver specific PCM operations.
+ * @private_data:	driver private context.
+ *
+ * Return: A newly created PCM instance or ERR_PTR() on failure.
+ *
+ * The caller is responsible for freeing the instance with
+ * snd_soc_unregister_condpcm() when no longer of use.
+ */
+struct snd_soc_condpcm *snd_soc_register_condpcm(struct snd_soc_condpcm_pred *source,
+						 struct snd_soc_condpcm_pred *sink,
+						 const struct snd_soc_condpcm_ops *ops,
+						 void *private_data)
+{
+	struct snd_soc_condpcm *cpcm;
+
+	/* Sanity check. */
+	if (!ops->match || !ops->hw_params || !ops->hw_free || !ops->prepare || !ops->trigger)
+		return ERR_PTR(-EINVAL);
+
+	cpcm = kzalloc(sizeof(*cpcm), GFP_KERNEL);
+	if (!cpcm)
+		return ERR_PTR(-ENOMEM);
+
+	cpcm->ops = ops;
+	cpcm->preds[0].card_name = source->card_name;
+	cpcm->preds[0].link_name = source->link_name;
+	cpcm->preds[0].direction = source->direction;
+	cpcm->preds[1].card_name = sink->card_name;
+	cpcm->preds[1].link_name = sink->link_name;
+	cpcm->preds[1].direction = sink->direction;
+	cpcm->state = SNDRV_PCM_STATE_DISCONNECTED;
+	cpcm->private_data = private_data;
+	INIT_LIST_HEAD(&cpcm->source_node);
+	INIT_LIST_HEAD(&cpcm->sink_node);
+	INIT_LIST_HEAD(&cpcm->node);
+
+	list_add_tail(&cpcm->node, &condpcm_list);
+
+	return cpcm;
+}
+EXPORT_SYMBOL_GPL(snd_soc_register_condpcm);
diff --git a/sound/soc/soc-condpcm.h b/sound/soc/soc-condpcm.h
new file mode 100644
index 000000000000..65df13af7d44
--- /dev/null
+++ b/sound/soc/soc-condpcm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SND_SOC_CONDPCM_H
+#define __SND_SOC_CONDPCM_H
+
+void snd_soc_condpcms_prepare(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream);
+void snd_soc_condpcms_trigger(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream, int cmd);
+
+void snd_soc_condpcms_teardown(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_pcm_substream *substream);
+int snd_soc_condpcms_walk_all(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params);
+
+#endif
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 20248a29d167..aa595a83c926 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -532,6 +532,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
+	INIT_LIST_HEAD(&rtd->cpcm_source_list);
+	INIT_LIST_HEAD(&rtd->cpcm_sink_list);
 	for_each_pcm_streams(stream) {
 		INIT_LIST_HEAD(&rtd->dpcm[stream].be_clients);
 		INIT_LIST_HEAD(&rtd->dpcm[stream].fe_clients);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d95a73b2ed03..e3d3e65a5f56 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -26,6 +26,8 @@
 #include <sound/soc-link.h>
 #include <sound/initval.h>
 
+#include "soc-condpcm.h"
+
 #define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
 static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 			       const char *func, int ret)
@@ -920,6 +922,8 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 	}
 
 out:
+	if (!ret)
+		snd_soc_condpcms_prepare(rtd, substream);
 	return soc_pcm_ret(rtd, ret);
 }
 
@@ -954,6 +958,9 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 
 	snd_soc_dpcm_mutex_assert_held(rtd);
 
+	if (!rollback)
+		snd_soc_condpcms_teardown(rtd, substream);
+
 	/* clear the corresponding DAIs parameters when going to be inactive */
 	for_each_rtd_dais(rtd, i, dai) {
 		if (snd_soc_dai_active(dai) == 1)
@@ -1105,6 +1112,8 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 out:
 	if (ret < 0)
 		soc_pcm_hw_clean(rtd, substream, 1);
+	else
+		snd_soc_condpcms_walk_all(rtd, substream, params);
 
 	return soc_pcm_ret(rtd, ret);
 }
@@ -1210,6 +1219,8 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 	}
 
+	if (!ret)
+		snd_soc_condpcms_trigger(rtd, substream, cmd);
 	return ret;
 }
 
-- 
2.25.1

