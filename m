Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB722256B
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837704; cv=none; b=VEEt8BEu5LAInp5kDL4uxpjXiyKHmLSkrbUmLa9u2bFMhk+1yVViBqQTys44Q9Yx4xbDOj7cxrTQ4jSKKm27bECOP8HyjZuTLbCeQ1TfAWVdQyIw0gKGRq1dgwt94w/KGJtJpDC0zLbQ4HXu9dIBY8TNpYdJzRpBkApi8rsJH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837704; c=relaxed/simple;
	bh=qn1EW8XbpUEPfshguM1UXlEigOcP6JmSX5ffhupl2KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlvHQ5jA17UTuNRJN+Lsg7yfWGwC1xwbQ7wHTIYnm+NOX6TcftJzhaUByAhiOqUzMuft1xxBtgz/v8ZYIorMZqB3Er+/qJhTZcUxiV9mTFIx0meSbkoPEXCvHs6dRuIy+LulvMfiB+1Y3xhm4XLRvO+h+WCrP2R5YBcTLNhTnY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOPdWDX0; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOPdWDX0"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7b3e2a51678so4455286a34.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759837702; x=1760442502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn1EW8XbpUEPfshguM1UXlEigOcP6JmSX5ffhupl2KI=;
        b=lOPdWDX0WbtmgZyYR3ZAC442KRaJ9f8+XDHTX2q+Ds8wuJ1ZcmUOkcJUPsGL/9/yc5
         o/np7vMmUxjrlHJ+VT1z4ar2sjlttndlxrxujz9eFuY9A9pUD9NQ7st95Ezhr7mrzafl
         ZIfLfeemho2FLWHM5TiA8d4YIGeeF64G2DIEFRvlhggKWhscq1/6GZcOE2WgefRG9x39
         3BsakDcyDfkrLE7m44CmWiwy8LAchcEN3wlECXLXXVxENIKaBM/40vfBMAkNkr48apTR
         DC4pITnuedKG5WoJYfe1QqnC6WRavd3tedoyUX7ALEOekMRGQUOr4HtcPOwkQPPSJQ4Q
         Zkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837702; x=1760442502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qn1EW8XbpUEPfshguM1UXlEigOcP6JmSX5ffhupl2KI=;
        b=GwhJBD42W2B69CWb/sYjGI4difyWFVA1k1yhLfkrnt1fSJdoWSX5NUs3bmILtBfD6d
         6k8n4OIEzJgzDTXsyWt+MMyaR4F7tak5puvdFj0mGgar57szbK7GxBI4kexncbSMFcXZ
         6vqc6ZT4daqToWIvLluQGjJD7m5+s7f/Li5lfdraXWxnsAUBwfqp/Aac7LLmM9vPAqC2
         Ejd6aSXWnKrSeMPWPrbd0Bs0TGb7NlplQkYuYy8fPbKJ+Xy3qRePMh2S7F+B9dLfHBx9
         aJA2iwVIefgbQ1y7eDYvz/Tb+Ns3+dXrn7+jVC2VlPGppQTsXOOcl+2DuSlMbyN53Iss
         xm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmEcCZjF3xz6Db/ArGrHQAbmNpxuwyT1RqzKGlp9uR9ktzhX4GPP+TvxLQQsaIVkXjmUE68gTbD1ZnbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtod/n3n2IprF9ihun1k07RE5PZrdCweq5YmA7iq2vR1FqmYS6
	qf/hajCwJ8P7BkG/oFggIxAdTr1XuTokHq0dEzELWB0E4IFhAKM5wHt8cl7hDM063CVKcsQnqj8
	3jftrM0ElK7QmIGJHlbYSseR9ya2uXqiGWO/A/JM=
X-Gm-Gg: ASbGnctMyyj6HXDDYu548G4li5Lzc1ZoWxUZI5EWyJYGictKISi66o7t8VStNI39eMm
	Y6QJeBkg/QeJATv7Dt4aLXAmGQvIapK9LdNjV4685f580ybcVB7CX4Z8yfoEVUj+KoA4BgLhApQ
	OfarbM+HaFwD7dmuMfZwJ1VJcmoZLAs5C2ynvumVqASdsnx1A9N8MiaMoQjrQasddIxSrC4aGD+
	PhtXi2Ba1T4/lT/I67OazHO2VLb9Ro=
X-Google-Smtp-Source: AGHT+IGzdzdpFSUrzKoYDyvEBwJHH32FA7vjyWVUyv8QE1FR5udDMdkDZFE6Jxz3jhiDr00fWFVT+sK+ST1PFVPIsB0=
X-Received: by 2002:a05:6830:108e:b0:746:d097:9342 with SMTP id
 46e09a7af769-7c02af24fb7mr1222015a34.7.1759837702013; Tue, 07 Oct 2025
 04:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <20251007113305.1337-1-briansune@gmail.com>
 <5a71fdac-f6cf-4557-9bc8-d416a033263e@sirena.org.uk>
In-Reply-To: <5a71fdac-f6cf-4557-9bc8-d416a033263e@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 19:48:11 +0800
X-Gm-Features: AS18NWA55n0Y3VNYOKtA1T-Ox8UcdKZlQuYosvTxXbChdMgthbuz1HcL_8xi9YI
Message-ID: <CAN7C2SCHirxurUA0n2VZKEEiYCt-NUKgspGFfZLNurHhACZkBQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Oct 07, 2025 at 07:33:05PM +0800, Brian Sune wrote:
> > The original WM8978 codec driver did not set the BCLK (bit clock)
> > divider, which can cause audio clocks to be incorrect or unstable
> > depending on the sample rate and word length.
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Sorry for this action. But this patch is just a title fixe according
to previous comment.
Patch body is fully aligned to previous revision.

May I know what is the proper way to amend the title?
