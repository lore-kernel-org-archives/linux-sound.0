Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E993F413D
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341096; cv=pass; b=OIeByDRb2U5RJo8qvP4DOqDWkAFqXh66jiXvO5rcPloVyqLT+JEhryNWeHJ+cnCYFkvT5jDhU7aNnMqvguK3xkEFrZk/cQi3ouHFKC6eEYgRUiwvno6mXd10kJvlNCpuiGdEJxpjldPURwKy/LOcroLpJbzU0cgpRfyZdkCSeSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341096; c=relaxed/simple;
	bh=jV6G3Jvq3sQ1UhjMw9PrSp5tEYutjUs/fs4NB+jxo1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5o8P9gqscyHkwzzkaqNe5GY2rWwz0yRyO74F4VxoFnFzuJlAlUXsYrr7FkMmrGqx6w31zaeD5TCGZi95PiTXO6n64/CVBQO/XfnWYHNeGsp+zP5qudsyPmyZ0ZZyjuKkm8/EWUI9YBIGbGQT9bIUH9Xtijw9skB1fGhdCJkvyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLgVbYNz; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLgVbYNz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc73e322dbso14672225ad.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783341094; cv=none;
        d=google.com; s=arc-20260327;
        b=FIc+H9MLO316s4lJWTo8aWTCpeMmNZ+zsnkGAJeTh7l92pViT0Tc7RboacfZhrapKC
         dwpcRD/Qz8BaDX4uCeN3MbVS5RKZCqbf+X25v/DKhQ3O/9zvi97C86EfPu59j4C5gQQc
         czSmnwvfdwy3YYcdqJ0D8B101mgNM/5C+ptJGKcrDacYg9jnMtfqO7ghbufFwXwTtII5
         Oj/RwTSzhSh4byPyhVGW22RTS25X0/aZrmYXlPHSCrTrOquUQjL5iszGv+HA5kfzCk6G
         2H3nefQBKOjpJw7dBIegXbcMwTJLDpImH3okwyvxYf0Q1+Gbh9myDT6QhcJItVocVQ6u
         Rs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzTfrslw4I3XtQvtLU/PCOKQOtkuQ3Hlm+zBAEMubJg=;
        fh=kl/nF4jk4qiZ1/Q2xxD9mpENOMHb/LOXapYwzqkvNCA=;
        b=N/R1Qj99IgGHpEjVn6Iw7KSNdwOHB4rzhZvTSHKVi2hi2BWFFcHPhkOlMLTKyPX0Yj
         zQTp7ek7dtafQW/3Wsc6u9zy5SKPLbnefqcFYZcrYedJf/6b7ikHBHPM+3WG+1JMSTrT
         rb7+2wZK56u6hfG3p22b5gvgAKMDh6T3wE1LFDlBxLv/RhCCvZ+62udbAbcg0uOUEQaU
         iWKAUkCSNUVIlkirRNWbhq6YU6Ph59rmlK7ipHjtYsjSmkPYPLiLh+Yz6J7dbNKPLYaH
         L9JI36+3wkOLlZ5EXUfk673wk+dyfKBAp2yMb78RzsYp8bkxUxvsldXwx71Vzhsxhxy1
         qtXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783341094; x=1783945894; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LzTfrslw4I3XtQvtLU/PCOKQOtkuQ3Hlm+zBAEMubJg=;
        b=hLgVbYNzFkOXKwhT8KH+jSIYRRSwENgxvVArc19Be6WmUlXpswmabbMFPtAJEk/0vZ
         nA7wXoMcdzr+d5wRcWXebUYJH/1e9EaBO0zLNZgwHqercquoTfGwe0gbx4Jmiv0MyjTo
         7wpcwLNuY2WV5Ct3Xri9e5F2d6TWWRMgzwZZLbyoQoUdA01LGOoQBT0nfogaRTb/EslH
         dOmRFASlPhWKNMkHIAe3RKval99HqoVzwyMx+lWgIfF6BSKuPh4Ty/6LifaZ3hQFQPfW
         nOnSL2DgOCvBjFJ11ZTMR6RyLUnT/+CWQlcss2tRu3rd9eJFBS9CghEHtdsNv2jCI+gn
         fC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341094; x=1783945894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzTfrslw4I3XtQvtLU/PCOKQOtkuQ3Hlm+zBAEMubJg=;
        b=s8h0Zb/k+I51QUWmr2L4BHRhbPidIVuKt9urN+T6u+9mnDIzr0X/gQntHp51RTpH34
         Hdpeaj7PeRUD4kMd381/T6qs3THYuBBKjAcZ3PL1n/W2/P+vghmwesdm1en76uF9OoX1
         ZdJy/UWusgHYttX0bZL6ThjOOCTR+984nRc0II4a/KXy9cIQlbvEit+QGvalbEelLmH3
         iKKX3wIKVqLnHR07MtiTZQDDcEkxwX+wuAttakSAQgURwR4ChsBsPxpqUWqxOhEdzgmA
         2myVM86dIDSZ8wq1O6HP1X0S1PGrz41RpetPRKQeJI4EmTNJyj2SjPzx30QjpL1AN2A3
         nUzA==
X-Forwarded-Encrypted: i=1; AHgh+RpxjEaUXUIjSMecz3LukP9f2l+5qb/sEcC/5SOjfgnJw1N9iIFdexUTz6mmoD36YctVpahBAzmAE1yU4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCXl+22OBD6EXsMsP7ntn8LqAMWEAynLGMIm/3mvSypV7cSq0N
	5oJL5Q2pC8UlcAtjZwNgEuCijSQqk9I6haHqf9e1jO1GZ+EJGMA8i79br2TIQ+nsZryK9J78F2s
	alkw6fkuHWpIhBlM52M10YsSm9bxoBfU=
X-Gm-Gg: AfdE7cnA1/01v6od/N7X2xE1rAYJP3BtVarDmgCnAVQrbhtQFa03soitS5ItRLXwyM0
	gub/8bPgaoeTHwMAbguIcDb6kREOMGZf8cccGYy3WSeJCh1sUl4gxlPFBt6WfGzp1U+vnLUMBRN
	TTsnInBXr+xGPs3GsfA6jkrhI3VtKdd8YbLcGjGrT+iAujV+kQLHiP2wGDSx0oDlZz7lS/YpeHO
	BdxBoV+s44k1u9lso/gul4vaYlNh4hT6gGl8zhv5VD/876ioW4tSEyWWGJSZj0x31SsOQTCvzT0
	v81HGb0C52ThZOPpCaBPWoks2T4kYMPrpiYFbDTtxkhs0lclyzMItzpSlKW6qd/5PHEQ3Iw=
X-Received: by 2002:a17:902:f608:b0:2c6:a172:55a6 with SMTP id
 d9443c01a7336-2ccbe3fecf9mr2949995ad.9.1783341094002; Mon, 06 Jul 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706084950.49331-1-phucduc.bui@gmail.com> <703ea25d-6c74-495f-8d0b-e48e5868a96e@intel.com>
In-Reply-To: <703ea25d-6c74-495f-8d0b-e48e5868a96e@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 19:31:21 +0700
X-Gm-Features: AVVi8CcDVaNyGamfhsgz2kwPxZLaasMZdViCP-aCIT1WJGL6A2W138RRA38f8_Q
Message-ID: <CAABR9nH09_u3qNKaN3_epnYXk9rErQ_=Jy7dcn0_mWj+gfb0Kg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Return -ENODEV instead of -EFAULT on module-get failure
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	Len Bao <len.bao@gmx.us>, Mehul Rao <mehulrao@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

> > No functional change is intended.
> Changing a return code _is_ a functional change, so the last statement
> is bogus.
>

Agreed, will fix the commit message.

> Now, there is a benefit of having a different error code in
> try_module_get() case: easier to find the offending bit when viewing
> logs.  All the functions in the area have rather low log-coverage so
> distinct error codes help.
>
> Regardless, as you mentioned, -EFAULT isn't exactly the right return
> code either so the direction of the patchset is good.

Should I also add dev_err() at these paths, or is the distinct error
code enough for now?

Best regards,
Phuc
