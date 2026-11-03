Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701616;
	b=l7pie6V49rYuzcGNbdYKuxreP6wKtfDNATBdGEAb8cmVY29VDGQ3VCpV3AQ8b8f4keYk
	 eyVjCfsDAbfTCIvU9vQzPD6+IiU3e2Rjf/duSeMD87DaDyxrwWAumGpdtfCQwYDm01qMb
	 sWlCieZASm7EQ7LdUpqOrLnUM3L+/0ySr2rUn3X4IXF7ka4PsGfWRF3aN/fUMpD/r6Ryj
	 DBXrWGRvOnm240o1T+LzMkPFwvdFbBrPstLke9M//EgQs6FK+wSPNcknPhPtOQ+QqLdAk
	 naRsMuEdPh8n3Wfh5FGAZqa8sryBiwOOhrBDFiF2rMSEt384Ko2LmvOndL8TfVRphNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701616;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7R6UTYUH52b8ElIxclfIaVb/K+pm7uw8plJWc2CMcm8=;
	b=SJvCFc1esKp3V3QNLzHupmgw1AW8GOVid3gWM/4L41noENkY7XpZLbZp5HW1QoCz4ple
	 QGszT/XuYgnE6UqbqvQ9iriBX6QDlRfm/8WAMlyaL6gxJwRxiGW+iFQqjwx9vSSBI2Epq
	 sKFz4fyQi+Rob314eZ2VVEwRNjXD1Zb3HKp+snO49WhnkwN0YUD8JEmtT11w+OCQX3NrN
	 v/cLFseU3hE8/q/lY4zrP8TlbyMJcNmcS7hjXwUIEjVdWBI7of9XCOKmEAHCI+Wp/f5VH
	 qa9NxV6Us0++n7KW2zmZ7ZdpBvD3VHZTAUbj7gvXYv60Ys9UN0+n8Lff3qigLctR5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwqCsJEh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61D606C586
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwqCsJEh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BC41F000C1;
	Tue,  3 Nov 2026 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701615;
	bh=7R6UTYUH52b8ElIxclfIaVb/K+pm7uw8plJWc2CMcm8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=AwqCsJEhws4lbyUxaYyOXUjWJLqH1ZuA9Ljr3DfimOL0eesElEvxBvpdD6fdXGMAl
	 +TcSQCLFRg/NeDZFEXfIm2zoqDckPu8q7ymTrD2JqgLGCeQQQjdQkMqe3nAdF4sNbu
	 L4c8vqoflFIvhAzjjtahfW4sOBm0+0TYFjb7fUZeOE8z3qumWJuNPy6CW2cV6Y1+oJ
	 7l7CKk+0wYKP4+7Cmtkrbd97fKNHZhYHWBxuHFOHjIo0iERmkV99q5HWsW7hPtVYdK
	 PdxGg/ggUmdgJdTAfqIeVYMYXcTX4ec3hSI0Yf/BZsbkoPoTs5sqEADu6puY5rGyIS
	 6OvIQ5ZzFa0Jg==
Message-ID: <sashiko-outbox-195045@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] soundwire: qcom: Prevent pconfig buffer
 overflow in qcom_swrm_stream_alloc_ports()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261103095445.81414-7-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-7-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:26:55 +0000
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
- [Medium] soundwire: qcom: qcom_swrm_stream_alloc_ports() rollback clears =
active ports
--

commit ff22f63970718cc2818a7a2729f4f9674b452688
Author: Lee Jones <lee@kernel.org>

soundwire: qcom: Prevent pconfig buffer overflow in qcom_swrm_stream_alloc_=
ports()

This commit bounds-checks nports against maxport before writing to
pconfig[nports] in qcom_swrm_stream_alloc_ports(), and clears pconfig[].num
bits from port_mask on error.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10efad..29130745c8097 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1350,8 +1350,10 @@ static int qcom_swrm_stream_alloc_ports(struct qco=
m_swrm_ctrl *ctrl,
>  				else
>  					pn =3D find_first_zero_bit(port_mask, maxport);
> =20
> -				if (pn >=3D maxport) {
> +				if (pn >=3D maxport || nports >=3D maxport) {
>  					dev_err(ctrl->dev, "All ports busy\n");
> +					while (nports--)
> +						clear_bit(pconfig[nports].num, port_mask);
>  					return -EBUSY;
>  				}

[Severity: Medium]
Can this rollback loop clear bits in ctrl->port_mask that were already in u=
se
before qcom_swrm_stream_alloc_ports() was called?

When slave->m_port_map[p_rt->num] is non-zero, qcom_swrm_stream_alloc_ports=
()
assigns pn =3D m_port directly without checking whether bit pn was already =
set
in ctrl->port_mask:

drivers/soundwire/qcom.c:qcom_swrm_stream_alloc_ports() {
	...
	m_port =3D slave->m_port_map[p_rt->num];
	/* Port numbers start from 1 - 14*/
	if (m_port)
		pn =3D m_port;
	else
		pn =3D find_first_zero_bit(port_mask, maxport);
	...
	set_bit(pn, port_mask);
	pconfig[nports].num =3D pn;
}

Because ctrl->port_mask is shared across all DAIs on the controller (access=
ed
via qcom_swrm_hw_params() -> qcom_swrm_stream_alloc_ports()), bit m_port may
already be set by another active DAI stream or by an earlier slave port
sharing the same master port.

If a subsequent port in the loop hits the error condition (pn >=3D maxport =
||
nports >=3D maxport), the new while (nports--) loop unconditionally calls
clear_bit(pconfig[nports].num, port_mask), clearing that pre-existing bit in
ctrl->port_mask and allowing future find_first_zero_bit() calls to hand out=
 an
in-use master port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103095445.8141=
4-1-lee@kernel.org?part=3D6
