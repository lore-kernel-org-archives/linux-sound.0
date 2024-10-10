Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007AD19D082
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 18:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583332; cv=none; b=XbxV3hcy9og1901Pi8riB93ftJ723hdya/rIWZKQBi/KwO7Rrb7pp5FCXDhyWoShcZdEg2gNvsCh8qu85zEVW13+fWFdpQ/w007s/7cAsbmFvbIjSsUA9NGYxYZJxmewJI056O5NWoCKxsmhVxr26SPwLWVtZ3ctWGwE5Qg8+9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583332; c=relaxed/simple;
	bh=74uNZwP9yPkuwSjOQnzZHxaG6HAtQJ20wqo37W7tTv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAql4CoQcA0X31gansUxcsXjZRCo4tUb8NTyT7RVFciGOTet1HoPwEZp3g9jLzGEStcajgpoixSIWGY6bV1c4g9HnKbIvWCxKzS13fwpi78Pv+WtXmRZN/flsw0Jep0heH1DJ4JnyF+AFOwhem1TA0ptaWK5pwFXmmzhTx0var8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=U6gpFk+m; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="U6gpFk+m"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a994c322aefso61970466b.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 11:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728583329; x=1729188129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjsDzstTYFGDD7Ix+X5kO1Gib1XyR99VIvH0hkAEl4Q=;
        b=U6gpFk+mLDa9BXBR+jckOSgSnkzJApvHeMYOyijwXBvNB5G66LqRdw8kTDAYtTgBtV
         +mdSl/O0NpMcCtWhDKzTdUymFucI+NHCn/UoKiDhHq9KXUVXI4/XlzA3QMUFR4t4HFqn
         ecL3aCQOM+dfIht9+XH/gAX+qlj6C39Ev+YpzP6+7jWThGPNW8yiiAJxzKKdrSUs1VCr
         zew7oDzVHMGnXp2X8BZlSfKNC44NiOel0YJd7bbgIvP/1geIg3XhOKIJURUhw3YwWjVZ
         aohoEnn4u6NcakLp3KlT+Ijb5w8bUfH1D6DrCTgJWV0aYhFsfHh37oYbPG3zFvxLoW2N
         90Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583329; x=1729188129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjsDzstTYFGDD7Ix+X5kO1Gib1XyR99VIvH0hkAEl4Q=;
        b=JI83QRSm1LMiFszisBkuAknkondex4rkmeqFEjoOtY4a1vvbOZo5+IYdnZxS3y4k3n
         z7pkOBNQwZXZwuw3SVBrwa5u0rXUO6Av+LL9pEDGLZ84rd7CIO4klHDMmn5owREpSnjg
         /+PAboWiLT+SEsCcilUjmH58e67n4eDwp/P3htd0kG/O5bzNPbS0qdAnuXqYYeuUnBnL
         gbaWRQQ4Qh4Doeol1MYbopyyZwhA4Va9ekwtzAfkgozxl7sQ8G8pFY14Fvj3VtLO6ouX
         lFB5dS69Oxt/b/2VkykBQQ8EkMvd3ZynKjy41I0QTY8Uc6l3i/Rg2lu8Oi+hMMiveHU/
         frTw==
X-Forwarded-Encrypted: i=1; AJvYcCXnEWQ8effCM5r2cmmKpcGFnJWk0ZPe+XEdDspULOQZSKFPr1ig+OS5zp8xAhigagff5ygv9l0nmvB9Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGSUi6mm6lQx8AXDLL7lWm4VAvzVFYtJTu0lWQr7UQo202pxv5
	3KrK7eK6dV7Frvg6k37kHLHStvk/wz2hNw1EHEWaEURy/PhOAnihgi0TJbAyhFqTOvnuZY7Rr3g
	4cLl3XVQ5b2/NwnMuCT9+SmHZnqcz2mtvWYq3rg==
X-Google-Smtp-Source: AGHT+IEPdggCCFNvXE/idTLBBpLlat+htfqfEsx6mlEFEupC0RZgBZSnvkfye6OVd7fobOMWdhcYoRrgtuG6RGsrNwQ=
X-Received: by 2002:a17:907:6d24:b0:a99:5b1f:99b3 with SMTP id
 a640c23a62f3a-a99a13b0f2amr381112966b.24.1728583329160; Thu, 10 Oct 2024
 11:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008234422.5274-1-everestkc@everestkc.com.np> <e44527e8-b7c6-4712-97a6-d54f02ad2dc9@linuxfoundation.org>
In-Reply-To: <e44527e8-b7c6-4712-97a6-d54f02ad2dc9@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Thu, 10 Oct 2024 12:01:57 -0600
Message-ID: <CAEO-vhF0C2voBfQNOPYqTUhrH8tFNtE3dPV6aaODrVS17Znxog@mail.gmail.com>
Subject: Re: [PATCH-next V2] ASoC: rt721-sdca: Clean logically deadcode in rt721-sdca.c
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 9:08=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 10/8/24 17:44, Everest K.C. wrote:
> > As the same condition was checked in inner and outer if
> > statements. The code never reaches the inner else statement.
> >
> > This issue was reported by Coverity Scan with CID =3D 1600271.
> >
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> > V1 -> V2: - Updated the patch prefix to PATCH-next
> >         - Added how the issue was discovered
> >
> >   sound/soc/codecs/rt721-sdca.c | 10 +++-------
> >   1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdc=
a.c
> > index 36056cb7a3ca..4fd26e490610 100644
> > --- a/sound/soc/codecs/rt721-sdca.c
> > +++ b/sound/soc/codecs/rt721-sdca.c
> > @@ -611,13 +611,9 @@ static int rt721_sdca_dmic_set_gain_get(struct snd=
_kcontrol *kcontrol,
> >
> >               if (!adc_vol_flag) /* boost gain */
> >                       ctl =3D regvalue / boost_step;
> > -             else { /* ADC gain */
> > -                     if (adc_vol_flag)
> > -                             ctl =3D p->max - (((vol_max - regvalue) &=
 0xffff) / interval_offset);
> > -                     else
> > -                             ctl =3D p->max - (((0 - regvalue) & 0xfff=
f) / interval_offset);
> > -             }
> > -
> > +             else /* ADC gain */
> > +                     ctl =3D p->max - (((vol_max - regvalue) & 0xffff)=
 / interval_offset);
> > +
> >               ucontrol->value.integer.value[i] =3D ctl;
> >       }
> >
>
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
> As mentioned in my review for v1 of this patch, the exact same problem
> exists in sound/soc/codecs/rt722-sdca.c as well, in case you want to send
> patch to fix that one.
I just sent the patch for it as well. Thank you for pointing it out.
> thanks,
> -- Shuah
Thanks,
Everest K.C.
