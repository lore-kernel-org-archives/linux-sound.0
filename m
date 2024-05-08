Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA8017BCD
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159842; cv=none; b=WTLdBAPNe0RF0KkaKAjjZCbvjofZtu3RN81nVyxPoX83iD8lNWAntDZt0q7pGwfnQXrf7eNRABMDxqVREGz1sBP11fiiHA808T0uO74otvVRgLFSOJf2J9m+WvnyUNqYUW9YlhURawZA+aS25YXHlVfgjJ6dZEY+ZcWQX31M9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159842; c=relaxed/simple;
	bh=JOe7aQOG38JBDHMYbRrOF1AsAqwdkG2eeIOsTZarf3E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=e/bNZlQNpm5jHRZGLsNFhh9yS+i8Apax90tRtmXilI8wgUxD/mzloYze9jM+B/7velXp7dxgY+Fy5unIAmlGjBMsEt8/GUJ5L/Brwf/sedYmdqpqHbBN0ewOYUjaS0k47pswJS6oFPgerfRWmKb/WdNvH0Gt+OzRiSrTlwbI+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=pZ0GER9Z; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="pZ0GER9Z"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1715159830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxVSSI1KJfqHZpR9WsQyxiuRq9PajLl6ETTuOqhOULU=;
	b=pZ0GER9ZIN5h97nreo7sKfHoGqbSAon1z5gKMsnk9ar09B9Xnddyb8Il6eT9sCXebdI4up
	QvBTnGkY7HRoNDIUhyuD3iQ7ntwtEs2OQOaAr0c6SYCKOihu/Bc19uq/bEN8DobWXYkbYh
	mxSIc7UvETyIKwrMmnkRMsn9U0OsEqZEXl2yvizIuUp5yKgk/ks60t3NEnt8TScguvSs4Q
	uabvSZ7V7HQR+6TgPdc7SP03V/fkzMk+QGzqVgjAHuf8BwJis7yubghpoCzBQoSIRWp6v/
	R4TmzAgVFO3fl6mZJl7S4BFKcKx60i3FXd+VFGJnj+JphPzsye38RFAGO/h0kw==
Date: Wed, 08 May 2024 11:17:10 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/7] ALSA: Add missing module description
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Message-ID: <5314cd13a9b6c64459add136993b8f86@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Takashi,

On 2024-05-08 11:11, Takashi Iwai wrote:
> here is a trivial patch series for adding the missing
> MODULE_DESCRIPTION() to the code that can be built as modules
> where make W=1 starts complaining the lack of MODULE_DESCRIPTION()
> since recently.
> 
> Fixes for ASoC follow later.

The changes are looking good to me.  Thus, please add for the
entire series:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ===
> 
> Takashi Iwai (7):
>   ALSA: ac97: legacy: Add missing module description
>   ALSA: ac97: bus: Add missing module description
>   ALSA: pcm_dmaengine: Add missing module description
>   ALSA: kunit: Add missing module descriptions
>   ALSA: pcmtest: Add missing module descriptions
>   ALSA: hda: cirrus_scodec_test: Add missing module descriptions
>   sound: oss: dmasound: Add missing module descriptions
> 
>  sound/ac97/bus.c                    | 1 +
>  sound/ac97_bus.c                    | 1 +
>  sound/core/pcm_dmaengine.c          | 1 +
>  sound/core/sound_kunit.c            | 1 +
>  sound/drivers/pcmtest.c             | 1 +
>  sound/oss/dmasound/dmasound_atari.c | 2 ++
>  sound/oss/dmasound/dmasound_paula.c | 1 +
>  sound/pci/hda/cirrus_scodec_test.c  | 1 +
>  8 files changed, 9 insertions(+)
