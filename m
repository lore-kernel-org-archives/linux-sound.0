Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED3157484;
	Mon,  6 Jan 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184800; cv=none; b=LDqngKkp4xebXxn5oFIutJcCkATl6hBCorrILyU3JDj1Y+ozPRimhiB6xv72vt+jXjbeJbBQsoInwdVruVseFc3fOv1+5ONh/ha/1zJqTXMQH1XPSrseA6eji/ql8rVgepQUpRNC0V3LnAjZTwT2WKx2s1xK0mlr9Mqx3ructOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184800; c=relaxed/simple;
	bh=raQLplo3YHOodoFbQHsJDY5RmZFdu7k7k0Vckr3LSak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyGx80hQKX4XaAzGTtxUohbzbYFv0rWMcpNJ6bPBVOHXOhjyT6x70fqdQO65qNI8jlKsWoUISnZfh0FDv2nntw2feGb/RSyF1CsREW58bZBPfJ0+5p/nnsi1DTrvdQoJP8wfibH9Xqkrad/U/iD0QA7L9KQEvTjdDjBjwdJEvho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kDFkE5aJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kDFkE5aJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736184796;
	bh=raQLplo3YHOodoFbQHsJDY5RmZFdu7k7k0Vckr3LSak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDFkE5aJYDigmfNcmJgranJ0zk6OGy24hbawUOhJcOWil7PyDjnBDsvmHO6Jlrm4L
	 ZSBHl+utX0uxSdH3gLio+HX82zPFbYwalLRUXT9BQjZG+g9ZyhwAXT1Rjj2+93oafn
	 rGqEhVmjMYcU8rFpHx3+Sm6tT9I/2VBPl5FJo3F/ZkOzd3G7AZdZzj36w/7pZGXXUI
	 P9fJSZdFp/f0Pf0YU2FvpJIryrg1UtNC2iWia/Iwq/mMU8wZ/PiMIGhL5s6I+PvdE/
	 2OsYJd4PdQIFYemReHB3Xa8q5mScj3HKE+wlqO6GZIUAiXEDrzmnpTa1BzYr+5buml
	 HkqUiXnxJAXlw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68E3817E15B6;
	Mon,  6 Jan 2025 18:33:13 +0100 (CET)
Date: Mon, 6 Jan 2025 14:33:10 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic
 codec
Message-ID: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>

On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Wed, Dec 4, 2024 at 3:22 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> > a dmic codec to be present for the driver to probe, as not every
> > MT8188-based platform might need a dmic codec. The codec can be assigned
> > to the dai link through the dai-link property in Devicetree on the
> > platforms where it is needed.
> 
> A followup question about this. The DMICs on the Chromebooks are attached
> to the PMIC codec's input side, which then converts the signals to standard
> I2S and passes them out to the SoC through its AIF1. So the original code
> was somewhat incorrect, though it works.
> 
> How should we describe such a connection, given that the MediaTek sound
> bindings aren't a full graph?

What you're describing is that the hardware topology looks like this:

--------------------      --------------------
|    SoC           |      |   MT6359 PMIC    |
|        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
--------------------      --------------------

But that the dailink definition in the machine driver had the DMic codec
connected directly to the UL_SRC BE instead, alongside the connection to the
PMIC, unlike the topology above.

My understanding is that the dmic codec was added simply to allow the usage of
the wakeup-delays. From [1] it appears that DAI connections between two codecs
are possible, though rare. So the PMIC -> DMic connection description might be
possible in that way, although I'm not sure it brings any benefits besides
closer resembling the hardware topology.

[1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html

> 
> > No Devicetree currently relies on it so it is safe to remove without
> > worrying about backward compatibility.
> 
> Removing it didn't seem to cause any issues for the Chromebooks that
> do actually have DMICs. I suspect the only difference would be that
> the wakeup-delays no longer apply correctly.

That's my guess too.

Thanks,
Nícolas
