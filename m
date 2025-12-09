Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C64235045
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283967; cv=none; b=LZPNgxIBc/avqx/ZkHSj9+/Ajm0FFLvAayLSDbc+nXRNPPSB0Qjmhp0PERLKvYafMSVAeUamKlbaiCGfwSD0uufCqZ5cR5wNKDUDUMm3aw99il9GlDdtSBxebonzYHH1DNyAZBqL+LZBG/0mJoGA8ixa6hWQMJygk9vz3sZe9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283967; c=relaxed/simple;
	bh=vrLYL9wnyZ1gpaTdyAFYaPvKjjdM+2juWuwkHvQxrME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j4NfZh4/OoKPiuxW9w+bguOavfjuR9O/2RpX5NCFKzyTYUYbGNgy1QN8NlaMhRl7ARcbfek5z1VUxVMEpEqrEslIDTMYRT+6xvDHVlBgn2Cfw7aDQpuFmbQSRkCDjqOKKfCwpJ73CpEVO1B0RhwUvaicC0/vQicLOHo0GgOzw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Mkv6/doQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Mkv6/doQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so337542566b.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283964; x=1765888764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G8bBUrUWrtFMH8HLtLp5rw2t8K9o1qfofuvPVC6g8c=;
        b=Mkv6/doQp33FV5oFTn7wEgU1DFyxhyMl1MSrdXoE1C+ZoYkPt3xIrJ9Jn4T2vKiRKp
         X2+8HkpkioMW/ZlI6blT+UkGsIz0w6YpgCVKw8au+9tJTlSioAziILm+aoSwptNtXczf
         qAL+uVSgYk22tf3ckvSIJfHdfziWPF1NI2nsCHES3LnkDrh99IXdsZRCpMrGknyg9Twb
         od9SwrHq6WhlB2qgfNpYJ1oVRvJ3zEcQcpZZ/z0cdclrbDofdoDKWW5wdNnZoFQhd79c
         simNYDKBXHLBKsz3yGPvQArZFpRh31ttL3urdQuQI1TjmZPaxtY7ZDpO51rEiJVtwBa2
         zXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283964; x=1765888764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2G8bBUrUWrtFMH8HLtLp5rw2t8K9o1qfofuvPVC6g8c=;
        b=SNakEjzcTuP7zhdxObe9hmEf85gvzbBSc/RkrjiPAvivfZ113+njk81L9W/RLKCUV9
         Xk0h2wtHUZSi4LeRkiltCG1OcmBJssmKE3Yl+Pltj2PPB+IOmrckZj0XMk6GuyVeJY7K
         9UT1XM4delSpNzvA0kVh4+P+V0KFWLUAk0TA5rIMXohCk/rGv+0NMds8IRNLAc6gIRH0
         fXggSAMUJO57QsNatvckLmqPM4TzE1SZNSBTqXMrXQUwySawf7WXoRDpaMINIP60zVRj
         eRrLhqPLqUQ4lm060qGGncDNx/uZbOL9ICjnks3o2QHFtYHJwrF8pHKHSc82EXg/d547
         kZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYvYl1X9kmTtTYQj4LkIBeTUeuMwYzcQYqNMCNTf9JsukVy5Hilq8NxJXdktMunyLqMHfUFl5q7SqGrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrsIkrLXoyw4CJSWfa5tAOWRPzs88yNtR7qqHy8w6pEfp29YD7
	hfjLU1UELf2hbpkaO4EJ0d1dsZH+P873WP9gOG5JnIgfl8bybkEcBcqgHf5s02UCErM=
X-Gm-Gg: ASbGncsgg7nwzz05jdn4/b3gJ9qZUnnbCM8HCOJUNXlIGilqjGGvdJ+FA5x5i01rbSc
	QJPwxj5XHKSVXbn3MpsU6M2MI2bbaAJBsXPnsfCKR/TXGP+PQKggOvEV4JD056p8E8mTCvKsf0Q
	UHFPOSbd1xGCups9YBOoZqapo+0f1s7YLERyjDTqf6XHIRcIpaQEJhaeEN2vn13j3bTEJPcCVpM
	Dxe7LantDGjJWsAg9w1zvwV+/ifigTgcBaKRb6HqINPrLQ06wknz8aCR6h1m5JmvuAHzFQq87yi
	dozvB67MxLmTRKm5HE+2KDT2hZsiYzLKeGZc1aByOzFRuO3iAMLii8++WR3giVe9TXyc/R4El1C
	2VdE5eqEs8jaIqQ+YVQe80hWtJyCHb34x+UghqVjfHFSLKarzOFW9ZoFJBeLS++pRTj1HbHCrpo
	yYcNBmBTkO9y6jo0anfyKamXdb2Gh6RMHdv/yV+KVVYx/zPHu9qzBDAHZQwlAI4vSWUtDRnH62d
	y0=
X-Google-Smtp-Source: AGHT+IGtEl/j3F6MDLF4XRcadf7NmsKM6pH+eJrP9Zh1akRjwW8jTHonE4J2gMDBl4Q1kJ2j/fhM4A==
X-Received: by 2002:a17:906:d54a:b0:b7a:1be1:821 with SMTP id a640c23a62f3a-b7a24851d1emr1181457966b.62.1765283963478;
        Tue, 09 Dec 2025 04:39:23 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f4975dc1sm1343667866b.32.2025.12.09.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/9] ALSA: seq: midi: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:44 +0100
Message-ID:  <054ae56db6b55eea60c8aa8f9633e8d3d180cb09.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vrLYL9wnyZ1gpaTdyAFYaPvKjjdM+2juWuwkHvQxrME=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhaeu9kv3YdxqunzVdrQIaiASbyE2L8lpTad fj/B40g/ZmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYWgAKCRCPgPtYfRL+ TvXhB/wNxxi3k7RT57vj23JmwGktwQX8CJ1L0O6yDdrx4BuKD+VEN4KSzePNpqOpRCnHH0jT/JS /s9VpbzwaO/YNYGeFPHzyKWSnaplbEkgmaJRhw7po1U0krlWdU4X1SVPMFzOEIBMwjjOEcEypjp 47mMjdl32Ew5MlHarX3ZITJ4d8rbOO6wxlcsSevx7bEIsnl66VdcJa7szuk29TQMdEfkA3oTq0L 2w+E9Gk5vt8qtQM+j66ldUkTWMsklpI+EkW0LwOzwyQ9JcPKZKFyTY+49Y4AYmTudunCOHbdtM0 dHnYS/5JgYRpmhvsLE2VEKjTznwtmyqtxwexDzC8nd1Wl6aG
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

