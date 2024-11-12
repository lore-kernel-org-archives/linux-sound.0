Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7B20E005
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397256; cv=none; b=WD2ezDOYYrBidTOoqqjrtaHooIwyZK8a56a+0Pk7yFn3SWU2LkH7nbI11HarPVBoHB1C1OgPK/PD3dTKEukOg0JKUNEJ+PaJo6z5kCQns2V8XYkhtCRZtC1VW2eqw313R+jodHZYvAyMu5C0BUqOCSGNmezYMlgTUc6wBIPSqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397256; c=relaxed/simple;
	bh=LCGPv+6YwJIdrNnGREkhyKDHGqnUI/KiwmLaMOf/yJs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=j7BWEfF2zmNsgv4YlhuYQr8rzuul9Iz1i6ssK3qD3I9iOdNIUAoYWSsj+RA8OG31fDnpWUJAHZNQZx9k4G0Rmr27lUCExMyfUOKWjASKzQNdaJAYLykGqXWK1Mp6lw86zp+wq2sK7bEgM9f/Be/HIctCK3vMUbw4hCbKdaV81FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gB2oFB+k; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gB2oFB+k"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea258fe4b6so97026847b3.1
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731397254; x=1732002054; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PrZPIuWY1b6bcFJ7xG9KK/ME+qoSvMHLOuT1F2kJLZE=;
        b=gB2oFB+k/ny2rJr8baBTDpqQ+xSWQoAtpFnu6zTTPbWCpao7HhmAOZHbC0DCIPzZu/
         fdXSgbPQmON9hCTTQdjBcs27L+Jh/F+tg0n+cTu3qqnGO5qmOEc2c4s42CyQ0CY1bYCd
         vvbG/55ppA7S5+yVRj37CQLISFWX58UDHLwehNqb1bIOLN9dOiU8jusln0pAhjjAtLyp
         ippqwdOcak35A5Wgg9sm/cx28tji9eSJ5Yqd2xjg+nddT4seH06D2HDDsTBA/fCJHeD8
         6aQIFDh4hdmjPqPewJ+8OgRIRuYqGgVHUZ26/AecWj1NMNA7BgUl1HMrstBEIkYdP2He
         qW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731397254; x=1732002054;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrZPIuWY1b6bcFJ7xG9KK/ME+qoSvMHLOuT1F2kJLZE=;
        b=AqdegAVc7Zh5jXrN5CIckMkJTjQAgwIGPR6CA2sk5jc2N7bRFCLUlSOeogMM0auTVX
         5CjGBIwla8bzvbTRGqPUFjw/E6GMiga+kYLAIn8fr+ruhIFK8PDOy15B8un//276G58E
         sfpjWJnM3maV4YgsdgrPUmFdn0Ki/OvpYYq/N3I4a6Fijp/v+KCpNFheuYVoXf0W9X6F
         hpt6fDU1DXeTY+gM+wNchDlZT36n24hI16em4dEVRcpl6MPmXbUv3wQoOR1TZl2drxV0
         uL8v5ShkQtb+05EOiZf5I+60XHohX/xXGH+YQFXBi1U0UNqvaF/+Fozy/WZSIUL4eofj
         Isdw==
X-Forwarded-Encrypted: i=1; AJvYcCX1UaE950nfKo8N87j4QdmiIX/lPoCjq47UM5aqRS0hcMatpx+ymg5HILS36IS65JLsSuF9WExIZp1+3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPUjjJ4u8VjKUVElIa3w6ZVbkWlyPK7tB2wDgDJ+fZolV626ia
	DIu0GFQn0+Xys+MXy4OF2Il99/7hKtPLznGDkyuWXqjZsWuREbB+kvaTz9aFsxr7EIAoCEs4lev
	lC7LI8Mi9Q3RErQ==
X-Google-Smtp-Source: AGHT+IEdDPa0Xt5ebacxDlkHdUDoUVS+NEyLA4yLerHiyZABrnK1IxrW5FLVo+Dl608HpYDtwlBzmxgWfufmzc4=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a05:690c:887:b0:6b2:6cd4:7f9a with SMTP
 id 00721157ae682-6eaddff31bcmr1717127b3.8.1731397253863; Mon, 11 Nov 2024
 23:40:53 -0800 (PST)
Date: Tue, 12 Nov 2024 07:40:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112074048.1762371-1-mmaslanka@google.com>
Subject: [PATCH] ASoC: da7219-aad: Fix detection of plugged jack after resume
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Don't notify and mark the jack as unplugged during the "set_jack" action,
because this action is called very late in during the resume process, forcing
the jack to be unplugged after the resume, even if the jack is plugged in. Let's
leave the responsibility of managing the insertion of the jack to IRQ.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
 sound/soc/codecs/da7219-aad.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 15e5e3eb592b3..2745b55fba662 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -33,10 +33,6 @@ void da7219_aad_jack_det(struct snd_soc_component *component, struct snd_soc_jac
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 
 	da7219->aad->jack = jack;
-	da7219->aad->jack_inserted = false;
-
-	/* Send an initial empty report */
-	snd_soc_jack_report(jack, 0, DA7219_AAD_REPORT_ALL_MASK);
 
 	/* Enable/Disable jack detection */
 	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
-- 
2.47.0.277.g8800431eea-goog

