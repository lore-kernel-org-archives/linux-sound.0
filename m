Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9F14C59C
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336547; cv=none; b=Aj9HTE+dXUujptwew8GeR1Urc/TbqHeiCl7BHC6dnRfjue02vHJncTlI3gU6/U7hi+7PWFZBvzgK89rq0ZW6+8lvd1j64cic7rUeB+QERnSYhuLhoAE21cMzY++Y9wy1ylnvqeMnxbdHsnzI3Cq88CO8uRLlEPKUEP25lEay5+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336547; c=relaxed/simple;
	bh=LXM2Is4Sgmq0cmlpGjN3C2Qs3mAcVG957t4orHwFCls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEcI/CZ8JEVzz7pAwPFyvARVvRXL2eXoVlh2zhowKqyV3lmYWExZOndtw/uEP2XKmolBSp4HIu6Tjvnc9ZITwP4L9GAE0ZPuX5uCFgJOZ6nVs+5yNbwjtBRYfinCWoW9MxiZN5je5+Zvz1omC8iXhJRiuZI3TvxVWhsti7dBYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=5DK/L0JP; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="5DK/L0JP"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 35C0B6831;
	Tue, 25 Jun 2024 19:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 35C0B6831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1719336543; bh=Wn0mGsVvgpSrZ0K1l+9Wy3mldGsxcyGyA7d1kipl/2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=5DK/L0JP0fuycCwAaScAw9/USuM5anqxYOLzHcafPIBxwVe7pzEfhw0t52Brl8vWO
	 7zfbcTqWflTI+p1zA0D+8NeBfvHrrMlJIMswxdOFGfaHI8jG1WccPaBs0zGI0PAYyQ
	 aqbw9TmNGqBmRKX3HPgVVzVdfl30K/hayj9qDrFA=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 25 Jun 2024 19:28:59 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: [PATCH v7 2/2] ALSA: pcm: optimize and clarify stream synchronization ID API
Date: Tue, 25 Jun 2024 19:25:47 +0200
Message-ID: <20240625172836.589380-3-perex@perex.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625172836.589380-1-perex@perex.cz>
References: <20240625172836.589380-1-perex@perex.cz>
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
 include/sound/pcm.h      | 15 ++++++++++--
 sound/core/pcm_lib.c     | 51 ++++++++++++++++++++++++----------------
 sound/pci/emu10k1/p16v.c | 16 +++++++++----
 3 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index dbce137d8806..ac8f3aef9205 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -402,7 +402,7 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
 	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
 
-	unsigned char sync[16];		/* hardware synchronization ID */
+	bool std_sync_id;		/* hardware synchronization - standard per card ID */
 
 	/* -- mmap -- */
 	struct snd_pcm_mmap_status *status;
@@ -1156,7 +1156,18 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int
 
 void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 		     const struct snd_pcm_ops *ops);
-void snd_pcm_set_sync(struct snd_pcm_substream *substream);
+void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params,
+			       const unsigned char *id, unsigned int len);
+/**
+ * snd_pcm_set_sync - set the PCM sync id
+ * @substream: the pcm substream
+ *
+ * Use the default PCM sync identifier for the specific card.
+ */
+static inline void snd_pcm_set_sync(struct snd_pcm_substream *substream)
+{
+	substream->runtime->std_sync_id = true;
+}
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a6d59ee9eb52..dccdf60ca4cf 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -516,19 +516,37 @@ void snd_pcm_set_ops(struct snd_pcm *pcm, int direction,
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
+ *
+ * User space or any user should use this 16-byte identifier for a comparison only
+ * to check if two IDs are similar or different. Special case is the identifier
+ * containing only zeros. Interpretation for this combination is - empty (not set).
+ * The contents of the identifier should not be interpreted in any other way.
+ *
+ * The synchronization ID must be unique per clock source (usually one sound card,
+ * but multiple soundcard may use one PCM word clock source which means that they
+ * are fully synchronized).
+ *
+ * This routine composes this ID using card number in first four bytes and
+ * 12-byte additional ID. When other ID composition is used (e.g. for multiple
+ * sound cards), make sure that the composition does not clash with this
+ * composition scheme.
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
@@ -1808,22 +1826,15 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/**
- * is sync id (clock id) empty?
- */
-static inline bool pcm_sync_empty(const unsigned char *sync)
-{
-	return sync[0] == 0 && sync[1] == 0 && sync[2] == 0 && sync[3] == 0 &&
-	       sync[4] == 0 && sync[5] == 0 && sync[6] == 0 && sync[7] == 0;
-}
-
 static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
 				     void *arg)
 {
-	struct snd_pcm_hw_params *params = arg;
+	static const unsigned char id[12] = { 0xff, 0xff, 0xff, 0xff,
+					      0xff, 0xff, 0xff, 0xff,
+					      0xff, 0xff, 0xff, 0xff };
 
-	if (pcm_sync_empty(params->sync))
-		memcpy(params->sync, substream->runtime->sync, sizeof(params->sync));
+	if (substream->runtime->std_sync_id)
+		snd_pcm_set_sync_per_card(substream, arg, id, sizeof(id));
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index 773725dbdfbd..a9a75891f1da 100644
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
+		static const unsigned char id[4] = { 'P', '1', '6', 'V' };
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
2.45.2

