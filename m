Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200010;
	b=FgW19r9aBi50uCjs2rmYcSx7j6yla5j3Ze60AS0Z9eeNom4b+Gw0zSSA4AHFHSXrds8p
	 Ti/QC4u0QftKuzHwnGRPP8ztudqNSWp/usiq1M9C/+C82DaNHdds6sYEYo415qHdMfsxZ
	 OGT/gS9DXfyxL4Q2pbRTwNoU60/h+oafiF3Jy5z4L59vKVNlWxmXfFbgKbgPM7AvMsgoO
	 a6RLng22yEF8Ij1+0KEYreXfClL02oDY1Lo7OjEfTn07YmRmFbC8r4iyWY/Z6SyrNnrdN
	 mn0W910rJsLGGisEknrdWvrilMVKVQ0Ixxsf2/JYkjNPJPSUIpq3GPmVd2b3WRVeuVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200010;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BymGdWuHLNd6aHnCxIXwnolcF+RB6pAzqWUTnpfRbzM=;
	b=utNdl1unPbXQdn6hl5+xyz8o+GWt32LL8hQKA+Xtc5Yy4sZjMNHhD691TxrSt2m1ODab
	 p6qujUFkvfI25QOts4bWf7e/TTf5HqK/n2OkWW47HUPz5/++xjVBfTdUsNwEz33xVH2Fq
	 H1Jub9NeLvXj3GCmiBliFoaRMoRUFehi3COpWDxZZ6tEaX8XCKCljFHO/slaREgzyeBtK
	 84GZpAD1vdG8l2AwuwgBBVvws2lhet3ep1CfiM6zrVGeMrBOrlfgvD54eS8Zl1cjg/Z4M
	 Kmx3W/8KN9XcOl4s/f7DuP6Hrd8owl9+sRjKBLtcj7TCeGbnckOy2bUK5Sw9+Pe+qSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYP6Ys9F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD360A2603
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYP6Ys9F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212821F01828;
	Wed, 28 Oct 2026 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200010;
	bh=BymGdWuHLNd6aHnCxIXwnolcF+RB6pAzqWUTnpfRbzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYP6Ys9FIavsyOYZr+XeoXsZsWFqGlhTcAW7G7n3Sgn2wzam6IXWSbnr1H+0+UGI8
	 /gXN3bakpy47bkG3P4d5QFda9b+ED0BGoDyIQq+btkKoCSZrIpwn+O5A7OiNVhZeP5
	 ymRr4GGaCvQleyNSBzovcNG2XTux++KquKL5YLaM8OIR4bSmKR23JB23PEAcrWYFXm
	 z7hyRWKb1tavD31wsJAMa9wHvDLEykNBkPbLeoqnmlaOW8cL4FC4akxvY5X+Qs8bjq
	 P+pXQNIJMTHr/sKMQK6hbt8jyyFF2aYzlnpQ+S/F0Lla3QTl+QuKVWsa6adfABXpEb
	 kkJJ80uouCVrg==
Message-ID: <sashiko-outbox-188035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] slimbus: preserve ports after failed disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Avi Weiss" <thnkslprpt@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028145508.1111792-2-thnkslprpt@gmail.com>
References: <20261028145508.1111792-2-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:06:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] slimbus: retaining ports in slim_stream_unprepare() breaks strea=
m re-prepare
--

commit a86f555a1b6f385fbf7a79c9ae53a6b9032ee169
Author: Avi Weiss <thnkslprpt@gmail.com>

slimbus: preserve ports after failed disconnect

This commit updates slim_disconnect_port() to set port disconnection state
only after a successful transfer, and modifies slim_stream_unprepare() to
propagate errors while retaining the port array on failure so it can be
retried or freed in slim_stream_free().

> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index b4e70a7edd1cc..ab26b243802df 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c

[ ... ]

> @@ -448,13 +453,22 @@ EXPORT_SYMBOL_GPL(slim_stream_disable);
>   */
>  int slim_stream_unprepare(struct slim_stream_runtime *stream)
>  {
> -	int i;
> +	int ret =3D 0, err, i;
> =20
>  	if (!stream->ports || !stream->num_ports)
>  		return -EINVAL;
> =20
> -	for (i =3D 0; i < stream->num_ports; i++)
> -		slim_disconnect_port(stream, &stream->ports[i]);
> +	for (i =3D 0; i < stream->num_ports; i++) {
> +		if (stream->ports[i].state =3D=3D SLIM_PORT_DISCONNECTED)
> +			continue;
> +
> +		err =3D slim_disconnect_port(stream, &stream->ports[i]);
> +		if (err && !ret)
> +			ret =3D err;
> +	}
> +
> +	if (ret)
> +		return ret;

[Severity: Medium]
Can returning early here while retaining stream->ports prevent the stream
from recovering on subsequent trigger cycles and leak stream->ports?

When a SLIM_MSG_MC_DISCONNECT_PORT transaction fails in slim_do_transfer()
(for example with -ETIMEDOUT), slim_stream_unprepare() returns early with
stream->ports still allocated, while any ports processed before the failure
have already been disconnected in hardware and marked SLIM_PORT_DISCONNECTE=
D.

The callers of this API in sound/soc/codecs/wcd9335.c (wcd9335_trigger())
and sound/soc/codecs/wcd934x.c (wcd934x_trigger()) do not retry
slim_stream_unprepare() on failure, and slim_stream_free() has no callers
in the tree:

sound/soc/codecs/wcd9335.c:wcd9335_trigger()
	case SNDRV_PCM_TRIGGER_START:
	case SNDRV_PCM_TRIGGER_RESUME:
	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
		...
		slim_stream_prepare(dai_data->sruntime, cfg);
		slim_stream_enable(dai_data->sruntime);
		break;
	case SNDRV_PCM_TRIGGER_STOP:
	case SNDRV_PCM_TRIGGER_SUSPEND:
	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
		slim_stream_disable(dai_data->sruntime);
		slim_stream_unprepare(dai_data->sruntime);
		break;

When the stream is subsequently restarted or resumed, slim_stream_prepare()
sees the retained rt->ports pointer and rejects the call with -EINVAL:

drivers/slimbus/stream.c:slim_stream_prepare()
	if (rt->ports) {
		dev_err(&rt->dev->dev, "Stream already Prepared\n");
		return -EINVAL;
	}

As a result, slim_connect_port_channel() is skipped and the ports that were
disconnected during the partial unprepare are never reconnected. Immediately
after that, slim_stream_enable() runs and overwrites port->state on those
disconnected ports:

drivers/slimbus/stream.c:slim_stream_enable()
	for (i =3D 0; i < stream->num_ports; i++) {
		struct slim_port *port =3D &stream->ports[i];

		slim_activate_channel(stream, port);
		port->state =3D SLIM_PORT_CONFIGURED;
	}

Furthermore, when wcd9335_slim_set_hw_params() or
wcd934x_slim_set_hw_params() is later called, dai_data->sruntime is
overwritten by a new slim_stream_allocate() call without calling
slim_stream_free(), leaking the retained stream->ports array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028145508.1111=
792-2-thnkslprpt@gmail.com?part=3D1
