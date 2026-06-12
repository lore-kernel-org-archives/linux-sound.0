Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E42FE074
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 03:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781235960; cv=pass; b=ANZ+KQ2Awl8pO5fz+4/ff9bVH8ale6/NE026stMNFxlLxgWGaq9v+MgHld4g5QyQ+KbDcgYrLgLDO+SgzRUYKEPx8iCtZlpRDSXwEUf17Zt4YXJXFz3xySk7U+jQww9IGFCiu51RaxmQf5nAnfcW8FSxfevZyPz8VuIwsIDz93I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781235960; c=relaxed/simple;
	bh=PP3eW6vYLeuoTUie1YNtgU0HWrRukIZPeyGx7dnWIfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f43/alXRto3Lk1yQBVqqAuLu4ibyQBa6sCR1UrHv2N1ykEXsFgYV9utadqw0tRXBY7oAkpLVHJ98sFkf4oX/mK4yhpS+1XxkVgaJq674cw/r+SHSXe+f590cp3UNm5jtLWBPmFo982mjm6TTdAYG/N2cllvgLMC786AlH87ASJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H48i6MJ0; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H48i6MJ0"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84232e83ca9so289767b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 20:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781235959; cv=none;
        d=google.com; s=arc-20240605;
        b=Co3P9C1N4E+ezvHVBHo/C6aEQNgAjQyg+lsE4ySOUEhTRMj4yCUuJinTma3YIzVWSu
         WFpgprYkEo1soWKTx4DhCda2hJeFk2yGAaGjDViUlFQk99rwRVvP5lHVKgPyxAz3XcWw
         4V0XNBv68cKV5t2RsljaN3VLlRdMdNxFjknPbX7/LoTt07o6U2vO9nBlRDFvqwIvS8nu
         u+zs7x4CXjsYIKku9DMHLy0+wfb1PjzB56FdkDn7YzBF4z1xuMivtx1u6UsXkLG9TLx4
         NoCQXSank87JkB+yAaIG9T+wwlnMBRePC6QwTDMtN8/l2T9xjTEGKCRjGUeLxxor3J5D
         jUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YSYxXgBrDpVNlOSD8UcdeUqbtFZuIX2b/BybKW7Z3n8=;
        fh=GvVDHpZdXN3hsefj8axVQuabfBJhhss5QKDsAFHwzm8=;
        b=i6f5TWJ1iSrYKWzjW9utkgRISXxtbOV7E4A6Z02OnPyjgwcxYXOhGtyEjHJIA7QeiT
         R10M4YAf41S20lmQe4iHsGL55Z09NFoxEC6a788EtpTZhy8/hvc0pNWH6smVHVNLxaMD
         0anS2J36ydZ4lTnmHKS5C/SnmWK83GZLF8ZnXDS9wguPU24WjCpvs3fuyg8UCyR8vTqh
         P+g4ztDZeogx8VJcHYBg+z2MdrdUdEJjSfuBUdJ/Znrogg3NxN3VK+kaZ4TeB2C9XVer
         OfwXHMiekRWeUjL1Pk6P6wYKhWEAH9SZvbzXBgGWye3N8nl5SJJn5qnKFsMCqmEC0mxA
         2XPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781235959; x=1781840759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSYxXgBrDpVNlOSD8UcdeUqbtFZuIX2b/BybKW7Z3n8=;
        b=H48i6MJ0ZJBAxVlq8FfXun2CGSOdACvIBd8UC60gcCQqdG+0Ln6NwULd/HaVTxcyCh
         RVroKlq6Z24FsmSum8YLqfKQFAYqtJprnLEjK4jQt7H4to+iJbWmFscEjFrDefVtX3Sk
         ZN/wX4y+IvY9ZR/2CBNBY1H2sL5xZoPLEv6oa40dz5NK+IhdTG/Mzwni6FmteeIs3SZN
         EcaUHDZtAtWkHdPblC8pPZrZUvXq7aONYsYbzetPi4iWhl0/3MermiKdH3y8G7NDGm3V
         F+83rHBsyvDQJFh9Uia3cgBJoHMwpL4sTlDgeGk6q5v12UfKNkZfaGlg0HpztFeg6tIM
         A0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781235959; x=1781840759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSYxXgBrDpVNlOSD8UcdeUqbtFZuIX2b/BybKW7Z3n8=;
        b=dMHrGXqhznn7q+6VUTm7GI4ag8ZO4Hax9yXPb7b8M/njaDnE7OqLY+vuF4vHAhMMj0
         foG4Oh8HNrmRFNrlA9K+sKsrS16XWvsb5uLKQ5QoUQ4tQs3UVJXot8ufuBZTwjndG3K4
         Wy1Iv5zK7wiCetm4iZYJ6pNMsIjpZxOCdDuHIHktYyciHdHugIjOd2UdfgCyDMN4U3rU
         0l+Q5ma9ie7c1K7BergR70ztwMokjhQE1sE7mVeAeb0bZoHOWN2g2nWh88M432633+RX
         Ly1RyzsvERr65bEFtDdCm745bLFA2ZcZA3WhE+1DRuwtSKjP+ofaEFV70OtIaKkDF3h7
         yl0A==
X-Forwarded-Encrypted: i=1; AFNElJ/m5vWroheWCItBvmovSxdGLTerDKq8S3ALoEYjwm1CLCc5bx1qJxsc6dLkWWxIq9N9JAIcf6uPG2Kgpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3Wl+BcL7dqt/qImHmo0oR5HBeu+jfRytNzejcmbEGezxHZqf
	3Uu2nOD6f3+5C+0ILL948nNnkpZeCzq4drtGSzaXLyj2idYpvnvWmIaDUmuFWZkAJ5I/Lcr4vAy
	yY9EteZtqTx4MdNqwaxd/sl054SKjK9k=
X-Gm-Gg: Acq92OEajJPxLc/2Degg6DxwduYKhdzDhaxfYAOTBtBpflnsoFUgVLVop8CI9mnAPEC
	C3vRvyu7g/0vgjwi/vM8i1P8IrMg7Sx98cHFACbGZAGB7X4+49yjR5EF0l60rRYHjKB/Bf7weWH
	AYwfUw4CRAMZkMlXvRBnekLZ0flzX7I3sBxNFP9Ys0g4sdHrYUtnEqr0x08jH2C8vICayiwxJRh
	isupH4HFZVWwkNIyB7RoQyaNXB0RkIYj0+952XBOz/fRrbeVPO+wDJ6qlUAu5ywwLCvZAGWBoGj
	wf492gzWzdAMrgTl0C970k1IJPSWIep37lU/iA==
X-Received: by 2002:a05:6a00:190b:b0:841:edbf:6424 with SMTP id
 d2e1a72fcca58-8434cd42d48mr1068504b3a.13.1781235958639; Thu, 11 Jun 2026
 20:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611115901.80438-1-phucduc.bui@gmail.com> <3f7bcbc2-cf0d-4bb5-88ce-fadb8816c6f5@intel.com>
In-Reply-To: <3f7bcbc2-cf0d-4bb5-88ce-fadb8816c6f5@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 10:45:46 +0700
X-Gm-Features: AVVi8CcX_vfLXTKc7z2HeI5ADa5DVZkLLWRTyFT1n81rzympRTtlYUGL-WeMmV0
Message-ID: <CAABR9nH6b8kSQt5w8vPGFiXGH3h+QDQdjKgsF-C3pa2hUh1Wiw@mail.gmail.com>
Subject: Re: [PATCH 00/20] ASoC: Intel: Use guard() for mutex & spin locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Czarek,

>
> Recent changes took care of catpt-driver [1], so the first two patches
> can be dropped.  While I wanted to follow up with the avs-driver, I see
> no reason why I shouldn't let you do that instead.
>

Thank you for the feedback and for clarifying the status of the
catpt-driver patches. I'd be happy to take over the avs-driver changes
as well!
By the way, since the catpt changes were already taken care of by someone
else, could you share how you usually check for this so I can avoid duplicate
work in the future?

> Now on to the review - there is no need to be as granular as you're
> here.  Two drivers are being updated here: the avs-driver and the
> atom-driver (assuming the catpt-driver patches are already gone).
> Sending a patch per file creates unnecessary traffic, so let's limit the
> set to two changes.
>
> Please use the following scopes for those:
>         ASoC: Intel: avs:
>         ASoC: Intel: atom:
>

I initially split the series more finely because I was thinking about
bisectability,
but grouping the changes per driver also makes sense.
I'll rework the series accordingly.


> Last but not least, your name and surname are not capitalized.  That's
> clearly not the case here, in the cover letter.  Please adjust.
>

Regarding my name, leaving it lowercase is a small trick to quickly find myself
at the bottom of contribution stats (like LWN:
https://lwn.net/Articles/1075574/).
I capitalize it in emails just for communication.
Unless it's strictly against kernel rules, I'd prefer to keep it this way.

Best regards,
Phuc
