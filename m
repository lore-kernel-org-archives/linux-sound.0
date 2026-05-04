Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D2136358
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856161; cv=none; b=sOdkV17xFiLSajGLPJoRd/eifvEOR17Ud6Tjvpna5YhytmiCeoQuF+n3gn3RWbPPwCkkQ/tZBkRC4UewIPojyq3+Lm2qs9hET6Ue21TyjnGR+qkPSmwIGNRYRdDU7qqCz6wjYEb4dxvGYJ55V4/gQVSp7tXgfKCJAOFsrJjV99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856161; c=relaxed/simple;
	bh=ND0ebtMtgG2oFEY74U8JFQQZ+pCiMd7ihtIY2d/33g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V8pOwAZVHln3mNFyIzddpCp9xt2WtYnfs7iT5rWz1joY0RU2X3Jn8zizaKFDlQis6IdEVWyFSqtbnW9nBOwlxzLH24f3bejay82mAXkh/TC4Pna2wbcPAoYl4QisYd0szg5G3xdSN9rBQkMiFs1W+/vSm7iQwamSNnA+BoWyNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNSQcqCK; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNSQcqCK"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12db2e415a7so2050705c88.1
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 17:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777856159; x=1778460959; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqgkeVGdbgXGvlU7ikkEcZEa18Qa/BkxqtfZd1WqbAA=;
        b=oNSQcqCKgzcgrEha8y332ajiMymmIU8IXujZae0wBFxCCV0V1BQzTEGXZid68XQ7UK
         K7ifmscc64qVlT07MGhr4jXPDuBTb2T2bmJakEadRt2PLuq80YBAzQI8hHqg/ovjYizs
         Joqs8Oz0vpAKa42+Ie6xoON5XwBKuMwdOjy5zB/h/rQy5aMK2hqX/IXMa2RihryajOnB
         yClGXO8jnl3maPw+EaJZYThIT8dNR61SNh1kXGmVYpHtzRbgvZynal64t6ITUySNFUY+
         fUi791KtP4FKjVWzKxTRmtk8oB/pzEy3mL+Wr+5BeAKF5wkTb/84s4NZtzJ59seiYldh
         ZrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777856159; x=1778460959;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqgkeVGdbgXGvlU7ikkEcZEa18Qa/BkxqtfZd1WqbAA=;
        b=a3dnJ0zK8k8osB+h7MUWDopYBTGc96qso6HGnXejtjIJTPFkugQBejFCXxLWOQz1wJ
         mt/nke6vL4rfOibU8pZL8JgzbLI4GImHIo4lUujSWBCa3sXFyLZOUYYUHYhF9qmEPq9j
         otsw16MSYy9RHwSBc0Xm1gLjlf21P0Kt65RXvanGRKRujiulkXN6wwR+5vabj9K9n50k
         LGN6NGr5Pu/p4wvJVOAqRFt32J4feX23PvEOk30/tzxB0tP4RprB8Zf9aRY26oIn2fjU
         Km4PaWh2hm57CkYlPbbhb/la1tsJ1jXzL4iY4Y1l9xSEHq5OJDu/0fvXJBaBlpxpoI66
         C0Jg==
X-Gm-Message-State: AOJu0YwEd2r05MVOtKlR0F9C2Z5pTruoNgrQ/PJxkJO1Lc96i/prfXK6
	zgtQz9nAbgZ+GV4cDbb9Fm/esD73aqB0qW7suMVDtENKshYV4lcLa++t
X-Gm-Gg: AeBDietHr5i/xddyCwFSaHzJ+2gDsCfysS+fhUss1DWJCV95fcbd9XOmTd+NcONLicd
	UUm8ZS6omkgv/byJeFgMIN5qVZ/ICMzJlCGmK5bYhgMnSSc4YoAgG0Ej2CRi1SYS8dX2NIMnskE
	cldVQ/Yzwu1FF7T5FFDpEdenjytheFeX/9idGFtfscbhKCLdCHiwXWV7zM1jHW+6v2bncY/lZKy
	qTpxWW4+8i4v7CXzVk1HBkJOp+kooP4XgFz4hn8kGl7AGKC8kP/2/2kudReP34SSQY08Mq8YQra
	y8jrpljISvbYBEnVoAtg+dPARZQOuoloiBz/jfTYceb0iJIL14cL9iGhNTorO7NU9sTsVt0eJ6w
	7LfNTXiDBmWTmsu5YQMalZglTpFdhTU+plb8Aa1UNWogGEz8O+m9fwq9k5pnJU/Z3EYA5vK0q5Q
	BOBygMp8MdHuVLgaHw8dRRx7Nynuu7KDT5GsFPEbYJGqVjHpMIf7pcYvpHiwnu2Vo7DoAI25YLi
	m4alINGU0aS
X-Received: by 2002:a05:7022:4c:b0:12a:6c4b:9cf0 with SMTP id a92af1059eb24-12dfd7d3817mr3789870c88.3.1777856159242;
        Sun, 03 May 2026 17:55:59 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm15864885c88.10.2026.05.03.17.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 17:55:58 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 03 May 2026 21:55:52 -0300
Subject: [PATCH v2] ALSA: firewire-tascam: Do not drop unread control
 events
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260503-alsa-firewire-tascam-read-queue-v2-1-126c6efd7642@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ6CMBCFr0K6dkxLEBJX3sOwmLYDjOFHOoAaw
 t0teAEXb/ElL997qxIKTKKuyaoCLSw89BHSU6Jcg31NwD6ySnWa64s2gK0gVBzoFQMTisMOAqG
 HcaaZoCCkyuhco7cqWp6BKn4fC/fyxzLbB7lp1+6NhmUawue4sJi99//aYsBAYREziwYzT7e6Q
 27PbuhUuW3bF/RSJHLgAAAA
X-Change-ID: 20260501-alsa-firewire-tascam-read-queue-7eaef1060adb
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ND0ebtMtgG2oFEY74U8JFQQZ+pCiMd7ihtIY2d/33g0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnf381hvCgkvttW5P7x8pn3N9Yp6sj2ix5csbL09jrHz
 dWPOsI2dJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEzlgw/PdR1JzJ/vPhxCz/
 k3cm7jdhDdzhmFswvYhty84ZNx/YXXZmZDgqJrv8qPDeGWsvxOj+sq+J/rbXa+N2zpsnOr655m/
 f7csHAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

tscm_hwdep_read_queue() copies as many queued control events as fit in
the userspace buffer. When the buffer is smaller than the current
contiguous queue segment, length is rounded down to the number of bytes
that can be copied.

However, after copying that shortened length, the code advances pull_pos
to the original tail_pos, marking the whole contiguous segment as
consumed. Any events between the copied portion and tail_pos are lost.

Limit tail_pos to the position after the entries actually copied before
updating pull_pos. When the whole segment fits, this is equivalent to the
old tail_pos update; when the buffer is smaller, the remaining events
stay queued for the next read.

Fixes: a8c0d13267a4 ("ALSA: firewire-tascam: notify events of change of state for userspace applications")
Cc: stable@vger.kernel.org
Suggested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Recompute tail_pos after shortening length instead of adding a separate
  entries_copied variable, as suggested.
- Add Suggested-by tag.
- Link to v1: https://patch.msgid.link/20260501-alsa-firewire-tascam-read-queue-v1-1-7baa4ba1a4de@gmail.com
---
 sound/firewire/tascam/tascam-hwdep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 867b4ea1096e..6270263e7bf4 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -73,6 +73,7 @@ static long tscm_hwdep_read_queue(struct snd_tscm *tscm, char __user *buf,
 			length = rounddown(remained, sizeof(*entries));
 		if (length == 0)
 			break;
+		tail_pos = head_pos + length / sizeof(*entries);
 
 		spin_unlock_irq(&tscm->lock);
 		if (copy_to_user(pos, &entries[head_pos], length))

---
base-commit: 9e8d6ddd7ecf2ad42d614243f86e50fcf0183b9e
change-id: 20260501-alsa-firewire-tascam-read-queue-7eaef1060adb

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

