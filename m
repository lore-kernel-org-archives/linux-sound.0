Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44501DE8A4
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920120; cv=none; b=dCBvPGGPzzn7rTJCRODLV9eKf+4pMEPIA6HVLrULhc8TEqO92JRygeRfw3XZr/QOgWj3btWr4n9vU4dNeV6NE7zHeiiIcJOkCfWArbbg1kVOjNJdplvlLATWL+4tx3485dgHPvon3kbiT+C6VY93YXaqAlbkFAjBH6/yImxcPg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920120; c=relaxed/simple;
	bh=RfbSfjINgNk+KIwhm8ycWoAdKTiJ0fFRB2w72BkSG9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSFilGUmZwaHgd7pdw6XJ8GkVA4nsjCzQLB+2y2zZPzltqvHFnTGxliWnttKSi5sIgwsvP/XGq+sDIthcaU9VjWI/rvg5yW2Anne7se2ucRSf62aA9/fO57/sMEZYgmOcrILCmG67t8Eh1RFyKzpsqS/KYIByalokIYuerPoTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXIrCE/2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXIrCE/2"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c2d72582cso3847915a12.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761920117; x=1762524917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYsX3dXvtTLPwG3M/sH5RR0fEhEx/a2A0niUgfDtB7c=;
        b=aXIrCE/2jm8S4JGyTj245k+VqvoKp7lF4GCKd/oX85kgPoFb3Ku/LcARWm5vo/iLp+
         mZxv6n7K+k0/rDNyND+nD3+QmLh9hAgfL38TTedz1ddtdew2JToO134yVShlKCZk6sLB
         SZjrTaE9gOA3ZW7LVzHKJMm0H5GHNXnkadwaZ3Bi2js3THwrMwvJ6dDz/UquXCSehYCs
         0I4sjSzsf6a4Nh09SwMkw42g1TZF/Y5e18NkgHAlwPPz67J+/KpqnZqI+zYrFL6Ks0f2
         ETkkzrJe+hvAHgksSFGd//NEgsdUR6PPHfcNkZOBX6D40sU4Qf0H0oIlh+ynrDmA1mXu
         A6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761920117; x=1762524917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYsX3dXvtTLPwG3M/sH5RR0fEhEx/a2A0niUgfDtB7c=;
        b=fSWcE5CSfZytfiI7+6KymLYNeSA7kmC9pwIl29oCvk6xU0vF0g4HJV6T9PdLuLEkMS
         XiQBqeXWjtTFufw3J1QTdBTxvrr272NzHJtb/Me6IBRvjm1xXHa0u9LuKMFe6L3lATja
         5bLBurSeeMRGlek/TlQ24KjeSWLpRx87f5CNBz6WPrsJiSuCYnvIMlswR3hzgA3TRdwe
         aKk0+VBO//Hju8t+Zq0suduSiRzf+ww3voei6VVZNPlWep3H5Q8JrjhDZNUFcwOKcDge
         D8jqR2Yn6uRZ1ilWawhq7hYShRYm7qNwKl4wkBwClW+iMep0A/ozTCwo6M4fPTP9PHId
         hbew==
X-Forwarded-Encrypted: i=1; AJvYcCVVhVfJ49VoQeO8LM2l2HbCCsa9fUovpytO6A36qAl8VpwLhAfn6rxMWgKyLucYYflvsEfQfrNj6Z7b7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzED4DjCbzo+UO6XyZ7p6Sod7uiRFq6eG8pLMFLjPyYUUDWK+Gz
	JFjA38jOnSU45rcTgDo8P/2XzF6AuOq5Rbc/o3Lxr+LcONvLoNQObd1m9tjw4janCUpOXjJU1YR
	+tPSdUaAZ60K/E/QHt2x0fQPze8cfWF4=
X-Gm-Gg: ASbGncvNhUg6cqqeig/L3gBaiNSo8plLFenM7n1g+VAfIB6k0VAgDbu7RbFVcCRRmZ/
	WYRQ6pVAWa0MmTHQWx0aebw7tkDJ2wz6JnaWXOsiqM5tMIgFnxISLTRG5b1PCFlU0ftOCvHnwH+
	x11Ert9PpTC/b10jEG4Be9zGA+pc5nmsIEERwEnG+yxNdCz1hzDO/697WfIdWdoLswDqJS1TePY
	nwYrA5ctIc8qI9z+oIEVHda2nPAC+dA36iKR9Sb8Bts2tVdFs+w4KxMoO4D
X-Google-Smtp-Source: AGHT+IHCoMYa3G6T0j0Lwg3aXNYQKN1oVik+PtSFNAWANM/X1vB53TmrMd1fdfWNGyBVzHkp5GN4Wj+zYmrBBjKjOxY=
X-Received: by 2002:a05:6402:4314:b0:63b:dc7d:7308 with SMTP id
 4fb4d7f45d1cf-64076f66b7emr3214619a12.5.1761920116612; Fri, 31 Oct 2025
 07:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2daa603f-13fe-c803-17fc-4fdd8e5723ba@gmail.com> <87ldkr36cv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldkr36cv.wl-kuninori.morimoto.gx@renesas.com>
From: harikrishna <hariconscious@gmail.com>
Date: Fri, 31 Oct 2025 19:45:04 +0530
X-Gm-Features: AWmQ_bnT3bfpqUrnEdxX-SgDqm70z_JJkkRze91XfXQ4PqGozK-YlIywu8eTu9I
Message-ID: <CABBwEEh7gjMPi8dybAcd_4rTT0ZJU=zi99ahSgdzCAjMtL6zdg@mail.gmail.com>
Subject: Re: [RFC] ASoC: soc-core: proposal to remove num_auto_selectable_formats
 from snd_soc_dai_ops
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	shuah@kernel.org, david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:28=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi HariKrishna
>
> Thank you for suggestion
>
> > I=CA=BCd like to propose a small cleanup and simplification in the
> > snd_soc_dai_ops structure by removing the
> > "num_auto_selectable_formats" parameter.
>
> Do you mean like this ?
>
>         struct snd_soc_dai_ops {
>                 ...
>                 const u64 *auto_selectable_formats;
>         -       int num_auto_selectable_formats;
>                 ...
>         };
>
> > Currently,snd_soc_dai_ops includes the "num_auto_selectable_formats"
> > field to indicate the number of entries in the "auto_selectable_formats=
"
> > array.However, this count can be derived programmatically using the
> > ARRAY_SIZE() macro wherever needed.
>
> If my understanding was correct, unfortunately we can't do it.
>
> We can use ARRAY_SIZE() in each driver, because we can access to raw arra=
y.
> But can't use it on ASoC framework, becase auto_selectable_formats is jus=
t
> a pointer. see how ARRAY_SIZE() is defined.
>
>         --- driver ---
>         my_formats[] =3D {
>                 [0] =3D SND_SOC_POSSIBLE_DAIFMT_xxx | SND_SOC_POSSIBLE_DA=
IFMT_xxx ...,
>                 [1] =3D SND_SOC_POSSIBLE_DAIFMT_xxx | SND_SOC_POSSIBLE_DA=
IFMT_xxx ...,
>         };
>
>         // We can use ARRAY_SIZE() in driver, because we know raw array.
>         my_dai_ops =3D {
>                 ...
>                 .auto_selectable_formats        =3D my_formats,
> =3D>              .num_auto_selectable_formats    =3D ARRAY_SIZE(my_forma=
ts),
>         };
>
>         --- soc-xxx.c ---
>         // it will be error, because we don't know its size
> =3D>      int num =3D ARRAY_SIZE(ops->auto_selectable_formats);
>
> Or do you mean create new macro, like this ?
>
>         #define ASOC_SELECT_FORMATS(array)\
>                 .auto_selectable_formats        =3D array,
>                 .num_auto_selectable_formats    =3D ARRAY_SIZE(array)
>
>         my_ops =3D {
>                 ...
>         -       .auto_selectable_formats        =3D my_formats,
>         -       .num_auto_selectable_formats    =3D ARRAY_SIZE(my_formats=
),
>         +       ASOC_SELECT_FORMATS(my_formats),
>         };
>
> Or am I misunderstanding your suggestion ?
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

Hi Kuninori Morimoto,

Yes, you are right.
I have got it now.
We can use it in codec driver not in framework.
Thought of changing the type of "U64 *auto_selectable_formats" to
"U64 (*auto_selectable_formats)[]" and removing the
"num_auto_selectable_formats".
But cannot be used to get count. Apologies for this.

Thanks for the guidance.

Regards,
HariKrishna.
