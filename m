Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279E3CDBA4
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840434; cv=pass; b=EZ2WapfNPoZKOOuD6IDYEtO62w+FSb8Va/PIUHE263ko9L+YB+OrC/VZbO4N/Uo7i3RmM7Yrb/2jwaAVNO02TSTRhG/n3LdnlpBxyIIqzcEcjHiA4qklnlzW+PNxj+efrySgOltHPXEM6/hghsWqxG5T6fFngsStIJcOYsJVfC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840434; c=relaxed/simple;
	bh=GzrjWv00pV8g6pjr5FIMQp5/COnJUdT5thugdZxFpFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRwfyN3+3Q1HpZawNmZL7JTDp+vADTbTpOohEOayg5rBirqbO9r5veVpWsF31bRJ/VaxmSmgy5SX3OR8N5q/XGsJzaxxhtfC1XkikdcdeEne1oLzVpJPh+/xhddtvXu3zMi/5RiVtzdic8NpUPRqOU39OwMIHpcqMBhWJFtvZMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSZ9Vt1n; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSZ9Vt1n"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so5413933a91.3
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 03:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778840433; cv=none;
        d=google.com; s=arc-20240605;
        b=ehrGkxV3//zApr3VctuIg1D/a1DRnkrSCYHTnS2wk4jRJLaK/f52Ntne/jHrMn62LB
         ZybE0NuGHbfgjkAembczYeBMJsmLMQlVbaKUEIRU5xcXdp+da5LbMc5j9iHFIjxUPKHu
         6HKmLA/t4HNV7VNuCIcg8GEkrPFSo9fMlS8/93HYEe27T+J8Gi44bLms+HEeCOhYsSu8
         Y+FOYBBK25+I7Mxm6/ENhTGyrXr1P+vfcYTtmEo80ijyDweKeLeTmgdyUQgCqWEHVrOy
         zZjkJKqhuz4R4N+GdWsUc1Q+37Y0pBhGhPikmqA7TiOXfGRJE/zcIWbGxeqD/vQWFLf9
         w9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        fh=GPv9+OyA8egwUJHsqjfTNpFdEixlQKrAtPBYHbTvp8Q=;
        b=fHEJ5KDmPVN3NHQ0k6e2+324sFlr8a89Mex2hPpB3Ze6kbUC/4kmDC+nWnyEJ73/J7
         e7tssMKTobUcHfHZWoc4fOaHfWJ0p26gWjIyf1UcfMzlTjSJCmyuQTCvnPUS7WMDa9hX
         As6k6C5VlM4aZWk/8BNJB/wrVwIrwGZ4WdH8ueUL3Pvo8eRaklWOlIs9Db0fT15M/bcv
         5SdaXXyKLxnD9wDue+SvnOtWqmQXoLqkRJ2Q8v7baQ6KYpcWoxlufpRn9RoNkbH9r7qK
         +gykh38YptRwyndxQcHX2vUco9z9IdAnyFDllE/fi5gWNKjH4Hi7s62WXdhl701Njgj2
         DAJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840433; x=1779445233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        b=jSZ9Vt1nguhgjqU41EKiXWmik5wjP5Ua9CGnLSMQPmRYyWHABatzlnrdGzbMcyWZ3K
         wGcAZjZLBkcJHPvJKAQq0zsGFfM3A38mZq112WfkOmNM+zc2zmIJ7wdPICVI/Go701nP
         tuyqY2g7W2UWRRAv6DQq/DQeLJd4eOTQ0I2RKkx8QcYfabeC4p/elDg9BJjlFEim9Q+S
         +jLwzrXgCn8ykQJywAl+sRg3gSHxrZmBmZtKAah1DAyJbzvBFNNhk0lCgBpg3m3Wmlf1
         X0AnEULfdcYs6uydjezJMDbicGJPBF7pcgd1ttbWCQUkJMstOSHmWt5f2bdXTxgBFrEu
         ZEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840433; x=1779445233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        b=FY6NYxyNJo9lDGdqK5TGoe6KMNV+IwGIo3tW6NMgY68S+ANjGG7lAOD1EmGqxB4qbZ
         MNsid2kHXc7OTYcz+8hrQ9DRIoiX+rQxKRhIyd0Fj53rZR8Z3Tlh3drd9zLPqXvAsxKh
         zWGVGLMS+XHEm5qL+n3yY5mWj4GPKCasBriFJj2M2syXv9sNyShLMUmyjKp7OP8VtOky
         Uj01m2Ses5q0WRB1msmWGO7+ptzWImKneBgZBDZHGYkl3KlSu8Y2VwtHvRI3j1PbsF70
         w1HXJObB9hygaY4Sl8zryWZxTdeFL+DzkTE3Y4pQLwp+ZhoRZ9DUBYyjqnx8QBexuJ2S
         IC8g==
X-Forwarded-Encrypted: i=1; AFNElJ/pRhMnDIIBEmHAs5jp4//VevP5KpAldYCdL2l7wIKWO5Ip2paKCvTckjZBHD4z4BTYXKHTq4dporSMaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNA1RJWLwWbNNkS5F87fE6PgRInXUR9Xz9d+gt2/XJP6Z7fi/
	MMgfs4Y1Jv9BD4Aj6836vFHIEOdYOe8jRKcXhGeibrmrM9UjEg/Syjx43NBOffgiRtWssNGGTWV
	t9NYRCL76IzVByNwzlzNzrDcxOoYL2lw=
X-Gm-Gg: Acq92OFzo7a0nuKbXFwl3bUgUjtKqmWwgdgxY6NhWnpMfx3rO394Nr/s174jeoL0v7D
	ZIlP3bvnI2tv5iCdbUowyJ4Nl6RIXJUc1BSpPql85vUQPCeshru0JC78JU0GUvNQqmP9S2JpVe6
	N/vlRk0E/tlbQcqsL9QA2vAcQ6TMPEO8lWeRKnXWWw1+iu/7QCVzg2VgNTZ64nfTzmzU26ag2+T
	ExjkzrDu1a55wPOPSaQV90uiGBV/Pym1CozDzSxB58XioP4XFPLhK9/jo2zwcttjxGZIvmzKIbA
	EKfAtTd4KVpMN1vlfOyROdgRbtn0qj4sCaQpGA==
X-Received: by 2002:a17:90b:4e86:b0:366:527:3c9a with SMTP id
 98e67ed59e1d1-36951b70055mr3660995a91.15.1778840432444; Fri, 15 May 2026
 03:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <20260515-transparent-calculating-ocelot-bdec04@quoll>
In-Reply-To: <20260515-transparent-calculating-ocelot-bdec04@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 17:20:20 +0700
X-Gm-Features: AVHnY4Lh5KBPxyvblSfmA-i77za6m-1v7JQnCckex2TWg9DTYm8lzeb1pEDNacw
Message-ID: <CAABR9nG2YFq2kNsXbCe-7XUNJT94rUMBz6hruC97aE6JFSP9CA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, 
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	magnus.damm@gmail.com, perex@perex.cz, robh@kernel.org, tiwai@suse.com, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, May 15, 2026 at 1:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> > The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled befo=
re
> > accessing its registers. Without this clock, any register access leads =
to
>
> But why are you adding all these clocks to sh73a0 as well?
>

The FSI IP and its clock management seem to be architecturally identical be=
tween
these two SoCs. For instance, both sh73a0 and r8a7740 use the exact same
register address 0xe6150084 for the SPU DIV6 clock control. Therefore,
it's highly
likely they share the same bus dependency for register access.

If there are further doubts regarding the sh73a0 internal bus topology, per=
haps
@Geert Uytterhoeven could kindly double-check if this SPU bridge clock
dependency also applies to sh73a0 as it does for r8a7740?



> >   - CPG DIV6 clocks (icka/b) as functional clock parents.
>
> You do not need to add parents of clocks.
>

I see your point. I will update the description to list icka/b simply as
'functional clocks' instead of 'parents', as their hierarchy is already
handled by the clock provider.



> >   - FSI internal dividers (diva/b) for audio clock generation.
>
> Internal dividers do not have representation. They are internal.

I see your point. What I intended to describe was the internal divider
configuration for Port A/B within the FSIDIV block, not separate clock
representations in CCF.
I will rephrase this as:
DIVA/DIVB divider settings used for audio clock generation.

In v1, I brought up this FSIDIV topic with Morimoto and Geert.

>> By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
>> In the legacy implementation, it was handled here:
>> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
>> Currently, this has not been ported to the Common Clock Framework (CCF) =
for
>>R8A7740, and it resides in a different register range from the core CPG.
>>For v2, would you prefer that I implement a small clock provider for
>> fsidiv within
>>the FSI driver, or should it be added under drivers/clk/renesas/?

> I think it should be under drivers/clk/renesas, but Geert ?

However, I haven't heard back from Geert yet.

> This cannot be flexible.
>
> > +        - fck  # Main FSI module clock
> > +        - spu  # optional SPU bus/bridge clock
> > +        - icka # optional CPG DIV6 functional clocks for FSI port A
> > +        - ickb # optional CPG DIV6 functional clocks for FSI port B
> > +        - diva # optional Internal FSI dividers for port A used for au=
dio clock generation
> > +        - divb # optional Internal FSI dividers for port B used for au=
dio clock generation
> > +        - xcka # optional External clock inputs for FSI port A provide=
d by the board
> > +        - xckb # optional External clock inputs for FSI port B provide=
d by the board

There is also an ongoing discussion about how strict/flexible
the DT clock constraints should be for FSI in this thread:
https://lore.kernel.org/all/CAABR9nEhOTz1-0NmCMTbz=3D-+782Pto0yovSQhBXrXqhL=
wMg80Q@mail.gmail.com/

Geert and Rob have already shared some opinions there,
so it may be useful to continue the discussion in that thread as well.

Best Regard,
Phuc
