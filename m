Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792661840;
	b=OUdPce61WDfjgWQnyhnjNwg8yTfnfTg015zlSf/e4abdXpqN6az+TMYm/tefKmyuCZxI
	 UEm3HcditrxZpcdxOj89yELXD+x1/Za6z6hbQfefE1WhZuuKtSrEhL6wLsdTlRBAKSnRq
	 AAEiy2x2uUY+830zQogRDUX2W017UfCtA0lTt0A+K17IE+EAEZRqd5BvuvPcEVEjoxn0+
	 l9qFCFJoqkS33a+GUxecw4Hih1Is520WqGw0WVc8XVHJiye33UVGGknDoFJ8lbRZZUnzN
	 c4d4uPAAPxHZ+my5SE9rZ0DGmFUI6vGmG4+cnxViDfifVogo/egHa5/SHouyZs4ymbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
	b=qpjLKJNgQ8FLAPq1kSjMfMupEjIGT3sIWpymcPakcfy01WxFadQQ3hy1lKn8Plyj/Ob5
	 ulUvMliT17Ge5CCMivob8qpkvj1DLlLQ7lpInVae279VPxHnsjfHaTZiHFCTsKkSxGaRY
	 eyybDKaO1qaYodRA09LVKG1aeWqh/0NchKfkTmLZuyPCJ0yskK2BieTx1D4cDUrmxWd4m
	 G0Snh04DSFpBS1V443GAtWE32w/06U/9leWG2gOqwLIMZokbLCtlgB3abh7HYCatgaB9e
	 ybXg0OBPrKlRxRD3NtMxJv7HyMQN+2pE0T6Fwg9K1Iffkg4onCbyoPkNOHmO+8cc/vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gW4KRLHx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B329606A321
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B329606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gW4KRLHx
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06c60065fso1123010b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792661839; cv=none;
        d=google.com; s=arc-20260327;
        b=AzWwt2srlBmZqZ+0+M/CQI8a5vyr9ILNKWP7YXuq6pDh6AIIgtoRWkwK+YgLXqytpU
         CD95fi5pv7szYfsVxjOBvy7JCHusqduYZCkXnOJ0DSkaFWhFTf3NHtoX2RcmV2FkfteD
         p3piqKJqMGiU5zojXSHYbMg3Kyl0/eeFPHbIMrXkjz94Cdg1IUZ+8R5sTn6KlNr2lQFs
         iklyn8PJic1B4mbRoLtGLDUdEMd052/w2UKXPCsBU9+R8+v36tX95iw4RRld7bN8nX9O
         7XlkNL/oYl2ZZWwJzSsuHR6q4nInkziIyvr/I3o6Ptv1p+nC157rhQdWQfprLhu5BSZx
         a9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        fh=TNdkL9EbfWSjMO7iqDQz5qG1rj/5Hk4b1/53yG0mL2A=;
        b=Ryth6+ZzwKb7bO/cIiLgBWHOkG4bvZHQ3F/ndIq/uzG9NkPLtNQHoPKp5N63e8ed8K
         G3F6EVu6vb/mZ+wmC+/AP/WITNCgb5xSvzaYflmo2tP8PRaGgVCEQIrVuk/sUz+6PwHE
         haizIsiRWGnCrzVAo0SAf5ytHF8xkq/V7fws48UYBAfsf69UDwbDAPnetRWuaJsumpSC
         qvQAKL/mw1uL5aXXsUUIZpu4a6qDvJh5aXRJGSBHQ7vdBCVHhsgWT4qeHDeiLvDJ8Jym
         BzLA0pevSoDbQ8iTYFLdPUulxgfgnfaDOuPp0q96J+/1k12E7zGHvzUmvIh9qsYGsKAp
         H2yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661839; x=1793266639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=gW4KRLHxSd0hAE2fY7aEtXVz8/epLuRHp6lkbrmui1+jgxEfO3BNAKb6kRtPl4BkKl
         tFShreuZKMeb0lb73hhq6uRh0VyRJE2jnyCdYqmOo//F1HyI0/izpeyFR/0D1vBZ/xmy
         OoS9sNKIRZgL88XHGJLv+o7KwV1u3rw3iJqAXQarPcs2qBwF2R0QCbwzz0xSP2oxMAUQ
         WKoF39kKI/llHIxuygGhZkIQdLV4Hmccick5aCTAoHp4cXtavNRmaYA+vlgaMK6RwpBy
         Hkod9SOyr/muqZJcEw/zf7fQLurwEvGi7g2/axmorq3x7NUEVs1WAnoaPxwB4kjsF1zf
         5J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661839; x=1793266639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=ORTY2YL8hSDR3UvEiHsWlvUYQx9Xh5HW+fTOzeZUZFgbTylWnbQsqDgt6ev26vqUjl
         kuTF6kDBgPWJqgI5jA1b8D6BiMPcEBEHy20BE0FGAAk43/KFmpY0LACEDNa9G7tuQNyG
         K40QcZ3mHqGQ99BFk5zNY7nBa+gRy3wLoPYP51udyDFCtTz8iRwMybJjYCTptcSpl55G
         /YltxGCEcvYBoGgSVUXQUDJ4roYql1fMNpvim89Wqlk2my8fbOAjc2fwKMZtxTpjKK2a
         il1H2fFrEJjGAu9oFN851mgjUfqi95/zvdB2XWsEWJ9IeZt+7O94CRtt/5xXUbVm/IpO
         kXIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCWyz6G/IZJeT6lPZYIPiLzLhH9QujPOoPAiYOYtSJDpg7UfFUSTtskCmkWv5dYaXEcPOomjUwBimXJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYISs0qhbqkzeEXv6co+Ls2gR+7LvPBEHSEdhcCq3R/L1ialHO2d
	NmVqxO4UqspwfjMRLZWsenx/llLcReCRAURAkMxKMbbchcadJzt7Htdz6dNKHN7fxInPk0oWfrO
	2YemEQ+86qkA7CKMViDKv2SZ4GGl5bFw=
X-Gm-Gg: AYBFou1aUPBp8xydWjj1n/nQXuXEmJs+x51MCeaeXezCZ2HjR0SL/q/scFw9ab0K9Qt
	zTUZ7GRX/lZLeVums+BJ5jn+dlL3EnAY17R0CFtGLvTjPPlKm0nAKbndh+6oh8yDR0TIZg8/Wxs
	E2O/NzH2PisZJ36W8258BIzQ7bcIYGtNErIDEXIU+EhLSSwXPVOHcFk1B32Y9VIliOfQIo6TOe0
	l0ReCIF/TbBV2npz1Wv+hub9XbpHJDWdDVVjubnwZ9a1SRpUgi1q96i9f59apOx5M3L+GqGt5uL
	Pf6OjD3ufF5AmULC7RYc5Le/9gpQ+/UWxNz3r59FcX+B9ois6IPD8rdNDAvvqerFlBYhVajRRSb
	UyegOE1xMG8KuMT+mSOf9pO9wCe8C3QZxWGktxw==
X-Received: by 2002:a05:6a20:c6cd:b0:3e1:3178:8d63 with SMTP id
 adf61e73a8af0-3e287e025e1mr3241635637.44.1792661838857; Thu, 22 Oct 2026
 02:37:18 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Oct 2026 17:36:58 +0800
X-Gm-Features: AclHuK8v2lajakrSJ87vVRxpdMWjcEs90TbK_GuOR8gXyo3LH7ug2o5_RGKU8uI
Message-ID: <CAA+D8AMOW3oUoX7xJpuD=T4QJn0iDPfZqQuT1=1otZ1Dqh6otQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:58=E2=80=AFPM Chancel Liu <chancel.liu@oss.nxp.co=
m> wrote:
>
> From: Chancel Liu <chancel.liu@nxp.com>
>
> imx_rpmsg_terminate_all() queues the TERMINATE message to the workqueue
> and returns, while the DAI hw_free() synchronously gates the audio
> clock. The two can then run concurrently, and this concurrent access to
> the shared audio clock path can cause a stop failure or even hang the
> system.
>
> Flush the workqueue in a new component hw_free(), which runs before the
> DAI hw_free(), so TERMINATE is fully handled before the clock is gated.
> CLOSE stays the last message.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.=
c
> index 85b7c929a28a..6a0174d6c78d 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,6 +178,16 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_co=
mponent *component,
>         return 0;
>  }
>
> +static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
> +                                struct snd_pcm_substream *substream)
> +{
> +       struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
> +
> +       flush_workqueue(info->rpmsg_wq);
> +
> +       return 0;
> +}
> +
>  static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component =
*component,
>                                                struct snd_pcm_substream *=
substream)
>  {
> @@ -285,9 +295,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_compone=
nt *component,
>         struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
>         struct rpmsg_msg *msg;
>
> -       /* Flush work in workqueue to make TX_CLOSE is the last message *=
/
> -       flush_workqueue(info->rpmsg_wq);
> -
>         if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>                 msg =3D &info->msg[TX_CLOSE];
>                 msg->s_msg.header.cmd =3D TX_CLOSE;
> @@ -624,6 +631,7 @@ static const struct snd_soc_component_driver imx_rpms=
g_soc_component =3D {
>         .open           =3D imx_rpmsg_pcm_open,
>         .close          =3D imx_rpmsg_pcm_close,
>         .hw_params      =3D imx_rpmsg_pcm_hw_params,
> +       .hw_free        =3D imx_rpmsg_pcm_hw_free,
>         .trigger        =3D imx_rpmsg_pcm_trigger,
>         .pointer        =3D imx_rpmsg_pcm_pointer,
>         .ack            =3D imx_rpmsg_pcm_ack,
>
> ---
> base-commit: 8d00cfd77ffa64477129969eec8249c8cdadc9c2
> change-id: 20261019-b4-imx-pcm-rpmsg-concurrent-1522959ba768
>
> Best regards,
> --
> Chancel Liu <chancel.liu@nxp.com>
>
