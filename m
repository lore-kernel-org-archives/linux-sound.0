Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dJ8X6O8d"
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F0FF1
	for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 20:08:06 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4b2f3539089so2263310e0c.0
        for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 20:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702267686; x=1702872486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTd+fEPmXY/+K0C4daC2dwAWjvpJ1oG4S1yMkL+8DtM=;
        b=dJ8X6O8dpLorrx//wqjQ+Ms6rKTkaLJmF4o6r3ZdAlU4nkD4jCPpWjJTGiaURDeF2L
         qq76XwCmHTEwg195XWu2AS5twiJajcwxT9RLfW5p2l4uTiI6V7/ung1H+w+kWWOmS7wa
         clAXRdDCOORbtXuyi8XqAbGx96KZhgsJigNCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702267686; x=1702872486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTd+fEPmXY/+K0C4daC2dwAWjvpJ1oG4S1yMkL+8DtM=;
        b=E2tIgG2pmpsveGstZfLdX72moMxfC9gB3bcyPrQrjSJSQjmJ2OhgRarvxmlA7DQc8V
         RS4rZRGIrzWbgfSSQaXIguprqR49QgySCEp1cFQG5ecBBZCkA7nUgUrDvIaPytcGHlk0
         WZseWmv0YDbl/5MFBcyKT5ugsMyB63MO6xbXyyqQ9/ml/qlv0ZzQH3z7+TpX3PSQ1oXX
         l7HjGIGSymJQJ7WkxdGGBlTGqqRkcstfpZtkAv8FBCo5+vDB6vS1lqfDRVwmPEdSxT44
         6VZzXAXlPW4B+Cf9g+xs8m5CgaJ4yyEtF5Hn3M2Dp3BH4AVX0YsHzoc3HtYqwdIF2AiE
         IHdw==
X-Gm-Message-State: AOJu0Yw+DLyjtiVMW8L7lyBlrsqDFradZgUq4jdlTIF5vi+hSLyC71lN
	r3Sldu1xXbnhtTTWIx1VRVTe2m5i11eZHjjbaps=
X-Google-Smtp-Source: AGHT+IGixobaPd1ab7a32FCbZ7sRE+qJiAMYwJ8yk4clE97bqbacYLgoC33+y3N0AOdMIQFlc3ylCQ==
X-Received: by 2002:a05:6122:4485:b0:49a:a6c8:c815 with SMTP id cz5-20020a056122448500b0049aa6c8c815mr2902996vkb.6.1702267685751;
        Sun, 10 Dec 2023 20:08:05 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id cz18-20020a056122449200b004b2daa800easm769475vkb.54.2023.12.10.20.08.05
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 20:08:05 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7c5634d3189so2287691241.0
        for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 20:08:05 -0800 (PST)
X-Received: by 2002:a05:6102:5114:b0:464:3f78:3cbe with SMTP id
 bm20-20020a056102511400b004643f783cbemr2701028vsb.4.1702267684761; Sun, 10
 Dec 2023 20:08:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
In-Reply-To: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 11 Dec 2023 12:07:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh6twyqoSgeEXDsW=+FZRUxMN=Pkrw45KFq-z5XaGpFtw@mail.gmail.com>
Message-ID: <CAC=S1nh6twyqoSgeEXDsW=+FZRUxMN=Pkrw45KFq-z5XaGpFtw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt7986: silence error in case of -EPROBE_DEFER
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Dec 11, 2023 at 9:33=E2=80=AFAM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> If probe is defered no error should be printed. Mute it.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  sound/soc/mediatek/mt7986/mt7986-wm8960.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediat=
ek/mt7986/mt7986-wm8960.c
> index c1390b3734101..24a4b943030d7 100644
> --- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> +++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> @@ -144,7 +144,9 @@ static int mt7986_wm8960_machine_probe(struct platfor=
m_device *pdev)
>
>         ret =3D devm_snd_soc_register_card(&pdev->dev, card);
>         if (ret) {
> -               dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n"=
, __func__, ret);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "%s snd_soc_register_card fai=
l: %d\n", __func__, ret);
> +
Please consider using dev_err_probe() instead.

Regards,
Fei

>                 goto err_of_node_put;
>         }

>
> --
> 2.43.0
>
>
