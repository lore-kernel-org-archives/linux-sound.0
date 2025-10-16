Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26423643E
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760639514; cv=none; b=hwWfMvNBGkxX5mT+tFdE50+94Uzp2sw0Awzdywfj+j4pFOj4CxvD5w2Xeh8XQyacGq7fnE8aFo6Mw64hOU0qKq97leb78bNxtKhR1brxR6R4BTlxCPBqsUXhUHQ0nLktRysDw3kG+FYMp7ubX75AQ8xVHOurp+zkUyZYU5Iuw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760639514; c=relaxed/simple;
	bh=l7FgV6wCPjnm7FV7Piyaky9U0hLCUbLhlC3TazkESb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IiUbc8vcEnMMx0FtPPE26WQzpweLQEmUFe8dfhQNtKn6IMrt/psp56oTwFHl7CC07B3+bDqMMPF2+FRWDNgyhYNer24I6LPDqLH6rfkEtw+PIkCSkI5C25ZnFvXkPxqQ5t0y+cyw3L5MOWRg/fpmhUO9p52Hm8InfTpO5Tk+BSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=BveRcg1I; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="BveRcg1I"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1760639510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DwL+c+9YdGQesQ1zy483f+QCC5NnESasUQDi6ea1c8=;
	b=BveRcg1IIkC8akOq8/rGmCQJR9P+fJ82dDncn+W/TWMm8k4MVrNnOBjvxV+pVwYmaUVv7q
	y92CCNPnJmbu0gSb2MTiNtTzO2vrORxHrcCpvLDQcKJr6WRlmzftOIV/3RKRyOtbP9zVuj
	K90eodHgaj9tr9Wd9RiAeUYlcSympMiVwEBSIWWyd3hHl4e1UAaDN2GNUwWLrbw+GfrQhR
	jj1poJMGkQt7MDNyUOeFhO91ctVC2r8x3snQYbXDdb2Nd7RPvvakQ4TLvN/N+pylj2rrIe
	lp5ZFVvhnB/KVA7h5BrQ6x8w2wB3C+xFyimscTAIIKmDigxAaqSRAIuAMIsFfw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 20:31:47 +0200
Message-Id: <DDJYM7XTXAGN.16TCJSI1VPUAB@cknow-tech.com>
Cc: <linux-rockchip@lists.infradead.org>
Subject: Re: Endless spam in dmesg: ASoC error (-19): at
 snd_soc_dai_prepare() on i2s-hifi
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <linux-sound@vger.kernel.org>
References: <DDJ05640974K.3G1TLY1B75G7@cknow-tech.com>
In-Reply-To: <DDJ05640974K.3G1TLY1B75G7@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT

On Wed Oct 15, 2025 at 5:30 PM CEST, Diederik de Haas wrote:
> On several of my Rockchip based devices I get ASoC errors, where the one
> from the subject occurs the most, but there are others as well.
> While it should ofc be reported when an error occurs, the volume was
> bad, then really bad and now it's just absurd:
>
> root@rock5b:~# dmesg | grep -c "ASoC error (-19): at snd_soc_dai_prepare"
> 983
>
> If 'dmesg' buffer can hold 1000 lines, then I have 17 of these as well:
> hdmi-audio-codec hdmi-audio-codec.8.auto: HDMI: Unknown ELD version 0
>
> This means that after just a few minutes, 'dmesg' has now become utterly
> useless as it ONLY contains these errors/lines.
>
> Booting into older kernels didn't seem to have an effect. If it had, I
> could start to bisect it. I have no idea where it comes from.
> So now I have removed pipewire ... and everything that depends on it ...
> of which 'mpv' is the most important to me.
> Now those errors are actually gone. And dmesg actually useful again.

I installed pipewire 1.4.2 from Debian Stable (previously 1.4.9 from
Sid/Unstable) and now the count is steady at 120.

> So I guess it's triggered by (a change in) pipewire, but still the
> kernel should not be generating endless copies of the same error. Once
> or twice should be enough.

120 is still too much, but now dmesg isn't entirely useless anymore.

> Can something be done about this?

Cheers,
  Diederik
