Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7841A8F
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 02:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477045; cv=pass; b=OZhc5D1nFO5QQQ+K1OVLLF0vukH81E4Y4FLXk4DossJjoBJUpKmljV77bZA31FZJj08dj98XKtXVWipmOlt0virsivoxROFtNYk6w+Ws3W3cVwhVXz8owZukApiBGEO+T2isrtTFE+moiPAPrafSmSIQT5TnqSuxdRMwm73PKPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477045; c=relaxed/simple;
	bh=whh5CCQQ1vx+DTfK7bQyPboHk31bQwEaEAEg0FK/xQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS9dQI2nYf5AfPJZKVAIETuC407dFcbxsgEBAxW2jFl8/YomLh+C0eu/Gm7EIquw8jTa6OHonHtFSlNLwSSBmMHh92NuMau8qrsdsDJYbEjd9X/CmYuXe5I8eto8QE6V6knFMrDem/QEEBQ/CMFR57JuupvCgjaI35duwwKp9/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu9fnm07; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu9fnm07"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso55367a12.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 19:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783477044; cv=none;
        d=google.com; s=arc-20260327;
        b=pAExWLujWqfBV08x3bWUTVynpsFW2vXOnMdm2EHetu8WZGVSdeNwOzKEUhihz7v99z
         6Sx5yIja72eZ0U4H0WB7sR35bkfyrDaU7L8+CmWvZUQbqPWUKF2tiiR1EkqfRDIhfwF4
         nmWiTwMqRe2TV5tF/9myt+NQHfhCrAW26AH6Kb1jVqcrG1PlpqoU/7zWqCiQZUbajJs7
         kx1L5Ukx7KjYMmfXJrJK9xxEk3cnYzksAmRV7w9BKpUIjEgQ7LVidNJ9JCjr7y41yw8R
         cK08e45FiLKIgkbqPz0aYRdpYzCt4Da/fbFBUg5TzoP2g01ecClMeg1Cm34V9/GEi+JK
         Bjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rn1SQtCKRWCqSgh895bmNdyZyZCl0H/HBjxT2iynw8U=;
        fh=Hwkh6MmJBuegpeaWCOgJIPUHQUzBeYSBSJxN9fm8vMQ=;
        b=rRJ/wWfBOQX4wg591Owx+P/Ii2E6qraGSIPZ5bc3V4I5T3e2mqSaOmJEDMEL9vQ4B1
         Ogbypc2m0PHyqj+4Eba7fL0VQUdU+0K0MkF3r7XAgeqF6Ea5hgkZSoDOp77iJYrmUMTx
         ETwRbRbT2MzEP+PhZk4p6Fo6zZVBpGMomlIiv6CnLMtuG2JQk981AqYPSnjNQgxyISX5
         +TnZoFpMtJt/W//mh7yOQDsEb3TJGYQlDsLEBOd8by7mHW6PKOSv7IvrAiaT0AS/87Zb
         zP36ypxOq8jqaZBzZBzuu5b+rimQzfz4ew+lvtyiSVKrVIlfuzwiCqXMxAm7OgsSj00t
         9qRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477044; x=1784081844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rn1SQtCKRWCqSgh895bmNdyZyZCl0H/HBjxT2iynw8U=;
        b=eu9fnm07niL/Xlz5PFMKdMGe0lljovB+YpoqROMj8U7V7C8xsMjLM7Hezf0TJiw1RI
         M+Pw/H1milOyNmYSt6p+e8uUmAz+y7QTLiAhtKYzPiBc9JsfjwtkmQ4tcg8pqrIkiay0
         23Cc4yZFf0Ziq0hRj8UY74cMzKt9FGslQxEFJJ5S3Jn+ZRoWqL9g47TLCvLrq/M4XafF
         c9SnMiAs5BWuPTqcsXMCEIroyVj1S0lTFAWRJK6n8lWmpyJlpWODn6CTFRkgMlEFD+VC
         7+T2n97e//8DIJKZfUYyAz5C5nmMPFpfBfor9yGOmvP8tudQaXyNrMPiXzab3eq3/GYj
         rdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477044; x=1784081844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn1SQtCKRWCqSgh895bmNdyZyZCl0H/HBjxT2iynw8U=;
        b=ciUQqimr54lgxUVI5He2QWBdqQL0+ZSgRhRJFPS9XbjeLx+P8nNVkQ0tlZKR/FQi3B
         bo7CrcYn04iF/HU270hGzpzzEEzVYj00x9334SjUbhW9EWDHf3CCTU+msna6tfU3Y/ic
         7nnYQM7tYSQ1aStbE12jQr7dOcWRtRpnMEnh9vm7W0dxJvqiplDQxPEpdoOj8r/3zL97
         ke0FdOqB6NMeQ6xEsbwmAqFRt2UnVjxgVmWNaFBcjQ64EqNJLEMEbHQVjRuE6LKILMLN
         9YvxKOQ8fbM9xizDkwwr+HwyGDhJLTQInYYQPWr/AxLPACDu2uoTLVENNEdN++dCKAK3
         7xmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5tpNfiY4gyrrvyumycTBeiQOpojr0qYlHR7xZIYM84tRuK8pxgbXPB4WaTans7s1WcwKCXIVNixRtHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb1ojhlzMb0yiU3uZs/T8L0OYBgENrD2re9MhH1FC85n2wWSBg
	EJ9l3HCHC/5qetd0jLLQhK9s6ccTPBRnpXQtaJkfZQAuiH4mkNiYGEX7V0wHdzvlhcfHhmjyyzH
	MG5fD4vA6xzBTfifxv4kry3mrp9KchbM=
X-Gm-Gg: AfdE7ck+nhntTnQydydt7J+QF4UFd9xuV+3CWF1oNgtZELVYo57V0xOljTkYq/fj75f
	41yZWD9WUw2vS0sCHi8pG2XxiIzgGJv00mMD5VHmU28Y7swRFT0xRDyNUaJ5rL4R0+HlXOQKqPt
	ZgsDXBNhB4riicDz7SLb3MtM/nh4poz1NqN8//qOo21UEd0m8sQdW9jjEqha9T1SZBiHq0tC//F
	yyEaeuEpKjwldf9jWYRjGLflLEQdP+ztWLeSrD8ZY3QClfzT8MHMqQsBgdKnDV3vufgHeKCJna3
	3ccV2UNrDJ7VSlE098VrCyhcnd0=
X-Received: by 2002:a05:6a20:2591:b0:3c0:9c19:6598 with SMTP id
 adf61e73a8af0-3c0bd1b0c2emr326473637.64.1783477043734; Tue, 07 Jul 2026
 19:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707090958.794852-1-phucduc.bui@gmail.com> <87tsqa6esg.wl-tiwai@suse.de>
In-Reply-To: <87tsqa6esg.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 8 Jul 2026 09:17:12 +0700
X-Gm-Features: AVVi8CcpiBHuYiqMe6sgSZwWf3eQ4xf4czq3GhjsOnHuMtAc1pVGakhHp1uLHXI
Message-ID: <CAABR9nHQhQrzGR7o+Z0tOYo5yKC3FG1x1v_c8WQB1SVikN_fNw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control: preserve snd_card_file_add() error code in snd_ctl_open()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san,

Thank you for your review!

> >       if (err < 0) {
> > -             err = -ENODEV;
> >               goto __error1;
> >       }
>
> Please drop superfluous braces, too, as it becomes a single-line now.
>
I'll update the patch according to your comments.
I'll also expand the commit message to mention that returning the
error directly from snd_card_file_add()
is consistent with the error handling used in functions such as
snd_mixer_oss_open(), snd_hwdep_open(),
snd_pcm_oss_open(), and others.

I'd also like to add one more observation. It seems that checkpatch.pl
did not detect the style issue that
you pointed out:
------------------------
phuc@phuc-desktop:~/work/linux$ ./scripts/checkpatch.pl --strict
0001-ALSA-control-preserve-snd_card_file_add-error-code-i.patch
total: 0 errors, 0 warnings, 0 checks, 7 lines checked

0001-ALSA-control-preserve-snd_card_file_add-error-code-i.patch has no
obvious style problems and is ready for submission.
phuc@phuc-desktop:~/work/linux$
-------------------------

Best regards,
Phuc
