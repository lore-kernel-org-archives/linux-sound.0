Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347447;
	b=5kKVHd5IdytkLxBN6b4N/FlrQvf+oqPre2FF6QxwuE//SDJk/YvL6VKimK+Jo03SSCPo
	 vaUttFXroA7KOTS2lLDkAJBdFueEGnEGxhecapVhL55AIqUIwTAl7Z8gWK/0TazKK+iSd
	 b5MLIql5nBGWA6OAwinEWwbyxG7l8gQlIiW78VxJdjmg0JGjmqKz1tHF8rkyA5BSpkPi2
	 s7tkQuvkbFLTrwN0sC1a3zLBD/kQnmXY5mn7TcuYUdYsJdy+VpCbPGSzWJfuwENcm2q7U
	 OMiCLUOACx1+Iv9K6fr6CeF1fq8+/7c0WMq7vJAR4Ps7e9mVxdyo6jEHAxlwRVwyh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=thnlgDsgaiZp29Xs/7SKR0Bl6MHpM2zZTlOwDr+vKFY=;
	b=XLGNZtfYX3CocAHp9GYBRszdX4ptG916InNcYCcxsp1EBbYahueS8JBwy+PFSCqpTSd2
	 eNRzR/g6WLf0yy9TUHZ6b8xOB01wMWZoIhAZDnvirjKbr/HPowhep+AEuHaFz2GAjP4xi
	 /0L+XjviDpDIQ0zRx7I+xGCljNs+8mGlHSS6L15/FOZg8EtfF9Ensja2nZGYiVlB/EWtM
	 CC8RhPEZHt1iQplbhE0GgZ+XATAmNTkjwPRVzR931Uezm0NJo7WNevs0y646DcGktU8Zc
	 wwNUrTMfqG6Ym3oWku6jnMxl9Av0ZbLHCoaB5A497zOnrgM6JzOY8AAKsB2GDqyCO8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lz+H7Yt0;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A17606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lz+H7Yt0
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso254484a91.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347447; x=1793952247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thnlgDsgaiZp29Xs/7SKR0Bl6MHpM2zZTlOwDr+vKFY=;
        b=lz+H7Yt0phI34TmKDeYrPMDqYLY3kcPpEFQ5awZoQmXenNRq8IF8ftieOFPBlo0Pds
         RNErtohPebLxd6U/xMIPRsNC2SsEwaJKs3TM6HLn5X0GHr5+EAGIHwAXYe/8+LmcyAxw
         ywdmR0mve4w8tE7pMqiZEZzR0+iMr6tfeDP2LzibMgj3cPsj+wvHyK7nw/OHZKPQaoQV
         1Ekc/nRh8m15MEEhE3ASedCusZlXovy50/5UFONNS0BiFfQg8xUlMG+HEQbL7zd5LLAy
         cSS1463A6frmC3mZdRT9/x8QVMSmWidKhqLdSIC1vxd0R6+b0qb2xtqAGKwM+02k1Jht
         mZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347447; x=1793952247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thnlgDsgaiZp29Xs/7SKR0Bl6MHpM2zZTlOwDr+vKFY=;
        b=Dnrq8TxnfLMkSzXaL+WMGzZkZPHcF7boeK8BgWiJ0DehRmnyRusjEmJpLvo1kt6Ec1
         nCMo7psFBvpyMBX6ohFf6FJHQ77ujlHNu9uAwfy8QqBWdrpPoMiTKh+dPHDJIisnIUzd
         ZHEpwycCv7lsWLRmhqHwZmHF3dWFxBuJGxaUF5MDbaElJq33NIQczHASsu38I924Z1J7
         yrUxyQBRoiqUzRcMtifuZr7Hw6wckmvYT29ZOKboar/TYElPC/6/O6dOWh8S+sSKLyM7
         DcpNeS7V/Yy5eZh00RAwBqmdlYgbIqN/WpVaOi5kKkmPu8MPNXNF3hqG8/EaXusyVclX
         WZEA==
X-Gm-Message-State: AFq9FYLzyHPx2GmN+c/3y7zldWQss85tPFuibBRXOIBbxLcRO9tIwiNo
	IJVOgTD6OjXZEFP040q6JSS/eZl722Qy7obYo67QgBFyZZeSJjCeEj8C
X-Gm-Gg: AYBFou2AMueCfUI5Dju0eEwF9uuHPtOrh3YsBnoFpNbGwTvGy+8VL4ab0TgbBjWf0Ru
	m4ZgRg2G0J7KroZK9tY0VYcGId3emyaWNulcr8oN627CFdF+inzqjro1WsL6Wf1wCmTGSA/dTp5
	O80qSj/a5lCcHOaibGuLX5Gva7w3ti7liEuITNjF+2/FOOcjSCH/8xnGyXjfid+B8lhIOlQiAll
	VfUqn+VGrHvD3ZkAVM7i+AuPjQGeg9XVQh7axaC6+DAvK+T/uTA9XaaJ4sJLWqJJAEpW2teYLPb
	g3OvZad7gdeho8FGmoXdhReQ9sPl0qjfTlbVOy3J9Ne19Owt4DeRmqUzkrM7ZVUuKAyKlQNsmZO
	MaFQDIUUNSXfQWdv1+y2m3OqujesdB336S3yUiqu+OEs/PxlbTqQuZysPoyXHNJHx1T9B766T3x
	eH/qy/SeV/3u1jVKUS6PzRa3F2eAk63mknzv7b/qsPyt9Rtd2StMT0uQz05qOp4RNCGnoTzO4CG
	58VKA8THt2pJDK16ywfU/QF5j757OhHEwAmQyrtK3iF3t/nwv0+J1ytN16mIEPsT42DXIjwc0Tn
	VUL7yt9MTU9jGq2ukn2Ow4Z8
X-Received: by 2002:a17:90b:2549:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3ae89536be7mr1302353a91.2.1793347446341;
        Fri, 30 Oct 2026 01:04:06 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:04:04 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 4/5] ALSA: pcm: Refuse to open a disconnected PCM
Date: Fri, 30 Oct 2026 16:03:42 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-4@gmail.com>
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
 
-- 
2.43.0


