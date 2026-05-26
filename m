Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0F21FF2E
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799724; cv=none; b=dkrhnJrchmRGslzw4tlz3M7OhRkuU3vurC12fjEabuLqYDH+tDGEr599Gjr9SDkRQo7q0XhtjD4BxOpfUcvvcpOkITkEaRqSQYQj8KZitUOqJgFT2SbQGA+1zTE8XFWozj2E7TUMqP8G/7xrx7tMVbEHBhN23kUYjZSbwaY8fp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799724; c=relaxed/simple;
	bh=WzcH2Sbtw60mkU1iRWe1iTMpo9hq4D+yg6klUsKkNfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KULHSnW2kb+7fgifLDnqCHekneT3bAIrMnECqRbILFKfUNXfiI9JZVHkm/SiNd1Vj7dB5thhLKlY3/G2pDWMWJTTIyP7S7SGhZrktwiIW3Ltxb4GcmGv8fKd6U48c2Gz85vfZ8yh/f7IAmOGZzY6ddh351E9MT6+Unf65a4RhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRLFn200; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRLFn200"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3045c195251so3638873eec.1
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799721; x=1780404521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SeoXPiG4SB9SK2Lj+OOHLE9VbLHbVVD8iNOr5ymQzc=;
        b=NRLFn200RLgBm/eG4bRdPWem1gpmo3izXZbzdVkBZrvOaleeB2/MM9nlBm431yYk0n
         Iifg0c+vJqzkgcOwieX3GYWytX83HQ5FAyZ5TdGexiXycXVSdycpdZZXek2gcH9RZegi
         JWKV35sWItMbNIQ3u2GyuWPaM7SVi2WJh6ptatKCi6pOb9RznSgXKnQ9F/ockp0Q3EIg
         0lFbcbDYWYoGdo1NWWXXKqkkVKrZRxwgU1BtHB9HKNJ55P5AS48mv1MtqWkRxEs9ilpu
         YIdAEGEaRXZaxJDA68W0QQRRqeGGR5fRjuLUNi4h27ce7/7Wpn8jd7DVjAh/32q0jT+k
         0UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799721; x=1780404521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SeoXPiG4SB9SK2Lj+OOHLE9VbLHbVVD8iNOr5ymQzc=;
        b=oAJ5dGqOcfHwYfgVmxDlGU6HuMOzVPzdCfTOiUz6Buyi1jfWvphYfeDfifqJY0Bf46
         bFJQ1PNeyyuvEQQgWEaSVFIlN0Zje8P5w6ZDoxHGBf1GqTZnWeT4jazJvMjNpFw3uP4l
         3/93MgIIrBD8Crf2ONggtrUjMwfcqxeaSrfjPBRb+PwMDAx/V4iBOzAEjUcYW1y8At2c
         sgZQbJqqPNPHtY7lIoneDvfQ+fP1EQBAHzNqBSGQLSjUBQdmjbcp1HIymMJj6+++XbQp
         zdsPHIplZq+vfHAmL9rp0S8XcVyEta83POFdmTlJ190ng+1sfJKtXtEIq2sxk98uqXSn
         aGyw==
X-Forwarded-Encrypted: i=1; AFNElJ9II9N27XfjwkHyP0PhOjBHzyL1DDXr8mOvcernH2iMcKJfQnjP+RCnGQHhbdVElK+aUYp+5zqcv061Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrBefmaP3bvAu5CRlpYVEbanS1TTCn3ZKfCuF9alrZm9XXCyY
	P8oGRkx+Lt3YJEVN9Ytq4O89+Z2w/6hcdGM5yZiOxLuBV6HE+n7e4xLF0j1T0g==
X-Gm-Gg: Acq92OHoPRL8p1UEs3MuJkx7Fhc4yhHppXKkZfGjLmJTvTaDQFR35OHOV9hOK5U51UD
	yfLIhVDXWm2YFhPnOoXBGCQib0o3gVXyFoJk9WEVExIQ6au6hyy60u6A4NePJwUNYtKkyGVSVQI
	EH6DbUx59AhUJJom37RuNw+0//fearSMbE6oepxcHOYWQHJ6H9+T6nlneNrzGia6AW2alzx+3UV
	xzIQN5r/StqV7Zkbp4ujkJb9k4bTKxgNjlDftPt5JjdzR8ii6Qe1sJljxfvmRWF2xjeZgaKliYV
	cxqNN5nyZBukQ4LTq8z/ltRv0OkhzN7L6VS0lgvkKLCxILOqvK2sUl/D+yvDWR2sX9YoNr5O+B9
	acHNvF2eTUS/mfw522NavKF827ExKhJ1egCREkImUP/xTRnqXnUVcmLpGn4NotQe3auVuIV310s
	u/ZkgLBfa85isB2AGlmPjWAVfc9VGAtF4n6BzQphNChLSq7a+3YXjFC2kIWqty25BG8oOM81QoR
	aLhIlAXz7c+
X-Received: by 2002:a05:7300:fd10:b0:2de:1508:937c with SMTP id 5a478bee46e88-3044912be04mr7816259eec.24.1779799721346;
        Tue, 26 May 2026 05:48:41 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f20561sm9516837eec.10.2026.05.26.05.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:48:40 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 26 May 2026 09:48:26 -0300
Subject: [PATCH 1/2] ALSA: xen-front: Reset event channel state on stream
 clear
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-alsa-xen-event-channel-fixes-v1-1-91d3a6a50778@gmail.com>
References: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
In-Reply-To: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2435;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WzcH2Sbtw60mkU1iRWe1iTMpo9hq4D+yg6klUsKkNfY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmi0xY/773+TatxsuO3sLm1k80P1AktaOgPtVqpe93SL
 eevisy9jlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZgIjxLD/7pC83C/jANS+Xu1
 xTxfdK10nmlr/Ov2wbwHxwVTts6d1sLIcP1OeqHlcb0O3c5kV4NmDnstqS6+sNPxc8qOzU5VN0r
 mAgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

xen_snd_front_evtchnl_pair_clear() resets evt_next_id for both
channels. That is correct for the request channel, where evt_next_id is
used to allocate the next request id. It is wrong for the event channel:
incoming events are validated against evt_id, and evt_id is incremented
by evtchnl_interrupt_evt().

This leaves the expected event id from the previous stream instance. A
backend that restarts event ids for a reopened stream can then have valid
current-position events dropped until the stale frontend id catches up.

Reset evt_id for the event channel. Also advance the event-page consumer
to the current producer while clearing the stream, so obsolete events
queued for the previous stream instance are not delivered to the next
ALSA runtime.

Fixes: 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/xen/xen_snd_front_evtchnl.c | 8 ++++++--
 sound/xen/xen_snd_front_evtchnl.h | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index bc03f71bf16e..09e4c1d05636 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -456,7 +456,11 @@ void xen_snd_front_evtchnl_pair_clear(struct xen_snd_front_evtchnl_pair *evt_pai
 	}
 
 	scoped_guard(mutex, &evt_pair->evt.ring_io_lock) {
-		evt_pair->evt.evt_next_id = 0;
+		evt_pair->evt.evt_id = 0;
+		/* Drop obsolete events queued for the previous stream instance. */
+		evt_pair->evt.u.evt.page->in_cons =
+			evt_pair->evt.u.evt.page->in_prod;
+		/* Ensure the consumer index is visible before stream reuse. */
+		virt_wmb();
 	}
 }
-
diff --git a/sound/xen/xen_snd_front_evtchnl.h b/sound/xen/xen_snd_front_evtchnl.h
index 3675fba70564..8400261ac466 100644
--- a/sound/xen/xen_snd_front_evtchnl.h
+++ b/sound/xen/xen_snd_front_evtchnl.h
@@ -37,9 +37,9 @@ struct xen_snd_front_evtchnl {
 	/* State of the event channel. */
 	enum xen_snd_front_evtchnl_state state;
 	enum xen_snd_front_evtchnl_type type;
-	/* Either response id or incoming event id. */
+	/* Current response id or next expected incoming event id. */
 	u16 evt_id;
-	/* Next request id or next expected event id. */
+	/* Next request id. */
 	u16 evt_next_id;
 	/* Shared ring access lock. */
 	struct mutex ring_io_lock;

-- 
2.54.0

