Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B8147C79
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070757; cv=none; b=L43fn55QBcPn0JdAjHUwDnyTAcIrkPFkOoBBbr/KcR6CxbDXPf3lEnBY1nH9Sa7Nln/RoevwGH9h+ikmsTEONp0JQ4UPp0gam2RuDkNVDuet9vc2JQ5nc5xof0HvxxBHArseADdUsnVsHFrBQHai2vg/OpbNgr0HzVCO3Jw32yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070757; c=relaxed/simple;
	bh=FrOkhm6WOZqO8S7HrTEyQlMiQ+AW7BCmMbj2JjSrmmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czYt3v2PTE/1QlyR6vErM4+2+e8VXFpehQXvNXb7xRSrp3uR7m6ofwP2TAUcJEDbP5cUgdE3frXYm6XhNLYTTcWJI4WX5X2UqeoYIt631cUw4qKYgiUwNKmB3SygbrAtMaPm2Ei5rMa6Bt/ThjJ6iKhV9dlgVTg3osJrhKD5ZJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=J/egkvr6; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="J/egkvr6"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3A53E1DBC;
	Tue,  7 May 2024 10:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3A53E1DBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715070746; bh=tzRopllnBmogiB79Vtxj/dpAcDjAJBKMGtnsRc4ezqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/egkvr6Q0JI7dMSnAerKvXOCofx4ksjcuSwPkjWUPj28hfQ/kMy2IwD8i195RgAa
	 OmT8hrN/JSpe4/oMtVPjtPL8hyusn1dkVszrzpicPsnmZxar6XoF+v99jFxBj5Li8X
	 Jx1L03O0rfP+fIFRbieVs1NKLU5gl37XnESkwwME=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  7 May 2024 10:32:22 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: [PATCH v3 1/2] ALSA: pcm: reinvent the stream synchronization ID API
Date: Tue,  7 May 2024 10:26:18 +0200
Message-ID: <20240507083142.557299-2-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507083142.557299-1-perex@perex.cz>
References: <20240507083142.557299-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
internal command"), there was a possibility to pass information
about the synchronized streams to the user space. The mentioned
commit removed blindly the appropriate code with an irrelevant comment.

The revert may be appropriate, but since this API was lost for several
years without any complains, it's time to improve it. The hardware
parameters may change the used stream clock source (e.g. USB hardware)
so move this synchronization ID to hw_params as read-only field.

It seems that pipewire can benefit from this API (disable adaptive
resampling for perfectly synchronized PCM streams) now.

Cc: Takashi Sakamoto <takaswie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/pcm.h         | 12 +++++++++++-
 include/uapi/sound/asound.h | 13 ++++---------
 sound/core/pcm_lib.c        | 18 ++++++++++++++----
 sound/core/pcm_native.c     |  6 ++++++
 sound/pci/emu10k1/p16v.c    |  7 +++----
 5 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 210096f124ee..06600f3886d3 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -11,6 +11,7 @@
 #include <sound/asound.h>
 #include <sound/memalloc.h>
 #include <sound/minors.h>
+#include <asm/unaligned.h>
 #include <linux/poll.h>
 #include <linux/mm.h>
 #include <linux/bitops.h>
@@ -93,6 +94,7 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_IOCTL1_CHANNEL_INFO	2
 /* 3 is absent slot. */
 #define SNDRV_PCM_IOCTL1_FIFO_SIZE	4
+#define SNDRV_PCM_IOCTL1_SYNC_ID	5
 
 #define SNDRV_PCM_TRIGGER_STOP		0
 #define SNDRV_PCM_TRIGGER_START		1
@@ -396,7 +398,7 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
 	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
 
-	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
+	unsigned char sync[16];		/* hardware synchronization ID */
 
 	/* -- mmap -- */
 	struct snd_pcm_mmap_status *status;
@@ -1565,6 +1567,14 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
 	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
 
+/**
+ * is sync id (clock id) empty?
+ */
+static inline bool pcm_sync_empty(const unsigned char *sync)
+{
+	return get_unaligned((__u64 *)(sync + 0)) == 0 && get_unaligned((__u64 *)(sync + 8)) == 0;
+}
+
 /* printk helpers */
 #define pcm_err(pcm, fmt, args...) \
 	dev_err((pcm)->card->dev, fmt, ##args)
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 628d46a0da92..c458172b32d5 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 18)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -330,12 +330,6 @@ enum {
 #endif
 };
 
-union snd_pcm_sync_id {
-	unsigned char id[16];
-	unsigned short id16[8];
-	unsigned int id32[4];
-};
-
 struct snd_pcm_info {
 	unsigned int device;		/* RO/WR (control): device number */
 	unsigned int subdevice;		/* RO/WR (control): subdevice number */
@@ -348,7 +342,7 @@ struct snd_pcm_info {
 	int dev_subclass;		/* SNDRV_PCM_SUBCLASS_* */
 	unsigned int subdevices_count;
 	unsigned int subdevices_avail;
-	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
+	unsigned char pad1[16];		/* was: hardware synchronization ID */
 	unsigned char reserved[64];	/* reserved for future... */
 };
 
@@ -420,7 +414,8 @@ struct snd_pcm_hw_params {
 	unsigned int rate_num;		/* R: rate numerator */
 	unsigned int rate_den;		/* R: rate denominator */
 	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
-	unsigned char reserved[64];	/* reserved for future */
+	unsigned char sync[16];		/* R: synchronization ID (perfect sync - one clock source) */
+	unsigned char reserved[48];	/* reserved for future */
 };
 
 enum {
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6f73b3c2c205..84b948db3393 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -525,10 +525,8 @@ void snd_pcm_set_sync(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	
-	runtime->sync.id32[0] = substream->pcm->card->number;
-	runtime->sync.id32[1] = -1;
-	runtime->sync.id32[2] = -1;
-	runtime->sync.id32[3] = -1;
+	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
+	memset(runtime->sync + 4, 0xff, sizeof(runtime->sync) - 4);
 }
 EXPORT_SYMBOL(snd_pcm_set_sync);
 
@@ -1810,6 +1808,16 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
+				     void *arg)
+{
+	struct snd_pcm_hw_params *params = arg;
+
+	if (pcm_sync_empty(params->sync))
+		memcpy(params->sync, &substream->runtime->sync, sizeof(params->sync));
+	return 0;
+}
+
 /**
  * snd_pcm_lib_ioctl - a generic PCM ioctl callback
  * @substream: the pcm substream instance
@@ -1831,6 +1839,8 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		return snd_pcm_lib_ioctl_channel_info(substream, arg);
 	case SNDRV_PCM_IOCTL1_FIFO_SIZE:
 		return snd_pcm_lib_ioctl_fifo_size(substream, arg);
+	case SNDRV_PCM_IOCTL1_SYNC_ID:
+		return snd_pcm_lib_ioctl_sync_id(substream, arg);
 	}
 	return -ENXIO;
 }
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0b76e76823d2..63fcb08ee93d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -533,6 +533,12 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 					  SNDRV_PCM_INFO_MMAP_VALID);
 	}
 
+	err = snd_pcm_ops_ioctl(substream,
+				SNDRV_PCM_IOCTL1_SYNC_ID,
+				params);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index e7f097cae574..773725dbdfbd 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -174,10 +174,9 @@ static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substrea
 	if (err < 0)
                 return err;
 
-	runtime->sync.id32[0] = substream->pcm->card->number;
-	runtime->sync.id32[1] = 'P';
-	runtime->sync.id32[2] = 16;
-	runtime->sync.id32[3] = 'V';
+	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
+	memset(runtime->sync + 4, 0, sizeof(runtime->sync) - 4);
+	strncpy(runtime->sync + 4, "P16V", 4);
 
 	return 0;
 }
-- 
2.43.0

