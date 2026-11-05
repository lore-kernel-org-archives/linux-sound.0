Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793847164;
	b=12mdRnS5V1aUgA4jVS0PittP2q0sxEmYuLq9EOwGw2a5AvbNSnKwnrnwYyAqhE4IBPdK
	 5IsdEmVonPp5AxdqE9sFU+eLIyBhHso20GhHgjz8xBdz4pH2amWNEaHB/GZdcZN5l8VWa
	 DmK2zSpHWJWYl4UnhZ+guP8e7LxDdbeIUwxmLlJubRG6j5/yEtEWV+ngmgDjbeVxWGWr5
	 tpAIPX2x8pHtTOO0+881Qa+Ya/IzA2zBTM4AMa66WVU02nMEKVu6ql9sB9G3QdJbxnUhU
	 UbXPAB5OlnHgp5f8sQNnYFjym832xXN9u6dNjGVp6JEAw4qLlwt4prbSRfDHP2fFFJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
	b=tXoT1tBQNpSUIs6PDewLs7P4glj0/tz//LMlbW7jxHI8W75kv+NpfmqHXzbaiQnOw4hy
	 kUYklSg5t8HG1lsMSNwZX1AniF+5XWyS4kReI9zLFrkI4/Hu0drIaAMLgB2yBZ9bLIT4J
	 4OcmSUtT4OFJaX9ALUs+FZHowzoMEl4kdMpxlvEiZVAkmOUiB+/Dag7gFYc52/bLDr/Bq
	 UePfE0HF7I36b6LEoMZVWsYB3qcrxacfAutT4lI4dK21MtZzHB3fndqKv96PvI4DBL3uD
	 5rWEiPSj+rEI4t9+C8K6Flv533bm+NNqzQLTl0NXb+eeatK+PJLeQprgm0CrWc5cPrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/TXZGXM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB1606A32E
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CCB1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/TXZGXM
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070781f63so696121b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793847163; cv=none;
        d=google.com; s=arc-20260327;
        b=I6qpZvW3fovbQZuOD/zOp/loGZ6zrPL8ze1VEijS3sCftTNo6dnwOLCOWTt60xF4xB
         8e+E2+OqH69KXma/a++Az5ebSfC+WGQVbrJXfeOslqmlLw32+sJK9ho2pRFqBv7+pHJb
         ieir7dQl2p4jf0ldSgniV/cHwg7m7wgH/G1Y3Q3turxgKsoKhxM2LsG96EbXygH09Iim
         Wq+YBgo5ULsGOCHmY5WWsHDYlCC8oCDT4BtSNuFzThYL/vbqS7N6VaUh4XdZCoETrUpI
         3TRQxaPsHsbnJXv4WN4/KtLF4H26mVqyBFCXKj5Ic2IejoXfmuitBMGZgfYES0zZxxjw
         Dneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        fh=+TIHDhrjaSSnZcTgPiFoLlD1VdtKxS3ItyK6Vw9jpVo=;
        b=akmZBvO9lRCmhAtfGhPD9hlMWTJdUBm+XmJnA7ANQvN8fFDyH548PHvlXqoC4bpQSz
         9QZQ7MCmUKFw3DnvR3ogjl5MvRPyAKsNk2NUJrzaaE/mCqEov99QCmKd7lETCABCpA+S
         CLOL9bQaM4st0gvIukHRC1CwDpaoa+nX+cJMFfCYokCdt1qBWmqALMxSoyT7Xtmg0qnp
         sTwpyzR95mwYRfpTcyYC8qMwIeg2elej46OFtoQCw//QtKjH98ps8UfO99eZ+3pe2kwt
         DBcxET1bRlfejjWPgGymeAzuK65T1DSccEY+JjRhZ8mGUhJC++hE7b5awIvQDMXhdFBk
         JvKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793847163; x=1794451963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=E/TXZGXMs0ddnoycXEPfkciCd++/kQrtcqkb17sG6C6fNDXLfGT9kLH+MOcHUv3laz
         CeiUBZCtnDAIRzyVvPtVaKqp3kg0n/vja0FdB+NTz0FyNLuuWb881TIHXxQrfn5secKO
         YDjjiT1F3r10+gFgILymw6ftBJTHN3Go0oNs21rgUADPvrQKzLsOfkMoSlc5P7JP9Njo
         VGKLkwtNbxTfC8m31JyIcJJYDa5uxSvqhAbvVEAI7nYdEkef2r6/86wzx2pCwamhjkmA
         FUDTOl8UvX10YnMe2Rn+GsZgdpWrOqMB82N+dN9XZMYhZmiZg0RXlk9lxofT7Czr8Kg3
         sbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847163; x=1794451963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=weF+7Xjsn9/HcHTIEUoD8Z7JeihaaNEVx9MkGizUavCWLHFqCkIg/Mm+jPKlRaaUlI
         jpIUgpxIogzIvlKDlIoNdxG4JjhxJXQ7QX6di87/j0JtiC7UZ6n+DvnmEFzQkrSxygdZ
         8SvhQcHLCKoA62BeMbKcz3yUYoV4eeLEp43ntHxpjtdePWim1JgzqW5QLyd4DwV8rMV9
         l6/OzTEzFAaiyFUddV441m+ALJkxR4Muf9Kza1dehFfxH9NIiDdoozOJqwjeRhYawcFN
         ltuA7k/sElCHscHRg2xvivRbN2jJeyZFYOG9kAcx9JK9qg0sAJeE2rbr4+xlLYszkd2Q
         2s4g==
X-Forwarded-Encrypted: i=1; AKwUvBwzlTqtOiGFwOfzW3w0JAQNIQZpHv5WnInZawUTStFc49PLktpHvJWFTwcScLGixtzsT/PeL8IqwRnq7Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dOiSgnRkHznZPuHllL30povDlcpDox+1fsh61NoYJM6fYYGEG
	QkSpOsCls3R0I+L8ZJ4glk1Sm3fM5e8D7a3TVumCz5ns7cKxPSv+JKqUkMo9UhTdv6T4IdNh0rS
	/rrvXUnD4/AeXPgvV5/+rmUWLgOzAqBI=
X-Gm-Gg: AYBFou1Thq28AaVeEBRYA7QXlT+kIhUrl1rGgNFuimx0ff/8qkIgAERkIJDILvDBRrU
	ta0xlYiE3Xu8letqbFjgrPrmFLJNJ1uvamYRr2ylFnh6qZ/i72/IDdBEQYT7v5rl/vjPxvmJr5w
	1EcU2xvd+XNmiqvWzmI0eLib11VHKr1AkXxrqH9UVP3h3VAKxw1qcbjXOfZSEWXztr9k8hFYXaC
	8ojVrIn4PFFXV4GIjd88y7xwhPApv9AA4F9FMIEBRLZit3VF0Aw7nbYIxEfrks5RIrc/m57L2uF
	D5hmo/3/+STtv1NPvvxa75xiUEm2Fb6vmyPllH6y0vrxVXSDsceW+Y0Ym/dypYF38oARcwI+WLm
	lnyWUSf9AxfgKYIOX6OP+1sGWKWU29Y5OZP8a
X-Received: by 2002:a05:6a00:2d96:b0:8a0:5f63:5521 with SMTP id
 d2e1a72fcca58-8a9ba703d12mr13438966b3a.8.1793847163495; Wed, 04 Nov 2026
 18:52:43 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 10:52:14 +0800
X-Gm-Features: AclHuK8gtw_SYmYC4rZ2ec9F7qmZC5mmmsY7xqdrym-SeKMj27M0HT9x7LVxGTo
Message-ID: <CAA+D8AM5Nr9vDzohQaz-XN=_F9dBfXoBJJv_3FS3jDeGQ_6G4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:35=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/imx-audmux.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index f8335a04595a..d46f43ab66cf 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver =3D =
{
>                 .of_match_table =3D imx_audmux_dt_ids,
>         }
>  };
> -
> -static int __init imx_audmux_init(void)
> -{
> -       return platform_driver_register(&imx_audmux_driver);
> -}
> -subsys_initcall(imx_audmux_init);
> -
> -static void __exit imx_audmux_exit(void)
> -{
> -       platform_driver_unregister(&imx_audmux_driver);
> -}
> -module_exit(imx_audmux_exit);
> +subsys_platform_driver(imx_audmux_driver);
>
>  MODULE_DESCRIPTION("Freescale i.MX AUDMUX driver");
>  MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
> --
> 2.51.0
>
