Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423700;
	b=Tz5KBogIUGveeNyNm7QsvnE4mVWcrw5pPv83uuDAvhXD1Lnp53cLOt+7VHn2Euc5hkWN
	 4a8fACC0ELhi/u5yACkA5yfTT797mKz1SX/vkMRdnbNFSvLwixd7uhGyF0vnD3d6oIeR7
	 0IbtHMMwfg4aFpxhvsts5CwwqzBdMKvxnqXL/+Q42hVJGC0GYpSVPxu7t+L3Jyquetq9o
	 1vxnfhAFd5YVs6aMOqpHSXYL1Uh6bS3FEzuAgNz1eJCdpjquUgdfCyrQEyIqqCkUBNlHj
	 UH3qvNe1bjkNy3ZRPgjw/bctfS/2O9jfGeCQdA0d5gy296mqUZ/frJnjefO29ABF4SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
	b=sgIXi0RA5WkQW0mA10EZWZl1O2NHmEZG1/4sFgrBI1cvcVjXmAGdPCdY3pKHlz2lxk+S
	 UYZai2ni1IwQBB4NEahWAg3N+05UU1QQvJwUPfOHs/F/eljRFQUte394P4FaoS/TRyHjs
	 H77Joh6DFALG6CkJlwd1lKEDyQeAR5wNQKVIczFtmWVjZ45D0U0XyM+SEEDxbHw107/lU
	 /w/bYHIdT5lgC5hl9vddXoF8Solt3TFFokTsZGuvHdjDRXQ8XVV6c59j5tfFQ8NkhXPX9
	 Bc1xQGdLi5TX7s3kLIRivnu2WWlWteMYn+RZVeicjqVlhsK5+Y+ylbbRovxdf9r/BXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWDA+WnM;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7E606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 05:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB7E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWDA+WnM
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2074271a91.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 22:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423699; x=1794028499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
        b=JWDA+WnMMH12lHiudOQ/fEdIv/tWVSEeKrrVSFX24lrZNuiVTatl70OAjfbS8e0YhJ
         1zTGmz5uRYSXXXa8cyBpzpXo7pYhMBmYIq48kuC1bcrd07f61aXw1iS/5XSvPwF107BT
         EilCUPRxb9/loFmfx6Z0vFr4oKvNbTHgIEee9Hdu8CvmWj0LAWl+90zUA4q96gNSRPEp
         Jm6Mv4UMDNL/1HWv3ifq8pI8d5A8ifjE+xUTHEAIhTx6GZ28snul68rBx+7m1CJblV11
         uIePHpi1Ln4HFyoHEDkzBOA8uZ57X1SxraUsnPlYz7w5rTR+ciPMMNI0ARr9Le3wKmoN
         bCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423699; x=1794028499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
        b=FFuOIWnVqYBCseIKodVeqVslNJcPN5eXpZ8Zr6+wvz8Q74+eMyY1AhGvyyMYM0SZbv
         trQk3fqZaX4GF+n+kbZxv+ydQhoECn3hRqAm1/DNJdkdF5V1/3UW6t9xLryZK3x8fXDi
         2AErp+OMMsRTJKdZJnXqyT8C2v6VRO0UxcExdWZOoKBTdpKSpokmYRNTLtzvLg9V/aak
         L59WRgVczBi8fge5Aw0ATHNVEpHIcl2Xpf6YHeCXWMKidG0lJQCqO7jiOf4CRbHtFTZu
         Ds5E3odDWfcUgbGNB+2xneMAWx300uodfXsNB5kt3lUwVUXD3D43J9V0Ft87FqgZz1o0
         LsoA==
X-Gm-Message-State: AFq9FYInqwu9R9lYJaOH5gwhilSVBXtiCEBN5GRFBjlVvd4wM1M5Nu64
	MOUxpt0ARyB0N1T8B4PJXL9cKwYT5GR+GyOE4j7ZVNefZ8WQQxkjjeh/
X-Gm-Gg: AYBFou0QXD28y/CkRLGIwholZPGY+ynrsZTlcw9osYNFN45sBQcS74bu2Ccm17KJpme
	SqfWTntO4r5HA/1jgdjjfIHAa72rr175HormzT0BkTjunBC4B4BVVR134ImkJUVDTSScmVizPG6
	EIHGTxNF8XZCX+/LPxXR7KvdOfhSLPgfY0oTRUObx/EYIxGITtcK6TM0+i8MumefU04utpwL2Hf
	sQ7skMO1cOMVmH/UXd2ZpsM9ziV37aqgY1aY28cTm6vLydYRZlSOnmZVNoFXKDNwXizO0S5/67u
	96JM7RxttlogD5bqOJHQsMQLSKVZIfb43x0bYZDYFCjJILJ+HRaj0DdkkwgY6NrPxkoJB+0/Jk8
	iUYQXffzuiM8iCkAzaNNfKqSiFBagcV5T4EnsfxHpGJWt6P8klIWpCEmQFhbLOA6jK7FFpHqKmG
	UnwfaXtFy+XbomETM2tom2YuK6JiCbYZQptzQRaGmDqGYQ2bz//ELUnZU0Mt9gKcGFzPdsfz0jo
	ne+aCg5hclXMGfzOyD7/WKrVAlpoOXqpterqOiPjaiK6q1Ku70IwRxDLMG7DpeXT/87TSzobtt0
	2Khna0vj4+bknXWeWnq8/6xa
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr3689286a91.41.1793423699053;
        Fri, 30 Oct 2026 22:14:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:58 -0700 (PDT)
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
Subject: [PATCH v4 4/5] ALSA: pcm: Refuse to open a disconnected PCM
Date: Sat, 31 Oct 2026 13:14:29 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-4@gmail.com>
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

An open that found the PCM before snd_pcm_dev_disconnect() can still
attach a substream after it, because nothing in the open path checks
whether the PCM was disconnected. When only the PCM is disconnected, as
on an HD-audio codec unbind, the open then succeeds on a device that is
going away, and its file delays the remove until it is closed.

Mark the PCM as disconnected under open_mutex in snd_pcm_dev_disconnect()
and make snd_pcm_attach_substream() fail with -ENODEV for it.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h | 1 +
 sound/core/pcm.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..04f58c2ec5c6 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -548,6 +548,7 @@ struct snd_pcm {
 	bool internal; /* pcm is for internal use only */
 	bool nonatomic; /* whole PCM operations are in non-atomic context */
 	bool no_device_suspend; /* don't invoke device PM suspend */
+	bool disconnected; /* disconnected, no new open */
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	struct snd_pcm_oss oss;
 #endif
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..567eeff23095 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -897,6 +897,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		       stream != SNDRV_PCM_STREAM_CAPTURE))
 		return -EINVAL;
 	*rsubstream = NULL;
+	if (pcm->disconnected)
+		return -ENODEV;
 	pstr = &pcm->streams[stream];
 	if (pstr->substream == NULL || pstr->substream_count == 0)
 		return -ENODEV;
@@ -1101,6 +1103,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	guard(mutex)(&register_mutex);
 	scoped_guard(mutex, &pcm->open_mutex) {
+		pcm->disconnected = true;
 		wake_up(&pcm->open_wait);
 		list_del_init(&pcm->list);
 
