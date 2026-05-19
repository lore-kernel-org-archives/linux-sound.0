Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8B2750ED
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 03:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160849; cv=none; b=Rbtz/gEQy8cYAs7Z/4C9qw08r1autg/SyZnqba/H0Z5YJwWmgTNR9Hxvlm56yOs4c+EZ6WEqTwi+WjTkqrPjY+rLZcStdR7UxEz0f1Flvh5j5e6VPm/hf4yro2ghQVOtt3k61aw8ItrKFiM5zZO6ydkO3ZlGDRXGt72I9ibmWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160849; c=relaxed/simple;
	bh=6ovJCIwwLZn121afkcd/89zOigrli5BIWjWHW4IyEYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q/h0p3FJWphOMpZMudGVcIOTLpSjzrjy/GzntR+dUcuN3YZCbdCV8JVaVkRrACWTxO2zE4dGSdG1cCqKEm+cqnt8Ednguj5/45hxQwcPJssPHitd6V1xrwTaqThwqlwwyFioUUHxxev2x24APDz1KCDCvDSNoNThmmMsRB/KtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPD4jdy4; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPD4jdy4"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f30a4601bbso2725038eec.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779160848; x=1779765648; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpraoA5lKj7fpo85IodFDYaegQ1/6mbajvu2cjV8zNk=;
        b=nPD4jdy480JtADPodZ3l/hvDPseZaHb/ndoyAhQUS3DZWl37lH0NP42u8I9np+pVAy
         44eGa/OtsaoV9dtL46oRofcgzPuJeBD+fkhI25zckHaJCedfuOh4yVHVVhGhvlTw4Yjr
         w0bnu74H097I6VS75HO7m2Di5zUoR6cK3ezhVCqad34IntU4wMTh0vkl+9VMYqi3mksh
         /WLF1tJAEjAjm+VYOwC+JM+wG72b03rlZsNSdXX5o4QMIFrDi+o3pvH0JEyyiS4nMrbI
         4N95BZf9sEixdqjiDSOAqlW1tDowTDCZLhUbLN9HOfJpIPn9LEgyAGshB0K8aBUS/gz/
         VhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779160848; x=1779765648;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpraoA5lKj7fpo85IodFDYaegQ1/6mbajvu2cjV8zNk=;
        b=jY+ylmyUq9UkmETZsmw9gjv+Mho79B/CP6mGCWMXFDJlzdlr3x1ZOHO3WoBsO99wgt
         YCm8LRaXm8WK/APCWUp1DCSlwlKkoKap0gBK5oS49a+y5pGFfLriPlt6xXugpIkZXRuC
         6vpsFw1VgGzCKok5yOl6xM03UMsE/FSBL2p4w/eTpaw6y8PY/Bdug1tnNipvw8HugZuu
         NovRmmKyjJ2J1nf1gXl26gBi0k/ewKFnBPpY/DC/9180ZPi0Ce4NDE8haVAOdF/19mD5
         o442LUtbj88KgZ+y4SHkO/xD3ysf76TgSwFj3cci3fvnijWv/qvco5iLz1NcWFgtVI9Y
         NAAQ==
X-Gm-Message-State: AOJu0YzS9gjOp06NtWojlYge1EyIOGdU7dU6GLPZCfw4Q+NR9fTjtNtg
	Ezexh47jMdwdVGdPK5WOLCuCAiGh+oq8n8y/zmAexqhTe1KpP/NHseWABrltXA==
X-Gm-Gg: Acq92OFQdGwivhu+kPqNs7B+yh3Awy3ePwAFQt9wx/VElNi3Cb3cgmu/44jrYJManLU
	1dY1KBH+/60PNxuAkmKAS0BCUeGxp2HJayQFIMvgwoXb8wCXY3ad3mv+MbC0u6YOxoJvOq+9cwE
	+IhkeRJYZ9GQjZDoTE4oklinqV5YE7Oz5oyfVVuphRQtHc+2KtwnDUqdeaV8a8tIUMf+3EtND6G
	fPQMSq0cVDnJxCQ9syNoDUT40IP2pi1h3ddX1Cj/hmsuffR/PbFbx9KNeBmwxIRS/DjIpcDqOTd
	QJGiiF5Uj+UNp0H5ziCE1LIaIi7R7lq3aMfP+6AUpOqeAp2aI0zVWN8S9crq7/ZKKCcheeE9Zfv
	caLkfLXXPplXVraI96v6e24FwY+MA3a39Zv48HHhuu4qqf0gy1IHqoaKdxUdrQjPx8j0bD2aUbT
	SDfEVLetjNyzMYATcJ5BVySH/UBDC7BdvFgYdkwQwsjXml5Ygn6lowrRV3Zl6i3p5Ec0kknGi/6
	A==
X-Received: by 2002:a05:7300:7490:b0:2f5:5907:3a48 with SMTP id 5a478bee46e88-30398285d3bmr7982153eec.1.1779160847489;
        Mon, 18 May 2026 20:20:47 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm19431427eec.1.2026.05.18.20.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 20:20:47 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 19 May 2026 00:20:41 -0300
Subject: [PATCH] ALSA: usx2y: Drain pending US-428 pipe-4 output commands
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-alsa-usx2y-p4out-drain-v1-1-8f0a4550bae2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJ2zQIXsW4GNpRxphCOpRgC
 He36vIt/t9BOQsrXJodMq+iMqUKe2ogjJQejBKrwRnXGu86pJcSFt3cG2c/lQVjJknYB4qD7a0
 /mxZqPGe+y/YbX29/axmeHJbvDY7jA3/C2lJ6AAAA
X-Change-ID: 20260428-alsa-usx2y-p4out-drain-9cadb1914706
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3421;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6ovJCIwwLZn121afkcd/89zOigrli5BIWjWHW4IyEYs=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnc13ntj7C1/A5LPdm1+CPPzbDGh4Yvy54q+35y6s91l
 Jvz0Tugo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACayXZrhr3Duhz/z2UwnPjs7
 YWmCJY/5TYW1cdMPvbshdfXI4/0c6msZ/pmfXcR96+o8/h79SbNZJTcer9JwtL3qds7265I9x7l
 UK5kA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The US-428 pipe-4 output path submits at most one pending p4out
entry from the shared-memory ring per input interrupt. If userspace
queues more than one command before the interrupt handler runs, later
commands remain pending until later input interrupts, even when async
pipe-4 URBs are available.

Drain pending entries while idle async URBs are available. Copy each
command into the existing per-URB async buffer before submission, so the
submitted transfer does not depend on a userspace-mapped ring slot
remaining unchanged after p4out_sent is advanced.

Also update p4out_sent only after usb_submit_urb() succeeds, so a
failed submission is not reported as sent.

This keeps the shared-memory ABI unchanged and fixes only the local
queue-draining behavior.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/usx2y/usbusx2y.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index f34e78910200..4190227c5a2a 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -180,7 +180,7 @@ static void i_usx2y_in04_int(struct urb *urb)
 	struct usx2ydev		*usx2y = urb->context;
 	struct us428ctls_sharedmem	*us428ctls = usx2y->us428ctls_sharedmem;
 	struct us428_p4out *p4out;
-	int i, j, n, diff, send;
+	int i, j, n, diff, send, len;
 
 	usx2y->in04_int_calls++;
 
@@ -222,24 +222,31 @@ static void i_usx2y_in04_int(struct urb *urb)
 			} while (!err && usx2y->us04->submitted < usx2y->us04->len);
 		}
 	} else {
-		if (us428ctls && us428ctls->p4out_last >= 0 && us428ctls->p4out_last < N_US428_P4OUT_BUFS) {
-			if (us428ctls->p4out_last != us428ctls->p4out_sent) {
-				send = us428ctls->p4out_sent + 1;
-				if (send >= N_US428_P4OUT_BUFS)
-					send = 0;
-				for (j = 0; j < URBS_ASYNC_SEQ && !err; ++j) {
-					if (!usx2y->as04.urb[j]->status) {
-						p4out = us428ctls->p4out + send;	// FIXME if more than 1 p4out is new, 1 gets lost.
-						usb_fill_bulk_urb(usx2y->as04.urb[j], usx2y->dev,
-								  usb_sndbulkpipe(usx2y->dev, 0x04), &p4out->val.vol,
-								  p4out->type == ELT_LIGHT ? sizeof(struct us428_lights) : 5,
-								  i_usx2y_out04_int, usx2y);
-						err = usb_submit_urb(usx2y->as04.urb[j], GFP_ATOMIC);
+		while (us428ctls &&
+		       us428ctls->p4out_last >= 0 &&
+		       us428ctls->p4out_last < N_US428_P4OUT_BUFS &&
+		       us428ctls->p4out_last != us428ctls->p4out_sent) {
+			for (j = 0; j < URBS_ASYNC_SEQ && !err; ++j) {
+				if (!usx2y->as04.urb[j]->status) {
+					send = us428ctls->p4out_sent + 1;
+					if (send >= N_US428_P4OUT_BUFS)
+						send = 0;
+
+					p4out = us428ctls->p4out + send;
+					len = p4out->type == ELT_LIGHT ?
+						sizeof(struct us428_lights) : 5;
+					memcpy(usx2y->as04.urb[j]->transfer_buffer,
+					       &p4out->val.vol, len);
+					usx2y->as04.urb[j]->transfer_buffer_length = len;
+					err = usb_submit_urb(usx2y->as04.urb[j], GFP_ATOMIC);
+					if (!err)
 						us428ctls->p4out_sent = send;
-						break;
-					}
+
+					break;
 				}
 			}
+			if (j >= URBS_ASYNC_SEQ || err)
+				break;
 		}
 	}
 

---
base-commit: 7c94f5e77906abd7b9ba81875ae238c802a187cb
change-id: 20260428-alsa-usx2y-p4out-drain-9cadb1914706

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

