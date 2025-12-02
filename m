Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F91E302CD6
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678990; cv=none; b=LtCFLiW8T/UHOJ//O5DycBQ5wmViy5pD/e/aBLCxvkhWN2Rkpal2/GV0g0pD6G9i/L1ksrMI/IXNQLwqSxQtBi3yN2ZJRouvy4tiSZ9qaZLhC/gUn3pAy6WybtrKz1u670xoI1UkE1MH0gm07g/WPc6gpmRKWm7JlPgLl8PgyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678990; c=relaxed/simple;
	bh=vrLYL9wnyZ1gpaTdyAFYaPvKjjdM+2juWuwkHvQxrME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKpFihzvHRoBwIrKTVJYk16OG5zPAe/TvSBjg6Mye5zIDgB8NwINnMsXNUzxGknurxH4ukXkZZiJnqiLav/6XnW+9F1OGC+WcgCpqvBxT1ml/crCtt1YvGL8YX6MPz/kM0oA8piMLPheI5QhaP1IlPRDN6sfadRLiErNuwnQv0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=faNg0HHj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="faNg0HHj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b737cd03d46so775430366b.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678985; x=1765283785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G8bBUrUWrtFMH8HLtLp5rw2t8K9o1qfofuvPVC6g8c=;
        b=faNg0HHjswJ3HvBUyOjxkl74/QfYAYxymxsEtBqLdY4+oaZIuAVERsDH5tVIN3UE/v
         mzYpFUgo48+jdec/1j6jYUaW125NegOSqbh2O8rrwMh29M68POulDyIaX7PDXZstb08R
         wCEsvAxvKnxYKX5BoqI6Oo5lhWh2XIBuKLl2s6nwGDxC6emWxHCv1NyvSty5fCgUUzGh
         5Aw3goqvwAq5KL6uNxWy0K58KoTZKt7UwTpmHjKjyeeVkd0NtS59tWNQ7LLnITcKBY7T
         PDj8gREpYHxS3NlVXNt1lftfw0Q0vpPFJmELklHOVSf7aK9zybgeFjLu5sXLU6vOrEt2
         65UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678985; x=1765283785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2G8bBUrUWrtFMH8HLtLp5rw2t8K9o1qfofuvPVC6g8c=;
        b=qYtqqszx0mH1r/Bjm0SAe1uSr6zsR1B9SNV1wxV2a7dNNa7TmLZdGaAUjRIRNqEQVE
         CQ8HpTz8Nypf7Ni9S4nby2WBQoZaeOz2W6DDXcOpu9csxXVwVNZX1Kn+wvRFA7OHYYNt
         kNSqkolKNUklYphm4WNdu641uAMVHfSYn9cTdf/0hq2X2CbILzWymg0h+MuOw57J3m7E
         rkladqTMPMinhbAtjDhnSG7A6r40PGS6ZcHcYEiR8o4Mj026/zXNzpeNDfWLsM5ir7pU
         WteNIsNgO9+Ytn3afy3ItC+IGF7faJsF86gWP0W8W7PwOPujsYZjVSVBuHXmds2sdinS
         wF5g==
X-Forwarded-Encrypted: i=1; AJvYcCUlhpGN/dzlJzAfXuAiHPg3OGqxxEPAftjYUNPlJEyXlofAb25DBj7EbOTTEeBZFDHrK6S4QzfwwaQPTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNPq1f5LadbTvPAv+a3cdpxBBsnmGNw1fypQHjyiOjHjHYLhB
	omi5MRJd6Mnbja0CkErlnfEBxLDK6rLdRtlhTlMxNxLuLKSVf2OmuEYCxN3ffb3ByEA=
X-Gm-Gg: ASbGncuOWV+Gc7oZ8S7fB77DhKUhLaHBo8QN1KTmQcgoWus1+IAVLMZzdXNOBod8PC1
	ViRMUGi6WW52VJwBbg/A8WaocuPGzYCJ+mDecrlN7KgFPA3/phA7RKFK8SixJYbyyAh8WMNXStG
	BZgYvE6aUKYBpvZK8CO1E+34SOPxG+Dip9lFW4lleqjVL1NIuDyKEMFc74m+z3djo3c0xzC8wU8
	eYT/b+Y4G1JYUEtLk4csjldWJ70d125lP3NsPanKUbKf3t173h0SDjB6IOBNfitjB8O3ZJg71lQ
	GY5RohL0UYuDC4/2UrfE418mvCZ4d/HVZokIENuKjJoglHx6Qd2QUgczub+awSY/HAIH2x3SQxj
	MVAajNS2gVy9UMMdmGWu2ZSQSWE6K7wLOA9gFUFZwMBvqna1ESWu8GDMfBP0JKkX4blcQgBL7Ep
	H3rv7I0oZMTwPpHIcaYLIygNTzSCMLj9QOWCK8kg8XvHNP871uuSEv/YUztR8uHdBTvV5h/mcmb
	qs=
X-Google-Smtp-Source: AGHT+IEq/3ORGe4UmpI3IRaZd+rw/uzS1cZ0rnsLzt4aBMUQsvByetr+QICL9WZzf7pr+EEuEGmwzg==
X-Received: by 2002:a17:907:3f24:b0:b71:9c99:7b8a with SMTP id a640c23a62f3a-b7671732d17mr4671388166b.49.1764678985459;
        Tue, 02 Dec 2025 04:36:25 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f519d883sm1500301566b.17.2025.12.02.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:24 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/9] ALSA: seq: midi: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:51 +0100
Message-ID:  <1d3362c1f15e7887b5709bee2df6d69b58d5d74c.1764677854.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vrLYL9wnyZ1gpaTdyAFYaPvKjjdM+2juWuwkHvQxrME=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt0sCIhb0AfMogSCwLded1nYad2DtVOeu2zSv UE6jKkanFaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dLAAKCRCPgPtYfRL+ TkUiB/488KJ+G7Hh/2CkG7dEX8RFDFN+00mVhdirMl/k47RHpXOrkjbUDfRqXEtu/BcbebHqELg 4/tmmI/AShCnxJk9tRtHWWG1GcqI5kHOcb0AeUqbblcDzwRmiyVP0xXxZJzz/p9vkMrwaaZm6h8 RqViza0Bbf6QnYjwjG1vAZ2Bwkv7RkglqAoVktP9kMdCeDclr2kcUwbiwGpvTlc7XY44IERgmED 85pUuYOeOQ2jpbVVqKVDrhg/RRgSoJXmZ/n4OwHFYVeBfALvQYshZ88ZFjPMhf1ii67nPpjC9dj gwbzTauFl4sWVOQySRFBcmudiP8FrtV/nXy4igDfXzQFd/BD
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Note that the remove callback returns void now. The actual return value
was ignored before (see device_remove() in drivers/base/dd.c), so there
is no problem introduced by converting `return -ENODEV` to `return`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/core/seq/seq_midi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 581e138a3115..de7ec7d15f23 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -265,9 +265,8 @@ static void snd_seq_midisynth_delete(struct seq_midisynth *msynth)
 
 /* register new midi synth port */
 static int
-snd_seq_midisynth_probe(struct device *_dev)
+snd_seq_midisynth_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct seq_midisynth_client *client;
 	struct seq_midisynth *msynth, *ms;
 	struct snd_seq_port_info *port __free(kfree) = NULL;
@@ -411,10 +410,9 @@ snd_seq_midisynth_probe(struct device *_dev)
 }
 
 /* release midi synth port */
-static int
-snd_seq_midisynth_remove(struct device *_dev)
+static void
+snd_seq_midisynth_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct seq_midisynth_client *client;
 	struct seq_midisynth *msynth;
 	struct snd_card *card = dev->card;
@@ -423,7 +421,7 @@ snd_seq_midisynth_remove(struct device *_dev)
 	guard(mutex)(&register_mutex);
 	client = synths[card->number];
 	if (client == NULL || client->ports[device] == NULL)
-		return -ENODEV;
+		return;
 	ports = client->ports_per_device[device];
 	client->ports_per_device[device] = 0;
 	msynth = client->ports[device];
@@ -437,14 +435,13 @@ snd_seq_midisynth_remove(struct device *_dev)
 		synths[card->number] = NULL;
 		kfree(client);
 	}
-	return 0;
 }
 
 static struct snd_seq_driver seq_midisynth_driver = {
+	.probe = snd_seq_midisynth_probe,
+	.remove = snd_seq_midisynth_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_seq_midisynth_probe,
-		.remove = snd_seq_midisynth_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_MIDISYNTH,
 	.argsize = 0,
-- 
2.47.3

