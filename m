Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91B364EA1
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924246; cv=pass; b=dwSffuDaXCM7RZauCXSM5KtObvUskuF54JBeUYv0Df9mNZR7FkVxzO15T7JNULqOwEYIj/M4pFth92tVixtUJS0Hka/e09nNapZrPDuS7bTZZtDojZkfCW6MDQrtreO9/A85nw1KdLQh+XFfby/bpY30xKOmQZffimM4rdaOoYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924246; c=relaxed/simple;
	bh=QFvN1zhy7bpLhmK5D0/NfLFH7PAkqmZZAZ0hZeSoKUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXq9L7awUesdaDOrvTEhEJNiC3XQFMdAd0VTvVWCM+kc+aQe28fEdCRfoKjfFF02ZhhT/15G/DaZi5aR4Pskccmq6lE516g9yNrqoPW1DfdphduvYDlIsFBfSzmvahf6UKuKvY7ypcZuzHXceOBWcWZbnXeqpJ8e2bYBtiuBm/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INZiwwAx; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INZiwwAx"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50b3488fb31so696601cf.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 05:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773924244; cv=none;
        d=google.com; s=arc-20240605;
        b=hcQ3piBza2COmxRmTKAg5MDIJbGaqcGBUWTUKPgU4p/bQhilCWGEV1riGMhilP7w8V
         x44f9aHjctmkx6i6y9c3znQmmhGBWng4yKmc73dKcJUTgzxIhEoxDrS2zSuROAWTxLV6
         Xq88IQ6PtDqA/MOE/QmqACzVUXOGK+4RGJaSOJujx+hb6DZ0BXmUrZs4AtJ3vjYF7/zQ
         CyEAwKJFacAhFEmwYqkZP7UHP0ydLCV+n3SnKlin89SEwjpVD7FOt4twxGNbtpQreR2+
         Wfvy0UDR2hoANk4x5UH3MBcteAOC+nkf5ULp4wxQ/ZNvLduPYBF8RlZpl+onykqZmiyJ
         wSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mt+dE12LnYJMRrLwh3oqUH4MbsvAbhInAHwP12r7KCc=;
        fh=00B/7DSAo32FrDVGEUwtGMk6MRIawBUNeNy2RX8Rvs4=;
        b=avvDsaMLNes7EfCtbP6XyaoluCh+vXEDB198ghtDks4bgBR4Gsn5IkjO3K0Sf35FfH
         8DW7YK+y3t6L5FqV53oikBim+2RplILUPMaCNOZRU421JYHlNS1Hc8AJ0kakbb63HVU8
         Kjqi+kHcy3tyu5ojHClvBCBI6i2i1DWEA+ive0IQhjDYAMCnhOLxEKFzXCqa0yk2AQrO
         sqlvoHGcjYwoFsnUcomT/Vz5ZKJq6g2IkiskOYYwoSVr6XDIOjB/RcGdH6nGZEvTCgzf
         XIgTdJO27159/i5FTuZ5E7LFL9H0A+vPSr1YHVzGOiZVdYxzAxKYifv5ldYAZJ4tYFam
         heHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773924244; x=1774529044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mt+dE12LnYJMRrLwh3oqUH4MbsvAbhInAHwP12r7KCc=;
        b=INZiwwAx4GtUiX50W5yQWq33wa4+1yGB62DzNcuFsn+d+a7KNT3pCHE290eojGF60/
         8y5BmHJlLnzcpavZK4PqGsx7IhTKwW2hsAir14WJIb8bMZYRzV5KGmtz/wmaXgRyj7WI
         hPvzZSR5n66LqnNLEvSHNxXrSSG7w28KoOSt9zuABG6ReyteyXKoavXtO0pWW4PYeBuo
         MPkTOC8yDrD3oc7oPwVrSkmcyGgxFlmNfONBfFEJbRPTPMoWyGdgGJrklzkEnrmsvUSa
         JokcLHMzXVGWyim3ZtVtGtvvt+gT5DDu4ZOOJdhLXnAPm0X6lt7lYnjHPLf9/DZcx6U3
         Svbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924244; x=1774529044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt+dE12LnYJMRrLwh3oqUH4MbsvAbhInAHwP12r7KCc=;
        b=MuGbJhENjkU1cBPYDDSMnt0aWLCrrOsXGAWQueFLmQ9HmwtLvS4QNk7cjlG/f0nvWZ
         oPjLrjxhDJOIfV6N+C+RPCg1yt229RtUqXyv1r5N6jI7iHrQM1Su8C5Md/sjAQiwv4gH
         Q5gss8RF05wQNDVGyGJQKrKKX3Hs4mR2HFT7TVJj4OMVX8C8B0xrGCcJl0B+jDquCTlY
         YZMIETP0HNlO+VexyVOijwdAqk4+ArD02evi0vShWQC8XI3N7qNkWNOHoN2eqC/SUoeq
         wqz7IvURcdrVG67ttCby5uVUay7XwwhPvD1g6DsjaNUWBnUJvKAmcgoCoTVyC4djRXUY
         VuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXbd03Gd0Fnzhv2stb2fNThv3vfxbW4TJk2mSClmfeSN/fRZ1JaSnUBy8QM+t4y8APWCBkekbLrDkMzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHUiDzi/6beag9+utyupz+Idik0aYQSh+eI+wZw7bHi1UVw1i
	YWng0v7HbQbxjJj1Q495n7rqv6O/1XkVW7r5/pKRs65bHlr3nUmH81rd1pFemLYWdmpgsOuF4YU
	Oi6yBzxfKB172AoJoN6VJJKwV0WxXYmuwOGCA+JLX
X-Gm-Gg: ATEYQzwj5ZRJwzmfmc9OPeAmX+aQDWgBzLL9ThDhqcr65ZCMJ8dbYwvAc8pdadr/xZQ
	z0Au/fWJuJCIdMqp9q3x/RCbeUxxCnsIScb80x9+oENyY6bP1tW6x9Bifz1f0tGGZ7E/VLF70Uu
	WaWyfgtgeictpshs0F9Nic7EEvwmZFxUGTjQ2GNsph0bTLCS/VVrKL+goWn89tI1AhPrZwMdBAZ
	ZgbspcD0QlW5mV7kVCHcC0GJLDf6gwlVGvf732rZAB6oGfwgR808+pIkSY/L44N3wppNNKZwtjT
	c6zMbND/2Dky/IPy426Zgy6X3epMCJEm74D9pzIP5uXXDXPluHtleu5UoEeKNEJNxwWXQjE=
X-Received: by 2002:a05:6214:8118:b0:89c:4ce5:cc8b with SMTP id
 6a1803df08f44-89c7745da13mr39022736d6.26.1773924244308; Thu, 19 Mar 2026
 05:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319084347.134744-1-ben.copeland@linaro.org> <0abf3675-886e-44f9-a9f7-d9198b66086e@sirena.org.uk>
In-Reply-To: <0abf3675-886e-44f9-a9f7-d9198b66086e@sirena.org.uk>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 19 Mar 2026 12:43:52 +0000
X-Gm-Features: AaiRm52V4vyDSwCyt-sJoovR3NCZFDFql26Vy3ZgOOAZMOI-O5HJSCFk-flmp0w
Message-ID: <CAL0q8a5A9Mj4O4DKu1BRbo+JjvprZWO=XHmi71qk1n5GMvvyBg@mail.gmail.com>
Subject: Re: [PATCH] selftests: alsa: add config for required kernel options
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ivan Orlov <ivan.orlov0322@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Mark,

On Thu, 19 Mar 2026 at 11:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 08:43:47AM +0000, Ben Copeland wrote:
> > The alsa kselftests are missing a config file to declare their required
> > kernel configuration options. This causes the utimer-test (timer_f.utimer)
> > to fail on kernels without CONFIG_SND_UTIMER enabled, as the
> > SNDRV_TIMER_IOCTL_CREATE ioctl returns -1.
> >
> > Add the config file with the necessary sound configs so that
> > 'make kselftest-merge' can enable them automatically.
>
> These tests fit awkwardly into the config fragment stuff, since pcm-test
> and mixer-test are mostly testing drivers we should in theory have every
> single audio driver enabled as part of the fragment, but that is
> annoying to maintain and bloaty.  Fortunately people usually put these
> in their defconfigs so we actually do the right thing in practice most
> of the time without the need to build a custom kernel.  On the other
> hand the test-pcmtest-driver test requires a test module which *does*
> need a config option so it requires a cutom config.
>
> Separately to what we're doing here utimer-test ought to skip rather
> than fail if the driver it needs isn't present just as a general
> kselftest style thing, I see it's not doing that now.

Good point. I'll create a patch for this, as it should be handled
better, rather than failing.

>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thank you for fixing that up. I have noted that for next time.

Regards


Ben
