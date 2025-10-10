Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590F156677
	for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760080611; cv=none; b=rUHVG5ENC4yJ4F4RvtkXO0ZXeL53VLiEqJfGi1pxp8hKVOZJvJAEvDnjwUJsXmGD0hVfbhboLhzcJYf2/WSe3z2TEdmIrID7jk2r0et5hfbl0tbrLyKg0EpKRwUBFpoB0+GoEsjZnLmHq4KWDSWeYLhuDK+di1p4cNbg32lw/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760080611; c=relaxed/simple;
	bh=nivzig4PTArehkrSE5IOJHy+ZEaFjUo103xghNGNHlo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOl7dkWDKD0B9PR8cYq7VdY6RrzqhypB+STlXKfCUSchAdaZzLPBFrLi0ifZQ+Z6xxj37Kb3CmNaK87yufiFcKlzm/aJnKrg0fd50KtlxcLaYkI+zw/Oi6Fh1NY/LP1GycjN72h52N+sVBJ+QUDsTCYhxTURwYW8/wlgHJl5OWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CX8X5tsR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CX8X5tsR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F2854E40FC6;
	Fri, 10 Oct 2025 07:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0E02606F8;
	Fri, 10 Oct 2025 07:16:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7053B102F21B0;
	Fri, 10 Oct 2025 09:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760080605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WQlReE8Q0IxFY4sktGQladeatAtJ3rufHhzKoNip3bw=;
	b=CX8X5tsRgvBC8Jq4JF4k17nUSnIJPRVRlj8I+K1dYjI+QcbYPPRrDJGlauNmKcf/cn2Bgb
	a1ukcLDg5jR6S/CWI7PTEJhjUPw8/R8gpIE/tdXI2OxFuDWohfX5HFmlOCfaOoeL6D2Rke
	Ce68I97VtNkeZkrqKk2MGeo1NN8V4dr+gBO5PlWxeM+GeYxL29rzaSRVPCjx+WbNeE3DIE
	ex9s1YP8LjTo2SPCecS38CnNBpxcp1CmOzYyzsqdSIqe2xSJeUQxueN6IKC1e//9ou3h97
	fdefki4Kg+QEDOnkIYBhM4pDOEO0Sb6vUgYbUgTW4vPPpPMFqKRy/TfEJfRTkw==
Date: Fri, 10 Oct 2025 09:16:37 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Fix gain setting ranges for Renesas
 IDT821034 codec
Message-ID: <20251010091637.75da0a86@bootlin.com>
In-Reply-To: <2bd547194f3398e6182f770d7d6be711c702b4b2.1760029099.git.christophe.leroy@csgroup.eu>
References: <2bd547194f3398e6182f770d7d6be711c702b4b2.1760029099.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu,  9 Oct 2025 19:03:13 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> The gain ranges specified in Renesas IDT821034 codec documentation
> are [-3dB;+13dB] in the transmit path (ADC) and [-13dB;+3dB] in the
> receive path (DAC). Allthough the registers allow programming values
> outside those ranges, the signal S/N and distorsion are only
> guaranteed in the specified ranges.
> 
> Set ranges to the specified ones.
> 
> Fixes: e51166990e81 ("ASoC: codecs: Add support for the Renesas IDT821034 codec")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Acked-by: Herve Codina <herve.codina@bootlin.com>

Thanks for the modification.

Best regards,
Hervé
