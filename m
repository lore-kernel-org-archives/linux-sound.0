Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3537DE9B
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135900; cv=none; b=aPjb7l/GgrcgMFOWvRgdsXdTHgs8IklDUuwk1H7aam1jlC78y2x2kU+TaCyfvn2q5jn8Jd96awp4wnPTY79PS9Svq9xT1TzO4XmCalh/vt7dnVMcvgoGKpSVwntyZMkol7ayDR8BpD/a6OIgEl8s0BFhqTVrJX+sckknSq3z6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135900; c=relaxed/simple;
	bh=gXIvDdz7KY1jT7FK47pECB8X8ynDGlUCKw6lml5qOy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYJGgGRrn6NstuQlf3tKQnMZg111xGJwUj3RHtbH7mem+wJbwPt6eWHV7UKFIfHJoe9rENI4/ka6ICN6qfIcJjftNS62nGv9/AnozQjOW61bIXt4nFgB5Dc1pVpHX11Ok8l8jYO2t61XavM6jMczpYsODzyv8eocoTmYEQI324k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHBWgW6U; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHBWgW6U"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso29828266b.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135897; x=1792740697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeWh3xuoW61Pc0E8xy+DJQbojKOcnMlGTtI9Jtb6DAo=;
        b=rHBWgW6UaXCHYOPkbc0OEE00aDzSYVlZ2UEo/CLMvz24X86uNLBqjEwxLqCga1xfgw
         UtIs4O/toJUnBaszONZtVEq044j6mYv+TqX1I14+BvRViQVsZT4AOVh8SS6kh2QV1aqf
         L7MgJP2lWrS7VEgWQG8xupggnXENgnnKdyjQInTDbYwLuDghxTwr+Et+FGFAk+kAh18q
         kiclk8FfyerRu0NnTpur4kDYZjvyKg3a1FfKhWx+s3DQg7F9skJGeCTT+QDx9UWiTB6/
         qeqqcygm2u9tqUd2UilgU1ZKprVH0MV/EweBwNgEYlg6xbBp3O0EIrXw8ENvT/YnyJOg
         c3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135897; x=1792740697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeWh3xuoW61Pc0E8xy+DJQbojKOcnMlGTtI9Jtb6DAo=;
        b=wz97nBLdLA/sI9+IZFGzgSIekEcB6cCA705caw/PuMPMN+fuEWFMKUXDS4oS77TT9j
         lMONWC9DrNjygOdTzKYBmPHr2Aaj+wM3WXecLvHNAOdGuLMXJ59BjvXW0+/7D5PkmoeJ
         jfwiCpqydwV+DClu9HE3oY0qvCsTSOmvhfqaATQN4KW9HX7d8OJi5U33/14aCaWXSe2U
         5Xp+gm/05NdSf9xR8GYUBucmyHdNsGUR8xLXv8eptjAuGNVjiIEwCLwgHluMmNHMilcA
         iLORAmslN6W2okvndZWsU9J65/mSrGmDWjEgLd93uMtoWww4RcPEKSK7ZIdvl0wO5zBS
         b/9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpmEGwl4G+m5+crRuwoMVy3tAf3a1V7/aQqEZyr1EM5P9UVSidqnBiBwBzxggGlsMvRn8tAedaXc4lJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJUthAvoHQ18JWvpACPKS/cZ/FTTcul4PLCWk333+UzPEytmkPj
	WGdHAxlA2FG3yj/zO8qDjvNWq1NftoHNNh/oN49DTJkkckVRViq1RRlT2zK89x8e
X-Gm-Gg: AYBFou0XID+/brAl5/vhFycYi20RKztPv9Pv40MP+q5WirsoV7G7PCrtL4chUeycBsj
	DiE51aVZqczuEg1is/llbiTk2/H7pPs199XWbdDm3fa5E2h2FYmqKTatVEbDBFIu1G386lmFSt0
	uuKuEvgSfJsTqxwj2Y7IMMzx+HEsf6vmSJ23iWxWiyb/HEJv10bywQH7ZvkcOHb+ww+VavZJZ9E
	2vQQa1c9SlN7IVVeLb+ManCfKwPdW7EX75nm/vdWP3j77AvWweiq/1fT/OmyIkCq9tQ6rVvAVfl
	zYibkeqbn+6e3jwyYMjSDjGXlAdqy9fm9OgbP45gMMVj7Yl8iryz7Gq+uK9kay056YpDgNiU3XW
	FQvTpUbNPajGP5YSvheSoD36PZ8iWD0JsFiv+StouRRcBV9iHS4NtahxKrt3Aj79ZHDKnR5RQfn
	7dIlle2fYfCt90iTYd/ihByLl9S0awIGVzr678qYc/9/hmH2icaGsEeBkeKbL3+nmWx+8Y
X-Received: by 2002:a17:906:100c:10b0:c33:cc6e:1058 with SMTP id a640c23a62f3a-c33cc7d5811mr920592366b.24.1792135897185;
        Fri, 16 Oct 2026 00:31:37 -0700 (PDT)
Received: from keen.lan ([212.75.99.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd125csm44471366b.26.2026.10.16.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:31:36 -0700 (PDT)
From: =?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Torsten Schenk <torsten.schenk@zoho.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
Subject: [PATCH 1/3] ALSA: 6fire: take stream_mutex in the Digital Thru control
Date: Fri, 16 Oct 2026 09:31:30 +0200
Message-ID: <20261016073132.109288-2-p.glizniewicz@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073132.109288-1-p.glizniewicz@gmail.com>
References: <20261016073132.109288-1-p.glizniewicz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usb6fire_control_digital_thru_put() calls
usb6fire_control_streaming_update(), which on an idle card with Digital
Thru on selects altsetting 2 and writes the clock register for 96 kHz
through usb6fire_control_set_rate(). usb6fire_pcm_prepare() calls both
functions through usb6fire_pcm_set_rate() under rt->stream_mutex. The
put does not take stream_mutex, so the two can run at the same time.

500 runs of a 0.2 s aplay at 48 kHz while a second loop toggled
"Digital Thru Playback Route" with amixer (12693 on/off cycles, kernel
7.2.9): in 216 cases the two usb_set_interface() calls ran at the same
time and the kernel logged "sysfs: cannot create duplicate filename
'.../3-2:1.1/ep_82'" with a stack dump. 27 of the aplay runs failed,
and for each of them the kernel logged "could not start pcm stream".

Take stream_mutex in the put. The pcm runtime is created before the
controls and freed with the card, so chip->pcm is valid whenever the
put runs. The put waits for a running prepare, which makes synchronous
USB transfers under stream_mutex; on a card that responds late the wait
can reach about 12 s, or 24 s with Digital Thru on, and during the wait
the other controls of the card can be neither read nor written, because
snd_ctl_elem_write() holds controls_rwsem around the put. Before this
patch the put already made transfers of the same kind under
controls_rwsem. No code that holds stream_mutex takes controls_rwsem.

The same test on kernel 7.2.10 with this patch (12863 cycles) gave no
failed aplay run and no "duplicate filename" message.

Fixes: 2475b0d40761 ("ALSA: 6fire - Add support of digital-thru mixer")
Assisted-by: LLM
Signed-off-by: Piotr Gliźniewicz <p.glizniewicz@gmail.com>
---
 sound/usb/6fire/control.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/6fire/control.c b/sound/usb/6fire/control.c
index 10104cb42..020e9676d 100644
--- a/sound/usb/6fire/control.c
+++ b/sound/usb/6fire/control.c
@@ -20,6 +20,7 @@
 #include "control.h"
 #include "comm.h"
 #include "chip.h"
+#include "pcm.h"
 
 static const char * const opt_coax_texts[2] = { "Optical", "Coax" };
 static const char * const line_phono_texts[2] = { "Line", "Phono" };
@@ -383,6 +384,12 @@ static int usb6fire_control_digital_thru_put(struct snd_kcontrol *kcontrol,
 	struct control_runtime *rt = snd_kcontrol_chip(kcontrol);
 	int changed = 0;
 
+	/*
+	 * with Digital Thru on, streaming_update() selects the altsetting and
+	 * writes the clock register of an idle card; prepare does the same
+	 * under stream_mutex
+	 */
+	guard(mutex)(&rt->chip->pcm->stream_mutex);
 	if (rt->digital_thru_switch != ucontrol->value.integer.value[0]) {
 		rt->digital_thru_switch = ucontrol->value.integer.value[0];
 		usb6fire_control_streaming_update(rt);
-- 
2.56.0

