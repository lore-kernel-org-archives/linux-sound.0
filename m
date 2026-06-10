Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2132C937
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108842; cv=pass; b=gjLcbg0VlVRloNxS5moPPwIpic4gxsdmj/ksX1mxXOS3/b/xugs5ZgQoM3VIBgvuuxwZqAWFZeJnRcyPaVEYcb4YwHcGVwxb0MWZmRVE1jjGVCkt8ACxMPMTuc+Ri1n67uYGK+lxUEbHUkgpXh+CPBljHuvGEzkZrJE7H5lvHHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108842; c=relaxed/simple;
	bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZZm6o/cnRXNcFqzzp0o3Cr3Wfa+ruYSfakldlxCEJXe9n7/PBBeOXAt5WnpfJE2UALpTOj/kSaaWXuyRoN/0g4K+INo/n67Kfuhis5uCNe+N4R5pIlNnsT5slWyWoVgDcfsSRN4eTsCV+gFrK6El0glmGeYLnWdARpcOhjqvig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kH4Eg3hu; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kH4Eg3hu"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d8b644473so6543707a91.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 09:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781108841; cv=none;
        d=google.com; s=arc-20240605;
        b=PpXBl6XWsJu6EHo6ypiy88RD7cJSj/QcN4RlQGn61fYeDEuccsTPlMZk8JSFzBWZLS
         OnXmGn3N6vBH5Hv47OPoiD2Ywy7MxnEKG2zG/a+n2R0rhe2qKm/dXvouR00xaOI50qRK
         3kU7lGFLuGD2XI0idYQ0kHegwVEUzE1tXEbgFT9nu2x8Ng3Q/beQ6lWQNRKcOlaaTfcQ
         zBzvr1qhi2UITQmXj8pKIoI4wGvALtMJDKQNag/FEiXG7trkmG/RQCK0vrCU1ukPSo2V
         xEKpceqq0atxACZNKADWmh9jZqgo2x5gMFrlKmXtI9uSxLiCTDokGhR/L44eVgAssu5K
         Ps+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        fh=HBNMKnZbk9/I/Sqf0bicgP/XkTl4zpyQhaYdwes0EMU=;
        b=Mx5z8HLGJkvRooOUm6+3d7LnN4KTeeoHSXpTstWardLQfdAAqfX4l8b6KeYvcqjLCt
         GnHNZXC4G/LQkWDMAUAYRl9W5eXnkDWpgXu9cVeVOWhG2OlB2gZ8hSicvKr2dHTjuzzH
         tSqyvi2ZRaqpQ0RYXT+k1xT48GI9dFZx2B1SuHjqmhktzy6gOC6T81OgXNwv1ZDUgg3a
         qpHYkw1xoXrrE5aZZrxmfLKaFNC3+gW1GmqsaZ33LfBMrpHd1XMuvUtICIfkmjY4nmyR
         52KFHYQssbkV6VqAPzy8ENNjxxuSUtRu9ymODwQGT/i/7JX5KOPnVhPjSyxBA/YCSv1g
         RKpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781108841; x=1781713641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        b=kH4Eg3huAdNobHZO3LKuqi3yG0V4TKLmMaZ3gdnTUxPKB8q/pbRhRRnHjifebeuwUg
         /6PtsgAejzrssNRHk24CwoMwgwlAT++lTCLCyXjiiFLEr+BxdeDsKA+kmMgzEOlwylrm
         MIFaCyACWSyR+iBR1rVemt/pd+2ZMTdhDdAasoM54tMG5xqxEUpIMR1ErKtOp0Nk16Vn
         muNIVONORqIXQPaEo/EcWDRbLdK0bS2GqpNlYRov1R/sDqkyIXYN9j6E1/oP1FDx075V
         RXdo+tlxeQK+lABo0g/YMff02ldlMNNm8GLJP/KzPiKlMBSXXLTFq6BfNPXe8VzHWp0E
         +Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108841; x=1781713641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        b=O3gaephizar3NhbWlW7oFtxyGl4UwNAy78B6BsTLW6bB0v6373nPhJ8i6B0lhW2trw
         e1rj0icGB92BlzFdhHQPBX1C6KtjNHLtNguSW9zXp+Oph6s0I4Reu9QCxuTIxaT6HMYB
         ZvVG+5PjKkMZxGpdUZXLIvJWynKooZbTltSrvHqt7JAYHrPRgriBAK/zgoGvrCUuLfap
         G7+FOCU3TxmXadu/HJBp+dYQUoEYHgDACua/I4EYjT+mN+rvTDhDxbMlSAkmn92lgpXF
         d45hiO0hbd+Jmt0M/Z8r2p9UJPglBrJh6QXkTTRa9anzqIXtiU1/Ys7GMVCZvL6ZO71z
         LyTA==
X-Forwarded-Encrypted: i=1; AFNElJ/NmJCDDjAFUkz9ibPw57sxPk6RG1QRkko1K+k9kG6gewHh6f2iXnVa1Q6dbpo9zsjw/TDlptQu/jRyPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAQBD1hkNuO1U99L7b/K6MPEQn+UyYaDSKaHpEGpn+DHrYQdty
	a9MW7fM3Mi/uRn46nQQ72LhMxm/bDsN3RP55DtrKogsZbgwgwu/AVjaeFdg9aKsqDToec8Ai8Z7
	Re9cwHKinqr5D7cBM+G2qU2twG7/OJF8=
X-Gm-Gg: Acq92OFDaJxMWxuzcyZGZNXpptoIl1vVvjZYJaMsrxPss4n4ZpCKGkbXabnAoMq1ZiM
	+TK+c7xvpMFBSSIrksB9ejDiZYxjfB5x9DRdQrGtHJA1kXnZWXiYXFMrxXA7ilDCKvJPPehv1kn
	+PKo0pwkyuZ63brOj2KKOY3x19IAw9rXYVIbsspayy1AU+Q5iYJzC9LSzls6kXrbrLsveG3U570
	axWC14piSPy5blJ6r+h6zj7ApOmQ+/JCRylXKh4bSfRclyrfda7vkcrmWrvAfaJBiAUFTl+8yA4
	eWzbj9Y/+CPjDuG7SSHv/pBl11sRhPe2lFALimCalraeb31Hbwdr4X55wF7vzv2TjzYgYXqb9HD
	8CY9iTM0=
X-Received: by 2002:a17:90b:57ef:b0:366:52fe:e749 with SMTP id
 98e67ed59e1d1-370ee82fe8dmr27418313a91.5.1781108840969; Wed, 10 Jun 2026
 09:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610102153.83367-1-phucduc.bui@gmail.com> <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 23:27:09 +0700
X-Gm-Features: AVVi8CdWIBbIpW3MLG8tfEMGIpXySN-LRFKOF8FKPCNJzmWknUgBN9OHls3Pa6A
Message-ID: <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

Thank you for your feedback,

>
> I suppose it is OK but it does not seem to really clean anything and
> make the code easier to follow in that instance, from my perspective at
> least.
>
> If there is policy to systematically use guard() whenever
> possible then OK, otherwise it seems unnecessary.
>

I have noticed that guard() has been adopted in several subsystems.
Since this appears to be the only place in the Meson ASoC code currently using
mutex_lock()/mutex_unlock(), I converted it for consistency with the
newer style.

Going forward, should new Meson ASoC code use guard(), or should it continue
using the traditional mutex_lock()/mutex_unlock() pattern?

Best regards,
Phuc
