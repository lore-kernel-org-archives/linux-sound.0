Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E038F22D
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257935; cv=none; b=rK0W03W74X905IjFdtblE10TsjET1ydo8GTc87sGLFGr/hHDDrxsUT6cx7+Hou9D0VXeRchWfpCLUU50adghr5b6n2RpRpm1mk+oyKexcdZmXO7eRUkP96+rhuw02WnTMILV68uOMsbn0pGzvyCTIEYgPdoWOkQDI+D7GaEp99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257935; c=relaxed/simple;
	bh=anz1ToNpFKVzUDh7jTcBYy8XV/g88YgN/mz66Rdp+is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArV2qe1Gjp+DZQ8a4meCfRxAlIn/NrH8TbiNxUpTPCeWph742L9uEVT9Jeu1RYbikiRFcKfE8JrasxCWImhYwWF0gHXhMcm+mEkWEf1AqLeKpurQXfE640JzBTFX46nJmgS9Fv0ThonT9aRa+fHCsKgICoy4f3NgotZrcEL5lcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU12PTIu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU12PTIu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0aa420401so1992385ad.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 16:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782257934; x=1782862734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw6+3fh/QLPaU0s83lcitL0HJwJ4R/4raPAKb7sIerQ=;
        b=UU12PTIuTkt9361I5MS3m8DEAXydtZEozHHYwC68MlioIftlRs6xuGJxvd3FmgGm4/
         DP04PK2uSrVgkfXPALSrpD06ou1Rc0ib9yYMcbWRpsJxT5PdNUUodbvwb09Y0hPRzM+D
         ghU0CcwcQIf9IHfbcxqivdu52TcRiEYLT6mJSr8mawjCyZjnYNaLFAiVITKG7Z95N7L1
         MERnxf+11Cns3HAow31iozyPGvEe6dgymPrUKoVDTeUHOEbTF47NjDGlAM3HEYjcoNDx
         ZSZwSQH6hmzV7No/TetCdKnwpFXvOdkweGhNZ1g8mYHmrDxxZjerX6w1ePsjjBgS9AAo
         h2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782257934; x=1782862734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw6+3fh/QLPaU0s83lcitL0HJwJ4R/4raPAKb7sIerQ=;
        b=kTUqnJO+5sDXJu/uypkPa4v1o3fnX8uc1o5bUWMyu2s4UP1gl/miYJ/mxIWvcP9dVD
         vgh/9wJvjwzTlqsXvREfRElK439/UUJMHoPDU3ScD+EhX8LA4AZIOH+FYAc0DxxwfJVx
         LcXMRjyzKPi3/bLFYrE4PFYv5aDxAM/EN8W4EZ92XCXNmWcUP1SAk3wyJj8DzB+t+MQJ
         CyQFeVfo+yN0YL4a5uE9EsTz1YEIaZRW+hSyFEKNnymb0PivjAZTZ8nP+41ZkxJP3LNd
         mYcCf9xRshIcbDx8Mort+bPp8+62eIi/lnrXE3JNa1++9BbgWBqkkiGzUAeuk4DPLyYx
         7WVw==
X-Gm-Message-State: AOJu0Yzr3gn9m1iTD5vWPVshl3e4GAt2MqyjIB15vgeOXjV6VO4KWekU
	mtLbisJjuvClIaLlJzV0WNUavroAuB/QlfmgFeI55JlZPRYCz/qDPpi/W0T2eqmY
X-Gm-Gg: AfdE7cm7zmngMSNYZg1d6r9XzkvrC0lIoOCeu/bn5Q1ypgeJCFjVJKbb4atvTdtjC/4
	qsgWXybBNOAiB0xfjfpwiH70DcykW3Ye6xf/8SUxnOrbMpIA7ruX0K1IYVl2ZAC6hhRtDsmI265
	5C3zHy28B3PjPc78at3HS6e/xJAw0rM4ZEuS98xRX4PeFNlS0yzzv6RWB46dNOXdZLjS++SKNC0
	sCpjE0IxKuVgRzGxzYGIKxSyl9qU83NnIPhAUIVUOHO95C8P+5L7SdPKntJNSssgIJl5QqM6e4E
	bZVJll31e+Dtq34r35OHy4sZh6HI/6QtbO6UgEtono75SF6LLu8VFw8Gat84r95Ey1mfyL4AFSv
	nu9tVzKDGj3NxbFcCTO/ZhwK+n876ioLsgrKl12QBpA/106egk9gHlgs1eNycrFVjT0v6e/Ri3X
	uqE1kPdlfOs8pzb3r1IYjyScPKv6A77FRMyClCt1m0Bqtau8n48PUTzz0i+GUYWAcfdabOOzH0X
	mSy8A==
X-Received: by 2002:a17:903:3bc7:b0:2c4:608:167c with SMTP id d9443c01a7336-2c7c759693bmr52363295ad.6.1782257933696;
        Tue, 23 Jun 2026 16:38:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d6c16sm119647755ad.23.2026.06.23.16.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 16:38:51 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix uninitialised heap leak in snd_seq_event_dup()
Date: Wed, 24 Jun 2026 08:38:40 +0900
Message-ID: <20260623233841.853326-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_seq_event_dup() copies an incoming event into a pool cell and, in
the UMP-enabled build, clears the trailing cell->ump.raw.extra word that
the memcpy() did not cover.  The guard deciding whether to clear it
compares the copied size against sizeof(cell->event):

	memcpy(&cell->ump, event, size);
	if (size < sizeof(cell->event))
		cell->ump.raw.extra = 0;

For a legacy (non-UMP) event, size == sizeof(struct snd_seq_event) ==
sizeof(cell->event), so the condition is false and the extra word keeps
stale data.  The cell pool is allocated with kvmalloc() (not zeroed) and
cells are reused via a free list, so that word holds uninitialised heap
or leftover event data.

When such a cell is delivered to a UMP client (client->midi_version > 0)
that set SNDRV_SEQ_FILTER_NO_CONVERT -- so the legacy event reaches it
unconverted -- snd_seq_read() reads it out as the larger struct
snd_seq_ump_event and copies the stale word to user space, a 4-byte
kernel heap infoleak to an unprivileged /dev/snd/seq client.

Compare against sizeof(cell->ump) instead, so the trailing word is zeroed
for every event shorter than the UMP cell.

Fixes: 46397622a3fa ("ALSA: seq: Add UMP support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index ca9f6db0022c..209b08c2a940 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -364,7 +364,7 @@ int snd_seq_event_dup(struct snd_seq_pool *pool, struct snd_seq_event *event,
 	size = snd_seq_event_packet_size(event);
 	memcpy(&cell->ump, event, size);
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
-	if (size < sizeof(cell->event))
+	if (size < sizeof(cell->ump))
 		cell->ump.raw.extra = 0;
 #endif
 
-- 
2.43.0

