Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0931DC1AB
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808221; cv=none; b=llkpMctzrj1iYgSpHjDrttLW/PYxCoj2Mwi52/LBCBDGWkGnrON56Nsj9otVrisDF5SImQx5Cb5EfdQYuAWsI2/DhghCDqXGeb6MhSAUZyht9FUj84gFl2mzqiM0hvw6B3r8pHTjRmzxHDrED2HXKx0bdLxwvi6O5IErgJcNZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808221; c=relaxed/simple;
	bh=GqVja/wYMr+GIx1XTa/Um3CGRHwOCAW2GPX9x16qv54=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMjGsTu2FPtI4yopj1AyoHM94rdUUOOgl7wBeRgE49F9yJef4fyGmYgbeRXCelndpNO3gayeAio0jM+h8vlVk+pp8fAcjrIdbvoOQ/fvM5Lbaq61149rTQ1M95TGG5uHRHI3LEfkEibYGSnzVOuAHjYZvSdKdHXiMhNCwbgXXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w211sklA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w211sklA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF7BE4E429A2;
	Fri, 10 Apr 2026 08:03:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9392B6042F;
	Fri, 10 Apr 2026 08:03:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26727104501FC;
	Fri, 10 Apr 2026 10:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775808214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+FK7vpYb+MDnT94F6A494bLVe1AhIg54zS2mn/Kup+E=;
	b=w211sklA1zi8mjJf+Nq2ofIkIM33NpCLnA2TeOjxlwtYuE4NUFT+FDK+bLsvWiiuDPmsN1
	glZSJDu7TwEpI3KnPRuB7fuLIhB8z6W5TtBleutuN0i3Gs56IcrQ0u2aKgB27261K5ifmo
	UV6zXhaloQ0mKeB5q5AE7Zc/o3ScrJGQJeZ505ZmlRjuaez35WrWrh8wrCm/d8T/HA3hUA
	M4c4IUGF/LCgICOkwuz87mkRjKp4tXa6SG7Fvak0Qk8BOmoQLbyr633s87mzqScNMLAj8L
	q2TMX48icEqjKWR/wiUk8FnAvqWyHg9kMdtbZbyAvpUJ9Msj3khwtME9tMcztg==
Date: Fri, 10 Apr 2026 10:03:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: Add support for the GPIOs driven
 amplifier
Message-ID: <20260410100330.1fc4b97b@bootlin.com>
In-Reply-To: <383635c6-0417-4333-aa9c-9056437d4a5f@sirena.org.uk>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
	<20260330101610.57942-3-herve.codina@bootlin.com>
	<20260408122901.GA42727-robh@kernel.org>
	<20260408190932.0ab936b0@bootlin.com>
	<CAL_JsqK4SHQS6MciQpLSrGWo2knqs7-eB3yoAv2J54bSfW-Lxg@mail.gmail.com>
	<383635c6-0417-4333-aa9c-9056437d4a5f@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark, Rob,

On Thu, 9 Apr 2026 16:26:25 +0100
Mark Brown <broonie@kernel.org> wrote:

> > > I didn't want to set a particular limit related to the number of GPIOs
> > > used for thje gain value. Of course 2^32 is obviously a lot.  
> 
> > > What do you think about 16 for maxItems?  
> 
> > What is the most you are aware of? Take that and double it.  
> 
> > Seems to me 256 levels would be way more than a human ear could distinguish.  
> 
> There's plenty of gain controls with way more than 256 bits of
> resolution, though I'm not aware of any that are configured via GPIO.
> The step size and absolute values you want can vary dramatically
> depending on application, possibly in the same system (eg, a DAC that
> can be connected to both headphones or speakers) so you often end up
> making practical adjustments in a small subset of the available range
> but that subset can vary a lot for the same part.

Mark, do you think that max 16 GPIOs could be an acceptable limit?

IMHO, this value is large enough to be used as the limit.

> 
> > I guess my point was that really we could deprecate simple-amplifier
> > binding because this one can handle it and more. But I'm not
> > suggesting we do that yet.  
> 
> That's my thinking.

Fine for me to, at the end, deprecate the simple-amplifier.

