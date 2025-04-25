Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E62472A6
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745592015; cv=none; b=V0Hr0N3doxorTC23NCzZ6PRFNR6Xykmh3QoTRWcuYzxRJDqT4ijCz3lQiwHOsa2C2VIicANrO9lpCo/rAR2q12t7lET8ASNd4DPYKkjd/zuT+6/Vf5k+Iur+YE4oRVFs3aWvf0r0U+F1re+z4D0tOmIKznf5tCxvyIplsQDRJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745592015; c=relaxed/simple;
	bh=tR+l6VFnoQ4k33FHyrNFCR82H5cIrzV/RRYFKJYRmYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDnuIyTJnHf4gM3ZLAQ8e6tIPouIKsu9f/Pu37yrZ7hgfQQUrKbBIMrWocyEi9DyjPar8IQIcHuIsTKsnyd5EJ/9OVG4gAyCYmiWqEbH55Ni09+j1wA5dc2FK4oUd/3gix5TuLC4iimz+0bbNyPkkF6j9VvK508/mud+B1rYq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=w7YaITIc; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="w7YaITIc"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e60b75f87aaso1739734276.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1745592012; x=1746196812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWwhHTTvV11+GgEWAvNNTrQj5dwvhppF8pesh0o6eMI=;
        b=w7YaITIcJ/tQJjSqXRW8P9wFT7SJzLes5CuhXsNjtjN4rUgCMh+hjPvtAutWXsA8Op
         7ku3bq7P5dzG/WMAEtluAEEZdToBVkwazUtXIXXt+qHxuzxjhg6t151loNFsTAyJnNpE
         4/utRDUHcemWS22whB06mD/wSyBhwvVd5K2kn6LJpEVMY442Tw1J5uV8irvSv96DELRP
         Kizt129euvhwPK3x6DhtYLRWoulgH5ViuB7QwIRUNlkiZCrQwL/n5D27B1svEqLYxtq+
         PWxOxJeShLPtnGueQiwhf3DTchXpM8zLiGUnMflV6mYlpp3UV1/qEWZHk1m/KQ5ZOOIU
         ih+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592012; x=1746196812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWwhHTTvV11+GgEWAvNNTrQj5dwvhppF8pesh0o6eMI=;
        b=rtl1xw/p+lKONenXYupq7bRUgP7YoSNUxUgQkLHHhoaZshN7wGjVKwPiHUfhb5V7AX
         VpxUZBQVUJCBDZUxPW3l4s+LBtBrDnEsaTaOZx0s0r8zh4yt+3ocrykgrPW1kE24/Lba
         uF99mKeNqZ4rSkSa3HTdJzm5Au8/K+MepB7qDHIDTuIP8f4xns2Zwz1P8KGoGat2w+tb
         gm4EP7bFzPm43V+2FRkWYsvefV55nsDHZz2uFExFk0BK0SQD1ZbbmPyqK1zuIcNZ6xCr
         nFqJQy6ejY76z7PHKDLzqYuAFK75GzQANVtph60DDPrG3VJFU/NkMj6cZaSdRb3jYWwk
         n/bQ==
X-Gm-Message-State: AOJu0YzEhHKOxdpRZJ9Ji67wQhgJJ8YPgS58HDFRp/WBq8u/EjBAFJIR
	uDq9rRdVxcyBGQcdcSBYN8va9h5KwpIXa5CP6ATYjfSh7mA2g1Zf/VpSdgr0YQVE7EfDx7cAFmm
	HRqRoAcJ/+DOc2L6Y1SfZmnXb435u4QXENzSjSBCWWkM9O1o=
X-Gm-Gg: ASbGnctEkQUehLm+DQVgLddFK37PkezJaxo0fa9YelUNpU1FKL+y3/4V4yayg9XcaMz
	/GLm810oFEfBwA/OJyT5WhijMyDvVEr99hRllZ2jAU1oU3sN7J1T76LAzRki4SqB3spuXI66hfk
	KML8rEOwwrDvjHiVvMm3UzeOtvwlpxwlAJ
X-Google-Smtp-Source: AGHT+IEKlralp5lwwKouQDy9Ab1KumHxeISEw1r9js13A+ZnRcF9zb5Co1oiv4hTCtmFp+KwscRzkpDc4NJVgTZtuXA=
X-Received: by 2002:a05:6902:150e:b0:e5d:b2d7:65b9 with SMTP id
 3f1490d57ef6-e73164a5c19mr3101022276.0.1745592011943; Fri, 25 Apr 2025
 07:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
 <878qnss187.wl-tiwai@suse.de> <CAFa_cKm3ded=1+3-i5BYjTa8JTeqZcGkGhakgQWfqPy_H=NBBg@mail.gmail.com>
 <871ptjl6jk.wl-tiwai@suse.de>
In-Reply-To: <871ptjl6jk.wl-tiwai@suse.de>
From: Paul Davis <paul@linuxaudiosystems.com>
Date: Fri, 25 Apr 2025 08:39:59 -0600
X-Gm-Features: ATxdqUF6EBrsbfRappxkKrPeYMIYuq2hVgbTRzJgZ2d6KDDDK89CqQsRRd4cPa0
Message-ID: <CAFa_cKksYTido4z46UbiCN-s1Ebn=_fWt31ASOKfV0Zr_jo4YQ@mail.gmail.com>
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate
 iJACK names
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, this is not correct.

The number is only used when constructing a "default jack name" as in
"SHORT_DEVICE_NAME MIDI NUMBER". It is never used when the jack name
is given by the manufacturer.

In the case of the Midisport 2x2, for example, the manufacturer does
not provide jack names, and so we create "Midisport 2x2 MIDI 1" and
"Midisport 2x2 MIDI 2". You can see this in the example output I
provided.

If the manufacturer has provided the jack name, the code already
assumed that the jack names will be unique (because otherwise things
would just break on Windows and macOS, and because they bothered to
provide names). And if the jack name includes the product name, even
more reason to continue with this assumption.

I realized after I sent the patch that I had run diff -uRN at the
wrong level of the source tree, but I did read the doc and other than
that, I think there were no other errors? I run a standard debian
kernel and so am not working with git.

On Wed, Apr 23, 2025 at 12:45=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Tue, 22 Apr 2025 19:31:59 +0200,
> Paul Davis wrote:
> >
> > This patch was developed using the Debian 6.12.12 kernel source, but I
> > believe it works without changes for current git.
> >
> > The approach taken is to always look for the iProduct name
> > (umidi->card->shortname) in the iJACK name (jack_name). If not found,
> > the code path is unchanged. If found, a different string format is
> > used to create the port name, using only the jack name. Note that
> > since finding the product name in the jack name implies the jack name
> > is not default_jack_name, there is never any reason to use "number" in
> > constructing the port name.
> >
> > This generates the expected port names for several USB MIDI devices
> > here, some of which have "product name in jack name" and some which do
> > not:
> >
> > % aplaymidi -l
> >  Port    Client name                      Port name
> >  14:0    Midi Through                     Midi Through Port-0
> >  16:0    Scarlett 18i20 USB               Scarlett 18i20 USB MIDI 1
> >  36:0    Keystation 88                    Keystation 88 MIDI 1
> >  40:0    Launchkey MK4 49                 Launchkey MK4 49 MIDI In
> >  40:1    Launchkey MK4 49                 Launchkey MK4 49 DAW In
> >  44:0    MidiSport 2x2                    MidiSport 2x2 MIDI 1
> >  44:1    MidiSport 2x2                    MidiSport 2x2 MIDI 2
> >
> >
> > Signed-off-by: Paul Davis <paul@linuxaudiosystems.com>
> >
> > --- midi.c.orig    2025-04-22 11:20:30.192338737 -0600
> > +++ midi.c    2025-04-22 11:20:47.373155820 -0600
> > @@ -1817,10 +1817,18 @@ static void snd_usbmidi_init_substream(s
> >      }
> >
> >      port_info =3D find_port_info(umidi, number);
> > -    name_format =3D port_info ? port_info->name :
> > -        (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s %d");
> > -    snprintf(substream->name, sizeof(substream->name),
> > -         name_format, umidi->card->shortname, jack_name, number + 1);
> > +
> > +    if (strncmp (umidi->card->shortname, jack_name, strlen
> > (umidi->card->shortname)) !=3D 0) {
> > +        name_format =3D port_info ? port_info->name :
> > +            (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s %d")=
;
> > +        snprintf(substream->name, sizeof(substream->name),
> > +                 name_format, umidi->card->shortname, jack_name, numbe=
r + 1);
> > +    } else {
> > +        /* The manufacturer included the iProduct name in the jack
> > name, do not use both */
> > +        name_format =3D port_info ? port_info->name : "%s";
> > +        snprintf(substream->name, sizeof(substream->name),
> > name_format, jack_name);
> > +    }
>
> Thanks for the patch.
>
> However, dropping the number suffix will break the uniqueness.
> For example, in your case above, MidiSport 2x2 will have two identical
> port names, I suppose?
>
> IMO, we should keep adding the suffix number unless the uniqueness is
> guaranteed instead of blindly dropping.  Admittedly the current code
> isn't in the best form and this also needs more modification, too.
>
> Also, the pre-defined port names defined in snd_usb_midi_port_info[]
> have the format like "%s Synth", too, and those should be adjusted, as
> well.
>
> Last but not least, after we get a final form, could you try to submit
> a patch in the proper format as defined in
>   Documentation/process/submitting-patches.rst?
>
>
> thanks,
>
> Takashi
