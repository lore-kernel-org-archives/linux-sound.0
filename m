Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4544BCA2
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920220; cv=none; b=NIQNDSBzH7TmnTGh83SK5H1Zx1mGs8HNGWsutEFNtWY4Xg3g8QUTRm3Ou02+fwKKOX0G5WlWkdSOjbulxO2/W0mM27Et1WsTyHYT2ladXsK3qPWN2ujciG+lJvgVcLRw75a1+uqflowzxXVEQGuPftAzPyPtIWCDpbx/PJ0Yqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920220; c=relaxed/simple;
	bh=JKm8v5gQghaPXU3hhx0iZpbdqTnozchlbnx97d9bBLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEMcNo7v0M407SXI3dKp9/OpvoHdHjQ2i1YA45QdGs4pX+PJuhCivcgoTPpyomBlkzG+TV2+tBn/znGyHER68TtONRGh+fbZSIuncGcKWGLseL+Y74MUhnIoPYmWPtgTcfOiExJtcp8kh4C5EhUwCS90lneeit5Z1lQjYcamrWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=addTdSaV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="addTdSaV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so39649885e9.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768920217; x=1769525017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BBO7s0q0gk9yVOm/GXGA0GPwp+Pc4tuwtNZFcNdboA=;
        b=addTdSaVbaGkSPCDxNtizSkIbXqaHlXJZb5VGK8a06cwjsgPyR1bWPNu7Eg5Fr3bQN
         ocnPq3VFujStqGbQqLiIvXM+Gzyxb3i2rzlfmnU7lBKCaW4mzFZfA6M+YpMTu/63gg+j
         GAzDNei/k7zonWAj67dsILyxB/hvsziWZVYtq+A3MDMN/LN4x2AAleJwAU59oah3Q5xG
         0yB6Zi+DDWD/rlmriGEefeP1L+WFejzCkZMG8ZrOs6FGzigspVUzQ1cuYB+u2D7uKlOg
         AChCCaWwSmbPXkXMugpdqhP4Pjwfvj0ES+Bkjfxv/iGskbzOP1hwfvgrIQo2+HZcLnKX
         1AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920217; x=1769525017;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BBO7s0q0gk9yVOm/GXGA0GPwp+Pc4tuwtNZFcNdboA=;
        b=v27Thzov57OAk83unHxQTZjPu65aFv+weWzudAgk4n/JMekN8qh5h2ZiqU/lySnucl
         cJJPHi/IIzJyAb3wrzY45RXbbmjDOIDUpIwUWG62XXcD5jV6FHD0/xWrbMf8eLBf5ttC
         D1IWQNRQkskJywg30ezc/Cx46xh3AnmEWjHTAOXvTN7jabK5GnJBmUNdS32lQg0Fa051
         2iySIPWIAA2xaE55kLCPcn5KhikEvFDBygZNylWS4xfPjAWFFiDqlobeK8uj3wRqeads
         vxB+sFjaG8CWw6yVnwciSHwLQQrnAkyODjgsqhjRu497s+KOqXLOGfa2+MG+D6liS2rD
         CnNA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Z9hzPTGQawHSLVR0s7mrP0E6L145xQCg5O3EnfWDPtndA+0bztXLLO01IMfoHvFok8gJYrVw6T/kcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2LlK/L4/uxyIdWSxfmQP9QVLicpyDIKlsbXCzFFF4k9QcTdZ0
	sfB4zHbEuWXtvgRzajzXH4+7sVwCYLcHMK5bbrRmzbZgb4/9ZogR2Q5T
X-Gm-Gg: AY/fxX5Py+NLT4GdfFUo1FJyevsQmEfACX7AMK5eNUC26BrtOC7y0oDI2F9SxFbr+Nl
	zAH8sgXUe/hlhsHKPQ69HbuGMkQAL2K3PHfMW2oVLQ5FHh0cmbu8VNFJlZ45CBLCtUj8xrqHtiW
	mVVTeSWyu5Q/xAlUuzi8+9Pu/tP8LvTwNW2L0bPl9UsbkqlpnzC6vhvbL25hpZT0P2JWFpiBmUs
	FrsFSzuwy6dXK4AntmAEmN2XpsYBl/oNI61iaefpDrPWZ5/SmcZvq9poOPMlr1zswB3Q5W9kzF+
	MP/BaNt/Vj+4XwGVOCRe0Sr5cdgCD57vWfX+NerhMm/m+3+KqmVDw1Kk+SKhidwaM5KDyDS08hF
	YbClMYaJR8ZUhJ1Tc5Z/oCrIv7QnTTyorWtIqIHUBsOOd36nxHcUH23Z9w7tFxRMt775bc7NxeH
	l3V4KEs8uNf/979yuB4PKJAJ7gWFWh/yJPRDnBTVrMKZFDwCwmHdLopRY=
X-Received: by 2002:a05:600c:60f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47f4289abb5mr153488945e9.1.1768920216949;
        Tue, 20 Jan 2026 06:43:36 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm192581885e9.7.2026.01.20.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:43:36 -0800 (PST)
Date: Tue, 20 Jan 2026 18:43:31 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <aW-TRX8Bv60Aq-W-@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
 <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>

On Tue, Jan 20, 2026 at 11:12:23AM +0400, Krzysztof Kozlowski wrote:
> On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> > Document the internal ADC and DAC audio codecs integrated
> > in the Sophgo CV1800B SoC.
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
> >  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
> 
> This is not what I asked. I did not say squash patches. I asked to
> squash into the binding. COMBINE the bindings. We do not need multiple
> documents.

Oh that makes much more sense. Thanks. Will do. You mean single file for
both codecs. Combined description and "compatible" like this?
properties:
  compatible:
    enum:
      - sophgo,cv1800b-sound-adc
      - sophgo,cv1800b-sound-dac
everything else seems to be identical. 

Can I keep single commit for this?

> 
> Best regards,
> Krzysztof
> 
