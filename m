Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F81CA97
	for <linux-sound@vger.kernel.org>; Mon,  5 Feb 2024 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137453; cv=none; b=PalU1SpetFs1cfjJnHNBjbs1+7dyoVC0gB05uZWbw+0ny4AvGggB4ALjji9wcJVOK6CeS9+s4jdhFLkjBKkKnqlJwFYw8swxBjaq3Ojvvm+SrP1l8wHicOdiuj5H08cHg6YLi6hLMObXtKNe22ldUDuKX2DJlnMwYAr11EuitrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137453; c=relaxed/simple;
	bh=5eEdab9FqcF8g3wauGMH4df50DrOMqXSnLgMVhU1UfU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=FM0u6HRFZvid1n7kvdO/c4Cr0k+8bdLqk/E2uM0UsdayYjYYd9+zQVBJeeFWWjHS/Q2vjnl65Ul8kpQ/tCq6dJTWX7fZChjCrgEddCQs7EBWeUP4W9WwpUnWdk17UrKrVHChn2JGD+Eh4Jil7hzRsoSdQDwZOA4cf1v/Y8z0hEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TjYPFUX/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TjYPFUX/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AC7060008;
	Mon,  5 Feb 2024 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707137447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J4pDxE7xU94TRPLPqyHKkEOLh7/PGbJ8DkHJCmBwnrE=;
	b=TjYPFUX/DcrbgD8WQkAKlBTXNwebyhkiodbk0Zgp3ORLVirashQvrAQp6qHIkOmHJvxuvz
	62QELGJGL1b3oIRhDOy2r18ePkh1cfDY5MGb/0Qkv14IMfngCQE1NzPhVC2tbkA8UbOG+M
	fq7F64T61phMb1DYQKk29ZrHGHN37X+ZFPDfgpNHL6lsQDJ8rcDyuilskPG5Dnw4pUa6u/
	BBqZnjo9Kuxtd+5Ctqapj9SkAik+u+SrCwmW8qgIHsiTJa/PN6BjuNdUgheoYELcn8FadD
	iCGx6Sk3S+GqNLkFabtxhdk7U/5A1QCTkSVUq85FAIkc+C5Ao8DX2iZhK6SxQw==
Date: Mon, 5 Feb 2024 13:50:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zeno Endemann <zeno.endemann@mailbox.org>, Alexandre Belloni 
 <alexandre.belloni@bootlin.com>
Subject: Obsolete frames being played at the end of a sample
Message-ID: <20240205135046.0a1e9adf@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

I am currently working with a PCI audio card using the mainline Xilinx
XDMA controller driver through the PCM DMAengine abstraction. The
driver for the audio card is out-of-tree but does not matter much in
this case, as the card is always sampling the data.

During playback, the DMA engine is configured in cyclic mode, and raises
an interrupt at the end of each period. The core is made aware of the
elapsed period with a very standard vchan_cyclic_callback(). This is
all very usual, I believe.

The problem I see is related to the end of the playback. When the very
last period is being played, the following periods in the buffer are
not being written anymore. When the last interrupt fires, the core is
made aware of the playback being done and consequently stops the DMA
engine. But in practice, there is always a small delay between the
interrupt firing and the DMA engine being actually stopped. If this
delay is bigger than the time between two frames (let's say 20=C2=B5s at
48kHz), the very next (obsolete) frame will be played.

As long as it is a single frame, it is probably not really noticeable,
but Xilinx DMA engine behaves slightly differently. The controller can
only stop between transfers, so if a transfer (a period in this case)
was started, it will be processed until the end. A full period being
played with old audio samples is really bad and can be eared very
distinctly as a repetition of the end of the end of the sound file.

Maybe this DMA engine is a bit too greedy? But in any case just the
latency of the system (in particular on server installations) should
lead to regular glitches on many systems. Maybe the fact that the audio
card cannot really "stop" is also a root cause? But I would definitely
expect a way to tell the upper layer that the DMA controller needs some
more time to stop. For instance, knowing that a file would last 17
periods (the sample lasts 16.5 periods, and there is 0.5 period
of silence automatically added), I've tried the following hack. When
the 16th period has been played, I actually tell the core that 17
periods elapsed. The core mandates the termination of the DMA transfer,
which is being processed by the DMA engine during the 17th period. When
the 17th period has been fully processed, the DMA engine knows it has
to stop and no parasitic sound can be heard.

I've looked in the sound subsystem, there are some "silencing" and
"draining" mechanisms but none of them seems to be linked to the DMA
engine layer. I would expect either one of these two capabilities to be
forwarded to the upper layers:
- "I cannot stop immediately, please fill the whole buffer with silence
  after the last useful period because some more samples will be
  played."
- "I cannot stop immediately, please tell me earlier when to stop."

Any hints on how to properly handle situations like this and avoid
underruns?

Thanks a lot!
Miqu=C3=A8l
