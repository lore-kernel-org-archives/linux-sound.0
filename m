Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF57201004
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365141; cv=none; b=s4kzQCRsjtIHg7QOlPozX+C0I+/IU30KovinCy1gZRj1pCKjPpg7E7S/d2uLjmGWJwt1wZ0O9AfdVq27DZbbfXywqD3oaUR7uoyBiDeOGlPgvDi9KRcOcoNSqqHfwL6lmXIKcbAfa4gGHaT6RUF3SacWnrfPRA+ISuNUgmh9gL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365141; c=relaxed/simple;
	bh=5ePagLuYL2VMDsyEsu/qgLhyb3aM5Fm7sdWD4I5OQt4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=m4Vh4bflbpPd2Ok6b4CKaDfwXYw2KM2vgz1BlEq1OtC3XDS4FrRt5YmGZyPBLqQeSPKvsBVU5yOpikqiuGe+rL6jlj67VMyBBlbllk3us8X5pkLOXUatvW74JLapHpwR04hf6SlfKyhWNYUC3Pcr22LSByuyQUjt1AoKy++HdFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dgs+Rrop; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dgs+Rrop"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751365137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UA19yU7D1UtfNEkINMRSif5lUbUOppk7unuGTMpUYp4=;
	b=Dgs+RropsLYy+2N/qGBKOnygdXq+3FU8t47D7NylSvWNUn8Mr/G9rm/FSGhLbhjX0LOUzk
	c3Xcc3jPcigu2FjP3JsbDewKDES7/ZgmBHgdwC7jrFxZ85SY0Hm29BlX4s63FZ7U0Kmt5F
	WDtG7HA+i/AY6qvko48/wOTYvBkvkMw=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] ALSA: mips/hal2: Refactor and improve hal2_compute_rate()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87wm8sclf8.wl-tiwai@suse.de>
Date: Tue, 1 Jul 2025 12:18:44 +0200
Cc: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <64167092-D0B5-4E78-AC07-62733EEEAD65@linux.dev>
References: <20250630214554.182953-2-thorsten.blum@linux.dev>
 <87wm8sclf8.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT

On 1. Jul 2025, at 11:25, Takashi Iwai wrote:
> IMHO, this doesn't look improving the code readability than the
> original code.  And the generated code doesn't seem significantly
> better, either.

I didn't look at the generated code, but I think the patch definitely
improves the function (not necessarily its runtime, but its readability
and maintainability).

I think the patch primarily improves maintainability by eliminating the
magic number '4' that was scattered throughout the function. Now the
scaling factor is assigned once to the semantically more meaningful
variable 'codec->inc' and used consistently.

It also improves consistency by using 'codec->master' when calculating
'codec->mod' instead of repeating the constants '44100' and '48000'.

Additionally, it removes the unnecessary local variable 'mod' and the
'rate' update, making the function more concise (4 vs 12 lines).

Thanks,
Thorsten

