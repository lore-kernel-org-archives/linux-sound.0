Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790169;
	b=JJq7sP1yXINu9vKPa3tmSaG1deX2vFZMtMGkOzMKMEKlEYQOl09l+/MVFVi8wioq0jMz
	 1sM3Coh/O/kTYZrC4XhYqMLMztXYce+gxHpNEdRpQs7ifazfe7PfAWyDdA1Jq1qwT4U7u
	 C95+nHKngcwJAbuSENstBkqh9MJBk8Ro47me4itBZ2RagDOF8w3CESbT/VCI+rourbqJO
	 EyDjm242nILi1kDg2bYMpLw5Fw316tI4i5sP3PudTwE60pT3BQBb/5LgSja0D9cSjyP2E
	 M2osFkl9GObj7VlciRdz9SOTVJorC0GD9bMNUD14MdLYzu4dULO6FygEX1MxDBwdBaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZRHqIekbDu1lx7ajAhsLM6Au52Hm3H9/zVtEt4181EU=;
	b=tCgpvGMHfAiNlRs2DBMoWE9h8CSub4DDpK0QRvOV9Urc6ikHBmuV9a6YvsIQMvlEGalX
	 8gZt8FF4AEweyHHBFgnoCXvf7LLkT4njwF7THVxpt+C33p8u37pRIb3Jdu5pLQsnvkv6a
	 PDriguCEcfnDjHKsBajVHWLG24qc+DE8NXy5BwWd4DVqkIDv8HOFSiAaWnwxrNH3phLxR
	 msgR/mKzTa1AjUT8aP0KojyuI5M5roixsCIr6uCzfBOnE6z80SRwhr8chGWCpR0Vp4YW/
	 FD7L7D/JsFrPO5FpDtYYbkmXkLdk6nRz/JPAb+WjEZQczPwbmrHyhA05gwj9YGr32YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx6zT0Wd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF3606A33E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx6zT0Wd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74031F000C1;
	Wed,  4 Nov 2026 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790168;
	bh=ZRHqIekbDu1lx7ajAhsLM6Au52Hm3H9/zVtEt4181EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gx6zT0WdKshRT0qorkXakz8TDGhfU9nFyZWIeNnqOV0nPCS8w0YT2+bHrkO3qRYhy
	 mbq/VXzbgdrjiL9uEzbT1doRtQ2gFGLBucByabutVgRt/kwjvp5WiIqO3s9Bdky5Rt
	 +vxS8aCxr32TeuObl+SEZgwxKEWh789wzHvXj1XpeejGWrPtORHSVgXyhK/bRVEi0d
	 owAERs+6tfeP8R1B7L74XpxRHDXGJoid27wm9FLQ6+mPQiPJxWLplOxvG6BGZj3luZ
	 /22LhJ6FGXIjrt8ksmn05YIq9hrHpluc+n6dxXMyZV6mA61S7Ufvn3h68al/DSYVZy
	 2IurbIV2B+r/g==
Message-ID: <sashiko-outbox-197138@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ALSA: usx2y: Guard the playback copy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sinan Turunc" <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104105228.1124-3-enscrpt@pm.me>
References: <20261104105228.1124-1-enscrpt@pm.me>
 <20261104105228.1124-3-enscrpt@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:02:48 +0000
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
- [High] ALSA: usx2y: incomplete packet length validation in usx2y_urb_play=
_prepare()
--

commit 8f4cd6a52f3d49a81dfc6755062eeb7276e1ee4b
Author: Sinan Turunc <enscrpt@pm.me>

ALSA: usx2y: Guard the playback copy

This commit adds bounds checks in usx2y_urb_play_prepare() to verify that e=
ach
packet fits within the playback endpoint's maxpacksize and that the total U=
RB
frame count does not exceed the ring buffer size, returning -EPIPE on a
violation.

> diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yau=
dio.c
> index ee224b4dfb046..5f241d454012f 100644
> --- a/sound/usb/usx2y/usbusx2yaudio.c
> +++ b/sound/usb/usx2y/usbusx2yaudio.c
> @@ -112,7 +112,8 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_su=
bstream *subs,
>  		/* calculate the size of a packet */
>  		counts =3D cap_urb->iso_frame_desc[pack].actual_length / usx2y->stride;
>  		count +=3D counts;
> -		if (counts < 43 || counts > 50) {
> +		if (counts < 43 || counts > 50 ||
> +		    counts * usx2y->stride > subs->maxpacksize) {
>  			dev_err(&usx2y->dev->dev, "%s: should not be here with counts=3D%i\n",
>  				__func__, counts);
>  			return -EPIPE;
> @@ -125,6 +126,16 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_s=
ubstream *subs,
>  		urb->iso_frame_desc[pack].length =3D cap_urb->iso_frame_desc[pack].act=
ual_length;

[Severity: High]
What happens in usx2y_urb_play_prepare() in sound/usb/usx2y/usbusx2yaudio.c
when i_usx2y_urb_complete() -> usx2y_usbframe_complete() ->
usx2y_urb_play_prepare() -> usx2y_urb_submit() processes a capture URB whose
cap_urb->iso_frame_desc[pack].actual_length is not a multiple of
usx2y->stride?

Because counts is computed via truncating integer division:

	counts =3D cap_urb->iso_frame_desc[pack].actual_length / usx2y->stride;

any remainder actual_length % usx2y->stride is discarded from counts, and t=
he
new guard only checks the truncated byte count counts * usx2y->stride again=
st
subs->maxpacksize. However, the playback ISO descriptor offsets and lengths
are still populated from the untruncated actual_length:

	urb->iso_frame_desc[pack].offset =3D pack ?
		urb->iso_frame_desc[pack - 1].offset +
		urb->iso_frame_desc[pack - 1].length :
		0;
	urb->iso_frame_desc[pack].length =3D cap_urb->iso_frame_desc[pack].actual_=
length;

Meanwhile, the ring-buffer wrap check, the memcpy() into subs->tmpbuf, the
non-wrapping pointer slice into runtime->dma_area, and
urb->transfer_buffer_length all account for only count * usx2y->stride byte=
s:

		} else {
			/* set the buffer pointer */
			urb->transfer_buffer =3D runtime->dma_area + subs->hwptr * usx2y->stride;
			subs->hwptr +=3D count;
			if (subs->hwptr >=3D runtime->buffer_size)
				subs->hwptr -=3D runtime->buffer_size;
		}
	} else {
		urb->transfer_buffer =3D subs->tmpbuf;
	}
	urb->transfer_buffer_length =3D count * usx2y->stride;

If actual_length has a non-zero remainder modulo usx2y->stride, can this st=
ill
read past the end of subs->tmpbuf or runtime->dma_area? For example:

1. When counts * usx2y->stride =3D=3D subs->maxpacksize and actual_length h=
as
   trailing remainder bytes (such as stride =3D 4, subs->maxpacksize =3D 20=
0, and
   actual_length =3D 203, giving counts =3D 50), counts * usx2y->stride >
   subs->maxpacksize does not trigger, so urb->iso_frame_desc[pack].length
   (203) exceeds subs->maxpacksize (200) and the cumulative ISO descriptors
   across nr_of_packs() packets exceed the subs->tmpbuf allocation of
   nr_of_packs() * subs->maxpacksize.

2. Even when actual_length <=3D subs->maxpacksize (such as stride =3D 4,
   subs->maxpacksize =3D 200, and actual_length =3D 195, giving counts =3D =
48 and
   counts * stride =3D 192), the ISO descriptors in urb->iso_frame_desc[] s=
pan
   more bytes than urb->transfer_buffer_length. When subs->hwptr + count =
=3D=3D
   runtime->buffer_size in the non-wrapping branch, only count * usx2y->str=
ide
   bytes remain before the end of runtime->dma_area, so the ISO descriptors
   extend past the end of runtime->dma_area.

Should usx2y_urb_play_prepare() either size urb->iso_frame_desc[pack].length
as counts * usx2y->stride or reject packets where actual_length is not alig=
ned
to usx2y->stride?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104105228.1124=
-1-enscrpt@pm.me?part=3D2
