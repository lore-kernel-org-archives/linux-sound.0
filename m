Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB35C3A0B24
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330865; cv=pass; b=mN5dLx40tBtzUfM0M9RydHpxvFOeu6XmBfI+cdPKedyRU4qSLoitgV+bTeBzCmWDqdmnwuBT8VdYE5HNbInvK2LHkTDC7bOWPrLZ1ks2dinXnsKH69KKiqcO4iZLnOXIX3APsZZKnjSbC0SKoTH3gXmKf6662aAFB4Ka1/rhlfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330865; c=relaxed/simple;
	bh=Mctj1zh7YBcy0GipoAfTdKesnqt9BFzTnqlVXgz2YpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8BhR7+Zy0AanDrHVC/jlp5QJ4av4N/+GUXYuw9qEgxDnFj8IrRW9hP25n5KY6HjNpRwkZdD8PAlfflWdkxV+4S50huU8kBsYCf5VCgC4y0Rba5/iK2ZA+HPuTJTc1r00aQrwCHyDtw7kOBYVSSB/s0w0C4XATVy6T9kI3pOVIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5XrvwRO; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5XrvwRO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847aa193d98so2266889b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 02:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330861; cv=none;
        d=google.com; s=arc-20260327;
        b=JE4qnMvYo3em7FZAtoL84Ypgd0UGu5SrGN/al0DZoP90PkeyxKe9k6V/jb9M6XunRS
         YCZqBK41P16fSJjoxw3ozpS37YEPKFg3AtFsS4yCn02PtDLl3XMzmXHYLB79h0OymMh/
         IEqzx+P1+/KgXNzPFlGI6DDyzSdxFfQnRbfSQIkdSVoPZIgXaWzDLa2J7QN6A+9XayAy
         GoTcgW6/Hc1NL7SUTzRxuk3QXYGWpe1UPsrl/7NWruaJlSPiCdgINnBAXaGxtFrLHt7w
         CEV9T2yaaMhEU1v6YJAp4AKl9C3DaSRPQvfdwQcEWY+QWEKLDx9c2aQHmRlkPki/IR3+
         ygDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p7D0zG2jtsdRYV96bO659TqrpFw7VbLJYC51r13a7cg=;
        fh=4BmLgitN3shamjiIEkdswXrrSeaX/jFp4m+DxZuRjMc=;
        b=GpKQvkLhmLQN+e3hVi/j29825rOgoJTP+uB88Se7gTcXW0biNeFhUNBrMkMu/GbK4R
         vh9ocfHNksuRKplLb6Ip+GWEiKYJV7AA6vjAExlwAm6U6k1NY3Qm/MPvpa0rOpjE+d/L
         8EBzITtBjuXMHMmPvLFDfASatsA+dDcj/oUUkWOVasDotY8V5FzeTB2/oOd0g/fub5my
         hWO6oxbhpFbQWjr0K3FSIIhtB9JMQDEdKQqCCmxfvLTa9kd8Rg92Ggizznc0rFHpcGD+
         5mZnTHrRTOebkK7eO5WouqV0CDk0OXoWxazZBaJp3tD0ceKgwxxbDbTtxToN+a0UVOlv
         32ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330861; x=1783935661; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p7D0zG2jtsdRYV96bO659TqrpFw7VbLJYC51r13a7cg=;
        b=D5XrvwROusVo2iZ5K3nw7H+KdRts3ae0KVhHgj6rVkjKIBG7yIjuUC7+sjDw1Erjm6
         D/zFm4prQY0aDpyCFeXPlXb6phSwSnssNukm/rRbm5Lxc6aSTO9BLP+cgt/WChzgfn/Q
         QHYoJUOjtXEDIB6P+KakPItivGlLO/SbMcuKDcDn0zEHGYljZS0u0zEArLtb90W+bnap
         l/CYa4nidNAsBixzSxCczsojb73jxigTgYtj+ghyEslsQKD+6vVE/EaBiDbwATnibSBs
         6X0VCHvutNDFaZWIXkEOc1YCwAUfJt9CeQTuRMfHax7nwVhJ2nGu3hB91oxkSkUg6+p1
         FrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330861; x=1783935661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7D0zG2jtsdRYV96bO659TqrpFw7VbLJYC51r13a7cg=;
        b=EXYOmMJ1HwK1N2Iyf9rA32/rmb5r/C/9GxeWsgQo0Pa7353NuuRJBlc6UZxOICQYu7
         aN16Y3OIk89XTUNUE3/sYsyl9A9KFvZ4t+WCUUM6zNxPD1OwxE+0d5EcNwesyZP8oQ1S
         e12t/s9yPXK4CpoyEuxh3ZaUuH6C2OoJrTGL+8HSUw60JkwjD6VWgcqRfZJPPT4v+XgD
         dx8zF30TKf6jRp9yOH66oaFYRxd2s6rfAm9ZMsAqRxDzfB1hGn/vI7J5KB59UiaGm4k5
         UCOyVJnF/Lmbdy7rsn82EokJj0kH8EXEwiH4LliAGIENHrblwBm0N1WBP9+2V5dqIzeS
         w3zQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+A2IAb+ddbJ7Bxy4oWdQtkgM8R8onx+I3qPIW1V/QEyN9rGAyYEquf7G4KQBj0r83lh+a0X2HJAgJ8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjUwRxZIXIzi1SFW2xt/NwKCWXRPbRnNdrHbvPRalkpMolaBY
	NAbUZPV9rSHRt6iTeSUt1jSZ1zcZsd8nYlujDHKbyg9I29ye5559jbcbLHHmU+pW35zxIIi3hfO
	shGWdTZ40pcICLQkbfvdMsZeliOGXIwY=
X-Gm-Gg: AfdE7cmieS2zlEKdQ4Mu/1afhRV4Ym58WZUQI8MLjUjD+e4NlzH/LLqQiwRTyNE9Kp4
	jMmILVgfkDfIZV8GFOcUxgfasdXeRd3gV6exvaVeFkJH0hMsKPqEUXI0pS1OuE85dNCInOpjTRH
	xHjDPr8p/rJLvnhIpiZg+WJbGCql3rY0u+s/RiKGIyNkivV4MYqHEczqS4fY9Gn55twX1I4gwCg
	CM0orTR1+QbBWfv2sKwPbT2wFpFHPT0TRuqhMruiJn2sjc8/bc0vmilw6e15X27BovfpUOs9ELy
	AbIvb4ITRp2szRhtXx7QFCggeb8=
X-Received: by 2002:a05:6a00:8d4:b0:847:8a47:264d with SMTP id
 d2e1a72fcca58-847f6ef4b5amr8520862b3a.36.1783330861331; Mon, 06 Jul 2026
 02:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706084950.49331-1-phucduc.bui@gmail.com> <20260706084950.49331-2-phucduc.bui@gmail.com>
 <09c381c9-113b-442a-9ada-fb177d6dc4e1@intel.com>
In-Reply-To: <09c381c9-113b-442a-9ada-fb177d6dc4e1@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:40:49 +0700
X-Gm-Features: AVVi8CcMTQqkfWJHBiuQ8RLH0_Y1dapqJorf0QQha7-UF5AKWm7LhNs6HqPMLQk
Message-ID: <CAABR9nH218njttZT2jdwLG0vL7BrJ6HgX7nvRF2iRw_BTKuUrA@mail.gmail.com>
Subject: Re: [PATCH 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	Len Bao <len.bao@gmx.us>, Mehul Rao <mehulrao@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review !

> >       err = snd_card_file_add(card, file);
> >       if (err < 0) {
> > -             err = -ENODEV;
>
> Seems unrelated to the patchset.
>

I just fixed it while I was there. Splitting it into two patches would
also have been fine,
but I was a bit lazy to write another commit message. :)

This also preserves the original return value from snd_card_file_add()
(-ENOMEM or -ENODEV)
instead of unconditionally replacing it with -ENODEV.

Best regards,
Phuc
