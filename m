Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6D33ADA9
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584359; cv=none; b=iuuCRUg7TRm9OThPoo/1bUfNoiEznnFGm1676RO+J0jpmal97R8mkebfxPiHadx/7Xchf6Zmw9e/1b7Jsi9nc1SPKq/D1uwC0NsBxAW5XW0LX/+PmnLDEABpFqDMVEKZ+1B7zt/gEYp2cqIDHTrf4/WbeZA0Nvi2xSIGRBQ5FxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584359; c=relaxed/simple;
	bh=YdviBTA8jRw1D2gT88VYxUJR+OiJuzgjG+E0JzrSNxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skLXneQJD1NELsK0yd7O8YbFT3X9RTSVWXQDO/aBl9wq7peYDebUg1mXlBDs18MGDx0N0FHy34pn4PE3v38qSQaLOD0Y7fOnfQ7MevtA7jvWNtDJAEPjJOnDT4WYADT01VL4QncsJepA96Bv9hxTqH4xTdT4nh6QiwoPfKicXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTLXafyk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTLXafyk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc305882so1268123f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768584356; x=1769189156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guLdPSMspTYOQSTOoD0vgqQiAA/YDtF0X8jjlbY9les=;
        b=ZTLXafykwOWeH2jSFBA9oCl5fInL88gaM1UOVuOiqisXzYS2AIkYkkpx4c2KawaIcN
         MNZDlaeBPHeHalbcvtMOtYBbm+L7dY23vUF8B0uTvFvAHPtRbTUNwVjvWfKmn1CNCGD2
         VCfdBOJRgYZcp0ZAnd4hyYz9GDaJyKzVa50Cp0Xu16eB2VOz0vePVuCTJnkUkanzLo9Z
         nJoZrfwfD/6T41sqZfGQ03QuwQ2FpDRu4uqupvltxREoIloEFjgacx2QpXhDDTsjx0zl
         tp4k0QgKdPUPxWuM1hhM7BV7dQNoF+ZjIpRQE1m1sgW9lAnIcgr+mF+BucFOr234QA2s
         fakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584356; x=1769189156;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guLdPSMspTYOQSTOoD0vgqQiAA/YDtF0X8jjlbY9les=;
        b=spK5F2EAMRS+2FcRf3QMBJ8Qv2TX5thErbPifHX0emmxykw8QBHinV8SyhUTapGIkr
         GAUI/oufLLQkfeQNuie98zpp+U0PQr0CFL47r/C/qXYg/ivz6xrDr5F5wC7T0exynIQK
         RVouRUnSgakzT6oN2FaCLVcXQbmm9LwMfD5BX3EH6E9X4Z3nOrrN3O4tflYcIF/q8tRS
         b2CfAwaXKqscMSGroIMsrkty1JuEixE4bCec+JGJ97/ZT+kALX6QO2hesrwwMao8gaXd
         eeKR2s5fxi18gRjmgLMziUORmQbPcF0QOP0vIeXzWbc/bAv9n6BE+ltTaKE9m1IZNj3U
         F/vA==
X-Forwarded-Encrypted: i=1; AJvYcCUvD3bPexch7bYNxEmqM/YRF8C+zi8318C1rvY5z6pKjJ2P8xmYyDRHHgmpE3ndYgL316Y1l5F6wBucOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKW3aOLU0wzNNRPBRE6JbOHo8DHEsJfyJrVK6Wi8C8oXYcOjly
	vlZrUX7aID4FsU14WxROmUkaE9lhPWOf9XEimRJ7v5OeFTNKnORPIITS
X-Gm-Gg: AY/fxX5RoAJhifRF2rweBEAAw9ezrba4+an+4UPlhxJAkbYpGlpoEaOhFnF9Jb5O7dG
	Yki7Knz8TH0U6731kivpnssWTBJ3LcJJpYDMu/U4xKxxRld10sjInQicSt612VLhVio4UjAC0xS
	c9qi98/Ag7szLA+yr75laUszDfjk3r+4DAZCaCrZkCmoxqsQNhQ3UnYbD1BE8Kc1bMIhtR4X8U3
	r7TCLAoQkZAlDKeS9vXa/WOG5MeCPDwDxwV06VeYlon5NgUr8ZKcONj2QWz150uW1O8q4Luo+Gk
	AP/e2jpGYhCGDVW1lDRqcZuSAD/epTdi1rDDkTWP7aHjYc7v2+7yyn3FmKeqRZK8e22zyJ9wX2z
	EKsDzHwR1kJUecwMEr5D9xQh5fZhfi8GTAkOHLoW6wiNgLFblSZCeDLiWh1sdNTdwy+jqeE7+Rm
	LTmKcXn0TnNGTlNdRmkLVqCXjSZu3D8HUFC3C/9exwDJmPd9ear+nwW7I=
X-Received: by 2002:a05:6000:3105:b0:430:f622:8cca with SMTP id ffacd0b85a97d-43569bd2aa3mr4952607f8f.56.1768584356323;
        Fri, 16 Jan 2026 09:25:56 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm6098837f8f.43.2026.01.16.09.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:25:56 -0800 (PST)
Date: Fri, 16 Jan 2026 21:25:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWpyLQ6FR8_RsD1n@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <aWl4fvKsUZDg9dwj@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWl4fvKsUZDg9dwj@inochi.infowork>

> On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> > This patch series adds basic audio support for Sophgo CV1800B, 
> > as used on boards such as the Milk-V Duo. 
> > The series introduces an AIAO audio mux driver, 
> > an I2S controller driver, corresponding DT bindings, 
> > and DTS updates to wire the components together.
> > 
> 
> I haven't see your mux driver, is it missed?

That was bad copy paste from original version. 
Thanks for noticing this. Will update the cover letter.
I want to not overcomplicate already big patch series.
So multiplexing will be done later. 
> 

> Thanks for your patch, for all the patchs, I hope you write a
> meaningful comment for the patch, at least for now I found it
> is nothing in your comment.

Thank you for a great help with that series. Do you mean
I need to add more meaningful comments for each commit or the 
cover letter is not describing everything clear enough? 
Anyway will do my best in the second version. 
> 
> Also, the patch 8 should not in this patch and should be a
> separate patch.

Yes I've missed this thing. I will remove the last commit 
and move codecs nodes to the base dtsi file. 

