Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A5375ADF;
	Mon, 30 Mar 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888897; cv=none; b=pt4N/gsRV9k1UEb8rHBjEioZvbcMmW99Vv74iNVI/WKDusQs1uykbTzP6qOOMtZOu25KrR+vm4fAF9XJEgaaIA/5wg+iymyZU8qSh8EvUA7XDitdWaiAGM2AXnrzI323myWXvzZ5P4PiZK9hGAonWaUep+YwKaDZPB/zyYd40VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888897; c=relaxed/simple;
	bh=5fyqNjqjO3qaNtOgQYGUDLgdRVsArGmIT6Rwp0lpqcA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6cgArwlJBqW/WeKcH7WtLVzw/FgWQRKL/5fqtAi/sGbE1FvkUw3dGJFrQYa/0Q8N4fkBzuBBZoPpOFG/HoxMYch/n59UM6Dvsds/iAR5jrqAeYE9hh9hu1YUC4zPCNu1RVZTpFesCSMx7AJU5VgP7K+1D4/K9vCqSQ9PiugSj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EEbsXo7I; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EEbsXo7I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5715D1A308C;
	Mon, 30 Mar 2026 16:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CD085FFA8;
	Mon, 30 Mar 2026 16:41:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDB751045078F;
	Mon, 30 Mar 2026 18:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774888893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Iqkys6x53PzPsaice1LCNan4YUdfM5+iaXQVpc7VwNs=;
	b=EEbsXo7IoLXedxIYT/PUHpkA+dP0+X/ik/NY7FOGlI+LWi3C0jc/kXJ0CFLESttUUZkdaG
	8WlhtFXWdDRXjVo5RQ0GSik1wpo/Ps+Qo8RgoVSi73EFdF2vFSnBpgmK6D59LH85iKCnu6
	PWDzcwfYd/nI/vX88aaRAoftBIR/RKd0bU+WwYHhv/TguWEBQx1u+0S0ZdRS3byZrPZB49
	aVoT+FW5d69grX2owJCnBdcqIZXGWsFe9UAUJPnoyEvvEJ5TGNZ6PimgC+iRrmDSGNfWzw
	w/Z/uRMLtO0bodOEKDKKmu9iFBIm/lrBjo4SxJYe8fWlduRu9XieW3lLZfOenA==
Date: Mon, 30 Mar 2026 18:41:28 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/4] ASoC: Add support for GPIOs driven amplifiers
Message-ID: <20260330184128.68a4e779@bootlin.com>
In-Reply-To: <27e23c7b-4aca-41d2-96b8-df02c52e8121@sirena.org.uk>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
	<4daaa17d-5673-4efa-92ce-4f2ce87eb812@sirena.org.uk>
	<20260330173944.3fdc27ec@bootlin.com>
	<27e23c7b-4aca-41d2-96b8-df02c52e8121@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 30 Mar 2026 16:48:54 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Mar 30, 2026 at 05:39:44PM +0200, Herve Codina wrote:
> > Mark Brown <broonie@kernel.org> wrote:  
> 
> > > This sounds a lot like simple-amplifier.c?  
> 
> > The gpio driven amplifier proposed is more generic and can handle
> > more complex design. I.e. op-amp + resistor and/or line (mute,
> > bypass) switching. Hardwares handled by this driver are a superset
> > of just dio2125 and so simple-amplifier.c.  
> 
> > IMHO, it makes sense to have a specific driver for those kind
> > of hardware design.  
> 
> Right, and if it's a superset it feels like it should all be one driver
> rather than two separate ones.

Also, it is worth noting that simple-amplifier.c considered a stereo
amplifier (left + right).

Considering the two op-amp available in dio2125 as just two op-amp used
in two separated mono channel with additional component to switch related
to resistors (independant switching for each channel) means that almost
everything proposed in audio-gpio-amp have to be duplicated (gain, mute,
bypass per channel) instead of just instantiate two audio-gpio-amps.

On the other hand, there is no reason to handle a stereo component in
audio-gpio-amp. Further more with the hardware I have handling a stereo
component doesn't make sense. Indeed, I only have independent mono lines
with their own resistor switched amplification circuitry.

I could merge everything in one .c file but only a few part of source code
will be common to simple-amplifier and audio-gpio-amp. IMHO the resulting
merged code will look like two different drivers merged in one .c file.

Best regards,
Hervé
