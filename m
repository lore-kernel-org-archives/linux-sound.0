Received: from mail-m1973180.qiye.163.com (mail-m1973180.qiye.163.com [220.197.31.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB32E2DDD
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518970; cv=none; b=WZjVbc7/GIukkIjKhJER6e6C6061M/Hpm5NC1Ts3zWSm0TC+Eyh8/OXafO4/Vzb8gM8L2Nwzy36W045k8SvANiAj2ZmFmgrNmvdARQSHaqGSh3L55fGstjCd+YAwBjb69RIbgUdJaYmUv7gCpSoWbLdzruwehrnyKlzIyttSX18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518970; c=relaxed/simple;
	bh=ootsRxhriSA0LaHCvb1g0KqLVxI1eoSoNO7TgtmOWKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k036Ly2JO1EIBMacFbHqkPhPceHGUVJCo0esCxzCCiJSvTk1oJ1aUaN6oQsmGjvcW+g5psl93JU28ilGIkmMCdFfC6nR85DWf3QtJmSm2LeTiH+nfXDSYbaZncU9ZPloOwfF/cu2MjLYYWlwqbmQTpw8DOF4mApvkGJteXlBm8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=NTJN6x+O; arc=none smtp.client-ip=220.197.31.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="NTJN6x+O"
Received: from localhost.localdomain (unknown [182.148.129.247])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b045858;
	Wed, 12 Aug 2026 15:00:28 +0800 (GMT+08:00)
From: qianghua wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	cezary.rojewski@intel.com,
	bo.liu@senarytech.com,
	"qianghua.wang" <qianghua.wang@senarytech.com>
Subject: [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Date: Wed, 12 Aug 2026 14:59:42 +0800
Message-ID: <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786511177.git.qianghua.wang@senarytech.com>
References: <cover.1786511177.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ff4c5bf3709d8kunma462499a3e50b7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0JCVkxCTU5DTBgdSR0ZSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVJT0xZV1kWGg8SFR0UWUFZT0tIVU
	pLSEpPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NTJN6x+OM/s81P6VRx08bEwo9TWeNQw7CNIJNrfMsg4hYpFws9ve4i8ctsludWACwHkr16oNdezNCXe2h8EN7/hNx74sDEbFbLR1RAGDJhXBgtXP/MKTXU0Dt9JCqoDTZizei5Uk8iRI0bCOeyDmdfrDLFYPMMPu0JHSGwm/Cx8=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=IlAw7cDwY9WXvzwzsu43TNJhJlChr/RkyDgjFMgbm7Q=;
	h=date:mime-version:subject:message-id:from;

From: "qianghua.wang" <qianghua.wang@senarytech.com>

Add SoundWire SDCA driver for Senary SN624x multi-function codecs
(jack, speaker amp, and DMIC). Extend the Senary MAINTAINERS entry
for the new codec files only; Intel ACPI match tables remain under
INTEL ASoC DRIVERS.

Signed-off-by: qianghua.wang <qianghua.wang@senarytech.com>
---
 MAINTAINERS                        |    3 +
 sound/soc/codecs/Kconfig           |   12 +
 sound/soc/codecs/Makefile          |    2 +
 sound/soc/codecs/sn624x-sdca-sdw.c | 1873 ++++++++++++++++++++++++++++
 sound/soc/codecs/sn624x-sdca.h     |  144 +++
 5 files changed, 2034 insertions(+)
 create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a21c79f3e436..f18e0ed039e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29837,9 +29837,12 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 
 SENARYTECH AUDIO CODEC DRIVER
 M:	bo liu <bo.liu@senarytech.com>
+M:	qianghua.wang <qianghua.wang@senarytech.com>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 F:	sound/hda/codecs/senarytech.c
+F:	sound/soc/codecs/sn624x*
+F:	sound/soc/sdw_utils/soc_sdw_senary*
 
 THE REST
 M:	Linus Torvalds <torvalds@linux-foundation.org>
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4761ff4afb59..06e4a02f0c58 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -238,6 +238,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT715_SDCA_SDW
 	imply SND_SOC_RT721_SDCA_SDW
 	imply SND_SOC_RT722_SDCA_SDW
+	imply SND_SOC_SN624X_SDCA_SDW
 	imply SND_SOC_RT1308_SDW
 	imply SND_SOC_RT1316_SDW
 	imply SND_SOC_RT1318
@@ -1968,6 +1969,17 @@ config SND_SOC_RT722_SDCA_SDW
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
+config SND_SOC_SN624X_SDCA_SDW
+	tristate "Senary SN624x SDCA Codec - SDW"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	select REGMAP_SOUNDWIRE_MBQ
+	help
+	  Enable support for Senary SN624x SDCA SoundWire codecs.
+	  These multi-function devices provide headset jack, speaker
+	  amplifier, and digital microphone endpoints on the SoundWire
+	  bus.
+
 config SND_SOC_RT715
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d2a689006d69..44b471d8b8c3 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -285,6 +285,7 @@ snd-soc-rt715-y := rt715.o rt715-sdw.o
 snd-soc-rt715-sdca-y := rt715-sdca.o rt715-sdca-sdw.o
 snd-soc-rt721-sdca-y := rt721-sdca.o rt721-sdca-sdw.o
 snd-soc-rt722-sdca-y := rt722-sdca.o rt722-sdca-sdw.o
+snd-soc-sn624x-sdca-y := sn624x-sdca-sdw.o
 snd-soc-rt9120-y := rt9120.o
 snd-soc-rt9123-y := rt9123.o
 snd-soc-rt9123p-y := rt9123p.o
@@ -726,6 +727,7 @@ obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
 obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
 obj-$(CONFIG_SND_SOC_RT721_SDCA_SDW)     += snd-soc-rt721-sdca.o
 obj-$(CONFIG_SND_SOC_RT722_SDCA_SDW)     += snd-soc-rt722-sdca.o
+obj-$(CONFIG_SND_SOC_SN624X_SDCA_SDW)    += snd-soc-sn624x-sdca.o
 obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
 obj-$(CONFIG_SND_SOC_RT9123)	+= snd-soc-rt9123.o
 obj-$(CONFIG_SND_SOC_RT9123P)	+= snd-soc-rt9123p.o
diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
new file mode 100644
index 000000000000..5129e883cddc
--- /dev/null
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -0,0 +1,1873 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// sn624x-sdw-sdca.c -- SN624X SDCA ALSA SoC SoundWire audio driver
+//
+// Copyright(c) 2021 Realtek Semiconductor Corp.
+// Copyright(c) 2025 Senary Semiconductor Corp.
+//
+
+#include <linux/atomic.h>
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/find.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw_type.h>
+
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/sdca.h>
+#include <sound/sdca_asoc.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#include "sn624x-sdca.h"
+
+/* Resume wait after bus re-enumeration (rt722-style probe timeout) */
+#define SN624X_PROBE_TIMEOUT_MS			5000U
+#define SN624X_PWR_D0				SDCA_PDE_PS0
+#define SN624X_PWR_D3				SDCA_PDE_PS3
+#define SN624X_MUTE_ON				1
+/*
+ * Budget for ACTUAL_PS poll via sdca_asoc_pde_poll_actual_ps() (100 polls).
+ * Matches previous ~2s hand-rolled loop for slow PDE transitions.
+ */
+#define SN624X_PDE_PS_POLL_BUDGET_US		2000000U
+
+/*
+ * Trace helper: load with trace=1 or:
+ *   echo 1 > /sys/module/snd_soc_sn624x_sdca/parameters/trace
+ * For finer logs without trace=1, enable dynamic_debug on this file.
+ */
+static bool sn624x_trace;
+module_param_named(trace, sn624x_trace, bool, 0644);
+MODULE_PARM_DESC(trace,
+		 "extra dev_dbg for probe, jack, SDW status (default off)");
+
+/*
+ * Prefer ACPI mipi-sdca-function-initialization-table via
+ * sdca_regmap_write_init(). If absent or DisCo parse is incomplete,
+ * a temporary vendor-window OEM fallback is used until firmware tables land.
+ */
+static bool sn624x_use_sdca_init_table = true;
+module_param_named(use_sdca_init_table, sn624x_use_sdca_init_table, bool, 0644);
+MODULE_PARM_DESC(use_sdca_init_table,
+		 "apply ACPI SDCA function-initialization-table when present (default Y)");
+
+static bool sn624x_mask_sdca_irqs = true;
+module_param_named(mask_sdca_irqs, sn624x_mask_sdca_irqs, bool, 0644);
+MODULE_PARM_DESC(mask_sdca_irqs,
+		 "Mask SDCA INTMASK bits (default Y). Jack detect is poll-driven (UAJ pulse + GE35 read); set N to unmask jack SDCA_0/8 so interrupts can reschedule the poll earlier");
+
+struct sn624x_sdca_priv;
+
+static void sn624x_sdca_sdca_irq_mask_all(struct sn624x_sdca_priv *sn624x);
+static int sn624x_uaj_ge35_apply_detected_mode(struct device *dev,
+					       struct sn624x_sdca_priv *sn624x);
+#define SN624X_DBG(dev, fmt, ...) dev_dbg(dev, "sn624x: " fmt, ##__VA_ARGS__)
+#define SN624X_TRC(dev, fmt, ...) do {					\
+	if (sn624x_trace)						\
+		dev_dbg(dev, "sn624x: " fmt, ##__VA_ARGS__);		\
+} while (0)
+
+/* SN624X_UAJ_CTL_INPUT_DELAY_TIME: vendor latch; once per boot avoids dmesg spam */
+static atomic_t sn624x_power_mode_logged =
+	ATOMIC_INIT(0);
+
+static void sn624x_log_power_mode_once(struct device *dev,
+				       struct sn624x_sdca_priv *sn624x)
+{
+	unsigned int pm;
+	int ret;
+
+	if (!sn624x || !sn624x->regmap)
+		return;
+	if (atomic_xchg(&sn624x_power_mode_logged, 1) != 0)
+		return;
+
+	ret = regmap_read_bypassed(sn624x->regmap,
+				   SN624X_UAJ_CTL_INPUT_DELAY_TIME, &pm);
+	if (ret < 0)
+		dev_err(dev,
+			"sn624x: power_mode read failed reg %#x (%d)\n",
+			SN624X_UAJ_CTL_INPUT_DELAY_TIME, ret);
+	else
+		dev_dbg(dev,
+			"sn624x: power_mode=0x%x (reg %#x; e.g. 0xf powered)\n",
+			pm, SN624X_UAJ_CTL_INPUT_DELAY_TIME);
+}
+
+/*
+ * SDCA control addresses via SDW_SDCA_CTL(fun, ent, ctl, ch).
+ * Pass ch=0 for single-value controls (power/rate/status); use CH_L/CH_R
+ * only for multi-channel FU mute/volume. CH_ENABLE_* are not SDCA Control
+ * Prefix addresses — keep as raw windows.
+ */
+/* Speaker amp (function 4) — PDE/FU power/mute/vol; rate on CS01 */
+#define SN624X_REG_PWR_STATE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_PDE03, \
+		     SDCA_CTL_PDE_ACTUAL_PS, 0)
+#define SN624X_REG_PWR_STATE_WRITE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_PDE03, \
+		     SDCA_CTL_PDE_REQUESTED_PS, 0)
+#define SN624X_REG_RATE_SEL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_CS01, \
+		     SN624X_SDCA_CTL_SAMPLE_FREQ_INDEX, 0)
+#define SN624X_REG_CH_ENABLE_A			0x00000220u
+#define SN624X_REG_CH_ENABLE_B			0x00000230u
+#define SN624X_REG_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_USER_FU10, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_L)
+#define SN624X_REG_CHR_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_USER_FU10, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_R)
+#define SN624X_REG_MUTE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_USER_FU10, \
+		     SN624X_SDCA_CTL_FU_MUTE, SN624X_SDCA_CH_L)
+#define SN624X_REG_RIGHT_MUTE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_USER_FU10, \
+		     SN624X_SDCA_CTL_FU_MUTE, SN624X_SDCA_CH_R)
+
+/* Jack playback (function 1) */
+#define SN624X_REG_JACK_OUT_PWR_STATE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_PDE03, \
+		     SDCA_CTL_PDE_ACTUAL_PS, 0)
+#define SN624X_REG_JACK_OUT_PWR_STATE_WRITE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_PDE03, \
+		     SDCA_CTL_PDE_REQUESTED_PS, 0)
+#define SN624X_REG_JACK_OUT_RATE_SEL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_CS01, \
+		     SN624X_SDCA_CTL_SAMPLE_FREQ_INDEX, 0)
+#define SN624X_REG_JACK_OUT_CH_ENABLE_A		0x00000120u
+#define SN624X_REG_JACK_OUT_CH_ENABLE_B		0x00000130u
+#define SN624X_REG_JACK_OUT_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_L)
+#define SN624X_REG_JACK_OUT_CHR_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_R)
+#define SN624X_REG_JACK_OUT_MUTE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_MUTE, SN624X_SDCA_CH_L)
+#define SN624X_REG_JACK_OUT_CLUSTER_INDEX \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_CRU05, \
+		     SN624X_SDCA_CTL_CLUSTER_INDEX, 0)
+
+/* Jack headset capture (function 1) */
+#define SN624X_REG_JACK_CAP_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_USER_FU1E, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_L)
+#define SN624X_REG_JACK_CAP_CHR_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_USER_FU1E, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_R)
+#define SN624X_REG_JACK_CAP_MUTE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_USER_FU1E, \
+		     SN624X_SDCA_CTL_FU_MUTE, SN624X_SDCA_CH_L)
+#define SN624X_REG_JACK_CAP_PWR_STATE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_PDE04, \
+		     SDCA_CTL_PDE_ACTUAL_PS, 0)
+#define SN624X_REG_JACK_CAP_PWR_STATE_WRITE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_PDE04, \
+		     SDCA_CTL_PDE_REQUESTED_PS, 0)
+#define SN624X_REG_JACK_CAP_RATE_SEL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_CS02, \
+		     SN624X_SDCA_CTL_SAMPLE_FREQ_INDEX, 0)
+#define SN624X_REG_JACK_CAP_CH_ENABLE_A		0x00000420u	/* low bits: 0x3=both */
+#define SN624X_REG_JACK_CAP_CH_ENABLE_B		0x00000430u
+
+#define SN624X_REG_JACK_FUN_STATUS_CTL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_ENTITY0, \
+		     SN624X_SDCA_CTL_FUNCTION_STATUS, 0)
+#define SN624X_JACK_FUN_NEEDS_INIT		BIT(5)
+#define SN624X_JACK_FUN_HAS_BEEN_RESET		BIT(6)
+
+/* DMIC capture (function 2) */
+#define SN624X_REG_DMIC_CAP_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_L)
+#define SN624X_REG_DMIC_CAP_CHR_VOL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_VOLUME, SN624X_SDCA_CH_R)
+/* Q7.8 channel volume: integer in bits 15:8, fraction in bits 7:0 */
+#define SN624X_VOL_Q78(int_part, frac_part) \
+	((((unsigned int)(int_part) & 0xff) << 8) | ((unsigned int)(frac_part) & 0xff))
+#define SN624X_REG_DMIC_CAP_MUTE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_MUTE, SN624X_SDCA_CH_L)
+#define SN624X_REG_DMIC_CAP_CHR_MUTE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_USER_FU14, \
+		     SN624X_SDCA_CTL_FU_MUTE, SN624X_SDCA_CH_R)
+#define SN624X_REG_DMIC_CAP_RATE_SEL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_CS02, \
+		     SN624X_SDCA_CTL_SAMPLE_FREQ_INDEX, 0)
+/* OEM sheet used ctl=0; SDCA Actual PS is 0x10 — poll the standard selector */
+#define SN624X_REG_DMIC_CAP_PWR_STATE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_PDE03, \
+		     SDCA_CTL_PDE_ACTUAL_PS, 0)
+#define SN624X_REG_DMIC_CAP_PWR_STATE_WRITE \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_PDE03, \
+		     SDCA_CTL_PDE_REQUESTED_PS, 0)
+#define SN624X_REG_DMIC_CAP_CH_ENABLE_A		0x00000520u	/* low bits: 0x3=both */
+#define SN624X_REG_DMIC_CAP_CH_ENABLE_B		0x00000530u
+
+#define SN624X_REG_DMIC_FUN_STATUS_CTL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_ENTITY0, \
+		     SN624X_SDCA_CTL_FUNCTION_STATUS, 0)
+
+/*
+ * Write REQUESTED_PS then poll ACTUAL_PS with the shared SDCA helper
+ * (sdca_asoc_pde_poll_actual_ps). Caller must not hand-roll ACTUAL_PS waits.
+ */
+static int sn624x_pde_request_ps(struct device *dev, struct regmap *regmap,
+				 unsigned int fun, unsigned int ent,
+				 unsigned int ps);
+
+/*
+ * DAPM PDE supplies (rt711/rt712 style): write REQUESTED_PS then poll ACTUAL_PS.
+ * Mute-before-D3 is handled by FU widget PRE_PMD, which runs before SUPPLY PRE_PMD
+ * when the FU lists the PDE as a dependency.
+ */
+static int sn624x_dapm_pde_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event,
+				 unsigned int fun, unsigned int ent)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sn624x_sdca_priv *sn624x =
+		snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
+
+	if (!sn624x || !sn624x->regmap)
+		return -ENODEV;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent,
+					    SN624X_PWR_D0);
+		if (ret < 0)
+			dev_warn(dev,
+				 "sn624x: DAPM %s PDE fun=%u ent=0x%x -> PS0 failed (%d)\n",
+				 w->name, fun, ent, ret);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent,
+					    SN624X_PWR_D3);
+		if (ret < 0)
+			dev_warn(dev,
+				 "sn624x: DAPM %s PDE fun=%u ent=0x%x -> PS3 failed (%d)\n",
+				 w->name, fun, ent, ret);
+		break;
+	default:
+		return 0;
+	}
+	return ret;
+}
+
+static int sn624x_pde_hp_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_dapm_pde_event(w, kcontrol, event,
+				     SN624X_FUNC_NUM_JACK_CODEC,
+				     SN624X_SDCA_ENT_PDE03);
+}
+
+static int sn624x_pde_spk_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_dapm_pde_event(w, kcontrol, event,
+				     SN624X_FUNC_NUM_SPEAKER_AMP,
+				     SN624X_SDCA_ENT_PDE03);
+}
+
+static int sn624x_pde_mic2_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_dapm_pde_event(w, kcontrol, event,
+				     SN624X_FUNC_NUM_JACK_CODEC,
+				     SN624X_SDCA_ENT_PDE04);
+}
+
+static int sn624x_pde_dmic_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_dapm_pde_event(w, kcontrol, event,
+				     SN624X_FUNC_NUM_MIC_ARRAY,
+				     SN624X_SDCA_ENT_PDE03);
+}
+
+static int sn624x_fu_mute_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event,
+				unsigned int mute_l, unsigned int mute_r,
+				unsigned int vol_l, unsigned int vol_r,
+				unsigned int vol_val)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sn624x_sdca_priv *sn624x =
+		snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
+
+	if (!sn624x || !sn624x->regmap)
+		return -ENODEV;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		if (vol_l) {
+			ret = regmap_write(sn624x->regmap, vol_l, vol_val);
+			if (ret < 0)
+				dev_warn(dev, "sn624x: DAPM %s vol(L) failed (%d)\n",
+					 w->name, ret);
+		}
+		if (vol_r) {
+			ret = regmap_write(sn624x->regmap, vol_r, vol_val);
+			if (ret < 0)
+				dev_warn(dev, "sn624x: DAPM %s vol(R) failed (%d)\n",
+					 w->name, ret);
+		}
+		ret = regmap_write(sn624x->regmap, mute_l, 0);
+		if (ret < 0)
+			dev_warn(dev, "sn624x: DAPM %s unmute(L) failed (%d)\n",
+				 w->name, ret);
+		if (mute_r) {
+			ret = regmap_write(sn624x->regmap, mute_r, 0);
+			if (ret < 0)
+				dev_warn(dev, "sn624x: DAPM %s unmute(R) failed (%d)\n",
+					 w->name, ret);
+		}
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Mute and settle before PDE SUPPLY PRE_PMD takes the domain to PS3 */
+		ret = regmap_write(sn624x->regmap, mute_l, SN624X_MUTE_ON);
+		if (ret < 0)
+			dev_warn(dev, "sn624x: DAPM %s mute(L) failed (%d)\n",
+				 w->name, ret);
+		if (mute_r) {
+			ret = regmap_write(sn624x->regmap, mute_r, SN624X_MUTE_ON);
+			if (ret < 0)
+				dev_warn(dev, "sn624x: DAPM %s mute(R) failed (%d)\n",
+					 w->name, ret);
+		}
+		usleep_range(SN624X_ROUTE_AFTER_MUTE_US_MIN,
+			     SN624X_ROUTE_AFTER_MUTE_US_MAX);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int sn624x_fu_hp_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_fu_mute_event(w, kcontrol, event,
+				    SN624X_REG_JACK_OUT_MUTE, 0,
+				    SN624X_REG_JACK_OUT_VOL,
+				    SN624X_REG_JACK_OUT_CHR_VOL, 0);
+}
+
+static int sn624x_fu_spk_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_fu_mute_event(w, kcontrol, event,
+				    SN624X_REG_MUTE, SN624X_REG_RIGHT_MUTE,
+				    SN624X_REG_VOL, SN624X_REG_CHR_VOL, 0);
+}
+
+static int sn624x_fu_mic2_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sn624x_sdca_priv *sn624x =
+		snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (event == SND_SOC_DAPM_POST_PMU && sn624x)
+		sn624x_uaj_ge35_apply_detected_mode(component->dev, sn624x);
+
+	ret = sn624x_fu_mute_event(w, kcontrol, event,
+				   SN624X_REG_JACK_CAP_MUTE, 0,
+				   SN624X_REG_JACK_CAP_VOL,
+				   SN624X_REG_JACK_CAP_CHR_VOL,
+				   SN624X_VOL_Q78(6, 0));
+	return ret;
+}
+
+static int sn624x_fu_dmic_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	return sn624x_fu_mute_event(w, kcontrol, event,
+				    SN624X_REG_DMIC_CAP_MUTE,
+				    SN624X_REG_DMIC_CAP_CHR_MUTE,
+				    SN624X_REG_DMIC_CAP_VOL,
+				    SN624X_REG_DMIC_CAP_CHR_VOL,
+				    SN624X_VOL_Q78(6, 0));
+}
+
+static int sn624x_pde_request_ps(struct device *dev, struct regmap *regmap,
+				 unsigned int fun, unsigned int ent,
+				 unsigned int ps)
+{
+	static const struct sdca_pde_delay delays[] = {
+		{ .from_ps = SDCA_PDE_PS0, .to_ps = SDCA_PDE_PS3,
+		  .us = SN624X_PDE_PS_POLL_BUDGET_US },
+		{ .from_ps = SDCA_PDE_PS3, .to_ps = SDCA_PDE_PS0,
+		  .us = SN624X_PDE_PS_POLL_BUDGET_US },
+		{ .from_ps = SDCA_PDE_PS1, .to_ps = SDCA_PDE_PS0,
+		  .us = SN624X_PDE_PS_POLL_BUDGET_US },
+		{ .from_ps = SDCA_PDE_PS2, .to_ps = SDCA_PDE_PS0,
+		  .us = SN624X_PDE_PS_POLL_BUDGET_US },
+		{ .from_ps = SDCA_PDE_PS0, .to_ps = SDCA_PDE_PS0,
+		  .us = SN624X_PDE_PS_POLL_BUDGET_US },
+		{ .from_ps = SDCA_PDE_PS3, .to_ps = SDCA_PDE_PS3,
+		  .us = SN624X_PDE_PS_POLL_BUDGET_US },
+	};
+	unsigned int req = SDW_SDCA_CTL(fun, ent, SDCA_CTL_PDE_REQUESTED_PS, 0);
+	unsigned int act = SDW_SDCA_CTL(fun, ent, SDCA_CTL_PDE_ACTUAL_PS, 0);
+	unsigned int from_ps = SDCA_PDE_PS3;
+	int ret;
+
+	ret = regmap_read(regmap, act, &from_ps);
+	if (ret < 0) {
+		dev_warn(dev,
+			 "sn624x: PDE fun=%u ent=0x%x ACTUAL_PS read failed (%d)\n",
+			 fun, ent, ret);
+		from_ps = (ps == SN624X_PWR_D0) ? SN624X_PWR_D3 : SN624X_PWR_D0;
+	} else {
+		from_ps &= 0xffu;
+	}
+
+	ret = regmap_write(regmap, req, ps);
+	if (ret < 0) {
+		dev_warn(dev,
+			 "sn624x: PDE fun=%u ent=0x%x REQUESTED_PS=%u write failed (%d)\n",
+			 fun, ent, ps, ret);
+		return ret;
+	}
+
+	ret = sdca_asoc_pde_poll_actual_ps(dev, regmap, fun, ent,
+					   from_ps, ps,
+					   delays, ARRAY_SIZE(delays));
+	if (ret < 0)
+		dev_warn(dev,
+			 "sn624x: PDE fun=%u ent=0x%x ACTUAL_PS poll failed (%d; want %u)\n",
+			 fun, ent, ret, ps);
+	return ret;
+}
+
+static void sn624x_jack_type_from_det_mode(struct sn624x_sdca_priv *sn624x,
+					   unsigned int det_mode)
+{
+	switch (det_mode) {
+	case 0x00:
+		sn624x->jack_type = 0;
+		break;
+	case 0x03:
+		sn624x->jack_type = SND_JACK_HEADPHONE;
+		break;
+	case 0x05:
+		sn624x->jack_type = SND_JACK_HEADSET;
+		break;
+	default:
+		SN624X_DBG(&sn624x->slave->dev,
+			   "unknown GE35 detected_mode 0x%x\n", det_mode);
+		sn624x->jack_type = 0;
+		break;
+	}
+}
+
+static int sn624x_uaj_ge35_select_mode(struct device *dev,
+				       struct sn624x_sdca_priv *sn624x,
+				       unsigned int mode)
+{
+	int ret;
+
+	ret = regmap_write(sn624x->regmap,
+			   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC,
+					SN624X_SDCA_ENT_GE35,
+					SN624X_SDCA_CTL_SELECTED_MODE, 0),
+			   mode);
+	if (ret < 0)
+		dev_warn(dev,
+			 "sn624x: jack_cap: GE35 SELECTED_MODE=0x%x failed (%d)\n",
+			 mode, ret);
+	else
+		dev_dbg(dev,
+			 "sn624x: jack_cap: GE35 SELECTED_MODE=0x%x\n",
+			 mode);
+	return ret;
+}
+
+/*
+ * Follow DETECTED_MODE → SELECTED_MODE (rt711/rt722 pattern). Never force
+ * headset: mic path is only valid when the jack hardware reports one.
+ * Also updates sn624x->jack_type from DETECTED_MODE.
+ */
+static int sn624x_uaj_ge35_apply_detected_mode(struct device *dev,
+					       struct sn624x_sdca_priv *sn624x)
+{
+	unsigned int det_mode = 0;
+	int ret;
+
+	ret = regmap_read(sn624x->regmap,
+			  SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC,
+				       SN624X_SDCA_ENT_GE35,
+				       SN624X_SDCA_CTL_DETECTED_MODE, 0),
+			  &det_mode);
+	if (ret < 0) {
+		dev_warn(dev,
+			 "sn624x: jack_cap: GE35 DETECTED_MODE read failed (%d)\n",
+			 ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "sn624x: jack_cap: GE35 DETECTED_MODE=0x%x\n", det_mode);
+	sn624x_jack_type_from_det_mode(sn624x, det_mode);
+
+	if (!det_mode) {
+		dev_dbg(dev,
+			"sn624x: jack_cap: no jack detected — skip SELECTED_MODE\n");
+		return 0;
+	}
+
+	return sn624x_uaj_ge35_select_mode(dev, sn624x, det_mode);
+}
+
+static const char *sn624x_status_str(enum sdw_slave_status status)
+{
+	switch (status) {
+	case SDW_SLAVE_UNATTACHED:
+		return "UNATTACHED";
+	case SDW_SLAVE_ATTACHED:
+		return "ATTACHED";
+	case SDW_SLAVE_ALERT:
+		return "ALERT";
+	case SDW_SLAVE_RESERVED:
+		return "RESERVED";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static int sn624x_sdca_mbq_size(struct device *dev, unsigned int reg)
+{
+	if (!SDW_SDCA_VALID_CTL(reg))
+		return 1;
+
+	/*
+	 * FU_VOLUME and GE35 DETECTED_MODE share control selector 0x02.
+	 * Only list known FU volume addresses as 16-bit MBQ — matching
+	 * DETECTED_MODE by csel alone makes GE35 use SDW_SDCA_MBQ_CTL and
+	 * fails with -ENODATA (-61), which breaks jack plug/unplug.
+	 */
+	switch (reg) {
+	case SN624X_REG_VOL:
+	case SN624X_REG_CHR_VOL:
+	case SN624X_REG_JACK_OUT_VOL:
+	case SN624X_REG_JACK_OUT_CHR_VOL:
+	case SN624X_REG_JACK_CAP_VOL:
+	case SN624X_REG_JACK_CAP_CHR_VOL:
+	case SN624X_REG_DMIC_CAP_VOL:
+	case SN624X_REG_DMIC_CAP_CHR_VOL:
+		return 2;
+	default:
+		return 1;
+	}
+}
+
+static bool sn624x_sdca_readable_register(struct device *dev, unsigned int reg)
+{
+	return sn624x_sdca_mbq_size(dev, reg) > 0;
+}
+
+static bool sn624x_sdca_volatile_register(struct device *dev, unsigned int reg)
+{
+	if (!SDW_SDCA_VALID_CTL(reg))
+		return true;
+
+	switch (reg) {
+	case SN624X_REG_PWR_STATE:
+	case SN624X_REG_JACK_OUT_PWR_STATE:
+	case SN624X_REG_JACK_CAP_PWR_STATE:
+	case SN624X_REG_DMIC_CAP_PWR_STATE:
+	case SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_GE35,
+			  SN624X_SDCA_CTL_DETECTED_MODE, 0):
+		return true;
+	default:
+		if (SDW_SDCA_CTL_CSEL(reg) == SDCA_CTL_PDE_ACTUAL_PS)
+			return true;
+		return false;
+	}
+}
+
+static const struct regmap_sdw_mbq_cfg sn624x_sdca_mbq_cfg = {
+	.mbq_size = sn624x_sdca_mbq_size,
+};
+
+static const struct reg_default sn624x_sdca_reg_defaults[] = {
+	{}
+};
+
+static const struct regmap_config sn624x_sdca_regmap = {
+	.reg_bits = 32,
+	.val_bits = 16,
+	.readable_reg = sn624x_sdca_readable_register,
+	.volatile_reg = sn624x_sdca_volatile_register,
+	.max_register = 0xffffffff,
+	.reg_defaults = sn624x_sdca_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(sn624x_sdca_reg_defaults),
+	.cache_type = REGCACHE_MAPLE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+/*
+ * Prefer ACPI mipi-sdca-function-initialization-table (sdca_regmap_write_init).
+ * find_sdca_init_table() runs before entity parsing, so a partial parse may
+ * still leave a usable init table even when later DisCo entities fail.
+ */
+static int sn624x_write_sdca_init_table(struct device *dev,
+					struct sn624x_sdca_priv *sn624x,
+					struct sdca_function_data *fn,
+					const char *label)
+{
+	int ret;
+
+	if (!sn624x_use_sdca_init_table)
+		return -EOPNOTSUPP;
+	if (!fn || !fn->num_init_table)
+		return -ENOENT;
+
+	ret = sdca_regmap_write_init(dev, sn624x->regmap, fn);
+	if (ret < 0) {
+		dev_warn(dev,
+			 "sn624x: %s function-initialization-table write failed (%d)\n",
+			 label, ret);
+		return ret;
+	}
+
+	dev_info(dev,
+		 "sn624x: applied %s function-initialization-table (%d writes)\n",
+		 label, fn->num_init_table);
+	return 0;
+}
+
+/*
+ * Temporary vendor-window fallback when ACPI has no init table.
+ * Validated on current platforms; remove once DisCo init tables are complete.
+ */
+static int sn624x_jack_oem_fallback_init(struct device *dev,
+					 struct sn624x_sdca_priv *sn624x)
+{
+	static const struct reg_sequence jack_oem_table[] = {
+		REG_SEQ0(SN624X_UAJ_CTL_IT33_MIC_BIAS, 0x06),
+		REG_SEQ0(SN624X_UAJ_CTL_IT31_MIC_BIAS, 0x06),
+		REG_SEQ0(SN624X_UAJ_CTL_FU41_CH1_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU41_CH2_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU31_CH0_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU32_CH0_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU33_CH0_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU36_CH1_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU36_CH2_MUTE, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU31_CH0_GAIN_HIGH, 0x12),
+		REG_SEQ0(SN624X_UAJ_CTL_FU31_CH0_GAIN_LOW, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU32_CH0_GAIN_HIGH, 0x0C),
+		REG_SEQ0(SN624X_UAJ_CTL_FU32_CH0_GAIN_LOW, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_FU33_CH0_GAIN_HIGH, 0x12),
+		REG_SEQ0(SN624X_UAJ_CTL_FU33_CH0_GAIN_LOW, 0x00),
+		REG_SEQ0(SN624X_UAJ_CTL_INPUT_DELAY_TIME, 0x0F),
+		REG_SEQ0(SN624X_UAJ_CTL_PORTA_CHARGE_PUMP, 0x0B),
+	};
+	int ret;
+
+	dev_warn_once(dev,
+		      "sn624x: using temporary jack OEM init fallback (no ACPI init table)\n");
+	ret = regmap_multi_reg_write_bypassed(sn624x->regmap, jack_oem_table,
+					      ARRAY_SIZE(jack_oem_table));
+	if (ret < 0) {
+		dev_warn(dev, "sn624x: jack OEM fallback failed (%d)\n", ret);
+		return ret;
+	}
+	usleep_range(1000, 1500);
+	return 0;
+}
+
+static int sn624x_dmic_oem_fallback_init(struct device *dev,
+					 struct sn624x_sdca_priv *sn624x)
+{
+	static const struct reg_sequence dmic_oem_table[] = {
+		REG_SEQ0(0x00002041, 0x00),
+		REG_SEQ0(SN624X_UAJ_DMIC_PPU11, 0x30),
+		REG_SEQ0(0x00002105, 0x66),
+		REG_SEQ0(0x00002107, 0x26),
+		REG_SEQ0(0x00002109, 0x62),
+		REG_SEQ0(0x40800a09, 0x00),
+		REG_SEQ0(0x40800a0a, 0x00),
+		REG_SEQ0(0x40802a11, 0x00),
+		REG_SEQ0(0x40800a11, 0x00),
+		REG_SEQ0(0x40802a12, 0x00),
+		REG_SEQ0(0x40800a12, 0x00),
+		REG_SEQ0(0x40802a13, 0x00),
+		REG_SEQ0(0x40800a13, 0x00),
+		REG_SEQ0(0x40802a14, 0x00),
+		REG_SEQ0(0x40800a14, 0x00),
+		REG_SEQ0(0x408029d8, 0x0c),
+		REG_SEQ0(0x408009d8, 0x00),
+		REG_SEQ0(0x408029d9, 0x0c),
+		REG_SEQ0(0x408009d9, 0x00),
+		REG_SEQ0(0x00002140, 0x18),
+		REG_SEQ0(0x00002045, 0x01),
+	};
+	int ret;
+
+	dev_warn_once(dev,
+		      "sn624x: using temporary dmic OEM init fallback (no ACPI init table)\n");
+	ret = regmap_multi_reg_write_bypassed(sn624x->regmap, dmic_oem_table,
+					      ARRAY_SIZE(dmic_oem_table));
+	if (ret < 0) {
+		dev_warn(dev, "sn624x: dmic OEM fallback failed (%d)\n", ret);
+		return ret;
+	}
+	usleep_range(1000, 1500);
+	return 0;
+}
+
+static void sn624x_uaj_apply_io_defaults(struct sn624x_sdca_priv *sn624x)
+{
+	struct device *dev = &sn624x->slave->dev;
+	int ret;
+
+	ret = sn624x_write_sdca_init_table(dev, sn624x, sn624x->jack_func,
+					   "jack");
+	if (ret)
+		sn624x_jack_oem_fallback_init(dev, sn624x);
+}
+
+static int sn624x_parse_sdca_functions(struct sn624x_sdca_priv *sn624x)
+{
+	struct sdw_slave *slave = sn624x->slave;
+	struct device *dev = &slave->dev;
+	int i, ret;
+
+	if (!slave->sdca_data.num_functions) {
+		dev_dbg(dev, "sn624x: no SDCA function descriptors from DisCo\n");
+		return 0;
+	}
+
+	for (i = 0; i < slave->sdca_data.num_functions; i++) {
+		struct sdca_function_desc *desc = &slave->sdca_data.function[i];
+		struct sdca_function_data *fn;
+		bool is_jack = false, is_mic = false, is_amp = false;
+
+		switch (desc->type) {
+		case SDCA_FUNCTION_TYPE_UAJ:
+		case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
+		case SDCA_FUNCTION_TYPE_RJ:
+			is_jack = true;
+			break;
+		case SDCA_FUNCTION_TYPE_SMART_MIC:
+		case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
+			is_mic = true;
+			break;
+		case SDCA_FUNCTION_TYPE_SMART_AMP:
+		case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
+		case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
+			is_amp = true;
+			break;
+		default:
+			break;
+		}
+
+		if (desc->adr == SN624X_FUNC_NUM_JACK_CODEC)
+			is_jack = true;
+		else if (desc->adr == SN624X_FUNC_NUM_MIC_ARRAY)
+			is_mic = true;
+		else if (desc->adr == SN624X_FUNC_NUM_SPEAKER_AMP)
+			is_amp = true;
+
+		if (!is_jack && !is_mic && !is_amp)
+			continue;
+
+		fn = devm_kzalloc(dev, sizeof(*fn), GFP_KERNEL);
+		if (!fn)
+			return -ENOMEM;
+
+		fn->desc = desc;
+		ret = sdca_parse_function(dev, slave, fn);
+		if (ret) {
+			/*
+			 * Init table is parsed before entities. Keep a partial
+			 * function if the ACPI init table was already loaded.
+			 */
+			dev_warn(dev,
+				 "sn624x: sdca_parse_function(%s adr=%u) failed (%d)%s\n",
+				 desc->name ? desc->name : "?", desc->adr, ret,
+				 fn->num_init_table ?
+				 ", keeping ACPI init table" : "");
+			if (!fn->num_init_table)
+				continue;
+		} else {
+			dev_dbg(dev,
+				"sn624x: parsed SDCA function %s type=%u adr=%u init_writes=%d\n",
+				desc->name ? desc->name : "?", desc->type,
+				desc->adr, fn->num_init_table);
+		}
+
+		if (is_jack && !sn624x->jack_func)
+			sn624x->jack_func = fn;
+		else if (is_mic && !sn624x->mic_func)
+			sn624x->mic_func = fn;
+		else if (is_amp && !sn624x->amp_func)
+			sn624x->amp_func = fn;
+	}
+
+	return 0;
+}
+
+/*
+ * Poll-driven jack detect: pulse UAJ jack-detect, then apply GE35
+ * DETECTED_MODE → SELECTED_MODE via sn624x_uaj_ge35_apply_detected_mode().
+ */
+static int sn624x_sdca_headset_detect(struct sn624x_sdca_priv *sn624x)
+{
+	struct device *dev = &sn624x->slave->dev;
+	int ret;
+
+	SN624X_DBG(dev, "headset_detect: pulse UAJ jack-detect, read GE35\n");
+	ret = regmap_write(sn624x->regmap,
+			   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC,
+					SN624X_UAJ_ENT_BLOCK,
+					SN624X_UAJ_CTL_JACK_DETECT, 0),
+			   0x08);
+	if (ret < 0)
+		goto io_error;
+
+	usleep_range(5000, 5500);
+
+	ret = sn624x_uaj_ge35_apply_detected_mode(dev, sn624x);
+
+	/* Clear the detect pulse even if GE35 apply failed. */
+	regmap_write(sn624x->regmap,
+		     SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_UAJ_ENT_BLOCK,
+				  SN624X_UAJ_CTL_JACK_DETECT, 0),
+		     0x00);
+
+	if (ret < 0)
+		goto io_error;
+
+	SN624X_DBG(dev, "headset_detect: jack_type=0x%x\n", sn624x->jack_type);
+	return 0;
+
+io_error:
+	if (ret == -ENODATA)
+		SN624X_DBG(dev, "%s: UAJ/GE35 access ignored (-ENODATA)\n",
+			   __func__);
+	else
+		dev_err_ratelimited(dev, "%s failed (%d)\n", __func__, ret);
+	return ret;
+}
+
+static void sn624x_sdca_sdca_irq_mask_all(struct sn624x_sdca_priv *sn624x)
+{
+	if (!sn624x->slave)
+		return;
+
+	sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK1, 0);
+	sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK2, 0);
+	sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK3, 0);
+	sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK4, 0);
+	SN624X_DBG(&sn624x->slave->dev,
+		   "SDCA INTMASK1-4 = 0 (all SDCA sources masked)\n");
+}
+
+static void sn624x_sdca_jack_irq_unmask(struct sn624x_sdca_priv *sn624x)
+{
+	if (!sn624x->slave || sn624x_mask_sdca_irqs)
+		return;
+
+	sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK1,
+			SDW_SCP_SDCA_INTMASK_SDCA_0);
+	sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK2,
+			SDW_SCP_SDCA_INTMASK_SDCA_8);
+}
+
+static void sn624x_sdca_jack_irq_mask(struct sn624x_sdca_priv *sn624x)
+{
+	if (!sn624x->slave)
+		return;
+
+	if (sn624x_mask_sdca_irqs) {
+		sn624x_sdca_sdca_irq_mask_all(sn624x);
+		return;
+	}
+
+	sdw_update_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK1,
+			 SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+	sdw_update_no_pm(sn624x->slave, SDW_SCP_SDCA_INTMASK2,
+			 SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+}
+
+static void sn624x_jack_schedule_poll(struct sn624x_sdca_priv *sn624x)
+{
+	if (!sn624x || !sn624x->hs_jack || !sn624x->slave)
+		return;
+
+	mod_delayed_work(system_power_efficient_wq, &sn624x->jack_detect_work,
+			 msecs_to_jiffies(SN624X_JACK_POLL_MS));
+
+	/* Keep poll alive across autosuspend (3s default) when idle */
+	if (sn624x->component)
+		pm_runtime_mark_last_busy(sn624x->component->dev);
+}
+
+static void sn624x_sdca_jack_poll_and_report(struct sn624x_sdca_priv *sn624x)
+{
+	struct device *dev;
+
+	if (!sn624x->hs_jack || !sn624x->slave)
+		return;
+
+	dev = &sn624x->slave->dev;
+	if (sn624x_sdca_headset_detect(sn624x) < 0)
+		return;
+
+	snd_soc_jack_report(sn624x->hs_jack, sn624x->jack_type,
+			    SND_JACK_HEADSET | SND_JACK_HEADPHONE);
+	sn624x->jack_type_last = sn624x->jack_type;
+	dev_dbg(dev, "sn624x: jack polled: detected_mode -> jack_type=0x%x\n",
+		 sn624x->jack_type);
+}
+
+static void sn624x_sdca_jack_detect_handler(struct work_struct *work)
+{
+	struct sn624x_sdca_priv *sn624x =
+		container_of(work, struct sn624x_sdca_priv, jack_detect_work.work);
+	struct device *dev;
+	struct snd_soc_component *component;
+	int pm_ret;
+	bool got_pm = false;
+
+	if (!sn624x->slave) {
+		sn624x_jack_schedule_poll(sn624x);
+		return;
+	}
+
+	dev = &sn624x->slave->dev;
+	component = sn624x->component;
+	if (component) {
+		pm_ret = pm_runtime_resume_and_get(component->dev);
+		if (pm_ret >= 0) {
+			got_pm = true;
+		} else if (pm_ret != -EACCES) {
+			SN624X_DBG(dev, "jack_work: pm resume failed (%d)\n", pm_ret);
+		}
+	}
+
+	if (!sn624x->hs_jack) {
+		SN624X_DBG(dev, "jack_work: skip (no hs_jack)\n");
+		goto out_reschedule;
+	}
+
+	/* Registers are only valid after ATTACHED → io_init (hw_init). */
+	if (!sn624x->hw_init) {
+		SN624X_DBG(dev, "jack_work: skip (hw_init not ready)\n");
+		goto out_reschedule;
+	}
+
+	/* Poll GE35 every interval; do not rely on SDCA_0 IRQ or PCM activity */
+	sn624x_sdca_headset_detect(sn624x);
+
+	if (sn624x->jack_type != sn624x->jack_type_last) {
+		dev_dbg(dev,
+			 "sn624x: jack event: %s (jack_type=0x%x; HP=0x%x HS=0x%x)\n",
+			 sn624x->jack_type ? "plug" : "unplug",
+			 sn624x->jack_type, SND_JACK_HEADPHONE, SND_JACK_HEADSET);
+		sn624x->jack_type_last = sn624x->jack_type;
+
+		snd_soc_jack_report(sn624x->hs_jack, sn624x->jack_type,
+				    SND_JACK_HEADSET | SND_JACK_HEADPHONE);
+	}
+
+out_reschedule:
+	sn624x_jack_schedule_poll(sn624x);
+	if (got_pm) {
+		pm_runtime_mark_last_busy(component->dev);
+		pm_runtime_put_autosuspend(component->dev);
+	}
+}
+
+static void sn624x_sdca_jack_init(struct sn624x_sdca_priv *sn624x)
+{
+	/* No machine set_jack() yet — not "jack unsupported". */
+	if (!sn624x->hs_jack)
+		return;
+
+	sn624x_sdca_jack_irq_unmask(sn624x);
+	sn624x_sdca_jack_poll_and_report(sn624x);
+	sn624x_jack_schedule_poll(sn624x);
+
+	dev_dbg(&sn624x->slave->dev,
+		 "sn624x: jack_init: poll scheduled every %ums\n", SN624X_JACK_POLL_MS);
+	SN624X_DBG(&sn624x->slave->dev, "jack_init: SDCA INTMASK1/2 unmasked\n");
+	SN624X_TRC(&sn624x->slave->dev, "jack detection IRQ unmasked\n");
+}
+
+static int sn624x_sdca_set_jack_detect(struct snd_soc_component *component,
+				       struct snd_soc_jack *hs_jack, void *data)
+{
+	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	sn624x->hs_jack = hs_jack;
+	sn624x->jack_type_last = -1;
+	dev_dbg(component->dev,
+		 "sn624x: set_jack: hs_jack=%p first_hw_init=%d hw_init=%d\n",
+		 hs_jack, sn624x->first_hw_init, sn624x->hw_init);
+
+	/* set_jack may run before io_init; poll waits until hw_init. */
+	if (!sn624x->first_hw_init) {
+		sn624x_jack_schedule_poll(sn624x);
+		return 0;
+	}
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(component->dev, "%s: resume failed (%d)\n", __func__, ret);
+			return ret;
+		}
+		sn624x_jack_schedule_poll(sn624x);
+		return 0;
+	}
+
+	sn624x_sdca_jack_init(sn624x);
+	pm_runtime_put_autosuspend(component->dev);
+
+	return 0;
+}
+
+/* Prefer ACPI init table; OEM vendor-window fallback only if absent. */
+static int sn624x_jack_apply_defaults(struct device *dev,
+				      struct sn624x_sdca_priv *sn624x)
+{
+	int ret;
+
+	if (!sn624x || !sn624x->regmap || !sn624x->slave)
+		return -ENODEV;
+
+	ret = sn624x_write_sdca_init_table(dev, sn624x, sn624x->jack_func,
+					   "jack");
+	if (ret == 0) {
+		usleep_range(1000, 1500);
+		return 0;
+	}
+
+	return sn624x_jack_oem_fallback_init(dev, sn624x);
+}
+
+static int sn624x_dmic_apply_defaults(struct device *dev,
+				      struct sn624x_sdca_priv *sn624x)
+{
+	int ret;
+
+	if (!sn624x || !sn624x->regmap || !sn624x->slave)
+		return -ENODEV;
+
+	ret = sn624x_write_sdca_init_table(dev, sn624x, sn624x->mic_func,
+					   "dmic");
+	if (ret == 0) {
+		usleep_range(1000, 1500);
+		return 0;
+	}
+
+	return sn624x_dmic_oem_fallback_init(dev, sn624x);
+}
+
+static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
+	int ret;
+	unsigned int jack_func_status, dmic_func_status;
+
+	if (sn624x->hw_init) {
+		SN624X_DBG(dev, "io_init: skip (hw_init already true)\n");
+		return 0;
+	}
+
+	SN624X_TRC(dev, "io_init: start (first hardware bring-up)\n");
+	sn624x->disable_irq = false;
+
+	if (sn624x_mask_sdca_irqs)
+		sn624x_sdca_sdca_irq_mask_all(sn624x);
+
+	regcache_cache_only(sn624x->regmap, false);
+
+	pm_runtime_get_noresume(dev);
+
+	sn624x_uaj_apply_io_defaults(sn624x);
+
+	if (sn624x->hs_jack)
+		sn624x_sdca_jack_init(sn624x);
+
+	ret = regmap_read_bypassed(sn624x->regmap,
+					SN624X_REG_JACK_FUN_STATUS_CTL,
+					&jack_func_status);
+	if (ret < 0) {
+		dev_dbg(dev,
+			"sn624x: io_init: JACK FUN STATUS read failed (%d)\n",
+			ret);
+		goto io_init_next;
+	}
+	if (jack_func_status & (SN624X_JACK_FUN_NEEDS_INIT |
+				SN624X_JACK_FUN_HAS_BEEN_RESET)) {
+		const struct reg_sequence clear_status =
+			REG_SEQ0(SN624X_REG_JACK_FUN_STATUS_CTL, 0x61);
+
+		ret = sn624x_jack_apply_defaults(dev, sn624x);
+		if (ret < 0) {
+			dev_warn(dev,
+					"sn624x: io_init: jack defaults failed (%d)\n",
+					ret);
+			goto io_init_next;
+		}
+		ret = regmap_multi_reg_write_bypassed(
+			sn624x->regmap, &clear_status, 1);
+		if (ret < 0) {
+			dev_warn(dev,
+					"sn624x: io_init: JACK FUN STATUS clear write failed (%d)\n",
+					ret);
+			goto io_init_next;
+		}
+		usleep_range(1000, 1500);
+	}
+
+io_init_next:
+	ret = regmap_read_bypassed(sn624x->regmap,
+					SN624X_REG_DMIC_FUN_STATUS_CTL,
+					&dmic_func_status);
+	if (ret < 0) {
+		dev_dbg(dev,
+			"sn624x: io_init: DMIC FUN STATUS read failed (%d)\n",
+			ret);
+		goto io_init_end;
+	}
+
+	if (dmic_func_status & (SN624X_JACK_FUN_NEEDS_INIT |
+				SN624X_JACK_FUN_HAS_BEEN_RESET)){
+		const struct reg_sequence clear_status =
+			REG_SEQ0(SN624X_REG_DMIC_FUN_STATUS_CTL, 0x61);
+		ret = sn624x_dmic_apply_defaults(dev, sn624x);
+		if (ret < 0) {
+			dev_warn(dev,
+					"sn624x: io_init: dmic defaults failed (%d)\n",
+					ret);
+			goto io_init_end;
+		}
+		ret = regmap_multi_reg_write_bypassed(sn624x->regmap,
+								&clear_status,
+								1);
+		if (ret < 0) {
+			dev_warn(dev,
+					"sn624x: io_init: DMIC FUN STATUS clear write failed (%d)\n",
+					ret);
+			goto io_init_end;
+		}
+		usleep_range(1000, 1500);
+	}
+
+io_init_end:
+	pm_runtime_set_active(dev);
+
+	sn624x->hw_init = true;
+	sn624x->first_hw_init = true;
+
+	pm_runtime_put_autosuspend(dev);
+
+	sn624x_log_power_mode_once(dev, sn624x);
+
+	SN624X_DBG(dev, "io_init: complete (hw_init set)\n");
+	SN624X_TRC(dev, "io_init: done, jack %s\n",
+		   sn624x->hs_jack ? "will init" : "not registered yet");
+	return 0;
+}
+
+/*
+ * Bus lifecycle (same as rt722): enumerate → assign dev_num → ATTACHED →
+ * io_init(). Do not poll enumeration/init around each register access; after
+ * unattach, resume waits once on initialization_complete then regcache_sync.
+ */
+static int sn624x_sdca_update_status(struct sdw_slave *slave,
+				     enum sdw_slave_status status)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
+	bool need_io_init;
+	int ret;
+
+	SN624X_DBG(&slave->dev, "update_status: %s hw_init=%d dev_num=%u\n",
+		   sn624x_status_str(status), sn624x->hw_init, slave->dev_num);
+	SN624X_TRC(&slave->dev, "SDW status=%s (hw_init=%d)\n",
+		   sn624x_status_str(status), sn624x->hw_init);
+
+	if (status == SDW_SLAVE_UNATTACHED) {
+		cancel_delayed_work_sync(&sn624x->jack_detect_work);
+		sn624x->hw_init = false;
+		SN624X_TRC(&slave->dev, "slave UNATTACHED: cleared hw_init, jack work cancelled\n");
+	}
+
+	if (status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	if (sn624x_mask_sdca_irqs)
+		sn624x_sdca_sdca_irq_mask_all(sn624x);
+
+	need_io_init = !sn624x->hw_init;
+	if (need_io_init) {
+		dev_notice(&slave->dev, "sn624x: update_status ATTACHED -> io_init()\n");
+		SN624X_TRC(&slave->dev, "calling io_init from ATTACHED\n");
+		ret = sn624x_sdca_io_init(&slave->dev, slave);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(&slave->dev,
+			"sn624x: update_status ATTACHED: io_init already done\n");
+	}
+
+	/* Re-ATTACHED without io_init: restore jack detect after bus is up. */
+	if (sn624x->hs_jack && sn624x->hw_init && !need_io_init) {
+		sn624x_sdca_jack_irq_unmask(sn624x);
+		sn624x_sdca_jack_poll_and_report(sn624x);
+		sn624x_jack_schedule_poll(sn624x);
+	}
+
+	return 0;
+}
+
+static int sn624x_sdca_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	struct sdw_dpn_prop *dpn;
+	unsigned long addr;
+	unsigned int bit;
+	int nval;
+	int i, j;
+
+	sdw_slave_read_lane_mapping(slave);
+	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
+	prop->paging_support = true;
+	prop->use_domain_irq = true;
+	prop->wake_capable = true;
+
+	prop->source_ports = BIT(SN624X_PORT_JACK_CAPTURE) |
+			     BIT(SN624X_PORT_DMIC_CAPTURE);
+	prop->sink_ports = BIT(SN624X_PORT_JACK_PLAYBACK) |
+			   BIT(SN624X_PORT_SPEAKER_PLAYBACK);
+
+	nval = hweight32(prop->source_ports);
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					   sizeof(*prop->src_dpn_prop), GFP_KERNEL);
+	if (!prop->src_dpn_prop)
+		return -ENOMEM;
+	i = 0;
+	dpn = prop->src_dpn_prop;
+	addr = prop->source_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+	nval = hweight32(prop->sink_ports);
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					   sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+	j = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[j].num = bit;
+		dpn[j].type = SDW_DPN_FULL;
+		dpn[j].simple_ch_prep_sm = true;
+		dpn[j].ch_prep_timeout = 10;
+		j++;
+	}
+	prop->clk_stop_timeout = 900;
+	prop->simple_clk_stop_capable = true;
+	prop->lane_control_support = true;
+	SN624X_DBG(&slave->dev,
+		   "read_prop: src_ports=0x%x sink_ports=0x%x lane irq paging\n",
+		   prop->source_ports, prop->sink_ports);
+	SN624X_TRC(&slave->dev, "read_prop: slave properties filled\n");
+
+	return 0;
+}
+
+/*
+ * Clear SDCA INT1/2 only. DP0_INT standard fields (PORT_READY, etc.) are
+ * owned by the SoundWire bus core; cascade clears when SDCA status is clear.
+ * Pending SDCA IRQs can block clock-stop prepare (CLK_STP_NF -> -ETIMEDOUT).
+ */
+static int sn624x_sdca_flush_pending_irqs(struct sn624x_sdca_priv *sn624x,
+					  struct device *dev)
+{
+	int ret, stat = 0;
+	int count = 0;
+	const int retry = 3;
+	unsigned int scp_sdca_stat1, scp_sdca_stat2 = 0;
+
+	if (!sn624x || !sn624x->slave)
+		return 0;
+
+	ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1);
+	if (ret < 0)
+		return ret;
+	sn624x->scp_sdca_stat1 = ret;
+
+	ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2);
+	if (ret < 0)
+		return ret;
+	sn624x->scp_sdca_stat2 = ret;
+
+	do {
+		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			return ret;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_0) {
+			ret = sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1,
+					      SDW_SCP_SDCA_INTMASK_SDCA_0);
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2);
+		if (ret < 0)
+			return ret;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_8) {
+			ret = sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2,
+					      SDW_SCP_SDCA_INTMASK_SDCA_8);
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			return ret;
+		scp_sdca_stat1 = ret & SDW_SCP_SDCA_INTMASK_SDCA_0;
+
+		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2);
+		if (ret < 0)
+			return ret;
+		scp_sdca_stat2 = ret & SDW_SCP_SDCA_INTMASK_SDCA_8;
+
+		stat = scp_sdca_stat1 || scp_sdca_stat2;
+		count++;
+	} while (stat != 0 && count < retry);
+
+	if (stat && dev)
+		dev_warn(dev,
+			 "sn624x: SDCA IRQ flush incomplete (stat=%u)\n", stat);
+
+	return stat ? -EBUSY : 0;
+}
+
+static int sn624x_sdca_interrupt_callback(struct sdw_slave *slave,
+					  struct sdw_slave_intr_status *status)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
+	int ret;
+
+	if (!sn624x)
+		return 0;
+
+	/*
+	 * Bus expects the codec to clear SCP SDCA INT1/2 when cascade is set.
+	 * Leaving them set can stall alert handling.
+	 */
+
+	SN624X_DBG(&slave->dev,
+		   "irq: control_port=%#x sdca_cascade=%u disable_irq=%d\n",
+		   status->control_port, status->sdca_cascade, sn624x->disable_irq);
+
+	cancel_delayed_work_sync(&sn624x->jack_detect_work);
+
+	mutex_lock(&sn624x->disable_irq_lock);
+
+	ret = sn624x_sdca_flush_pending_irqs(sn624x, &slave->dev);
+	if (ret < 0 && ret != -EBUSY)
+		goto io_error;
+
+	SN624X_DBG(&slave->dev, "irq: INT1=0x%x INT2=0x%x\n",
+		   sn624x->scp_sdca_stat1, sn624x->scp_sdca_stat2);
+
+	/*
+	 * Always restart the jack poll after IRQ handling so a cancel above
+	 * cannot stop detection. With mask_sdca_irqs=N this also turns a jack
+	 * SDCA_0/8 interrupt into an early poll; the poll itself still does
+	 * the UAJ pulse + GE35 read.
+	 */
+	if (!sn624x->disable_irq)
+		sn624x_jack_schedule_poll(sn624x);
+
+	mutex_unlock(&sn624x->disable_irq_lock);
+	return 0;
+
+io_error:
+	mutex_unlock(&sn624x->disable_irq_lock);
+	dev_err_ratelimited(&slave->dev, "%s: IO error (%d)\n", __func__, ret);
+	return ret;
+}
+
+static const struct sdw_slave_ops sn624x_sdca_slave_ops = {
+	.read_prop = sn624x_sdca_read_prop,
+	.interrupt_callback = sn624x_sdca_interrupt_callback,
+	.update_status = sn624x_sdca_update_status,
+};
+
+static int sn624x_sdca_probe(struct snd_soc_component *component)
+{
+	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	sn624x->component = component;
+
+	if (!sn624x->first_hw_init)
+		return 0;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
+static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_runtime *sdw_stream;
+	unsigned int ch = params_channels(params);
+	int port;
+	int ret;
+
+	dev_dbg(dai->dev,
+		 "sn624x: hw_params: entered dai=%s id=%d stream=%s\n",
+		 dai->name, dai->id, snd_pcm_stream_str(substream));
+
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!sdw_stream) {
+		dev_warn(dai->dev,
+			 "sn624x: hw_params: no SDW stream (set_stream not run yet?)\n");
+		return -EINVAL;
+	}
+	if (!sn624x->slave) {
+		dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
+		return -EINVAL;
+	}
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err(dai->dev,
+			"sn624x: hw_params: pm_runtime_resume failed (%d)\n", ret);
+		return ret;
+	}
+
+	if (sn624x->hw_init)
+		sn624x_log_power_mode_once(dai->dev, sn624x);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		if (dai->id == SN624X_DAI_JACK)
+			port = SN624X_PORT_JACK_PLAYBACK;
+		else if (dai->id == SN624X_DAI_SPEAKER)
+			port = SN624X_PORT_SPEAKER_PLAYBACK;
+		else
+			return -EINVAL;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		if (dai->id == SN624X_DAI_JACK) {
+			port = SN624X_PORT_JACK_CAPTURE;
+		} else if (dai->id == SN624X_DAI_DMIC) {
+			port = SN624X_PORT_DMIC_CAPTURE;
+		} else {
+			return -EINVAL;
+		}
+	}
+	stream_config.frame_rate = params_rate(params);
+	stream_config.ch_count = ch;
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+	port_config.ch_mask = GENMASK(ch - 1, 0);
+	port_config.num = port;
+
+	ret = sdw_stream_add_slave(sn624x->slave, &stream_config,
+				   &port_config, 1, sdw_stream);
+	if (ret)
+		dev_err(dai->dev, "%s: sdw_stream_add_slave port %d failed: %d\n",
+			__func__, port, ret);
+	return ret;
+}
+
+static int sn624x_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!sn624x->slave)
+		return -EINVAL;
+
+	return sdw_stream_remove_slave(sn624x->slave, sdw_stream);
+}
+
+static int sn624x_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				      int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+	return 0;
+}
+
+static void sn624x_sdca_shutdown(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+}
+
+static const struct snd_soc_dapm_widget sn624x_sdca_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX", "Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SPK RX", "Speaker Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DMIC TX", "DMic Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_SUPPLY("PDE HP", SND_SOC_NOPM, 0, 0,
+			    sn624x_pde_hp_event,
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE SPK", SND_SOC_NOPM, 0, 0,
+			    sn624x_pde_spk_event,
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE MIC2", SND_SOC_NOPM, 0, 0,
+			    sn624x_pde_mic2_event,
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE DMIC", SND_SOC_NOPM, 0, 0,
+			    sn624x_pde_dmic_event,
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_DAC_E("FU HP", NULL, SND_SOC_NOPM, 0, 0,
+			   sn624x_fu_hp_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC_E("FU SPK", NULL, SND_SOC_NOPM, 0, 0,
+			   sn624x_fu_spk_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("FU MIC2", NULL, SND_SOC_NOPM, 0, 0,
+			   sn624x_fu_mic2_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("FU DMIC", NULL, SND_SOC_NOPM, 0, 0,
+			   sn624x_fu_dmic_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_OUTPUT("HP"),
+	SND_SOC_DAPM_OUTPUT("SPK"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_INPUT("DMIC"),
+};
+
+static const struct snd_soc_dapm_route sn624x_sdca_audio_map[] = {
+	{ "FU HP", NULL, "RX" },
+	{ "FU HP", NULL, "PDE HP" },
+	{ "HP", NULL, "FU HP" },
+
+	{ "FU SPK", NULL, "SPK RX" },
+	{ "FU SPK", NULL, "PDE SPK" },
+	{ "SPK", NULL, "FU SPK" },
+
+	{ "FU MIC2", NULL, "MIC2" },
+	{ "FU MIC2", NULL, "PDE MIC2" },
+	/* UAJ headset capture also needs jack PDE03 (shared with HP) */
+	{ "FU MIC2", NULL, "PDE HP" },
+	{ "TX", NULL, "FU MIC2" },
+
+	{ "FU DMIC", NULL, "DMIC" },
+	{ "FU DMIC", NULL, "PDE DMIC" },
+	{ "DMIC TX", NULL, "FU DMIC" },
+};
+
+static const struct snd_soc_dai_ops sn624x_sdca_ops = {
+	.hw_params	= sn624x_sdca_pcm_hw_params,
+	.hw_free	= sn624x_sdca_pcm_hw_free,
+	.set_stream	= sn624x_sdca_set_sdw_stream,
+	.shutdown	= sn624x_sdca_shutdown,
+};
+
+static struct snd_soc_dai_driver sn624x_sdca_dai[] = {
+	{
+		.name = "sn6242-sdca-aif",
+		.id = 0,
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SN624X_STEREO_RATES,
+			.formats = SN624X_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SN624X_STEREO_RATES,
+			.formats = SN624X_FORMATS,
+		},
+		.ops = &sn624x_sdca_ops,
+	},
+	{
+		.name = "sn6242-sdca-aif2",
+		.id = 1,
+		.playback = {
+			.stream_name = "Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SN624X_STEREO_RATES,
+			.formats = SN624X_FORMATS,
+		},
+		.ops = &sn624x_sdca_ops,
+	},
+	{
+		.name = "sn6242-sdca-aif3",
+		.id = 2,
+		.capture = {
+			.stream_name = "DMic Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = SN624X_STEREO_RATES,
+			.formats = SN624X_FORMATS,
+		},
+		.ops = &sn624x_sdca_ops,
+	},
+};
+
+static const struct snd_soc_component_driver soc_sdca_dev_sn624x = {
+	.probe = sn624x_sdca_probe,
+	.dapm_widgets = sn624x_sdca_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sn624x_sdca_dapm_widgets),
+	.dapm_routes = sn624x_sdca_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(sn624x_sdca_audio_map),
+	.set_jack = sn624x_sdca_set_jack_detect,
+	.endianness = 1,
+};
+
+int sn624x_sdca_init(struct device *dev, struct regmap *regmap,
+		      struct sdw_slave *slave)
+{
+	struct sn624x_sdca_priv *sn624x;
+	int ret;
+
+	sn624x = devm_kzalloc(dev, sizeof(*sn624x), GFP_KERNEL);
+	if (!sn624x)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, sn624x);
+	sn624x->slave = slave;
+	sn624x->regmap = regmap;
+
+	ret = sn624x_parse_sdca_functions(sn624x);
+	if (ret < 0)
+		return ret;
+
+	mutex_init(&sn624x->disable_irq_lock);
+	INIT_DELAYED_WORK(&sn624x->jack_detect_work, sn624x_sdca_jack_detect_handler);
+
+	regcache_cache_only(sn624x->regmap, true);
+
+	ret = devm_snd_soc_register_component(dev,
+					      &soc_sdca_dev_sn624x, sn624x_sdca_dai,
+					      ARRAY_SIZE(sn624x_sdca_dai));
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_enable(dev);
+
+	SN624X_TRC(dev, "snd_soc_register_component OK (DAI sn624x-sdca-aif)\n");
+	return 0;
+}
+
+static int sn624x_sdca_sdw_probe(struct sdw_slave *slave,
+				 const struct sdw_device_id *id)
+{
+	struct regmap *regmap;
+	int ret;
+
+	SN624X_DBG(&slave->dev, "sdw_probe: dev_num=%u status=%s\n",
+		   slave->dev_num, sn624x_status_str(slave->status));
+
+	regmap = devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave,
+					      &sn624x_sdca_regmap,
+					      &sn624x_sdca_mbq_cfg);
+	if (IS_ERR(regmap)) {
+		dev_err(&slave->dev, "sn624x: devm_regmap_init_sdw_mbq_cfg failed (%ld)\n",
+			PTR_ERR(regmap));
+		return PTR_ERR(regmap);
+	}
+
+	ret = sn624x_sdca_init(&slave->dev, regmap, slave);
+	if (ret < 0)
+		dev_err(&slave->dev, "sn624x: sn624x_sdca_init failed (%d)\n", ret);
+	else {
+		struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
+
+		if (sn624x && sn624x_mask_sdca_irqs)
+			sn624x_sdca_sdca_irq_mask_all(sn624x);
+		SN624X_TRC(&slave->dev, "SoundWire probe finished OK\n");
+	}
+
+	return ret;
+}
+
+static void sn624x_sdca_sdw_remove(struct sdw_slave *slave)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
+
+	SN624X_TRC(&slave->dev, "SoundWire driver remove\n");
+	cancel_delayed_work_sync(&sn624x->jack_detect_work);
+	if (sn624x->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+	mutex_destroy(&sn624x->disable_irq_lock);
+}
+
+static const struct sdw_device_id sn624x_sdca_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6242, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6244, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6247, 0x3, 0x1, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, sn624x_sdca_id);
+
+static int sn624x_sdca_dev_suspend(struct device *dev)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
+
+	if (!sn624x->first_hw_init)
+		return 0;
+
+	regcache_cache_only(sn624x->regmap, true);
+
+	return 0;
+}
+
+static int sn624x_sdca_dev_system_suspend(struct device *dev)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
+
+	if (!sn624x->first_hw_init)
+		return 0;
+
+	cancel_delayed_work_sync(&sn624x->jack_detect_work);
+
+	mutex_lock(&sn624x->disable_irq_lock);
+	sn624x->disable_irq = true;
+	sn624x_sdca_jack_irq_mask(sn624x);
+	mutex_unlock(&sn624x->disable_irq_lock);
+
+	return sn624x_sdca_dev_suspend(dev);
+}
+
+static int sn624x_sdca_regmap_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!sn624x->first_hw_init)
+		return 0;
+
+	SN624X_DBG(dev, "resume: unattach_request=%u\n", slave->unattach_request);
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(SN624X_PROBE_TIMEOUT_MS));
+	if (!time) {
+		dev_err(dev, "%s: initialization timed out\n", __func__);
+		sdw_show_ping_status(slave->bus, true);
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(sn624x->regmap, false);
+	regcache_sync(sn624x->regmap);
+
+	return 0;
+}
+
+static int sn624x_sdca_dev_resume(struct device *dev)
+{
+	return sn624x_sdca_regmap_resume(dev);
+}
+
+static int sn624x_sdca_dev_system_resume(struct device *dev)
+{
+	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
+	int ret;
+
+	ret = sn624x_sdca_regmap_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&sn624x->disable_irq_lock);
+	if (sn624x->disable_irq) {
+		sn624x_sdca_jack_irq_unmask(sn624x);
+		sn624x->disable_irq = false;
+	}
+	mutex_unlock(&sn624x->disable_irq_lock);
+
+	if (sn624x->hs_jack && sn624x->hw_init) {
+		sn624x_sdca_jack_poll_and_report(sn624x);
+		sn624x_jack_schedule_poll(sn624x);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops sn624x_sdca_pm = {
+	SYSTEM_SLEEP_PM_OPS(sn624x_sdca_dev_system_suspend, sn624x_sdca_dev_system_resume)
+	RUNTIME_PM_OPS(sn624x_sdca_dev_suspend, sn624x_sdca_dev_resume, NULL)
+};
+
+static struct sdw_driver sn624x_sdca_sdw_driver = {
+	.driver = {
+		.name = "sn624x-sdca",
+		.pm = pm_ptr(&sn624x_sdca_pm),
+	},
+	.probe = sn624x_sdca_sdw_probe,
+	.remove = sn624x_sdca_sdw_remove,
+	.ops = &sn624x_sdca_slave_ops,
+	.id_table = sn624x_sdca_id,
+};
+module_sdw_driver(sn624x_sdca_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC SN624X SDCA SoundWire driver with UAJ jack support");
+MODULE_AUTHOR("Senary Semiconductor Corp.");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
+MODULE_SOFTDEP("pre: snd-soc-sdca");
diff --git a/sound/soc/codecs/sn624x-sdca.h b/sound/soc/codecs/sn624x-sdca.h
new file mode 100644
index 000000000000..db6e699d463c
--- /dev/null
+++ b/sound/soc/codecs/sn624x-sdca.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * sn624x-sdca.h -- SN624X SDCA ALSA SoC audio driver header
+ *
+ * Copyright(c) 2025 Senary Semiconductor Corp.
+ */
+
+#ifndef __SN624X_H__
+#define __SN624X_H__
+
+#include <linux/mutex.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/workqueue.h>
+#include <sound/sdca_function.h>
+#include <sound/soc.h>
+
+struct sn624x_sdca_priv {
+	struct regmap *regmap;
+	struct snd_soc_component *component;
+	struct sdw_slave *slave;
+	/* Parsed DisCo functions (init tables / defaults from ACPI) */
+	struct sdca_function_data *jack_func;
+	struct sdca_function_data *mic_func;
+	struct sdca_function_data *amp_func;
+	bool hw_init;
+	bool first_hw_init;
+	struct snd_soc_jack *hs_jack;
+	struct delayed_work jack_detect_work;
+	struct mutex disable_irq_lock;
+	bool disable_irq;
+	int jack_type;
+	int jack_type_last;
+	unsigned int scp_sdca_stat1;
+	unsigned int scp_sdca_stat2;
+};
+
+/* SoundWire data port numbers (slave prop source/sink port masks) */
+#define SN624X_PORT_JACK_PLAYBACK		1
+#define SN624X_PORT_SPEAKER_PLAYBACK		2
+#define SN624X_PORT_JACK_CAPTURE		4
+#define SN624X_PORT_DMIC_CAPTURE		5
+
+/* Order matches sn624x_sdca_dai[] .id */
+enum sn624x_dai_id {
+	SN624X_DAI_JACK = 0,
+	SN624X_DAI_SPEAKER = 1,
+	SN624X_DAI_DMIC = 2,
+};
+
+/*
+ * SDCA Function Numbers (from platform ACPI / device topology).
+ * Address with SDW_SDCA_CTL(fun, ent, ctl, ch) from sdw_registers.h.
+ */
+#define SN624X_FUNC_NUM_JACK_CODEC		0x01
+#define SN624X_FUNC_NUM_MIC_ARRAY		0x02
+#define SN624X_FUNC_NUM_SPEAKER_AMP		0x04
+
+/* Entity instance IDs (from platform ACPI / SN624X topology) */
+#define SN624X_SDCA_ENT_ENTITY0			0x00
+#define SN624X_SDCA_ENT_CS01			0x01
+#define SN624X_SDCA_ENT_CS02			0x02
+#define SN624X_SDCA_ENT_PDE03			0x03
+#define SN624X_SDCA_ENT_PDE04			0x04
+#define SN624X_SDCA_ENT_CRU05			0x05
+#define SN624X_SDCA_ENT_USER_FU10		0x10
+#define SN624X_SDCA_ENT_USER_FU14		0x14
+#define SN624X_SDCA_ENT_USER_FU1E		0x1e
+#define SN624X_UAJ_ENT_BLOCK			0x20
+#define SN624X_SDCA_ENT_GE35			0x1F
+/* UAJ power domains from ssdt26.dsl AF01 entity list (PDE 34 / PDE 47) */
+#define SN624X_UAJ_ENT_PDE47			SN624X_SDCA_ENT_PDE03
+#define SN624X_UAJ_ENT_PDE34			SN624X_SDCA_ENT_PDE04
+
+/* Control selectors (SDCA; same values as sound/sdca_function.h) */
+/* PDE power state selectors — use standard SDCA defines from sdca_function.h */
+#define SN624X_SDCA_CTL_FU_MUTE			0x01
+#define SN624X_SDCA_CTL_FU_VOLUME		0x02
+#define SN624X_SDCA_CTL_SAMPLE_FREQ_INDEX	0x10
+#define SN624X_SDCA_CTL_CLUSTER_INDEX		0x10
+#define SN624X_SDCA_CTL_FUNCTION_STATUS		0x10	/* Entity 0 */
+#define SN624X_SDCA_CTL_SELECTED_MODE		0x01
+#define SN624X_SDCA_CTL_DETECTED_MODE		0x02
+
+/*
+ * Control Number / channel for multi-channel FU controls (mute/volume).
+ * Single-value controls (PDE power, rate, function status, …) pass 0
+ * directly to SDW_SDCA_CTL — no CH_0 alias.
+ */
+#define SN624X_SDCA_CH_L			0x01
+#define SN624X_SDCA_CH_R			0x02
+
+/* GE35 Selected_Mode / Detected_Mode (SDCA Table 153, UAJ §5.5) */
+#define SN624X_GE35_MODE_HEADPHONE		0x03
+#define SN624X_GE35_MODE_HEADSET		0x05
+
+/* Vendor UAJ SCP windows */
+#define SN624X_UAJ_CTL_INPUT_DELAY		0x30
+#define SN624X_UAJ_CTL_CHARGE_PUMP		0x31
+#define SN624X_UAJ_CTL_JACK_DETECT		0x32
+
+/*
+ * Vendor SCP addresses used only when ACPI
+ * mipi-sdca-function-initialization-table is missing (temporary fallback).
+ * Remove once platform DisCo ships a complete init table.
+ */
+#define SN624X_UAJ_CTL_IT33_MIC_BIAS		0x40400418
+#define SN624X_UAJ_CTL_IT31_MIC_BIAS		0x40400318
+#define SN624X_UAJ_CTL_FU41_CH1_MUTE		0x40400A09
+#define SN624X_UAJ_CTL_FU41_CH2_MUTE		0x40400A0A
+#define SN624X_UAJ_CTL_FU31_CH0_MUTE		0x40400C08
+#define SN624X_UAJ_CTL_FU32_CH0_MUTE		0x40400C88
+#define SN624X_UAJ_CTL_FU33_CH0_MUTE		0x40400D08
+#define SN624X_UAJ_CTL_FU36_CH1_MUTE		0x40400F09
+#define SN624X_UAJ_CTL_FU36_CH2_MUTE		0x40400F0A
+#define SN624X_UAJ_CTL_FU31_CH0_GAIN_HIGH	0x40402C58
+#define SN624X_UAJ_CTL_FU31_CH0_GAIN_LOW	0x40400C58
+#define SN624X_UAJ_CTL_FU32_CH0_GAIN_HIGH	0x40402CD8
+#define SN624X_UAJ_CTL_FU32_CH0_GAIN_LOW	0x40400CD8
+#define SN624X_UAJ_CTL_FU33_CH0_GAIN_HIGH	0x40402D58
+#define SN624X_UAJ_CTL_FU33_CH0_GAIN_LOW	0x40400D58
+#define SN624X_UAJ_CTL_INPUT_DELAY_TIME		0x00002124
+#define SN624X_UAJ_CTL_PORTA_CHARGE_PUMP	0x00002086
+#define SN624X_UAJ_DMIC_PPU11			0x40880380
+
+/* Jack poll interval (ms) */
+#define SN624X_JACK_POLL_MS			1000
+
+/* µs settle times for headphone <-> speaker route switch during active PCM */
+#define SN624X_ROUTE_AFTER_MUTE_US_MIN		5000
+#define SN624X_ROUTE_AFTER_MUTE_US_MAX		8000
+#define SN624X_ROUTE_AFTER_D3_US_MIN		10000
+#define SN624X_ROUTE_AFTER_D3_US_MAX		15000
+#define SN624X_ROUTE_BEFORE_ACTIVE_US_MIN	10000
+#define SN624X_ROUTE_BEFORE_ACTIVE_US_MAX	15000
+
+#define SN624X_STEREO_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | \
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
+#define SN624X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+int sn624x_sdca_init(struct device *dev, struct regmap *regmap,
+		      struct sdw_slave *slave);
+
+#endif /* __SN624X_H__ */
-- 
2.47.3

