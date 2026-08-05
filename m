Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42036196A
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948436; cv=none; b=D6CpncXq0RZ9kgv9K5D5yoPVyoPDi+E6vEyqf2ILfc9bhgKGvQ++6DXXV6yx4I1mWT/Kn5wAj1PB4TYTsd/jVahln+jHZG6ChG27LWF0Ht/sigL4Z0BirfW5krqEsVCcEH6Xqnm1PSZpF5JkJ1Lqygd2xqE/tJRiYu7/ow5ehss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948436; c=relaxed/simple;
	bh=/grQSS1L1+0Bm5e0sZcz7RC5AfbOEDic8u0WNtsThag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZKWtI6zSCkn50Uhpt5UUK6vwtFUZMUqdEh1QedPeNjK+bniixlS7okzl/CnHECiRS2rtGvCjAMi9NhbHVo2Xc0t+6Co8A8ceVIq7P/2wCQfpLfgOI0uK46ThOdHGAKuosJQhWY6QL0lp1NKllpRzQG9Fc16efoP7RWWy/mJ2X+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0EHF63On; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0EHF63On"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F1DB4E410FE;
	Wed,  5 Aug 2026 16:47:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D83FF602AB;
	Wed,  5 Aug 2026 16:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E089A11C34F57;
	Wed,  5 Aug 2026 18:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785948427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h9ebabF6meJemnTq3q2QvOyb74dPWLCGgcnzt/L2WEg=;
	b=0EHF63OnRBI7TKTR1bKu5L6RY6VBWSsfXpxEUOqruXyBoiHhjgQH6q0ZY1wXffJv/p243g
	/o0yTA7N6TekAWlupRFFu6kWsQTz6D4UubNVWLtmqqkl0j4d3rHi+k9gywUf3cvctGoyf5
	q+5y6o+L0EACOd+IvRo3TUU7j64KsxdG0GLmgZMJ2I+a+0+sGKA+LzQX+QaGEmy0jjbPjk
	+QCe9r3n3qY/dyCB20z8SIptFRRRgWMdbDpfHdY3d8Yysr7jD/90V6UgtiZIj1GimAY76l
	Nj4qx1DVW0DN5o/zxPD7h2uDNGanDp8a0BhZJAIc4+N+n0fY4aiJ8mQRjLHOyA==
Date: Wed, 5 Aug 2026 18:47:05 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/31] ASoC: pcm6240: Use auto-cleanup for firmware
 loading
Message-ID: <20260805184705.78ab8674@bootlin.com>
In-Reply-To: <20260805135247.670693-12-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-12-tiwai@suse.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Takashi,

On Wed,  5 Aug 2026 15:52:12 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
> 
> Since the firmware release is cleaned up automatically, we can convert
> the mutex call with guard() gracefully, too.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/codecs/pcm6240.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Hum, I am in Cc but I think it is the wrong commit.

I would expect to be in Cc of modification related to the peb2466 codec.

Anyway, for this one, modification looks good to me.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Also I will retrieve the peb2466 patch (patch 12/31) directly from lore
and reply.

Best regards,
Hervé



