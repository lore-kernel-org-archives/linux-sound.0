Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DB4746B5
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270278; cv=none; b=H7b8zxBlgEfOOCa8xesrs52xoVeuAQwDAwuy/i+oeUhuIQTpzS4Srse29UYQPey2zjPe2tQMjljYX21xQTKA7eHfLiRALlWRvlQ/skKuHykFnJiBMVXMY8L9gvWiXlfSpvWgnoPABDeU9hRAbU8xSsqqIN3c5Csb1P2sbDTNYu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270278; c=relaxed/simple;
	bh=0C8Tq5YfGX8WpFK4ZOwqBmOj+yCq8Q83lfGoQo9S19Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nrD5+gDh6pPedglRF7/nAlFpvz63W6uD3ayOof8pbyhaAMOYlRUUzIQTMjFE/h7qHtv797avyQn/UaYVSefOST+ZlcJ5prhpAX7yPwV4xj6Zybhpk8wwojylYzWElTwOrdsgm4wG9TbWVvcU6mJep3W6LIuck7H2+dZgzKxuLlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h5DSyVsw; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h5DSyVsw"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1608842b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785270276; x=1785875076; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvfS7+DfF3iiBgb3oPyQP0D1CeHx3J7Dwnq1yIu+FCg=;
        b=h5DSyVswgNLoFDI8Yj57klgLR8G1gVjao8L2ooqeEfT1uV9aT3sCKqdj9q6aWx+tHk
         9zRRL7x4FHlgYqwEmoQ1e6ixT8+oUYsiSPKHcHe+/pQJgUChRDPqGt1tdKD0Y+Dao+Qu
         zixw1kKj3BqzSC5+XNh5EAHGYdR2QfETCEysGuIM1RZNEVsKIOh6yBgNVegRVMgMf1DC
         HseoJb935ofH67LjyRZRQUi5m36PfGL8VX/V6kSWdv9JHPWCb3u2xvk3tRVGDXPj4+ms
         hhmnlrv5t7KGjDLIOgp884eBGzK4ES0RLWiOdTm0K36b9V8D38tGdVnzINYpaiph7p2g
         54nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785270276; x=1785875076;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvfS7+DfF3iiBgb3oPyQP0D1CeHx3J7Dwnq1yIu+FCg=;
        b=Nqewn7ISzgRNU7N2gEkqJRhhJ0PYain0uoYWoGhd/qxcoZI+3MFrbjlRkX+klVa9/V
         ODKgDBeJp9zaBPB15+FC3a5xkhEXCEYNUWc7qfDgqFS9Lpnd5eALwbvE44mpxx/6/ocA
         yfZVDbijWX8VwmiMRfsLrpjxv1T18YfR/FqNYDKo1HqWr0/EjjS2XSJ5YYfD5bdRPKn9
         /FZaQZP9gJRtfuoAlM2ioLUSpd1+N6hoWQCx7eMFDy5igMEmOKaL1X82ixeTA94Dyt0H
         AcIjTh1ycE+rbnitabUPvZR31Q6gBCiWxQo37Cp9vr9kKvr9kh7I0daPnsMPKIAqtBH2
         ceyg==
X-Forwarded-Encrypted: i=1; AHgh+RoZ5UDgr20KK0FXYivCcuINQGqMxvKGgLohxvb4fkchtS5CBCeS9tUSKwPy3ZJ+XpGMyJdTxCOVsNdK9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmEZI58pexXGjfziCWTbBKWdKihf6cHTEpqoVl5WQXlLukbP3
	B8GvrUBYXeW3u9LtORO2u8FADkB0I4b50s6J+PluGyc86mVD7zieWFm3yq7n9xVqZdBpQWtBZOD
	hWn1LcRoYyZtSJqBtEhSYwpVFNrKMsVw5Jw==
X-Received: from pfih13.prod.google.com ([2002:a05:6a00:218d:b0:84a:2e3e:e52c])
 (user=sonalipradhan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4ac8:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84e931249cdmr3727958b3a.14.1785270275858;
 Tue, 28 Jul 2026 13:24:35 -0700 (PDT)
Date: Tue, 28 Jul 2026 20:24:32 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728202432.2354994-1-sonalipradhan@google.com>
Subject: [PATCH] ALSA: usb-audio: Clamp frame size in implicit-feedback mode
From: Sonali Pradhan <sonalipradhan@google.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: Eldad Zack <eldad@fogrefinery.com>, Gordon Chen <chengordon326@gmail.com>, 
	Kees Cook <kees@kernel.org>, Jussi Laako <jussi@sonarnerd.net>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sonali Pradhan <sonalipradhan@google.com>
Content-Type: text/plain; charset="UTF-8"

snd_usb_handle_sync_urb() scales received sync packet sizes by the sender's
stride and stores the result directly in out_packet->packet_size[i]. If a
connected USB device sends an oversized sync packet, this frame count can
exceed ep->maxframesize.

The un-clamped frame count then propagates to the playback endpoint queue,
potentially driving packet transfers beyond the endpoint's hardware frame
limits.

Cap the calculated frame count against ep->maxframesize in
snd_usb_handle_sync_urb() to prevent oversized packets from entering the
playback queue.

Fixes: 28acb12014fb ("ALSA: usb-audio: use sender stride for implicit feedback")
Cc: stable@vger.kernel.org
Assisted-by: Jetski:Gemini-3.6-Flash
Signed-off-by: Sonali Pradhan <sonalipradhan@google.com>
---
 sound/usb/endpoint.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 24cd7692bd01..f127eaf2a1ae 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1817,11 +1817,13 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 
 		out_packet->packets = in_ctx->packets;
 		for (i = 0; i < in_ctx->packets; i++) {
-			if (urb->iso_frame_desc[i].status == 0)
-				out_packet->packet_size[i] =
+			if (urb->iso_frame_desc[i].status == 0) {
+				unsigned int frames =
 					urb->iso_frame_desc[i].actual_length / sender->stride;
-			else
+				out_packet->packet_size[i] = min(frames, ep->maxframesize);
+			} else {
 				out_packet->packet_size[i] = 0;
+			}
 		}
 
 		spin_unlock_irqrestore(&ep->lock, flags);
-- 
2.55.0.487.gaf234c4eb3-goog

