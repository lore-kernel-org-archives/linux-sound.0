Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAE111AD
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874967; cv=none; b=DBXUs4PXeJ+4Jx9M/VFLSpsDm/ALV0177ccZDanR05Irm5hmBc+RAl4uYtWSP05td9ih4/WBgvvIINQrcaPRpPYkjc/FEmDpezmhW3SxAs8aqJaKmP+QYi0WrfbcTa7S1LpbiV0+SdT7LrI2wt+uIN5GJQlG5eBshkDVJ5GKh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874967; c=relaxed/simple;
	bh=gzYoZmlagmiNxFgfg1q+1Mzx5hHZUDYgwRRFK8RYaEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujyaFvuitJsDj2qZwYxswn6SaWYRJH2kRXxfpBldAZR8TWy5pvCw5bWfvXvHLC9RYKe4tPNrBX0ZSuQrXhY2Makoi2WU2AOp4UA32y58n80omwMi6Yqudj4R5GDCad2+8gJz8hv0rgq2DGVcjZ0PpJhwI+FvVPQXKsYPbmiE+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=QrNjty3w; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="QrNjty3w"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6feb229b716so44941167b3.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1745874964; x=1746479764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTU5U+HX7m4ImeQy3pzvU3pwU9UCh7Nh/YZYrF16O/s=;
        b=QrNjty3wObOz22BBpHA74D6z9f14tWL6P23M50byKX04cv8cFmkGHlvm4iRF3Z9nFj
         /8M6uy0ocr0HWaJCudvlsYdc4i28+hVo9o06RVBvXkJFDWLLkQ15gdlHHeZyebCJXqo6
         X5f/cS3ckdj9PIIrg0JJof8l+lzaj2U0jd6SZ8eWTgkeS34n0SBPxeoCzCGWT7Vg1skN
         GiQQGftKYPdGNyxSKzAa881ekX0EYEBgtGETkacXGH+XYSbSRcaY/B50o0PzMQMTgteJ
         gDmWYpgndL3V8+5HhHsXqzqjkAraxVy9mDMwv9zuJjJTRpiiPH55du01S8da/iqG7fdG
         1/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874964; x=1746479764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTU5U+HX7m4ImeQy3pzvU3pwU9UCh7Nh/YZYrF16O/s=;
        b=gXMD4vYj6R8pJqblMt357jqR/0EE4j33yuIrLNgF60QLFgDnXkOj9utN01D/vJqA2c
         HT/Qqg2JOT6ACRvevrVM+tf9oViVIq3FzEPQfKo+FRKL+RtkbimNdcTyStTPID+OSpqI
         oaaEquvBlaBakpV51ruLODK7dj4k7DKbOZFd0of1trMzm+MEP3jjE1A1BBiRbiAxacun
         BFsDkr8MaSu79co75jrc24zMC5lv8h0X1j02V/Lb1J/VHd5Kx0oDWJv+yT2IkgQUa2Ju
         553196M4sAeaDTXm/erGTVIQm7vSt4Am/gz5KaJlOti/QkKtbDqtQ96BR2c/nArFcdsy
         s49w==
X-Gm-Message-State: AOJu0YzE7QBpJQH+mtJ4DP38Rus8V9qpuS2M1HRZYkJaEEzXgEeNVIfS
	la6bfmF1ct9pmK3e7YAlfSJebmdw6MJdp+D/WQTe5yWCygsQBDJW2VZMUjLbr+ZR1OedfiqUeAN
	znIAGiDh9fWRaTARcOegpqoA2BeQkYeDz3hRpGOIHROxfurN2pQ==
X-Gm-Gg: ASbGncsPDG8gVHUQCmmegpDlWGMHSuO2Vw6jQ3IFpFzr5Ub4Ys6+NbYacndIq2jnqaV
	pWO5WT3mialho5L0B1kh//GGddZ8pHPiOB6Tf9LnbOacXdG7i5RzwRsd2JHSNGMinFTJomqvd+Q
	RxsFLo1bO9NYR9/v98sNpyxA==
X-Google-Smtp-Source: AGHT+IHogc78lioaYqX3/y1Mieu09WAjh/OhPDgfIuQgxKx2U+4Bi11P0WI70GyKPDj0IgUrB2B9DaK5jIEjyFQO5uM=
X-Received: by 2002:a05:690c:9984:b0:708:2454:a06c with SMTP id
 00721157ae682-7085f174964mr147881967b3.9.1745874964292; Mon, 28 Apr 2025
 14:16:04 -0700 (PDT)
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
Date: Mon, 28 Apr 2025 15:15:53 -0600
X-Gm-Features: ATxdqUGBpfYKIVhlg2Fqv4Sck57MIV57EHn6K6TZ_m4_JdGCLY-tjsb_DoMb0eM
Message-ID: <CAFa_cKnEZj2B9oniQ45FdKfxyyaXUwoF-xQLd6ib0zX-TE3FHg@mail.gmail.com>
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate
 iJACK names
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can, however, confirm that the patch as you reformulated works as intende=
d.

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
