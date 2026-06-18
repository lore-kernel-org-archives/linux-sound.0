Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB336270545
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762602; cv=none; b=cqIuCja9bMddGfkA9xno0yZAy4NbM7gcc0j0vYlArqUbTZO4hWijjHDEtPMID20U0lhY1hg85iQi9YRc14b7CUyT3Uh8WhX6vkhGQr+feJDZAIvtz20svJ+qA9BrTdXEDfTNJPXJZ9f3DRz5OEdevmjPcOYXupTacLhgh11fBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762602; c=relaxed/simple;
	bh=hZDG0mDdCumxpuaWrcvFCrJS8QS488qoxGQhEjnF2IA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UKY2BOsS4uyBHiQL2Yi0aa5Lf/eMEgNMRKqPjMcpoOE1RtsHwO5IZAcbC0dp5+GIZrL64SBYSSjlDTuzrCC+pCYFWFGzr+bdl0ivb6C3y4y4eyF8beWG+TceHuZCuEX5Z+qSINy0lAvyOtB5M6zcxyPUY447z70eBFGSy+LLlv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9AhZrxt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9AhZrxt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6fcfcdb2bso1072645ad.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781762600; x=1782367400; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTzy2UZJI3FQzTrOWF/IksELIHFBA6/0PARojYcP1KY=;
        b=l9AhZrxtqDvlwwEh/OeIEN4wDQzDtM+OIymo8/rCOo7BZ5ZGNziNiKkns2ZBdd9bbA
         uM+w/OX1KHy6HdCT913hCEkNvC6qGV1FGAgwNbCBA/rCD3TAdzhSnq50+93gQHBU0CGB
         unp8QEv/xgqOdKOPqF4Mrtwaly2bLgt5ABxuVv/CrYL+GqCqqR9PCWdIItOd2krCFCFr
         c9Ny3QnHUvTR/1n31Q3aq1/f+eaBxlOMRbJYM1QYeOTqurEXBMweqquxzcEzBJnEwYWg
         d9Tc7f6Vep0CaEc+kNw3fpardVyOnIOY70GMvJUYrHG+ubWg8+376zVsNtFA49rSyXb5
         5YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781762600; x=1782367400;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTzy2UZJI3FQzTrOWF/IksELIHFBA6/0PARojYcP1KY=;
        b=S4ful10y/qP29JCqn7UaE++4JU4B2z7o7fEIKEMSJzBkGR8mCz3wVvF6bpKp3pEL/Z
         GXFLy95ME/2oUf7pjASsbvuBzUsLKbqQvJKnOcL5xznLbV91wYjayD3hrIPpZ/kIT76s
         /ktXMDTiSK9pO5HBm7GWTEhe3BQwC/GU/Q7/PJixz9lu6XfWV5CE6NqZoV9rm6G+7T/t
         20D00Jas7MEIjlHNZZzVIn6FPvDcI/ju7rGc1kfI0Bnn6leVJOnn5MyN/CJwI7LwmasG
         3ZvmqmMYY/Z3/Gzbqj7xqwESoHxEPjqu/L3LCxDyF39GrFvI4paGjAqnRelejroh2fSS
         7xEQ==
X-Gm-Message-State: AOJu0YxbY0qGNEG2X3hq8jA8BoB2DCh+btrsUOFP49nj1pU216E2NWfk
	nerlkNdYoB18hiyNeA75Cv8WhBiBG80PAg47pd5StQ5FVGxoXiRnHlVCtygkhw==
X-Gm-Gg: AfdE7ckDSlSjumWureJqri8Ol/tXPCjM6ZK/ZyjiYTDdCOX9rNiR5EJwjwQa5xVbt7I
	xAl4iG+6lhMvPovrY9DKsuleECDXFexasxs5urPSpBb47lb9LnK7qxu/maeUdsk/O4xMv7x36hN
	oOJmrQlPc/s1OWu9PuLOMzpg2aQtw4hGU9Ur7Dc0CCBNZFknhKWiQVQ95c/2tvhoy7kAjOA9UQF
	qINUfsJsw39xmCkyXi0iAWG1oh3LovJkd/bdvOViuY/icxKXT2834EByvQk1LAW+cJqPdpr4pND
	6uF+4Y4IrtKanucuLDZAHwRJbg1FWmDuH67e4N4ceYKK2AqpKWstMWUTc3nB0fAHlN9AiPegt6K
	pr4djk4hz0DZ8lcnJFmYosFIt378uwsJpa/z/Q+iJ4rDirOrTIuT1KvLgKgYtA1FQX+nivjoV61
	rwTIRCkK3hrwCFOE2Qsj5a8QMF7Sv2mO56ieB4AEVrVduSjYA7
X-Received: by 2002:a17:902:ef43:b0:2c6:d5da:838d with SMTP id d9443c01a7336-2c6d5da84cdmr40459685ad.33.1781762599981;
        Wed, 17 Jun 2026 23:03:19 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm42757485ad.68.2026.06.17.23.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:03:18 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Daniel Mack <zonque@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH 0/2] ALSA: caiaq: fix S4 OOB read and bound the EP1 input parsers
Date: Thu, 18 Jun 2026 14:03:15 +0800
Message-ID: <178176259547.3343534.6658931377288378506@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Takashi,

Thanks for confirming the Traktor Kontrol S4 out-of-bounds read and for
the follow-up on the neighbouring parsers.

Patch 1 is the actual fix. snd_usb_caiaq_tks4_dispatch() loops on the raw
urb->actual_length. That value is controlled by the device and is not
required to be a multiple of the 16-byte message block. Once len drops
below 16 the unsigned "len -= TKS4_MSGBLOCK_SIZE" underflows. The loop
then keeps walking buf past ep4_in_buf[EP4_BUFSIZE]. The fix iterates
only while a full block remains, which also discards any trailing partial
block. The X1 and Maschine arms already floor the length before dispatch,
so only the S4 arm was affected.

Patch 2 adds the length checks you suggested to
snd_caiaq_input_read_erp() and snd_caiaq_input_read_io(). Both are
reachable through snd_usb_caiaq_input_dispatch(). As you noted,
snd_caiaq_input_read_analog() and snd_usb_caiaq_maschine_dispatch()
already have the length floored by their callers, so they are left
unchanged. The two parsers patch 2 touches are not an out-of-bounds
access either. Every offset is a fixed driver constant within the 64-byte
ep1_in_buf. A short reply does make them decode stale data, though, so the
guards drop such replies per device path. Patch 2 carries your
Suggested-by.

Patch 1 carries a Fixes tag and Cc: stable. Patch 2 does not.

Maoyi Xie (2):
  ALSA: caiaq: fix out-of-bounds read in the Traktor Kontrol S4 input
    parser
  ALSA: caiaq: bound the length in the EP1 input parsers

 sound/usb/caiaq/input.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1

