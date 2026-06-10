Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5240B374;
	Wed, 10 Jun 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098436; cv=none; b=fhdSpfiA/ITmksYCklmBoTtP4jSXGSqZDH1YgT1033+J7WhvWffXncR3Ua0UvpW+4iOFerAtVqIq+WBQ2vcJJpzlxFDH+DIZEKQI5mQVGKUiXsbD8rMsQiXhRAtkS9+AMzf/1Um++kBYOeQmIlMFi0In9sNNdSWPH2suZzp7m+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098436; c=relaxed/simple;
	bh=YO4D9bY1nnQAvoprGsTD6BI0BMassdrHAmyuSVwgENM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T02iKovXrAOPgiT8PJc7/I//+U9QZrQMwP19wGCds+7i97ieGe4+eLTvdUy51hXA3RoOCCSihIioRBlbzIXcixrNojjDSGe8JwgCSUFXLZMeiCr5/bLZpx54DZGxFTZdbky3nUr9l3luKCho4h/TyfxWdRD4USH5DnnD/q/A7SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF5ByOWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF5ByOWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6831F00898;
	Wed, 10 Jun 2026 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098428;
	bh=36QV/qY8hBv7JfTejMs0VL9odk6duyGi82ooLH77zS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mF5ByOWPNotXagrLyGn+Hqot2f6xIyyjQKjo0M/HzhLLgoRDz6AkYwXZm6cMcXq0B
	 dxdOG82yODEUTUzIfiqwOOYuVbSkDrBeoOxmTPfhdvSpKgThi8BCvZ2gOBDoqR6aow
	 BPJv8yFmhLlu6L8YkCUDcA9JAPi9U6mgvPxicPZBmHIKjn+fqIGaeXzJL3atUJZFY1
	 1I1VFaT5gU2SQd89DjAbMFIwq3Xop6ZuoR6dNxyjntoq/BMnmqKLZ4Iq245H1J4D7N
	 uO5aAiBIm9P/EBXMyjdTBW0dNNC7SgE78u7CRUQRi04FUL2wMGRLylMf7SemTAmTIm
	 y/aRq7Tv7+dIA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B3A561AC56C5; Wed, 10 Jun 2026 14:33:45 +0100 (BST)
Date: Wed, 10 Jun 2026 14:33:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-ID: <ailnuUp8r6Xy_Na-@sirena.co.uk>
References: <20260602020132.4170127-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyO8NS34AwNjI6QE"
Content-Disposition: inline
In-Reply-To: <20260602020132.4170127-1-lijun01@kylinos.cn>
X-Cookie: Leave no stone unturned.


--cyO8NS34AwNjI6QE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 10:01:32AM +0800, Li Jun wrote:
> The "invalid position" error occurred when the DMA position descriptor
> returned an invalid address value (e.g., pos =3D -1048838144). This happe=
ned

> +	if (addr < runtime->dma_addr ||
> +	    addr > runtime->dma_addr + runtime->dma_bytes) {
> +		dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
>  		x =3D 0;

This breaks the x86 allmodconfig build:

In file included from /build/stage/linux/include/linux/device.h:15,
                 from /build/stage/linux/include/linux/pm_runtime.h:11,
                 from /build/stage/linux/sound/soc/loongson/loongson_dma.c:=
12:
/build/stage/linux/sound/soc/loongson/loongson_dma.c: In function =E2=80=98=
loongson_pcm_
pointer=E2=80=99:
/build/stage/linux/sound/soc/loongson/loongson_dma.c:213:31: error: format =
=E2=80=98%x=E2=80=99=20
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98u64=E2=80=99 {aka =E2=80=98lon
g long unsigned int=E2=80=99} [-Werror=3Dformat=3D]
  213 |                 dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/linux/dev_printk.h:110:30: note: in definition o=
f mac
ro =E2=80=98dev_printk_index_wrap=E2=80=99
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                              ^~~
/build/stage/linux/include/linux/dev_printk.h:156:61: note: in expansion of=
 macro =E2=80=98dev_fmt=E2=80=99
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt=
(fmt), ##__VA_ARGS__)
      |                                                             ^~~~~~~
/build/stage/linux/sound/soc/loongson/loongson_dma.c:213:17: note: in expan=
sion of macro =E2=80=98dev_warn=E2=80=99
  213 |                 dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
      |                 ^~~~~~~~
/build/stage/linux/sound/soc/loongson/loongson_dma.c:213:53: note: format s=
tring is defined here
  213 |                 dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
      |                                                    ~^
      |                                                     |
      |                                                     unsigned int
      |                                                    %llx
cc1: all warnings being treated as errors


--cyO8NS34AwNjI6QE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopZ7gACgkQJNaLcl1U
h9DoLgf/WzEkKXMf6uvbGsG3RHhqwizd4b96tTq7+mfr4o8U0Jz7LTFcQaKftqcn
WkENH8R5+u7T4UhzClUDdJ0tDC5LcN2AOVrLO+hiB77fP8wIsZtVCkXFNUr8Sswv
4+9PT03DCuxTVOsRZZzRb1bSqMo3D1kythfB7TjyAsNc1Zmm2FcHh/svJmimTyVl
NjdbKkclzOUCsPN4B0uNdVuDOWvZgZOy0uaniph4XKuIwj+Fo0OCzBFTUnZVeEIh
PoAt3JWbQbcDsTzAvCHTTAHGCS6KZlqnSawc48W4JvwemkRUGj8PAu6VLe3f1D7k
EbiTviWoVWdCxBpSnAO5mEndNNbv/g==
=jjad
-----END PGP SIGNATURE-----

--cyO8NS34AwNjI6QE--
