Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE58A2836B0
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286588; cv=pass; b=CNRjZdfZqyevCw71DndSInG/nEvBe3I/QKLnfN6xuHhIUoft1r3tiLsKm3jDYBwFDuIaOmPJA3/gxdRmHpiMoxC+jla0hQqI4+Jv0sJVVElkp2D96w8YZxXlcFwESQzUVGLj/S3D3awtR6+0io4E2YwMwWu/vco4f/OYGhIHZlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286588; c=relaxed/simple;
	bh=d5EyymkQalX7L+YXSzFeSPUpxlp4njQhV6kqbcQj7e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tu7yiMQkNT3KCT/7ycEZeQklpXk8OYTSe8AVnx9pV0kDrnU2EszsFm7tWABCLCB5qvM/TjEabOA2G4XDEaE9z9VArawfikLctPIlfhyJmgELyrbg4OL3NZJXMyu+RkL51yqGnOxZ5rR2uphxBt1sRMxNeap7wjfwL4GeL+5YYlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=SdnhHkFx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="SdnhHkFx"
ARC-Seal: i=1; a=rsa-sha256; t=1744286579; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MQ07zcQPPBRllaSkwReZSwA/0LbgRWYxOoPrVmZZy/XBzuqCvzwkgSBoSYYfeWOFtkxcusJt4D+DE7FBX9EPwaUeU5jXK9u6cizATI0dnAhVr1tQQQIn3guNM/+Das7Vhpq9P5hmgO57F30KQOvjOy02xprB28Eo3+dmJtYCPLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744286579; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ubwIQRHQ0nSkTDomZO0p8iQHfiBz7QsAlvvYhBr59zs=; 
	b=G1tbkt8G4IzvQ9H1izfc0lsbdClVw00/qVH4zpP6BqcMily4HnpbMVPMtZId/G6cZfXA7nl0+AABUmUJt4XFELDYWfChWkJ3v0BvYm7AH+ADtia35RGIqnXnGOODWDzqJk6O+SYOxZRKKRa7FZ9z2DLUmQecD5q7AEURyIwQMcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744286579;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=ubwIQRHQ0nSkTDomZO0p8iQHfiBz7QsAlvvYhBr59zs=;
	b=SdnhHkFxPApI/hM9MBgepiLcy1WOXfDOkw2qDvRuXVGDLrS4Rf7X+sEUc7I75E+c
	gzGT8ttG6JM4/nOMOLe7XcDBnp+I3FD1kzMOEYgImAEeGW+v7dhhCqj0hr8g5TebMsM
	Qj6Ev/rkycsxN+IpJtjG6FK8eCuZdl8KXQlXuhUM=
Received: by mx.zohomail.com with SMTPS id 1744286578637871.8983135923082;
	Thu, 10 Apr 2025 05:02:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Debugging CPU-side DAI hardware with a dummy codec
Date: Thu, 10 Apr 2025 14:02:54 +0200
Message-ID: <2703798.PYKUYFuaPT@workhorse>
In-Reply-To: <5347100.LvFx2qVVIh@workhorse>
References:
 <4927043.LvFx2qVVIh@workhorse>
 <CAEnQRZD4xw5wRR6exsXo9xjTmmQ1TQAn0jNVeXij66-veEESMw@mail.gmail.com>
 <5347100.LvFx2qVVIh@workhorse>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 10 April 2025 13:23:21 Central European Summer Time Nicolas Frattaroli wrote:
> On Thursday, 10 April 2025 12:54:16 Central European Summer Time Daniel Baluta wrote:
> > > > I hope someone can shed some light on this, as it seems like something audio
> > > > controller developers would be doing all the time.
> > >
> > > I suspect most people test with an actual system.  A bunch of things get
> > > easier if you can actually play and record sound.
> > 
> > Mark, that's true in most of the cases. But for silicon IP
> > pre-validation using emulation
> > environments most of the SoC creators use a synthetic codec so things like being
> > able to probe a dummy-codec does make some sense.
> > 
> > Nicolas,
> > 
> > Can you please paste your patches (dts and the rest)?
> > 
> > thanks,
> > Daniel.
> > 
> 
> Hi Daniel,
> 
> I'll send the test-component changes in a proper patch submission later.
> 
> The DTS in my case looks like this though. `sai0` here is the SoC-side
> audio interface. Don't worry about the pinctrl/dma overriding, that's
> me disabling capture.
> 
> ---
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index de63b053a06c..6e78713b1a99 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -84,6 +84,25 @@ simple-audio-card,codec {
>  		};
>  	};
>  
> +	dummy_codec: dummy-codec {
> +		compatible = "test-codec-verbose";
> +		dai-tdm-slot-num = <8>;
> +		dai-tdm-slot-width = <16>;
> +		#sound-dai-cells = <0>;
> +
> +		port {
> +			codec_endpoint: endpoint {
> +				remote-endpoint = <&sai0_endpoint>;
> +			};
> +		};
> +	};

Gah, major blunder from my side, the dai-tdm-slot-* properties should be
inside the endpoint node of the codec here like this:

	dummy_codec: dummy-codec {
		compatible = "test-codec-verbose";
		#sound-dai-cells = <0>;

		port {
			codec_endpoint: endpoint {
				dai-tdm-slot-num = <8>;
				dai-tdm-slot-width = <16>;
				remote-endpoint = <&sai0_endpoint>;
			};
		};
	};

Sorry about the confusion.

Cheers,
Nicolas Frattaroli

> [...]
> 
> Cheers,
> Nicolas Frattaroli




