Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773118;
	b=prUbtibgkC88k6ChMPjssU15WzmYJoN7I32zmjWXubLXjaFwQpVTh69EXTVr5JgTKdj0
	 n4wiCVairjsuiy49Mz0e/rO6vFfPiA7RFQiOcAz7gGGY0gkD6PP+YQ19AGjPu0Cfvkq18
	 4XVuD9AOHve3SqP362d10EOSG8hG3UO35M/PqhihsZba7Qx6AB6kF2iIxN/sz7Y3Chqs8
	 8OH5EnfxkXzERj16k+B+Nb9jQcPdY+VQMzT7K5qpFn2EYSmFwKiVgl23A4H2iOfcfuoBc
	 4qBNyzOUtpxXfY1j7gmCFap6xwIhFax14omgiGaKZrCc4EhSMmzVjI3TXr6GQDq5f6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
	b=Tgo/+fNF98glT4Rr0jcMUj8ughR8AGm1W1w/3yobzEWU2YBS2Cw+ZnENb3vOa1iNOOj+
	 s+DGQTk9yi3L7bCr9msRQrAPoYXdadSWzWGOK7uxB0UMLskTgVM5M65sH0I35ioWULSZo
	 f+VACktTD6fYouB61y7HF2S+BQs5zgmmeky4num5xSA0D0uW8JAK9l4jB7d7m4CPGhXn4
	 khEPPw/2YgNi3/7Wc+CTPQt12hb/KOYXf2hJ8dKBZw+vXpoTHfr4FxKNBuirxv520gN2N
	 rfagGhUkvYNz6RtT8uua9DzvoK8aNblwlCcOboEdnqFiqN5mNs7Z+SDRZYfziFhF2pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzaZFBqv;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C6606A32A
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0C6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzaZFBqv
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b5786e099cso6716547c88.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773117; x=1796377917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
        b=kzaZFBqvVJ1n0WS3G172UXYxvJKiscfG4ZP6abKEXwtGDQ3XzuyUxz5VOG00PQGwte
         jo7S3tIjrM01nKxb90xf6i0eGB5uHzEzS2vbcS0ckp4W8Fh2KIGUXtZWlQa4MeBTUQdb
         Cw6UIkVR+BksWEifBD73LZI6ij2jBwbEP8UnG471LDR+u6v1n1OXvCGmGUmBG4DNwtIw
         5Fx3m3Dx1rRxcswObLEv3qJoPNcVP2bagkgUMeuBH2bbO8uEfgpXp2Blz+oNtHXSsjQy
         5lxS2l9E4URZwm5b9HUrAwr2guuPJSCgifvrW8pB8X+PmxmIedB7e+6TiToBx+FkEnD9
         6ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773117; x=1796377917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
        b=ueUUdXlkomOM/4SYmcbaVlfiT7aozh70vz1CtrC4bDG+n37cH2lBo9v1iOXoznVyYN
         cMMHhe9ED9I7QnNi+v6YMKkvJ9E3sZy3pY+PlJJsOKc1UCOx6v1vXo31TGOy3kciKxSa
         +Lm3wXpIhvrdD54+hqgWS1UpsjXXYy8czSpd12lgYx27NjtJ4KlR+cW0bEXLG3TE4032
         zGmSvqrjqBl5DU+2yxzCid+1Nl9LX9A9BNw1CJD7ux6oVSsQis6M4gbllpi4EbEW5l5K
         384RguEE9U/BVYfkPW/gJQgr/B2hXjaTrt94f6JO/TTgO3HENO5/pAEvWLjeL0D1tHJE
         msfA==
X-Gm-Message-State: APuU4Z9SrSTwlsc/O1U1gYNgruKsIsf44diMRRE5o4hO3FQq0fmEk1J2
	GUWZ08+QuTkqS0IjyxHUs0fnPbgB04YteYLa21oe58ThFLyFc2wsGoZwAcQo2w==
X-Gm-Gg: AZFdTZd1sLzBPLIbfkSlLwZMhFPZS9pTQ0IzHJeTlQ7AzdfL4YJc8GBOTqQHxiz+tr4
	CzCnrIjbxklGEzs3xrJ7gTqRy+0tajm1Us7z8wrzArDo4a6MFh7KR8AXxGU4cBcOocFwM8s2mFr
	7kwRVYb6nSlQffaAG70Rz9fFHwgpEiNxUp1tLiO70zOls0zztLq3KRfbJFyg9KwUYgT55SvcAw5
	jbFTkFJGwCJH2yjFECxqHHug6YkJ5X5xl0K8QPp0N2nxCvwMGQGKV5LdrE3owEd/1tjENyjU/YY
	uFUTeosI8JdIXhfpUrIgBvAXOoRM95LQwknc3HdFP0TzisDvnLufbS0SZTVJQNRV5FAWpqunzDx
	neYNjFlfst6rZsz3b86Lwqg4Xmqo6GhZCVVEb4Cgqklku/ByJDS5M2whApAZluBbfGD53nr8n4e
	9XDGDzTmDMHaoQ4TXZ0RVF3EfbtGU65WrrqrtdagPYYPNFdQIw8+bJ++IjV3ECDRd0zCLCucv3G
	1C6T/fQGySJzaKXSkbZcFX0S/4qJKjfoJAF18P9WBOTiGsKJA6mnSEE024khEK12uA94Ij7F7DS
	Sa/pO6BOCM646BpwVTFxmB9eb55xriW6IRzh6q5AihBwnR8iMXZenXE3aX3Udz0wQFzyglVSiw=
	=
X-Received: by 2002:a05:701b:2901:b0:1b2:529c:5b6c with SMTP id a92af1059eb24-1b563e5cbafmr20921407c88.14.1795773116771;
        Fri, 27 Nov 2026 01:51:56 -0800 (PST)
Received: from localhost.localdomain ([103.177.252.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm63459721c88.6.2026.11.27.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:51:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Fri, 27 Nov 2026 09:50:29 +0000
Message-ID: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
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

The driver currently ignores errors returned by
devm_gpiod_get_index() and continues probing. This can cause problems
when the GPIO provider is not ready and the function returns
-EPROBE_DEFER.

Use devm_gpiod_get_index_optional() to handle the reset GPIO as
optional. If the GPIO is not available, the driver can continue using
the internal reset mechanism. If GPIO acquisition fails for another
reason, return the error using dev_err_probe().

Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
because the optional GPIO API returns NULL when no GPIO is assigned.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/atmel/ac97c.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 234549e17351..3ab6ddb3259f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -670,7 +670,7 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 
-	if (!IS_ERR(chip->reset_pin)) {
+	if (chip->reset_pin) {
 		gpiod_set_value(chip->reset_pin, 0);
 		/* AC97 v2.2 specifications says minimum 1 us. */
 		udelay(2);
@@ -743,9 +743,13 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->pdev = pdev;
 	chip->regs = regs;
 
-	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
+	chip->reset_pin = devm_gpiod_get_index_optional(dev,
+							"ac97", 2,
+							GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
-		dev_dbg(dev, "reset pin not available\n");
+		return dev_err_probe(dev,
+				     PTR_ERR(chip->reset_pin),
+				     "failed to get reset GPIO\n");
 
 	atmel_ac97c_reset(chip);
 
-- 
2.55.0

