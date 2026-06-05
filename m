Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945C33F597
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 22:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698589; cv=pass; b=t4l6lJlvJnmEkLxl2Dlwb3W1uXU5eCvb0ygzumN8f5bJnpP9412v9cXXceXX2s5fjNBNnK1XguTJvvZmoxm6CL6EFD+R6pxypafztiJQc0e43u/oO1kB0/7cg0YJjAZk1spXara7MoHVf5LCGA+XzXj2klNo3oWPl80gMmbVK+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698589; c=relaxed/simple;
	bh=+hJ82CmdEVkqjDDHhsyrW4LNqGqxDk6mnNaahYCx5HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6wPFnijRypgyZvlkp8n3NO/klkgK7rYXOk+PpGAqTiyTUooE7dNinFqi3+GFk1k8GnmSNJSJtDy8ig9834cxKVTRcb5sPBftLwoKSIybMXxUdEep2KOmyk2WFY9ckvPXqSXo3drk8nhjG71O/7vRsx86Vix7BM4/ggAbkHrjQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggF/rBcU; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggF/rBcU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8584e80bd3so1097385a12.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 15:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780698587; cv=none;
        d=google.com; s=arc-20240605;
        b=d/OhQTX/0/GLV7VIWpRqdnJrp/eSh24l/YqXpVhsUiH7Qngx/j7r92cBdT5HrXqfcV
         NP1hP5TP/yFbft46hRvQoaB6H/57YtQOFhvQRKLOno/+Zv5VfSfjyKPYdFBZk2hOLCgw
         YksspW3uCLU8p9LvGiQ05mZ7PmL1wX3B7IOI8DYgxkSLDT6py1XsQm8oKEP4V1vo26nR
         hVeMwQ3lSvBlItF/xA3ASjpMT8PKkSo4EfspWYFca5LCm65bwirmB9FzIq9epKXPKjRS
         rQcfD+OnHF+OXmCjPe/B4pWltV60k/MWC5OrnWb1NIeXlTszTz97wWJp0eeiV1CcQwDx
         WYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        fh=VzWEyZPs4ZgDfCjAUzCRJJtZcedLcP8d3s5E8akmTc4=;
        b=RcWQWoyLHqP0nGb46L/NpAj1nGuCbur5ovKNhNN+BD2voSe9j1B88tF2Oqpx4Wb6SV
         HB3FMcm76nSo54czXWnBBDhT7qINgdMqnXRWWWN2epay3UYqceJtqIjbj8qZ6oJxwyPT
         jjI7ZK5uERgAaPpSMT6ECCdWCwuNPe8uHvkCIUbHMEXSIVg6EWFbL//iZjvDTeyAp/Of
         PRxg+sc1eCKv8nSbtpywaj/J5gD+CRzaOK1Ef6oPUlDVk3p90nhB0vd5sgLHo286redp
         T3gYFCVtg2CfNTWISAxg7tyTPwN9teBZllml84sbWKuP/lxdHuKA+v0360qGjadGlFVx
         4FRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780698587; x=1781303387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        b=ggF/rBcUcl99HOvxNPzHwpMMrmOUW699YoLTrMY5uPui/IAYAqH+nnbU1mM62ACL82
         P67nb0j5d6rftNk+bltUOFbn/PtxzbbcFdYEmrZlD1fhDrrpNcX+6dYrtWxBF4KpsG1e
         1oKWWmwAZAih1TjrMXThWb+n2r4ql2xyAiOg8qPAtOFA4e/4kxN33jzQRbrmp6snd9tm
         U1vRsLHNvittaVgbXYYLkf6ICXVMay/FKmtGF3jn+uw44a8wVwi7x+MBKKFEsKGztiqg
         ENLIOsoFUH5p6LLIuQrmPconDbR8NPz90r4WnWpE3X3vOjwW6NEn1tiKPJ7CRtJAT3JG
         MxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698587; x=1781303387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        b=JBGIdlRqZqk/hIkDtv8vMYzvSUTdLjUVYkhaZ/VEFX7eN9Yahoo40hLLfBEc4m9XL8
         OjSb0+eTNkIeGt1+OAzmjwBlfy2bnoiFEw44ED/0n3z0LG/P86Yt9oF7grtdd5L6IONZ
         cAHFqkvbGz0p5GZLjHWXY6QtYl+DbI2wZw8tPdXymRS+jHnb9MtEqnnG4j0Zeq8IVetP
         dnpm0HBkNuP26rbkp7W1P9tsGiVRZNCNlfJohsGv/S/17cFUJ5Cr+frpY3tC94XasAPm
         08D2124ey/XbUVPh3yR36P8CPq868oCdmlMy+pg3OTlrDw4IYNZ0DzIh724zZ4D7TnhA
         MoYA==
X-Forwarded-Encrypted: i=1; AFNElJ8HrvFzPC/DTtW5HDoENTsBFlC+50AEBWLd3j7CR44gKx7d1T0mUh1r2N7yFqY28vA3LlJxBTRVD48hIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cdQRtsNJyHPVhr5p0wvcbtwVrHtrYirfpwnnf/BUPrnLwmWF
	7wfVbUdELJ8qLOBSp8m2dSOqkKaKfvxKUtgwgssV331JhyB2czGaYx+9nWw3bFEDld8L/ic2Hgb
	dKUOXYSiawoNGr0C+aM8DIc4J7GWvfyU=
X-Gm-Gg: Acq92OGVJ9tNWH8s8mm1a2atwzvVDvvfZI1HFhusbvBHspo0y0vIo26dS7aOovVJ9zW
	GVn6B+mBbAul9LkuPABJjJlgxZQiG/UO99aLOIE9O1pKtlK+fCxMTOP8wckzun07cA6tCnmXOCb
	IPKrnIM9yXJkcn/J2s7ZmLqKdqJyklsoudd6gTo3XCvM78sFMvxDHDeMXjB4/pywFUAWx6jsdey
	0EDNco7/zwkjT/5RW3kCMVVqnNoMRW7bSE8urqNyKK3PcM0Pp3ritSyEM0sIOOqpNFlrVt4TlcF
	XFqbqhfY9Wi3dxlN9EUK9YovK2j8XXgMc1ezlj4f09UbA4BKidrYhS5HoIh2Om24tlk9HwHoepZ
	AJHDz/A==
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id
 d2e1a72fcca58-842b0e2f70emr5369705b3a.4.1780698587138; Fri, 05 Jun 2026
 15:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-11-phucduc.bui@gmail.com> <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
In-Reply-To: <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 6 Jun 2026 05:29:35 +0700
X-Gm-Features: AVHnY4IxKGU0FIWOFBZ5YgXOV7kRSiKXHpEfhImiSr4YmJecxoXq6aFVUBTuuBg
Message-ID: <CAABR9nHGNVWuOLyuqvjrsYYJBXOFs8W0ZN5PUs3AX4+rM2RmMw@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Morimoto-san,

>
> The indentation here seems wrong.  We're also using spu_count to
> separately guard the clk_prepare() in fsi_clk_prepare() which seems
> problematic, I'm having to think too hard about how this might be
> robust.

Thank you for your reviews.
I think we can just drop spu_count and let the clk core handle it,
since the core already refcounts via enable_count/prepare_count.

What do you think, Morimoto-san?

Best regards,
Phuc
