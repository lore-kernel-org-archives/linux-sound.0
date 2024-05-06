Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7A156665
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008360; cv=none; b=nsaj9cOWKoiVu2tqqU9Rvg32gFdH+lbehHqYCqIXG+R6FO1wxsJwc0D21kpvHmxJP+VUjDn0AN2Zkbm6/yNfX9wtgUpxoO90Qf9klJvP2AarEA7r09GHRi//XiB9Y5Eyla+m08qHCEZACpaNGZXIbSjzXIMAScY/UVzBsv8W9Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008360; c=relaxed/simple;
	bh=cjHwMdguGOqRlkUMbSksJIT+WxF8ivtKIfHK3KP4TSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4DKwlg0jBRrSm1GkyEOyNczK42284zrimS3zCyikjo4xxdID+O1OLvm0XR3ZWxKwfiZTzjLNWODW5e21I6uUVHXAy0Q8K0KbpsuyKdRcxl1yHVHxk2l/1PdKtnbMC3NSDEvBitOfAYUJT++eZN5kuGP2Mq+dvz0wVMTt6FdnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=SkIQbYdE; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="SkIQbYdE"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8564F43FE;
	Mon,  6 May 2024 17:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8564F43FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715008354; bh=uA37/fqd8PjnlbjCycOjZFYsXRUCx2cMYo65YAoRRwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkIQbYdEEidSjQxYDpdCRv1ajQooYb0MQCK2h7p6HEBqeJK0UWkRJ09fy1mScmjPF
	 zNq0pYapCTO2vJ0po+Q8LPhowNou2qyhOrRndFgNUF4U7quMYhdchL3LZgXIzM7cgI
	 JCYALl36WLtd5p8YjVWX/Z+2AjROnZx5fn8fdzNQ=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon,  6 May 2024 17:12:31 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: pcm: optimize and clarify stream sychronization ID API
Date: Mon,  6 May 2024 17:11:50 +0200
Message-ID: <20240506151218.377580-3-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506151218.377580-1-perex@perex.cz>
References: <20240506151218.377580-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Optimize the memory usage in struct snd_pcm_runtime - use boolean
value for the standard sync ID scheme.

Introduce snd_pcm_set_sync_per_card function to build synchronization
IDs.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/pcm.h      |  9 +++++++--
 sound/core/pcm_lib.c     | 28 +++++++++++++++++-----------
 sound/pci/emu10k1/p16v.c | 16 ++++++++++++----
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index dae41b100517..71c80ad8d4d3 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -397,7 +397,7 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
 	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
 
-	unsigned char sync[16];		/* hardware synchronization ID */
+	bool sync_flag;			/* hardware synchronization - standard per card ID */
 
 	/* -- mmap -- */
 	struct snd_pcm_mmap_status *status;
@@ -1151,7 +1151,12 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int
 
 void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 		     const struct snd_pcm_ops *ops);
-void snd_pcm_set_sync(struct snd_pcm_substream *substream);
+void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params,
+			       const unsigned char *id, unsigned int len);
+static inline void snd_pcm_set_sync(struct snd_pcm_substream *substream)
+{
+	substream->runtime->sync_flag = true;
+}
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 84b948db3393..82452c2e4887 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -516,19 +516,23 @@ void snd_pcm_set_ops(struct snd_pcm *pcm, int direction,
 EXPORT_SYMBOL(snd_pcm_set_ops);
 
 /**
- * snd_pcm_set_sync - set the PCM sync id
+ * snd_pcm_set_sync_per_card - set the PCM sync id with card number
  * @substream: the pcm substream
+ * @params: modified hardware parameters
+ * @id: identifier (max 12 bytes)
+ * @len: identifier length (max 12 bytes)
  *
- * Sets the PCM sync identifier for the card.
+ * Sets the PCM sync identifier for the card with zero padding.
  */
-void snd_pcm_set_sync(struct snd_pcm_substream *substream)
+void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       const unsigned char *id, unsigned int len)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	
-	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
-	memset(runtime->sync + 4, 0xff, sizeof(runtime->sync) - 4);
+	*(__u32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
+	len = max(12, len);
+	strncpy(params->sync + 4, id, len);
+	memset(params->sync + 4 + len, 0, 12 - len);
 }
-EXPORT_SYMBOL(snd_pcm_set_sync);
 
 /*
  *  Standard ioctl routine
@@ -1811,10 +1815,12 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
 static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
 				     void *arg)
 {
-	struct snd_pcm_hw_params *params = arg;
+	static unsigned char id[12] = { 0xff, 0xff, 0xff, 0xff,
+					0xff, 0xff, 0xff, 0xff,
+					0xff, 0xff, 0xff, 0xff };
 
-	if (pcm_sync_empty(params->sync))
-		memcpy(params->sync, &substream->runtime->sync, sizeof(params->sync));
+	if (substream->runtime->sync_flag)
+		snd_pcm_set_sync_per_card(substream, arg, id, sizeof(id));
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index 773725dbdfbd..36b8a4ce2081 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -174,10 +174,6 @@ static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substrea
 	if (err < 0)
                 return err;
 
-	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
-	memset(runtime->sync + 4, 0, sizeof(runtime->sync) - 4);
-	strncpy(runtime->sync + 4, "P16V", 4);
-
 	return 0;
 }
 
@@ -225,6 +221,17 @@ static int snd_p16v_pcm_open_capture(struct snd_pcm_substream *substream)
 	return snd_p16v_pcm_open_capture_channel(substream, 0);
 }
 
+static int snd_p16v_pcm_ioctl_playback(struct snd_pcm_substream *substream,
+				       unsigned int cmd, void *arg)
+{
+	if (cmd == SNDRV_PCM_IOCTL1_SYNC_ID) {
+		static unsigned char id[4] = { 'P', '1', '6', 'V' };
+		snd_pcm_set_sync_per_card(substream, arg, id, 4);
+		return 0;
+	}
+	return snd_pcm_lib_ioctl(substream, cmd, arg);
+}
+
 /* prepare playback callback */
 static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 {
@@ -530,6 +537,7 @@ snd_p16v_pcm_pointer_capture(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_p16v_playback_front_ops = {
 	.open =        snd_p16v_pcm_open_playback_front,
 	.close =       snd_p16v_pcm_close_playback,
+	.ioctl =       snd_p16v_pcm_ioctl_playback,
 	.prepare =     snd_p16v_pcm_prepare_playback,
 	.trigger =     snd_p16v_pcm_trigger_playback,
 	.pointer =     snd_p16v_pcm_pointer_playback,
-- 
2.43.0

