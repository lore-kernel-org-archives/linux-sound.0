Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474500;
	b=4inDfdAPs9dVvw2JRYfFXJkP+5r4Zk7Rle1DJ6gp2TZHnmDziXqcIYjKDujMXc6zl/rv
	 RIzVEiRUcJhsVFwIpw9zp4q6wuzMIMQjP+kAXk1kBSHChoKZK3X/4cMugmFBBqG8GBN2Y
	 2Dn230sdo73ereS6++L2+NZwRZnqJlTrIJYdu/2vvP2VfC35ZO3CLwyHH/WAdNJ9/Giyn
	 WXNmI90juMBZs3/sgOnO9WZhMtau6t2EbAbks7tM7a3qn8i46onRPvkfjpeNjJ+LtVyFG
	 owyBY3QcZTfxHhs8U4ckoMC4cyQ5idPk9zBh5hNEa2Ac8OZvPOuZ5uQwINoFubxYGmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
	b=Dkz15dk7SKW7En/rlcMwr3HWg43XmEuB1qK5sF3Jq2FUyUosJ+qvISbJPcBSSB7OBCi0
	 Dyz0207G68a+90X7CjjqSgSchTxMB8tFfZqimdUHMGIh/KboU0JuhfS3U5szcMpm4zpvi
	 MTutLEgmx91qxI8KIGkmGXHRHf1XC4qrStkhAIaY0QGvnPPzqcOWIDpmGy3YcJGV2Vvcm
	 G0zrGW5lTf+fF/T4Jexq8cYNEvPN1Trxnj3ZaterxofaFmS5w/o88xqFocj6Hb7/T38Hz
	 ooY6zTat1KC9wJAim1R4Pz3gu7gCeX7tzWQu1JGbtAqoqZ5q5w4vlSz9XHhBWeFUFrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pzu5I8Ww;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04A606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 09:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A04A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pzu5I8Ww
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3049469b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474499; cv=none;
        d=google.com; s=arc-20260327;
        b=MUQI1mNsD5tT41rdyprhmwrnmLBBYN8VISWJbhSWf523sBZatr8TbCQOABN25o/45Z
         enhMNRXpLkkXCjaN1mAWcfqYaXFLLbMD+h4ATvRXNNkQOeITnASk4/ux1Res2huOZqSA
         mj2YnqlEWuy27vaPt8OzSTYG05h3pBpkJ3AUSHQ6tZtPF+q5PrnSgQJjQNtCqK2lfL/J
         v53Tga1KroosKwblEZmdQigNap/wJyZZarMv5E2/nFeaxlIwL2BWzJXqSrAy7UrimLHF
         o8DL/6bah0L9O5gfX5Brp8livYr5JtXtiKj6HBZ3aRdNzaOpOu9QPJ/5ZuYha1loyLG5
         lY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
        fh=RXqpkckxI+PDEZREAEKz/eF5Xd9GK5uS4E+YT4/Eft0=;
        b=SyeRccSXjckTbOB/fKAspM7boXlpbMjf2iBVlsoa5IA9sveiTVWfd5lck3yk9Kpe6U
         a5GDB0QsgLAjbpgN4xoIPvpSuv3Bm33FiRRn9aiXJU51T919HtzxzWPonbRt2l9j/+XN
         aRUr/w9fASQxlQc9AKWD1Nne5pwAH1h2ljudCs/1bdZNybfB8oOlhlu1sE3QKvrwH2Dw
         4PzYdPSwEqMEgCGF6e8nzMj+NrhTxRzgT1Qo2x43RXl+RYMCeFP/B+6TZfUdk/t4vwIb
         ezXmxAkjZBLNHrQ8q3rdo3KHmer5AKOi5YIU7Sd3hIML03O13h+Dk3i7lg+tv4/EzuZd
         B7TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474499; x=1795079299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
        b=Pzu5I8WwfxebKK/7XUQN1OGkBPv/e2nHjUvWDEE9+hQLs6DhWWtdjkAMW7H27UrSSp
         sWr6KGDpYyJIZ29blg7Ujn2N1YsJcaLxcUgBLPzFag0sGhsWSjq89BYyMX0WmbMUnngA
         rL6rCDxYB6ya69fULB1N2xaPouPWrxOzd/ZjbN0396jLWUP11Sybv1db6OWipkc7Z7LC
         dzWi9BxZGGAMDLmbMFTZByNkHsKBcm4XpF9/MFyuazwOd7xdzwf2DeUagIdPs2FNsCCY
         pXreL4hwbnOSxsvWacY0x1PbQ1SxZeK2G8zHhXAdsOfhJ07pNlWlnHJnOU6Tox3PlAaC
         xv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474499; x=1795079299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxsE6PqmpKFZd5WTCPldAkadxtOwm9bHGSoZKmkpDY=;
        b=vmnjFjUez+b9M8KTEeOJYDeQUOjU6IoCehffgcy9xTOCqwZtogO6n2nAQ1McaU++ED
         nS+cTjEzVx/dykJ0W0ILdYZzUrpnaWq5U7vOIT5iraRDYJrNLWBjsStlbsbjps2zv9YI
         NUREoVnTCWv1q7yxY3uBNs96DAdN0taiz0nH2x5DFR7B8VkF4YlrjEiPkhQOd36Rl++u
         PlqLguLOY1fdEZhLvBOaP7Rg3lwMrEaIO2qQ1kfvTZtGZjXbc48EXPbWJdCjOda+zeTS
         UsEgIIKFC9fx7SEbqK+CZHneBbGTscn+k0u1/PBmr9SZoFo8nE9UvEeWBw3wkrsXTXYy
         nByw==
X-Forwarded-Encrypted: i=1; AL+hErHKx6UNkXzTUzgob4iMLIhAe1WTBbedxHNX+Xmgji/JrW928flLar6V26MIHk3zV5mzqMh2NRyowm/90w==@vger.kernel.org
X-Gm-Message-State: APuU4Z81jub4w4EJz67bMK0lr2RRBDNdj6aFSRPe8SuLqVFbO84RAYBh
	+R9wqBocIAjAavJuJwZN/qYK56OaV1AInO+nqnm1olUOD5qPluGWmN9OWGatUQEF//C/Pfk/+0J
	y1zY8eIbj8TJfOz3bCLO6dIx+awxvh9s=
X-Gm-Gg: AYBFou1CyZVC7SwqgQO87WjIjOnFi2Q1o5ch7e0d2IUv4jcJFhTQ9Lmh2hCd176X99e
	G0qlPnHsbuJSAdw7/WsBTX5fFr7KehcbsixCZAF06UjSFyuzD3VPfMpwALJ87HbZqP0FOnElnZm
	zPhbR0yX1Qh9KnI2iW29BgTnak/BijfNbKPyuIE8tUzv1UdduIh62V4MHcIXHDfmlBFPEf09FKQ
	UzXJmGHqK3x7I0HuQI1xG9u1o0WYTfCVvoHV+dbiIQh24ozeRvGhBWMXcfr3BrTLqzxshDF2Wmr
	R8h741v2TnfVQCdofj0tjyRTCQyNBUYumd6kOZhpNN2YxTMxEtYuCQpoTjk4WpPaFaMbjP1qaax
	CXPEhVz2ixYdTjxhhc/PbDs8HVXkdr6UcBLvLZnjf4vb2VUC9ZWJAZDqCpA==
X-Received: by 2002:a05:6a00:982:b0:886:3827:c4a2 with SMTP id
 d2e1a72fcca58-8bc19503fc2mr5293685b3a.3.1794474499419; Thu, 12 Nov 2026
 01:08:19 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-3-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-3-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:08:03 +0800
X-Gm-Features: AclHuK8OFan-61VHpWDbQwD5GQhW_fgRO4OvBxXWkrMrWUfYeFa8VUbGfv5vQOs
Message-ID: <CAA+D8ANdJCkf1i7MUJVh7z7tk3Ka6gWZ0ynMys_Qt70ZfaN0=g@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: fsl_asrc: fix pair ownership on repeated or failed
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:08=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> hw_params() can be called again without hw_free() in between, and
> hw_free() is also called after a failed hw_params().
>
> fsl_asrc_request_pair() always takes a new pair, so a second hw_params()
> leaves the stream in two asrc->pair[] entries. Only one is released, and
> after close the other points to freed memory, which is dereferenced by
> fsl_asrc_isr() and fsl_asrc_m2m_suspend(). After a failed hw_params(),
> fsl_asrc_release_pair() releases a stale index that may belong to
> another running stream.
>
> Keep the owned pair and only update its channels when it is requested
> again, and ignore a pair the stream does not own on release.
>
> Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform =
drivers")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index faf348dd582d..5d97789b5c36 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -216,6 +216,8 @@ static void fsl_asrc_sel_proc(int inrate, int outrate=
,
>   * It assigns pair by the order of A->C->B because allocation of pair B,
>   * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
>   * while pair A and pair C are comparatively independent.
> + *
> + * If @pair already owns a pair, it is kept and only its channels are up=
dated.
>   */
>  static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pai=
r)
>  {
> @@ -226,6 +228,19 @@ static int fsl_asrc_request_pair(int channels, struc=
t fsl_asrc_pair *pair)
>
>         guard(spinlock_irqsave)(&asrc->lock);
>
> +       if (asrc->pair[pair->index] =3D=3D pair) {
> +               if (asrc->channel_avail + pair->channels < channels) {
> +                       dev_err(dev, "can't afford required channels: %d\=
n", channels);
> +                       return -EINVAL;
> +               }
> +
> +               asrc->channel_avail +=3D pair->channels;
> +               asrc->channel_avail -=3D channels;
> +               pair->channels =3D channels;
> +
> +               return 0;
> +       }
> +
>         for (i =3D ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
>                 if (asrc->pair[i] !=3D NULL)
>                         continue;
> @@ -257,12 +272,19 @@ static int fsl_asrc_request_pair(int channels, stru=
ct fsl_asrc_pair *pair)
>   * @pair: pair to release
>   *
>   * It clears the resource from asrc and releases the occupied channels.
> + * Nothing is done if @pair does not own a pair.
>   */
>  static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
>  {
>         struct fsl_asrc *asrc =3D pair->asrc;
>         enum asrc_pair_index index =3D pair->index;
>
> +       /* Only the owner clears its entry, so it cannot change after thi=
s check */
> +       scoped_guard(spinlock_irqsave, &asrc->lock) {
> +               if (asrc->pair[index] !=3D pair)
> +                       return;
> +       }
> +
>         /* Make sure the pair is disabled */
>         regmap_update_bits(asrc->regmap, REG_ASRCTR,
>                            ASRCTR_ASRCEi_MASK(index), 0);
> --
> 2.53.0
>
