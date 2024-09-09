Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AAE111A8
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725847459; cv=none; b=AOLWFAlZvXqCmzLs7dXM3ANaFDFz9g+FkKG3/1GchIGttP4Jhj2xZPSs6f8Yf8knVaYCt2bgHnhvvECNB2iU+Wu+LzwSszTrtswtRAdpVwQVFalU7pJUggQQ/tkOrt1zmwFL8LnN2W3bBVBgjJZX1ZZrLzgj++uBVb1v0E+V2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725847459; c=relaxed/simple;
	bh=HhFHAkcIkSLH9d0maMPyRChdvunG8qAN1QPbL49mMfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKsZMhuZodBNMk6ZPQy+X3HmnE56sLiOGoaaBl92V4l7Zo70gr/zc55Ek8wNlpfNntSsp/ECHTExTaoDcM+N8tftMINyZK4pFgmW6quEe0VIsJcj/UR6yqrknuEoXdIR7MVRupHqBZshkzBJ7bYa4jper0xkdKW+LoV4y3BP8AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oTzOy8i1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oTzOy8i1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42ca580f4c8so285e9.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Sep 2024 19:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725847454; x=1726452254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMyPt7AhPbkwJLr/QUbCyAauSRNgXD7xB86A6jpKbvI=;
        b=oTzOy8i112zpwoN3Bz64bUUO2bnTqIWInxo3aR2cMboaY+STdfHiKzM1hass3qb8ZW
         4bnPZTfHycyJolmYON1KHTtiYnDKXRhIejqoDs+3Qo0Jvu4S6ueMXr0nWiOL+sdNMvKw
         A8bKo3dIT9iKG6DvuZj9HM3z2UdhbGiRME9jDFWjYzxFEMjxA5khwWko7U7WBPjLHMX+
         Jc0+HK50W3fFtP02oja/+kwaiWaOKX1BhdNjPvlJqPSKoMvlFH3wwHYKJu0dLgKlCaXs
         pJkNzEuMRYI3V5hAZMmHoxy958DYX/uqq4cNQck8HZvxKoQcGnIYHr8vcmcrlRN+LFuo
         9GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725847454; x=1726452254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMyPt7AhPbkwJLr/QUbCyAauSRNgXD7xB86A6jpKbvI=;
        b=xMqumIbLx5fGE/Q7+CIU7fqHluiKfCsx24z8KgZCfKsaq3kVrDoK6r7DhDlm59NrVt
         MB7cfYvJlxZU+bdaqli7hRDvTpYEdqdrJG3qL8qmkgGn0iEStu6IZBZKt6JjrVK87uyV
         bNPINPtjeePSbHFxqnesBnR7w0YN9ncakHmcBX9yypMJujb9QMRggvM1l7pATeXw9Q3Z
         A8Fb6iiP/ZG88CQWnlz58AMpHb2h+4BeRMqUYovvs8MJAH7GF9kvfwOsyF+3ny+cNbjL
         M4+cuW5o8/WGCWZqhG9rp6Pq+lQii2ZSXHxSScojiC1Yxg79WfxW6AsUhRxfHQHo+LPr
         ryew==
X-Forwarded-Encrypted: i=1; AJvYcCWi8P48sWG20bHbW0yaR11LcvHpkkzzu1H7x2qM34H0BdqxZBdj2lweDKoRFkSUHHmNaBrFgXUsEB77ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaIm7VLaQz2gSPkh/AfjAEuJx/vDMlg6WFOYlDMZmyxamnd4Fy
	U+n4mDcfrKg2TZbJspvo57wtxxhz/+amOuxv1L9lm3uEHfwk0jIgeOGMHzKeel70pQx92Sxfp+r
	IJxTVnBdCXDanR1qkH/85CvJZqKBaVObPVIY=
X-Gm-Gg: ASbGnct3IjiliKRHx30BZ7+R9CAKaFGPOIWu46BHtJUUaiU5LRTvKa5jNkCohvGuTqY
	JrnSrIwtNvnQg90Bsx1/Q8Mo6ubmaCxY7QUmbJI4//Eky/XccDe/DySMcihkKx5fU
X-Google-Smtp-Source: AGHT+IHBuiIVx/1GaXcuzHos7shtGEUjI71oFo8vaT0N0MHIstJosoRZ+W29ygUeClp98PfK53cU1PezpJckObMmvS0=
X-Received: by 2002:a05:600c:1c13:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cb9d53133mr3975e9.2.1725847453147; Sun, 08 Sep 2024 19:04:13
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906211445.3924724-1-joshuapius@google.com> <878qw2d1ry.wl-tiwai@suse.de>
In-Reply-To: <878qw2d1ry.wl-tiwai@suse.de>
From: Joshua Pius <joshuapius@google.com>
Date: Sun, 8 Sep 2024 22:03:36 -0400
Message-ID: <CAFs7P=g8Pqk2-WH8kX6spNSjJ8x80GnDur0ny2CvpzTKb7oa+Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
To: Takashi Iwai <tiwai@suse.de>
Cc: Joshua Pius <joshuapius@chromium.org>, alsa-devel@alsa-project.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"Steven 'Steve' Kendall" <skend@chromium.org>, Karol Kosik <k.kosik@outlook.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, this change is for UCM profiles.

Yes this should be a one time occurrence as afterwards effort is being
made to migrate over to UCM v2.

Thanks,

Joshua P





On Sun, Sep 8, 2024 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 06 Sep 2024 23:14:38 +0200,
> Joshua Pius wrote:
> >
> > Specify shortnames for the following Logitech Devices: Rally bar, Rally
> > bar mini, Tap, MeetUp and Huddle.
> >
> > Signed-off-by: Joshua Pius <joshuapius@google.com>
>
> Is this change needed only for UCM profiles?  UCM v2 should be able to
> handle better to identify models, and such short name updates aren't
> needed for them.
>
> OTOH, I don't mind much to take this kind of small harmless changes
> (unless it happens too frequently).  So I'll likely take this, but
> just for verifying the situation.
>
>
> thanks,
>
> Takashi
>
>
> > ---
> >  sound/usb/card.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 778de9244f1e..9c411b82a218 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_audi=
o_names[] =3D {
> >       /* Creative/Toshiba Multimedia Center SB-0500 */
> >       DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
> >
> > +     /* Logitech Audio Devices */
> > +     DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
> > +     DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio"),
> > +     DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
> > +     DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"),
> > +     DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio"),
> >       DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"=
),
> >
> >       DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
> > --
> > 2.46.0.598.g6f2099f65c-goog
> >
