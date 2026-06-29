Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9C3F6C2E
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743210; cv=pass; b=Zuny2RUvWE1Fh5Ig6YE++NorDjkbCWvJfprx0mFqbOKvS9/XdFAvHEuRwXtLUUf7/yNupu9v7pj90guQq18inVYeiirozVpvsjctqVx9paUJqqtt6Ew7RME+Na4p8a2Zjnd43jb3qkP7Us4YvN7S7AbKtAU6IIUxS2OlFiSDdcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743210; c=relaxed/simple;
	bh=VQo3M46Xw1idtnFaRVDUwJLb6cSnxqs1+e9BZBcaKzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8LqykLFLYo1api8Px/HF0G1ypTKZOlfKiSdYyMYKSOSjv/iKOdK0OBdtW1rwX27gBpwsQVpUDJsKk78/OaEs+KfIO3Td21hV5vS5cXC0/hIONRG5aYgvJ2fJgoXuSUzhM6zxlNwk3o0vklKVeRB0MU5k+0KvmcmuY9Kgzam8+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve0t1J+M; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve0t1J+M"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c821a50615so16591035ad.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782743208; cv=none;
        d=google.com; s=arc-20260327;
        b=bmhYrh97+Cy3L1gC3d4SyyjlKTs0I2HGFJRCWg3r1kusLm90qxuSLVGq9j4jWGpzpG
         LNvrLDmpmMXWULuCfzeDqI2T2/xZTe8rK5w7qpfBd0Y3L3LU1dWEGkYvSj/czppz4vdO
         VcRAWjX0d45ANOOGSFtUsqaLF9m1olx/bV9PDcBgNbRPECUXych0NIeozz/3QxscrCMg
         H2XFiDmdhAnCEQ26BLGDL7xxgIWF+B7uNT4paWno9C1tre8galolCxAD1sqN147OlPz9
         vftP6sW2WpjTRsvtTeq7IwUvwv+atk0Bg+qa2vjdD/l9ARloJNzcHkf2BOy/1ixo5rRv
         T4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F90ip5cODvLIclTeISF9//Jqrr9Jq+DD+chiw9xeqrw=;
        fh=7mSEYkWNjBpPeqDb+W19wyWA9ThndF36hLrjebKoHkE=;
        b=JEru4pRpASknJNoA5XgLEkpsf5IG6Q3NQ5TtiW1X22TxyOMzz2riDZAg7IXnqD/s7r
         gzlOxZQGnsMFDX52a4y/FSs0Yy4jrXpWETmFjf7ZoJc5N4zI6Q7KgaFwIB12/Wu0A0pu
         qLHlCluqBwDDYbAGraaxFTln3xdS2hxBwrmKVuBTWhFdRSnHOYz24g6+EIddDxvzustp
         ItT9W23nIXtj1LnBoBzMifpDmz2QUUZeN7GZp+BFRuRpEl3rtBDO245kQRGs3TOoONcL
         T8Py0AJPgfDTx9gbjWehVDYOSagYsx3OIsSsG8Uio1u4lDBANMWpCZ962w/ji5ygdYft
         GovA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743208; x=1783348008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F90ip5cODvLIclTeISF9//Jqrr9Jq+DD+chiw9xeqrw=;
        b=Ve0t1J+MA0bagznCfNSk2kUcMDxEajgdi0lZ/RCMy4v2wmtNTaP+3RZ/RXv5fg4y2q
         XGItngEfcmRhEp3++Y1rZzlwYq8RORdEy2s5eKP7mJ0sg/QA1qMkek5DuxSnA8SPu0HY
         AKmf5W81Vl4M/Naa86jGRKC0qqZDk0/f5v3XObv6PR1Pymdq/WQ2AIEjo9EjW8n5znSW
         BEBRdLbKeqG53v8tI2NGlhLIHjKwVWRbKkpX+KXxWWMUS/jZf/8ic7dcPNzTp+Ehk5KS
         /D3e/RZZBp/lCd1I9FpGYDkseET1Lfz3Fja35nXsudR55IbwyzVpdjbSMtho+6uAF+Ir
         l5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743208; x=1783348008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F90ip5cODvLIclTeISF9//Jqrr9Jq+DD+chiw9xeqrw=;
        b=QPK6eDxC42TvV//bQNDN9V9szqqeANNaZvhvIX0qWXC17UDSo4XP4mB8gPf5e1V0sL
         cOhG0YchYdLb9KzUe1RRlvQVfMv9VsEbnJCTTqKL5VMaxTeare4BJ4hj7pNrdl0ucc+o
         MCZKjc+gt3mdYTzPkNCWrrCayEodcg1cKQ05yw2A5v92bmeqWVI2kUoxTaciwxRIMgtG
         ALoYM1PsczhzBmMrB/ugfzuNqZOqjVbKLrnl1mEw3DqQrHAyNYpZqa+iXBjNsBmjtlo0
         GXAQ+kcKvsLtSN1d/S8qMdZbZr+YP8yvktuIFIN66mUQ2SxY/wgYsUeacM7WwM7MBeYq
         5gUQ==
X-Forwarded-Encrypted: i=1; AHgh+RotJDyStGZkSWrBHuFo0a0Xtxnt7qdKW6ZBWsJ5CF68FGTb3UJF6e3/sAg0BLbXFxsy4NEmgo77hQkUIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIh0Y6ooAdPky+kT1u30MRWTEjEEUEYJR6SUvJ+9t7JMgt7R7G
	dGfd0pKDLSj90tSjYPBpOvW9M7zPCK7ssJc0njEfvdjd1zUSTpQFP9ge83OTGr22+j/9Tg+XpBa
	rqV6COpPProUndMp/IWnUjGzFW4K5src=
X-Gm-Gg: AfdE7ckNxPrUnHH3+McrHgF9jia3UX+InDzBUxA74+IKQyx1Foued1HW004x2QwbINQ
	x3FIeO8CJ+jqRgYn8+J3DUMy12+3u1CUaKFmnzvfJdzeN4OFqq6+KB5hNQnhiKzXZe7zx47CBKt
	8UkyfTyITz37SPmtOVQn+t7t9VvcI90xnBACvrLEiTW3tFS6JtKH89KHyc7oN88jG1KzLUiE04+
	Fu7rYxPN4Ws0GBsLCLJP9xs6kR/viiKe4GdzbYcP4cRJxbp6zupCiT379X2l26uQxUhV8Li5feY
	JEHdVDdLRXibv8m8cst6lON4Din30WPipw4vKz58oOXz8xugbNFcY3mXaIi5nA==
X-Received: by 2002:a17:903:46d0:b0:2c9:e5e6:8621 with SMTP id
 d9443c01a7336-2c9e5e68762mr45603635ad.25.1782743207701; Mon, 29 Jun 2026
 07:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626082904.32344-1-phucduc.bui@gmail.com> <0b095ccb-5208-4813-959d-e82480bda50d@intel.com>
 <CAABR9nGtu83T-_riRpbndPyqbhxQpNrcXU-avy2m1VC-H4_AZg@mail.gmail.com> <e0a41c2a-3fa1-44d8-afda-71e21d210db8@intel.com>
In-Reply-To: <e0a41c2a-3fa1-44d8-afda-71e21d210db8@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 29 Jun 2026 21:26:34 +0700
X-Gm-Features: AVVi8Ce80U3RQJLJuhN7N79SrKccrEDqy_tA7papD6ArlpJGey9Yum9qc48WZhQ
Message-ID: <CAABR9nFoDBdGYVDNLEkyGHHksjE2z+Xd7MV7mwdFjieQvD+47Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] ASoC: Intel: Convert locking to guard()/scoped_guard()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 8:25=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>

>
> The CI is run for entire patchset.
>

> Cannot share the details but I'm talking about actual long-term-support
> CI with large amount of corporate resources invested.  A lab, high
> number of physical setups with intention to cover every Intel's AudioDSP
> architecture version (starting from Haswell) and streaming-interface
> type (HDAudio, DMIC etc.).
>
> All functional tests are fully automated - imitate every single scenario
> we do expose for our clients, regardless of the OS type.  While again, I
> cannot list the tests, the basics are quite simple - bucket the
> "functions" e.g.: system states (SXes), device states (DXes),
> multi-threading, clocking (the list goes on) and do: atomic test and
> then a combination for each feature from each bucket (if valid).
> Incomplete example for basic playback:
>
> - 1x default endpoint pb before s3
> - 1x default endpoint pb during s3
> - 1x default endpoint pb after s3
> - 1x default endpoint pb before s4
> - 1x default endpoint pb during s4
> - 1x default endpoint pb after s4
>
> Wait, does that mean the tests go in thousands?  Yeah, several thousands.
>
> However, without such investment, people like me would not be able to
> propose and provide reliable contributions for Intel and ASoC both.
>

Thanks for the detailed explanation.

That sounds like a very impressive CI infrastructure. Having such a well-fu=
nded
and comprehensive validation system is clearly a huge advantage when develo=
ping
and reviewing patches. Running thousands of functional scenarios
across different
DSP generations and streaming interfaces certainly gives much higher confid=
ence
in changes.

That said, it also made me think about the `sst_media_open()` case.
Unless I misunderstood something, the CI didn't catch the memory leak
caused by `kfree(stream)` when `snd_pcm_hw_constraint_integer()`
returns an error.
That issue only became apparent while doing the cleanup work.

So perhaps the patch  ASoC: intel: atom: Use __free(kfree) for stream point=
er
 is not merely a cleanup patch after all=E2=80=94it also fixes a real memor=
y leak.

Out of curiosity, has this function been covered by the CI before?
Or is this simply one of those corner cases that are difficult to exercise,
even with such extensive functional testing?

Best regards,
Phuc
