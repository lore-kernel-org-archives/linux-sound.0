Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795849753;
	b=Ebsi3ov02NUYGipxVwSjyOIvPlPQm8Hf99SBMEC8bWjS1lrQJNtJGZunVMvTLLrJkyov
	 AZ3wVCJ+zcBGbUKZXwNiuWYgVxDxKbiAQ54HzynAaLp65aGgjoS2lHBjYsPplAm87bFZP
	 3tvXJZv2K8cHVy7bzg6Ydl9YmS0Ez8ER2xaJFAewIVQh3DRnfB+gFyiPXMk3iuehdgJFG
	 jEewp6LXckXzSimAcxijm19i4wXI8A4RxKznOMlLWRAfY+9JBgHloLgZhyg5I/H8XySZi
	 KONTiZTZR/U7vWrWE11OO2NtWgaIIdVlzsKaCvkphVPQJZr43indXrqvbGkXXibC4Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795849753;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+frJhA5zcIV6hnLz17sMj4USifPldAOiBN2xX/VQuJ0=;
	b=D3IiA89tT5AMq9iETj/tGPRlQfvJd8EJh5BiOXNAssgHkeOse/jyrBDKxFXOmRUmpXHM
	 Ltfe2DI6FPtXp3psqRiHG999GEkJvWG2S5w4wP+HWtzGSgIZ5D/o0Pn3qtI9vxAw5MgRe
	 EaZdEK4FNv9fmEgl4kWSSFhP4AgN+onpLBUCVN52GvCTrVQmFEKoJqzHdadxzDQrg+kbn
	 BAIxTUlftwlaxMlIQZ55sUIsvvomackNrZSvdRGl4bvxvYtnvYzyfULO1iJH2B0G746qh
	 Q5mZhpkRIX20T8+tf8jkvGRkEIaiUFy5vpckPMT9s6oVyxe62yO5apkp3RCojb7/ooA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=VGY3ixS3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=D02nf2W6;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE96606A31F
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 07:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE96606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=VGY3ixS3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=D02nf2W6
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8F5921400318
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 02:09:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 28 Nov 2026 02:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795849751; x=
	1795936151; bh=+frJhA5zcIV6hnLz17sMj4USifPldAOiBN2xX/VQuJ0=; b=V
	GY3ixS3CchDsdvzileLMnmX14a/AXcFpGR00GNOhDejoY8XM59gD0uftvI+A1YTZ
	p1e+56yvxGc2ZG1Rc7yRxVD9+ZebNuSo4PEi5vmKC9erV5PcXrKzUqKpmOKCflRL
	GTy5OIeWGSzUQNOKUorAx05CjomLIt/Hs7LZacoVa0xJ355KCQ/Rvu03d+pQxaK6
	9MdGDdk0+QH6/q/PuGzXJS5MG816dLvqb3kmfJf/PZvSL5N7kHEUs+JF1t9rrjdH
	6EDtQvxxJAV/XkseddhSbP/0u5eOp9CjYshYAjhASy1K1YREsesIQ+PucJ4LZo8e
	ClVOLnZeTtac4062O66Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795849751; x=1795936151; bh=+frJhA5zcIV6hnLz17sMj4USifPldAOiBN2
	xX/VQuJ0=; b=D02nf2W6huqSpNx1Rof1Us5vxnci74KAh4aN3ur9TbPkr4QMEVQ
	SPasEIiDnIj1IrqVSemC7G3LzVvzP0ojuF06hD36lVrwyY+q3RX7cEv4RgioNIyo
	UPwE6DZFklUkzsDRjdC2y/cQ7yCqeKtFDrdM4kUc94s3c6P7IVq1bwy/b/G5JSQx
	PuMG/xPgV7tLA2i3lTfK/bf0Vi6TRC008D16FyrpyDRIUGLztLz8Cy0i2oC8CpHd
	zOllt4H45cq7S48H6Xo/D3C3/GppUrgRgFKIwj/WuvMypHf4PrpMVe6hzIZR6yBs
	GtTwIFDgPnIllsz7kNvTCCynwwePwz5Yo8Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795849751; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:bkl2dRALKlKqL2PhDUtoa2S6Pk7rL4gs+R+fAtexaSsl7vo
	c98Dnmr8oYAMReAclbKOYiUexpBUmQBq8EV3tx5QyhCnWQkl59ygmhqo8YfyV9Qh
	AKaH/l/7o3hDv+ZDZycmYYSKhA6U+eTmK1rirHiG6ecWr223gE693QgHEa8Y0rOg
	ltxyGhElkSFxDKLzj4NNvPjdoBQsuruSj4hVlrzWk8bF/0NmoCV5NPE18NIS1An5
	6O5jdHpPNrI08JGf3fFP8CVq6xM1tCsucSoaGc0jw+X7CHHLz7itianN87c4b8yw
	z1x/fxJ1lyMqGFLb8OKrOY1LNjNN5WJE7gj57vw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4eIHAzxUDOZbubWuqbwViWAjn72C4pydkB4NbeRapdA=:faWgTroi3I2wGwABHClzoxA/B9fZ7VkTcZei+E0NV18=;
X-ME-Sender: <xms:Fn4Ka5FXrAzTAgGTbhkJsrzVn_rfnYPIuwtnhDH_Ps5lRLU7cWpLUg>
    <xme:Fn4Ka3r-ppey1wsokl8pf1RL78Zg-oBWJcNrdvdvaYdRLR7cIpSHrdal7_iVFFFds
    ZyUM3F275zvP0lEDEbh8qnKnlRjxGT_yi5qUqzyE6oeKzdq_eQHXx3w>
X-ME-Received: <xmr:Fn4KaybFqWUvEl1caU8ch8MSmYPNLFVH5sOsKFswH5fT81pZHefN4At8kpCyMKaSZkCxgXk8EqSvVbMFOuqLu6o_KE9b4uI>
X-ME-Proxy-Cause: dmFkZTGeDN2v3u5ZZvh7XT2Ap623SiXr7ExrrNxlnUzkXyQ4MQmD5jwVQc2cRlZoEXOtNM
    67x1FEbKTfEvpshQ5uxFn3Ws8UmhUaecGdkQww1AviRjV0yBTXQqA04YlcQyBZgRsIzWOT
    x1JePIxxXdOmpYZJaRbJOEXVnnDKnDCzoD6iM/tgsoNRNy7iTY90H1dVdgjq4Cujco4KyT
    UpzxMWUaC+RZhAQMuj3qs05tqsphebV4p7T+3SC069X4MxfT61k24uXBbuVliMRxUx5hSU
    jl59Z5yQkxeONKqH7P2jBfB5+fQ80AlvdpC5MRfHVEVlOSCowlGPN8xxtN5vZi+vHz7vGS
    N74wy7+4S9CF0WhXeNPWOFugYWaGys8n0YWsTENzmrc7PHuS71M4ILu+E0KQ15DzunLVcM
    sxwwv7A5pscE3PGRPJmjiwmvXsTdeOEgkjKfSgS4tqnLoMWNQsOZsb1kckiwJDB86PHCxM
    uVz4y+fDhpWTtkXPz/a7TaMxoAypdBoyTuzsHGQH0obpG23sRl4FTAXYwiqRbDPXuKwODH
    VaxS8WYcjeKqli4WwV+ShNb/dljuJlpTYRxge9QnHMnXd1pKnZjvLzyskrtGyZac+ECjcp
    87jJfskSXFh0S5V+qZhma6hExXuf76uF5wahneCSMqgp5K0FhQ9ZpQVkz4tw
X-ME-Proxy: <xmx:Fn4KawU0oRK7rsdFqLMYqPVZBqh9qUEbPe8IL5SfZjZnGDJi51giIw>
    <xmx:Fn4Ka78aBBxMlNYOi2ekgdigFf2phi0npLqlyzL8DbqXsm9ROMw8cA>
    <xmx:Fn4Ka58BqeYZjmlEDTdTFiWgroRGbNySHK4nm9PdO3rZFYSiZ3WKQQ>
    <xmx:Fn4Ka7RmQlksWp1RCKTexE6XKtsOZqhVEphycpfj6Z1iK3pujpmiSw>
    <xmx:F34Ka8-zCdloXzVrcNza9ipTzRvNA-ZeOUirOMNIZv0iCo3aBF-tpcmd>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Nov 2026 02:09:09 -0500 (EST)
Date: Sat, 28 Nov 2026 16:09:06 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: oxfw: bound the stream format entries to the
 response length
Message-ID: <20261128070906.GA47735@sakamocchi.jp>
References: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
 <20261125121238.1602172-4-maoyixie.tju@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125121238.1602172-4-maoyixie.tju@gmail.com>

Hi,

Thank you for suggesting the change. I think the changes in the other two
patches are good, however for this patch I have a concern about adding the
new function.

On Wed, Nov 25, 2026 at 08:12:38PM +0800, Maoyi Xie wrote:
> snd_oxfw_stream_parse_format() takes the number of two-byte entries of
> a stream format from format[4] and never sees the length of the
> response. A count of 254 or 255 can read past the 512-byte response
> buffer. An accepted format is stored with the length of its response
> and parsed again later. A count that needs more than that length reads
> past the copy.
> 
> Check the length of a response against its entry count before the
> format is parsed or stored. Formats other than AM824 compound still
> reach the parser and get -ENXIO.
> 
> Found with a CodeQL-based static analysis tool. Reproduced in a
> userspace harness under AddressSanitizer. Not tested on hardware.
> 
> Fixes: 5cd1d3f47a63 ("ALSA: oxfw: Change the way to make PCM rules/constraints")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
> I used an LLM to help write the harness and this patch.
> 
>  sound/firewire/oxfw/oxfw-stream.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
> index 5e36d7153a7b..d8fe136369d8 100644
> --- a/sound/firewire/oxfw/oxfw-stream.c
> +++ b/sound/firewire/oxfw/oxfw-stream.c
> @@ -484,6 +484,19 @@ void snd_oxfw_stream_update_duplex(struct snd_oxfw *oxfw)
>  	}
>  }
>  
> +/*
> + * A format of AM824 compound has five bytes, followed by two bytes for each of its entries.
> + * A response can be shorter than that. The parser rejects every other format before it reads
> + * an entry.
> + */
> +static bool format_has_all_entries(const u8 *format, unsigned int len)
> +{
> +	if (len < 2 || format[0] != 0x90 || format[1] != 0x40)
> +		return true;
> +
> +	return len >= 5 && len >= 5 + format[4] * 2;
> +}
> +
>  int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
>  				enum avc_general_plug_dir dir,
>  				struct snd_oxfw_stream_formation *formation)

Could we perform the length check in snd_oxfw_stream_parse_format() instead
of inserting format_has_all_entries()? The former is called immediately
after the latter with your patch.

> @@ -501,7 +514,7 @@ int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
>  
>  		err = avc_stream_get_format_single(oxfw->unit, dir, 0, format, &len);
>  		if (err >= 0) {
> -			if (len < 3)
> +			if (len < 3 || !format_has_all_entries(format, len))
>  				err = -EIO;
>  			else
>  				err = snd_oxfw_stream_parse_format(format, formation);
> @@ -662,6 +675,11 @@ assume_stream_formats(struct snd_oxfw *oxfw, enum avc_general_plug_dir dir,
>  		*len = 7;
>  	}
>  
> +	if (!format_has_all_entries(buf, *len)) {
> +		err = -EIO;
> +		goto end;
> +	}
> +
>  	/* parse and set stream format */
>  	eid = 0;
>  	err = snd_oxfw_stream_parse_format(buf, &formation);
> @@ -740,7 +758,7 @@ static int fill_stream_formats(struct snd_oxfw *oxfw,
>  	/* LIST subfunction is implemented */
>  	while (eid < SND_OXFW_STREAM_FORMAT_ENTRIES) {
>  		/* The format is too short. */
> -		if (len < 3) {
> +		if (len < 3 || !format_has_all_entries(buf, len)) {
>  			err = -EIO;
>  			break;
>  		}
> -- 
> 2.34.1

Thanks

Takashi Sakamoto
