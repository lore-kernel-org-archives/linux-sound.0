Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6D205E00
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 03:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381499; cv=none; b=huAFTl1hzR409hLeJBTkujN35sPHlxoN+ooCSa9v+1a+gwp38MyonAZSb496MQWWilxMB3tWOqPuLGZThZnFTCkoFut0RvL2SYDqo7FwysXfQ7IQ8NAsWZo+mACqTgyTp9dqUPvo1XipjsQsGC2oxavLKMREJ1ljOR2CFUsElhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381499; c=relaxed/simple;
	bh=Kz+DjEdznXySwhabk/fkyNPadUJtfFyhxjLJqtBFTMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N07QY+4G8/Hx2FL2dH0gbP0RmoTNQFugVLacpY8Pav00DzMCjCHtrM8MIpwuRZaVjyuqjWwiW+9edIVByTaLfFzdg3QAkLBe5gRBlmIImBldzj8wSI+GHmftvS5XGJiv/xwqhnGVXHFgBWl0C8hPmqMH1UGH/bhRRcbQG//C5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=q7WiT80Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="q7WiT80Y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2110a622d76so45353545ad.3
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 19:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1731381497; x=1731986297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz+DjEdznXySwhabk/fkyNPadUJtfFyhxjLJqtBFTMA=;
        b=q7WiT80YdZ/hwzK4cgDs6QQS7XbTc45NOiYx4pjo73zrs8a1t+okFVEDuNyFdfXliI
         sXW6lTGjRaK+4JBbGAFCerzGvZVxrFkgbMMGMZjJMYeVe7QnyQuVbU+0q7rjTV8C3vxS
         TBy2QrAIR1NIUpgMWv89qzZj7n1HG45W8PRqi7BRMNjyuwSfUBvzv39bnn//uUc+1lw2
         ztVvO62IFCn2hMOkeTsw0AjVMnN5xdpouXRZc8KjjHVjRgApurUt3q5z2i6/lIi8MVci
         2q0c8UWl7hJlnSCkf1OjQVRY9qKOm6l60vL3R4Sg+G+UqgTBCGP/hHvC1z3Ssd5oivl5
         6TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731381497; x=1731986297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz+DjEdznXySwhabk/fkyNPadUJtfFyhxjLJqtBFTMA=;
        b=KoqcBejZFYygIfFnsqi+sgB/AMObkPwMlbuTYa2zUu4Mf5LBKrYRasNfIDPVlAf11h
         XqyX/Ase7Cmnog/AYHNvJgeEy5SamAopUtrFKAosoq88L0z6BM/F3JHYXljSh/pbc9WW
         reuvMbqtKxpuGnrJZOfE99M3lZN0OoabletqIvPwEpnWTbOOTaC4Mx1BKNrwpMPPZ7ZG
         MIqOrbQWI9E9KwR2Fpw79mD/Dben4qdupOPjDlh+6jipyREX532AtfUT1vRasetrx3oz
         uAgTb+7PU30IG0zT8zmvkYxrFC2F0Oa94c93zfN62KR46wVzXpiqVnMpUDiQDP/JUiaR
         AEuw==
X-Forwarded-Encrypted: i=1; AJvYcCUblvPqBihj3z6UvyK5TSWsM1coOvvsSbVE2AEm0BjcjERBmrvOJ/c790eTEXzLWlBYW8SbvzTPCG7bCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXP/gJ2LXAPr38Km576U3WCkeVU8sLHIhqtvVyCBBM4ApuFch
	jU9fOVxxE1Q4CnOJaDLAhSJz8moPXllUJBUbp1EySX1/OCD/lNMO2JtuLUJ0Pzb8uDnMH/4Y9sh
	qdeBpA4oV21cBh7BkV51iwoUAFC6VoYI4cNc5LLuywu2VloSyMeo=
X-Google-Smtp-Source: AGHT+IGv6tGl/DenUr3w5nLyZlQNxRJrfEo7yfHQCrtrVXjF9Q2uKgWZqYtaSe51UMLmlsaAf8S1EKJ15II6j95pLAA=
X-Received: by 2002:a17:902:cf0a:b0:20c:dbff:b9e5 with SMTP id
 d9443c01a7336-21183d16b33mr213007715ad.33.1731381497040; Mon, 11 Nov 2024
 19:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de> <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
 <87ttd8jyu3.wl-tiwai@suse.de> <CAEkK70RAWRjRp6_=bSrecSXXMfnepC2P2YriaHUqicv5x5wJWw@mail.gmail.com>
 <87h697jl6c.wl-tiwai@suse.de> <CAEkK70TWL_me58QZXeJSq+=Ry3jA+CgZJttsgAPz1wP7ywqj6A@mail.gmail.com>
 <87ed4akd2a.wl-tiwai@suse.de> <87bjzekcva.wl-tiwai@suse.de>
 <CAEkK70SgwaFNcxni2JUAfz7Ne9a_kdkdLRTOR53uhNzJkBQ3+A@mail.gmail.com>
 <877ca2j60l.wl-tiwai@suse.de> <43fe74e10d1d470e80dc2ae937bc1a43@realtek.com>
 <87ldyh6eyu.wl-tiwai@suse.de> <18d07dccef894f4cb87b78dd548c5bdd@realtek.com>
 <87h6956dgu.wl-tiwai@suse.de> <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
 <CAEkK70SojedmjbXB+a+g+Bys=VWCOpxzV5GkuMSkAgA-jR2FpA@mail.gmail.com>
 <87ldyctzwt.wl-tiwai@suse.de> <CAEkK70RAek2Y-syVt3S+3Q-kiriO24e8qQGDTrqC-Xt4kHzbCA@mail.gmail.com>
 <b97c52ec20594eecb074d333095a4560@realtek.com>
In-Reply-To: <b97c52ec20594eecb074d333095a4560@realtek.com>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Mon, 11 Nov 2024 21:17:39 -0600
Message-ID: <CAEkK70QottpLxq-prAEPe8TtPR=QBdQWuUrjf6ZT6PipcfS9xw@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linux Sound System <linux-sound@vger.kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Yes, it works!
