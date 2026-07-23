Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF91448E0
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831896; cv=none; b=dCAkCOzGXio2H8vUn+LU30kNdh9eD9WBOhdjdwD89JTqHxsDp6JkotnPsGG2cJJwk30LJTyc/FdtgqmykIlPf58MW7hfEYx8qOOsSjgsLu71capN38omXKicjFRoGtCWt+wNupWryvYmP3t0BrWuOmbFKRXMFm5RkFVRd9B0WW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831896; c=relaxed/simple;
	bh=nzG4awxgYfrlyx9Luz617YX5oT+UjV3SFnHCznNjdDg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq7jKuGFVVJuxcCzSNqZ+Yu0gq7wfFM+EzmJXvicv4aklq2Bu8NbmKPINtbdpRfQw1J6vu9a2QqNw09P6jCvk28nxTNMACAx28yY/3izAJJwt7hkNeOJyOQI7cKAVkM9yZXlzJRzkp3oVx7x67ehZj1pCnQ6Wm2XnhcXO5lz0wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3baiUl0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3baiUl0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso678824f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784831893; x=1785436693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQh8Ebl2z6PI6INJ382vkExB/1zYbiEiM8I01ow3Vog=;
        b=q3baiUl0KU0vhV7XIUY8UgLk6WUJkdFv62CRIgrnnEVsnxw9cBofQB9I/4L7jZRE/g
         64JAzh+bfdUy57LDnKMo2Q/5ffLNbhnOEB/g8z73gBdReTWszvKrsFzqh5DCi6PbmZL0
         FXgGiKdJn28ft/xgtwHqRMwXHC79RQnMwycm5OQvNQ5mZIXylFLw7JNT9QZPA9JLjWAz
         jOcBcVn7T2+W6Ehyz6R0uknsyq5ciDrLE8HpyLk2tU5pN83f9iuOj4IbMOa/C4SK9emN
         xS1BVx2LCLNz/q2JABcPOvctTUuJZfP74QY/F882LjFO+dB3jXApnyB/iYRhcMk8pXNP
         m7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784831893; x=1785436693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQh8Ebl2z6PI6INJ382vkExB/1zYbiEiM8I01ow3Vog=;
        b=KtXigSfyquDRSV5bRtH3/6FAVWjYSCXO1KJFCD+g19ylpJRWvOm2qG2w+1jxuR50oi
         6aGQGSRZFAuT5hYMoqFJOW+s+bh8O+AogppRUc1j+SRNHhVw6jHerSyhoT5ubKy/e98g
         U3XJmK/rskQ5XqBAWi1W4Kk09+HFFPAc37rTJCJIe6b95NAt22PswufIuhggqJGGY+td
         7u3UmV2koaOxgo+I6X8x0LhBHjpF1uhyji6MiHSDV4qAqiwjBgv50ZBEHR1sJPcYvjuR
         Ix6SF6pEt7dE09kvzkoDzS9iVM6R6xy0uya9J7Sqpy+Un6yMUJAkedRp44YFlCVqDWVx
         yHNA==
X-Forwarded-Encrypted: i=1; AHgh+Rrwz3Xet72HCbEEpQl4cqLsL7/1FweThc2c1Sv2lq8ZPmdAGUaSFkSOZeNuiimfBbtFQkuzc+Wuox8oag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6OBf2XahV48Q/+pTnpdALBdV513PluhqwHEZZD8Ya5sK7hBX
	g/F4nLz4yn8Jv3OfeCCs6jtP+QAeN3GSdLEC1pEAXbGmgERpScbFW15m
X-Gm-Gg: AR+sD129k3RirjVfaOqJZ25pPUYvpOkvsFJu65yafhR3X1skpxlQiV9f+yekh/f9K5z
	Er2tSMAlTJ5Z+q+adKCjx9ZuIiAmXAUdCVeRV0q5FfHG+moLGyCeFwtd70cpw6Rsgyh/j0s0SVq
	ZO30oUWAQeRAWZ+JGft4bVohFxSAX2yBM+RmFnN543nMtNx+HLlMz35M+1FbaNxNexW14Ss0Snq
	mX4j/ubCVx67sfquWeDSAtPruBIbc+wVp3F4K7hTKtGGJYraFok4y5cmPoxX48sw0GFVFHb0DUY
	ZBfeGIqW8JlnRj+A5R9NiidtmnRO2n7ayvJlmcG3h57+XpHYrq8eapQMr5L1/J9+jlYAUg2Lxpi
	9P4FK+I6GUD9UQdEkESXiNkAUh3G9npzAvPckMDeqnf7atUFncQKqhBjOhS3Ou+/GrIrWaXz2nD
	DkZdgccXdJq7pHCi+bIB7B0XVQE0x8TdNWU0rm3KLSvDBO3Uk=
X-Received: by 2002:a05:6000:1846:b0:478:77c1:787c with SMTP id ffacd0b85a97d-47f8d76ead4mr5907181f8f.56.1784831892999;
        Thu, 23 Jul 2026 11:38:12 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6f076sm18328564f8f.34.2026.07.23.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:38:12 -0700 (PDT)
Message-ID: <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
X-Google-Original-Message-ID: <amJfkRUyQoa2VhK_@Ansuel-XPS.>
Date: Thu, 23 Jul 2026 20:38:09 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
 <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>

On Wed, Jul 22, 2026 at 01:48:30PM +0300, Dmitry Baryshkov wrote:
> On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
> >
> > On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > > has no upstream device tree, no active users and has seen no functional
> > > > changes in years, so the driver is dead weight.
> > > >
> > > > Remove the driver together with its Kconfig entry and Makefile rule.
> > > >
> > > > Assisted-by: Claude:claude-opus-4-8
> > >
> > > Using AI to `git rm` is definitely tokenmaxxing!
> > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >
> >
> > Honestly I'm pretty angry about the latest changes on ipq806x. First the
> > dtsi just because there weren't device (it's ok and understandable) now we
> > are starting to remove driver...
> >
> > There are godzillion situation where there is a driver but absolutely no
> > dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> > this point and treat this soc like it's a 80-90 code...
> >
> > I will post dtsi with actual device for the SoC but really I'm not
> > following all this hurry in cleaning code for device that still gets used
> > and actually some company even produced new one (even if it's EOL)
> 
> We have no way to check that the device is being used other than the
> DTSI present in the kernel, being updated from time to time with
> non-trivial changes.
> 
> For the patchset in question, do you (or the community) actually use
> OnHub? If so, please consider upstreaming DT files (and also updating
> schema FWIW).
> If not, the files will eventually go away. Just having unused drivers
> _adds_ a burden. I stumbled upon the driver while reviewing a patch
> changing the driver (for the sake of changing the ASoC API).
> 
> And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
> a DT counterpart).
> 

Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
they also use the storm driver for the strange attached speaker.

-- 
	Ansuel
