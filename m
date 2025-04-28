Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0C1DB124
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872606; cv=none; b=QrLUDXFKNomRipb9VuSbVf/0niQClH2ELNCwYE1m2SfDOEGdhEH51Cu2jVT+Ky8Act/s0Zd0jYYEBakh2W2421xPuQFt0yGINF4Wxai661YiVayLtdSKrnO5I4NH3tM3DT+1rf99hbj4atdeVtH/YXYan7JWoPZmJ+40zjZrWOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872606; c=relaxed/simple;
	bh=H6Fz18QFVYxY0WeCcbQqjhoPHzP28Sg5jc772C0ExaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubhYKQgsajQQhHkVn3invAg82s84ilFxZlDj09MOCnmQ1w9VD/sRma0gGM7Ijk2ll1JRjmH9brLQjWU+5jXoqM8D7B0CGF7nTkTX0a1cCH7zyk2Gkgsq7+4zZLFIzFp4dj/7IAGk9egYYFfmcKof10CLiKeuNxq0Q1xmdPS9Fcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=Y5M7OAra; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="Y5M7OAra"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70842dc27easo46814407b3.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1745872602; x=1746477402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye3CAosKwD90ms07IxscbbBSsQHiO3ZGpNAoEV+9T30=;
        b=Y5M7OAraEgbOafszR8LwCNBhrnv5b6Tr2b7nIdkVo8sVbcn9EdCx3pO7mo1g+3YxQi
         si/OvEV/s1noDxPwNipCtN/b0UYp3f2LG588L6F2w8idTZ3efd7eEnt6aRlXCuXtxkkj
         QTSgJk2TTvGzzvUW+txiLl8IEBMTbwnJQxdYkAHeiYIwSFgihSnqo46KoVDFfqz1FQqr
         qz6O9nvY6/LjjI5f5M4yAZYD+vfjwg5BAESbgsGLK0xQK6KZcBATxesJ9lDHAARF87wg
         DkSP7OsIlphEpI/IIH6HJB9uOF8Glf6p8/E+MNzB59r7X15fN8rf4lyNdtqE+b7nn9Xw
         Pb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872602; x=1746477402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye3CAosKwD90ms07IxscbbBSsQHiO3ZGpNAoEV+9T30=;
        b=IjQ6ZA4AsSv5xxr7gRfcHoDmqs9Z+wRwj+nq7Cdhq8y/GhC8TaaxcnTGparkeJcAqS
         9fkfVLKPKDCaFv5FKjAhXu1pbDuOGOMJs/aMecVLOOJNw7sJkMSPHPi+yrBf7gWnQMuY
         ExOzr08npi7kHvk6KehITjTWLAKriZ5hwPk0HuRjtqAhv0Tj7+0R/jaaB8Y+QoZd6i0R
         sJyzniCK0cxpdYRQR9HjTQy6qbYCtk+mTjjT+DYM3ToL5r3OVOUsnM1k02xdx3lv5GH9
         poyPDPhgALWn5yfSHRDbR213+V4TK6tzFkwCTRmjRx+yCGBisV81Ndtr4q0gSBsHHsNH
         GHaA==
X-Gm-Message-State: AOJu0YwbNeURylnSlLaU1sypgd7o2fjfnC7e0h0A+6FMwOfEzZDPqRQ0
	KnLkgomb7GEI33O6vjnl4cUDcn1A9y0agznDAJ/2jPVYQ72wwHW9eTsx5PpnRk0kpRIaYYSo22s
	8hCieJno/crd5ngBMukLqx9NGsH8UnxgMAbScWIeZcr4v36M=
X-Gm-Gg: ASbGnct8AvU99hTJf+18YvtOxhVfFAjZdm6+j7LuGr9H6MeROyCY74AztCUSlZPoRCU
	9J7K9sRpXGDCoIuMk9pt4dsGJnJ9hBvRKwKkqo6gBs3pHUxmYTb8uUdk8DdijmfgJT84MHKy3PW
	UYXgBm3g/jvCJByws2mUNp/w==
X-Google-Smtp-Source: AGHT+IH1TI14VcggtCukgO33Dy2coZeSMr00joBa0kiSxykxy1fx04DT8brFivTQ1npgtjKltFNr/dHdxbDNWjmypEY=
X-Received: by 2002:a05:690c:660e:b0:6fb:9663:a5f with SMTP id
 00721157ae682-7085f257b1cmr132756567b3.38.1745872601722; Mon, 28 Apr 2025
 13:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
 <878qnss187.wl-tiwai@suse.de> <CAFa_cKm3ded=1+3-i5BYjTa8JTeqZcGkGhakgQWfqPy_H=NBBg@mail.gmail.com>
 <871ptjl6jk.wl-tiwai@suse.de> <CAFa_cKksYTido4z46UbiCN-s1Ebn=_fWt31ASOKfV0Zr_jo4YQ@mail.gmail.com>
 <87ikms1dkv.wl-tiwai@suse.de>
In-Reply-To: <87ikms1dkv.wl-tiwai@suse.de>
From: Paul Davis <paul@linuxaudiosystems.com>
Date: Mon, 28 Apr 2025 14:36:30 -0600
X-Gm-Features: ATxdqUGGoGbQazN-0enfThMDqcWc9FEpmFpSYm1cQRzgpz1lBqID3qQOvSzG_rI
Message-ID: <CAFa_cK=CteDDsMBGcZWMY4REtsqxJnxGJ5Dgu-uspXPGdOy1Zw@mail.gmail.com>
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate
 iJACK names
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I already included the examples from before and after upthread.

The tabs/spaces is my editor, not my mailer. I'm not I can be bothered
to fix it at this point (I'm set up to edit Ardour, not the kernel).
especially since you want the substreams renamed too. I should leave
it with you.

On Fri, Apr 25, 2025 at 9:10=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 25 Apr 2025 16:39:59 +0200,
> Paul Davis wrote:
> >
> > No, this is not correct.
> >
> > The number is only used when constructing a "default jack name" as in
> > "SHORT_DEVICE_NAME MIDI NUMBER". It is never used when the jack name
> > is given by the manufacturer.
> >
> > In the case of the Midisport 2x2, for example, the manufacturer does
> > not provide jack names, and so we create "Midisport 2x2 MIDI 1" and
> > "Midisport 2x2 MIDI 2". You can see this in the example output I
> > provided.
> >
> > If the manufacturer has provided the jack name, the code already
> > assumed that the jack names will be unique (because otherwise things
> > would just break on Windows and macOS, and because they bothered to
> > provide names). And if the jack name includes the product name, even
> > more reason to continue with this assumption.
>
> Ah OK, now it's clearer.  In anyway, if you give the result after your
> patch for comparison, it'll give a better demonstration.
>
> But another point about the predefined port_info is still valid, I
> suppose.  snd_usbmidi_port_info[] provides the own format strings, and
> they are all like "%s Tone Generator", where "%s" should be filled
> with the shortname, and not jack_name.
>
> So, when port_info is defined, we should skip the duplicated word
> check.  That being said, the change can be something like:
>
> -- 8< --
> --- a/sound/usb/midi.c
> +++ b/sound/usb/midi.c
> @@ -1885,10 +1885,18 @@ static void snd_usbmidi_init_substream(struct snd=
_usb_midi *umidi,
>         }
>
>         port_info =3D find_port_info(umidi, number);
> -       name_format =3D port_info ? port_info->name :
> -               (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s %d"=
);
> -       snprintf(substream->name, sizeof(substream->name),
> -                name_format, umidi->card->shortname, jack_name, number +=
 1);
> +       if (port_info || jack_name =3D=3D default_jack_name ||
> +           strncmp(umidi->card->shortname, jack_name, strlen(umidi->card=
->shortname)) !=3D 0) {
> +               name_format =3D port_info ? port_info->name :
> +                       (jack_name !=3D default_jack_name  ? "%s %s" : "%=
s %s %d");
> +               snprintf(substream->name, sizeof(substream->name),
> +                        name_format, umidi->card->shortname, jack_name, =
number + 1);
> +       } else {
> +               /* The manufacturer included the iProduct name in the jac=
k
> +                * name, do not use both
> +                */
> +               strscpy(substream->name, jack_name);
> +       }
>
>         *rsubstream =3D substream;
>  }
> -- 8< --
>
> > I realized after I sent the patch that I had run diff -uRN at the
> > wrong level of the source tree, but I did read the doc and other than
> > that, I think there were no other errors? I run a standard debian
> > kernel and so am not working with git.
>
> Indeed, the patch level isn't right, but the biggest problem is that
> tabs/spaces are broken (possibly due to your mailer), so it can't be
> applied as is, unfortunately.
>
>
> thanks,
>
> Takashi
>
> > On Wed, Apr 23, 2025 at 12:45=E2=80=AFAM Takashi Iwai <tiwai@suse.de> w=
rote:
> > >
> > > On Tue, 22 Apr 2025 19:31:59 +0200,
> > > Paul Davis wrote:
> > > >
> > > > This patch was developed using the Debian 6.12.12 kernel source, bu=
t I
> > > > believe it works without changes for current git.
> > > >
> > > > The approach taken is to always look for the iProduct name
> > > > (umidi->card->shortname) in the iJACK name (jack_name). If not foun=
d,
> > > > the code path is unchanged. If found, a different string format is
> > > > used to create the port name, using only the jack name. Note that
> > > > since finding the product name in the jack name implies the jack na=
me
> > > > is not default_jack_name, there is never any reason to use "number"=
 in
> > > > constructing the port name.
> > > >
> > > > This generates the expected port names for several USB MIDI devices
> > > > here, some of which have "product name in jack name" and some which=
 do
> > > > not:
> > > >
> > > > % aplaymidi -l
> > > >  Port    Client name                      Port name
> > > >  14:0    Midi Through                     Midi Through Port-0
> > > >  16:0    Scarlett 18i20 USB               Scarlett 18i20 USB MIDI 1
> > > >  36:0    Keystation 88                    Keystation 88 MIDI 1
> > > >  40:0    Launchkey MK4 49                 Launchkey MK4 49 MIDI In
> > > >  40:1    Launchkey MK4 49                 Launchkey MK4 49 DAW In
> > > >  44:0    MidiSport 2x2                    MidiSport 2x2 MIDI 1
> > > >  44:1    MidiSport 2x2                    MidiSport 2x2 MIDI 2
> > > >
> > > >
> > > > Signed-off-by: Paul Davis <paul@linuxaudiosystems.com>
> > > >
> > > > --- midi.c.orig    2025-04-22 11:20:30.192338737 -0600
> > > > +++ midi.c    2025-04-22 11:20:47.373155820 -0600
> > > > @@ -1817,10 +1817,18 @@ static void snd_usbmidi_init_substream(s
> > > >      }
> > > >
> > > >      port_info =3D find_port_info(umidi, number);
> > > > -    name_format =3D port_info ? port_info->name :
> > > > -        (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s %d")=
;
> > > > -    snprintf(substream->name, sizeof(substream->name),
> > > > -         name_format, umidi->card->shortname, jack_name, number + =
1);
> > > > +
> > > > +    if (strncmp (umidi->card->shortname, jack_name, strlen
> > > > (umidi->card->shortname)) !=3D 0) {
> > > > +        name_format =3D port_info ? port_info->name :
> > > > +            (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s =
%d");
> > > > +        snprintf(substream->name, sizeof(substream->name),
> > > > +                 name_format, umidi->card->shortname, jack_name, n=
umber + 1);
> > > > +    } else {
> > > > +        /* The manufacturer included the iProduct name in the jack
> > > > name, do not use both */
> > > > +        name_format =3D port_info ? port_info->name : "%s";
> > > > +        snprintf(substream->name, sizeof(substream->name),
> > > > name_format, jack_name);
> > > > +    }
> > >
> > > Thanks for the patch.
> > >
> > > However, dropping the number suffix will break the uniqueness.
> > > For example, in your case above, MidiSport 2x2 will have two identica=
l
> > > port names, I suppose?
> > >
> > > IMO, we should keep adding the suffix number unless the uniqueness is
> > > guaranteed instead of blindly dropping.  Admittedly the current code
> > > isn't in the best form and this also needs more modification, too.
> > >
> > > Also, the pre-defined port names defined in snd_usb_midi_port_info[]
> > > have the format like "%s Synth", too, and those should be adjusted, a=
s
> > > well.
> > >
> > > Last but not least, after we get a final form, could you try to submi=
t
> > > a patch in the proper format as defined in
> > >   Documentation/process/submitting-patches.rst?
> > >
> > >
> > > thanks,
> > >
> > > Takashi
