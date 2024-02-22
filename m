Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA2405E6
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600522; cv=none; b=RhR3/QqAX3Oj4EgDbhqZ6a8jYfdUMLWnOMIwpaoERgnPPaRZu9NO/xSdjQlqoHhxQP691o9rci4Nt3Zi41J86Bb0R9o6R5Gyz6w8QBOfMD7Ooyc779b5lwdRybWA8N0s3uHsVFGhcy4QGL/P48pz2Z+fbcqMY8s99ozgW4qZvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600522; c=relaxed/simple;
	bh=8aFst2PolOUZ13adETtzgmaY3MeGzce43AEI8EDbuGw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JbWADo6Iyi1xYrzh9owgJ3XquIdVunQYl5nsiukYjVow/wEneZ1M2Uc4lR2Bp9gqv6fHspLXrlfyqfey8YWGh65GvrD7M4OGTg1FggJ9GGgEW3f1M9gGUzHI/Y37Tc1HgdkL4YjkmpxR962dEsrt+rn5SxbDeVpyIZj6/SgZ514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ijUj5QfQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dHmOFVeZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ijUj5QfQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dHmOFVeZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ijUj5QfQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dHmOFVeZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ijUj5QfQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dHmOFVeZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E0181FB9F;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43r/01p5NVQu3VSIcfcbSvIdQF8sVdbRchGVlnsrbhg=;
	b=ijUj5QfQ9sz2HQZYI/o8vF33iiWA74P5HJoz+Ak2kma1dwevSA1u1rJB8YW9vWaAShddtb
	e8mbhvp2iixXdAmXTMzNKt6o/IOe4A/EvbfHDpZKA6zveWVe0nh7A9ARBIkH3VSuYrquBP
	jTp/6nuzWOEgNLn8H6Of9308CY8wux8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43r/01p5NVQu3VSIcfcbSvIdQF8sVdbRchGVlnsrbhg=;
	b=dHmOFVeZFjzLjEB1hcm4fnavHxwzgrxFOPbVZwEbHhCRLvvPNiXKLIWZYz/NlUlBA0dF9X
	rzkYpFM5wVYuKNDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43r/01p5NVQu3VSIcfcbSvIdQF8sVdbRchGVlnsrbhg=;
	b=ijUj5QfQ9sz2HQZYI/o8vF33iiWA74P5HJoz+Ak2kma1dwevSA1u1rJB8YW9vWaAShddtb
	e8mbhvp2iixXdAmXTMzNKt6o/IOe4A/EvbfHDpZKA6zveWVe0nh7A9ARBIkH3VSuYrquBP
	jTp/6nuzWOEgNLn8H6Of9308CY8wux8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43r/01p5NVQu3VSIcfcbSvIdQF8sVdbRchGVlnsrbhg=;
	b=dHmOFVeZFjzLjEB1hcm4fnavHxwzgrxFOPbVZwEbHhCRLvvPNiXKLIWZYz/NlUlBA0dF9X
	rzkYpFM5wVYuKNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55BE613A8C;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aFHEE8Qs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: seq: core: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:09 +0100
Message-Id: <20240222111509.28390-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ijUj5QfQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dHmOFVeZ
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 6E0181FB9F
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_compat.c | 12 +++++-------
 sound/core/seq/seq_midi.c   | 14 +++-----------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/core/seq/seq_compat.c b/sound/core/seq/seq_compat.c
index 1e35bf086a51..643af4c1e838 100644
--- a/sound/core/seq/seq_compat.c
+++ b/sound/core/seq/seq_compat.c
@@ -31,8 +31,8 @@ struct snd_seq_port_info32 {
 static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned int cmd,
 					struct snd_seq_port_info32 __user *data32)
 {
-	int err = -EFAULT;
-	struct snd_seq_port_info *data;
+	struct snd_seq_port_info *data __free(kfree) = NULL;
+	int err;
 
 	data = kmalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -41,20 +41,18 @@ static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned
 	if (copy_from_user(data, data32, sizeof(*data32)) ||
 	    get_user(data->flags, &data32->flags) ||
 	    get_user(data->time_queue, &data32->time_queue))
-		goto error;
+		return -EFAULT;
 	data->kernel = NULL;
 
 	err = snd_seq_kernel_client_ctl(client->number, cmd, data);
 	if (err < 0)
-		goto error;
+		return err;
 
 	if (copy_to_user(data32, data, sizeof(*data32)) ||
 	    put_user(data->flags, &data32->flags) ||
 	    put_user(data->time_queue, &data32->time_queue))
-		err = -EFAULT;
+		return -EFAULT;
 
- error:
-	kfree(data);
 	return err;
 }
 
diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 78dcb0ea1558..0594269d92ab 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -270,8 +270,8 @@ snd_seq_midisynth_probe(struct device *_dev)
 	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct seq_midisynth_client *client;
 	struct seq_midisynth *msynth, *ms;
-	struct snd_seq_port_info *port;
-	struct snd_rawmidi_info *info;
+	struct snd_seq_port_info *port __free(kfree) = NULL;
+	struct snd_rawmidi_info *info __free(kfree) = NULL;
 	struct snd_rawmidi *rmidi = dev->private_data;
 	int newclient = 0;
 	unsigned int p, ports;
@@ -297,10 +297,8 @@ snd_seq_midisynth_probe(struct device *_dev)
 	ports = output_count;
 	if (ports < input_count)
 		ports = input_count;
-	if (ports == 0) {
-		kfree(info);
+	if (ports == 0)
 		return -ENODEV;
-	}
 	if (ports > (256 / SNDRV_RAWMIDI_DEVICES))
 		ports = 256 / SNDRV_RAWMIDI_DEVICES;
 
@@ -311,7 +309,6 @@ snd_seq_midisynth_probe(struct device *_dev)
 		client = kzalloc(sizeof(*client), GFP_KERNEL);
 		if (client == NULL) {
 			mutex_unlock(&register_mutex);
-			kfree(info);
 			return -ENOMEM;
 		}
 		client->seq_client =
@@ -321,7 +318,6 @@ snd_seq_midisynth_probe(struct device *_dev)
 		if (client->seq_client < 0) {
 			kfree(client);
 			mutex_unlock(&register_mutex);
-			kfree(info);
 			return -ENOMEM;
 		}
 	}
@@ -403,8 +399,6 @@ snd_seq_midisynth_probe(struct device *_dev)
 	if (newclient)
 		synths[card->number] = client;
 	mutex_unlock(&register_mutex);
-	kfree(info);
-	kfree(port);
 	return 0;	/* success */
 
       __nomem:
@@ -417,8 +411,6 @@ snd_seq_midisynth_probe(struct device *_dev)
 		snd_seq_delete_kernel_client(client->seq_client);
 		kfree(client);
 	}
-	kfree(info);
-	kfree(port);
 	mutex_unlock(&register_mutex);
 	return -ENOMEM;
 }
-- 
2.35.3

