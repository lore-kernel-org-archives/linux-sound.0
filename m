Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556078;
	b=XeEa57ba1lws2mfpH4huiueI8AGCzd1hzPtpHp5L0j0bKhLprqbEwLpvAfSEgCRg5vHU
	 MoZbbaXz0x/ju/lqkCVBNe1Jhsg1iOdJUM8/fW0hGPwSP2XZ0B2Eia5FClJTWaVlqDE1o
	 90L8LwZSA7tVy/hp7NbGgfYFEESDoIfoY/ZX9Z+sH3TMQu2+TvwVOgdiAfjra1Mlq9QT6
	 IjTiTupMrc98SHDP1vrZxvTQ3s2Q/T+fUj4n7WnSQrKaPo8bqk2h55F0DGUx+AsW0UDv2
	 z7DYsj1MRRbovEVggN6uBVsd3wHuBtc9dlMKCZHsLjeQZT9e/DOJMPKemIEaq7wxwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556078;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+/84bITGj+JUiUFPsSmG7y08WwAvFu14NdnQ12XgHIw=;
	b=LflC+6NBJvNdIBejainoJ7H7WO4u/NJpw6xvxJ1jBJ/DFjTGaVPV2+CUo1P7nXHUq4gF
	 aS+01Ur1F8tvbkBIct6lHLHJwruN4PUoDtMF7PdhZnQt4xM+LimBIXiOywJpZBxVhZbFU
	 yaodp0c53zPYYBsuf5oF6ghZfrB+Q6Qi812/Z3PZ9xhRCBiwitOvvQl+6cPX+1xz78Vo5
	 gobTictYtWDABcJITwgpAU6IvOaQD8/dmF5L0wb2pz5cVqdDw5imCDd94b9SwocdLhWqe
	 CG3jCeJvuthvgQ6hSLBpYVbxnBDICdmB9Lbq6hpKAMP11T4ojlM48Pf/HglmYUxi3ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lza4FOef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B838606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 18:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lza4FOef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68831F000C1;
	Sun,  1 Nov 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793556077;
	bh=+/84bITGj+JUiUFPsSmG7y08WwAvFu14NdnQ12XgHIw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Lza4FOefJdn21MfrR9Q2h/cC6aPXH+YZLMLP/gdnOFjOxYyFNpBz9CWbCkaW9zdxw
	 1dQaeAnrI17fecmbZiEdGN5lgaaxBdgpGA5XYkRPIwPi3TMogKMkOT8mZ9gdziNA//
	 AcgYne7lwlmPZB/gPzrmt7gjlVwNDCeGl9nIAToh3RECbkYqOCQY2g9KgORaIeTOTu
	 ftbkrIWSsI6u7E9opVXdPE2TxmojDF5+scGNcdsHMgw0KnPGKhhWHHBHcPOtYF/41d
	 RRgJAlGwHMoR1n6GIAPjv+NnB2VGiB+ifKEJ3ap4q94exK5NXlYLX3Gdar/HRy0tzW
	 rFjsSPdyO8nOA==
Message-ID: <sashiko-outbox-192554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soc: qcom: apr: Reject packets with header size larger
 than packet size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 18:01:17 +0000
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
- [High] soc: qcom: apr: uninitialized resp.payload when pkt_size equals hd=
r_size
--

commit 2669ea074a5a71b19b685f8644fc4fa968102cc7
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

soc: qcom: apr: Reject packets with header size larger than packet size

This commit adds checks in apr_do_rx_callback() and gpr_do_rx_callback() to
reject incoming APR and GPR packets whose header size exceeds the packet si=
ze,
preventing a negative resp.payload_size and an uninitialized resp.payload
stack pointer.

> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index 2d5645ff99197..6f29b57aaecce 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -210,7 +210,8 @@ static int apr_do_rx_callback(struct packet_router *a=
pr, struct apr_rx_buf *abuf
>  		return -EINVAL;
>  	}
> =20
> -	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size !=3D len) {
> +	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size !=3D len ||
> +	    hdr->pkt_size < hdr_size) {
>  		dev_err(apr->dev, "APR: Wrong packet size\n");
>  		return -EINVAL;
>  	}
> @@ -280,7 +281,8 @@ static int gpr_do_rx_callback(struct packet_router *g=
pr, struct apr_rx_buf *abuf
>  		return -EINVAL;
>  	}
> =20
> -	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size !=3D len)=
 {
> +	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size !=3D len =
||
> +	    hdr->pkt_size < hdr_size * 4) {
>  		dev_err(gpr->dev, "GPR: Wrong packet size\n");
>  		return -EINVAL;
>  	}

[Severity: High]
What happens when a packet with optional header words has hdr->pkt_size equ=
al
to hdr_size (in apr_do_rx_callback()) or hdr_size * 4 (in
gpr_do_rx_callback())?

In apr_callback(), packets with len > APR_HDR_SIZE are accepted, so a packet
with optional header words and no payload (for example, len =3D=3D 24 and a
24-byte header) passes both apr_callback() and these new < checks.

In both apr_do_rx_callback() and gpr_do_rx_callback(), resp is declared on =
the
stack without initialization, and resp.payload_size evaluates to 0:

	resp.hdr =3D *hdr;
	resp.payload_size =3D hdr->pkt_size - hdr_size;

	if (resp.payload_size > 0)
		resp.payload =3D buf + hdr_size;

	adrv->callback(adev, &resp);

Because resp.payload is only assigned when resp.payload_size > 0, resp.payl=
oad
is still left uninitialized on the stack and passed to the service callbacks
(such as q6core_callback(), q6asm_srvc_callback(), graph_callback(), and
apm_callback()), which dereference data->payload without checking
data->payload_size.

Should these checks use <=3D (hdr->pkt_size <=3D hdr_size and
hdr->pkt_size <=3D hdr_size * 4, matching len <=3D APR_HDR_SIZE in
apr_callback()), or should resp.payload be initialized to NULL if zero-leng=
th
payloads are valid?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101175407.1107=
80-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
