Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700836;
	b=DuN1rhyEXHqYjdcQkWgNTudJsYy2BwSMhcoHvR3FgO4D6VEyRgwzmNrElud0OoWnhi3+
	 KCYRtCEqGGxKqc+jXQTxItUerypZ7/hKkI4aJW9rxly6nGRTug15W6yEQLuVHYbfjjFG9
	 IdWaUqLsSB+PWHsTwt1Oc+0EllUzPcIZwI4b+69ZVB8NWqOOa/bSmdZ/8b+cZ0QVeLjLs
	 M+tD48BW2qDafqZ1ojRdc00ES1OqPYnUuMxtKukKsvL/Umh6dMhmIZzE2oPP/qWbO4AVF
	 GJ6qHPyITI0BH811HhB+z/YbjTysEGors6+E+60hpeALXRwN7Do1Q8Dyfkvms4inl4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IV6dvBcBCfFQeJE98BpetpmrG1DisRtDM5QrzCUps6Y=;
	b=3b2lWmVADm+9VVAfZe2TmwdVEveD5eaQC9kg3D1XRxMg2xiMmHO5mMUD1qJiNg62rq1N
	 IusOm6oDG/dUzD2R5qnCJQzBc+Q/jJehDSs8PtjQVtGIVzIzJ9gCHieMN2dJrC4l/T4IQ
	 dKt04QWvl7lEkOs81LweXTyTHjblBQw5XC937xZL2FN1yUlLFcY3LxhL/uzp0ImEDKCkT
	 bTcotj5R6MXrSosz2GZgDg+J0kAKET72HbbXPcUseL0KZjN6Yl/jRTiIGWZ92Gk4vl2jZ
	 j8n25KqLfpalPMCI3B5iVQpQdPuwksvWg3tfDq0wWSd8eOchCRaQBJs4gA/S1CCk9sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkKQNEdg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC856608363A
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkKQNEdg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC7D1F00A17;
	Tue,  3 Nov 2026 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700830;
	bh=IV6dvBcBCfFQeJE98BpetpmrG1DisRtDM5QrzCUps6Y=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FkKQNEdgiPSC+xseVFtXhvVCqCB84jdfQu3lJ1yEjOpSyKh20Qo1mof98VV2szOxA
	 ZKVEJTM2bVpbba/pb24n4KLDDZQxzsNEblJ9JRcpaf4pvgbGlPXVIa0i0ep1DQCqz1
	 07hv3O4AOcrV7NbTWH6bgTT89pzf4IjYSZadJx/rkKtSBqJMEWSeHsX4T/lLzs+6CK
	 LLE5Q634STWmtnHVD1R6sy9bLKOclyKvSCSA9/ammsLi9/FX0er5fH8ipEoGIqyfCk
	 /racKPnUNiwIzHdMMFeCE02wMTBgRKTZ4RNUJp5mrICAJanDI6Aep/5hhT3Tboo03x
	 U4tmY3JiGBNAw==
Message-ID: <sashiko-outbox-195018@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/10] soundwire: stream: Clean up allocated runtime
 resources on config failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261103095445.81414-5-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-5-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:13:50 +0000
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
- [Medium] soundwire: stream: unrolled stream params on error in sdw_stream=
_add_slave()
--

commit 7c1be891cc3e3787d68318b2ed777a711e4d3fa4
Author: Lee Jones <lee@kernel.org>

soundwire: stream: Clean up allocated runtime resources on config failure

This commit updates sdw_stream_add_master(), sdw_stream_add_slave(), and
sdw_slave_port_alloc() in drivers/soundwire/stream.c to release newly
allocated port and runtime structures when stream or port configuration
fails.

> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index db62a68c09f84..e3cdd36be1a1f 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c

[ ... ]

> @@ -2198,24 +2212,26 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  		ret =3D sdw_slave_port_alloc(slave, s_rt, num_ports);
>  		if (ret)
>  			goto alloc_error;
> +
> +		alloc_slave_port =3D true;
>  	}
> =20
>  	ret =3D  sdw_master_rt_config(m_rt, stream_config);
>  	if (ret)
> -		goto unlock;
> +		goto alloc_error;
> =20
>  	ret =3D sdw_slave_rt_config(s_rt, stream_config);
>  	if (ret)
> -		goto unlock;
> +		goto alloc_error;
> =20
>  	ret =3D sdw_config_stream(&slave->dev, stream, stream_config, true);
>  	if (ret)
> -		goto unlock;
> +		goto alloc_error;
> =20
>  	ret =3D sdw_slave_port_config(slave, s_rt, port_config,
>  				    stream->type =3D=3D SDW_STREAM_BPT);
>  	if (ret)
> -		goto unlock;
> +		goto alloc_error;
> =20
>  	/*
>  	 * Change stream state to CONFIGURED on first Slave add.
> @@ -2232,6 +2248,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  	 * is intentional, the 'master_rt_free' will call sdw_slave_rt_free()
>  	 * internally.
>  	 */
> +	if (alloc_slave_port)
> +		sdw_slave_port_free(slave, stream);
>  	if (alloc_master_rt)
>  		sdw_master_rt_free(m_rt, stream);
>  	else if (alloc_slave_rt)

[Severity: Medium]
If sdw_slave_port_config() fails in sdw_stream_add_slave() (for example,
when sdw_slave_port_is_valid_range() or sdw_get_slave_dpn_prop() returns
-EINVAL, or when port_config[i].num is non-zero on a BPT stream), does
jumping to alloc_error leave stream->params and any pre-existing m_rt or
s_rt modified?

Before sdw_slave_port_config() runs, sdw_config_stream() in
drivers/soundwire/stream.c has already updated the stream parameters:

	stream->type =3D stream_config->type;
	stream->params.rate =3D stream_config->frame_rate;
	stream->params.bps =3D stream_config->bps;

	/* TODO: Update this check during Device-device support */
	if (is_slave)
		stream->params.ch_count +=3D stream_config->ch_count;

And sdw_master_rt_config() and sdw_slave_rt_config() have already updated
ch_count and direction on m_rt and s_rt.

When sdw_slave_port_config() fails and jumps to alloc_error, the newly
allocated ports and runtime structures are freed so the slave is no longer
attached to the stream, but stream->params.ch_count remains incremented by
stream_config->ch_count and stream->params.rate, stream->params.bps, and
stream->type remain set to the failed configuration. Could
sdw_slave_port_config() (or its validation checks) be performed before
mutating stream->params, m_rt, and s_rt, or should those state changes be
rolled back under alloc_error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103095445.8141=
4-1-lee@kernel.org?part=3D4
