Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084470;
	b=ozJHLdIiof2hgDGMztbB8kbZpQu3nX6PQQLZ/R7h2UFGjEaMY2g46Zp7xH4pYoqUQSqp
	 LF8UOqnzTHo/BFkNYiBmQgGGk9UqFMBQTuZbI3kpZD/bC+/+0ZPSXyOn/CzzH0r5GOn/L
	 LVBz0oFw4a7Gffi4zbiWSfZf0FKImCvKmXObXCVHULMsWYn0kt/tIDn+qflveh7Wv5IDQ
	 uBvHtOyoli/YTub/TzOT/voS0Sh6cHJ3Wu5LKVbPG2n3fUTVGhRmWkLDN7yzUgbZ2gGfN
	 yT8M4b2JlaXAzkb+HJQ1vjUhh36FxY33dAssi6HYWhdN4Lt1yHsbru6bR2WNiYAk4Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2BJlLviIlo2L+CB1E1yEnGBnM12+e15DyXb6ICfwQJk=;
	b=J4PBEiGqAAKZgxsU1GHSsGQxLvZHvZMrpKkbkEMlbgn+R/Fkphkp9+dFZzs0q9oFIovG
	 nVXbJSKuuQl8xVuAd/7/YhgEs3gdC7DcwbMC4O/sK5fguC5ATZLygyvsXGp4G5G/26MxT
	 P9TFlDzx2GJ63Stmry2OlCQKaCrQ0QGAqMw5+IC+v2qY1m2SdCvjeD+YgDhE5h2UFtvyF
	 lWDYRuCbDcZ4UG4lzH54FJrdC/bHJmKKPYwZREPOlO852UbKo4ZpxeBml1G0gPoR6citI
	 nwHuR+ewbxVdauTye4ukIEXwu2j4ySzomfCBs8ltKksKRv6uoAvwkSF0CXk0eXJo4aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZcjhKUI;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9598B606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9598B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZcjhKUI
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9eb579c0eso13367245ad.3
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084470; x=1795689270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2BJlLviIlo2L+CB1E1yEnGBnM12+e15DyXb6ICfwQJk=;
        b=rZcjhKUIcB3TXU/ZSZ55NQDIE9TSRT9sQZK3kU6exPm4VpmJmqOIlK6Cu+L7UUFzjr
         KHcfL1yO83C59KufrG0pPongUA6/Nme58qp12JECpS2bQ5CGRJfHTza85DKuO0NNLhr/
         qt1LLYqx22TcUIXW+ao0PLxRs/ZQ+TNsjjdenlDQuRfMo2q5a6FjTuaPrVtsvoo6kTtb
         7fnvaRv9yfJnPJS6NLRhZfkMHQG+kgt0hEcBd/CKyUvjjoZ4IHWEtmCc1nhRY3ZonMfT
         Zet8Dd5rrf5zEG168Z5SO0GCm6BoiJ6VvGlkC5x36YEUPyeW+pUzsC9yaKhsqygq/WTj
         Ui0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084470; x=1795689270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BJlLviIlo2L+CB1E1yEnGBnM12+e15DyXb6ICfwQJk=;
        b=Rx0ezB8UlsYYUbA/aWGCvevPXOeBRtYcFvKTO0utkD9X6BfdOkN8/L9iLxAowrnrDr
         CPXHAQN59zhEEaBvEepwVtAvWTctQ4YtWt0hwJs59EHkhIvMer9/p7PR4ahCt3Z/AxRK
         k2+qlYSwGReMNbLtC1dH6i/GDpa2kOAcV2FiLELMWK7hbXsHQ9F1eC30XljziovcBP82
         OTJEJdhS2fVti98KFUBSAhfgGU8bW4a+CUW295BlDSmRF2sUGVlqdMtBTB74eOtYRfdD
         9DBElVk7kTuUR2GCPo7LKek65N8jCupxLYkX8CNMwPjmVcsImY9sdfQnHljHIk5kzDWg
         JHHw==
X-Forwarded-Encrypted: i=1; AL+hErEkTEFZ+j8vUz7RUXnZuz/vtKz3NFdhWkC8l+izfYs9EsvO9U1m2H8uECCBZNXpFda+PlDSWb8is1UrWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dqpe3YaCOA0VmWTeNF6fuwo+sjWokRbAGYkf0uWYJd+nMq1ml
	6/qEC9jIjtqXajgjTeGlwrZmjLtnICmd5Z5Un79aBr0+L+yTyxME3N1l
X-Gm-Gg: AZFdTZcWMAsbdBvqKIdz3rPIB0HjxTqg3jctPJtKh8SBjNpGEZD7cHO1xIHC6JwB1fm
	0un8X8B4O4Ht2Y9jImri1pI62X0j1vMPSOWk2lFJpCzec3Z7PaYghgtB9yEswQnzw1XbOrsl5sV
	0SAxYXjoC+1ZvcpXnd2ljy7RO+9z8lvWljmGFTrXY7TuTavTJxMzaQ0XeQQZQPum4/9Uk+BW3yE
	vy0SWQLYyV9yLE0Y5PEhTRUFuZMzlDkq/o+OXszQJpKleSbR3qD8DqU+Ew8k+n/T51DiGHfh50Z
	0ZO5h6UTTE6jkCNNqUUHPPM86/MVg6ICjUdYgmPlp2OpVJRK7MZ/crmiAXuhrKa4w/wlPlJwliF
	opVy0ZHb7kUD33nJGG2LRBAuH3Rxf3JdrT0FBZWcluoBINDLhQ0sp4X0Iu/bA0rlrxRah+2QSSF
	RkfwDa7X7iI8aZqcq0VbC5/5JCkZPBPP6omh/MThdDZKzPwXkLScNlCYiXq2otooHNPnnPWiKv1
	wMGE4kxkiJ5TZrTpXEC8rf5/QuAHZkMMYZHxsf2YxX+1P3ZPHeFP+mgatsSloaSnZK9h3759hpo
	f7IDWhMGfC40eYfDsdSy9UKqONK1oQGC6M6HYBJU4aTpMRkXiOrPJ6DwagDSmuicV4tbD8+QG8g
	D+yMVJQCEyfjJHW2aFwbrf14Wk9KDLi3oVbWaLuFkIM3o
X-Received: by 2002:a17:902:e94c:b0:2ed:fd0:e736 with SMTP id d9443c01a7336-2eff70fdc62mr50594715ad.6.1795084469832;
        Thu, 19 Nov 2026 02:34:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:29 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4]  ASoC: atmel: mchp-spdifrx: Improve driver cleanup and error handling
Date: Thu, 19 Nov 2026 17:34:09 +0700
Message-ID: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling and runtime PM cleanup, 
adjusts IRQ registration order, and fixes error propagation in the 
ulock get callback.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: atmel: mchp-spdifrx: Improve probe error handling
  ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
  ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
  ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get

 sound/soc/atmel/mchp-spdifrx.c | 81 ++++++++++++++++------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

-- 
2.43.0

