Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DB3DF01B
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909121; cv=none; b=FR6BHrrkO+j89i+iPvDxS0da7ZmcD/wedyKTRZiHBsqK4sL8whmhivL72HLj0XwwpSN2+ZZvvUfQG1+hbVh6+GPD0TqDjT5+KGrKQMV/OnHaZmYmMl1WJi4Gu+kFI/T9YKvyKBbqUhyolkzz3yJdwjQxz9nZUcAFDDCUHdqKZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909121; c=relaxed/simple;
	bh=70eLQsTvtEwGlVPQzRJXRiGjkMch0oM49edUxNO3TlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvDQSVfxQN3QykRA6BHu6nnUO0+8WCdxSCqTUk9B93JIOA8TPpmrqPL1qfhDebavWFnsa/9Nhrb6zbQiVsNskU6Lh0/KACtudgDdDmF1LHcJi+S8cRhgFmr8nfKcIeSJvP282oVV37TVFNJp09otsgWf8wTQk9H4P1gwvZlxPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZnMO5f7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZnMO5f7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483708b697cso5572335e9.3
        for <linux-sound@vger.kernel.org>; Mon, 04 May 2026 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777909118; x=1778513918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mI/mVzsPMweUr77VUTDY+mzcBZiLj43Uk4Bw3xKnHA=;
        b=PZnMO5f7sQkblUrB/39mzli246rosnoC0xnrghdPjla5tKBS+BcBdXGzOMVO79Jtn6
         GjPmJkikqDXG87348/FixLx+b2QP55T2hVNtMQ88uPui3TbtO2AbAW1MnNAUlNdXGC2m
         W7VCJVZMkW+CY/tI1XugWi9l/AbH+qbFWmNaBfXjP//Ev8bT+fBNJ+COUGKhsujvNdo9
         0mxZnbhS5M0m0Q6FVc9WJtBeDmnZ+9Zpl5DGC41BY4CykrIOjmMnKbfa9UumQz+J3bi8
         VjMxwW9N22SpQXx71GEabA8kW35Eq4S+FqqJqJIbzW3ubJCVDJAP0MxRGBOlmfP2ze4v
         89lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777909118; x=1778513918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mI/mVzsPMweUr77VUTDY+mzcBZiLj43Uk4Bw3xKnHA=;
        b=BQcmv9cA6vi9EJZ+g48SNcs/ofM9/xQnyCoXxtylkeklVHtKGKptUqJIBkTDTxtQ09
         ImGMZGe7VObFdp+8E1oq7ODM7cQinvDDyyPYu1+xIrJClVonOLgvB/AFyjEW8lizhr8B
         BPgPr+DW8M/ZVUGwD++MfBxEnsZP+9mYwWiJsF9S91hvyPFeC2eBJzNSmoPJA8EkPnKW
         lB+pYz8F3RFG8tVVqdzUduBEcP4tl9NuvLvqSL6sSVHDM+0p7S4niAnLwA0QrQ4ydUdO
         86G2sgUMvlgYcXvbFLiQZ5pvuxSU+Vc86MnCiARY5YCaK76e7kMKslWFnXcFhwBnnwC8
         fZvA==
X-Gm-Message-State: AOJu0YzGkCoOD2X/Vs68ID4jpAwHkYFnkAR+UOXASQL1cB3TVz2rKh0o
	/GozGIOknF2dre2qj5V3C3wSCE17PtMjXlMZvUAFxJThZpt7MX+Hhbzl
X-Gm-Gg: AeBDieuyBMwpx4uhmEO2ehtCJf4HGDDSlSwW83QfY8mczTa4Gf59CXjQxuLd1j5TbLP
	JTAM+tAJ72UURwfy9wb7+OlcVVwdmX6VKkulAjv12BQcs1LSR/ox6p03h/NRLE/wgfLY0hw3xjN
	j3BF73uLUXODnrnBxTRXtep3NFsgjloe16+krrpHztb7kE444F6z35YbwNf/BoQdEw2LCJv3MHD
	9BMUDfYAlK80fydyF8mahro1J7s8aXKRaSm/WGbyhoQHZ2Pjok9eubNy9tg5HJ5IBcbv+afgNYq
	tx3TjgkmNQ2veKE2OozRIeMdwgHmzD92sT87Xs0g1EoPo8E3VZVX059JqFhs5pQDNu9e55N2EBX
	p54euZOi2US56R2SGNqxY3ZbE8TQ3Got2TnHFGEF992tJbS4/s6oK5gWHKi0Q5e1wpOnMvlIus8
	E/QBvDpU7WYzhXLWQdFRI0
X-Received: by 2002:a5d:5582:0:b0:448:8796:9c1e with SMTP id ffacd0b85a97d-44bb07a4fbamr4835022f8f.0.1777909118298;
        Mon, 04 May 2026 08:38:38 -0700 (PDT)
Received: from lucas ([2a01:e0a:354:c290:234c:5dad:48b0:9188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cf6asm27189958f8f.8.2026.05.04.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:38:37 -0700 (PDT)
From: Lucas Poupeau <lucasp.linux@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Poupeau <lucasp.linux@gmail.com>
Subject: [PATCH] bus: ac97: clean up whitespace and move EXPORT_SYMBOLs
Date: Mon,  4 May 2026 17:38:31 +0200
Message-ID: <20260504153831.18381-1-lucasp.linux@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up an unnecessary space in a conditional statement and move
EXPORT_SYMBOL_GPL(snd_ac97_reset) and EXPORT_SYMBOL(ac97_bus_type)
to immediately follow their respective definitions.

This complies with the Linux kernel coding style convention which
prefers exports to be placed next to the exported symbol for better
code locality and readability.

Signed-off-by: Lucas Poupeau <lucasp.linux@gmail.com>
---
 sound/ac97_bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/ac97_bus.c b/sound/ac97_bus.c
index 8a44297964f5..ad7fb6b0c2c0 100644
--- a/sound/ac97_bus.c
+++ b/sound/ac97_bus.c
@@ -73,7 +73,6 @@ int snd_ac97_reset(struct snd_ac97 *ac97, bool try_warm, unsigned int id,
 
 	if (snd_ac97_check_id(ac97, id, id_mask))
 		return 0;
-
 	return -ENODEV;
 }
 EXPORT_SYMBOL_GPL(snd_ac97_reset);
@@ -81,6 +80,7 @@ EXPORT_SYMBOL_GPL(snd_ac97_reset);
 const struct bus_type ac97_bus_type = {
 	.name		= "ac97",
 };
+EXPORT_SYMBOL(ac97_bus_type);
 
 static int __init ac97_bus_init(void)
 {
@@ -96,7 +96,5 @@ static void __exit ac97_bus_exit(void)
 
 module_exit(ac97_bus_exit);
 
-EXPORT_SYMBOL(ac97_bus_type);
-
 MODULE_DESCRIPTION("Legacy AC97 bus interface");
 MODULE_LICENSE("GPL");
-- 
2.54.0

