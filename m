Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BB43EBF3D
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770938694; cv=none; b=I0N3Jk51v4ymEPSlNGFL5FeBvZFD21aXNaNOg6fqVEsyDReQN5NnMRjF3igKe2HQ9BJFrdBHG60jO3AXBr1pbwyP3H6V0hdIUfEn7QE0F4yc5eq0DS6Dlko3YsCmC9Fkfvzo4g73TG2dyi+KVo8lThpurfRleFbIoOe9EiM/Xwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770938694; c=relaxed/simple;
	bh=jTDU5G7cGunQKEkGurxRrFP6PlMJEvACtjaatPJUPOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqUcDVpAVjfwsU8dWcP6ohKg5Hsjc6xU/p9pckWZDHOJFgnQrKwSOVc461Ld8PTJ6lwNn8K2W85ChWHVKAsOTBbyFPLESZFI7HCm3aPeVNi9SG2G2FzmYlgayQ4+JrDoaAFMPlGKWsPjB5HtbVbkYTOkFjJ9WCjeRSAceKixtWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IUm0I1fu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IUm0I1fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770938692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzY+agXCqQxOyyksWZOqHWsVBeUJ5doZtZdtqHEE6zw=;
	b=IUm0I1fuqctmQcVl7SK0O5S6skfK8Y1SZettK8Nb9+jzZHvBGjQcrYidKrnn+ay0bf15hr
	qO5naOuN1K/rTbMM46HeybA1y6kLolfpbuGfkqW04L6O6l3xWGTs36DUMNKoQpTgxqn6Um
	o+mOKGly/lrOu7fFUzfhtE5tWg0KI6w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-OJ5WGgcAMlyQDQZM4UOLOw-1; Thu, 12 Feb 2026 18:24:51 -0500
X-MC-Unique: OJ5WGgcAMlyQDQZM4UOLOw-1
X-Mimecast-MFC-AGG-ID: OJ5WGgcAMlyQDQZM4UOLOw_1770938690
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b8fa5744b82so25469366b.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 15:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770938690; x=1771543490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzY+agXCqQxOyyksWZOqHWsVBeUJ5doZtZdtqHEE6zw=;
        b=gljzhIch4SMayYWVK+k2WlqYMN7xk8pGqNiV/9gam5c96uloqJge3pSR0o6XAqaCRc
         pj0t3Z7MlCV7b8BEccJ7t+gCDp7wQ2UAPkI356Ae8EkGuimI3CfZDm7XBvz8d51SHo5k
         lEzgTvPb2mKdK/APeQ6LUu+9BpSOCS156dXn6jh+PMEopldUg0TXaKY4zME6sYIfUJnU
         BbTCa1oNR0d6/UJTTqJQqOAW9BZnBlqPNKwAR2ZXALkP6qM8Sp1gAs24/RQ8dLwEVQeC
         +vuyv/Y5Q7viW8XL4HSKu/ycbEr7/Acm24yhkLV6kIquRotUH0GQNnc13eesXFasZqoI
         bC4g==
X-Forwarded-Encrypted: i=1; AJvYcCU9thX1fRQdMCxAgYHIbklRrcBJUpnT/cOF/TQLvqzVGP4DEdIrFfD/VFwvf+U3eisYyisSnbcvniigUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBdtJSOJM1NJuk/KgpdFU2a55eVOVJod/8vdXAxaXs3Pzk1YN
	61VRdAmANTGWv28CUlpUyQRV6d/FfF1mgTo+PTB3EGZPEy4J72NLgqUiFk7g757ZqamTdGIfgdi
	HIK7mkRGGKP6HJ5v6JZeE9uuMll8LA2uecGchvdkrdv/2SvLCWPhmICE7zuHgEphGVvEDcQWcyi
	Sy5elX+Snei+b9LprTn9TsgGqWroafjySxw65YLlQ=
X-Gm-Gg: AZuq6aK/ES4mMvN6rOC+Z4h/1GrY4kJ2V77u9HCkJqnTbTYUtoWu13IJCLfDvl0RZzQ
	lLqwhZHTljYcPE/Fs8/S+qHiiiK8smAd0QiqW05Eq+EadkETmGsi41hpW7w/LPkMWO/WJPmRsNk
	gANO2fUth6ktqJbgz6QKjH7h5P0hi0x73a742aZDrAo+24Jm8egQTEj8/FnTkC6LcShOyrwQzW0
	t1NtLDwr3m1SRiKwXDejakUTJADoG6uYc/q6XDM
X-Received: by 2002:a17:907:c0e:b0:b87:7485:b4bf with SMTP id a640c23a62f3a-b8fac8b91ecmr35964966b.0.1770938689800;
        Thu, 12 Feb 2026 15:24:49 -0800 (PST)
X-Received: by 2002:a17:907:c0e:b0:b87:7485:b4bf with SMTP id
 a640c23a62f3a-b8fac8b91ecmr35963266b.0.1770938689315; Thu, 12 Feb 2026
 15:24:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212191416.3723397-1-tim.bird@sony.com> <CAC1cPGzabh8d0MQ52d4iPfWdVG731Js8JmdPhu_dMOx9kOt5Ew@mail.gmail.com>
 <MW5PR13MB563268BC53570D4C8D3ABAE6FD60A@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB563268BC53570D4C8D3ABAE6FD60A@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Thu, 12 Feb 2026 18:24:38 -0500
X-Gm-Features: AZwV_QiaAhOX2ib-qxnOQd9MTXHMILUMvZWBpJCDlCnZbbCn5hDEYi-Tc6XWoe4
Message-ID: <CAC1cPGyh140A=0cwCWVecCOqQFLHttXkpi554pjFVBb7+6J21w@mail.gmail.com>
Subject: Re: [PATCH] sound: drivers: opl4: Add SPDX id lines to files
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, 
	"clemens@ladisch.de" <clemens@ladisch.de>, "tglx@kernel.org" <tglx@kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kate Stewart <kstewart@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8LEMsedXESYbH6wTNeGyAgHwW-Lxm80OXAthlcxqFzA_1770938690
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 4:13=E2=80=AFPM Bird, Tim <Tim.Bird@sony.com> wrote=
:
>
> > -----Original Message-----
> > From: Richard Fontana <rfontana@redhat.com>
> > Sent: Thursday, February 12, 2026 12:29 PM
> >
> > On Thu, Feb 12, 2026 at 2:=E2=80=8A14 PM Tim Bird <tim.=E2=80=8Abird@=
=E2=80=8Asony.=E2=80=8Acom> wrote: > > Add a license file to reflect varian=
ts of BSD licenses, with the >
> > first variant being a BSD-3-Clause license modified to > remove clause =
2 (attribution
> >
> > On Thu, Feb 12, 2026 at 2:14=E2=80=AFPM Tim Bird <tim.bird@sony.com> wr=
ote:
> > >
> > > Add a license file to reflect variants of BSD licenses, with the
> > > first variant being a BSD-3-Clause license modified to
> > > remove clause 2 (attribution on binary formats).
> >
> > > diff --git a/LICENSES/deprecated/BSD-variants b/LICENSES/deprecated/B=
SD-variants
> > > new file mode 100644
> > > index 000000000000..83f24d68fb87
> > > --- /dev/null
> > > +++ b/LICENSES/deprecated/BSD-variants
> > > @@ -0,0 +1,32 @@
> > > +Valid-License-Identifier: LicenseRef-BSD-variant1
> > > +
> > > +Description:
> > > +Here is the "no-binary-attribution" variant of a BSD license, number=
ed
> > > +here as variant1.  It is a standard BSD-3-Clause license, with the
> > > +condition removed for attribution required in binary formats.
> > > +
> > > +License-Text:
> > > +
> > > +Copyright (c) <year> <owner> . All rights reserved.
> > > +
> > > +Redistribution and use in source and binary forms, with or without
> > > +modification, are permitted provided that the following conditions a=
re met:
> > > +
> > > + - Redistributions of source code must retain the above copyright no=
tice,
> > > +   this list of conditions and the following disclaimer,
> > > +   without modification.
> > > +
> > > + - The name of the author may not be used to endorse or promote prod=
ucts
> > > +   derived from this software without specific prior written permiss=
ion.
> > > +
> > > +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
> > > +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, TH=
E
> > > +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR P=
URPOSE
> > > +ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIAB=
LE FOR
> > > +ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTI=
AL
> > > +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GO=
ODS
> > > +OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION=
)
> > > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, =
STRICT
> > > +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN AN=
Y WAY
> > > +OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY =
OF
> > > +SUCH DAMAGE.
> >
> > As far as I can tell this does not match an existing SPDX identifier,
> > though it seems to be pretty close to `BSD-Source Code`
> > https://spdx.org/licenses/BSD-Source-Code.html .
> > Might be worthwhile for someone to open an issue in
> > github.com/spdx/license-list-XML to add it.
>
> Thanks very much for the info and suggestion.
>
> I looked and didn't find an existing SDPX id, so I ended up using a
> LicenseRef-...  ID, which is not ideal. It would be better if there were
> an existing ID I could use.  I agree that BSD-Source-Code is a close matc=
h.
>
> I did a cursory check, and found that this style of BSD variant is sprink=
led
> around in other kernel files as well (at least 10 more confirmed, and may=
be
> up to 50 based on grepping without closer review, yet).  So this BSD vari=
ant
> seems to have been popular at some point.
>
> There are a few (minor?) wording changes between the different versions,
> mostly having to do with naming the author or organization to exempt
> from endorsing the product.  I'm not sure if legally it matters if the ex=
act
> entity to exempt is named or not, or if "AUTHOR", "ORGANIZATION" or
> "CONTRIBUTORS" is sufficient.

I submitted: https://github.com/spdx/license-list-XML/issues/2940

Richard

