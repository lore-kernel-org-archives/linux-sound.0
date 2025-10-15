Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD402517AC
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541852; cv=none; b=dRv8JQy9wSkC2E+vvrZMcZmxZVgEcK784mSruczHj3SWZF4ybRxGWSEmsTqmydwTQI+xhw5BryHjyRjSVCsR+4xw/n7f1UrlHu2iQjoF+Q+YsoFoSJwZdGyHTBelu4TfR+xluQSPAbnQa5mdc3BWmbmGQWQmZd1qCXLo5cL0YLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541852; c=relaxed/simple;
	bh=fHi4Sy6ZO6219mNkkAMO1NN3Q4Mdyg5IgRsuybnGRaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFt7MHP7Rgy7sIL+ogDcyY/elby+9GlasI82HO5x7IdNkZ5ZKuoJNlAvz99LhbfkwVOQzAFsRlqLk78nNRly/3FWqc7Aw+SQ5gzOY/xNxTAocNljtenoFlLXf9V6Qj/n7j++KsLBhTI1YlOoDr/ToKcLQ2LcFtDr9dE+lI9v1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OTrVNAKi; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OTrVNAKi"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-375eff817a3so66107451fa.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760541848; x=1761146648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSysKNFqHQrm7HW9ou4XnQTMAOsGZaUAittjs2tbdIc=;
        b=OTrVNAKiUj4qeasqNWzZ42f8ThURb98tRuuQiiRi9i22KyrfK9OaHx/EVt5x58t1gZ
         KD+YvoJB/8Eb4jVu/ECj+0iD39uQwpcNJcGFBuEeB8EoDOknVSzObH8RxQ/KGiviBBSs
         77euI61oMwKrh1mGcXqviIYaTHO8zJjouJq4r5QfSMEfQd54GfoP2v0v6IcLFJzuqJE/
         J/AFAYncprUW99IS5Hv8MtLjHLEp3ZL6EXQPztB60er91EmJrdjUxEoT6BF7pYUgoUpF
         kBfEo5rFtV3boCiHiPvxM9nc1j2eXlm5j4lMZwQDEsCKb8gWeW/i7CRo0vpWt6V+7ozO
         uqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541848; x=1761146648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSysKNFqHQrm7HW9ou4XnQTMAOsGZaUAittjs2tbdIc=;
        b=QS82ow+1g0d02286ZLCFUsuhbwgsuqqSbVkes9R+fJ1BdYtoepW+JoG75r9PHF50Yp
         6+tb65rhd86YmFnDt/4r7OR4zdPLY+cHasHZXL/9nQxgn29WyB175My8we09sTwoXxpK
         fXPYYO/rxBCa3dLDAdhjfB/+Q1cm76BWk+elvo9YbxUWw76Yg3anwODdVTTlg6BNY95E
         jruuPmhfrBTyimSNiVv72kLams9Y/Qy87FXcs6o1oECTrteQh1Ne8euAzOElWrOZUHx5
         GAb1xY3A6MPScOP+vXDDiCLuxQvws1YEhkXwfUK8F0idyp9HbWDcGwuohjyiILzPZ7NT
         6p1g==
X-Forwarded-Encrypted: i=1; AJvYcCVOnS21idIf01J598Wg7aVliXVM5A0tQu5gIJi8O5Cc1bD/Kq8T/0aW9NFjA/3ql3ytP2C3pK6BUHJQEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6tWA7RtU/MFtVaJ1TnG5V1SndgQTqsBeadicj3vaIMC0pa3U
	SYaN/cidAoTt6e2WJWHSzPE1ndZxPKTHEKIISgQAFnwTgiYXOmmZY5Pw1GoKU52Nrunxymub9r0
	94xHGdX+jv6bVOa5cgo5ysMb8CFsMjGyAYjQrWITH+A==
X-Gm-Gg: ASbGncvl5JV/KbTzs9zZfF/RhubiWINohiFl+qZxkdo69y1la0qtrYR3UlnEG5tHCnQ
	ieU3nvwkUuj1EFL03RNg1LaTo0jyXyzmAYmlQA30QTPSFxXDXNYCzarGNrIUs/RWewCBhQQurQi
	gh3GZthtsezeR2BNB+Ka09yXH+CUBEsYk/sTwsqF1JdwV7VX6EHTomDIWzkbb7cjSjeGfRF/1sT
	l+5ELg/YQRUvyjaPuYrnRl8S5pbt3qPQifrk1u5O9zl1AOwG3ppaj+SgvY=
X-Google-Smtp-Source: AGHT+IHrIpnmA3PfhS5F43KKvrlsIpMZQHo0Y4ikDQOz1PFqFFjsj/VrWWbwy50E1b37KRiZ2S09Lm6qe0KfxZLGVVM=
X-Received: by 2002:a2e:a541:0:b0:336:bd8c:5e53 with SMTP id
 38308e7fff4ca-37609cc2d6fmr78271231fa.5.1760541848431; Wed, 15 Oct 2025
 08:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929155053.400342-1-marco.crivellari@suse.com> <176054173655.179445.8487996832699914920.b4-ty@kernel.org>
In-Reply-To: <176054173655.179445.8487996832699914920.b4-ty@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 15 Oct 2025 17:23:57 +0200
X-Gm-Features: AS18NWBvKtm51_JvZYvvvcOsZcx-fI7s4PuiuLPeUZyiDl7r4VqZO-UJmhBVZGc
Message-ID: <CAAofZF4_0+ZK5hefqbDksxtSe96ZnR18uQrr3Xw17zvYd_fMmw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] ASoC: change system_wq with system_dfl_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 5:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> [..]
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/1] ASoC: replace use of system_wq with system_dfl_wq
>       commit: 0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4
>

Many thanks, Mark!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
