Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD933E348
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256218; cv=pass; b=p48EbinFHm1d8x/zS7x0vekR2CRDt8whFiA+YFbWxx8GD0WEbxEQoH/4YIU47Lz7bhQ9fNcwA7EVYS3NyGar76MlSDPZE75EtdwL/BWQ/mr69ZioRHhf52rubDodjsb3JRbsUxDH1YB3H/ED7bptp869xMtdD31wDt83QiCehVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256218; c=relaxed/simple;
	bh=2Fzo3M7LuDytk0ZJbhSffN1E7aCbsqWRH2lDInDjLQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osFGCvKfWADMZJ5e0K5aDb3lWRM7l7ZIXud3nuPGcddeNBHoaxCKTQS5ZfgeNpQ9ZmFsckQuShOkndLmnLq1cKAPuWV97LmPlLDeJwvXTNOCza5VNXjHlus3HTs5npemOB4GqpzRiyxFf2qxu/iLNd07jZGmeFOsgrhHal1LJbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JexdhnVp; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JexdhnVp"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso4328483a12.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 19:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784256216; cv=none;
        d=google.com; s=arc-20260327;
        b=RQgDbBWnPyuoGDcxsJfzI+dfSstpV7N6VTTt4GCIwRSFaPpSXETcIjcGpZSOV6VXG7
         M8nf6FDzKenGkwXaf2j0OV5kyzuizc4xgmzNnBSVExfhprnvkUnNb8tYg43Bvuqp2kgR
         R79HT20LhbmLi/lbGmErFFwlMPpmv1egUo26DkcEiMYOJkFDKG7Vl73PVE7MzIf8XKd4
         ue1qWpk+w4EgHym8RYTOhW9NP1DsRlnJMmnt8nMxDokJbNq2XOJnLZ5QUTcdbZQsCobP
         aLx3U2s1UlAeuZODo55trIrYHFL5PIc8r18fKw0fKoVDwhLqlDITj2DfsoZSrKprsGAm
         TNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        fh=mbCUJpqvdxgU+icqJ30M7DqCWRxKLbxU7sVaDr19zG0=;
        b=JFXqQpLjiR0ZBPPXLq/7Dap1ztI1RWcYsJ+s/qGHzrfY2U2pwTRjB37BXfbNTNLZeH
         /jmE4xESr1s2s6OOpvUijvZVJbH1YQ2qYB/r0OqC1999mZjpRMdlT5ACu8zgDrJmHeqe
         O33Fnjh3rv072R69sSYk49kOaMpD8j2TA9kbhg4p9k6CuW3gSUvDJ47tr7Xh93OHCelg
         JSDpPL7uJqTQwpnqwaUPuNPNqbdQHhS61MC3plRXE6+Xki2/Wn7ecJVuEln5UBkqdqu/
         4F3kdkhXahV3FfV02ZtbyioXArdJknYhcBYpEjG/ApQv9xXsiEtFcHy0AOikt6yyEuz+
         AS4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784256216; x=1784861016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        b=JexdhnVpitKB0KltZFkuL8AhK9BVOWHsJvSuNk8ekC0TyMVF9R0I+WC0FNmJSk1hd0
         6v2L1LhGlcCPY++TxhLzPiWZ3VI+477L5O9DJNUGqOKR4xf1Ls0QSaXDuvnrwRZho3qZ
         YDlQ5w2uyIv+uhMVL/z49dei4lviln9qUuAKD9uZ1VZHd2MyRKUfknh8c5LycyRMMI9q
         3kjSCxQOD64KahOtwMyiuAoJUZjI+4xJLXghgTOuGFMSvS3lqsniLjGQ3vNDwcK7UQuV
         kJkEFZFkzng/xBWLZxC7cdrg6k+DhrIF0PLVMbhQVFgc/YHmrI42tftSMgFkSERYqfrX
         7QsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256216; x=1784861016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        b=hdv0d8Fax0VYG/N4e0RVQm+367ny8VhENRt4DVkDluyE4sYslp9/35pVh6PGIWi6B9
         24Sp02LO8e+VkoZdL9aPodKHveKP4tgWKLcE16maANHqzH52NEJysnQ846U87re6f2nQ
         e+BzZhA5L17v4VQ//WAbCMT0pUDpGeLrtV0+ehoIxVeQT1nE++W/bNxoJM9bZXlEd7eX
         XxFjDEmkkWuSBJJzZ4Dzt7i3PkvJ6CcNnApJArk6X4aGUcY4v8g6dZaFDLIKOOMVHbw+
         gkCHvtkdDUhzaMNqwlmE94/stc93RsotYcikhdEtWkzDTQjzFxxXyE/ArSB1kJStjbDO
         mfjQ==
X-Forwarded-Encrypted: i=1; AHgh+RraNtne8QFmp7r0Jy+JNpdkQL5KCYbuvc0DDJ6SjOA0iTBsc6Nqdk9bRFtTKqoah4EmwafUXq77uovZEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3RGWv3f/ypun6/HHgnSSfwbLHxBFhNQMcLVecsMQWPY6giON
	37l3EISf/BeA4QJ1jTAFCO6ns1m91bNUIXm28iiyZ+1iRbmnFPGuzk6/86cGvYqNLZ9RraUAuEO
	xFZOib5cGhIT54culRaZeRqePqOVZUVA=
X-Gm-Gg: AfdE7cmqapjeRsI1zyK+XXhwUEOwQ1EvgknS/Eek44YYa789KWCBxPnNFCDYSRK/GvB
	spPn+MIcugO+g0VtUD97SIrxmxB/uJcRUcUFLcsbVWiWY1AtoQNzRLnTNyGv9BSZ+AIDsw2Z0Be
	mYKgZD2EMSomzQZoub9hUmVOhg3saYmHdUX7ln5LmeH59dr0G8BqidKy+PY8So0hjo8rp8D5duF
	nCP/KnuKd2rL4VWyEqoElgCwiy3SPoiGDXXWmKc6zDyFhmpPRYNmHOEF0CKOJcjwtiiBqBS8WVt
	Lgq96+q1mCpZwO8OHl//gpta7mm75HRG+gLsAQH7YodavoXzBOA=
X-Received: by 2002:a05:6a00:8c2:b0:848:54e0:96c1 with SMTP id
 d2e1a72fcca58-84c29590547mr541291b3a.77.1784256216411; Thu, 16 Jul 2026
 19:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
 <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com> <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
In-Reply-To: <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Jul 2026 09:43:24 +0700
X-Gm-Features: AUfX_my9M2Eo3gIu3CtbO4S8ow-xrYGE6kyiiiETHDgngv6Z4-cu_CPDtHYWoKs
Message-ID: <CAABR9nG2vYKhMKeSxFstCRcHb8Z2FzDTBuQ3PY261Lipx7FfJw@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: wens@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Actually, following our discussion about dma_request_chan() not always
printing error logs internally, I did some further investigation into
the code paths and have submitted two patches to address the underlying
issues more comprehensively:

1. A patch for dma_request_chan() itself to prevent potential NULL pointer
   dereferences on invalid arguments:
   https://lore.kernel.org/all/20260716052758.23465-1-phucduc.bui@gmail.com/

2. A patch to improve the error handling flow inside
   dmaengine_pcm_request_chan_of() when calling dma_request_chan():
   https://lore.kernel.org/all/20260716080428.57979-1-phucduc.bui@gmail.com/

I wanted to share this here to provide more context on the proposed changes to
these DMA engine error-handling flows.

Best regards,
Phuc
