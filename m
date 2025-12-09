Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD4232E13D
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283970; cv=none; b=MdHBKbLGZ1vhCUx5gnHWbIIRj4CiW+z/aOea+mMio9k+SHuLZ9f19dIPNUOg59RJMCcEZ2b0DfrX755SRUqOLTBhkKxJae6r1+wuXUEsD+tw0y+CWtsgOP4qWQg370z6tFeCJA7XYLQpm1P9XVaYMEc2niz8hjVoEgPdksGtyHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283970; c=relaxed/simple;
	bh=MBewhiBq26HfxFbKs8BrOvK2/H3X9hB96cSpZrvucuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgosBSpRmw2Hne+mAOGsiG/AkzvhKPIREIWlXRwrqeLr6MGLhSQCsC82UsJg/do8iUJoyjEZ7saMKRnlZlfgc54wczRk74dAL76sJODdzZNtCgQF8K+GF6ARwrnbG4uDKwBUWUKnaDozuVX7Dw0vQFB/JzANoj3kMDTPoxWDaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PTt2/FtH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PTt2/FtH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7277324054so816350366b.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283967; x=1765888767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=541KrGwChOXu7++9gRBUw4X/+yL3CQU+ODdqioAZFos=;
        b=PTt2/FtHpCaGhhHSpGKu9rUKd4Ar5cz+fRUs7MjqLMF60iyhN5+U6nr+53IYAP4EwO
         BIuz3l2Su6oW6PLEwFPh3GAJgFmrkmZwLJth1oiSxmrMkXJ70MzTrX1IacmmeZHiXD1z
         mDJmt1EAU8JukrX8ea/BrYvreGxwd2/1SxMAMgUojscEjkcLmExLqShNYDHGnp0OVNhB
         tfaD71+oom4IMKLql7sD51zH+2lo+Hju8e/IvHM/iaYPETwKZnT0IthY2u1pYD3mhCuY
         S/84XFD+9T8oI0twwS/LtIFRJ0Rm0WJxPQTIZZ6cI8NxCfa5Zyl4HREhcR0ia9YRoU1d
         t/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283967; x=1765888767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=541KrGwChOXu7++9gRBUw4X/+yL3CQU+ODdqioAZFos=;
        b=kahv+t3RZPx7RlA1f6B6ZodSyyrtJNPIzeeloJNf8P0mh90EuGPwjEwspFuRBqCPYN
         tGANNRGSc6sTWm3gXIvF5KPVLOUcQz2N6AcSS1ydySDOEyMiUiD8AjDDx1Pc3kxTZAs4
         CKad2myOCiCcG5Y1ovFMotIO9FQfezxdYg1dxKbyPNzSAxARdqpcOUR/pve9m2fI87f7
         YrGVD+2llVj09ftC8WOWjxJZukXH8hObHqjF99ffT3uDPNz1Ad3zpOV7RM7wl6YmyMo7
         uWx+4BmlA7plqBZ0oZv6daJ5IYMWNjR4ShArtlmbY1nnjGzS+w0kJGPwHPNbRCVMUs8R
         pK8w==
X-Forwarded-Encrypted: i=1; AJvYcCXtZ43KuMPnReKr8ww3l66oImXLWC+G5GaHFAzS3J4D/K2KT3dL3Szg3t9NQSBTLDGkvW4M2crxuYDE+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9UFoCdjUWoYaAsO85OhJttrXoTnKRfuq/a3LkIqG+uHsLsVk
	WGk8kjhHvMFRLRbwuzIWXpz1Wk87wgoWEriCb2pJQz7GAmLkVNhwtG/mU1lhyPXNwBc=
X-Gm-Gg: ASbGncsGyITuEq1pnu4VzQBFjcBwtXGqJcftEcon2tEPfZKK5tXxDBeAFAGirTe6xRB
	9LBS+eYJ75B8rCvU1iB6+C+Hm0OGSyPjFE3yJNcSDoMdTf9vICdYnwPpnpDjrAQA3cLkk62pwbq
	XFXVikohPa1HjM3/DKngHwzet0DGdAnZr1WwmHQLHPvCfz4WCcIxp14prNhzshxbLRGgOs6YRjA
	SYfiHpnETortqqAl0UjkP51jS2gaCjvSzDLSf7agQ5DdeBf08I/UXllbKq8Cwy7puRaZZ7y9EtV
	dmJbvdeE6cOoLIyc/YXvFD8BsjQYnnxbycGsa4fuW/5Eg5AGP30ZKjSFvrwJuq2R8gbozAtf8+Q
	+YDxwIBonBMn1NIKhheKEHHDUrAnZNeloew+gg+woqc0rLgNMrR/+WsCFkMJlrY4Lj6i6MQAMh0
	Wjqe/72EtLzHbnkMbxYq4ISSy5xm0zEfipxgLVozb5zp+tamd55M3sOw7gdtZ+G8SNo5nPSeI6d
	F0=
X-Google-Smtp-Source: AGHT+IHlbB7Lh4yjVvzwiPxD6h5Mb1hQUZw9JITFMkk6uTYFJKsHmc2uaM26JmQEmVIjyFN4lv0S7Q==
X-Received: by 2002:a17:907:1b0d:b0:b73:8b79:a322 with SMTP id a640c23a62f3a-b7a2428ba6dmr1045009166b.11.1765283967399;
        Tue, 09 Dec 2025 04:39:27 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f449d181sm1404297866b.26.2025.12.09.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 5/9] ALSA: opl4: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:47 +0100
Message-ID:  <15cd19c9c8ec32e92b956eec112e515335bc22cf.1765283601.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=MBewhiBq26HfxFbKs8BrOvK2/H3X9hB96cSpZrvucuU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhiAveUD5lAwQZ+PRDjy9j3p0ccxYCI+awL/ DjiYS/0PEKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYYgAKCRCPgPtYfRL+ Tp+UB/4/R1iUXTulTFyCkVkS5b4rmUZCXxVa4eyTFv13PWrXSrZIEQJ7qJOTX6b83eXdsA6U0St ofBr4wEesZx7paXjOqTZ/LgzNGaVeJ+l8Cb2llf8AIlKq33gVmWQcfj9Bn0ya3spLAIOpZdzFAu bzxYnxeeuH0wAovUm7MNdssFe5mZWXVfFSd5aRWVJLlf9IcxcuRbbEFOektNa9/OM2GMlh+kjqi 0e0V9b46TXrdSkfLM1VZV6eusY6FDM0QkHncSQnw6/jfRWsJHCGV1G/IKqqvKBrb4HMvSg7jvSL pshtn3X1ZR30JPAEEFNrEz/XcNGlTtD1uK+Ck2UEYYooIDfr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/drivers/opl4/opl4_seq.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
index 7bb22089a093..fd6f15be6109 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -118,9 +118,8 @@ static void snd_opl4_seq_free_port(void *private_data)
 	snd_midi_channel_free_set(opl4->chset);
 }
 
-static int snd_opl4_seq_probe(struct device *_dev)
+static int snd_opl4_seq_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl4 *opl4;
 	int client;
 	struct snd_seq_port_callback pcallbacks;
@@ -175,27 +174,25 @@ static int snd_opl4_seq_probe(struct device *_dev)
 	return 0;
 }
 
-static int snd_opl4_seq_remove(struct device *_dev)
+static void snd_opl4_seq_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl4 *opl4;
 
 	opl4 = *(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	if (!opl4)
-		return -EINVAL;
+		return;
 
 	if (opl4->seq_client >= 0) {
 		snd_seq_delete_kernel_client(opl4->seq_client);
 		opl4->seq_client = -1;
 	}
-	return 0;
 }
 
 static struct snd_seq_driver opl4_seq_driver = {
+	.probe = snd_opl4_seq_probe,
+	.remove = snd_opl4_seq_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_opl4_seq_probe,
-		.remove = snd_opl4_seq_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_OPL4,
 	.argsize = sizeof(struct snd_opl4 *),
-- 
2.47.3

