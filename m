Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD026A1D0
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282354; cv=none; b=CJbraoVrP/w+SIAeersiQ4TjybQboFFPCRNeqGIJ2/U7WuBZQHixtmc9BlcIlxUev0m/VbrzRXpprzxbiTFiXLmfv3u4WejylfMzz8dUgkNUh/butYnZ6ERLADhf/tj2y0wl1yslhkIjggK3Nq/YF7/uE1dU0kRUeKGXNQjuiA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282354; c=relaxed/simple;
	bh=BrziYG+reRrITgoe+nv5bA2Bshgb7AQbs7Lu9SlqTfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIbbouhgY2FGsQGD2cOT2FW9v9LMNu5sHXaHyqHqwLCXtbx9T+4EMIfCmRYzimocNW9FySxM6JZU8Vn7ocpWwYAwFwsDgUXN9Q3JwSZkZaDETqqwAeUaB2Ak94XjbPq2E9HBIarjWbbSyzPV5Vt20SUO11hGt4RG9E68KCUbPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+YHeY0R; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+YHeY0R"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ad5236e6fd6so678115a12.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744282352; x=1744887152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lWos8QSMVgpKuVsu/horRZ74UfYwXFw6T7UturF6mnA=;
        b=J+YHeY0RMPH4VkBgeFbffG6tH1FVNcVYniX0P4vSGv2IhIqatsycGkqwqV4IT0wzMZ
         x5kkedXR0FaD4w1hip6KHDEOSApEnz8LMSQ6WEK3tV8AW0fYJTlANzuOOpXKG2h1UNYe
         mzGwgzNyt5JkahlEvtzqYYnhOv73DBF8TsuNKU5zErq61qsl0TM6kruZmPZhLdT9WJOu
         QBeDQdpcVgjAd4axcH4MD80uXqN6M5f9qES8n4491G3LGq+/Ps/GLlGQfyoPXR5ezqIR
         ixrzI467cYXfZCnuHqwC9DAMdefbbVl0z4e1eyl65Q+WYfUdpx/fya0mLBu+PfwhMYmn
         3yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282352; x=1744887152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWos8QSMVgpKuVsu/horRZ74UfYwXFw6T7UturF6mnA=;
        b=DvbBaigtLeaSCAcoEzfZ2TDUWZ3Dad1Xf6+oUzn+AsGCI8uZZhwNJQJir8ACaje2d9
         gLyDdEn0LD9OOJCLBFPCdL61aDNIo1zQ969BguuvwGggrO6uwB1d0oJMeYbgV1T862uA
         nfB2Y5vzbj5V0ToL89p4OdV2EW3aWwEL4y+gUHjEqBB2Rf4yOnMx2+PlqSTVIwzZzw5o
         /QvcSRd90TBSUgDu0R1D65KFzXeKjBWK4yasFT5jkYigSPc9hlq0KUKvM+Tx5/zfAGPu
         IPlQO9RtCxpIPJnPAbQquCwGu8pqZJJkzPB7dcYERBdE3H5rlqrKXrFocDpoAcvzUvaf
         KZCw==
X-Forwarded-Encrypted: i=1; AJvYcCWHlMSjZCiYu5jHnFRC8ZkeP3WzN4NUh45CJig5J0s8/OiKU7W1U1LscGPwJgOHGWfJJxM7jBUNE7sogg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweLRkRgLpVSj7yzSUWOHeIiv5X5zlvCEaL+gEQ8fQSxy6FMaVE
	MD+WJdf85uzZqaJdT2dpO6ukcRHvhxAjkpi65k/v0gFjT47PhPiLz91nnzXAouao4AzKVoa34ZK
	I3szdH9pWAVeidiNq8LxUGLqQx2k=
X-Gm-Gg: ASbGncsA9wgLcvHBPomCwkJQpp8mAGmNwZyQ03xlHVqSbVSWfzBPJZZ2T7NdobSgmFp
	QdaervxzyfoJj7bjPPzf8VKPdt4DZVGR+0+6sm+GJ+N52pI3WYYU/TteqOdI8t+zFYyxgxIu3yk
	+rGz31ayKty6qgsDgt3ag=
X-Google-Smtp-Source: AGHT+IG9OzuRZJ1vwnvF+rmQLTB70kFNnEYWHNA2ASYmSXyawIJM3SEc0061vhU+6wEaNlvaoSbt3rr+45o4AOy799k=
X-Received: by 2002:a17:90b:2b8b:b0:2ff:53a4:74f0 with SMTP id
 98e67ed59e1d1-3072ba1da4amr3485981a91.29.1744282351618; Thu, 10 Apr 2025
 03:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4927043.LvFx2qVVIh@workhorse> <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
In-Reply-To: <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 10 Apr 2025 13:54:16 +0300
X-Gm-Features: ATxdqUFebgLwZPWGupggeI8x5G8mnYRG_qVSUvrfbkLgIyHXw_LlRHjq-axSRjs
Message-ID: <CAEnQRZD4xw5wRR6exsXo9xjTmmQ1TQAn0jNVeXij66-veEESMw@mail.gmail.com>
Subject: Re: Debugging CPU-side DAI hardware with a dummy codec
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-sound@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> > I hope someone can shed some light on this, as it seems like something audio
> > controller developers would be doing all the time.
>
> I suspect most people test with an actual system.  A bunch of things get
> easier if you can actually play and record sound.

Mark, that's true in most of the cases. But for silicon IP
pre-validation using emulation
environments most of the SoC creators use a synthetic codec so things like being
able to probe a dummy-codec does make some sense.

Nicolas,

Can you please paste your patches (dts and the rest)?

thanks,
Daniel.
