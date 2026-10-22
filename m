Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680796;
	b=BWUdjZ/9SyN8Wt2o1oFEEkXkDlVLvFYB5zIr7Z/uHCInZY9ZAA1M4XoH1E/Gob+iw6x5
	 k/FZYnUD6P5kW/rpFQBxtXXnJdb+8xXRWfpF0sM4kM+n/XOUT8mEq5+2xEYocdS+db1Fw
	 GMg39yed0AwXE9diaoGL5dc3QnzAnlenzY3XyVzTMJCO1h8mlA9scoGyzlfH+i6uwZZbO
	 y5ByM1+qy2FC7H1w4WDEiaVE5wBD9AWdhNSonpKvwyqjIYiGgyi/Yb7B6ztvS3QQ5lLAw
	 K+58idgCQw2MNeILY9f5+ijtWrTptT+jjucFRUc6N2kTnDFvAkrRdbdTbcOWPDivgYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/yNVkqf3xuwySUyAz6gXRTIRjMa4L8eTvwqGMoDFidY=;
	b=NlhOWUWElYrocfcSuYXIs8kXxcguFSghiu8D5cWIhQSKbtBm9q4LgETBvmCDdOSILZP7
	 II6tKhNRf0lNE8jkZm0xQcd/BC880Qoj/b/heL3a8ZjaM4QFweaBW4CZw7Ppjtto6+Lcn
	 SGWgYAgKZr0o6SYLzcvu0M5/QYKZ4KJ6eLR8qngCvDWrSSFdG/5q9v979pEFPMpDZRuAS
	 kof76eqsjgzaYsFutnsvBuQH+9uU1A3G0CzlRSXJdeUHvnNSMCD78RWX+kAZyYWDNbu8I
	 dvMGU48wwvR8RWM+KU7f/SGg2qsc3fXi+mkc+vJcMt4juTDkNnhBKuMiCl8DwJadUlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rUQH0zjC;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37903606A321
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 14:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37903606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rUQH0zjC
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1594561a91.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680795; x=1793285595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yNVkqf3xuwySUyAz6gXRTIRjMa4L8eTvwqGMoDFidY=;
        b=rUQH0zjCv4zb4xaQFQv7sWsT2TO25jiUvyQXd7+cAR/Hy+YLqB4+WWGyMilgU46fUC
         WUi3GCJoLYqzs1ezDNAAZ50aFJ4dNMbUVPGLNNJZGB2fb2wERPe70uYbeTUbfMMs5Cun
         ZG0n+/ytBiTe5T+86s/aqlQ2jLDHwnFCBSTAp2kEey/QsVWtLEwn6i6b8eKZ813GVjlh
         Zk6A4C4cM6kBXzEyknywJx3eXDOP5CYKZh09ZnctJX1Qyjw/RpVWw0KBSuDlECxgAydn
         jwuEPkpV3OXFyBl+JZR861h8umK9lD9Ps4rplzbS4s+F7H24VLqdqQ4q1/QQ2aLlE9ZH
         B1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680795; x=1793285595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yNVkqf3xuwySUyAz6gXRTIRjMa4L8eTvwqGMoDFidY=;
        b=nBzWybd5CMM/HX44rOECo6/7uZn+NmRMq5EsKC1qs7QmYW2SmLUJtTI2gcGV1jIjdI
         sdzluueEWusPUis5+abES5CFcnD/fPvs1CoDCJzjvq5bEFB6je+FSoY+Mgzfnwi4KGc0
         EhKTd16FyqhCfmPoCYfvWRIZo9trhuBrkcb5BGtz0g+vrDksn4vL47oWa5mc7XqEW0AU
         XPvKiQniko1H0TaF6ommtf+rKW7BadQnwm92sL9lVU7mYtMxpjCZOk+Xqd+0EFcJjpIw
         jzGXHlBF0Nkcd7gfoW4ZKi9S8ScIngqpG2q+K26mTdkqA5tI2ZqRhYFadITEhMt09UfZ
         Jh4g==
X-Gm-Message-State: AFq9FYJD97sR2R8HqHsTrb7prR7AVP/8//De2KZu7m7Hfrlbs9zDfXFE
	YIYnzjbxvA1w42EHCitxbrHOtrfGPUknKBY39SJaegovBcwK9rAPlajm
X-Gm-Gg: AYBFou1RJMkZJPB5Qq7FGj6I+If1l/xuh7RvD0SgR/bQ/cM132okHqd5nw0Y/2xtb/a
	COXezFnjD0H3huj9dkbZukNyy99VxTpOk0uFOVrOushkqCyhTJV8lp208XxMt1DD1k97B8Kkzqy
	3hiOS6jgJvyJmFvAP63gsnWaBOSR80CNi3eiMdg4Rl2pqnxYk+foA8nLdmruhjiLxtfsh8fFC/t
	OnP0APXKkAV89IaZW3ffX/QuQ66PvKwQHLsujCFl4QLsu7j/YVFVPYrf2eP1wVwr0sikp0RSCCi
	FLJVNxxesPVHGE+S0OBZTNt/+/Y3VIdff3TAirjNnOKp4BEh+WuX4KgfA9vRqhxR1t3Uxh5Hqk0
	gIWOkVLCwGI7j8XoVCAMRzcjHDTIGWYuCCZ0/gLjlCid1Rn4fWIL9lyIgmcyN7THaAfmD0lDCgt
	56KHhGFcLXLz/djqIiNSc/J6YxYLiDCm5XsjujB4vxx5zHmTVCti22PQKt2MRN9lid5y83nROga
	8SaBg3mfWCPTiI91pjU7cR9+PpujPL65yCUuwRD/G63EV+WXu4wUpHr13OLcayN1M0/G6qj
X-Received: by 2002:a17:90b:2812:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ad86f5ee54mr4870361a91.32.1792680795485;
        Thu, 22 Oct 2026 07:53:15 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:15 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 3/3] ALSA: opl3: Shut down the timer after draining sequencer ports
Date: Thu, 22 Oct 2026 22:52:55 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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

The delayed-note timer is independent of the sequencer ports' use-locks
and runs code in snd-opl3-synth. Deleting the client drains the event
callbacks but does not cancel this timer. A direct fixed-duration NOTEON
without a subscription can arm it without any unuse callback to stop it.

A shutdown in only the native port's private_free callback is too early
to finish shared voice cleanup when the OSS port is enabled:

  Sequencer client deletion          In-flight OSS NOTEON
  -------------------------          -------------------
  drain native port
    clear native voice aliases
                                     snd_opl3_oss_event_input()
                                       refill shared voice array
  drain OSS port
    clear voice aliases again
    free OSS channel set
  client deletion returns

The per-port voice cleanup prevents the timer from dereferencing a freed
channel during that sequence, but a queued or running timer can still
outlive client deletion and the sequencer driver itself.

Shut the timer down synchronously after snd_seq_delete_kernel_client()
has drained both ports. No event can then start it again, and shutdown
waits for a callback already running and prevents callback self-rearming.
Do this outside voice_lock and sys_timer_lock, which the callback takes.
The probe initializes timer state before publishing ports on rebind.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_seq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index f711139c5067..6b343b73c66c 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -271,6 +271,8 @@ static void snd_opl3_seq_remove(struct snd_seq_device *dev)
 		snd_seq_delete_kernel_client(opl3->seq_client);
 		opl3->seq_client = -1;
 	}
+	/* Stop the shared timer after all event callbacks have been drained. */
+	timer_shutdown_sync(&opl3->tlist);
 }
 
 static struct snd_seq_driver opl3_seq_driver = {
-- 
2.43.0

