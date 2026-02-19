Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966918A6A8
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771494377; cv=none; b=sBpKhfH2HvdtvewI2UH4FRmsugOFDzvLhYiXAk/ClpuQ2EAVMpfUwiZrS+unjCATLjaJxcO1EblGJUqfEzx6qDb4QgAGm+i1yj1MvQboaYn/6sHicPn3CHUtRBK1AKt6evX5gDqwcou5hW7dzp1GSpOWqJyfIZ4SuCF0sjrJ+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771494377; c=relaxed/simple;
	bh=/jN3yCmh/yHp3+A7ErPK+5BcuwyPOdsYbATk9IqgVzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ttCuxMphMjOZG54Jht3KQE5pF3HlXhI3uJqH2iF0U3O6yTGbgf8Aqqs+3aOO6qTjilAAgcR/S+/KNiKaA1SuhzZvsS+ldjqytJCeQzZq/Zk5aDzuAjUIGJgB331tAZWZ9DDoAYiEcM3avlA/HQnuswhQsNHeeEIpu481IXg6Szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieprUYNf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieprUYNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771494375; x=1803030375;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/jN3yCmh/yHp3+A7ErPK+5BcuwyPOdsYbATk9IqgVzQ=;
  b=ieprUYNfPeD+CXlFO88m80OCoqh5W/km2CMazzRaki/dRKIwXNiLggN3
   WhIC0tZuYMK/Qz0UOCo9CgjKQdWQ/dIawFiwus8yjUZ09GvcaIg91IdP5
   PNsfirF0l1lyk4Cd9fhVZtK1RnyCzI3ogjKYRfLl7/+XcSkVrqzsEY4yJ
   2X4owYHj29lKIoZxbRCMWVeRP4j1C9LgrClTm/5hmYnpddFhRhq7GYNXv
   Xopi12GSVXVqqlw7Zk639FPcLF177lR5j2nvKdkf7eE0sQGleLQgSzqUv
   O35XzZ7hp9i5YmhxcCY7UoiSc2vdnvSUd9kWfi0sQA5YTt/WMaNUKGnHY
   w==;
X-CSE-ConnectionGUID: UlFGTd87TSO2ygB6uFXYfA==
X-CSE-MsgGUID: sh6ZWBTtRPm1PcHlyxM0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82900596"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="82900596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 01:46:14 -0800
X-CSE-ConnectionGUID: +cd3/dVHTEeU4Swb0N0BzA==
X-CSE-MsgGUID: AMJDrTRQT8OJoKZPVdctiw==
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2026 01:46:12 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5] ALSA: control: Verify put() result when in debug mode
Date: Thu, 19 Feb 2026 10:46:14 +0100
Message-Id: <20260219094614.504459-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The put() operation is expected to return:
1) 0 on success if no changes were made
2) 1 on success if changes were made
3) error code otherwise

Currently 2) is usually ignored when writing control-operations. While
forcing compliance is not an option right now, make it easier for
developers to adhere to the expectations and notice problems by logging
them when CONFIG_SND_CTL_DEBUG is enabled.

Due to large size of struct snd_ctl_elem_value, 'value_buf' is provided
as a reusable buffer for kctl->put() verification. This prevents
exhausting the stack when verifying the operation.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v5:
- converged xxx_success() and xxx_fail() macros as suggested by Mark.
  The keyword "success" or "fail" is now denoted in the output of the
  trace event


Changes in v4:

- moved away from pr_xxx() in favor of trace events
- refactired the print format so that it aligns closer to 'amixer
  controls' output
- added 'value_buf' to 'struct snd_card' as suggested - to prevent stack
  overflow in snd_ctl_put_verify()


Changes in v3:

- simplified the memcmp() as suggested by Jaroslav
- added ->access verification for SKIP_CHECK and VOLATILE as suggested
  by Jaroslav and Takashi. For that very purpose I've deviced to use the
  kcontrol-volatile (vd) pointer that already part of
  snd_ctl_elem_write().

- as things are more complex now, replaced snd_ctl_put() macros with
  functions. This aligns with suggestion previously provided by Kuninori

- reordered operations within snd_ctl_put_verify() so that it's more
  intuitive to read, at least in my opinion:
  get/info/put -> info/get/put


Changes in v2:

A number of fixes as suggested by Mark and Takashi. The initial version
did not account for possibility of invalid payload sent from the userspace
and was buggy.
- enlisted ->info() operation and reused existing
  fill_remaining_elem_value() to sanitize the 'new' value provided by
  user
- fixed size provided to memcmp()
- the 'original' value is now initilized with memset()

Readability improvements suggested by Kuninori.
- added conditional #define snd_ctl_put() so that no additional
  if-statements are needed in the actual code.


 include/sound/core.h       |  3 ++
 sound/core/Makefile        |  1 +
 sound/core/control.c       | 76 +++++++++++++++++++++++++++++++++++++-
 sound/core/control_trace.h | 49 ++++++++++++++++++++++++
 sound/core/init.c          |  8 ++++
 5 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 sound/core/control_trace.h

diff --git a/include/sound/core.h b/include/sound/core.h
index 64327e971122..4093ec82a0a1 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -133,6 +133,9 @@ struct snd_card {
 #ifdef CONFIG_SND_DEBUG
 	struct dentry *debugfs_root;    /* debugfs root for card */
 #endif
+#ifdef CONFIG_SND_CTL_DEBUG
+	struct snd_ctl_elem_value *value_buf; /* buffer for kctl->put() verification */
+#endif
 
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
diff --git a/sound/core/Makefile b/sound/core/Makefile
index 31a0623cc89d..fdd3bb6e81a9 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -23,6 +23,7 @@ snd-pcm-$(CONFIG_SND_PCM_IEC958) += pcm_iec958.o
 # for trace-points
 CFLAGS_pcm_lib.o := -I$(src)
 CFLAGS_pcm_native.o := -I$(src)
+CFLAGS_control.o := -I$(src)
 
 snd-pcm-dmaengine-y := pcm_dmaengine.o
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 9c3fd5113a61..5cf6702f550d 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -19,6 +19,13 @@
 #include <sound/info.h>
 #include <sound/control.h>
 
+#ifdef CONFIG_SND_CTL_DEBUG
+#define CREATE_TRACE_POINTS
+#include "control_trace.h"
+#else
+#define trace_snd_ctl_put(card, kctl, iname, expected, actual)
+#endif
+
 // Max allocation size for user controls.
 static int max_user_ctl_alloc_size = 8 * 1024 * 1024;
 module_param_named(max_user_ctl_alloc_size, max_user_ctl_alloc_size, int, 0444);
@@ -1264,6 +1271,72 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 	return result;
 }
 
+#if IS_ENABLED(CONFIG_SND_CTL_DEBUG)
+
+static const char *const snd_ctl_elem_iface_names[] = {
+	[SNDRV_CTL_ELEM_IFACE_CARD]		= "CARD",
+	[SNDRV_CTL_ELEM_IFACE_HWDEP]		= "HWDEP",
+	[SNDRV_CTL_ELEM_IFACE_MIXER]		= "MIXER",
+	[SNDRV_CTL_ELEM_IFACE_PCM]		= "PCM",
+	[SNDRV_CTL_ELEM_IFACE_RAWMIDI]		= "RAWMIDI",
+	[SNDRV_CTL_ELEM_IFACE_TIMER]		= "TIMER",
+	[SNDRV_CTL_ELEM_IFACE_SEQUENCER]	= "SEQUENCER",
+};
+
+static int snd_ctl_put_verify(struct snd_card *card, struct snd_kcontrol *kctl,
+			      struct snd_ctl_elem_value *control)
+{
+	struct snd_ctl_elem_value *original = card->value_buf;
+	struct snd_ctl_elem_info info;
+	const char *iname;
+	int ret, retcmp;
+
+	memset(original, 0, sizeof(*original));
+	memset(&info, 0, sizeof(info));
+
+	ret = kctl->info(kctl, &info);
+	if (ret)
+		return ret;
+
+	ret = kctl->get(kctl, original);
+	if (ret)
+		return ret;
+
+	ret = kctl->put(kctl, control);
+	if (ret < 0)
+		return ret;
+
+	/* Sanitize the new value (control->value) before comparing. */
+	fill_remaining_elem_value(control, &info, 0);
+
+	/* With known state for both new and original, do the comparison. */
+	retcmp = memcmp(&original->value, &control->value, sizeof(original->value));
+	if (retcmp)
+		retcmp = 1;
+
+	iname = snd_ctl_elem_iface_names[kctl->id.iface];
+	trace_snd_ctl_put(card, kctl, iname, ret, retcmp);
+
+	return ret;
+}
+
+static int snd_ctl_put(struct snd_card *card, struct snd_kcontrol *kctl,
+		       struct snd_ctl_elem_value *control, unsigned int access)
+{
+	if ((access & SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK) ||
+	    (access & SNDRV_CTL_ELEM_ACCESS_VOLATILE))
+		return kctl->put(kctl, control);
+
+	return snd_ctl_put_verify(card, kctl, control);
+}
+#else
+static inline int snd_ctl_put(struct snd_card *card, struct snd_kcontrol *kctl,
+			      struct snd_ctl_elem_value *control, unsigned int access)
+{
+	return kctl->put(kctl, control);
+}
+#endif
+
 static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 			      struct snd_ctl_elem_value *control)
 {
@@ -1300,7 +1373,8 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 							   false);
 	}
 	if (!result)
-		result = kctl->put(kctl, control);
+		result = snd_ctl_put(card, kctl, control, vd->access);
+
 	if (result < 0) {
 		up_write(&card->controls_rwsem);
 		return result;
diff --git a/sound/core/control_trace.h b/sound/core/control_trace.h
new file mode 100644
index 000000000000..48afb56c5b71
--- /dev/null
+++ b/sound/core/control_trace.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM snd_pcm
+
+#if !defined(_TRACE_SND_CTL_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_SND_CTL_H
+
+#include <linux/tracepoint.h>
+#include <sound/control.h>
+#include <sound/core.h>
+
+TRACE_EVENT(snd_ctl_put,
+
+	TP_PROTO(struct snd_card *card, struct snd_kcontrol *kctl, const char *iname,
+		 int expected, int actual),
+
+	TP_ARGS(card, kctl, iname, expected, actual),
+
+	TP_STRUCT__entry(
+		__field(unsigned int,	card_id)
+		__field(unsigned int,	numid)
+		__string(kname,		kctl->id.name)
+		__string(iname,		iname)
+		__field(int,		expected)
+		__field(int,		actual)
+	),
+
+	TP_fast_assign(
+		__entry->card_id = card->number;
+		__entry->numid = kctl->id.numid;
+		__assign_str(kname);
+		__assign_str(iname);
+		__entry->expected = expected;
+		__entry->actual = actual;
+	),
+
+	TP_printk("%s: expected=%d, actual=%d for ctl numid=%d, iface=%s, name='%s', card id=%d\n",
+		  __entry->expected == __entry->actual ? "success" : "fail",
+		  __entry->expected, __entry->actual, __entry->numid,
+		  __get_str(iname), __get_str(kname), __entry->card_id)
+);
+
+#endif /* _TRACE_SND_CTL_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE control_trace
+#include <trace/define_trace.h>
diff --git a/sound/core/init.c b/sound/core/init.c
index c372b3228785..15868dd50f6a 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -362,6 +362,11 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 #ifdef CONFIG_SND_DEBUG
 	card->debugfs_root = debugfs_create_dir(dev_name(&card->card_dev),
 						sound_debugfs_root);
+#endif
+#ifdef CONFIG_SND_CTL_DEBUG
+	card->value_buf = kmalloc(sizeof(*card->value_buf), GFP_KERNEL);
+	if (!card->value_buf)
+		return -ENOMEM;
 #endif
 	return 0;
 
@@ -537,6 +542,9 @@ void snd_card_disconnect(struct snd_card *card)
 		synchronize_irq(card->sync_irq);
 
 	snd_info_card_disconnect(card);
+#ifdef CONFIG_SND_CTL_DEBUG
+	kfree(card->value_buf);
+#endif
 #ifdef CONFIG_SND_DEBUG
 	debugfs_remove(card->debugfs_root);
 	card->debugfs_root = NULL;
-- 
2.34.1

