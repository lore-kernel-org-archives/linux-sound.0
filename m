Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9883EFFCC
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196704; cv=pass; b=kd57crhfm6ij48AJ3PCXGd7xZBzueQhzmbsMwdA2TP3RyJNczhCBJKPePGNEAbfoEdx+cMI6psN2x8ANVY27jAjuDYQ6PJ6obr4x68Z0QvgLd3y0cQ9OP8ciW8WWtimeecNxpfiBRWmsEXM4bcghv/Rdc3jFukHgWrOW2KgPHmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196704; c=relaxed/simple;
	bh=EtyyesPi/SDuoE23U9tj/mxfLUReLacfZyExPDcdw48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t33lDa3QnMYmJMce70Esr5eOR8V0gcAKrfEO5nQHXYya4HjhCpRQHAAhJCa55xRYt5hhzAZk93kbsFe0H1PbSvYkCR10o2uzuXYW3vR8LD9PCLYKeex39mH7X4HdFMeI7/zRjSs/NJILnXaxayOqRfk9Mr1AXANt7ccRLzRkSOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU4BwdRU; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU4BwdRU"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c999f162c9aso4072541a12.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196702; cv=none;
        d=google.com; s=arc-20260327;
        b=cGavoDPZkqQumnALLoPBn8OIoPAjBo3MiOy0RR4sUrOU8zytj6PxhNDx8dA6sqYFL/
         rGnWTn9Nuh4/ksmyYcUWtL4/mQo2yeY25nbaC+dC5c6DzukQZ5OCwlLLnPEAg0LhG5NP
         cGXAUfEe3K+qnWXK8dl9Q70Co1VXIBfDBAEN2ch7t/3SyoYSpQcX1z9wTOdTOm4op3Zo
         Rkoi4RbBWhHbG2BPs/nEqo2cH9pqS/ZykpJMe5hn3RdG1bHdU4mOxwhg8yR5X7M+3gLy
         f7/bhBWdvi3VBg0U//POAI17/eCBgOndbYoin3FCa/R/+nxlG6VcwbXzj1kaylBN920g
         bNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dg7/NRlMB8RPrm27fTBVuBL/SYMjEmUFViVbJSraohc=;
        fh=y3ltfcY/ld/iMogkDA38l5ZPE87YyyQZ/9/lElcWyAc=;
        b=KuGNqgRqwuCtG/bVFiJfZ2oiqxFTVmD6uHo1FhY5RLnAPJxUBklPUT2n2wPQ/8ZQJy
         Dx9lD/p8qwc8Jz8v1QYQVToYbyf6E+m4wzcqKcJhYdh9NL0hpU1Lx/yQwvFCx8H1nOTQ
         7Oszf8EUu7r6n5yCpKjAFsFPJ+pDqHdu2T6u8tJjMtEydKB/Sxb2qURrb4KeYZHRc9sD
         UXjVJkTYWv8NepCwOPJuWBy5OtpTehJyjsPCLg/yGr8eBGGGupkRSS6kriNNT9DqXIR8
         bevkBmeNuA3KpeyIZGPHXvfWDiKu4EwwXHRkqDNJpzjSXrWAhlyHHeXRMm6sotzH+ox7
         kqBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784196702; x=1784801502; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dg7/NRlMB8RPrm27fTBVuBL/SYMjEmUFViVbJSraohc=;
        b=eU4BwdRUHRBC+EnxEjpcupxlfEErp2mGtGraEPpa2Gp/peUfK11lTTZaV5nhXpYxpG
         Av4SGeQIFmSlbpWZNNR4U+u64W5P9x/0aelcfoKpouR5RLJGhCuAfuB2h1mqUPcvZE8v
         4RNh8RmPLcnOgmV5fJyHXgd1TSLtinaHT/J585+DI66w4zN/n1oHSO/ykVQ693A3Aqhj
         0h2Vnth0hlmJvViVlnEpIP+Ea/2F4971qfhH3kCkpgIsm7EnA9CSFopvrgEZDQv1YjD4
         r3FD7jCrJja8j1bm52pMfndLH69OOzVKU6G8iDe5pWbSPd9UeX31IlFRiGgALowsWkyR
         Y81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196702; x=1784801502;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dg7/NRlMB8RPrm27fTBVuBL/SYMjEmUFViVbJSraohc=;
        b=ebC1yciyloz4q4nuxp7W9a6LH6+QnSKnNqlFshVVKGkk98iHuwbej6hRbZtxwhLETx
         ValJn3KsgyStBhW+3YHN0OV6kdYmAwu/XWdckp7APbPnFS4vUbgBMOHWipM4no5J/TEb
         cyCFzypuiw9xW9MvfkLPzsYxiBimxpxnWkhu+pwpnQxjXVlh+sSjzMjSvo8HQLo8+ARY
         W6UxNsEcY98a44GuvXaWiJOAlfKRpDXKuAeWLWWL5/MCPoDYZMjVnFlGQD6A0AYCsCkq
         YEVgPq4f/a29TMfjS5KCvg4/6sQtz5I6tYMwwTStv8QjiE0WYQCXFiWbs73TrzdS1Im/
         +qjQ==
X-Forwarded-Encrypted: i=1; AHgh+RojwhF6B7PyCETYZM9Cy8GVMgENAN7R9W+DxQx5E4/kzsqQXwTKF21fd8/XaIcunWDnThMD9G3wv/VBhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymKuPVqeByisjlaUcGzIWqw4WZ5FtfB1+WPNJ/3jysDK6I5A63
	zCqVCI9frkW2cffyu7EweXm6W7RqYOOUmf5y3R+NdECc0tuYWLE3NwzrsjS2Wb85O7fYzTBnRMM
	vyfX11LylixKMF9fB4vY5b7FdxYLFQIQ=
X-Gm-Gg: AfdE7ckzZgmslVsLrcub57xuQ0KvTZAV74RVFQ3m8h1rSU4Qzf+gQ4O7qm+xg1EgZAm
	gwXOwpn1oKy9FSVRps65KIMRr4IqY7ypZuZxP4etUfRAEVLdD9857Zuka/vgrEG0V32dRbXyl4M
	GM5DMhzTWu95eeNHcRzIu9j+L4ISS7/BpaAry0jXgcjA/Pr5CVvWqy7FKoGxaJjy4mru9TTlPsV
	vL8u1jb1cct9JW9FnrP5P6iFUJ8Prdng7gtOpx3oMt1LYwMOzTS0IJL/tQmzZQVQ2H3V37zPpat
	dsL6F/GhseWHbRs1
X-Received: by 2002:a05:6a21:e58b:b0:3b1:882a:607b with SMTP id
 adf61e73a8af0-3c34d583262mr14456931637.22.1784196702293; Thu, 16 Jul 2026
 03:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716090829.72082-1-phucduc.bui@gmail.com> <20260716090829.72082-8-phucduc.bui@gmail.com>
 <61bfa6e4-d8b7-4bf0-84f2-173384c690ea@intel.com>
In-Reply-To: <61bfa6e4-d8b7-4bf0-84f2-173384c690ea@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 17:11:31 +0700
X-Gm-Features: AUfX_myDJp0AtNfhtrN9LdRrNpl-gy0V4QN3J4UlvY6JsDJC4kIjoPtoLhld9jM
Message-ID: <CAABR9nETtBpAonGnfHMq16zkzmCAHiVND_-NdxsLJKZBomL9tw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] ASoC: ti: omap-hdmi: Use dev_err_probe() for
 error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "snd_soc_register_card failed\n");
>
> Some patches have '()' some do not.  I'd expect all the patches updated
> as per Christophe's review.
>

Good catch. That one slipped through while I was preparing v2.
I'll make it consistent across all affected patches in v3.

Best regards,
Phuc
