Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673989;
	b=4AU9oHiDxnLrWT9oAfw9jzwQptYh4vV8xRhurBwg5dB8HQ5AqT4JXg9jmTWCOuTlUwZ5
	 eO3icATjwpgY41hZzJlrJIwONv2oJOLb8SCDgYbDDc/EYMNlwftCc72kt0Ro0CPOUQ26F
	 iI5dpBfBDT4fdNgQ7hgZJIua4gaPeUcywRdoaWPVI8AoT+q227YJj5TDaYFMCydU4Nfa3
	 bLzj8M/K5uThu7uQdCHZ/ht4q6NfCFD1nuR2regpSD1a3p8tDGfS20+XCgl3g3f31aL19
	 lFHULPBhjGsPwYwri2nmx8ULnhEBNG+OZr6x2v7+98qQt9FQqeO7cVjhVlDdbKcwFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0YXlOsEx8PTByp1QwbgHZi5PLgmr6v7Uc+yNKtoqErg=;
	b=W2f6l0jtJJNs2AufGuH25udMh5P5d8JLBmSzodcn7lEM72lKJZBbhjDiim+vPQbRoDlL
	 akGZ3nfhSABpHoWFUM3YwFKCuYG/QIvkjCvbMXwSsT5Jn4FL0Qe3ru/ybtLU8X/qcyKlf
	 ZFTMVhd48zO/7QrWaECMHR+CEeD33T/atHJ5BAuMNQhJVNmq4g0rcnajK28z25PQeQl9T
	 f1/4fTgS/YjbZ7r6m/M2in/8HLHhkIX3meyjuvJvyasNoCGmI20TScEMkbkd591/P7Hou
	 4sq+ZROSN91Le86B/A/qNuBhe/Temo7qAZS77LCcZh6+8gmTfOKXsEyIWCkti205sXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sn/ZG9zk";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE2606A329
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 06:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBCE2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sn/ZG9zk
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so11036897c88.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 22:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673988; x=1796278788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YXlOsEx8PTByp1QwbgHZi5PLgmr6v7Uc+yNKtoqErg=;
        b=sn/ZG9zkxthCbYgOLaIl17WW5a/3pM3Pw7B7r8UsNWWxpyFmntAU5uyNb0+3HjC4O5
         1o0gt19+klMXcyJsQQ5D0/XYsNuZ3HPY+NoTC7yHYMG9jbwC8eIFpsQhZDFBYVdOYNep
         fOju8zulDHP0Gi8niB+3u6FC8eiRH2bN7dvOHpWyLnXAbEGpUb0L9QW1A9Cbj5XYBXhR
         i4oplFZSSqo11CRUz9IR8lhZrFE67J12rASo2ay3+cBenoKTJtSkVEGArJwKd79u+iVn
         4XvKsjDnSPyRDdp5StlfbZ5pE9UPG5/3LCkj3lpPa2ImM2cx0ySr1J+YZf9Yb3o0fajz
         n2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673988; x=1796278788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YXlOsEx8PTByp1QwbgHZi5PLgmr6v7Uc+yNKtoqErg=;
        b=EsfJz/ouGWqUromuh3zufEYrcVHP+hA0npsr8n0m0N5LlJLsmsgWoUYulmK+2m0L4V
         3OJVmEZna9ls2LqLzv6PZDSHEyx+7uUCXu71dRAXVA7FoFLFAQtuH7A7aCah5qjYkMMa
         gTgTRlYOqwjtGoanDTZalLCFNeFvtu84YJlirj1oURbaM9ID9qYj4VDQOyKMtFmHISYr
         WVlPo2UFvdRMQ1tp0a4Gp0IK2ZMr9BhnNIZwjCObL7b9rGYZB26g55794Ejl1DJhbHeY
         BaV6fsforwpEN1+9OlxyvTa88MjC4MK1RIyDtxeTT1xIjdTSk9a2ttozU7EBFBs9Nby8
         Riig==
X-Forwarded-Encrypted: i=1; AL+hErE+CNu0a5voCUMEG/vV6lN+D+K1tVYQS38eM+rwwyndssRCP+LpojAtKZio3fA7q2ozXxcWgXjFBTWhrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jGLk5w/WRGxcWxx7Ws8RDWFwU++aOWCVvXw7tDr7pzqqui6jP
	MYJwVjjL0wqaedplrBd24lLuv/PrSoYNvTgN9j21qlBopRHbM5+No0sE
X-Gm-Gg: AZFdTZcCdVJo3MVeQw1pLyVD5TVcPtf4XZsl5CbaFWkxanfVcWVDMqKFT8nISPyVW+z
	NywWYL+dZ+GHK4vrX2+2y/BHuzL3sblYLDulqwN24Xg4XRlWbHs2/BKl0FIV9grjfVgDfgYrKdf
	oLzC8b7kafwqDfgHoDSws3mEv9J+kVKjrWSPhXbGPop32FPpP89okj37bXb54wt7GtJcwUQoN8C
	hHRZb5Iu7Z2l9SpnXsRIcaJjYHU5aErqm4BKgQtvNCq3A+OpUws7FYFLAavC8f+vozLdKqYOZaj
	9EPeceKWwUxFkDG2KF/kamzFXANV7t9S4CGqAl7fCk3gkSMTeJ9agmQRxMbgo6NJwyEorgrcERG
	fEKI8ItOxeHM4Ttg9ACgoxib14Y6d0WztDZ9/Bchr4WNx9/OK0HriyLem5XICD3pD9iuYxucBS5
	j/yCjO3s7JTf2f9v9v0RefljPKsNjh40NE1JxZ4qTRhDa+no4md75QbE3+Vw2tgQ8XkMvu9sxS5
	bww5B3DR0ZVmQ06tLNZLfjPgqCSURBvblwQiEDnvQ3nbxSCYRMrKY4INbEI940QT7ki54ZvYljZ
	GZg/Bxs9JJZKRF0k6yM45/oktfWyMLZzL4pxLvzaE/gHkwTn4YQ=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr19795063eec.41.1795673987845;
        Wed, 25 Nov 2026 22:19:47 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm105527747eec.3.2026.11.25.22.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:19:47 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: vmaster: Restore follower values on put failure
Date: Thu, 26 Nov 2026 06:19:10 +0000
Message-ID: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Restore the cached follower values when the underlying put
callback fails.

Otherwise, a retry with the same value may be skipped
because the cache already contains the requested value.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/vmaster.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..f5cc11eba25d 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -193,7 +193,7 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct link_follower *follower = snd_kcontrol_chip(kcontrol);
-	int err, ch, changed = 0;
+	int err, ch, changed = 0, old_vals[2];
 
 	err = follower_init(follower);
 	if (err < 0)
@@ -204,6 +204,10 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 	}
 
+	/* save the original cached values */
+	for (ch = 0; ch < follower->info.count; ch++)
+		old_vals[ch] = follower->vals[ch];
+
 	for (ch = 0; ch < follower->info.count; ch++) {
 		if (follower->vals[ch] != ucontrol->value.integer.value[ch]) {
 			changed = 1;
@@ -213,8 +217,13 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 	if (!changed)
 		return 0;
 	err = follower_put_val(follower, ucontrol);
-	if (err < 0)
+	if (err < 0) {
+		/* restore cached values on failure */
+		for (ch = 0; ch < follower->info.count; ch++)
+			follower->vals[ch] = old_vals[ch];
 		return err;
+	}
+
 	return 1;
 }
 
-- 
2.55.0

