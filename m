Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DA2E85E
	for <linux-sound@vger.kernel.org>; Mon,  8 Jul 2024 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720443789; cv=none; b=hr1jxD5DHhJvzEhDD1X9Si8xqd3wdfzalhknXvO7Nlxz0GJoGeQBGQihisB6y6guKa8+2kS6gxWW1Hyt7IvuXJAOLjVpfLsVtB9zssQDUb+GKjg//4T43wXE+WmMaqlUFdo2+UYt+33V6pLhWQ5PMWckWeE9xnPmSGLMX2sJkU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720443789; c=relaxed/simple;
	bh=/QZbpayaQe8Cyf03fyfhANl3j6bay3916qhNPC0PdsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lZHb4mdSq7TR+9nf178m27LH5gTAm2UG2uwS8ublqYgZj2WS3umiMhCbzfTcJPymKCPf+BXEbrjcpVolWmNHKMp+QAP1SASi9WXRK49+HFvPpUZBkaZta22DQqzIiUOlT2flYv6QukXYu4YTZt/NmvLBRE5tLABZDa1j5vMrY8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z6rVbH/q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z6rVbH/q"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77b60cafecso443244666b.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jul 2024 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720443784; x=1721048584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XtrdXMRid3VNyUdDJTp3ZlMxJj+zOdOH10/MUFsmRBE=;
        b=Z6rVbH/q8WN1G9FzUfXo+Il7T+ji6NrOgJAYREqKSAnmn0cnKxRgqlJsBEEp5y688K
         /SeuZvlA0jCNIErJ8vt4z2zGgjHwXWD50kVRDGhEG8GkPgD5Hgeb9W6moPGcgr9k6icQ
         36EYCWMHFXYIfRh2QJBuT73IA6sTRi1Cn7lA8Eqx32Yj66A1AIpOtN0WFJB00ttFjVfE
         sION2iq4Txe58E3GghKDipbD65URuS3JM3HEqcSyMQD8mcqtOYycpODoQJSwbHhFWlyH
         BbUaLEN0pCwivtMZ1Sa1V6KmlXMIA2oA9hFpgP+W30SJSFpMjBjnTwxUMqiLhyyfTd1R
         0c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720443784; x=1721048584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtrdXMRid3VNyUdDJTp3ZlMxJj+zOdOH10/MUFsmRBE=;
        b=atkkUH/VovP3deYJliwgbVz8vszOcppRYlaMu3AWQNgHDo6rNMAXH2Ez5hiFUmzCKD
         dipjGMqOrHKxGcQaQEH5nAb6WSvErlj5I6Dbz4ooU40oiCRXAr1EWCeuESJBrsFsb2QS
         8ffXZFODaRCgGhpe8SfXUQJoEokVN1khGbBkFwglE2t83YUBSzsytQaqsPD7Fn6iyko9
         d0qoaZmNotgVNUtELuNdvCay8OfAONmCl5hiZAEoN20Np3MY+y2YDNKpZtTHkBbusjuf
         2Cow5Qr6vC6abjPKgu5HVJjv4KqT8u3BhxBlx4Q2D+Jv0wz8bhwl8g8VNc/h/LxKmhWO
         NYGw==
X-Gm-Message-State: AOJu0Yw1MrpsmY0Ouoriu1g8Nz6H8aQY9IARB7DTDj6+NyE6qFMm2qmY
	hSl7cMRbtEvlycS1Z9cWnAMaoN1WAa/HyjXy469Ln5OGhQzMo9NOUyKvqxdDhCX3JNZ7p+sv2+n
	77bc=
X-Google-Smtp-Source: AGHT+IHboZ/yBuV21DKJp+I97fpVFrhjGtG3Ce/AGtjyj5u1dNB6KLXwvU4JGs6xMVaUzPaaiTp0OA==
X-Received: by 2002:a17:906:13db:b0:a77:cca9:b212 with SMTP id a640c23a62f3a-a77cca9b749mr582502766b.45.1720443783555;
        Mon, 08 Jul 2024 06:03:03 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:2eec:1938:748d:b200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77ea926485sm180799566b.207.2024.07.08.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:03:03 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ppc: keywest: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon,  8 Jul 2024 15:02:53 +0200
Message-ID: <20240708130254.9631-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=/QZbpayaQe8Cyf03fyfhANl3j6bay3916qhNPC0PdsI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhrTux/VzPebaXPnIyTI/Q63z2IaJwq/vBX18WFEnKvFIX MC6er1IJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQAT+dHL/j9YpUmOtXuZ/4e9 rIcc2xV/F8i4/l8evf2xZOc55/2/1W3PcnXnehm6TfCS4Gx7yqh//16gxeOsxQ21/uLWlb7mRpu Z+d+tylfs/Mr45skihh/HzUxWn//O3mbyxFro8Uzvad4csu6vmCVn+lQUdvu8ia0J9n61Xzzfoy r4W54uZ/1qc2Gj/qoZVV/ylEW8VixZ2HCD98ZhoVVunZycG1tz1u+sSM34K7hF3PTKV3MRPx9vs 0v2Nc1yfK/97I0yWLwqfgY/WPG9c7XkpjksvQxvmNzFvt/4+JDn3g/OmsU/l3U8sz5zOnqrjoTE nbUhVr8TNZ6t8VwlPmvKVOnpRy62NfcHtk7Y05dQyvMIAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver doesn't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/ppc/keywest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index dfc1fc9b701d..2894d041b2f5 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -80,8 +80,8 @@ static void keywest_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id keywest_i2c_id[] = {
-	{ "MAC,tas3004", 0 },		/* instantiated by i2c-powermac */
-	{ "keywest", 0 },		/* instantiated by us if needed */
+	{ "MAC,tas3004" },	/* instantiated by i2c-powermac */
+	{ "keywest" },		/* instantiated by us if needed */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, keywest_i2c_id);

base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
-- 
2.43.0

