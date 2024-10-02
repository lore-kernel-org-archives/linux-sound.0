Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB76194A52
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856809; cv=none; b=bUsDrd3DZl7XcVmVQThtFrrkI/eunZOqTaA/8rZ1d2sqwWqdkbW18/2QX0UJg7PCJzsJSWABakqcIPz3BQ28TJfqwuEcTosCTfnqiGTEyWYCFBhGODhz+ORJsill4KHXz3lr3O5sZaMV6bUg+7WRx3CygosOyhqjPo1rZkWLxFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856809; c=relaxed/simple;
	bh=4TjUPBTfOs5z/58zWYCcyfQxp8zvExoYagrh3ZKwzgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dohcuZKXafm39UFkUkgG6SPhP+rN6lrMMDHXc4xGbJ5nuenwtx/3eDdGFXZ6rIvYPpqKutneXCK2gaXlvg3wH6l2XzNQSj2Q9br4SMQIfTXSn0xZjHr5qtSztKRKXBIL+m+GPicIJQe5UDgujDKnbw2niBxqg8sSLhulIJ0kEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=MYl5xvXf; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="MYl5xvXf"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AC47C412F;
	Wed,  2 Oct 2024 10:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AC47C412F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1727856795; bh=DYIjgNJ5Fpf0tnsbB7en5HTS1RtxQLWpGASGuNj7e/M=;
	h=From:To:Cc:Subject:Date:From;
	b=MYl5xvXf54Pg/TsmMQNO9+9ohw/xbY0U3Jvq8KaEh0ZTHA5Uwb8zLrDoUgBwfl6fO
	 82eM4k20Q1r/fsWUNUFaPA/vUuEQEk4WhN/y/Cj7yaOTS2Y2IVXBiPs4wMQtl/V5K7
	 9bnpTW+s+ZEw0IYyZP+erqjMqOKCaMlGozKBMlkE=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  2 Oct 2024 10:13:11 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Zeno Endemann <zeno.endemann@mailbox.org>
Subject: [PATCH] ALSA: hda: fix trigger_tstamp_latched
Date: Wed,  2 Oct 2024 10:13:06 +0200
Message-ID: <20241002081306.1788405-1-perex@perex.cz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the trigger_tstamp_latched flag is set, the PCM core code assumes that
the low-level driver handles the trigger timestamping itself. Ensure that
runtime->trigger_tstamp is always updated.

Buglink: https://github.com/alsa-project/alsa-lib/issues/387
Reported-by: Zeno Endemann <zeno.endemann@mailbox.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/hdaudio.h        | 2 +-
 sound/hda/hdac_stream.c        | 6 +++++-
 sound/pci/hda/hda_controller.c | 3 +--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 7e39d486374a..b098ceadbe74 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -590,7 +590,7 @@ void snd_hdac_stream_sync_trigger(struct hdac_stream *azx_dev, bool set,
 void snd_hdac_stream_sync(struct hdac_stream *azx_dev, bool start,
 			  unsigned int streams);
 void snd_hdac_stream_timecounter_init(struct hdac_stream *azx_dev,
-				      unsigned int streams);
+				      unsigned int streams, bool start);
 int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
 				struct snd_pcm_substream *substream);
 
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index b53de020309f..0411a8fe9d6f 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -664,7 +664,7 @@ static void azx_timecounter_init(struct hdac_stream *azx_dev,
  * updated accordingly, too.
  */
 void snd_hdac_stream_timecounter_init(struct hdac_stream *azx_dev,
-				      unsigned int streams)
+				      unsigned int streams, bool start)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_runtime *runtime = azx_dev->substream->runtime;
@@ -672,6 +672,9 @@ void snd_hdac_stream_timecounter_init(struct hdac_stream *azx_dev,
 	bool inited = false;
 	u64 cycle_last = 0;
 
+	if (!start)
+		goto skip;
+
 	list_for_each_entry(s, &bus->stream_list, list) {
 		if ((streams & (1 << s->index))) {
 			azx_timecounter_init(s, inited, cycle_last);
@@ -682,6 +685,7 @@ void snd_hdac_stream_timecounter_init(struct hdac_stream *azx_dev,
 		}
 	}
 
+skip:
 	snd_pcm_gettime(runtime, &runtime->trigger_tstamp);
 	runtime->trigger_tstamp_latched = true;
 }
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 5d86e5a9c814..f3330b7e0fcf 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -275,8 +275,7 @@ static int azx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	spin_lock(&bus->reg_lock);
 	/* reset SYNC bits */
 	snd_hdac_stream_sync_trigger(hstr, false, sbits, sync_reg);
-	if (start)
-		snd_hdac_stream_timecounter_init(hstr, sbits);
+	snd_hdac_stream_timecounter_init(hstr, sbits, start);
 	spin_unlock(&bus->reg_lock);
 	return 0;
 }
-- 
2.46.0

