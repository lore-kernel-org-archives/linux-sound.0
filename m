Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423695;
	b=BJJuVpKiLwyYNV1cAhBadYQ/c03rwFbZjvE28VL/kkI3p972VIMCAmKfloBhDAp1XSsS
	 10b5rnGVzqaN+nXdzWTooY0NhqqcCFRrf7KoubORauLevOPuDvGdQJ9yDUbMyORXR9FbB
	 UolDlRBTcpSZsUPJ3BB+leKzUsn5uXE6TFHlOymr6qP/NM7embSmi3bfgbYNGU7Kl4lZf
	 398KpPI9j1/9NJZKDjRMiAIn9EwE18Uch9h6KciHI9GgBywDqA1qqszabdkrriCcZrdKO
	 IQEBY8SSXIBzbHUu1Rd575y5JkFyMMwm42ijAkGhTVSrH+BYr2EjKYOUZF5fM3KYWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I5kdRbiDo1ouYiMDtlQm4jSpPGK0rwxskw2Zi5YRXSM=;
	b=YHHCI+gfl3q/DAjSVpHci5m/To9Ewpwlg/LmOdw/WN1MisacO2Fa2O8teW84ziRUj6d8
	 xCtmRUEr8b0eP8b0nOYpYxgqSGwavbekX25iOD3FbmPBFesP0+h+e95e6j3pyTzrb9MUY
	 AuAeDVw6k1v8+u8Fb1ZBtc5+W7OXZbcrCLeTUr5yoTGRR/4CSNDx4+3strB1htoSF2M6u
	 BpL8ZYRQPPdxkRaLuKqKHRHBwxw4iyc9w0PXMGz/EmIYN4xaRF7M/9JhP9J6pB6J0eNmj
	 54fbeyktBcf3M3kPAtp1q6XUKfmiKy1CtztfrtNWzMV3RsIbehoDgMjUXxkyY4/6exA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9YhxxVe;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB0606A31C
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 05:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9YhxxVe
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso525637a12.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 22:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423694; x=1794028494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5kdRbiDo1ouYiMDtlQm4jSpPGK0rwxskw2Zi5YRXSM=;
        b=i9YhxxVeB9sF9KlUzxAtC5Ddp+SDRQ06IwJy7Zy2CgsbJQhz2zGMjw2c1sVmZEHN3j
         ojho9wNIP54IhVNObPaf/nDig/snZgd2ZNr4EaqBoCfeQoOtBAV/HNU4H7aCjQrvR703
         CYVkBdGP1fxfZDmHbDkDmtVfwduMTyVX62zl+PJX+Nvo9A5rYDJp/VaYW0B5lCbQUmVr
         AyJeggsX4G4y6veKYlhx3YDDLBkNO7trs/2MrTefuYIq1VONP7sQIhW1amxCd8CZsGbu
         I2pPOblLFWcOH+jpYNFvlAOqJjuFDKoate2maqB3TOxxrhoIFI6k8WQToEk28eDoYyRN
         TyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423694; x=1794028494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5kdRbiDo1ouYiMDtlQm4jSpPGK0rwxskw2Zi5YRXSM=;
        b=AOjnYTRTpE+X/uJQO9VQz8t2b2qHTSEoGbudiaKJiGD+so5dp6TVgG2hHOZ3n04Jdk
         9W1SfZBKzywS9lBN1Nd54KzZXuR+AfJIu+m//jp+Cli8CSBEb8dHuSTCITvydOpX/aXT
         ocWSBZvXzGSQgqs3OqhnM2gA7bFhlZ/DvDwZ0yKysk4dbUpDg2spwM88w7gZuUVQJvVr
         QD8abZj4/zUK1+wmInkep5tgz2JEse0vnWVyEGh7XZbJRQ1j4glR/6lOaaPJsZdmiLg1
         d4ce53ffzW/H8SmaZ8/BSuoBcai+XQL5vQ5f26pSkt1RaWBWXASYs/Bc52Z4FbgUG+4U
         VDZQ==
X-Gm-Message-State: AFq9FYKPoGJAfFpEP4ucm+Nuxs5eA1pxHdr4bIEcQUpB/Iati0YBMxWb
	PtuDNxj4hlHw0Vju5VjQs7ub95kVRE8Zz9trcduguP0FMuJoRhXrRefn
X-Gm-Gg: AYBFou0s62DrVwdOYOSWEPzqgiVliDNrD1en9KECe9pSxfX3UZBbgdJRkCd6nqapQcb
	XbHmlyavotCuGthmAo5WoezWFaAqm7KMoSwyQajjBw1djtI+j1YhzgzInZw8+pVP9Y81OYB7NEY
	8u2pP+8rRBllPa66WjJtzBxyO+MMI+oTevIvcSlwPqkbTq/uly9sGx5kdOvbjBj1ksRZODQAxQe
	3tPFcdYKInSQbfVwWlD2mDAwKYXDnNQ3GO+ahDYmv7xBA+NKSTZTlpmcqtJXyIfxoLYggXVnSDr
	xwi0XGoUMLnxtAJIIsdSYZ6iXkjX7GHuPeNLNxJ2reMg+eY29EQ26JFTN9OFPoDBpBfzTRnsUJU
	pKyipczrUjSqiih18FYEvF2ebhlGYSK0eoxR8VL2szaTpdmK1rH8lkWylAB0BV2m+RT+YMFF2w9
	7T0w9+LzS/9f7rh/jqMomYI5Eb8yK9qcPYmKN0QPSgts57YIV0B/b6BJh4KNsU5dedb57t5DSeP
	2PwS9RkoMh7lEjsA2r02M072UuHr16nbGT7pij9LtOSRpYq0NYAt+3C1frvgWUrXgkg0z8kKUjG
	s4z23hrUZiyKiJ+8EZACdrQw
X-Received: by 2002:a17:90a:dfc5:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3ae897dd47amr3669742a91.67.1793423694168;
        Fri, 30 Oct 2026 22:14:54 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:53 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 3/5] ALSA: pcm: Add the file to the card while looking up the minor
Date: Sat, 31 Oct 2026 13:14:28 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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
 
