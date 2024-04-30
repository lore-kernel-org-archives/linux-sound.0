Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4DD171E67
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714493435; cv=none; b=UjlIH3GJ91CmyaVpxRk/nhx1Sb7G6YORoMeSOBIOgmeP5n0nj344vGvz8SzsuOkFE1tjZ4+ORcaZaYSUeWxpT27c9XBbD8DVFAcfQAalyTevjyG0AtwPrJZ3FGoZiE+2UjLGMBB6uMioAFs/CS/8jeOrctsqsUeZV19vXrW8I3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714493435; c=relaxed/simple;
	bh=5YrcsA9BSVaMcEtecwvuipTc+x5BO5KTBuSw3kYvP5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/EAoRz6UwNBGLJCTanDIURagTwCqJ6yjA8NRex1q2e6gm4Q9MYAtHU6QMiluWph++dlGi9K1/9KA4D3GHp1eBXYESBex941Xn2GY4i2CZTAYuRi57G/B72GpVf0LGQGsGB8z2DGLiaf6ewUBSMTM6EveatAvMN5dNwXKK84eOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=1ctABKIw; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="1ctABKIw"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4B64711FD;
	Tue, 30 Apr 2024 18:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4B64711FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1714493427; bh=OPZlDan8rnZIWcXcMDyEuVfAUg8r4KZEGniIm236+LY=;
	h=From:To:Cc:Subject:Date:From;
	b=1ctABKIwEuOXbe+vbOHxgKHLuZMm/CYaxoxSpqddfQ3lJ4JgE3giTb7fkfxdXPEBT
	 YH7z4pI2C1yTM3uGXpAEjUFGSVmNfbNQ6roTMEjhF6TVKtla23/RXEz7l966CDek23
	 LcLusiPJOJl7Sglqa1RCci0XqlDFJyeZEYmUYEeM=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 30 Apr 2024 18:10:23 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: [PATCH] ALSA: pcm: reinvent the stream synchronization ID API
Date: Tue, 30 Apr 2024 18:10:12 +0200
Message-ID: <20240430161012.4011064-1-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
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
 include/sound/pcm.h         |  9 +++++++++
 include/uapi/sound/asound.h |  8 +++++---
 sound/core/pcm_lib.c        | 13 +++++++++++++
 sound/core/pcm_native.c     |  6 ++++++
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 210096f124ee..f716e0d0d174 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -93,6 +93,7 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_IOCTL1_CHANNEL_INFO	2
 /* 3 is absent slot. */
 #define SNDRV_PCM_IOCTL1_FIFO_SIZE	4
+#define SNDRV_PCM_IOCTL1_SYNC_ID	5
 
 #define SNDRV_PCM_TRIGGER_STOP		0
 #define SNDRV_PCM_TRIGGER_START		1
@@ -1565,6 +1566,14 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
 	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
 
+/**
+ * is sync id (clock id) empty?
+ */
+static inline bool pcm_sync_empty(union snd_pcm_sync_id *sync)
+{
+	return sync->id64[0] == 0 && sync->id64[1] == 0;
+}
+
 /* printk helpers */
 #define pcm_err(pcm, fmt, args...) \
 	dev_err((pcm)->card->dev, fmt, ##args)
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 628d46a0da92..13f8a08f3f33 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 18)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -334,6 +334,7 @@ union snd_pcm_sync_id {
 	unsigned char id[16];
 	unsigned short id16[8];
 	unsigned int id32[4];
+	__u64 id64[2];
 };
 
 struct snd_pcm_info {
@@ -348,7 +349,7 @@ struct snd_pcm_info {
 	int dev_subclass;		/* SNDRV_PCM_SUBCLASS_* */
 	unsigned int subdevices_count;
 	unsigned int subdevices_avail;
-	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
+	unsigned char pad1[16];		/* was: hardware synchronization ID */
 	unsigned char reserved[64];	/* reserved for future... */
 };
 
@@ -420,7 +421,8 @@ struct snd_pcm_hw_params {
 	unsigned int rate_num;		/* R: rate numerator */
 	unsigned int rate_den;		/* R: rate denominator */
 	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
-	unsigned char reserved[64];	/* reserved for future */
+	union snd_pcm_sync_id sync;	/* R: synchronization ID (perfect sync - one clock source) */
+	unsigned char reserved[48];	/* reserved for future */
 };
 
 enum {
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6f73b3c2c205..8ae63e4cc5a5 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1810,6 +1810,17 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
+				     void *arg)
+{
+	struct snd_pcm_hw_params *params = arg;
+	union snd_pcm_sync_id *sync = &params->sync;
+
+	if (pcm_sync_empty(sync))
+		memcpy(sync, &substream->runtime->sync, sizeof(*sync));
+	return 0;
+}
+
 /**
  * snd_pcm_lib_ioctl - a generic PCM ioctl callback
  * @substream: the pcm substream instance
@@ -1831,6 +1842,8 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
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
 
-- 
2.43.0

