Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E037FF60
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765584; cv=pass; b=m0stfbL6v9gW6G2e5S3vhSDKf0FkLA6f9E6pc+i4Q9QfEAqxARPC2ISyRvbwwIqJ1TtsEc954zDbshAxvPyqf0dcbU+ni69YmjeugO+dwxDBh+NH4N3ZpjvzurDFYOBM7M5jaOmhBveZjr51hpGpCh9txEEo1aByfYLTTup8FJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765584; c=relaxed/simple;
	bh=o1mrfYC7S/rjqrIL7ayqDPmXQygNuX81FtsV52LNlqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edN4xoCFJHLDE3ESLT/djes1uuzeRVWEzbklmd/U8vuWVRko4C8MEQM3/ruWuiyIKSPcKZBhzHgwJNwI+2fqYFjbELSBE9IKMOXxvqZpqpxLZnq+5kTysdhtCMJt6IrvIeb4yGDJHAofi7kLH/qT46aNpSDCryJfk3L7hRGlEtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=bj0Qxodh; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="bj0Qxodh"
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 48C633F131
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776765579;
	bh=mOrVVl98FuFq4ype/L6NmIXGyz0xe/hxvBz9djq1Tlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bj0QxodhcReoYSP1N7ts69aaFy0Air80KlSTXwFQ5envRC7H/a2WjE4ByTzJQszpS
	 8pNLe/HxqCsXL1clSc/IuIpGELf65eLmBm5C82LitPqI+yzRTL4ghS7YjqYNhKLA7f
	 Y+RLE2pxMRSHgrP2RkaexCe8M4Z4D+auLBq723AcBDH4gcJJEW9PuXdBCISYnzjtRo
	 uz6Rlg/W38lRNjiSf8JyRzJ5nTwCSpp75eZDNQQtfIf17UK4Q/q7F3IBwAskEio6zJ
	 RiKlSdQSgmvH036FnZbPZ89Daj6NrZkiSZM6w/nngRdPteM6AcOXbH4C1nj9eirYEB
	 cWJwSt+06NvOboztXpTx78jEKe4GY3yVvN/xrY/F8ZtDbhmhbmRZK+O/QL+86mcN/t
	 MuXMxo7/iNmIRyQW/StEIII+4Nk+sTbnq7UBuGKvmKTfF37HljNHrxk7RLRxDG3wm+
	 zLNzjOWOxf1Rn6mMxCup3hSQaSfuhMJGUdxfBfbLRjGb9VeXmuGR6vUDBb9H8igcp9
	 0UJK/B1S9fGebNulTjbJgumAz75FYdjajyX1RwEpXJmfiU+QTFWMY6ubTC5CN/+Jlp
	 EXVHmiw9arMfB7Vt/O7F9DN+muG8sC3UlKD4JgpaftQ9Ytc7i5H6kLBZRvz7I/gS2+
	 AQTw1sN3FULyt7t/M6Ila7kU=
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8d7d4a79so1715458c88.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776765578; cv=none;
        d=google.com; s=arc-20240605;
        b=OjEBoY9Kr+ZGwLaZ1ZZqeAnJt+gPrHSgqSJKzp2oAKKjDfnsEnquOlle93csgTL7kr
         uG9lZYmA4EPI0qDKFGUvOa2imgWbzqEof3EiS+3swYqNW5W/CxsehjKNqzaNaB0tQNCR
         wl7ckYwyL9ipa8Ba7fLLs/Che0OIJ6g/OETuGZm7m7Ny6VJj8J3MEYmRSO6GJUXfzsZE
         t3sLsdMUQw/pGDPminYo+z7i4BOXr0LALG3dAlgUip9AxsrpFties5YGV0JViMzarZvO
         UX+h1+D+qPb4s2QEaG8eUHxiyxra+w+wP55HwNrGm3sxyOG98vy8+4YIHPcgeaRuTnt8
         tupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=mOrVVl98FuFq4ype/L6NmIXGyz0xe/hxvBz9djq1Tlg=;
        fh=g4WymRDoE3jpl58p1H1fbA24q8fjhh+bm+8QdUCpYHw=;
        b=kJaB85dPzFCgTjnmFq1nEXKS0mu4VOzdZz1vybjHM6KQsnsiJIkUXT2CeIBcHg9xvr
         lOODhgcDGb0E0t33A5aocx6reLJ/mawgd9pL3nv9vuqSZHClIPSCVgmhlckqBROR4Uqr
         U2SU9zo/qYLfKGHV7Ek4QA4Hd6C1JOZWw2A7E6qoUstqRidgWjB3fp5rNEiLF7rhESg1
         AeChM/jjfE0WENPqebL93fsIuVKNywOMdxz5iONr24m2dnQasV/bTezZo8lNMxnvYIZU
         aZ3EDtLdvnG/Ryf3kfaWc8TukF+Nb5fP04ficaemvG4hxG0dTo77d4VOBmnlDmXiwUFV
         FCrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765578; x=1777370378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOrVVl98FuFq4ype/L6NmIXGyz0xe/hxvBz9djq1Tlg=;
        b=hy8ecJMS5O/NVMuPRzEDAYHUYLNi30xm3Fbbng49avWnw8znXCWoXkQCpMNX3Tz+RK
         3NooVdCCyDVVXyqCeq4G3y43vXBrh8rfdGNKa2bsMjwBT3zka94Ld6xPe859TKxW5t04
         gArgynRKPBozwvVZ8cznO/V2Nr+PoYKsd2sZqCJsr/KHqXyzh61Vwc8ql6xxzZJNIOWJ
         Rh/6XoOeIy823HAPjBhUsC7vWioPyFkJIPy81An6BZmts0vwuk+a/ROXfEuloS4vhAKz
         Ho4daZZDmV9vA62kLoY4Mx+0ORAd5jyn1SdjzwXDR43WxYS0z4PUaXqsTlJ/8y5w9Bd7
         xN7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+tiQCfCO9Ap8aDYa68AOmfUT1tCU4S9eiD5RS6RfKGtx8NLwA0Hk20UUk2x/09hZ9v4DUKbkmM5ipMLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm432sNlKjVwBTDdBcoeEhPrUQAYZJPJxXSRHA3BhENwBGE938
	uMxbedFZaqjo4sdHAv28MNsWvTsQ+jDmLPMx9WeWh6iglM/8oZpGn870h1D9Vs7klurz7uwJGmh
	LVTBQl6gvMjn5FNlG+gcrS8C2ig5Yjt88Pp4UfGepiptXW8M3qfHvm8WOJ7hq8BChGAhkbJLO9d
	irRlmDPH1hLj03T8rvL7y86053jtZo65FkK5cC3J2TiTQFl5xzsMdhpc0=
X-Gm-Gg: AeBDieu3+W5HGNkH0T4XfpBEkyo/XO+RwBVppph5lW+5W9XdjOCPr6Vw17E0ISvGNT8
	Fabm4SFS4L1rx2zlqYbxo0PYhSVnoz4VO8E3fYOtPvyhP7KFHsx5ugWZS8giCVahuTsbzZZ7qsT
	5afWaDy7K2KMImsJKEM/ibfou0Ud/xGYPNW9+IR7UYMmxwblBP4VO0qNkr9HRUKAn9z/NOPLVGN
	4aDRhMygkMxOk+d
X-Received: by 2002:a05:7022:1282:b0:127:3b1e:7e0e with SMTP id a92af1059eb24-12c73f9951amr8042706c88.20.1776765577776;
        Tue, 21 Apr 2026 02:59:37 -0700 (PDT)
X-Received: by 2002:a05:7022:1282:b0:127:3b1e:7e0e with SMTP id
 a92af1059eb24-12c73f9951amr8042701c88.20.1776765577319; Tue, 21 Apr 2026
 02:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420114823.194226-1-mstrozek@opensource.cirrus.com>
In-Reply-To: <20260420114823.194226-1-mstrozek@opensource.cirrus.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Tue, 21 Apr 2026 17:59:25 +0800
X-Gm-Features: AQROBzBvPGwqqXg4cSDuFPP8ykntIBJCDVe8iG6aWgf82e4OammXfxEAdu3upNQ
Message-ID: <CAJ6xRxU8Ecb=yX3Dp2jFarkwgZom50eYLrGitwSowh-MHvEPVw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] ASoC: sdw_utils: cs42l43: allow spk component
 names to be combined
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With alsa-ucm-conf PR #748,
after applying this patch, the kernel correctly produces the combined
component string:

  spk:cs35l56+cs42l43-spk hs:cs42l43 mic:cs42l43-dmic

Speaker playback, mute LED, mic LED, and remap all work correctly.

Suggested-by: Aaron Ma <aaron.ma@canonical.com>
Tested-by: Aaron Ma <aaron.ma@canonical.com>

On Mon, Apr 20, 2026 at 7:48=E2=80=AFPM Maciej Strozek
<mstrozek@opensource.cirrus.com> wrote:
>
> Move handling of cs42l43-spk component string into SOF mechanism [1]
> which will allow it to be aggregated with other speakers.
> Likewise handle the cs35l56-bridge special case which should not be
> combined to keep compatibility with UCM.
>
> Link: https://github.com/thesofproject/linux/pull/5445 [1]
> Link: https://github.com/alsa-project/alsa-ucm-conf/pull/747
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> Changes in v2: use dai->component instead of snd_soc_rtd_to_codec(rtd, 0)=
->component
> ---
>  sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  6 ------
>  sound/soc/sdw_utils/soc_sdw_cs42l43.c        | 12 +-----------
>  sound/soc/sdw_utils/soc_sdw_utils.c          | 20 ++++++++++++++++----
>  3 files changed, 17 insertions(+), 21 deletions(-)
>
> diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw=
_utils/soc_sdw_bridge_cs35l56.c
> index 2a7109d53cbe3..e0e32a279787c 100644
> --- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> +++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> @@ -40,12 +40,6 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct snd=
_soc_pcm_runtime *rtd)
>         struct snd_soc_dai *codec_dai;
>         struct snd_soc_dai *cpu_dai;
>
> -       card->components =3D devm_kasprintf(card->dev, GFP_KERNEL,
> -                                         "%s spk:cs35l56-bridge",
> -                                         card->components);
> -       if (!card->components)
> -               return -ENOMEM;
> -
>         ret =3D snd_soc_dapm_new_controls(dapm, bridge_widgets,
>                                         ARRAY_SIZE(bridge_widgets));
>         if (ret) {
> diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/=
soc_sdw_cs42l43.c
> index 4a451b9d4f137..e99ea3c4e5dde 100644
> --- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> +++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> @@ -107,21 +107,11 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND=
_SOC_SDW_UTILS");
>
>  int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struc=
t snd_soc_dai *dai)
>  {
> -       struct snd_soc_component *component =3D snd_soc_rtd_to_codec(rtd,=
 0)->component;
> +       struct snd_soc_component *component =3D dai->component;
>         struct snd_soc_card *card =3D rtd->card;
>         struct snd_soc_dapm_context *dapm =3D snd_soc_card_to_dapm(card);
> -       struct asoc_sdw_mc_private *ctx =3D snd_soc_card_get_drvdata(card=
);
>         int ret;
>
> -       if (!(ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)) {
> -               /* Will be set by the bridge code in this case */
> -               card->components =3D devm_kasprintf(card->dev, GFP_KERNEL=
,
> -                                                 "%s spk:cs42l43-spk",
> -                                                 card->components);
> -               if (!card->components)
> -                       return -ENOMEM;
> -       }
> -
>         ret =3D snd_soc_limit_volume(card, "cs42l43 Speaker Digital Volum=
e",
>                                    CS42L43_SPK_VOLUME_0DB);
>         if (ret)
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/so=
c_sdw_utils.c
> index 2807f536eef0c..1637cc3f3d598 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -758,6 +758,7 @@ struct asoc_sdw_codec_info codec_info_list[] =3D {
>                         {
>                                 .direction =3D {true, false},
>                                 .codec_name =3D "cs42l43-codec",
> +                               .component_name =3D "cs42l43-spk",
>                                 .dai_name =3D "cs42l43-dp6",
>                                 .dai_type =3D SOC_SDW_DAI_TYPE_AMP,
>                                 .dailink =3D {SOC_SDW_AMP_OUT_DAI_ID, SOC=
_SDW_UNUSED_DAI_ID},
> @@ -1104,6 +1105,7 @@ static int asoc_sdw_find_codec_info_dai_index(const=
 struct asoc_sdw_codec_info *
>  int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>         struct snd_soc_card *card =3D rtd->card;
> +       struct asoc_sdw_mc_private *ctx =3D snd_soc_card_get_drvdata(card=
);
>         struct snd_soc_dapm_context *dapm =3D snd_soc_card_to_dapm(card);
>         struct asoc_sdw_codec_info *codec_info;
>         struct snd_soc_dai *dai;
> @@ -1179,16 +1181,26 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime =
*rtd)
>                 /* Generate the spk component string for card->components=
 string */
>                 if (codec_info->dais[dai_index].dai_type =3D=3D SOC_SDW_D=
AI_TYPE_AMP &&
>                     codec_info->dais[dai_index].component_name) {
> +                       const char *component;
> +
> +                       /*
> +                        * For the special case of cs42l43 with sidecar a=
mps, use only
> +                        * "cs35l56-bridge" as the component name in card=
->components
> +                        */
> +                       if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS &&
> +                           !strcmp(codec_info->dais[dai_index].component=
_name, "cs42l43-spk"))
> +                               component =3D "cs35l56-bridge";
> +                       else
> +                               component =3D codec_info->dais[dai_index]=
.component_name;
> +
>                         if (strlen (spk_components) =3D=3D 0)
>                                 spk_components =3D
> -                                       devm_kasprintf(card->dev, GFP_KER=
NEL, "%s",
> -                                                      codec_info->dais[d=
ai_index].component_name);
> +                                       devm_kasprintf(card->dev, GFP_KER=
NEL, "%s", component);
>                         else
>                                 /* Append component name to spk_component=
s */
>                                 spk_components =3D
>                                         devm_kasprintf(card->dev, GFP_KER=
NEL,
> -                                                      "%s+%s", spk_compo=
nents,
> -                                                      codec_info->dais[d=
ai_index].component_name);
> +                                                      "%s+%s", spk_compo=
nents, component);
>                 }
>
>                 codec_info->dais[dai_index].rtd_init_done =3D true;
> --
> 2.47.3
>
