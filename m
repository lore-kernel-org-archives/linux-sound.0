Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725EE33F5BC
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786811239; cv=none; b=q7qVKkD1HCG/MsXOObImn0fszTSYenEwWHkd15Qs1gy8u+mnoXoO+xUTV6/fcg1tdO17C2Kmi3bXFKiDm09ARy7SIUq/Uurs54lMaPJ21zgdeLvlS0aqv5STMoYtfBRw06mfQFdxDc2SeCUjUG3gF23buT3dDD87Q/1pMCuJztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786811239; c=relaxed/simple;
	bh=5HQrn7FzpDZ8f6tkSHjhzMeYa/g/lzqU8R5Kpcec8j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPyOGFmRjjUeeeOtak9r1yh2BBtXCrYrnL9/1FeIMORlQ/jc7AFZ+WNFyiz9CAm2A7qWJ0rRMd4vPiK6vwru+orDl9UKqpiySbWe+/dBEZyMOzbhK2D9WU90cbGC2qjbY/gt7vzwQVV8EZ6C1wQkJOloJtTODRDDi5+TrhcaMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDIveAx8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDIveAx8"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso1229137a12.0
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811238; x=1787416038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9w74tm65Ydq9yULfUeCQRvZJJ2X0p9Cgc3vMQMzjE18=;
        b=PDIveAx8So2JcL5sPAG9vmqDiljmWabvP6x1Ukc60hGCbPdcp1dPtdnDFkyVnExcDg
         9TGSBhj0h+402vQr+TEQ0jwO9Q60iqXrG9miXGLZmb99cAUuWgKj/vhUqV6lYa7BjLe7
         8Bw081EizmtSzB5H7SiiPtg1vJXXHtK2XXtSiD1oMQ5Z1jgjmqBJ6QHHgINt8hoQF0ZI
         07/jQv/QO6pnDkqomCjCeb6aEUtlJg94OZJvZimasETIvzh8dCbc1zR8yUIGmXgdqP7r
         VxRC6acLNQ/Q4Q3+by4gMTEOfJ/ctgNAzD/WyMWqaozRNow3kjwuMPBhvFXS7XlcYAs/
         Susw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811238; x=1787416038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9w74tm65Ydq9yULfUeCQRvZJJ2X0p9Cgc3vMQMzjE18=;
        b=dMlNZfibRFFPfxZHB1E0S55q/kVULjozz78cKUzgFgyxVjDqG5N9215JqIQaxEwxqS
         2pXfEZ8cSWuK0/TCYpexPP5v5oYs2ewJhB/6nY3Upv0PStexiIJs3iQOS1K21FShs7y0
         yqaxU6sGamZRL7RZ6iQFAWcd1MnbqokRQgiW9g6qfo0kW7lQPRx5i4cSEtgdVAH8PGYC
         Lqas09CCplqXfDZELomagc3PHOz9FLtXx+QmXIS2itdSunvBgmCaU/XFM4I0Xlht4Qko
         +cE/qEabYE5RyDKIOezwv93oYWl3ziYgeyqGkIgllwYxs9uxNifm57F+vUmP9EuRYz58
         RtzA==
X-Gm-Message-State: AOJu0YyvnNejuFGr24i8gL47vZmFTlCa2G7IzzBAyHTcTFuhWqvTUbjD
	DYPb763e7hKCgvAcYOyDW5jFJq7wGfiOWNyoIQ5Kqgx7wH1HEDSzHLKV
X-Gm-Gg: AR+sD11PtMdJrlZ3heDvflp+yK/oWzU8x5KUkmJPMJYUDYe+zrpshQvJ4wyA5n5kL5b
	6wNFsNjN8fhCaOsrJgZOeQwQMjAOGLKE83+R2mMC82iTCY6cCLbijYZbRvf3SmMmaQ16QLHcXHT
	sKFOqTsWNBus7KPXyDo3e0dtQXhBQCWzEC4IOaxg/yu9Y4V/yYPwowuMRa3sH4O5IsuMRcqEWHI
	2jZXAQvN85FkePC63Ghg1SPsh/t3hd+9GB+shCy+RTfX74WNiSA1N4tRbPtSRibP4rM1EL/NAQ6
	HDFUidF7gs4r6eSJYRLTv5VarExpwtm75DRmzoisfEEBFCCjNaVI8L0l0J+uuvr5l4pD5tzN8h1
	UD+Ryt6+XKrnOekj4arHqVXOTpGASPdmxZpzYFKVvh9b6VVoVJNLjMDJkVxSaig/tiOCh50RQOT
	OV1peyCzjV/JnXizlzKZyxp5swI0RcTgUU6poktb7sCTKgsbKSuZV/9tUK9uud1JJREun95u9E3
	oQ9vTWs2paR5OkhVTFxXOANx0pNS/fV
X-Received: by 2002:a05:6a20:c88a:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3cc71de5b92mr17397279637.34.1786811237526;
        Sat, 15 Aug 2026 09:27:17 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm36427232c88.8.2026.08.15.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:27:16 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH 0/2] ASoC: atmel: ac97c: Fix IRQ handling sequences
Date: Sat, 15 Aug 2026 16:27:04 +0000
Message-ID: <20260815162707.353893-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two hardware initialization and teardown issues in
the atmel_ac97c driver flagged by the Sashiko AI bot.
The original report can be found here:
https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1

- Patch 1 moves request_irq() to the end of probe to prevent a null pointer
  dereference if an interrupt fires early.
- Patch 2 reorders the teardown sequence to free the IRQ before disabling
  clocks and unmapping memory, preventing a use-after-free.

I do not have the physical hardware to test these changes, However, my manual 
analysis indicates these are valid bugs, and the series compiles cleanly with W=1.

Manish Baing (2):
  ASoC: sound: atmel: ac97c: Fix IRQ handler null pointer dereference
  ASoC: atmel: ac97c: Fix use-after-free on driver teardown

 sound/atmel/ac97c.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0

