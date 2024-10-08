Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962113AA45
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728376622; cv=none; b=AVfo1anbmnt+TPAVslyf7fR2aAN3EIjG6cWdgJVS7C5/YczCVMhlzpQT2vLwR1UdT3BZwAaCXfw5w14gcOsXppwapCBmsNdd3wj7Nkm3PvoI6/GQki2r7ueSGPvJs143xCbOOfsIUbJbjYuihRIwQXTxV1iio+pPGCIJAquVK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728376622; c=relaxed/simple;
	bh=0hbOu5GgtmPrRJNSCbgk5glOcGtwVa/ASUN5MLnhxPA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=goYqQumUAkQYO+yzYVXxGZEhpxRTQ+YRHNnNFsWxvgbybOO6jnh1rvBe0LlYWiFtDpbUOclsrBqUA/8BhqssZlsFemKkZV7QfzLiOlI0tZhBtsIbggvTzumpu1P53LHeHTmbw5gm4uiKuNw9upkhmywYv+vkTY0zmS7WmhHxSgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE1aoJ6H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE1aoJ6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728376621; x=1759912621;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0hbOu5GgtmPrRJNSCbgk5glOcGtwVa/ASUN5MLnhxPA=;
  b=BE1aoJ6H+b1BVtHDG7+4d92Mgx4KXknOo374TIcSAVTCcgSmFxB+0vKU
   6p3bFuXtu0qWmhCvVn9N58mPJksDECkHesYdfIOuC4CSJzM7Cv43MVthv
   jpE8BFfwo2QuHK8Gh1HIMDE7WO3cKWlfG/1tgU+Ae8up1xDCQu3O0fyjL
   Mf/+rYmI+STZtIQcpyPOLJFYZ4jh+N224BNpDolfYKQU3DxqyjKTOAf7K
   M1CIOLYCc6nYcuKL/sZf3eHGocLe+sjKHbpAst12TTyyMV7no64xh4FEn
   6yQ5aa08b2nUBgL82u5Eq65wsmncj/XqFGupWUL/vFZ5XbVqMTNhXqOQR
   A==;
X-CSE-ConnectionGUID: 3wh8kjMLR5Syy/M5hIMSlw==
X-CSE-MsgGUID: 7XCpUgJeQJmi2/7J35ngWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27502340"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27502340"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 01:37:00 -0700
X-CSE-ConnectionGUID: FB9RZ9zDTAeoL8NERKGWXQ==
X-CSE-MsgGUID: LF3GjmdmQ9KbjGhiboyLfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="106605353"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa002.jf.intel.com with ESMTP; 08 Oct 2024 01:36:57 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Update stream status in a separate thread
Date: Tue,  8 Oct 2024 10:37:58 +0200
Message-Id: <20241008083758.756578-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Function snd_pcm_period_elapsed() is part of sequence servicing HDAudio
stream IRQs. It's called under Global Interrupt Enable (GIE) disabled -
no HDAudio interrupts will be raised. At the same time, the function may
end up calling __snd_pcm_xrun() or snd_pcm_drain_done(). On the
avs-driver side, this translates to IPCs and as GIE is disabled, these
will never complete successfully.

Improve system stability by scheduling stream-IRQ handling in a separate
thread.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/core.c |  3 ++-
 sound/soc/intel/avs/pcm.c  | 19 +++++++++++++++++++
 sound/soc/intel/avs/pcm.h  | 16 ++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/pcm.h

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index da7bac09acb4e..73d4bde9b2f78 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -28,6 +28,7 @@
 #include "avs.h"
 #include "cldma.h"
 #include "messages.h"
+#include "pcm.h"
 
 static u32 pgctl_mask = AZX_PGCTL_LSRMD_MASK;
 module_param(pgctl_mask, uint, 0444);
@@ -247,7 +248,7 @@ static void hdac_stream_update_pos(struct hdac_stream *stream, u64 buffer_size)
 static void hdac_update_stream(struct hdac_bus *bus, struct hdac_stream *stream)
 {
 	if (stream->substream) {
-		snd_pcm_period_elapsed(stream->substream);
+		avs_period_elapsed(stream->substream);
 	} else if (stream->cstream) {
 		u64 buffer_size = stream->cstream->runtime->buffer_size;
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index afc0fc74cf941..4af8115803568 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -16,6 +16,7 @@
 #include <sound/soc-component.h>
 #include "avs.h"
 #include "path.h"
+#include "pcm.h"
 #include "topology.h"
 #include "../../codecs/hda.h"
 
@@ -30,6 +31,7 @@ struct avs_dma_data {
 		struct hdac_ext_stream *host_stream;
 	};
 
+	struct work_struct period_elapsed_work;
 	struct snd_pcm_substream *substream;
 };
 
@@ -56,6 +58,22 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 	return dw->priv;
 }
 
+static void avs_period_elapsed_work(struct work_struct *work)
+{
+	struct avs_dma_data *data = container_of(work, struct avs_dma_data, period_elapsed_work);
+
+	snd_pcm_period_elapsed(data->substream);
+}
+
+void avs_period_elapsed(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct avs_dma_data *data = snd_soc_dai_get_dma_data(dai, substream);
+
+	schedule_work(&data->period_elapsed_work);
+}
+
 static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -77,6 +95,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	data->substream = substream;
 	data->template = template;
 	data->adev = adev;
+	INIT_WORK(&data->period_elapsed_work, avs_period_elapsed_work);
 	snd_soc_dai_set_dma_data(dai, substream, data);
 
 	if (rtd->dai_link->ignore_suspend)
diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
new file mode 100644
index 0000000000000..0f3615c903982
--- /dev/null
+++ b/sound/soc/intel/avs/pcm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2024 Intel Corporation
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_PCM_H
+#define __SOUND_SOC_INTEL_AVS_PCM_H
+
+#include <sound/pcm.h>
+
+void avs_period_elapsed(struct snd_pcm_substream *substream);
+
+#endif
-- 
2.34.1

