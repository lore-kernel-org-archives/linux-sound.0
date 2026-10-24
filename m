Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860599;
	b=A2baUBXAoJlaNPA1ARkAS1reNUXJQZa/OSPktGR0CceU9ym1gD974fe9W7hok/SXF9gQ
	 BEYwgN8zKFVYknNg8gTle6Oi3pbTaxhSVUGXKWuD100RibJmAS4rttzYF+7/aslhSa5Gk
	 /RyYdSGJvGVSt2Qif8xLhId6G8AH2Qro0hfzlE2UL5Y+fOeZ0KWi2mzoMtd6YKTGm1qiI
	 7aPNv0oxve5CSktNhxIt0RMn8VKLJcWvQEjaYnF/gXhcWiFn9Xl5DCLFVor8VApKgD4T3
	 YNW+RiedjHf3kY2SAu3Il9UD68zg+aE5yMlBSvYGGr41kFJf5R+g1QuZ2lC6ioNo8eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U2EAEd0xDowYBfsMG0PSIzCfbB2zi7AiM6l3QORkrxw=;
	b=2KD42SLbo9/pixrC/dFNN711p1kPCziUueyj1TBV4B0ob3DG4jOv1b1oWJg3q9uzCZU2
	 FlCg66MkCf/MiX/o+X1esOzqZW/0fgqxuJRo/pIs5hyizKmA04XuvC+aOKutrwBpVDb1Z
	 WsN+fbMQy4qn0wY9XTZgESK2RXMQ2c1G81P4xVNEAD5PryyxkQLr+1j57cjctkNe+Ggcc
	 6wdgDfZZrolmanxzTKfKNIkU7O9PCB8D7L8XsDcn5zZ5nzZ9zAMFk2vLDheNRuQGPqZf/
	 vKS9zAypvqI6n2zEj8Hl9pXw429vTDtJ24LZCD8Uv7YNN2kaX6KlujcBR/eI/DkUB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtdDmhsl;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD1606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DD1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtdDmhsl
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so18601a91.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792860598; x=1793465398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2EAEd0xDowYBfsMG0PSIzCfbB2zi7AiM6l3QORkrxw=;
        b=FtdDmhslOYMNt98YhhVrVws1C9k6r+uXUQQlXAyYt3Rj34WmK1xUzy1nE+1bCXbNq/
         7g6jjt26TLklFmxdlapjbcgydhv8BV31zD7X+xQ5+Q7Sin2z58W+zn2iWIOOTQDpgjCl
         cqaXL8BxRh5l6stkUGpJDPON52YpbtMdsaEI8rJRf2KeAEYg2w29FXYmQ1iEL2r/UGub
         J+wGgmZCQ/Ygq2bQamkszY7rK0Vmc4rju2GyNwLkgmmoyk+7ftV2y6pYc+wIP1k5JrW3
         3fp0ta4BAUiIb0lhL8Z5Nvk3Ju/9QLm/q963IyNESXBcvCsEgj15JGh1bcJffgOi1FAX
         qn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860598; x=1793465398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2EAEd0xDowYBfsMG0PSIzCfbB2zi7AiM6l3QORkrxw=;
        b=A+jZgoHlXFsqY+KCbS0lGvs9vGbNFph0bqIhv8hhn9ECpucEWRUYLKwySQWyOPBp+m
         LvwpM9B7yTEFCxx9lu8y17bU/r+xFND6XNuN+qQyDa+TycjsnWVdNAT6H61Ep+pPowy3
         ily39XNbkQH1rOmxnpKqjGFRB01yy5yquZQ/QPFpeq/Dau0HDcKofBVn1Lh/6KOsqJDl
         369UXr/vnbUn70FOs+xd3SU9SIFzh9R/J7t3vkjGdU2u9uUvrJX5sP5s6Dj9P138Lklk
         rx0beZ8C2F3daFU6VnwbEQJ1pN8CC7Z2hK8f0gS53tzDcZFyk4X9vuvdDm+46nA5dPhF
         lL6Q==
X-Gm-Message-State: AFq9FYKkaB994axfmNeAqnwy8tEbkuzx/nxc1HN0+jK1JMkKsByZ42f4
	RNUlzhIAmWdkAdiu0v1fJNs9qVdn0qnj0EZrWvUKZK2LdWSSZVWP/DMyBI1MvCwv
X-Gm-Gg: AYBFou0YESCWPKfrqfu2S/kmckJBNPGRFzYyOK8HFOwEpKQ7HpnUWCVsudmSMdevQuz
	Vnh79naygU6anaqM4RYGarVf1pE3WeZhiqCaRNsp0iCc4o5b393RwEWDmc2sxlkuyhsEgIvVApg
	xnDCkbdSlK5zIcv+gVtHbW1t1bpTmJmrKdM+6AUAJRp1Geh3vQlHaZd6JWMG2ZIHK1PIKNRc83E
	JT2mGb6lCTBCC16iDhF4FLhf3hZgj+u4Zy4lSk/jEDsnwfZJqiPu1cwD4FWJqvD8PIrhGkZS2hd
	1GPiTgUh2g9dHuu7Hwr5r4cnhc3JoDZ1QmoH03qA9hwN9mkLO2+y+bmMZVsDiIYWe3/CODPnzzR
	CR0SzIwipMGN3/TtK0MLOb6Wzi+6xJWBxwoeLwwd3Wc8anln0tYAMGE9p4ttFuGY7rszHcYYzTL
	mEjgw2QFlB/jTWNq1ufata/A39TnysENfQlOPwPQWTrndjwX0xQPP+5bWJ59cVUz1qGZA9gzqQe
	BEeO7mNqmSdzws00Oy8FXNCHUw+5x/K4zZvEsnkHxhbwkE/n7Q=
X-Received: by 2002:a17:90b:1c12:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3adeb5a56cfmr1402058a91.19.1792860598526;
        Sat, 24 Oct 2026 09:49:58 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm3406683a91.12.2026.10.24.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:49:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
Date: Sun, 25 Oct 2026 00:49:48 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

OPL3 can receive a fixed-duration note before its timer is initialized,
and the card-owned voice array can retain channel pointers after either
sequencer port has freed its channel set. The delayed-note timer can also
remain queued after the sequencer client has been deleted.

Initialize the timer before publishing ports, key off active voices and
clear their aliases before freeing each channel set, and shut down the
shared timer after client deletion has drained both event producers.
Retire higher-numbered partners before their 4-op primaries so no active
hardware KEYON is skipped when the primary changes its partner's state.

This series applies to tiwai/sound.git for-next at d74eb09af56b.

---
Cen Zhang (3):
  ALSA: opl3: Initialize the timer before publishing a sequencer port
  ALSA: opl3: Clear voice channels before freeing their sets
  ALSA: opl3: Shut down the timer after draining sequencer ports

 sound/drivers/opl3/opl3_midi.c  | 15 +++++++++++++++
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 13 ++++++++-----
 sound/drivers/opl3/opl3_voice.h |  1 +
 4 files changed, 25 insertions(+), 5 deletions(-)

Changes in v4:
- Retire higher-numbered paired voices before 4-op primaries in patch 2 so
  primary cleanup cannot hide an independently active partner from hardware
  key-off.
- Explain the initial SYNTH-mode direct NOTEON/program-change sequence which
  can activate both members of a pair.
- Keep the code in patches 1 and 3 unchanged.

Link to v1: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com
Link to v3: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com
