Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842094;
	b=RXcqK4qx7w7HvYbEkSdNlXhECzNZDxjJBYzJkx/22cJzkqPd33yYIOj8WxoiYo5BAfte
	 7AybZBLgUSJ08KFH9e7T9p/L2+RgRD/i4DjS4DpIZlW5sjihV0M798b1EvettsBxdQ/eE
	 H8qpv8Wn00/hZeTtKsbQvni68dQPMsbEzICCdKH2ot66Jtx7iyvHoDAGadTe/+tJrkx+1
	 fik5y7EjUM4RmutfVHrGWoPiCOSmqXaV/pUGHxS5pTtOek7tmuq0U2ElMOBv5JmhHIBHv
	 J94zk5ixlD4mOkAve//K3TgIOv5V4z5b4RzHmFJ+50DPvuYKif6ZuyVLxMtkPSNB9cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tnedoe/gFzpi2ROqHZcGBD/7JdKGXf+n+5ulPMXSXwk=;
	b=UAZiMohTbXgMUezoIQ6XGi1vtSb05nEMDQmzu5R4lW+QELB7ysh6wbRKPjFhYZ92I9P2
	 DGy6G8AgmAkUaEJDyVq1PwUAouQqUDXZzTvQcAYQl5Liipm9Gv6k+fPyh4Z8NhYCfaHoe
	 igR//ZNSEXgaUbiDsh1/vsCLf2MVctWSZoHdhmry99vS+vf6eFFAEa8UrKj3PWopefQQu
	 pcA6KaR7bIOHgIw7jADzJudZGUe3Zcpzu/aqQ2GeZuWrv5EjpDI8Fq7pEf2f0Hd//0vug
	 FIokC/52LweNj3cJzUuGQVsMGZfYzIJdgbS4rObjR8OTtMO2V6btzJAGkaPjIPmaOzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Q6k/zVM6";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26CD606A31E
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 11:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F26CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q6k/zVM6
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db80fcdf8bso9770085ad.2
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842092; x=1793446892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnedoe/gFzpi2ROqHZcGBD/7JdKGXf+n+5ulPMXSXwk=;
        b=Q6k/zVM6D66RE3FA0X3wcrNy57oxJpYmiLfOnkAJZdBPr2D1O12m/JQH+JfX35zQgV
         LnkGSRF6CHEsSwixLaQNk8DDNEic/f/vJN8SMj0QaX9wMhLfpbl2aadQlnjL6fyeEcyv
         TM/1c7TpCX27axPwdH1eSbi0kNsiCPMDIp0hrk2zQF8dkPGcbrEk2AU4ENxJ8i3NNJXO
         uARRcnhBXnhe5WQ0RTXs9YGHucvBWZMTcR4j5N3qCcZznZ2y6hXC6d30PSCtYv3kXeRD
         NMye9B4woEzJAwbLdiK84cUPN53YsPzm7XWrQx9OW9RJwjsllrZPrztxwR2HfAF/4h2T
         2FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842092; x=1793446892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnedoe/gFzpi2ROqHZcGBD/7JdKGXf+n+5ulPMXSXwk=;
        b=XSKfZknJuMz9XiQ/IYVq87ynzr4Xlo4pDyM/BsU/VSufFwuBOIDllT0be57CiWPci2
         KwlGWU1Kepc+plrBkroz/GJNtOACA5jh9OUa3OsOFhcTvW2TeeMYrL2pHqXuAKQRzr6D
         3X/RlmexWoUXrBiFcoQrIUbOooTUeHbcKtUmMS7PyNT22KOK50sklsSN5JeK6zWMHnjn
         vHNHuzf488FQmNRo7RhSev6JwcvZ2sdAmJ+Yv++oEJANqitNjXpwbY/Z+foZtY6Jpf1I
         1UmdoGsOf0R8idVB6y+ae7Igl+ZUqRj+gOmoho5mUPQGejAdi/iuOZmElvc/aiGpSTTM
         RpTQ==
X-Gm-Message-State: AFq9FYIcauaadxiaVA5RyVemwQJJ7Bks+4QrgZMlUR46oFCJKOfbCgGJ
	SqwJPvS7wHi8YT8/Mi/tkK+LPdzGA7I7n7ij9hpr7NMuS+y34t8KFzWQ
X-Gm-Gg: AYBFou2nxhE4/13y0Bo4FDQmeLfhNo9g+L+0aV9gEQuWEVcanKZDE0febvl9vpKoCdu
	uTx7mQytpFpM05lqbmrAVGs1nRbUEcQDyKD5Lqwuo3wZuCw0eOA20U1lCER6qp+fcqETuTtJIB0
	tWED6sF8E0hR6r+M0jYYQyuFfxkWAc20NCMfK+WJZ9HOAJDOijTkDd3CFZZicJaTE0MUK1ItaVc
	U9UAOArJGMxRU+C9z+zyBMSqbGP+OZw7+b42238oALZUlPVCa2+VoSagGjOWnFQxdsQef8XCT6T
	uUPtiw2bQsnqOr2ibKsn6mirNdvZaJPa7++b0PxAjs+cthf5bp4PoTmKo59P+O2XLZKULhAftOc
	0nxg+fMkAxKzOnZMAcv6QFy7CAmD8vJKbBk/XBQipsdHuAfUMaS7xSvRDAE0bZygdDogOsIH79f
	QM3UaQsrUIflipyej6gn31UJu0PUe7Wv2SithMSdnQP1SpghZicBEs2Yf6AynhlHajWiyU5uLyz
	zx+wjdhcg8t0WgEkS1pl6EU606MUIJMFTEfe/R8H2e+AYsnhWs=
X-Received: by 2002:a17:902:e948:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2ea9c7c9d0amr13791805ad.52.1792842092272;
        Sat, 24 Oct 2026 04:41:32 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 2/3] ALSA: pcm: oss: Retain the PCM from minor lookup through release
Date: Sat, 24 Oct 2026 19:41:15 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
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

An OSS open uses the PCM before acquiring open_mutex and before the HDA
driver's open callback takes a codec PCM reference. In particular,
snd_pcm_oss_look_for_setup() walks the stream's setup list during this
interval. The lookup's card reference does not retain a PCM component
removed by codec-only unbind on a registered card:

  OSS open                             HDA codec unbind
  --------                             ----------------
  lookup OSS minor
  retain card reference
  snd_pcm_oss_look_for_setup()
                                       disconnect PCM
                                       wait for codec PCM references
                                       snd_device_free()
                                         snd_pcm_free()
  use setup list or PCM in open

The OSS module pin retains its code, and proc disconnect drains proc
callbacks; neither retains the PCM for this early OSS open.

Use the PCM core's lookup-and-retain helper for the OSS minor. Hold the
PCM reference through the early setup lookup and transfer it to the file
on success. Drop it on every open failure or after substream release,
before the last card reference can invoke final card destruction.

The final PCM free now waits for that early opener before removing OSS
setup lists. A pending opener which resumes after disconnect is rejected
before entering the driver, and a waiting OSS opener observes the PCM's
component disconnection as well as whole-card shutdown.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h      |  2 ++
 sound/core/oss/pcm_oss.c | 20 +++++++++++++-------
 sound/core/pcm.c         | 15 +++++++++++++++
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8fdb07f2f542..12559c2144cf 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -577,6 +577,8 @@ int snd_pcm_new_internal(struct snd_card *card, const char *id, int device,
 int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count);
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
+struct snd_pcm *snd_pcm_get_by_oss_minor(unsigned int minor);
+
 struct snd_pcm_notify {
 	int (*n_register) (struct snd_pcm * pcm);
 	int (*n_disconnect) (struct snd_pcm * pcm);
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index e8df27d09b97..9f0dae051ecf 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2497,8 +2497,7 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_oss_minor_data(iminor(inode),
-					SNDRV_OSS_DEVICE_TYPE_PCM);
+	pcm = snd_pcm_get_by_oss_minor(iminor(inode));
 	if (pcm == NULL) {
 		err = -ENODEV;
 		goto __error1;
@@ -2545,7 +2544,7 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 		mutex_unlock(&pcm->open_mutex);
 		schedule();
 		mutex_lock(&pcm->open_mutex);
-		if (pcm->card->shutdown) {
+		if (pcm->card->shutdown || pcm->disconnected) {
 			err = -ENODEV;
 			break;
 		}
@@ -2566,14 +2565,19 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
       __error2:
       	snd_card_file_remove(pcm->card, file);
       __error1:
-	if (pcm)
-		snd_card_unref(pcm->card);
+	if (pcm) {
+		struct snd_card *card = pcm->card;
+
+		snd_pcm_put(pcm);
+		snd_card_unref(card);
+	}
 	return err;
 }
 
 static int snd_pcm_oss_release(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
+	struct snd_card *card;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_oss_file *pcm_oss_file;
 
@@ -2584,14 +2588,16 @@ static int snd_pcm_oss_release(struct inode *inode, struct file *file)
 	if (snd_BUG_ON(!substream))
 		return -ENXIO;
 	pcm = substream->pcm;
+	card = pcm->card;
 	if (!pcm->card->shutdown)
 		snd_pcm_oss_sync(pcm_oss_file);
 	mutex_lock(&pcm->open_mutex);
 	snd_pcm_oss_release_file(pcm_oss_file);
 	mutex_unlock(&pcm->open_mutex);
 	wake_up(&pcm->open_wait);
-	module_put(pcm->card->module);
-	snd_card_file_remove(pcm->card, file);
+	module_put(card->module);
+	snd_pcm_put(pcm);
+	snd_card_file_remove(card, file);
 	return 0;
 }
 
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 17cd60e8825d..380ce0781342 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1064,6 +1064,21 @@ struct snd_pcm *snd_pcm_get_by_minor(unsigned int minor, int type)
 }
 EXPORT_SYMBOL_GPL(snd_pcm_get_by_minor);
 
+#if IS_ENABLED(CONFIG_SND_PCM_OSS)
+/**
+ * snd_pcm_get_by_oss_minor - look up and retain an OSS PCM component
+ * @minor: OSS minor number
+ *
+ * Returns the same PCM and card references as snd_pcm_get_by_minor().
+ */
+struct snd_pcm *snd_pcm_get_by_oss_minor(unsigned int minor)
+{
+	return pcm_get_from_minor(minor, SNDRV_OSS_DEVICE_TYPE_PCM,
+				  snd_lookup_oss_minor_data);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_get_by_oss_minor);
+#endif
+
 static ssize_t pcm_class_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-- 
2.43.0

