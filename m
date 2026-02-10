Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B4D36CDF1
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737258; cv=none; b=rwJIMFbuUuPBTyes9se7tD/HGvSofYnjKRbk+ZR5uCKvJD9eqdFMUfyK1oSAIAlpDAnVTaupApxEDiaIGBdxYe0YTdcS29KcTd2L1jZ5hTJFZDBq9OCfw63j9FVn7/B+Xh/asPVh+2Rkk5wan2o8HJBPp9a+D/UDcLQDQu5+oa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737258; c=relaxed/simple;
	bh=9K7+trPIkTbCwOCnjhjgWOTRU8cIP9xTpJ7ckWIC25g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mNupTaebdnkfc6FJrLLECtP/W8f0S6kgv1r2sSD7NB/vjWRSH4y0bFzsFBTuRnV1gnGdAX0EmzQuaC7LoQw2z9DL1TLTdJSG8atZSFb0Cvx/R1Qh9XChBcS1OaXBxH/+Sq4I7N0/biZFIPWWO19D3Rd+dUCUAL7doNHHEI6taPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKXuptgR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKXuptgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770737256; x=1802273256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9K7+trPIkTbCwOCnjhjgWOTRU8cIP9xTpJ7ckWIC25g=;
  b=RKXuptgRTV9xzzu3WBB8xX7nBu54OXiYzK4C4PT7sT1vCACFgbIdfCQT
   7OmvL/PEAxFOg+ZzXM85zfEUSrG3Yys/MSqYRYtDyMjxY/8OgDVO1VKlg
   CsH/F6u8nUzxSFTetYHd1fkRzFm/oheEQX2CO46b63j4RpSQT06O1lzEb
   GN0wlMpFKMVSBTXBdx0oXM/aTIumFjIw65oheZX+WwcaujIRvoJVokydu
   GWEhWGSIvy+DKUjMwcOL8DigihwOPZSJKhG/AHJouhwHMmw/y99IcdsZ7
   gB0RA/pYy8EO9Rn6FzUkLGViUikOAzRW30SfipfSkxpUCyu+MogpZ5vK9
   A==;
X-CSE-ConnectionGUID: FAwE+vF4TwGm6sgwO6teag==
X-CSE-MsgGUID: FOXap1zITlKO5LVrsdrRHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71940866"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71940866"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:27:36 -0800
X-CSE-ConnectionGUID: BgRYFhjdQoyxaJWwyuo7sg==
X-CSE-MsgGUID: VM5z5fQqQRSuglpkyJBzUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210996513"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 07:27:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
Date: Tue, 10 Feb 2026 16:27:37 +0100
Message-Id: <20260210152737.347279-1-cezary.rojewski@intel.com>
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
 sound/core/control.c       | 78 +++++++++++++++++++++++++++++++++++++-
 sound/core/control_trace.h | 60 +++++++++++++++++++++++++++++
 sound/core/init.c          |  8 ++++
 5 files changed, 149 insertions(+), 1 deletion(-)
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
index 9c3fd5113a61..b245b5178d11 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -19,6 +19,14 @@
 #include <sound/info.h>
 #include <sound/control.h>
 
+#ifdef CONFIG_SND_CTL_DEBUG
+#define CREATE_TRACE_POINTS
+#include "control_trace.h"
+#else
+#define trace_snd_ctl_put_success(card, kctl, iname, expected, actual)
+#define trace_snd_ctl_put_fail(card, kctl, iname, expected, actual)
+#endif
+
 // Max allocation size for user controls.
 static int max_user_ctl_alloc_size = 8 * 1024 * 1024;
 module_param_named(max_user_ctl_alloc_size, max_user_ctl_alloc_size, int, 0444);
@@ -1264,6 +1272,73 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
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
+	trace_snd_ctl_put_success(card, kctl, iname, ret, retcmp);
+	trace_snd_ctl_put_fail(card, kctl, iname, ret, retcmp);
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
@@ -1300,7 +1375,8 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
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
index 000000000000..c2e97f969140
--- /dev/null
+++ b/sound/core/control_trace.h
@@ -0,0 +1,60 @@
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
+DECLARE_EVENT_CLASS(snd_ctl_put,
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
+	TP_printk("expected=%d, actual=%d for ctl numid=%d, iface=%s, name='%s', card id=%d\n",
+		  __entry->expected, __entry->actual, __entry->numid,
+		  __get_str(iname), __get_str(kname), __entry->card_id)
+);
+
+DEFINE_EVENT_CONDITION(snd_ctl_put, snd_ctl_put_success,
+	TP_PROTO(struct snd_card *card, struct snd_kcontrol *kctl, const char *iname,
+		 int expected, int actual),
+	TP_ARGS(card, kctl, iname, expected, actual),
+	TP_CONDITION(expected == actual));
+
+DEFINE_EVENT_CONDITION(snd_ctl_put, snd_ctl_put_fail,
+	TP_PROTO(struct snd_card *card, struct snd_kcontrol *kctl, const char *iname,
+		 int expected, int actual),
+	TP_ARGS(card, kctl, iname, expected, actual),
+	TP_CONDITION(expected != actual));
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

