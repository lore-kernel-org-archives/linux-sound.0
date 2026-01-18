Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC64F5E0
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768738742; cv=none; b=tntPQx4axkJh7YCFrqg70rkv7UhgTNcR8d1pE8U1o7bjykzgLRNsjj3rmWpaOBzThpYDpkT0zfYlhYR0veQlUl2LL13TJYoMjn5kyGD/66mOEoVrFZ95U1fIdNQ+1iS7PHZd4IB+CC8unyf7o6t0uazjIgI+0dNiYNEe6fcOMjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768738742; c=relaxed/simple;
	bh=AM7nm1BS1hlDTXwcdh1EHXiQu1Si/CyAPg2Ikrwu8lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ushDjkpWmsS4YY7BJCPXnCabZy5lYLDKKMw0xaqxnerVSU2julnaucUknLKaRxJ2ab+i+UMxJIC2fqTQOnUSVC6VLeq2/UkP4MI3+zGCoP86mMaGoJbgFv6O8TIRFEDnuoN7Gai2yObVPUTE+VPAz/Cj3P1OX4cZbRMw4KqvSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYBJaL/d; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYBJaL/d"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430fbb6012bso2694362f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768738737; x=1769343537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD1wzEbaoKZKhuZNexa3nkG79kI0GKZ4I1GLpFTxDis=;
        b=TYBJaL/di8WU5YLbMXPuj3t/bq2sjQn3XGh4LzfGIgOyIzQeDVfskSLU7D8wXu2wdH
         4tP2ziZ/a+h8g1h27PnTc/Biv5A24eSyrru22JrS4AvIiQuR6+L+D3wjlDiLrDuY6wCY
         zic2s+PRBpxbV2r6n9j27Y2XTNMoDwMCfwe+0BxHtEc6bBxJuMp6OoPFgnk6M3bQRl1n
         VfbVl8B0ACNZ4osZYPe/TAQUUva0dmXIlzLtCocxgsjc2fOvKTvs1Ep5MWMiWWxQuFpD
         BxRqyhEsvRJPET60NpiRwumQ+OMhAeVg6Yk+tTeNi+tSFdqLJiFxvqaNVYYz9q/DC9I6
         jrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768738737; x=1769343537;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD1wzEbaoKZKhuZNexa3nkG79kI0GKZ4I1GLpFTxDis=;
        b=dDa/dUkTx4Cp5wZeP4nyU04sZpIv+UnvNfo9DC3yllJ+MHwN6q5YnYSAqeihgsiyn4
         dWiu2NuBMly3BDah1PKSraWh90PlRYUM3Mfuo4jmYNkWcDFBk8VTP+gsZsonv0q00wxk
         fhW/ySKTohZnhftBd+FGDxC5JUpwVBZgq4ketvdXXyIlGMYysBxvIuRuCtsuw3usc1Fw
         IViDXnWY1MypeQF/qi+Jmz6aZ2au3wjBGZHvor+UWOesFBX1JlOuLO+RaIGILuZzqV73
         Ru2Uwq9OEceNsotWd1FQNt4yCUK82O6lOUw9AhFpyUfM5WbyV3ythRk6J8fluq8mp9Ae
         tt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOUyoL82Kj750SdYOw2Fiz3CcCM18SW776zF2SF2OtlFI2DiMQ23VGTvBN6LmV038neDiHzJKeMrAIyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MyVrAq8/XnrTnMHIB9ze8Xr7aWzkYfbH046MCNDSi8/jSHeR
	+zHIiIn+i129EA9mulTQaJUHfzM+I0Qb4t5SxAGqaLEW1YEg73FXkJc3
X-Gm-Gg: AY/fxX55U/E14jVPC1dJqCyogddYTIOfnTARYjqZhIkIrqg9mvgGIGCMsM/j90UBKFP
	gtkSOBf0BIyYPGpVvEnT9OHSVJNHCmawf88Nu/wAHhuJnCBPsdMdYeHYDFW0+STDL2X0u5U9MMi
	h1CXKT3GPhrF4RkVR4+E4xY86FerWIkHj7BHjZ881mTkV6V1Pp7chSX5Z4R9Arpz8vN6zIi57wQ
	/VezMR93cUv7WSP7rkRa0+wGOq92mk9o5247KUIk514JwKaxUHl5kjWxRNTheiXmWt6FUs4N0Ph
	oosG2Zr5ZKfYhekcfkkrYQzpyCIM+35Nl/H+TLXaZQeKEMGukHLwTqzSLfLzreKl+HPbTY2m7mf
	GjPzRse0JsBYHhDPQQfCS8b7+D5dzZW5zWI1Xv0B/UKI2f+QWLiOLS3PTJNoA3d4VCZm7HDM+Il
	f5oCqNV+SqzyFSXPp51wEXQHAzN3JBLeeqnOjy/c3NkaA=
X-Received: by 2002:a05:600c:8b33:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4801e30d72bmr97350495e9.10.1768738737157;
        Sun, 18 Jan 2026 04:18:57 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f3b7a5f94sm207544765e9.0.2026.01.18.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:18:56 -0800 (PST)
Date: Sun, 18 Jan 2026 16:18:51 +0400
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
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aWzMvqzh-QXWRTWP@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-famous-magnificent-peccary-474ba8@quoll>

On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:53AM +0400, Anton D. Stavinskii wrote:
> > Purpose: introduce DT schema for the CPU driver
> 
> Bindings are for hardware, not drivers. Drop the purpose.

Noted. Will do in v3

> 
> > The driver uses dma to transfer data. The dma it self has 8 channels.
> 
> Describe the hardware.

Will try to rephrase. Thanks.

> 
> 
> > Each channel can be connected only to a specific i2s node. But each
> > of dma channel can have multiple purposes so in order to save dma
> > channels the configurations allows to use tx and rx, only rx, only tx
> > or none channels. I2S controller without channels can be useful in
> > configuration where I2S is used as clock source only and doesn't
> > produce any data.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

I will do my best in V3. And will read provided links again. 

> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> > new file mode 100644
> > index 000000000000..cf30880a62da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800B I2S/TDM controller
> > +
> > +maintainers:
> > +  - Anton D. Stavinskii <stavinsky@gmail.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.
noted. will be fixed. 

> 
> > +  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
> > +
> 
> Miss allOf with ref to dai-common.
> 
> > +properties:
> > +  compatible:
> > +    const: sophgo,cv1800b-i2s
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> 
> 1. Why is it flexible?

It's my mistake. 

> 
> 2. And then why names are not flexible. These should be synced in
> constraints.
> 
> > +
> > +  clock-names:
> > +    items:
> > +      - const: i2s
> > +      - const: mclk
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    description: |
> > +      Names of DMA channels. May be omitted. If present, one entry
> > +      selects a single direction, while two entries select RX and TX.

Will drop.

> 
> Drop desription. Don't repeat constraints in free form text.
> 
> > +    minItems: 1
> > +    maxItems: 2
> 
> Again, messed constraints.
> 
> > +    items:
> > +      enum: [rx, tx]
> 
> No, it has to be a specific/fixed list.

Here is the question. Can you please help to understand how to describe
this properly. The idea is that TDM module is usable even without
specified dmas. Each TDM can work as clock source, only rx only tx or
both. I can force to use both channels but the user probably will want 
to not consume all the channels for if it is not needed. DMA can provide
channels for something else like SPI/I2C/UART etc. I'm asking because
I'm afraid I will do some mess again here.
> 
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> 
> Why? Drop these.

noted. Will remove. 

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - "#sound-dai-cells"
> > +
> > +additionalProperties: false
> 
> unevaluatedProperties instead

Thanks. 

> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > +
> > +    i2s1: i2s@4110000 {
> 
> Drop unused label.

will be fixed. Thanks

> 
> > +        compatible = "sophgo,cv1800b-i2s";
> > +        reg = <0x04110000 0x10000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> 
> Drop useless properties.
> 
> Best regards,
> Krzysztof
> 

Sorry for the mess. It is my first ever patch. Thank you for your
review and your time. Will do my best to improve the patch series. 

