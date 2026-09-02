Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A648A2C2
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353466; cv=none; b=RD7h0wE14CYVGSrmn+7KdB3lj//awX2U1NYcd3e4ezocEMwrqkD72jv8GR5qTSU3tK4Q4CmW86kGydoUQBVaozaytNW7DdJdw9go8KEIL/W/E5Zb9UYmUbBs4jWlygzDdeZI6zzLkYFNmUGo7nd9i+Kz8PccB1mMEUoUTR+oUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353466; c=relaxed/simple;
	bh=ecEXFaEnVYmO2e9QRthYzOTSjlkOMF5vYVDqij9XjYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYXmc8l2R3T2U15gg1dydkcMVnOE/Om3R5eKTIcEQ1+haxCG0Ri+KN4WZjPZ+wsoFcFEnMyOO785yRXpJh6vV6TrU2RJLGNtSgJQhO2XMrg23PlqasoUlkFezXsnLblUTT9cJMq534itVwYQ0q8Q6+q+nAGuQQJ+wMk0Ovl+XT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btf7j+4U; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btf7j+4U"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso686259a12.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353465; x=1788958265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7SlBp/TfciBcHcfPFcBhzWo1fIummbWtE2eKXh7ROA=;
        b=btf7j+4UFuxC8r9oy2GI3vmN7AJcLH+ZVC5qUpgJWnVnrH3eeZYpAa4nN0E6Ck96i0
         ID0ftUa0hkOfzIg6FN447fVMsVs0usUxmeRLlIg1muRyVTwHFIXQbU/gf/bNhkcVdfsC
         gtMJp8fYzxNYjOMJrtrTwUoxtNtLocSOxwehHZo/Qrzc6HO3aoNQ/YdjxqROVdMY+OBT
         70vAtd1JI04F7rcFVTJKdmeH32KwBU9GOSYMBcIWsDnsJEqC8AgxrwTEpxFNGl6EUAY1
         5CFHkIVjuICogANQDEHMVg5Rd6doPNzBGje5QZyvrESCscmAhHFHXTdSi3qLb5NutonU
         rOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353465; x=1788958265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7SlBp/TfciBcHcfPFcBhzWo1fIummbWtE2eKXh7ROA=;
        b=r/eA8BVw6Q8JfGf19ntVQw6SHSv4MhZno9yxa9Wt8HVJYNo5/q7Qenu4QSw0078E17
         9e7tcG8OtqNnPAnzpcKPhldZKFKSWoDTq8F1uQYBPQFfzM4xB1VAAPSgqHxnpKwASQ5z
         8oyZRPUniXuUCq/cjkYsvmBNuVJW1AX8J4CUu498r4npLOLgSE5XtJrpqCmWe/MdfJ3j
         WRf65z6sbzRWdV3soLw/GPXvfbNpXG0Tpb4rUQpXnRNBoD96XKKY/YZ9bPp96SJllnp9
         ro2ytfZDbJu/UcJCzo39SzBFl9+pYCqQCmLVUM46O7N8bAlY//+cxrUALtfA4OcnxFIC
         l/mQ==
X-Gm-Message-State: AFuF++mg0zX7U1TrOT37bCdBa3isvIUhfAKz56COc56O3Z8Hn/4k/Vmw
	QoKqonuMfyQxj9PVtWB9bc9m03PtoOiF6C4BV7UaeerprVEHprY+1JZ5
X-Gm-Gg: AYBFou0oN4J2ArAw60mtUm+s1Norng194HumdwBM7k19obycOVAX1vrOGi7CjZ8rqYR
	aCJQKBSxgKLMYkTn2aSR70fvi7VoZlqJyWUjtvQDY7SDOfuKwuDwuGdgpp73Nlzt+Vdrfp1MgZf
	te4hIU2cfFDjYnIsMYwgS4cOGF1LnIO9wjxM49bmhcNZFm5hNyyGrGG5IurBozfdv+SRZDFHNi9
	8W5dksMg5RdhIYeMffm+APVNdq9cnc1nhsQaiydPjAGK/nlMQr7x2K04MBvLmF7NRISqwk4D9gE
	StRsUlPd+G/YtTsQZQGoAezTE4po4v18gF6hnD659Ybho1mgI6zkRXa8BKIB5zFBQxsdU1cVljN
	UnyxRbHqUPbJQDfAyBNQxKp/ASS3Ija6JL+SGUyaebMFgvxqrlNXBsQWrRocMXSIYS8AC+tgUj5
	Cm4TCy2oPeXHkb80+y7qlos74Ox1YTR8pOcGe7AYMUCcf1PkziiFK9HjoSN6B2pVXqxfKE3UiVt
	GHR1ZZmcnpHwj4GvB2LyqxgJWEMi72IKuWZBqxDQoIG6eirsp6s
X-Received: by 2002:a17:90b:3b8d:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39aedf55732mr6562063a91.10.1788353464642;
        Wed, 02 Sep 2026 05:51:04 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76463csm11856219a91.9.2026.09.02.05.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:51:03 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: rawmidi: Return the error from snd_rawmidi_input_params()
Date: Wed,  2 Sep 2026 21:50:58 +0900
Message-ID: <20260902125058.19499-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_rawmidi_input_params() computes err for the three invalid mode
combinations and for resize_runtime_buffer(), applies the new framing
and clock type only when err is zero, and then returns 0 anyway.  A
caller that asked for parameters the kernel rejected is told the change
succeeded, and the substream keeps its old buffer.

The open_mutex conversion turned the early returns into assignments.
It handled the output sibling correctly, which still returns err, and
left this one behind.

Fixes: 94b98194b62e ("ALSA: rawmidi: Take open_mutex around parameter changes")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Reproduced on 6.17.0-35-generic with snd-virmidi:

  INPUT  buffer_size=0  -> ret  0, errno 0
  INPUT  avail_min=0    -> ret  0, errno 0
  OUTPUT buffer_size=0  -> ret -1, EINVAL

The same rejected parameters report success on the input stream and
failure on the output stream.

 sound/core/rawmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index bf504e27f73e..f9cef3c61861 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -782,7 +782,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 		substream->framing = framing;
 		substream->clock_type = clock_type;
 	}
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
 
-- 
2.43.0

