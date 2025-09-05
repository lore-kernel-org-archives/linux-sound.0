Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266921FF33
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088019; cv=none; b=gGecTJWim6m4qSjk5wmHCqIZTPEaOqplSMweGRk3M2nMK0kO+SxwBBsllVBx+J1UI4m0vWsiR7eMAaxwkXhzsJQ1N7aiJc5XmazzY9WjkhD/jSl7TkETMvV2LJGyxOWpMCjlmMpD+isptwGahUru9gCc/6o8vczNt5TG+NMNALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088019; c=relaxed/simple;
	bh=yLGh2aJpg58ctmF2vT1+UHKl02h0pwM1dxLsuAV+Xxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njs5NxyEXZHk2x0DHi7p7PpaBnFw+fBesyMdVXCU7rkOd0q4DRhXTW1Mdx3peOikkmSntN/qsaXTbmh7TbrivxgNsLM7j5+AH3jaof/GELwsdE342NmZC6CgXAInNUvTGCR5B2qcWvL0K6i+MBxOF2Yh9QnQsx3n1pO3Fo2y28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M+LuUK4k; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M+LuUK4k"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-336dc57f562so21164901fa.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757088016; x=1757692816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bjDj52snoHgFyrFquY5QitOrzAfGlc1oN1n4B4vVa0=;
        b=M+LuUK4k9F5RMP1NeGYmvJa6pXH9GjaUM/eRfrIVVBaxAf43h2N/lKUQ8uVeghAzjk
         RczPkZpAzAflaq2hlSirbNmUV0NVDmTCVzfa9VeDRn5NTJmeBr5xiQoejyWdS1+h2eSg
         NfhknZVmH5jvHNpXYR9gX2ZIwm30xFFUpczQOkQiaktNRxijTydYSJJiULKrdUyjkooM
         e0ugfpaXdLd+S+fATdM3+PTeiv2kye3+PueGFhmuC4rb+tTYE3WdtJhVD7xQxmxDzPjo
         v/ehBjRcQ+xDmwD/fkCYfBIizVRxUfG5yPZl0Jm6knei7oR4KfeW7A0TYna2mULZmefc
         3+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088016; x=1757692816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bjDj52snoHgFyrFquY5QitOrzAfGlc1oN1n4B4vVa0=;
        b=bK7CXclH9N/wimJYJB7bWDkGm/rpyhvmo9x2I7wJ1O7HKsaiarbUnndcVhlYL4tF4G
         CdUPmBLr2S9CZ46n38Cu7Bgyyd9V88xWBOX0Wg0hijxmbIeuzznT+KmdBBGAUI8+XaMe
         BjuxYpylSmKC13F9YOM0ZYAv2QnMfV80lGkNL7ykxfjQQ9xDoyXmPdAyZYTOb3TqaaSD
         hw+1FaI7llymT3Rom3hJs1DheoTrI6e+R7lvGtnbA8S3Pc0Y0ilyKvlKfSG57tJhqRSC
         HR1gpmRxui/fGAVKg/bY4Co3XYW1pOB6nKl9AwENGPj2pshigOmLiBWmWQk5kXd7ymfH
         T/vg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Hpg/C8qwch917UqwQQcA2zPwrIQBb5AemGZA0yCP1p6dzpo0nbe7qgWiDKGu6VMc0KIBVdVs8HI9PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ30D0QzEIPVR7Me3Y0vOjwiRsS3lVBFXWVvir/CJcwKn5G95u
	Rrwr5MsVl+OTeZ8lvyS+umVIUx7c2KFfoWmEL7Ix1pIlbJlDn6fT3BSbMJWYuSiOQTGSDvKOGwD
	augeC2HimnkwK6DKYpI0nd8ocYwrqSeMXs1sfYd8HVw==
X-Gm-Gg: ASbGnctiFjdUfvYvkH8E/0mSSKuFvgnKxtD+XqK7ZYZZHY6sLyYs7zhiUoU19sxARNg
	0kBAmQU7soa77QQ23j1PdNha7IWUrkxzBAtUWS9MQcXj+KH4wxqy8X/h9LAuWMLs95cHBcfVM90
	T693YlszESIACAgkbozpgUCBwtp71jKfK2hP+N0PsNh/OZr/beioG5uqn0dic3GmhnQpGQcp0hv
	6Ww3dpK8d3+y7r0iXsjsKDLa2oqSFiNENLkT31F
X-Google-Smtp-Source: AGHT+IFWFllRqBJJC6vj9q5oW2+TpaBpQXiG5fJTfZV9kG0qNYRFPhtQblzR/7c8dDPGGPhKPRaGmeg605DhjF/ltOQ=
X-Received: by 2002:a2e:8a94:0:b0:336:ba9b:6472 with SMTP id
 38308e7fff4ca-3381e4da426mr13054441fa.5.1757088015869; Fri, 05 Sep 2025
 09:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905091016.109428-1-marco.crivellari@suse.com>
 <20250905091016.109428-3-marco.crivellari@suse.com> <54446af3-9ca5-4932-a3fd-e44185751dda@sirena.org.uk>
In-Reply-To: <54446af3-9ca5-4932-a3fd-e44185751dda@sirena.org.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 5 Sep 2025 18:00:04 +0200
X-Gm-Features: Ac12FXxBafT2_R1XPvXrTWyAtuMqsPHuT7Yz0bI48thuJ2QWyDc4k9UPqdjAzhI
Message-ID: <CAAofZF4XEFXWQEqeKJ3aTjPRuu5RgOEYRLX4Aeq=RGh7gnLGTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: replace use of system_wq with system_percpu_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mark,

The above change is just a 1:1 conversion.
system_wq is a per-cpu wq, so we only converted the name with the new one.
system_wq is still present in the code, for a few release cycles.

If the users don't care to be per-cpu, system_dfl_wq (the new unbound
wq) can be used instead.

This is just the first step of the conversion.

Thanks!


On Fri, Sep 5, 2025 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 05, 2025 at 11:10:16AM +0200, Marco Crivellari wrote:
>
> > +++ b/sound/soc/codecs/aw88081.c
> > @@ -779,7 +779,7 @@ static void aw88081_start(struct aw88081 *aw88081, =
bool sync_start)
> >       if (sync_start =3D=3D AW88081_SYNC_START)
> >               aw88081_start_pa(aw88081);
> >       else
> > -             queue_delayed_work(system_wq,
> > +             queue_delayed_work(system_percpu_wq,
> >                       &aw88081->start_work,
> >                       AW88081_START_WORK_DELAY_MS);
> >  }
>
> I can't tell why you're putting all these onto the percpu workqeue, I
> would be astonished if any of the users cared.



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
