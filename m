Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842673101CD
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678991; cv=none; b=AapqjSFVfL1vJtswK1j5qOlLV4mojYrQBmcRmWkNGuVjvgSnI+Ra//8aX1ZC2CcloKVqkutTVwx90Y5UQ6zPXrgYvBkpG3SylV7pSSRIJ2GM7s2SwqE5g0SQX/IFHOUHIpaNbRfpZRz1sP3Vrc61nMwqEej7/GPfllkftQVadq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678991; c=relaxed/simple;
	bh=4CI/SLTFPw6D91iPsWX3ePqDb5+ZBhGl0uuATHVpZ3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIdJxqZoU4D5ZvwWSWAjBu53hFPBJtfqQosfqfClMFZU5tDUCH+qMZcCao9mno9Suk6Szr/5wx5W9+zJgQpW4Gv3fWiZ23pYPvO92M+nWigZO6iRdZCS65YtL0SYb4QNgAUCO4jBcLyONgPqrAErhkqo9kyIomcVWTYCLH6hgrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g2eEmlkV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g2eEmlkV"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b735e278fa1so346335766b.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678987; x=1765283787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ijvivmm8XH0D/4aEMW9p08arkgLks1CMdNd/IC4SJ7A=;
        b=g2eEmlkVib/OSq9tU6SFpe5XgsG+8zbFtXKSbJOTey4QThr9f5O/rzneft24ZD+89Q
         pRoFS1ThRT1rfAAvWRBc4tlDrucTBAb0C+PQGwXHA/znZpqWBNr3H1wl6NM+mVp9lo9Y
         Y2WagnLpT1NUqso1WPcpOmH3JYHtVahKHe5NxqxLwN9hRUfYxJkJwddcOkHpC0H9j6jU
         KbwIBAwc1t1tmb2+KSOiTU619z+aFCQFj582BjKf9gZICIREWm500WvoaRGnFjZYugvp
         plYlnOZWvBdr1ReTDb0eG72IIvxjzqUVLHVYJ7BiOMRSakFnRVO+2eLe1TqmxYgmTfqy
         D0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678987; x=1765283787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ijvivmm8XH0D/4aEMW9p08arkgLks1CMdNd/IC4SJ7A=;
        b=fqGeip9VAuyOnic3B3honLDIWozU4E8Q5HGGoRBc/ArUCiHCno/NuChSQ/BFWlWR12
         sskplYSVc/T/GRNemhzssyYTdgoPPdeAKM9PAwURr3l4nsz8qf+As6CV2CoDauDc2bZo
         oJQQkQyQC9BkIKLnlkEeL4A5yg0byILkuhBEuuMAlqdbMEoMJ1/gTQ/+96wc+sRNSldG
         sHSPqs5LBr+2CTSkWakmIg+WfeFBwlOs9Yt+9UnpygGc36RQDTQndGlP751baL7Yo/g/
         pKOwEX6pbC8NAnXuJq8h+lixYJPWvyAqK99gLAzOMyctbr6trfXRUxKS4gM/1zFWWccV
         FtYg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfyJ90V8gLdXxw/exzXOHfqxbdNd0Y7bflVS3GGhXCUNmG8vad2bh9KygSt+P6rNqvScF/bgQoGY3Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysNy1pqaavyIjpSh4XDKTXH4jpOs7hOhZ4hXqktxYaBBYNtkLK
	bQG8Sycbg+QILK57NfVGKteGcahPAC37VGr3dN6uDB5rjru2c5hmU5527pTBmYJcF7vBs/cl4E4
	AFp+i
X-Gm-Gg: ASbGncuESiDawEn6z6v8SENbwO4nLrK8J1Zh67V8EJWsYCpHB049I4sK3jyUcPdQwyt
	/4TVy2FXwCKe6mbfZLtUwYrdZBohBQ4Xv5LtoCGdqHgeLcimXwARFO/V+F9uDHiBsUe4TtFVuew
	3UBQGTCkXJbhKrsbZF/2oJhcbWrPbV5ihJQvX3yiebuP5YSVgd0HXa9zGG6YHFI0nE3+iaJ9gtm
	dLzZhkKG0O5WOUS7/FFkj07qe8/ot7qLAJ93Tib07cjg0Tor8bZPLBaPq8n4p6nwhKRbJvOvCfP
	Du9RNNRd/ce91nPAjmcrv1ZRBWd5gz7FR2XIPpQBBIkahQt/N/K04rJbvOu5u75IDiyld6Nf1qL
	qtd7TPEjJd2G/Bk0BxkqBMBwtsfy7NpFK+51NbazCxUBP+AYP9UuJZyPLJ87jD62B3CdIm4eR4F
	+fUva3tdYAU8MOkU2etLNgyGl3oNEeOZCTwI0EA48F9EMKRqjp1k2vBLMCbGkJd1tOsninNZZxf
	5U=
X-Google-Smtp-Source: AGHT+IHlPZAxwubxPXpoN+Bla+1CdXImYzNaWB6w2Fq7VKvXzL+uEcH6+ijcPG8Iz3qR4dyZ+yUwYQ==
X-Received: by 2002:a17:907:2d91:b0:b73:6e0d:4f6b with SMTP id a640c23a62f3a-b76c55f3f27mr3497855166b.36.1764678986754;
        Tue, 02 Dec 2025 04:36:26 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a4b762sm1521221966b.67.2025.12.02.04.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/9] ALSA: seq: ump: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:52 +0100
Message-ID:  <3c89bbb572c6b95b86b89425a8c6d6945d594750.1764677854.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4CI/SLTFPw6D91iPsWX3ePqDb5+ZBhGl0uuATHVpZ3s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt0uU0EYWthnsYk05/O7nxZx1/QqJIfxLdvJ1 e0sJOoEebeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dLgAKCRCPgPtYfRL+ TqBLB/95kP8fzObbIB2fWUKN7z6wLZeZza8Dbhd2mIfgwxt6J9oTqw5v+HGw+NMwmyRHWJP9hwj fXjsP+gYpQzcGPVoGYrMlUDitve5rpsjulPQ9qvmVzRHMTwc9PIU40VKc2jDwMs1NUO4Pt9gVTQ DDkwXlpdx8+fuvmEz//KZfNMG+H/n2TP8Tg1phcxdhDtYTCBQtsKsRBh5Md6wejAek2TF4giwNh gjIQ1WsWj74oYkG0UccKGondihgH7qmJVziqMV/qrfUbYiDRt+DOUqkq7gA3Sl61oSFUAPbHHFP MomDjgG5KXCYfcvbP1YVQDlWkA/nxWS0oc6f6fluegTbzt5h
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/core/seq/seq_ump_client.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 27247babb16d..a96d21981cbe 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -452,9 +452,8 @@ static const struct snd_seq_ump_ops seq_ump_ops = {
 };
 
 /* create a sequencer client and ports for the given UMP endpoint */
-static int snd_seq_ump_probe(struct device *_dev)
+static int snd_seq_ump_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_ump_endpoint *ump = dev->private_data;
 	struct snd_card *card = dev->card;
 	struct seq_ump_client *client;
@@ -513,21 +512,19 @@ static int snd_seq_ump_probe(struct device *_dev)
 }
 
 /* remove a sequencer client */
-static int snd_seq_ump_remove(struct device *_dev)
+static void snd_seq_ump_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_ump_endpoint *ump = dev->private_data;
 
 	if (ump->seq_client)
 		seq_ump_client_free(ump->seq_client);
-	return 0;
 }
 
 static struct snd_seq_driver seq_ump_driver = {
+	.probe = snd_seq_ump_probe,
+	.remove = snd_seq_ump_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_seq_ump_probe,
-		.remove = snd_seq_ump_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_UMP,
 	.argsize = 0,
-- 
2.47.3

