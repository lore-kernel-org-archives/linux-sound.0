Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609249;
	b=dCH4/RQqaEiJahE+90Vb91Sb0rXvkEhhia6bAeIr8wiz5/lIYGK2BS3JJED5/lg3NYh5
	 5orP322rYnoAxOK850KdIXtrPv9Cp55xCtT2FWqegfasE9SRE0ueogc5YlMDTAmocT/gp
	 uLnI0NCgGNjLC74x++LsMb0Ex++x6X/RLD9r36NIhfNKtbhygc9jd/e0I64aB7RphKnoZ
	 TuixU2KO6t6tiveWm76v4dJ54um0j+bPpQdDjhv4LpXckzlDyN5zLFWF7GfYvDi/JEf/+
	 q1vGucWMmMbUq7lqvKX8G1YnJyv4iWQ3bhdFwJZDKudj62UzegWy3qDRq+ZUtykNnUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609249;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Mmjz141qc/phUthpKgixSA+rFfmz0FFbYgi8W0bRlA=;
	b=ebaAUddxXJpan7AqDLgBF8w/kbkth/uF+mXkoh1B4iafnnwlBO+Z7NbFKcC4FmdXN2m0
	 SK39cUeEoyRObPWq8Zn/HqNBiWPKxfeHBMF7CU/LmBzkWBaonBwJficR8OzxWqbkVMIGz
	 RdYyy+bOxeLi2x9u0lMbVBjn3IsxX2mv4pGcwBXO9RWlc4xu8cZ0jHWNs1kz+pBjvwODR
	 lOOl1XSzTiB7vhYbhYBkAocv+pn6EBN0hMdQYrmzPghRQ4VvCRepXgyLLJsXOZt4TG2b8
	 h3mo7YlqNz4gruSR6jRUWXhNIRtS+dv/qd1sYidirXzB22cHW6O8dgnCgXZOhLN5elA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YT6mvsHD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EB606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YT6mvsHD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6EC1F000CA;
	Wed, 25 Nov 2026 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609248;
	bh=3Mmjz141qc/phUthpKgixSA+rFfmz0FFbYgi8W0bRlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YT6mvsHDuAipsVciBcSeZskZZVUWjdABd+5VvzLT/pkoxupjg5yuCbv8PBinUxFPz
	 gqteWjjQGaG3FPJ7tsYAeNmY38cW33mTP53osFd5y5SdmTWtPKgxe/CFdbB3uZsCVX
	 7jHMyFAyy7zx9PplY8cYCHctEeHW9ub7Liz6RrQSr5B1Zp5YYAHurUjL1VSfJoHziY
	 T+Fiswid9fsye+4AsfuZlfcsOE+414Pi/4YokzecagVPGDouFHXI2KQzlEmsusQAxk
	 4q1bFwXTRj8HAAVqeu9a3qzvrPUttuc8MqT2t+zQor1ew08RpE5H1zh9/MFVQ0EIQ3
	 TJgy6OhODHTaA==
Message-ID: <sashiko-outbox-233354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ALSA: bebob: bound the stream format entries to the
 response length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maoyi Xie" <maoyixie.tju@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125121238.1602172-3-maoyixie.tju@gmail.com>
References: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
 <20261125121238.1602172-3-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:20:48 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: bebob: parse_stream_formation() reads buf[0..2] before
  checking len
--

commit e6e7f1e1f29ad5a2012df4b6e2f6ca27670bc0c9
Author: Maoyi Xie <maoyixie.tju@gmail.com>

ALSA: bebob: bound the stream format entries to the response length

This commit checks in parse_stream_formation() that the stream format
entries described by buf[4] fit within the response length len, returning
-EIO otherwise.

> diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/b=
ebob_stream.c
> index 5850357cb3dad..8eceafc70a447 100644
> --- a/sound/firewire/bebob/bebob_stream.c
> +++ b/sound/firewire/bebob/bebob_stream.c
> @@ -730,6 +730,10 @@ parse_stream_formation(u8 *buf, unsigned int len,
>  	if (i =3D=3D ARRAY_SIZE(bridgeco_freq_table))
>  		return -ENOSYS;
> =20
> +	/* The entries should be within the response. */
> +	if (len < 5 || len < 5 + buf[4] * 2)
> +		return -EIO;

[Severity: Medium]
Should the length check come at the start of parse_stream_formation(),
before reading buf[0], buf[1] and buf[2]?

avc_bridgeco_get_plug_strm_fmt() accepts FCP responses of 12 bytes or
more, shifts err - 11 bytes to the front of buf, and sets *len =3D err - 11.
When len is 1..4, parse_stream_formation() reads buf[0..2] past the
len-byte response (hitting leftover request bytes in buf when len <=3D 2)
and can return -ENOSYS before reaching the len < 5 check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125121238.1602=
172-1-maoyixie.tju@gmail.com?part=3D2
