Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22721771B
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922316; cv=pass; b=WfNI8kP/SYfZ7KG6sdpMjBt2qJGcGcWB+Ui26s2XUR+wvUsivJRuz58GNP9M8ophUkgMucbRm+r1tI/NTsSQVhkDNH0BGsfTPe9D6oEp6kyz1gKciXfYMafTFaFIHFEt5BYvXZ6SpLvNGs7YQMlAn7ucwUxqLVA0nSOml3TUwl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922316; c=relaxed/simple;
	bh=pqtzpDkpqH+abQT/3bgTv2KxwIh00iwy89c3NaVxga4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTXotyc8mZkZxlP2yFriDYOUbpTSEKIELVMvjdZ35vpIwr92BMOG/sVKfAAYgdAyLMzw+Xu4cTZfxoFx2VkUbHLG0N/HajPOSNXrVuL0aIMXY5jLqCGUpsM8J2ky3hUNicSwEop5S19sWR/THaH/4qcq2xF+xR/5RmFhMxvNKtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl8Xfclu; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl8Xfclu"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b24fede2acso11982275ad.3
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 18:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774922315; cv=none;
        d=google.com; s=arc-20240605;
        b=lh6Q7mOP6F8e9s6XdebjvNDK2xhH4Dl/ZPwZMVJprsdoFGeCUiQkhiWQw75cwcmYAw
         OolKv6H3KYf2vPBDXXzjhaQrRGFup5ggCU8/918Ik+mw58/hUagU8oM2d5cjaX/m3cZO
         W4sZY77WRUbwFgFMIM/mYr3lwFAqzi8qbzxGsFgei8HGXSd6KHi05ptkPLa0CgqdsDF1
         pc8ScVOQSxuvf+X9rqOMmGAIczYR6PnHKn6kgxqO2NKsOj9KjVUuLP5gsAwAA209BKIk
         x3gWYLBtyEuA1V6n1U7aFvDTpu3Lk82O8kexoF31LK1AM10SbJWtLOaJXJJ+K4wieoyn
         TARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lh6+5wmxx4h3Bwis2Kw/KW78+qVVfu3FcQxTwX+HNrY=;
        fh=Om2L5vScaqpewHIl1roqsOSpXg2O25zRUnDVVdNtyFQ=;
        b=QDG8P5NuPGuMHRC8vdyBU7/iB/UWv7b5zTsxOuApEgy+1UxL965WXiYGM/37E0ZFFm
         T002R0ZxTyUpv0dkDglir2FmQpAlvFo6BA7rH5E5zjMV8lbXuZuvZ3mxFHod/B1CqRtD
         WEegy4Sc2JLphSFh6ojmd9uaRK5bZuwThArjF/7lJS+SRKV90U2dLSd4RLZEQJxmufie
         PfGqb+tNVSD1F+RIc06tYNhthlYfp2JdfQ7qGL/HvjOQRtzzllraEzCUKF3tumaXcUzT
         M00NjXX5BDHnwA44ik4ZdHttMAafXXSeSERihiDKTdEZ+H4znnobHF1IMpgV2hhfvHmP
         ioPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774922315; x=1775527115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh6+5wmxx4h3Bwis2Kw/KW78+qVVfu3FcQxTwX+HNrY=;
        b=Nl8XfcluwOOQ05P6BxzWbXkO9SyXcxuab0G5JR+J0YoEODLMEegCMhd66ktLxcjdSl
         623Pu/WdA/rYK3OtE4PjOlomSSusZ1zUXBcbofNjNt7VRmop0Ra1CPd2VF2G0fhjbFwj
         Zp0u1+HXHRu3xUVsRPh65++lO20PFDXkafwDiQe5TwcjVrPrS9KdMP8ACIQhCtV36DSb
         rsZ+2SRqmsbELmu3WeUOWcwQba6/H2S0p/0d+Irx5lMCXqnGWpDIDwPAdkB9dAYdgajA
         07KlRgheq+6XLhy3Hud6VqPKLLVt3yuqomywbq35lOiqHHeReGBGZXMeQ0meUXIjWppP
         49PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774922315; x=1775527115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh6+5wmxx4h3Bwis2Kw/KW78+qVVfu3FcQxTwX+HNrY=;
        b=ixDbtZ8d1F4o4g0zs+AHNWdt+1mtccINmdYhSOrPEMGZSHHex/DfHhxsgePznfuznR
         OKRNG1tmx8+OE5jEBJKi1n3dPfj3QhAqahkmAg2gcf1BxkjuiGTYzDrrkWfQFWkzK9Fy
         oFza/53y2fF/mNY9tIn9ZSU7qQmTGfA63CcBUoboL7jlqfweJp0P6vMKFGDJ8LFLy8Ge
         /jRqjRwsCtuf4RLWs+1iyE1MVCKj73NshVJn2dow+REleobvVT6Mh28GtDolwELoRMBh
         xbhUa+r0UN2LrOF7AL8oCL7nQBDdySLBVLKn9OE3xaPzZxGpHG2wvijYY5olF2qrfXHe
         xDAw==
X-Forwarded-Encrypted: i=1; AJvYcCUv4m8gD2m0SJzRD2J0Tha8WrhwtG913haPCZT4PbXMcyO3pufcltQ41HQfdrPirZP38CoKo2KJSJYq+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVnEhZnK0NQltMuhPSZxdg5wH996mAhTUHr1A60JfidYZbDnC
	mGJCMvTko4MBDJUfJny0ATtehhX2GAjtcUJuZ5w983N9LKMmirYMKMhxAqa4zj1RUuOJtibyRrF
	xmzILLRA6OsKHQPJkUXwH/zrADyXYD7Y=
X-Gm-Gg: ATEYQzyUeRYLxdH/XNpSUHkF8mQnUaawf14j32X3LmfYHLbfAEQD1BGg7feTYIVwdiz
	jR0tuu/JOIr8xTNm1Q7D8AnOrU2XbMHjZifPTQNG7dSZnJ1boLgbRu77QlDsnhrycq4oEy0TMjo
	hG0/4LI0iLT6kFlcfsmeC+y/pNpZOk+fBUzgxXMZOVYx0zeHp2pWrXMoAZBoB2MancGsfHFLS0j
	8ZGBLJg6WQGZ5WL54sdEbbKOaEWack/iOeVBn/f35JbFsVvM94dcdAEYc8gMQ1kwsIBXGdWbzeW
	lMz0IbI=
X-Received: by 2002:a17:902:e802:b0:2b0:67cc:adc3 with SMTP id
 d9443c01a7336-2b0cdc9c219mr159701135ad.14.1774922315057; Mon, 30 Mar 2026
 18:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
 <20260330112555.3637002-12-shengjiu.wang@nxp.com> <be591d2b-9429-43de-8d5b-357a503607d0@sirena.org.uk>
In-Reply-To: <be591d2b-9429-43de-8d5b-357a503607d0@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 31 Mar 2026 09:58:22 +0800
X-Gm-Features: AQROBzCFKjUeuTt4x-RIANuzLxPEbAMPhRw1tgOwlXSxX4RREqzkMd0fDbLrAY4
Message-ID: <CAA+D8AOsCg9ZO0f974Ds3Vev8uSVj52mano=vG+Rvrw7dJ8faQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] ASoC: fsl_easrc: Change the type for iec958 channel
 status controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Mar 30, 2026 at 07:25:55PM +0800, Shengjiu Wang wrote:
> > Use the type SNDRV_CTL_ELEM_TYPE_IEC958 for iec958 channel status
> > controls, the original type will cause mixer-test to iterate all 32bit
> > values, which costs a lot of time. And using IEC958 type can reduce the
> > control numbers.
>
> > Also enable pm runtime before updating registers to make the regmap cac=
he
> > data align with the value in hardware.
>
> > @@ -100,22 +130,52 @@ static int fsl_easrc_set_reg(struct snd_kcontrol =
*kcontrol,
>
> > -     ret =3D regmap_update_bits_check(easrc->regmap, mc->regbase,
> > -                                    GENMASK(31, 0), regval, &changed);
> > -     if (ret !=3D 0)
> > +     ret =3D pm_runtime_resume_and_get(component->dev);
> > +     if (ret)
> >               return ret;
> >
> > -     return changed;
> > +     ret =3D regmap_update_bits(easrc->regmap, REG_EASRC_CS0(mc->regba=
se),
> > +                              GENMASK(31, 0), regval[0]);
> > +     if (ret !=3D 0)
> > +             goto err;
>
> This drops all the checking for changed values that we used to do so we
> won't generate notifications to userspace.

Yes,  as the type is changed to IEC958, the notification is not
acquired by the mixer-test.

Do we still need to add the notification?

best regards
Shengjiu Wang
