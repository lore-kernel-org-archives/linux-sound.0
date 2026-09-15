Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7E490C02
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489877; cv=none; b=ql+JX0RqtyHiQX69ca4is0CdXfugJtV3tETX7fsFwELUOO+LOyrfULBxy64fYAxOmysrMF/a5KzY1BbuH9M1e+ekcIWUZis26sNaD/A0otcsJzS7Ec+E+QdScBVYW1VUtfYf5Rm7xYfwOjx56wwiKGMcLzuspfoVO1eZ5Mb0A3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489877; c=relaxed/simple;
	bh=80n3tfYuEANnfzm7jfaXgvVPvVKUbj3uTk8/YY5QfKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gztxPnfoiAXDglnNxmwx8tf4W1PJ/7L5cEa6jNwkipiTe9GbuQ7Jtv44DMHJ50HKcfL5JYGk1gNebmQAFKhOfTZXFX/xo4NrLiBc4KRYx0DCtd4XtVgDzRFOIqYH/kNJOBpdpVGiOG3ttQSQSBiyn+ziOSwkWWmO/Pkhh3voSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oX/qHh0S; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oX/qHh0S"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so45795345ad.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789489875; x=1790094675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nZWKo9m0suBnbTBMN5IZib71uVUZRvrzGyUsIFxWTSk=;
        b=oX/qHh0SipuOGcBP96kAeYJfZYTcN/+O1uMxA/4WfF2FtW3N85hZ39HIOaDFkooUcM
         cf4AuBd0fpM2rGQuWf4xGFcelUvFLTI5yGhiMmWo9uD/G2UGQ8Ktk+RNaYALk6Q8126Z
         H9LXSJg3V8sw/ZZgoqvSYuDYG0Xu6rlT74CmayrpJUhjCJYAySs6VEZV8DFLzRiUPUfO
         bWVE/5ewycEWSAUZ9izGcvFApw3BldXLQUYyaR1HoyChmeHIiSBRbaHmO0jbuzFvlE8z
         r9cKDjN33JzBsPPs9ENC4K+q2/ZJszs9e8mI4e2nw2Ot3eloNMG2ZGJVWwKLOEfy6Sld
         13TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789489875; x=1790094675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZWKo9m0suBnbTBMN5IZib71uVUZRvrzGyUsIFxWTSk=;
        b=olaNYRxlOxbInuAwI0KirGNd/CV5hZ6wd0Q+R88zVOOZ0VN5CqXQlFGPi9OWLw1Bfe
         JHiRWPUMnrOTWinOW94ttIe153RTmTG5iPx8KtXV5cKwbeFHmTezoYVuGO9FaqGidECQ
         capWu2hWWRhnoo1Z9RewpDQICOpO0yYWK7TJJVsPGh6pHNDY5hS2616qdYIjBsIMp2Ss
         Cd7L2MQ9UFG/1MUdQdU9N1gXVkpS9fbEhAz0VwraU3JAmE25dGk5MM0LCB7R9ddQGBHK
         HskBU9V1vw3nGgW+ZDxgJRUlpp2K2FY1ZzmLqFnJ7+JrYEh4whr9835wtqVd0xhyzGOC
         IGnQ==
X-Gm-Message-State: AFuF++m4AR8v4TbUDTwmqMWTbPpxMTIN/u3ZjL0HQDeNN4NGuZYq8DWW
	jjz075aULqUEYCAM9qaev7zPFwXU93EZ9+c8XM+UzD58slXvsJjvdxuEE+/F3w==
X-Gm-Gg: AYBFou3XZH4c+Al7iusXUTNX5w7xEp9qKB05Zx1Y23xnDtgoSkYfR9Sn5C64vnGYOYk
	Z7Xz8ToFmIcXc+ZZUnr/1mZjICgPoG7lJZWXQS63K6wuLod69CKQMm+4WnP/D9q4UzQJkydm+KG
	zveaiVoAQwhRX+k5wMN/0E5nE4dA/KBhy9BbbpT1KCcfEP4BHkrD2rCbK4nbenS+CKDWtMniDzb
	q/QVJYexni9JGzXynXg61JJxtWJ/2e4AGyEdA7oi2LV7vMwDw47Gab189E0ql5U0qDQOtMf0jeQ
	qUsPyGCrFiwLHj3Fr32JcFNwrTqt1cpyvI7tGcKQ9+ZEh3+KYVqDJMmkJAylPjA3Cqn/VuHlgBX
	YycPV8d5gg83VJXGRr0Sxow3dQJuvNBGzGs0TnxGuvvUSSwjeQ8XGe2yLjTRbLfgVn9AwRbrLAM
	Nt2GelH95VQGMhw//r9yLgTj/6OuuP/MfM0PQPmLyKnmVfHf1W8LLDBP6vjAMolR5R0io641z+a
	i4m6KTxjCyXcnemgQ==
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr154059085ad.17.1789489875278;
        Tue, 15 Sep 2026 09:31:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2bac:b2b4:e60b:1459])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cea0362sm71652605ad.23.2026.09.15.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:31:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	syzbot+9fe3b8d9f5c64ff410a7@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] ALSA: usb-audio: fix list_add double-add in push_back_to_ready_list
Date: Tue, 15 Sep 2026 23:31:10 +0700
Message-ID: <20260915163110.58124-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stop_urbs() clears ep->ready_playback_urbs with a bare INIT_LIST_HEAD()
instead of unlinking each queued snd_urb_ctx. If a URB survives past
wait_clear_urbs()'s forced STOPPING->STOPPED timeout, its ctx is left
looking "linked" (stale next/prev) even though the list head has
forgotten it. When the endpoint later restarts and re-queues that same
ctx onto the (now real) ready list, and the old URB's completion
handler then calls push_back_to_ready_list() for it a second time, the
ctx is still the list's own tail and list_add's double-add check trips:

  kernel BUG at lib/list_debug.c:35 (list_add double add)

Guard push_back_to_ready_list() with a list_empty() check so a
still-linked ctx isn't re-added, and make stop_urbs() actually unlink
each ctx via list_del_init() instead of only resetting the head, so a
dropped ctx doesn't keep looking linked to that guard.

Reported-by: syzbot+9fe3b8d9f5c64ff410a7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9fe3b8d9f5c64ff410a7
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Note: I was not able to trigger the actual crash. dummy_hcd doesn't
expose isochronous endpoints by default; after patching that locally
for testing, 1600 PREPARE/START/DRAIN cycles plus a
WARN_ON(!list_empty(&ctx->ready_list)) probe in push_back_to_ready_list()
never hit the race window (wait_clear_urbs() never logged a "timeout:
still N active urbs", so the forced STOPPING->STOPPED path was never
even exercised in this setup). This fix is based on static analysis of
the reported stack trace and the stop_urbs()/wait_clear_urbs()/
push_back_to_ready_list() interaction, not a confirmed repro. Sharing
in case someone with real hardware or a working reproducer can verify.

 sound/usb/endpoint.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 0835943d7b0e..ddbd8ab22b50 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -449,7 +449,9 @@ static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
 				    struct snd_urb_ctx *ctx)
 {
 	guard(spinlock_irqsave)(&ep->lock);
-	list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
+	/* ctx may still be linked: a stale completion racing a stop/restart. */
+	if (list_empty(&ctx->ready_list))
+		list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
 }
 
 /*
@@ -1036,6 +1038,7 @@ void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep)
  */
 static int stop_urbs(struct snd_usb_endpoint *ep, bool force, bool keep_pending)
 {
+	struct snd_urb_ctx *ctx, *n;
 	unsigned int i;
 
 	if (!force && atomic_read(&ep->running))
@@ -1045,7 +1048,9 @@ static int stop_urbs(struct snd_usb_endpoint *ep, bool force, bool keep_pending)
 		return 0;
 
 	scoped_guard(spinlock_irqsave, &ep->lock) {
-		INIT_LIST_HEAD(&ep->ready_playback_urbs);
+		/* Unlink each ctx; INIT_LIST_HEAD() alone would leave them looking linked. */
+		list_for_each_entry_safe(ctx, n, &ep->ready_playback_urbs, ready_list)
+			list_del_init(&ctx->ready_list);
 		ep->next_packet_head = 0;
 		ep->next_packet_queued = 0;
 	}
-- 
2.43.0

