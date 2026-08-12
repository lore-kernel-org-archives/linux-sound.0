Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D093AA51E
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 21:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570414; cv=none; b=cY84a3bTiRyghESvqw/a0WqBjrhZFtAYkhxmtKK6VLCHIdaEao75xzqNZLbnCngO+3gTVVU+aQ8NR7DyR1Np5o7zmfJeSlG6Hi/0ygczfZ5ChPYe1Q4ZYPHOoZPtGFMYYZgNwwskDpW6LEfuTV3oc6gBzZVBuUeTKS3RLgUaYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570414; c=relaxed/simple;
	bh=+ZPA8DnnnB+hEEU/UVSTgEQF5+XXyjqbGyFW2zrE6jw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdJRIG/3S3dWaxH9HBnPsdGhom75q0DUroP1YuthO8lT3Ubllk5PTfXRNe+Wb0v2zKsW7PI19k2pyypXKr8BD5Yli0SPdoSaXrN2B2FTGsEbAv9OJz1h5uBbo2GhJCveku9kGYRol5Chvs6RApDYzlSTyagKjZMfFLs/7hJyBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CefHtLJS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CefHtLJS"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so13018781fa.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786570411; x=1787175211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nHTuE7AAYCFKX7KeTMghSgjvrUE2Rt+zw5zVdxCuNw=;
        b=CefHtLJSkxwImh8c4CR19Hxj2ZKhQZUs6QrsT05ZUhb+23rpkfWTnL+IfcTchVQl/D
         gUEFncYnto9ao8Emjzwf7CQ6wyGpH3vSbNNgu+2Tnks5tQCMSrbotkq+sIq8HZl3gdMv
         G2vTIVPxJtDFGOLdl/TgC756XsGOLS8oF9etvS63A/VaZ/VXCUz2McxiF5tRspoweWKi
         dOUBwbZ11cEnME/BrdQtYRaGQcwupzu9U3Zopq29w/8MlDrD9yDGFOvGFgBX9FPsGDDF
         HdOmkT/ui+k0Cqr4HXchuSjyNMkxkNmyzmyUTvYJ+SpRVrxTcVf9bTU5FNteNlAecbtp
         n1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570411; x=1787175211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nHTuE7AAYCFKX7KeTMghSgjvrUE2Rt+zw5zVdxCuNw=;
        b=bhOHxG+Nprd3WD+1YSj6TFYiGyfIUU7X8aVKkchuMZ3XVF1zCSJ9lZ0fOmthOXrXSZ
         Ac2FTQoHMUEkLrNQ2B2ne6NpuRLJpSvnuS5aIg/6vKr7y5XkmiOhjufpLka/jVP5TXzK
         S5s5y3fehqdRTElxaI+xnrd6WWZtiWXQrIC1Xj/elJ+mSW/wX4Q8mXR9TGZwkk69U8ll
         xYMSo2xu3yax/QXuTcxFdFOGXbislNa+K12Bj4+0321HBieyDJPFbZMNqA2ptKeXwa8t
         LlCuWiqn3UB3/IKzY1tiyoDYkM6o/FyC1MMUJuoBeRjAWl4aIoOuOsxCUT9jjE58qsJ/
         v9Kw==
X-Forwarded-Encrypted: i=1; AHgh+RoS5oRX+ECdoZfUP3lim+xaXsoyK05bd8YooMzVmpEkFJabWI57x7mgqFnhayO6Lg6pnAosW9s/5/JjUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqJ/z6qKONngUO9+SQ1EPwPLdj9Wd20s/qbcWgbxcZx9EuPp4t
	dswsJ7v4vQdCazyF4nwQXvQHRWXd5JWYoxp2Vma3b/Hg6hhP1SNX42e+
X-Gm-Gg: AR+sD10X20lFAeCilK5GHvFtw8y3wFNC3xwAkqIU79fxMWLhtmfkxtZhqnffyIwf6mB
	gWWxCf/ugMXb+roFz97+3YIDpSVZEzm4YPNLeo1iHiBxP8DmycsbZIdIkrf4RQ/BOw7qGeAp9xu
	uZlagO3Ds28tGGvGbHyMYAOCnpDN86l6AElMNYEbwcEPZWog56VILWY1dCIa97F9kgmcANWwCBe
	NHtIKAsuREnwvlKGFr+slbLTjPySAU5Km7ZQ97EuP6t1JnrTUETLjezcnQM9s/oNKSOUtBtiCJW
	IxRXx9bI1yxc1eRLuYbq28PsG9/QCdBOB5aNoY40N/9Gdr3+VyWm3XfUL15GFSDXY3BHYbkdkYX
	8zC7hOmA5x/RLW9sOBiG0N2FckCDBHkbLh+2T0k3oKmQ5NP89Is2rRHInnpqykMGT04ClyVnFq0
	Hm8OhVKvEdbttcYqCdCJ4bJtsfBWTLpd9eSUOY4Xuw2TkhzGyEIqtzj4UYqnJMAzKotFSBy/1qD
	3//ORgfkWKifeROKRRf/RI=
X-Received: by 2002:a05:651c:553:b0:39e:a64f:d7a9 with SMTP id 38308e7fff4ca-3a11a4e7fd5mr1720061fa.2.1786570410950;
        Wed, 12 Aug 2026 14:33:30 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b3dc5bbsm680601fa.19.2026.08.12.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:33:30 -0700 (PDT)
Date: Thu, 13 Aug 2026 00:33:29 +0300
Message-ID: <cc1960d677a7f5a5c86d48c3037c0aa6@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-kernel@vger.kernel.org
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps ->
 mono output (AMD ACP SoundWire, ASUS ProArt PX13)
In-Reply-To: <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
 <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Antoine,

your patch from 27 July is still the only working stereo fix for these
boards, and it is now the only one left: Ville withdrew his series on
11 August and asked that the tags go to Robin and to you, and nobody
else has posted anything. It has never been sent as a formal [PATCH],
so as things stand it cannot be applied by anyone.

I think it should be, and I would like to know how you want that to
happen.

Where it has been tested
========================

  - your machine, ASUS ProArt PX13 HN7306EA (the original report);
  - mine, ASUS ProArt PX13 HN7306EAC: Tested-by sent on 7 August, and
    re-confirmed yesterday on a current broonie/sound for-next kernel --
    speaker-test -c2 -s1 is the physically left speaker, -s2 the right,
    with no audible level imbalance between them;
  - Robin's board, same amp pair, where the one-channel-mask approach was
    independently established and measured.

Robin has asked for Reported-by: and Suggested-by: on the channel-mask
patch, since his 5 August report and the follow-up measurement
established both the approach and the positional behaviour of
sdw_compute_slave_ports().

Two options
===========

Either you post it yourself as a proper [PATCH] -- which I would prefer,
it is your work -- or, if you would rather not spend time on it, I am
happy to send it with your authorship intact:

  From: Antoine Monnet <antoine@montane.tech>
  Reported-by: Robin Everaars <robineveraars@pm.me>
  Suggested-by: Robin Everaars <robineveraars@pm.me>
  Tested-by: Andrey Golovko <andrey@golovko.me>

Just say which, and if the second, whether you want anything changed
first. I will not send anything under your name without your word.

One thing worth putting in the changelog
========================================

The name_prefix -> BIT(n) mapping reads as if the bit chose the channel,
and it does not. As Robin measured, inverting the two masks between the
amps does not move the audio: sdw_compute_slave_ports() advances the
payload offset by hweight32(ch_mask) and never looks at which bit is
set, so a one-channel mask fixes mono by defeating mirror mode, and L/R
then follows codec order in the DAI link, which on these boards happens
to match the speakers.

That is worth a sentence in the commit message so nobody later reads the
mapping as an ABI promise. It does not make the patch less correct -- the
split it produces is right on three machines -- but it is the honest
description of why it works.

For completeness on the SDCA-correct alternative that Pierre-Louis raised:
Ville measured that UDMPU23 ClusterIndex is simply not implemented on his
TAS2783 revision, answering COMMAND_IGNORED to writes and to a plain read
alike, so that route is closed at least on that silicon. TI have not
commented on the intended mechanism.

Unrelated, but you followed it: the "no audio after s2idle resume" problem
you reported in July is understood and patched. After S0i3 the amplifier
comes back with PDE23 at PS3, and a data port cannot complete channel
preparation while the Function is powered down; the power-up only ever
happened in hw_params(), which a resumed stream never calls again. Patch:

  https://lore.kernel.org/all/20260813001500.9218-1-andrey.golovko@gmail.com/

Thanks,
Andrey
