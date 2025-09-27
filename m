Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6927380A
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758974350; cv=none; b=K+K3lLHuiUO6bdtqtBlJb8mJq8lYSY7G6LKYDONbjeuZcEbM/HZHCwxJLZGOMgLVI5K5XcKg1k8zeDYQ+456JS2w/YNpLsP45y5sRbf8MQ3D9RDJ0XAVv9hCgBzfj3OpPcjJGpQIvNAZCTqQnuY41aR3IuBEkwCZVfObf8rDlok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758974350; c=relaxed/simple;
	bh=Q1G3ufsLPzjHcfqxuhYUtyzb6mkBeQ58SzLq4Ks7+fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U122Jb1alTDYhL6mivlT5zLOJAYH5Rb8eJc+VWPN4k816Yr2RAUwMfb3FA9BbcaUMdpdvl0lehUDnuqw0SYHRzuV88OwR8HhyvomZ/rZe+e/6xJ6WcaKHTPC26/1rcXRFd/MSiblCL0kNNHK0NlewCden8CyaNvMnAx9Lsn16Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIjw4lh/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIjw4lh/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eed7bdfeeso23581135ad.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758974348; x=1759579148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PijOBnBE5pXeLnRzXQWQH7HqbwlFYRqNkz2VA+MNSBM=;
        b=GIjw4lh/98Wd709/MhxQib8sLy9zbxI/gORwTU4Ox+QJmTYqhmzmVCpHrjOJbVGeBE
         nlIvxfz4BeajpkRPXw5x4uNl3o9PT3iAyhzNf6urK3/E8xFuFDEmUzbMsFu0PRttF1uN
         c/FFK+zyUPKx9jhuynJEgJfNa5c42RY972qh61BsIk3sPGgXk4USEOPM3YsCiHngYcYP
         lLs4H6Sl6qxTl3FO+91nFmyTWPMMx/VtTCSUWFRS29p5xPQVqb7fJ9dbGcAzyBNoDcRO
         fOi/3WP6pciQOKtX44BjZKYPVTJ55ddxQVoEn7CNgNWn9V73NRu+jKQpK54r6g4iAEXN
         925A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758974348; x=1759579148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PijOBnBE5pXeLnRzXQWQH7HqbwlFYRqNkz2VA+MNSBM=;
        b=wgzIiv5Gj/9mAxxVkKd4TsvHWYejzhp+Lxm60nUOBQa0N15fjOONy+POMqozn8OhBA
         nZVuWyc37Qetu8EP/nN7lARiNrbagz5n5YQAf+9DE70DI9fuKHNF2ggIEMH7+d/d021s
         Y2+0SbcWqTq+/P7uWNQd0536p3hCevKgchynsLhyP9t3hTp9XngJzxyFVqTm/5g9Ua+g
         l/W2mNY08tUGS8228ldMRB0nafxmeuPtqjWT1eGw2990dLUPXc3wdSXIQnE07ZN/crfd
         iFoA1hHYDkZU31sj2nxqz8UZ0KVXRuTYN7pmEbyEMuchSPWJxNhpJ2bi0i+y9Q97gOFE
         WshQ==
X-Forwarded-Encrypted: i=1; AJvYcCUef+rark/0a2gPi8ynXcmzBPQI80Xxz8PBszhNqxPsAQAco9pRktDaCGIJhZ6UIoUD0R3xyMOkts5YnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKY5l8Hz4qa9+cftsprR05zys3anSet7ZCQr6jrHZ6936uvuum
	mceqe9wiH0UGSsDGFq5MN3jk3+nrjcCiod16sYST7lnyXprJP2cr1BhK
X-Gm-Gg: ASbGnctSl/UD8mr65jnOrlUPl957dZcoRE0+NJ/r7JU0FTUUHPjdTuTYFU8gfkXhtNy
	hf0K0g3xilqUJWRaLN3ATCnJfouiqOwVmfC90lXT0kPpMWGuqRE1FsGTPIbx4mB3cKLRpvXRmhp
	QRtezMmXKPIDemD7pfsCgwsWX831OGToODQqp8//n1WUVzieeTKV3zjpOpQvKgUUuIfpxpXrK4a
	BGOchXZbh+t7LmQ5L6Lc8tSltGBdwm5Q9SPs9Va2+BSzJd6E2RNtwicP7931p7WLqPsleNbfJ9g
	L8Vf2WfN53aQHeDtV1wqWM0cXO43TeOU8fTXVrt6FpWHJNeixlErrvcDbQ28OiD/6bvhnLW0EKD
	ksPyk0l4vjJUF5K9nRDymCjMimQ==
X-Google-Smtp-Source: AGHT+IGdjsvu2VFOWhWF2FmWJyi+6tpoozd27mdQinEsI9lm3h9uunjFU+cpQiasI10JUUE7yFidOQ==
X-Received: by 2002:a17:903:2351:b0:24b:1585:6350 with SMTP id d9443c01a7336-27ed6bf072emr112191455ad.11.1758974348284;
        Sat, 27 Sep 2025 04:59:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3fcesm79872805ad.29.2025.09.27.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 04:59:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3BBE94244349; Sat, 27 Sep 2025 18:59:04 +0700 (WIB)
Date: Sat, 27 Sep 2025 18:59:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH] docs: sound: describe 'chan_map' member in snd_dec_opus
Message-ID: <aNfRhzjqs6Z2fi-n@archie.me>
References: <20250926162658.989479-1-kriish.sharma2006@gmail.com>
 <878qi0b97l.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B+9DhcFL+/ubECCd"
Content-Disposition: inline
In-Reply-To: <878qi0b97l.wl-tiwai@suse.de>


--B+9DhcFL+/ubECCd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 10:17:34AM +0200, Takashi Iwai wrote:
> On Fri, 26 Sep 2025 18:26:58 +0200,
> Kriish Sharma wrote:
> >=20
> > When building kernel docs, the following warning appeared:
> >=20
> >   WARNING: ./include/uapi/sound/compress_params.h:364 struct member 'ch=
an_map' not described in 'snd_dec_opus'
> >=20
> > The inline struct 'snd_dec_opus_ch_map' inside 'snd_dec_opus' was not p=
roperly documented.
> > This patch documents the 'chan_map' member and its fields (stream_count=
, coupled_count, channel_map), resolving the warning.
> >=20
> > Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
>=20
> Adding Alexey to Cc, as it was added by his patch.
>=20
> If any, please resubmit with a proper subject line (e.g. "ALSA:
> compress: ....") as well as the Fixes tag pointing to the affecting
> commit.

In this case, the Fixes: tag should be:

Fixes: 5d36370f3431 ("ALSA: compress: add raw opus codec define and opus de=
coder structs")

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--B+9DhcFL+/ubECCd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNfRfQAKCRD2uYlJVVFO
oz6WAP441DdFLVyi6XyfBHaTk0yfgsrCJqzp1izuhVPCZPS9hgEA+9pue04CjA55
TecMhupmUGb0LVIe0TYAGh9RDASzZgw=
=uLks
-----END PGP SIGNATURE-----

--B+9DhcFL+/ubECCd--
