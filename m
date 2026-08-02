Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB237BE6E
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785705266; cv=pass; b=uaKPzVElBgwDU9viR2M8dQhwUb8pR2Dp6bLgDk4eV528wcqmc3456lgUojcg8z9vwtAEY/qzfSJ8nHIOq4dHf29jnlHVJzjNqtYMufXf0e6O2Ny166W/pT9C2kNIcqwZq1Nq0PCq3siIk+5rT80119UpsIebLJ8rVIsr4fROnVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785705266; c=relaxed/simple;
	bh=ClnXJw1IIDgTQaz4hKslq9Wh1GPTBlNs1n2LRp1eiEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFHtg2tVTC/Rp5j00bA+3Sf4aMEcS05An3exR1Y5W4TflzD3rr2prxppMzWeaDw0Y9K8wMoOTEVVRUMoGq13pcl4mkUet08uTBPBou9UvjdbS0iwrkbEYPjP9OKxiGSH7bsn3ItNsvS4r+C3QblesmeIYRpoY1nU8UFxKHuVVfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K54wkZm2; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K54wkZm2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so4001985a12.2
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 14:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785705253; cv=none;
        d=google.com; s=arc-20260327;
        b=q1/jAmYCqb9UJjv/WP0EMvEMM1rZKeIx7GOvQpbetB3217EhVBaJjXMAZ61OdLNv77
         Y8jyzqs2bEi9gLaNRiHmXRGJszQKoypxq4yJ8pTQHSUGPHjKvbXeCOGPD/UGiIwNrSON
         vSrJqk3DJXTjSka+svMxEZjqT3nP9VlJyIF+cqiD3EKGWbWBMlonlCexdkwk8OQmxJus
         n7x91J9AAXMC+zpdA8VnG8SYJrNrqVUTjDz+mndzZYdC28GR86TCl+l8Em5M4HPwjP3J
         uQnvEwg4cruS82u88eKRR9uwQkHiZvuU7RoZRBTDaXBKxysrP6FkepnprEO25ZX7p6Eb
         wdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nx9/5keTn5v/FJqZWNoc+rj0zkaqnFJoHQnxU9qEglI=;
        fh=gIUpj4FH2NyHqEcng2LlvBV67zIOcotmePzpSUZsCdM=;
        b=IW63fiuHt/3vHEc/OhN7fPrHEAWXHGhUyik6jlAkcyolKcEZjloddUaqMcM72Z3Rcz
         BDaqTJRZXXIkhxp43ZYx5Yq+MupCzP5BpRdtjWI19fw69efqv16ZaOvn+u03IVZu5H30
         evKe2IXPWIFnpd5hO6ELWftfhUWPN5mGQPXxBrEObFGS3BlNygHovVWUUJo1uzuiCSjt
         BJYY9qmpDnd6qYCoqS+rmQO6uUuzQF28wWOuHXYKNzUvPu31eEaU8vAx6KyN2GmJ9Aiy
         jcVzrY/3W51Ocs5bLmVJ3mYBimwBYtbuizr+ouU6zksqQBSeMIb34D3/6hgSJp2p6cgN
         cLuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785705253; x=1786310053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nx9/5keTn5v/FJqZWNoc+rj0zkaqnFJoHQnxU9qEglI=;
        b=K54wkZm2Ju1dtEpZ06qeIcxHrGx7RWH/bAkzua7vJ46py5MzgW/5Lp9qvM+h1sIcmv
         nu7wCsQb0q67uD34uN/YkoWdkzRMDuEAGoMzmTqu6Esb8ds2Cep4zrWiMF7+OlcaLHzb
         XEEeta66u9dx2aEt6VtH95CFRFKZKVYE7ds2sSfC6uykW+OUxbuwVFTfZ6BB6hgJZ8V+
         vUj7PA3rLwX9DwsC+4hp9tvSd4SckOZul7n3PGdAmDKeo9zg8MryIa93/s4/ijmEHP+Y
         Oc941BxE+4PFla+/OU4zoXC+cXu5U1HFMjy2lIWnxz+p6BJ9DZ4tL+PtfJF5B/Np+/bV
         Lvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785705253; x=1786310053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nx9/5keTn5v/FJqZWNoc+rj0zkaqnFJoHQnxU9qEglI=;
        b=GzjikfqAOr7oz5kFNAg4zv5HD2i/hs4fQTGudSPFlwJ8ZqsqDSYWWKYEm7IL4SHI/K
         /aLnE2OklFLb1ELWotPuy2pA71vmOO0MZUiTkflaan1n5DZxU6BJQqK+cGwRIjIFVMJ1
         Lhxcq1dlvKFowhVSon239yuIJlTwFwQL+phnlZrFUs436RLHPSUrGPTAVKwFiL2Le5ff
         JIheLRqLrtcjcYyL6v+uKMaBkR6iPbmSrK/uH/r9yhTC0Kw0TUWYPUiVJsCBOmxKsQHC
         w2P3iunglhhMklnrQYLVa37creFJbM+XXfmv3JfcVC0JLJxw53w/i1N5i7Qgjodu5f8c
         GbwA==
X-Forwarded-Encrypted: i=1; AHgh+RrTAsQSzbV5EO5vrejlD6JmooPXy1S7TbFyuDUdsJW8JzuxFCWVejrZwkAnIpgpwBHynX1ASc5swK80SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4Xg5xPKhGI8gh9qyPvJMgf9MY747fBvAPqMBbMCtQYt1W3SG
	yC9Q4ARLtf5L5WHouB77MBx+Dka7BbAG9prI0IFYtol8ob/mHpdOJo9ME3RN4i35fKdekScBLmy
	KOL+oaPuSxZXKTYTVYPx2wtG/azJv6cA=
X-Gm-Gg: AR+sD136mLnYm+Pm4D744UIApZqrwNGeGhmEyijNPtUYoWgBWV3DrfPpKv8LsCnUSsG
	H0adIjcXUaWBavQU6UJ0sq0hALZeXK6ArLzhdB5IKDFl63Lewh1poXv3XYgPOMe0q2V9Rl/XCfc
	AqnvvniOicvoNpTLy4Wq7LuVuioJtek+IB6PGfF6ccF3DRUB6xvADqoPFKnAqETwfrJcstjAO93
	SI5sUj/ToCAvu9yIpxNJ7kN0kDY675n684xrhea1W1TigAzNh3MsWNHcd1aHpW8Cz0BaXO+i7Gc
	Wagd2hGd4Zfz4lcrs8/u+d0muVrLK4dnwK8I+ZUYprWn5PjWZ3GQjiNQQaxM+ypvhYEGWQTs+LW
	46jXniXboTJlO34OKZ7yP9nLKKZ1LcxDn9W9M7r2bG9Rm5z9GjwYW+xeLUbJ6TVKlIyNF3ZNsf6
	jaIPhGQkEGM8mknzIIhO1y++Yh60SqGjKskUXn06zaskI+1WOMdvy6CII=
X-Received: by 2002:a05:6402:1f11:b0:6a0:f1d5:de8f with SMTP id
 4fb4d7f45d1cf-6a0f1d5df5emr1220029a12.14.1785705252904; Sun, 02 Aug 2026
 14:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802144855.3596995-1-julianbraha@gmail.com>
In-Reply-To: <20260802144855.3596995-1-julianbraha@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 2 Aug 2026 14:14:01 -0700
X-Gm-Features: AUfX_myOgpXKaj3ugPIYZrtPGZqW4GVxxbL5hXkt0FPYH6KwQHaTbc2VE8GM7rw
Message-ID: <CAKxU2N9HkStUEo+iTa6xc2BJGe6KE==vARDdHPEhRH9yKOMLuw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
To: Julian Braha <julianbraha@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	arnd@arndb.de, chancel.liu@nxp.com, jonsmirl@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 7:49=E2=80=AFAM Julian Braha <julianbraha@gmail.com>=
 wrote:
>
> SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA both select
> SND_SOC_MPC5200_AC97 without ensuring that its dependency on PPC_BESTCOMM=
 is
> met. This causes unmet dependencies such as:
>
> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
>   Depends on [n]: SOUND [=3Dm] && SND [=3Dm] && SND_SOC [=3Dm] && SND_POW=
ERPC_SOC [=3Dm] && PPC_BESTCOMM [=3Dn]
>   Selected by [m]:
>   - SND_MPC52xx_SOC_PCM030 [=3Dm] && SOUND [=3Dm] && SND [=3Dm] && SND_SO=
C [=3Dm] && SND_POWERPC_SOC [=3Dm] && PPC_MPC5200_SIMPLE [=3Dy]
>
> SND_MPC52xx_SOC_EFIKA also selects SND_SOC_STAC9766 without ensuring its
> dependency on SND_SOC_AC97_BUS is met.
>
> Let's resolve all 3 unmet dependencies by adding the dependencies on
> PPC_BESTCOMM where needed, and selecting SND_SOC_AC97_BUS as other, simil=
ar
> options in this subsystem do.
>
> These unmet dependency bugs were detected by kconfirm, a static analysis =
tool
> for Kconfig.
>
> Fixes: a9262c4fd404 ("ASoC: Support for AC97 on Phytec pmc030 base board.=
")
> Fixes: 6ffee43ecf8b ("ASoC: Fabric bindings for STAC9766 on the Efika")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  sound/soc/fsl/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> index 8ae59c094878..a5d7cf534391 100644
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
>
>  config SND_MPC52xx_SOC_PCM030
>         tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
> -       depends on PPC_MPC5200_SIMPLE
> +       depends on PPC_BESTCOMM
>         select SND_SOC_MPC5200_AC97
>         select SND_SOC_WM9712
>         help
> @@ -253,6 +253,8 @@ config SND_MPC52xx_SOC_PCM030
>  config SND_MPC52xx_SOC_EFIKA
>         tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
>         depends on PPC_EFIKA
> +       depends on PPC_BESTCOMM
does this really depend on PPC_BESTCOMM?
> +       select SND_SOC_AC97_BUS
>         select SND_SOC_MPC5200_AC97
>         select SND_SOC_STAC9766
>         help
> --
> 2.55.0
>
