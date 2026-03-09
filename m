Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62603A8754;
	Mon,  9 Mar 2026 12:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057949; cv=none; b=Q13TDLRm9ld7SNybisKfTFLQqIZEzPwRxxl9uiriF8bB1Y8VdXspj4jZ/VIaOkryi2VicNMqSMAXjP61WA1fakHvo6rJRw8beYjaUygoITl03dVqH/yfkPs5cv3PA4ZuPRLsTBF3Nl0UCSkLyWV1ciq49SxitMxRJfiJ95kxGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057949; c=relaxed/simple;
	bh=Z2j9z9BFHF9Da/JH3Ym5QWQCmRFlUSB8RUVHbdTi4O0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfSFmR2eEMI3cFs7hNnp0CXxgYauttOiIiMuckH7lzEMJSW3ViKrwwyMYWq73y7ZCbLkEt+bslnZBlInkRrk7Nu6mEXdsx7twA2HfkrBOQCTdACwnWYSTFiHQ0+rjI2dusHgWbTgn7AJaIVxppaNxKYqoq4P2mBHocNd7Ajuc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WFyYtAu/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WFyYtAu/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3DCBAC42876;
	Mon,  9 Mar 2026 12:06:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C78215FFB8;
	Mon,  9 Mar 2026 12:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E73861036807B;
	Mon,  9 Mar 2026 13:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773057944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yWpx0EHbzSjkPaXuLFdylkFYzIhpnWKUAFkDHQiX9uE=;
	b=WFyYtAu/wSKjL9dFsFA38PGMoOsoNtoQ00aKrBHEz8RULfblPQA2E7d6yHSiHn/SivuZji
	rTIN0G1H1TjY5r4ySpXjpXEEnil5E01B9DzfRP4keDa0W+v73nP+eEw+0y+MQrBdfWkYnY
	osAAY8JB1oKrImTNqzWxoxNn2rCnYzV3xZgpmtUKi5rD2KLk5K3tPLOZNDOLGHUKB0uYmg
	I+77Fmg26Nls/mdJJ9aFG17Bvct3v+RSlfeIP5lQpXSb5dONPezaf4BZFDfNk+ipOPE9CJ
	QJqMkXUOBdeFeSFB5G8C+/lsSLX4IOiAkfIqGndUoR9hTYTZaPlQox5o70sSlA==
Date: Mon, 9 Mar 2026 13:05:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: peb2466: Change the +/- 6dB switch to a
 volume
Message-ID: <20260309130540.14c748a4@bootlin.com>
In-Reply-To: <418fe76d1c9efc8182ab57b6b426a8c723e025fe.1773056714.git.chleroy@kernel.org>
References: <418fe76d1c9efc8182ab57b6b426a8c723e025fe.1773056714.git.chleroy@kernel.org>
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

Hi Christophe,

On Mon,  9 Mar 2026 12:46:49 +0100
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> In addition to the digital volume adjustment, infineon peb2466 codec
> has an analog adjustment which can be set to either 0dB or +/-6dB.
> At the time being it is defined as a switch and appears in 'alsamixer'
> like a 'mute'.
> 
> This adjustment isn't a mute, change it to a 'volume' with an
> associated dB range.
> 
> With this change, this adjustment now appears in 'alsamixer' as a
> standard volume slider which can have two positions.
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  sound/soc/codecs/peb2466.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
