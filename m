Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD285270;
	Wed,  2 Oct 2024 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727852171; cv=none; b=XGB4+dP0dbg//kBnkRYSIgAFrmpPDSeqB/6bqH0tlOO+972z5hvXt1PSJua6xsRG8DE3Ttrcuf5yVzV58LA4A77AZQYu/9OX0FZVmjOaYJowkLuoOz5FdcbllNay1IYE5ae9Jamyt/L+DuXO0VwxwYEvVnO8q5tPer5QAS80yRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727852171; c=relaxed/simple;
	bh=1x8FsTYKTElgsro6hjXvj/EoIu+83Ck3wv1piHuIC9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/+Uwxo6SSqqJG84szJhdSOdu52h5SekhEA0gnf4Tv7M8jxXrHPqMrqDq7zQ/6V6g0r2o08r3OmvWDQhihOCsf67X3h4XeBqMHGtsG/3RlydLpvnQGptgcPdmkrgPhh6bhgQhBK8h+Ve69iDWSejlwcsos9S2nBJpZxrGlByqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OPooQOpK; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OPooQOpK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5141120002;
	Wed,  2 Oct 2024 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727852167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHrsnih06kMmn0kAxCYeMqMQc7boKhbn730umSdHFlY=;
	b=OPooQOpKYrL9KBqvrSgkCbk52UkG1+O8zOtQ+3tYXfY9H3R+7i69jE+OGeWcHDYAycOPwS
	JcPV1gSkC3Tj4n85gWBX4Pj8aYCq0+oNEkyggb9IQydRDvf8mXuI7UeGuyxyoLFWGOG77w
	iAIZV0lx45aAabcYA1mkuzXUS2XUdQ+T0m1NfM888QPBVJ3LJfFvNbrF6CUYKqa3nLofmZ
	fufOhNgx9/5vq7TqH/YaOmraHM6NYuoG6p1qu+VXkSKf1TYOiIEiVdKuqpujKDnE5DZy+z
	OMZBgRzHzA3LZv3NFuG+O7DD5MDy8dOCE++H+GrBIUIGT4wFnyrjkuH4lbrb3g==
Date: Wed, 2 Oct 2024 08:56:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-ID: <20241002085604.277d5006@xps-13>
In-Reply-To: <7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
	<7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Krzysztof,

krzk@kernel.org wrote on Wed, 2 Oct 2024 08:34:44 +0200:

> On Tue, Oct 01, 2024 at 10:47:49PM +0200, Miquel Raynal wrote:
> > My understanding of the interrupts property is that it can either be:
> > 1/ - TX
> > 2/ - TX
> >    - RX
> > 3/ - Common/combined.
> >=20
> > There are very little chances that either:
> >    - TX
> >    - Common/combined
> > or even
> >    - TX
> >    - RX
> >    - Common/combined
> > could be a thing.
> >=20
> > Looking at the interrupt-names definition (which uses oneOf instead of
> > anyOf), it makes indeed little sense to use anyOf in the interrupts
> > definition. I believe this is just a mistake, hence let's fix it.
> >=20
> > Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP b=
indings to yaml schema")
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> > ---
> >  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audi=
o.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> > index 7735e08d35ba..ab3206ffa4af 100644
> > --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> > +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> > @@ -102,7 +102,7 @@ properties:
> >      default: 2
> > =20
> >    interrupts:
> > -    anyOf:
> > +    oneOf: =20
>=20
>=20
> You need to change interrupt-names as well.

interrupt-names is already using 'oneOf'!

The extended diff looks like that:

   interrupts:
-    anyOf:
+    oneOf:
       - minItems: 1
         items:
           - description: TX interrupt
           - description: RX interrupt
       - items:
           - description: common/combined interrupt
=20
   interrupt-names:
     oneOf:
       - minItems: 1
         items:
           - const: tx
           - const: rx
       - const: common

Thanks,
Miqu=C3=A8l
