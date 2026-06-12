Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F935A933
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260363; cv=none; b=H4Xwv1LkurkPzQS760Ii2AM/brZDZZyPRhnLxLvyGj4amUehSUPvMSOCSXjcUnlCKGj+LPGLq+KRgK8Gt7nNCqju+9btpVoRQiNU5ga68R4RkSfzU5tqJUMkXMmk5/bN0jd+sNuC07iff3U8J3T+Iqd4QMd0CKZ5f5B4R4C2Mk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260363; c=relaxed/simple;
	bh=+FQnyM6atRlxnFtODE0Ey6pLGi6euIRGfTlV98O6jJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcsxUENHeln9HA1RGVgRwBb4l2ZXtXqCXibN0DcUG352qYisYeaEkauEevIMNPFULSamhF31ekSO8ttZtzXBx3Lb1o5zxV6HYtqPJxeobqk6IuVvVXI9/VSOhdXgWVgEYrr2cErGwU4RZweXRmVlBwjDZ+y0TIAPxotGtPyv45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyxW/RN/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyxW/RN/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8d34c62765aso1042596d6.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260361; x=1781865161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2CDOKf915J2nQ8mg6yl/p41bldq4Ewf+f/jJFQZr98=;
        b=CyxW/RN/uPqwJ+e2Jr2Bjv8IO36Jb1YNRAMT9xTHyuAgn9AwUNz/HrobWX9D+WtEAc
         DuWBPFjH6FpkQbTL9kmrJOL7jMSC0Iz2TIUI7OIIJA9IIe3vzQLZS7cADustKVjUTFO2
         Uvx0X5FmgfKynlldkEvkrIn0JWv3/gWco8A013bLRTPRd1Bg0Uf43/gp6OWKfKrsN6EY
         pkFlnUM6aatSAJNpN/ryJsWqBygsHhhomVa6toEa9YnKEk3cp2rpjQyuu8I0R7z0xXiG
         9ZZ7NuA1U2HITN5pUfgZJnx5JcmCMve07HLGPch31P5HdNz99i8bazJOLUg94eAzoKa8
         3/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260361; x=1781865161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2CDOKf915J2nQ8mg6yl/p41bldq4Ewf+f/jJFQZr98=;
        b=ZkxQ7lO1KtKZ6v/E7V5UXTJMUvG88ccn4pxN+0eBOfsuTokqFQmuPe/k3n7MvkhyHc
         IQW7C3DQHmyfDDW7cwOk7m9CPnJbP3WHktGC2fCtmWsffGmMMyLEDJr6fX/knqMDoZLK
         o3g7wJDt/KlyxCa0gi2VYDlc9qY4Od2Qe4NjEnij2/APV4paoHHuvMl/ZkxNEVmUOebS
         Uinf76jL1+TOQ79f5OF2CXMUY+5rlQodOiEaPaEirNwxZaUmgb5pwWoqLdc5jGphiZ2b
         FoG5174hC1FbnehKY8Y+CfEtR/TYbWPcw0PqgK6NktFhOlCEggmaUkqf/W4gjawll9fh
         oqDg==
X-Gm-Message-State: AOJu0YwWR/P6ZInd/eNfUzX1g8fIXlKj8E6Yljea9IOXU2BSXP2DsKgu
	24Rl4vF/YmfMxD2RpX4EtQbZe4fvILmCs7EdO4j5mjFSZfSKlnoT5Fe21mxKQCfaeOg=
X-Gm-Gg: Acq92OFpjgEQbBr7sG8kvSMWcok+5eCa7iKskJMxsPp7rhmh44MhqGZ/UBHA18fU6hL
	mzBycTFIfXhW4V29Ws4ziG8+4Jwwj4WKoWdiPDQdrAdibxaBwIDRizZ2ARMmqxjrj9Bpp9nGVJe
	XGRp3m/cLAo8wcQT0M2BURUN4vf0G8OOoQMCtbp4NEOBppzjq+1OYNxdjQdeNlxsD/HVFJAKUeQ
	HCvWGGesM3oeJN0TvPpFaTxNZytZtpsYP0/DZL5+MDLZl9jYBSb15YU8R2Czx742RJti8o893yJ
	LOBsFUZ7xo/l59B4jVZNgDrJ6VZPjvlJQXkzLTcFrG7qOP+z1pQXOrl+GdgUquweBVv78fQS3Bs
	y4lATHP+e0xCyHEzhTqhvJK+1LBaV8L6O9s7fymA20IEafTK0HB6FOSGX4J5oy2TGuWfBaiT1GW
	ye24zKDOL/kbhjb7T9sTCclpl44TVE0Mg0BtCQRJtAI+iZ1bqPGR7vpPw4/HSbbRmKWUDJKJCz2
	oAnbmqwxpAdHrJEA00wgomrdrMgZelD88DKRyg0Mug=
X-Received: by 2002:a05:6214:5787:b0:8d1:d1e1:835f with SMTP id 6a1803df08f44-8d330343eb0mr18963866d6.7.1781260360812;
        Fri, 12 Jun 2026 03:32:40 -0700 (PDT)
Received: from localhost.localdomain ([47.246.98.82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d302211f20sm19547666d6.21.2026.06.12.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:32:40 -0700 (PDT)
From: HanQuan <eilaimemedsnaimel@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	HanQuan <eilaimemedsnaimel@gmail.com>
Subject: [PATCH] ALSA: seq: Fix kernel heap address leak in bounce_error_event()
Date: Fri, 12 Jun 2026 10:32:22 +0000
Message-ID: <20260612103222.2528305-1-eilaimemedsnaimel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above bounce_error_event() documents that user clients
should receive SNDRV_SEQ_EVENT_BOUNCE with the original event embedded
as variable-length data, while kernel clients should receive
SNDRV_SEQ_EVENT_KERNEL_ERROR with a quoted kernel pointer.

However, the implementation unconditionally uses
SNDRV_SEQ_EVENT_KERNEL_ERROR with data.quote.event set to the raw
struct snd_seq_event pointer for all clients.  When a bounce error
event is delivered to a USER_CLIENT via snd_seq_read(), the kernel
heap address in data.quote.event is exposed to userspace through
copy_to_user() in the fixed-length branch.

This is a distinct leak path from the one addressed by commit
705dd6dcbc0e ("ALSA: seq: Clear variable event pointer on read"),
which sanitizes data.ext.ptr in the variable-length branch of
snd_seq_read().  The bounce_error_event() leak uses fixed-length
events that take the else branch where no sanitization occurs.

Differentiate the bounce event by client type.  For USER_CLIENT,
send SNDRV_SEQ_EVENT_BOUNCE with SNDRV_SEQ_EVENT_LENGTH_VARIABLE
and data.ext pointing to the original event.  The variable-length
path in snd_seq_event_dup() copies the event data into chained
cells, and snd_seq_expand_var_event() copies only the content --
never the pointer -- to userspace.  For KERNEL_CLIENT, keep the
existing SNDRV_SEQ_EVENT_KERNEL_ERROR behavior with the quoted
pointer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: HanQuan <eilaimemedsnaimel@gmail.com>
---
 sound/core/seq/seq_clientmgr.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 4dda8268018e..0ac6d92058d9 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -538,16 +538,38 @@ static int bounce_error_event(struct snd_seq_client *client,
 
 	/* set up quoted error */
 	memset(&bounce_ev, 0, sizeof(bounce_ev));
-	bounce_ev.type = SNDRV_SEQ_EVENT_KERNEL_ERROR;
-	bounce_ev.flags = SNDRV_SEQ_EVENT_LENGTH_FIXED;
+
+	if (client->type == USER_CLIENT) {
+		/*
+		 * For user clients, send SNDRV_SEQ_EVENT_BOUNCE with the
+		 * original event embedded as variable-length data.  This
+		 * avoids exposing data.quote.event (a kernel pointer) to
+		 * userspace.  The variable-length path in snd_seq_event_dup()
+		 * copies the event data from data.ext.ptr into chained cells,
+		 * and snd_seq_expand_var_event() copies only the data content
+		 * -- never the pointer -- to userspace.
+		 */
+		bounce_ev.type = SNDRV_SEQ_EVENT_BOUNCE;
+		bounce_ev.flags = SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
+		bounce_ev.data.ext.len = sizeof(struct snd_seq_event);
+		bounce_ev.data.ext.ptr = (char *)event;
+	} else {
+		/*
+		 * For kernel clients, quote the event pointer directly.
+		 * Kernel consumers can safely dereference the pointer.
+		 */
+		bounce_ev.type = SNDRV_SEQ_EVENT_KERNEL_ERROR;
+		bounce_ev.flags = SNDRV_SEQ_EVENT_LENGTH_FIXED;
+		bounce_ev.data.quote.origin = event->dest;
+		bounce_ev.data.quote.event = event;
+		bounce_ev.data.quote.value = -err; /* use positive value */
+	}
+
 	bounce_ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
 	bounce_ev.source.client = SNDRV_SEQ_CLIENT_SYSTEM;
 	bounce_ev.source.port = SNDRV_SEQ_PORT_SYSTEM_ANNOUNCE;
 	bounce_ev.dest.client = client->number;
 	bounce_ev.dest.port = event->source.port;
-	bounce_ev.data.quote.origin = event->dest;
-	bounce_ev.data.quote.event = event;
-	bounce_ev.data.quote.value = -err; /* use positive value */
 	result = snd_seq_deliver_single_event(NULL, &bounce_ev, atomic, hop + 1);
 	if (result < 0) {
 		client->event_lost++;
-- 
2.43.0

