Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCBD1632E7
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782569820; cv=none; b=rO/3i6Zqvsf0MaHzpEANg6SIFByUj2fOSqrNOGLSRt+uj1zO2Y01eMlpcpyCvz+150upANHTT7jmqaqVidOntiZGwiB/rZmQqgBnyoLxf18MSjVzUYAOtnI210SV3moBWVhBSwHJlqKiEDIOhhq0hRTocPq64ICgTyQcfL5YvEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782569820; c=relaxed/simple;
	bh=qPuDYKdwvZSZbJFKpqDaIAHRtZG5G1aWy+PB5mHHpok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=iDayT2+Ga5OtPR85k3ko/6gnqKI1bZVNbDWmVI8eiY66MUyTOD6YZH0bLVaYXaDBfbGFnLUSq+5A2d1U1z3CDvToM5UAT0WJTvPp6diDNHXPvPAJjpR1DCOO0GDcwXyFyqfXYcyuq8jz1EqcgNYhU3tHiRo3AO0+6KK5Z0U1Nb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=gT58mlhs; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="gT58mlhs"
Date: Sat, 27 Jun 2026 13:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1782569806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qPuDYKdwvZSZbJFKpqDaIAHRtZG5G1aWy+PB5mHHpok=;
	b=gT58mlhsqP4+uwQrQkq1uJ/P1liYsrE+IgIj4wlDn4MaNfgtYG494jophxL+qP6n1GGta4
	FkhtAegIuIRq6hMEqTlxN5aupnIjgpbw98mw38bEyMbPH3tSxbTz3WrCCXGXU9Vjcta5Ff
	4MpK7cAelJjRhWIp7SfX91QrSseyLTIcIfm3WfAwUvTipLiQEJrhTFoQMU6oNG3FiaDcF9
	q1BWIOVouumBO5iaIqdu+lIah1E7knT/vJmnhgXDR70EiewbpgSA/05sYluB2OnA396nPi
	DZ7E2OHMDFdUx7QIaUtvubHhog6rCxv1uHQhXjHxLkLAMklzkLif4Lo8o/Xg5Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Christian Hewitt <christianshewitt@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: 
Subject: Re: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
References: <20260627125030.808058-1-christianshewitt@gmail.com>
In-Reply-To: <20260627125030.808058-1-christianshewitt@gmail.com>
Message-ID: <thanni.i9bbkrc1oza2@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi Christian,

On Sat, 27 Jun 2026 12:50, Christian Hewitt <christianshewitt@gmail.com> wrote:
>The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
>AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent:
>it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
>producing the "machine gun noise" buffer underrun - on start when switching
>outputs, and on stop when playback ends. The latter is audible on devices
>with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>
>The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
>both enable and disable (audio_hw_958_enable), and when reconfiguring
>(audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
>reset before enabling the DCU on start, and after disabling it on stop.
>
>Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
>Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

You may have forgotten to add Martin's R-b here.

Best regards,
Ferass
