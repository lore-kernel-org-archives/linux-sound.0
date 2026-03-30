Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C6368971;
	Mon, 30 Mar 2026 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885194; cv=none; b=WhtSfM2v3BGpGxVW4m1F5nD1yIIu4mMGKbrCKqMbNPW5G5+1HGtyzbtPOhkIJ3vTsJVSOwCBK4ZyWYdJyrofn6hEwBsFbSiV1RRJYgn8VBoiJxvRHGZ/A5MlRLD+suZ7z7kb/3K9i0cA+cmFFsgUxWU9zhtNGUDkYwNyQXgloyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885194; c=relaxed/simple;
	bh=s2abMZNIz5jgK7e/ZVTddBIXlpEf23UCdPKkkrQSOGc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lp22zEik4AJHQFmGEJbdWbJat7La3IvqOg8OJMzzYHBSdqE/rK6Va0qO2C2ImaWxgC6Krq+6IGBazRJc3X1/LDoIMXG5U9KQrcsEnMotMJsplBdWHgy0YJePkGtW90QnD5gLtw8Td/ADOOouSy23F7jzoTsOXMSE5cw/ODZGouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q0q/sQIL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q0q/sQIL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55F3DC58776;
	Mon, 30 Mar 2026 15:40:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3158C5FFA8;
	Mon, 30 Mar 2026 15:39:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC36A104505B1;
	Mon, 30 Mar 2026 17:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774885189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lA66w17eugRDUx2ASwbxpvMZnvWItSzG6qyRRjXgzZU=;
	b=q0q/sQILZ9BqsHiLPRJ7EO2aHktALpZiM2qex72PTHxqhGAMyzUQaGtR1RO1FdrwqXZqyV
	+e1CVxUgN5F1CXXFB0525u8Bx6ytT7F8IydbJy0tSvYMG2C69FVf/mvEuUBUEsEbWuhbdO
	Sxgt+aJZeqSwr0+u+QemCcHrhyW5qDurLtWm1csdBV/dTtjQhB4hYG0ZBG2FapQf9kR9iZ
	pi/6IwO/hqR4e7DkbqfgkX31rvPmPcOcusdJeq2PfUgc9fRlckiTI2SeyUgb0CDQcDGFC1
	aew47AfCW4HE6du9BtFyXpeCNvf5skFHC7T1/vc2X62ESGXvnqF0vEmidGb2CA==
Date: Mon, 30 Mar 2026 17:39:44 +0200
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
Message-ID: <20260330173944.3fdc27ec@bootlin.com>
In-Reply-To: <4daaa17d-5673-4efa-92ce-4f2ce87eb812@sirena.org.uk>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
	<4daaa17d-5673-4efa-92ce-4f2ce87eb812@sirena.org.uk>
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

On Mon, 30 Mar 2026 16:08:47 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Mar 30, 2026 at 12:16:04PM +0200, Herve Codina wrote:
> > On some embedded system boards, audio amplifiers are designed using
> > discrete components such as op-amp, several resistors and switches to
> > either adjust the gain (switching resistors) or fully switch the
> > audio signal path (mute and/or bypass features).
> > 
> > Those switches are usually driven by simple GPIOs.  
> 
> This sounds a lot like simple-amplifier.c?

simple-amplifier.c doesn't handle amplifier driven by GPIOs.
The only used GPIO in simple-amplifier.c is used to handle the
enable pin the component.

simple-amplifier.c handles component such as dio2125 alone.

Here, we have op-amp but also several components around such as
switches.

The gpio driven amplifier proposed is more generic and can handle
more complex design. I.e. op-amp + resistor and/or line (mute,
bypass) switching. Hardwares handled by this driver are a superset
of just dio2125 and so simple-amplifier.c.

IMHO, it makes sense to have a specific driver for those kind
of hardware design.

Best regards,
Hervé
