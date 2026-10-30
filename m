Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347443;
	b=zCLhBUr33BP+hJ8ew2JHuuIcGTgEFFUje0YkTlGa+tM73IUmaLK2bsL7Dlk+XFGNECoy
	 2seF+qLv7eQFizmXdcVJPBNwogOn78VCPjiLijSksEW/u5Q99ItmjqMOCjoBasn4OJz9F
	 +Hdt9kYGafKo2ZmW6gHCxFCNJs0JzHbk/LTDxHuisuxDEoKR75PYSfuL7VCDgnl5qcs1o
	 jPsl7Nm2SXXYKgDQ32eBrqPM6vQNZuxOqlEGVXiBjkJT9DPR2v7erLJS2EydvMd1uyswj
	 Id5YDpoB37oVxS4abh8PNtw2lk3PZykJzRO1dX/BFRfWOSn1u944cHShAPXBfdozIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFgGmpp8gd7H3GyjBY3/eSFS06JgJbzV8ZW5JhjT65U=;
	b=lc3nPob266hw7ykQ3QYFG6vhf26sdomvfZhlaxAnpDlmIvUWi+Ah6msQ7ejywTBYihtm
	 xe8IkreGYFVJLFDj5KHyxfduqeUiDNkgJEBbGoIuPXYzLcIrrH3z0H4/oRrEoSggEiPQX
	 Gkrvw1Ci8apAzNkLDRjMiXTAaI33Gfg1aqqQ0SRUTjjJ1kWUMqy+Z8GfU2huuMfVsRtWK
	 E8Nma1Yg5w56obqKy/fOTkTP7hLaaNwzL/RUV0aJNPhlnk/iJef232s6dnau4zRrfUWye
	 MlJnfvKWKBW8Yz2ORjzLlIxDlnX6+1V5ZucmUc6kLwo5E75Re4ghO6eoL5DZa9DreSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTKjskP1;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527A606A329
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E527A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTKjskP1
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso210515a91.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347442; x=1793952242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFgGmpp8gd7H3GyjBY3/eSFS06JgJbzV8ZW5JhjT65U=;
        b=eTKjskP1yKldmIxYqTo6SF1jY2vCuO/r9e89RVH1m1uwu2hK18wGnRB/+OuocCSqs+
         pSyfQKj9kte4Rf8uzbMRVjZ/58AJLfrk3Be/0a3XbmTlnzYUp6dDEDo1eBMyNP8kSGlS
         r7jJMB7mZdPXr0IL+RDqVzCf7Kne7hBFfBI8kza7RwWIQcx2fSVQBLnWoZsXX6jn9F0w
         J/wxmZKMHlPZehKUTM2C07mvdoVITffvLX1lOq9HaXAizxZxF1VLdpmXbu/Xr3DCZJjO
         hJ13BMmzNRLzVVc5lTetPPwQ5H2NIcz12N4nDRMUqK7QNlymAZYbpqqLuYeoEQTVnaNB
         juEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347442; x=1793952242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFgGmpp8gd7H3GyjBY3/eSFS06JgJbzV8ZW5JhjT65U=;
        b=l6Y7V4LeHUVDlgBHAxjGu7XZKchwAB8xyu4Dw1ys5xTmDkeAyYbbN08Dvj/vRSBgvP
         Bg83h8TfBBlF/H5BktEO4YNIJ+KjJJVXd27ceynht3PfyAHPz1k7PVqMstZ0MtY+Zb0h
         e8PMkGsgAzzR7c1gjl3CG/dmqJpW1o6E0ei7icoRbV/rtkVb996B2UIMKIuxnkDw5IW9
         lby6R2luy9NUn5+9KG9Ca2XJ/n1pKTGbOVAVrCXMSQYL1Acls6W6VTWGxIbDknIWFIEP
         WBMe0M9lq7uRzexMEvFSlJIcoHAThtWDjROIY3WAHF95a4QecL16I8VKzLJT4C7y8vjp
         t8sw==
X-Gm-Message-State: AFq9FYLH3gjwZw6yVhIVv0N46UJIok4ZlodZtup687pAPZ5pwIvJmZz+
	8FSsQ/3da3clls0WnzFtMjYUlZ7BR8leSY9Dp2PpMHzrb8roU2Mjo3D7
X-Gm-Gg: AYBFou1eoVzfLm0mXhYW41p7ccFAwlJVPLO4yjBZ5H/WItY2s6IJ9FNTAVQ5khWrA6x
	nzdA+hqZ1SYuyANCSQMbSwufdxsS/iCCyIilHeCctVuyJ5ZlVxJXnreBCqgTqJ00yJTkPlbHPST
	IRSSjCIN4LMg1Fa5P1Wr5RCJkC/ah/NARE3pe9SJ9QqYnnFZ/d20kyDcV0zVTB9uKCkTnpkt/ik
	xexe/kptnWj5eMWRQMi3WmScMW0sAIAyyi/A96CTdTcv3Zza7+jILeH6KqrGE5oZ4VRalYuAYoK
	geCS4SPLaeZaBdfBnP/YIf8gk8bff73W4+yOrYpRYpTE3pQTYLpmtSA83yx+4CG86muWv+8w2t/
	qRvOCuHFb4wzlRI2I8UB98VEMB6U1yvzVGpL721ETtO3hGjH3TbIoUc6fnZHWEhIVA71ZbMhgLK
	1xryNatVc7kAeC56gSZNpWjDxm7Nq+lpTmlHRASBjjxbJPjzlzh0VVfkve3uqFvEEudNBzV1DOt
	w+1w7unQEJJQKZRwc6BYqGP4Czd7WWQ4qdOyj624WpiyGUMCqhTArocdy4tEXGX/zZxG4x3lndc
	ShWqBdCt5bzEzspflTYKbels
X-Received: by 2002:a17:90b:574e:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ae897c94f6mr1099490a91.20.1793347442212;
        Fri, 30 Oct 2026 01:04:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:04:01 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 3/5] ALSA: pcm: Add the file to the card while looking up the minor
Date: Fri, 30 Oct 2026 16:03:41 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use snd_lookup_minor_data_file() and snd_lookup_oss_minor_data_file() in
the native and OSS PCM opens, so that the file is on the card before the
PCM minor can be unregistered. The opens then no longer need the extra
card reference from the lookup.

Without that reference, a failed open also no longer reads pcm->card
after it has removed its file, which would race with a remove that waits
for the files before freeing the PCM.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/oss/pcm_oss.c | 19 ++++++-------------
 sound/core/pcm_native.c  | 37 +++++++++++++++----------------------
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index e8df27d09b97..2d99df900f76 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2497,15 +2497,12 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_oss_minor_data(iminor(inode),
-					SNDRV_OSS_DEVICE_TYPE_PCM);
-	if (pcm == NULL) {
-		err = -ENODEV;
-		goto __error1;
-	}
-	err = snd_card_file_add(pcm->card, file);
-	if (err < 0)
-		goto __error1;
+	pcm = snd_lookup_oss_minor_data_file(iminor(inode),
+					     SNDRV_OSS_DEVICE_TYPE_PCM, file);
+	if (IS_ERR(pcm))
+		return PTR_ERR(pcm);
+	if (!pcm)
+		return -ENODEV;
 	if (!try_module_get(pcm->card->module)) {
 		err = -ENODEV;
 		goto __error2;
@@ -2558,16 +2555,12 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 	mutex_unlock(&pcm->open_mutex);
 	if (err < 0)
 		goto __error;
-	snd_card_unref(pcm->card);
 	return err;
 
       __error:
      	module_put(pcm->card->module);
       __error2:
       	snd_card_file_remove(pcm->card, file);
-      __error1:
-	if (pcm)
-		snd_card_unref(pcm->card);
 	return err;
 }
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 35152fae74ca..89bfe1f358ee 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2938,45 +2938,39 @@ static int snd_pcm_open_file(struct file *file,
 static int snd_pcm_playback_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
-	int err;
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_minor_data(iminor(inode),
-				    SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
-	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
-	if (pcm)
-		snd_card_unref(pcm->card);
-	return err;
+	pcm = snd_lookup_minor_data_file(iminor(inode),
+					 SNDRV_DEVICE_TYPE_PCM_PLAYBACK, file);
+	if (IS_ERR(pcm))
+		return PTR_ERR(pcm);
+	if (!pcm)
+		return -ENODEV;
+	return snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
 }
 
 static int snd_pcm_capture_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
-	int err;
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_minor_data(iminor(inode),
-				    SNDRV_DEVICE_TYPE_PCM_CAPTURE);
-	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
-	if (pcm)
-		snd_card_unref(pcm->card);
-	return err;
+	pcm = snd_lookup_minor_data_file(iminor(inode),
+					 SNDRV_DEVICE_TYPE_PCM_CAPTURE, file);
+	if (IS_ERR(pcm))
+		return PTR_ERR(pcm);
+	if (!pcm)
+		return -ENODEV;
+	return snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
 }
 
+/* called with the file added to the card by snd_lookup_minor_data_file() */
 static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 {
 	int err;
 	wait_queue_entry_t wait;
 
-	if (pcm == NULL) {
-		err = -ENODEV;
-		goto __error1;
-	}
-	err = snd_card_file_add(pcm->card, file);
-	if (err < 0)
-		goto __error1;
 	if (!try_module_get(pcm->card->module)) {
 		err = -ENODEV;
 		goto __error2;
@@ -3018,7 +3012,6 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 	module_put(pcm->card->module);
       __error2:
       	snd_card_file_remove(pcm->card, file);
-      __error1:
       	return err;
 }
 
-- 
2.43.0


