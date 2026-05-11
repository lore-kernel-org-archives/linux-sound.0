Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D528C035
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 04:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474690; cv=pass; b=KjBkbTQxCgRa51VUuWc8PtM/ffn+MVqU+KUyFD+ALXCo9/sdcIiIHM4Vq3kWbGbzxRrAwcd8oyihK5+EmejBtnfiq7GYSLTmC7RMiQHSxoTXum3n+fT5jSIfVPMSWpwDyKRTm3+PxIAYyC/FOh4TDk5fb7GMcapO13PVmmZkcII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474690; c=relaxed/simple;
	bh=x6iEDyKbU5r3YCwSJz4uBEOlZegEWhKWqkzkNQCKH5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwwwvOY0OnRzte9tNulKOYMTxCRnEycAQP2//SIJyjUxQ7T2uY5ejVbEyBPnX27SKeqBKcw3d+ofQzX7UA5sXaK1/xullDpeoKfxqflmRUf2y/7nK+51a9rvKkFWzZSAW7/1gtdXOEe7HOLgspDFoss0XdKET/gukMFmdE+My9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQjItaTt; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQjItaTt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3653cb9c6f8so3260133a91.0
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 21:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778474689; cv=none;
        d=google.com; s=arc-20240605;
        b=KTdNXtgZz2Bv6ECASTjfhFnjElcZFO4Q1TFp/MUppaXB8PpjjQ9+0EQH95XD6AA/t+
         yTZlnXX40UkGo3/9QXTs2v3KRUjAGd91i3A60LWFZmvHS5+pCcVEVM28N3cZoWAWMSTs
         AXnAcvbhNU+64VukEDzN6i6826Ry3ZILrdKpRvQwmbt+CByPW2ko76SDNbkFpPMWAw/Q
         ddm91Kg+u6lTazp0JskgrXcoDxu5lZRp7pQQO2R9zzm+Xdt2mKgeyzbiVVrPSzJczdHA
         W5Y9iZwMr5ByRXIzeU7uIORRTpd5jsdeH5WE+owIq83XPg6gw0cF8nPODDVKRrOIbnpu
         XQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x6iEDyKbU5r3YCwSJz4uBEOlZegEWhKWqkzkNQCKH5I=;
        fh=FWZ+Q2Bo9aQsRDvbMjRoWud35EFopx+oaTNlWn2BfJA=;
        b=jU6SGt8x0IuUTrvUhFP0UZXfzXyb2xfLdmtGmTEFxmZ/SL6amDYJCcS2OBg1bv5Lwj
         enF9DLp+Uiph/3tN48GotBMBcEsOt+KmrBR/Q/oixtoY1JubhNP+YenA53WK3TzUlYrP
         n+tXXevNM1FYDNYf8IgeHzUi0Hscv2UaM4BeXdPmbjcAC4ZwIqJKd5R9VtLGlD4/WvNo
         393p+4i+fK8S/4PFSbzSt9QPB/QjSL9BV8/vCh0LBO7MKP7mN8AWXu6PUH5vS+eJRbeM
         H9ydgffSRIDgiW9jE+QYWKj9ihCMOywNRDDjyHlnJTDyKyrGX7cLQ5SlKEOB99ks9Oj7
         S4mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778474689; x=1779079489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x6iEDyKbU5r3YCwSJz4uBEOlZegEWhKWqkzkNQCKH5I=;
        b=NQjItaTtywzdOgJdhcqc1QTmMCkrQWH3Q8VVDUW9ulP8alAZ1S6f5ZZ/UuYTuvalfF
         Y8Z/kkvCttXHti0rtkSIziUMUyjCnNHIMaGfWTYlpMBjcQM+PAh2NwTxUV7ZQ0272pal
         GhfWCgncDxKntjaw8mj23XJOtpeLHmy1vf5ivCWQt7H7xCgNjwTknpUGlKnYJDNy5Xkl
         TgNfu2iy9mm1nGbbwcpHs5G5k/MX1bD+MdsqPgcnKjXLWfl5DGsi2+YnsoFyG2oSzgZt
         NsBNsVy7rLXRJ3992QD0QiGwEiPbWpODBElpsZClo1SFkYKK+LRRGdldUTMUZxukBbnV
         aZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778474689; x=1779079489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6iEDyKbU5r3YCwSJz4uBEOlZegEWhKWqkzkNQCKH5I=;
        b=h17cEFnKHfZwePmGkNE6NJsRM63PjLH0G+CqrmJgtk+GqaNugg+/wT1vrMqNG47PrI
         FCX2IrIAOw88acOTCSm5fo9YjivspzaKXLzUd9PEWkfI/xsLBKZk7kVvnihlZzaPFZmj
         415a27p83xfQgMi7RvqI+RmJqpi3f1A8QpBJfgmSic8Blo7Da8TQmJGZZAfnESarvAmJ
         lwll7rLC9ZZk6I7tRpCCDkZrvVd2DOktKV+oGZ+569mbfB3GUGAlx0Mp7cG/yduhwamp
         2T7I/bPkT1ZSroGgeObIfQ3RXhgnL6LCZJpmqAWbP/qdq/FmOfrIdFWgN/e+e1znGZMq
         5zPg==
X-Forwarded-Encrypted: i=1; AFNElJ+yuOPuuMsgn8pWlYmE7qsMTcZ3qV9LlZprtmcL4jx2qUVS9JS4h9vYRyKUcICLuWInniF+2Z3o3lIaZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjxOtJfAZ3cRCQfEh8g7AeU0LMRAHvA4AGxGRTBGtA8E3XAiZ6
	89H6+H6sCsT842vnaoyvy2DnMXNs1k9nOqSBYVwYh9pjN4s5/vjbOYDy3k2AH1k5O5+5cq3FDXn
	XCSzdDNlOVzM9i3zUPC1mMYUh92PFvpE=
X-Gm-Gg: Acq92OG1LAoL1J1d2HeKKB4fpKGnNzMWg23oqOU3Ym0lU4rKw0BjeN9g57udW9JxZ2G
	JQB2Sots6d0L/FPIjGeNgSmu3xlBbngSdSnYTbYJuTJDj8BlmRN9nRqq/9rCThUhsSN6K/tBsj7
	vEhZG3YqflmzhYusyvyHhxffu2HmmMSMn9EGuo4ck+r3W8L4ZBlB57Dqr1KAO8FLHas76ujZKuC
	bSbfDIFYi28xLQNBsIScOENTA1mXVAabtjATUevWYDyysOjCO4+KkKAbvR2a069FkTjbGeZlIG1
	w4TtRtqThMbEPAW3waaJAIcQpW6ehRUKObbE9Q==
X-Received: by 2002:a17:90b:3803:b0:368:7a49:cad8 with SMTP id
 98e67ed59e1d1-3687a49cdf4mr866184a91.18.1778474688812; Sun, 10 May 2026
 21:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
 <20260508103837.138142-8-phucduc.bui@gmail.com> <af_g24kqkm4QhDuU@sirena.co.uk>
In-Reply-To: <af_g24kqkm4QhDuU@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 11:44:37 +0700
X-Gm-Features: AVHnY4KyWpKmL3bK2ohzxLh_6SgQsZ4v_ABThclEFDNG2VBuAo-Ds9hj8X1klJs
Message-ID: <CAABR9nH62K5qqujXzr_HwT6F0V1ezzENAVnjqqu3zrMvmCYWbA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: ti: omap-mcbsp: Simplify lock and resource handling
To: Mark Brown <broonie@kernel.org>
Cc: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, jarkko.nikula@bitmer.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Jarkko,

Thank you for testing and for the feedback.

> This function now mixes scoped and goto based cleanup which cleanup.h
> warns us not to do - are you sure this is a good idea?

I also feel that this function is easier to read and understand if it is
left unchanged, without using __free(kfree) and guard.

However, while cleaning up the code and converting the whole TI
folder to use guard, this function became the only remaining one
not using the new style, which felt a bit inconsistent.
That is why I tried converting it as well.

If you think leaving this single function unchanged is not a problem,
then I will prepare a v2 keeping this function as-is without modifying it.

Best regards,
Phuc
