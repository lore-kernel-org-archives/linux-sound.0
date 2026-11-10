Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293643;
	b=efY22fjRLBZTIZDgYQMpIxQ87s0zEJhitIzoaOM6a/p+F60rvgydM8z8Dh1ZbU0ule0s
	 4ou/maa+jYqcAvUmPSI58WuHKKvkefOb9qWGBYW0+yNAsVR18yJO3uIsyc4T9AQTTXMnC
	 WoFIzgZc7B6Shh+rz1XqTXtG+INruAUuJVApXZRrgfkAwY+9IEW0juP5itGKWiywlZZtM
	 7dQtCg0s32c0vrV6zNCRm0bfXbbv+SNNFyPuB9jAek0JggZ7Z3LQbxm1RsaILMRr6kCep
	 Dv9GYxhFwLaRQ8FZQp3ik0rsBV4VXGFoi75BSV9S5bWmygvAiEQXyTaVZjQzZzuSg1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
	b=uh3o/JwMml/3lBG5WBR8nXWPJgK6Bwo/aQ5+QG3pDMe1eoPlbUK34OO+gsWj0xS3j2Jg
	 IrMnbq8tGpAesZ6o4iuyJ3rtcTLGWgbvS9oAEl3zilQOzGpFScxxT2+t8i6qaUQ3CtwIJ
	 iHkgsAZphiXSi7oVaxImJLtOVxIc/DLzOR/40vXHeSGr+/2IxV7fTm8eVHHrRFxyAaU4s
	 wI1iCks6VcZwJvyVRUpvP5jNT2QXmDEhAZViGds1jfaAkGTjj3fk4quzXYnOJ1pD1P/H+
	 ZJTApkW7r8cK/911DsAfLFZnu7bZnmdvEr9QAJPjnrMamYDijySwOlVCrdAxWIgSEjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxkTfmlp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92860606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 06:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92860606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxkTfmlp
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so14336555ad.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 22:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293643; cv=none;
        d=google.com; s=arc-20260327;
        b=fgL45Y6ngcpevdCXyxJ+1cSUIFC2qj/1RLdGzYbnF8WzLHcmBYsgZ+zH6M3QxjY1kh
         wxuikyURQaYCdmPWe+T9NRjc0ZaHHBDZ1FWS9gF8I4XrcyjsaLze1x8Hz12LYtyMFAnm
         HdKL2Mf0c29qgbkI7BX43TTMfalGtU/wM9hSVwU9ini8B4AvPcXalwF3LugS97iho0Yg
         xf5XlJzKLJhy5WImbx2kT/WQEsvxr077ZrbWV7zXb7R9Z2z0JuwN8/kXIgipVTPdy385
         kGr5/BMHq75N+EueHV5YZJ066WN8AsMf+qE9i9QPgw1CYxnIYKCQpjgMkqTsmyzZctSA
         hHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
        fh=KuBCQFcd9rPpji6oLnMcgLgTPwSNVOuJsYAE6+VgpN8=;
        b=V5fC1JGePl+/zL3iAz42ZS03zPoeQ7St8TieulGiSrenW0lVIW5IYVpCA6WZHQt90R
         ZAEVIRcw8FY5oazoPtejFWsT6+PgSOl7m4lwIktp8TwBAzuWGdbJgj5gXwbDxNZ+HCQC
         SpEvJG6n+BU+Pj4dcJWUPDBH+DKzsseQsuU1WRT7SgkXReNSMcUG3B1lAVuMOfz7AuX/
         BW6SwmfSGX11jl9WJbFSt7KwVdq4r7Ahvf5UTUVcfXendJWGHwNIYz8R9A7ydJDGtpOV
         ShBuiPd2hpDQLgh43hPaD5dbFb3z2gpeIhUJ40XbD2/IuzVSnleI6wryGj8MZseeRnVV
         rXdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293643; x=1794898443; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
        b=cxkTfmlpxVNlweQ+YpcKltZeBZlukioe5E9I8ar/GymZbC1M3nZv9tLBlqzECmpIvD
         7Z4iTpPp31o2Hx+TrnZyH3tRmSpBoGPFhFf+WlvIwWXEmPqmyUzLZxNOHmMSLS0jlXl2
         c1X5n4XouCVS9w88hb8ppVbvX6tBDOPlAn+YtcMJ1GlkJ4Bci9jGGbeX8L+A7Z6wWGu4
         iehKQeS6sHIe+rqYb8OVx0dAE9k58fhyZukljXQWbHk3DgtaJ9eGn2SVGcCV07xOVD8e
         LI1/dzYaEH9Jek1WDwJ3B+6idn81cdhtmxpA/eYOSChlY3InNa+s/YtA5bBzc8hXw6n9
         DtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293643; x=1794898443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
        b=f+pprYEk/m4XsDwpI0YXfR/78ec7AZGsKF4xWAZCOVdPeZbDjQv7VILblxBdn5fvla
         lO8oSjZbx2GYAetpGZM2n+sOV0r3RkFtypQA9M4NvWZH28cs6n+Amd7WluiguOuB4Bml
         kOA7edPMadkeVlJcIHURB8Nz4kyE/FM4CxBIRSGDV5GF5q0YI6XW3lHW/9kQBxrcaKGZ
         0h6xnyZS85Chgwfcxv2wy/PYEZszBWjhxmE1HIVb1tJSnwogj1yQscsIi2s7HvyIk9EV
         i6YH9o/GWUJUfmUjCLBbF2SL94O+rMt62BLRBsi8UlF4zpwfG+C4JBq3xim/L1vak+Jb
         m7oA==
X-Forwarded-Encrypted: i=1; AL+hErHFlzIaeHD43Av4ot7vtFLazkAYQAQsaWZ3UlPQcNpAMpMqEmFV2BUuuMBEkVJMRKUSHL1HBfRexopZYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+T7UsehWISj1D8hyTDBOZASV94n8QthMYCCBxG+tFYWbiHLsyB
	pjSbWqqrj5n2le6xSAHuvWOxBnK9MlYTifwCCGhILFdlXCYHqcdIXw89qkX8SKbe2RAEJADv9NT
	I9sw9l2OObzkOK8+TpXrzatg8KpncPllrpPPg
X-Gm-Gg: AYBFou0qG/i9wJkPb4yDYZ9CQGEfTWfQf+PLDAXf7HHo7HXTJls8Qvw9DrD3FDWctVd
	x8k5OeVUHn7RsOrjYDMJ/xY4mrWe8fMHJIKmOobCDPEzYGpFaneRfhdsh1PZ8bGj9qMikgJ35t2
	ul3/gaTbd/9ET8587v9vAlP7ytTKcmxkPEbOem4+sm1V/O6eN+xSefAegbdLysLthvVVbF6W7Bc
	8U61VllPYsFM9Lt5+zaJBP+maepDmBbIF31sQ0gqO2KXQuFB1NSO0MkKWkRF0nZLYMs1PleUinF
	NT7jcRGVrB7ExtAOpnq4CDg8iPoHkSiOo/AvYnHiZvUJWz7rGSXwqMXZ0oRxKmyzZ58zDGfdT0P
	kLtF03SYDaXLIAiAZTgbCzAAeN/jRCDIl/u+93XSBUUBDu+JREUEIftxxn54VWO8gFQAIOnnhHV
	QB+IVzuols7ub0qPKZbMp6wvLoUHrydS322DPXml9qIUCVBbiC
X-Received: by 2002:a17:902:ef4c:b0:2e3:1bb4:6121 with SMTP id
 d9443c01a7336-2edb924bbf9mr15145705ad.49.1794293642679; Mon, 09 Nov 2026
 22:54:02 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-2-phucduc.bui@gmail.com>
 <f43d21ed-ff7e-40b8-93ff-42808985fac4@inbox.ru>
In-Reply-To: <f43d21ed-ff7e-40b8-93ff-42808985fac4@inbox.ru>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 10 Nov 2026 13:53:51 +0700
X-Gm-Features: AclHuK_vldNLcFCg-yvxy6fHrVuXaZDu-V4fnn6HfWZ9iIf4c2WYwX9dLn_tO9g
Message-ID: <CAABR9nH+V_8PRqk60rZ24RSNp5ybzUTi5nJ_1-JhL2XqDBsWxw@mail.gmail.com>
Subject: Re: [PATCH 1/5] ASoC: dwc: Fix bit clock rate in TDM mode
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, Mark Brown <broonie@kernel.org>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, Tim Bird <tim.bird@sony.com>, 
	Yuri Zaporozhets <yuriz@vodafonemail.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxim,

> >                       u32 bitclk = config->sample_rate *
> > -                                     config->data_width * 2;
> > +                                  config->data_width * 2;
>
> Should the identation be fixed in a separate commit? It is not related
> to TDM clock rate.
>

Thanks for the review.
I'll move the indentation fix into a separate commit.

Best regards,
Phuc
