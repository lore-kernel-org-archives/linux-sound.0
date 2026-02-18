Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3310348896
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771444663; cv=none; b=cn5ISIHqmQOG/qtX5AfMiU+bs1bKIyAP5KvNnJf6LZOm1heMd+unWpRnUo6FhpNyj1NkuHEbxoL3x1xH3F806apy9Pt6z1YaiVIkE4MOHUFd1Y10FgV8K1yAKyFrITzfVx0QbtTfyjh5GPGBQmKgFH08iO9zWydaQiaNL61BYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771444663; c=relaxed/simple;
	bh=lUTS8zPKws8nY73eISiHrGdf7yfPiEJjrSLQV1g2j60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDd3bIVDA+ddr6SycIyYTB9TCgKmXpdiNcaHQEbjfkdKH+TNtLtuyVqHdDKnLUZ1vGxTAY03GPZ8FniznFmZEHjJaqIoEzEM7B3VSR39Jg9pvrK6TpzbJ6eR+6FEDHeZbkJnNOUau7C0nRS0rTqGR+Y6+VVLFQBJPqUsd9pkRcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SvIeGKr+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SvIeGKr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771444660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZzW/yhY3eGlsLhsmWOqNa6wr0a4WRr9JQH/5fVFlsVE=;
	b=SvIeGKr+auM2I6gY7k/IT8JzIgCbtnwi0vR5J1I+m6cE7/611vWq05aFRaTa8eXNsM7DJ1
	JZSeRIduMyTj4uWq7TWlgYgQWT4hMCeVc7iBrAmKC6Rm/JElFnoS7vO/lVF43hOaBDn8lT
	kR0kJMt9K2SnwUE2uygCyoFyTcATIbs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-rsPwViaHOd-uSgF_HAyfbQ-1; Wed, 18 Feb 2026 14:57:39 -0500
X-MC-Unique: rsPwViaHOd-uSgF_HAyfbQ-1
X-Mimecast-MFC-AGG-ID: rsPwViaHOd-uSgF_HAyfbQ_1771444658
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-65b9db0c150so120036a12.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 11:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771444658; x=1772049458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzW/yhY3eGlsLhsmWOqNa6wr0a4WRr9JQH/5fVFlsVE=;
        b=pjOm3ldM33b6HzC8+EVLSEYRwxYe+E6S9Kz7rHP3jcDxoZI7Hng28WIxVQgJKUSHBA
         zifBeyFWG9gYucc94vwGg75tAjIqduVIbQq7hFlAlVgEy4ZEj24YQ73GHRoBku2nK3Xu
         zAmoO6ajOKW/i7z5h09KkTSS740wbwjybBKADRlBdcWxAOuZSma6FEjBt7cKIGR0o2AG
         GvT/PbYn9ZYPTmIW7Vegp/sDFZe1qwFpvwzDRioUkgnfvSK3LE/E3O/+RsDzSG+A4Dvb
         cIpaMpaATbqhNdKIDvaelz/0vhkB6BgnTSRj+bHe2IwZenaKLRCO1fpnI9enKIntryp/
         ah3A==
X-Forwarded-Encrypted: i=1; AJvYcCV+dAG5NdaAjfA+Np4/iuVBB98OkBe7Gm/CFOGVJcgb++tGVwqw95dLgWPFiW21gutfgX1mIwsitwsYlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7M8CVTmb8ABexGtlnQFULvn5fcJk0uvN0mK1TEwAynn0ETTMy
	9whSns/pnmSVeAHwHB6Eezv8IJtvQKGoBoiq0pUoMrxfZec+477iJzrDuSMErmi6eke5h4YwS8n
	HimYmuZi749wJmBbYte0W+y6FPijUDZKnGRjKJzooSnurI2pnG6jlg0xshdlJqgwX5/sVJtqUAp
	KyI704m2CjEoFXQNkL7CpadAJ6vX4xZ/seX8Etz9Y=
X-Gm-Gg: AZuq6aIoMxX2Q5vEE0V0hlfCBwmAEzy7UqLw2CZBwCRKYlRZwAGfiITG1yD2sOLp0gr
	D5HQwqgv13ceMK9u8SFsH5eeHxWTl+/yyPrKAwnNokp9TIrHz5sPbizygXxCSBLdGu6X9v4MPZk
	yz2KxWRV+LONNvZ1DzSY8DKFMT6aran4uYmhiflz7Uwy6IVVkGib3yvQDyVThKnlXvYliHThb7d
	+QMhADuRDIp4EMXCBT9kkdUTX7fejfTp14xdA48
X-Received: by 2002:a05:6402:34c3:b0:659:4099:877 with SMTP id 4fb4d7f45d1cf-65c766de833mr1718116a12.0.1771444658262;
        Wed, 18 Feb 2026 11:57:38 -0800 (PST)
X-Received: by 2002:a05:6402:34c3:b0:659:4099:877 with SMTP id
 4fb4d7f45d1cf-65c766de833mr1718101a12.0.1771444657716; Wed, 18 Feb 2026
 11:57:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217232230.241142-1-tim.bird@sony.com> <CAC1cPGw=rRQufzodjtfA8YQt0+1u_AtcFw1PxM_Ldqkrj_SiBg@mail.gmail.com>
 <MW5PR13MB5632BEAEA246600D8FB90661FD6AA@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB5632BEAEA246600D8FB90661FD6AA@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Wed, 18 Feb 2026 14:57:26 -0500
X-Gm-Features: AaiRm50_JIq2WMD9msvUTh-EmjtP8xZQlCehVoHIwOpojODIYbmkQKROb2rM3Gw
Message-ID: <CAC1cPGzpydYtv-KwD7b9hrM0bJuMk4YPsosvQe=RBgsOxHOoSQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 driver
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, 
	"clemens@ladisch.de" <clemens@ladisch.de>, "tglx@kernel.org" <tglx@kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kiY4uJFW53OWgaUkd48zsONkmKrPhwFH4mtu6IQ9lLI_1771444658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:48=E2=80=AFPM Bird, Tim <Tim.Bird@sony.com> wrot=
e:
>
>
>
> > -----Original Message-----
> > From: Richard Fontana <rfontana@redhat.com>
> > Sent: Tuesday, February 17, 2026 6:12 PM
> > To: Bird, Tim <Tim.Bird@sony.com>
> > Cc: perex@perex.cz; tiwai@suse.com; clemens@ladisch.de; tglx@kernel.org=
; gregkh@linuxfoundation.org; linux-spdx@vger.kernel.org;
> > linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 =
driver
> >
> > On Tue, Feb 17, 2026 at 6:=E2=80=8A23 PM Tim Bird <tim.=E2=80=8Abird@=
=E2=80=8Asony.=E2=80=8Acom> wrote: > > Add a license file for the BSD-Sourc=
e-Code license variant. > Add
> > "SPDX-License-Identifier GPL-2.=E2=80=8A0-or-later OR BSD-Source-Code" =
> to files using this license
> >
> > On Tue, Feb 17, 2026 at 6:23=E2=80=AFPM Tim Bird <tim.bird@sony.com> wr=
ote:
> > >
> > > Add a license file for the BSD-Source-Code license variant.
> > > Add "SPDX-License-Identifier GPL-2.0-or-later OR BSD-Source-Code"
> > > to files using this license and the 'Alternatively...' language.
> > > Remove the boilerplate text from the files.
> >
> > [. . .]
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
> > This isn't (at least not currently) `BSD-Source-Code`. See:
> > https://spdx.org/licenses/BSD-Source-Code.html
> > and https://github.com/spdx/license-list-XML/blob/main/src/BSD-Source-C=
ode.xml
>
> Yeah.  I used the wording from the files in the Linux kernel.  There are =
about 3 variations of
> the wording for this license that I have found so far.  I included the UR=
L for the SPDX version
> in the kernel's license file in this patch.
>
> Here is the wording from the SPDX site:
> -----
> Redistribution and use of this software in source and binary forms, with =
or without modification, are permitted provided that the following conditio=
ns are met:
>
> * Redistributions of source code must retain the above copyright notice, =
this list of conditions and the following disclaimer.
> * Neither the name of Deusty nor the names of its contributors may be use=
d to endorse or promote products derived from this software without specifi=
c prior written permission of Deusty, LLC.
>
> THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS I=
S" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, TH=
E IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOS=
E ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE=
 LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQ=
UENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE G=
OODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) =
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT =
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY O=
UT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH =
DAMAGE.
> -----
>
> While there *are* textual differences, I believe the two versions of the =
text are semantically equivalent.
>
> The one in the patch was submitted by Clemens Ladisch in the original opl=
4 driver submission.  I haven't
> done an exact count yet, but I believe this variant of the wording is use=
d in more places than other
> variants in the kernel.  My preference is to use the wording variant that=
 was most commonly used
> by kernel contributors, so that the kernel's LICENSE file matches the mos=
t places where the license
> text was replaced with an SPDX-License-Identifier line.
>
> I've been trying to avoid having to make a kernel LICENSE file for every =
minor variant of otherwise
> semantically the same license text.  I believe dealing with this plethora=
 of license variants is one reason the
> SPDX work stalled out previously.
>
> Let me know if you think the text in the kernel's License file  (for a gi=
ven license) must be an exact match
> for the spdx web site text for the license.  A separate question is wheth=
er it's appropriate to use the same
> SPDX ID for variations on the same license text.  I believe it is, in thi=
s case, but I'm open to hearing
> other opinions.

Based on your issue
https://github.com/spdx/license-list-XML/issues/2939 I think you know
this but for the sake of others: The issue is that from the SPDX
standpoint, the identifiers are (somewhat) precisely defined.
`BSD-Source-Code`, for example, is specified in the XML file I
previously linked to. SPDX has a more informally defined notion of
what it means for a real license text to "match" a given identifier,
mostly discussed here:
https://spdx.github.io/spdx-spec/v3.0.1/annexes/license-matching-guidelines=
-and-templates/

I'd suggest perhaps waiting for SPDX to resolve the open issue - you
see that Steve Winslow seems inclined to add a new identifier for this
variant.

Richard

