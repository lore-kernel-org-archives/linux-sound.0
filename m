Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E76819309C
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770528312; cv=none; b=dODQw16BmsNDD7PEy8++CqTCV/08WdFYgXBzevyLeJ3d3f14n3TZ7cjsVvcZ2cgAvUcJON6/ukXKYbXt2xfhvno9T5YS7h3XN5dvy0P3GE1w0bOVSaqNKdG4Zx1JiUGvDcE8E9TlBwCCzeqbxw26w2v0vl1w84a16suoD0Q4TrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770528312; c=relaxed/simple;
	bh=2lHIkzqPzs4sd1yC7eNNKhKVYCGKTK9Pc/gpSaXeRTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqfCD20s8YdK3WByLjI+w3dn+e1yiONTfYZKuY7bgZnBPyvghEthlGy6VahBLf8DJVw0v9gPc3xyhnudpCS9z4t8KOprGoGd+4yZmvcvN+Y+j7UNWKj/Btr6Gafasc9/X0d0sizbJe8lYhLCdibqNTqdGr+40iB4cvenHX/7J74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhIcizlY; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhIcizlY"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64a64421387so1882566d50.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 21:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770528311; x=1771133111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yHH0s6jdN+yWhY5R0en9MuhPT97WUQFrS2g6Z0r3EGo=;
        b=EhIcizlYZOd7ISAn9jyjlqmyAXSuWT97mCOvcvPpS70ZdCAVamUrzf7ySiec+IMS1u
         oddpT/IdrtSNv0INJLhbfJu2TsNtZxpXYJeydE7Ztqlj1NhKoxuy9iz+WeBrZHPw199Z
         bY2B4vjc0nbsBnxr5+CeI6LQh5zD7ZJ9FNKe6WawkMbD4qhktfPiD0oN3yMrUbYKYqtx
         RELT472p5SMPFjWFhGSjUWtJ/ZwqsGeqC6S9kXn5j3TK5+GjMPMfNq9KdEpqs5Sur3M0
         0VOn3Qm1esPrt8c87Jgqox4+52YQFbuwZ3WfDHKHxPSKIB04bFlyhS7zwP7fUiB4iW/I
         vD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770528311; x=1771133111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHH0s6jdN+yWhY5R0en9MuhPT97WUQFrS2g6Z0r3EGo=;
        b=d4Kfsf09gT1eZT29yNemGHT/vdeu1g6qcq6YK+Q3uG2jvOxXgTXVjy9YBfVy/JL40D
         QDb/bEfmo6ycCI4TbhxH82DYqK5us090IrZTO63edMzOpAZWmUB0y4Z9b94WWmIsJEOi
         mcpghSPbFmmSO/bpJAkCTp+bHA3BQPfRbfAWwaqplTBhYx7gYFc2mOIZHBeSQFoZ3thl
         h3ZwdbcPlyYp4hcNRcbCR6MqHUH317WlYXuvMeDqoRW6kylULep1/m3XEPNjMWbyuyw5
         vZwh6VbPxR0wYP+5v3JLZvfHt4vjPKUYu03NWkDuKNvN6yEk4TEnTgqEhZIXC78eO3OW
         kqJA==
X-Gm-Message-State: AOJu0YxoQMTpMLkvM280VKVnxVsHtnje7Bv4bmTaMj7u4RPcxOixGd+x
	9QwgDrLSwQ2JFfvQ76stFHCEolHSxGBnOZkejBv+D0aSsheex8r8hPhqdaWcXVkZL0CvFDK3
X-Gm-Gg: AZuq6aJK7kIemfLaJxQkZtLJ8Lwex76dzfkqCjZ7Z6h6POw2adNJqXHz3Y9747cfBs4
	DNTsPvI638PaTDOpY38vbCHrj7Y5S85P8PHdA/eijYwTOwR75risiFA1MJe6PM8Mg548fLXxsPT
	T5GItMgqgVEk0JhNdbOW4NHwYFgTCzKcgdpbabz5nkzw9RD+LOYm3nNDYR0R9L4jSlts3Mtt7/8
	kBizycblrYuaFcOxDuTxXIBEPmGyzi8UCD2M5A4T7ERFrAmiIWtrhIeIfElCYB8BBEcXMfB6FZE
	VEMdoO2R8AbEwBbQ0F6/agS5N77SSZ+7NSMlICn0XP+wEnWKCIWzpX0wcUMRG8R6PjAh5+7PoDn
	lfOuHPeBrCga0hJfgcBt5tqvg28rRFP58TAX7X3hDCOr1KC7koQf774uf/AhmqBVt5LVVTvZQ5Q
	SwyU13fbltdHUzZP19Vm2MMBWMkQoQ0hvkBWTCqem2jI5bLAITeyTwz0GYRvsBz8d5eHbmU0giv
	Eu4OI86icsLldqp
X-Received: by 2002:a05:690e:1c09:b0:64a:d705:31d0 with SMTP id 956f58d0204a3-64ad7053464mr3315618d50.28.1770528311128;
        Sat, 07 Feb 2026 21:25:11 -0800 (PST)
Received: from pedrow11.tail4d61c3.ts.net (108-67-6-145.lightspeed.sntcca.sbcglobal.net. [108.67.6.145])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79640c8a54esm4154347b3.38.2026.02.07.21.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 21:25:10 -0800 (PST)
From: Pedro Amarante <ppedrolia@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pedro Amarante <ppedrolia@gmail.com>
Subject: [PATCH] ALSA: hda/generic: fix typos in comments
Date: Sat,  7 Feb 2026 21:24:39 -0800
Message-ID: <20260208052439.11498-1-ppedrolia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix 'ony' -> 'only' and 'evalute' -> 'evaluate' in code comments.

Signed-off-by: Pedro Amarante <ppedrolia@gmail.com>
---
 sound/hda/codecs/generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 7bcf9aef8..a13e16a65 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -1517,7 +1517,7 @@ static int count_multiio_pins(struct hda_codec *codec, hda_nid_t reference_pin)
 /*
  * multi-io helper
  *
- * When hardwired is set, try to fill ony hardwired pins, and returns
+ * When hardwired is set, try to fill only hardwired pins, and returns
  * zero if any pins are filled, non-zero if nothing found.
  * When hardwired is off, try to fill possible input pins, and returns
  * the badness value.
@@ -4889,7 +4889,7 @@ static int check_auto_mic_availability(struct hda_codec *codec)
  * snd_hda_gen_path_power_filter - power_filter hook to make inactive widgets
  * into power down
  * @codec: the HDA codec
- * @nid: NID to evalute
+ * @nid: NID to evaluate
  * @power_state: target power state
  */
 unsigned int snd_hda_gen_path_power_filter(struct hda_codec *codec,
-- 
2.43.0

