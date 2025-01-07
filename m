Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859FC1EBFEB;
	Tue,  7 Jan 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250448; cv=none; b=SsY33iXtwkrnVARFaeW2ehxNngGQKN9THMnYw9YYk7ErjPhFwkgqrp0ZBjz3lWrQhDWVPmTM6ldHaSgl1lJmVwrj6CpsZk3b5Uv0m5v2flRKjy/+kB/5Nuko+Y4tXkaoLghnH3rHokzxY620s6W3qCfgpmswz4zoII1Xi6DOCXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250448; c=relaxed/simple;
	bh=0TrZCAQ8WrM1LVeDaQMb9nE1S6brNmw6AnHjH6a6Fg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bha1qG6OcSpAsO08hVUMCWBX6ehVukil+Pu4nzATzQX/AUH2EjKm3EWlZTISB2wx7icHVg/yzA6a0bnWVu2FueUSifAY3bkipEgrMu3AyMCb3dIAtCBZwWvo09F2ZP009xrEE/IVURVIJk0xTsrsv44NYOlrYCRHh+NGq3AgV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LW/OkmuP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LW/OkmuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736250441;
	bh=0TrZCAQ8WrM1LVeDaQMb9nE1S6brNmw6AnHjH6a6Fg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW/OkmuPaFhGWT8QxW+Ex4JfwpJKnGLdogXm+UszlR33SmmKKetmcdqQXbFSrb9A/
	 QJsuncfkKV2EcU/UTTBbmkpwfO+4DkgE6UFadjtWL16jXnZgD10LyJnFrR6KHGtC8H
	 2xJOAoMK66QfC9q7Hm7YpZBg7JYOJFzwxXpdAv3qVZO6b0HtR2Onz+c3QpAhsko2cE
	 cJ4AyDHDbulTUT3T7n4bZhQb3VtTg7fgRc55b/nMXFGHjzXJMIB37hrs80cGBKQFB4
	 NDgdouUYrO2tFGkE0MYfza8BW2nRpAdI9UM/emmGO0kLGINT/XsfsrSJzsC7KVQkZU
	 U5yUm/5RMQzDw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F98D17E1562;
	Tue,  7 Jan 2025 12:47:18 +0100 (CET)
Date: Tue, 7 Jan 2025 08:47:15 -0300
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
Message-ID: <2c305aa4-860d-49a7-b20e-c5df58110533@notapiano>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
 <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
 <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>

On Tue, Jan 07, 2025 at 01:03:08PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jan 7, 2025 at 1:33 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > >
> > > On Wed, Dec 4, 2024 at 3:22 AM Nícolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> > > > a dmic codec to be present for the driver to probe, as not every
> > > > MT8188-based platform might need a dmic codec. The codec can be assigned
> > > > to the dai link through the dai-link property in Devicetree on the
> > > > platforms where it is needed.
> > >
> > > A followup question about this. The DMICs on the Chromebooks are attached
> > > to the PMIC codec's input side, which then converts the signals to standard
> > > I2S and passes them out to the SoC through its AIF1. So the original code
> > > was somewhat incorrect, though it works.
> > >
> > > How should we describe such a connection, given that the MediaTek sound
> > > bindings aren't a full graph?
> >
> > What you're describing is that the hardware topology looks like this:
> >
> > --------------------      --------------------
> > |    SoC           |      |   MT6359 PMIC    |
> > |        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
> > --------------------      --------------------
> 
> Correct.
> 
> > But that the dailink definition in the machine driver had the DMic codec
> > connected directly to the UL_SRC BE instead, alongside the connection to the
> > PMIC, unlike the topology above.
> >
> > My understanding is that the dmic codec was added simply to allow the usage of
> > the wakeup-delays. From [1] it appears that DAI connections between two codecs
> > are possible, though rare. So the PMIC -> DMic connection description might be
> > possible in that way, although I'm not sure it brings any benefits besides
> > closer resembling the hardware topology.
> 
> I suspect we would want to keep the wakeup delays though. AFAICT they aren't
> the same number across the board (no pun intended), but actually differ
> between devices, perhaps due to differences in the actual DMIC used.

We can still keep the delays. We can keep assigning the dmic codec to the UL_SRC
BE, only through the DT now rather than hardcoded in the driver:

	dmic: dmic-codec {
		compatible = "dmic-codec";
		num-channels = <2>;
		wakeup-delay-ms = <50>;
		#sound-dai-cells = <0>;
	};

	&sound {
		...

		dai-link-1 {
			link-name = "UL_SRC_BE";

			codec {
				sound-dai = <&pmic 0>, <&dmic>;
			};
		};
	};

It still doesn't match the hardware topology, but the delay should work the same
as before.

> 
> If we don't want the full description, maybe we add the wakeup delay to
> the PMIC codec then?
> 
> AFAICT [1] is basically hardcoding in the dmic-codec in a different way,
> so basically reverting your original patch.

Hm, on a second look I think you're right.

Thanks,
Nícolas

> 
> ChenYu
> 
> > [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html
> >
> > >
> > > > No Devicetree currently relies on it so it is safe to remove without
> > > > worrying about backward compatibility.
> > >
> > > Removing it didn't seem to cause any issues for the Chromebooks that
> > > do actually have DMICs. I suspect the only difference would be that
> > > the wakeup-delays no longer apply correctly.
> >
> > That's my guess too.
> >
> > Thanks,
> > Nícolas
