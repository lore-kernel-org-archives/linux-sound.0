Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32983D967F
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981157; cv=pass; b=PwMZw6PPnX3rQtUxmuqZyhL8VcGSWfZ+3czDu5uw21G31c6iygi8rBTz2FjEcohsw4gw1/Gd2BZegSgSrnhfIFQt3+6aeJotv+OTO8cqWe7FEe+5FWMSwrouWwYr5vnsOhuN8imj3CVclqbAMO/Fj7KqnD19JphYH68azS1ytL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981157; c=relaxed/simple;
	bh=tkrK3lO038Qd1HBHNXNXTc2bJNVlp52VG2v4u5e2UJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMHMWdfuFlY2v4Y/btXZZJ16CxRbRyZtv1xg8PiVXQonuvFK97EFhjsKPFcLJvjR3J7b4mu91CXtDavNhCbhrpnQCasYmIErY5ZetkbVHs1aZaMfsVEnI00FFgVxKEkBQdC4Xhb+8bWHyssRZ4IVnvTm95WiAWLp4awol33I5dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDQLI8Hs; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDQLI8Hs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c825c88744so14826535ad.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782981155; cv=none;
        d=google.com; s=arc-20260327;
        b=AUWCU7u+NgjZqtbZmQBC5y5xTt1vTn7ZnpomZt3hlVWUo075i9o1O86uCjglwTOLUQ
         GvdsVxqFBiEY+Qs0CAsdM8od2WE/vl0gYS6YSeIGQEzJviNJRopsxQoZEzq6BEwcyeKD
         kSrtPQlJ+DeQVo0RIx5zUm8ZQP3nC4JK6rhWx4ZS22ocAGr9Tvm4Esx70j8/P8neWki1
         A8Jj7hX+pg913N+fzBKEaVKLrHiMTNcFe7JK6fDracPPbWrR3FWkdVY+2XbwjZer5Hmg
         Ukj5sOlFfIjf0ex+8oARowU0vyXWFV+bt+/nKBLsEBkh19hRwMTNzxAB14YG23DV0fqJ
         rrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rVM4Sv1XrLTHLgqIUV62wGm9lV4mGy+I0fwH5TWlIOk=;
        fh=m7/HsjIet10bH5Q1kka1PVVLhEX0sD5Mkv1uOkBRZB8=;
        b=ffwHHzBHBmG841M29bePbpnf0ZrxbTm4SGV+PsIwWjCLt7zSc/8QCg5IW3ci56NHHs
         RcMXaZXJNdoZH+mGN4nmKFl6w1T4dDJHGUjBZhkgt+M4cxcFQuXvCdrNkcK7mwtiyjL6
         GnFw44W+53IVwj5stK2nX7q9+wiUAOhjgFH+YksVn5vg+uTt/rSjana3J0eU8z7f5MwV
         7X9HIA6TU+KHCdGoU1YieAYLjhms2QGWWWpxtg6BDLD+RlNgOgeJepfMNdWYFmj7rj9g
         ShfYoD55UbHwYtiQJvZ6PYExRgu+Kg/D3x4am1yTSqb1CUEhvGJiRMME4SO8j1ckYeh/
         KEaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981155; x=1783585955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rVM4Sv1XrLTHLgqIUV62wGm9lV4mGy+I0fwH5TWlIOk=;
        b=TDQLI8Hs+/6bGM+gUkl1IokA4ffV3MQBmfAXU5l1n2kWAIHOFB0B308nfmG8xMJKld
         j5zUNwL0Z8b2KTLdP50uqYHrfxsMBIe/hg/YXVmgbZgh8ZcP81/Wr/eYCV1JE8ryA3GJ
         5TZkKo298/vTNl9P8A6diuEH3ba+CCo6SxrcVx4//tq3Q4+SxmvzJ6tlWlYXAWcinvcK
         DeTW2OtL3q5m6IW5AK6tfw62Fn96TSkX4uO2vF/blkpI/RLLtEIYUjW3p3OSrgi0KTjw
         3CkdK7aI9+rKmMwL61Vt/4rmL18aVB6uXm1flFWvS96LKjfbGmqzw2jMgM19cNGxA4LD
         naRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981155; x=1783585955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVM4Sv1XrLTHLgqIUV62wGm9lV4mGy+I0fwH5TWlIOk=;
        b=i6mNXoH6Oz187mu1kjlkWGWqZ8IqUbBLpD+PSWcRNTkxzwygDTmQELPAZQmozcu30T
         2dalJWaR84vxJpT56kxJ/MhVD7xNEOHoCh5/mawkADwghorMR8bEHmR872N0ERc1ylw9
         zJYJZlrnksGGjCfTWxO4+YnJlPlhXr+KIAEHoKJerFfp3KvwwWvwJnlSSds+RrQb3r8X
         u14xALNZI6j7ZiiypiUt0VZTVlDDzIlGhB1cl36RK7NMGOZGLLy6Pt35vS3ky2k+VRCI
         7B/95Ra84go7koZZPmuV1HLxIKhalrdsOh9W8MEkS5rFjNL7CLjopsSG/NaFXwXjQ5n5
         Uz4A==
X-Forwarded-Encrypted: i=1; AHgh+RpD8tXClI+hrnEU0Ow8mSbWWJue6JD7G2HAbGmpI+21gZD6y2WHrrqBlRDSt8x2J1UoFCWfjggyBysFQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfW7wz8NXwX0n+gxmWmLey54aDlpEXkp5HN+aC4ATXRz6peJts
	7s3BWKRLTtK4ZKkOnzXU0nsta0ruFb5l2DYl1jsZGLgBiwhemnORgOiuwcbDSEB4exVoswWfYbi
	GOOUi0QmPLpLyHWSwWa0pbyhuLrNYhU0=
X-Gm-Gg: AfdE7cmBvai0GNGBFSWtXmU0SA6+C3nHDWPRPeM53Ibhy0oBPY5t4JeSJFv+D5+L7wK
	91W4wb57VvwXuhLfCjBr+TyvlqwOmKFgg3tfUICNFdT4wcYpmVb/Pc3KRzDQeDectwriuPOQSDN
	NhUqlW/42P/s92umElRGgfxZ0UssjPlswi1RJ7HV/9fyGhKHEgvfC6tqnLD0KIfgDcmGE3TwO2m
	l48RCm1UUvl1EirlKT0pC9rFpyZGCg+MWg4NmPhtehCEGHn8u9xGB7yNNnd6Znj4ssTOnST6WD9
	D01kT3NdbDmSJ1j5VrVMptH8Ee4=
X-Received: by 2002:a17:903:9cc:b0:2c9:97a8:8c1a with SMTP id
 d9443c01a7336-2ca7e8d9f82mr53072385ad.45.1782981154935; Thu, 02 Jul 2026
 01:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702035704.27092-1-phucduc.bui@gmail.com> <87echlam6x.wl-tiwai@suse.de>
In-Reply-To: <87echlam6x.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 2 Jul 2026 15:32:22 +0700
X-Gm-Features: AVVi8CdZ7UbIXQEHlONt6FOhGjm3kj7OeTFPJedgHvdvNolpjpYP18nvUAke_d8
Message-ID: <CAABR9nHUzp28g4_p4453jV+ZgKomovC5sw7dDqN1oZ1G07f6wQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Drop reduntant nonseekable_open() return check
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
	Cen Zhang <zzzccc427@gmail.com>, Kees Cook <kees@kernel.org>, Mehul Rao <mehulrao@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	eilaimemedsnaimel@gmail.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san,

Thank you for your review!

> >       struct snd_pcm *pcm;
> >       int err = nonseekable_open(inode, file);
> > -     if (err < 0)
> > -             return err;
> > +
>
> We don't have to assign err here, right?
> Keeping it looks rather confusing.
>
> I see a similar pattern in your other patches.  Please try to address
> it and resubmit -- at best, as a v2 series of patches.
>

I'll update the patches accordingly and send a v2 patch series shortly.

Best regards,
Phuc
