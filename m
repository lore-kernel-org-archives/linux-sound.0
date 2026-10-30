Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358559;
	b=T31S86dYJYEyE8awlFQyC8tzrCTeZeMwwJ011tg5UdMwTxco28oCwKq/nmSKzJWSpZ1e
	 rbQXDi/uxdYgk8pnhDjGu22A2t1zi52AWVBAN0xBzpC77R/ZkBxX2zZV5Ex1TtXdehBZM
	 d5OriSaUnizpT1Zv0GkyBxbttqj8P8aTN6x07V8qWdgJ1Lll9+WOkhyd6k9J0fhlPy6sJ
	 2LUSX0UhGuj5aiaAmZ3FathfU2Xpfp7S/RWKoNP1gzD0G2YWeZLCo1tdyxYEHEp4Vqmxp
	 3izNhYjwuqSzs3ShezoQkDixfPlq0P/ecRZaPt4Sx1pzklhwEWLX5lBclzSLmpBg8TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358559;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3wOIxsCgfjBTTl6RJlTTqVTBo4zs7UsjLbBOjPNgf1Y=;
	b=ydjZkvvdYE3HYXq2qz1n6Ue1+pASzrP9CMsl8eacfdc4ayn4Qsl0cUTye7OErdBr3z6+
	 TW4FEuvrJ1OFkNgskMJU/Gzk7bNMjX2k3fb5CRc5B2WRJ+44dYfK9oSfh/+JxVf0mtmBL
	 T0HJ18iChHw2BgAs8anx1h6tC1PEHAi3yFfHzV/8JostHiEbtSs+IH4EvA5erEfjrQILU
	 8giZsJNunYbC+/dfA/Rvbcccfp28AeSXztdNZH5aKS3czX59BP6eQGUfuUa8DitrQFFPP
	 hS2zrydqqjHaJnqn7NKevUtysrwneYRh8Nxt7DntUi8pJ/++HTbREFRpWyRA/POlSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKPhyEJ6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720C606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKPhyEJ6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8B71F000C1;
	Fri, 30 Oct 2026 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358558;
	bh=3wOIxsCgfjBTTl6RJlTTqVTBo4zs7UsjLbBOjPNgf1Y=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=SKPhyEJ6h7F1m9UAqa8SU7BWTjs/9TtLzBOna24+kY241KUi6YwZptYq1linD/3NC
	 zUWW3YT0OycObUeh+yTkpwJcDm3cu8FP+S1hq8RU9e27Bp1UVhm5Brk+cU+Z9Ccsb6
	 J1GgLN4U3UbQZ3Ivv68inxnZqh8yXhPAIjKRggn/gP/Biv4du2M8oDGwTJg4xyiK4O
	 DiU51xAVRX3k3BTBFzVpC3dnB7hZYJe6PCwvEcTw0z4hXSXNa9Lrj8FV0UwUvuWETO
	 3d5F2lHSHB912KYIaC1gpHMdOPQYO7IS7m78hmptXHCoaHymjEQ3676BHsZLAxJjox
	 SpXxznk5E+8VA==
Message-ID: <sashiko-outbox-190922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/21] soundwire: stream: Prevent m_rt_count underflow
 in sdw_stream_remove_master()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261030104840.3361217-4-lee@kernel.org>
References: <20261030104840.3361217-1-lee@kernel.org>
 <20261030104840.3361217-4-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 11:09:17 +0000
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
- [Medium] soundwire: stream: m_rt_count leak in sdw_stream_remove_master()
--

commit 029ba42fadc93c4fc5794332114bf86183041b53
Author: Lee Jones <lee@kernel.org>

soundwire: stream: Prevent m_rt_count underflow in sdw_stream_remove_master=
()

This commit frees partially allocated master ports on allocation failure in
sdw_master_port_alloc() and gates the stream->m_rt_count decrement in
sdw_stream_remove_master() on sdw_master_port_allocated(m_rt).

> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 0b00fcdcab2d6..f225e5438ccfe 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c

[ ... ]

> @@ -2108,9 +2110,10 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
>  		if (m_rt->bus !=3D bus)
>  			continue;
> =20
> +		if (sdw_master_port_allocated(m_rt))
> +			stream->m_rt_count--;
>  		sdw_master_port_free(m_rt);
>  		sdw_master_rt_free(m_rt, stream);
> -		stream->m_rt_count--;

[Severity: Medium]
Can this leave stream->m_rt_count elevated when sdw_stream_add_master() is
called with num_ports =3D=3D 0?

In sdw_stream_add_master(), when !sdw_master_port_allocated(m_rt) is true,
sdw_master_port_alloc(m_rt, num_ports) is called:

drivers/soundwire/stream.c:sdw_stream_add_master() {
	...
	if (!sdw_master_port_allocated(m_rt)) {
		ret =3D sdw_master_port_alloc(m_rt, num_ports);
		if (ret)
			goto alloc_error;

		stream->m_rt_count++;
	}
	...
}

When num_ports =3D=3D 0 (for example via qcom_swrm_hw_params() ->
qcom_swrm_stream_alloc_ports() -> sdw_stream_add_master() when a codec DAI =
has
no active ports enabled), sdw_master_port_alloc() executes zero loop
iterations and returns 0 while leaving m_rt->port_list empty, and
sdw_stream_add_master() increments stream->m_rt_count.

When sdw_stream_remove_master() later tears down the master runtime,
sdw_master_port_allocated(m_rt) checks !list_empty(&m_rt->port_list), which=
 is
false because m_rt->port_list is empty. As a result, stream->m_rt_count is =
not
decremented before m_rt is freed, causing subsequent sdw_stream_add_master()
calls on single-link buses (!bus->multi_link) to fail with -EINVAL or
miscounting active master runtimes in do_bank_switch().

Could sdw_master_runtime track whether sdw_stream_add_master() incremented
m_rt_count, or should the num_ports =3D=3D 0 case be handled consistently b=
etween
sdw_stream_add_master() and sdw_stream_remove_master()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030104840.3361=
217-1-lee@kernel.org?part=3D3
