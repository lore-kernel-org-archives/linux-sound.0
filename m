Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50B39A7FA
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384885; cv=pass; b=d6FN9hQ29ym81wy4g/s/5iYzx4iT2I8QVB5U+JIeUapSFqYgZbNF25rJL62PocYQ+Xr77zmzpGfDwWAEXzBapM52Tc9FpV8FepwP221NUKSi5yn0MXuT7MANBb0Ty/iWu4ZGG2/rc7hnkzcmhvRMb/pUpPnyCqPlTk/73CRlOEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384885; c=relaxed/simple;
	bh=7I4SA8pnVzxFcOb4tuAVlI4fvhM7JEAewQ9oeC84SVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP43AghR715HERgxbRriwHdCvK/LuAQ8B0hoo7ZmpWzyJjjz0Ew/poCTKao0WxQiDKbGHjuaHhkv0AFNc8Ig39aMdbNNcMvk2weQbltsIl2Hw3B7xTCf1DQdliwM0CBQHVMDDR0ous4jPzapXaNX3jMsaLWTl4+PG/AlitY8AVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrbGdD14; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrbGdD14"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c86214eead7so301359a12.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 03:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782384881; cv=none;
        d=google.com; s=arc-20260327;
        b=nH59lJBVpp1UQNY9wvHeExWUW4hM6qlaOKYTP8IVUVIkSlxp3rE/7aSqEh4OOhcWzR
         4404EloqrzpWEyjzcDnVrPxsf2CMVwKXPqaUrk3jur9/UWFcuxfgvQKd8mYnliy26k7r
         diM9G35658CzjIeTV9FpH2tT5gGYzUSdsJMNww02kL3PBo5rAKx+ugulhTfXLt0tHMYQ
         yvBWlZSTFfVlOd2pHzR75s3cwOyAt+Zg+rGYxKX8e5WL11T5n+D+bxtr6L2u6uYkdsIf
         VZGolkOdVMrYYMtDV7I9+hE0ToORnidVZu+i30WQsg+ZlZ3rw0GaxIijM5FBc7I7M5W3
         2WWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xx0OFGrEBnyqf1LFeqLT5XV1uITdiY7yYAyMZx/zOAg=;
        fh=sAdr1UG6UppRjpd7gnsJB0LooC59bcqERhPe5wsmhsY=;
        b=qas5CAEpyhyzF34eXgpLjIPxY4ffO8ck3rnod7bXBY7KqY3kkHh18KtP1jE1yC1bcf
         RwWyOFNAZnSstDb47C2OLh5E5twg/jJG0PIN59MRiXnsRsBOLlc41/QbY0CYM+MW4/fx
         4FFON1AIGg/S8NJuiP+c2xm3JiY5Laj0gFwkKAJ7O51rPEb+parkXLb8hfJeBtVSpCIK
         N4AwOUjW3lBQRBUdNhx5nk8W3huTy/ZVEtCAMnwAB0r14Y0DtbHltASCw32pT8Whg7qz
         zXRUJ72v4GcPLg1vCkGMIzNUt30JH2zNgGqE0zUf6z5hulqMFcUGwiws15exBXoIumg3
         avfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384881; x=1782989681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx0OFGrEBnyqf1LFeqLT5XV1uITdiY7yYAyMZx/zOAg=;
        b=lrbGdD14RgSH/OVEpgFZzZ3jlPBtuilPqezK6K1EyJbnhmUrWtqDXxrrUXDnU1L50s
         wDejpURScQV5V1tLO2IwuiU39nVyCxa+cJ3JsIfr7kTo4cXvmLUIJiGD646qfOSneh1U
         Wj9lFMXdRLH02Y5iDG3uZflhiZZhHCBWvCEpntAnXzfuJDKBzvJIcEIm9EMFRjomwnGH
         ZEbOijW5MOyHqoMKz8YtvLuxSLw93S9V+xOmnRk/ox177ZNCH1vRFM9YyLnWeTfn3OIs
         UsmD1ybegcEh6n2sop1rm3zY8QIICRPZgaMhVHVOsDwBS+Ctl6J+mQIAUzEOIRYIqmX7
         VgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384881; x=1782989681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xx0OFGrEBnyqf1LFeqLT5XV1uITdiY7yYAyMZx/zOAg=;
        b=cGQa4sLeb79bOJRRCxh6ezPfq2Kc6Dj542B4tyPRZHMxrWuqusDK72jzIASSkLpKDw
         uVtJ/uCTz+ZQEc3oGpI2MWQ7YxRH7BVdvsWXL6Ek0vrp4n6xMcMB9GFllBT/OGXqSFD0
         1c43qTZrJZ39trsyc0sDip0R2hu7IhstOUIMDNiCcArHP6x3NzaxJikHcuqgnzzc6Vwj
         GnezJoJhH4KNBJeMlCXg+zInMj84hUypMB91GE3RJKC/xlOYN5QW3VtG8yTD0uhWPbWe
         fR1d/o3MPmgU5DdxKDyJ5E5hriSq7dPa9VmC4T9h4A0V8cgDDdDXZm/r9Vmimuavoyj5
         4hYA==
X-Forwarded-Encrypted: i=1; AFNElJ9DIPaw4y5rU18dM30QlhXZuIsykeSuPGpQNSwPAcTDQ7Znjwz8xZHFdOXLtmx395LMj4r6DynOZJU4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQi8SdFRfasjal76fhD34sIC7ciZ+Q9/cMIyc+9JofoJK6FW+c
	Zo/kSg6EAaKbxqAcketurMBHuhNYSg5yWKPu0yYIn+kO3ZD3LoDIydpqh/alO/Ihi9phqGVV0Wa
	CyZRgbD2mBWs1UgvGuFoFFX9T0SyFEGw=
X-Gm-Gg: AfdE7cnKPk+6h63bUeyLqKPzQ2filfZORnXEfxGota55Vs/iCotMXkdNxl+zvAEw4J4
	pdm4PfRuzjtFwy+Gm7i7AJtl90Y+Ahq7L90yQX0jlGlNr/i9nXsnzceKxycTj8aBeWS5D2XmMlO
	t//cximqzPdcqk6a7NDOm2qZ1a7JKrynHSML7G+bO0L8mkY9086taEPmBIXBlAvABXDbe2u3Tbc
	vuusrgr/PSI3z5V8Bl6td3HfjxV5e1GAGRP9YDtDKlXooX75V2osru3FWoRjMsnz09jBeKznTuv
	gvOk1SO9OqciuHoFHDQtjFTMSOQ=
X-Received: by 2002:a05:6a21:1519:b0:3ab:30d:c7a0 with SMTP id
 adf61e73a8af0-3bd10b3fc61mr11718362637.32.1782384880641; Thu, 25 Jun 2026
 03:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <20260623105721.25865-2-phucduc.bui@gmail.com>
 <fffe4925-c5aa-42a5-ab8a-d8da4989b9b9@intel.com> <CAABR9nGh3nHnRx8yROqUuHLVZ1nWsDWKxJqAJaX3q+fiOBL+Kg@mail.gmail.com>
In-Reply-To: <CAABR9nGh3nHnRx8yROqUuHLVZ1nWsDWKxJqAJaX3q+fiOBL+Kg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 25 Jun 2026 17:54:29 +0700
X-Gm-Features: AVVi8CeP2tAWjLoDOyAErmzOvG6RLTovn3vxUqPf3-cNBhREi3e9UUqRaCIIf5U
Message-ID: <CAABR9nGZjz+VZJOJBB_BF72iYQtCs3Fvc_zskaHF8DPFodzX8w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: intel: sst-mfld-platform-pcm: Use
 __free(kfree) for stream pointer
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cezary,

On Wed, Jun 24, 2026 at 10:01=E2=80=AFAM Bui Duc Phuc <phucduc.bui@gmail.co=
m> wrote:
>
> Hi Cezary,
>
> Thank you for the feedback.
> I will definitely fix the commit titles and group the patches by driver
> (atom and avs) as you suggested in the next version.
>
> Regarding the ordering of this cleanup patch and the locking update,
> I wanted to share the rationale behind placing it before the locking patc=
h.
>
> According to cleanup.h guidelines and community best practices (as
> also pointed out by Charles in a similar discussion [1]),
> mixing guard()/scoped_guard() with traditional goto labels is highly
> discouraged and error-prone.
>
> In sst_media_open(), there are currently two goto labels: one for
> mutex unlock and one for kfree(stream).
> If I introduce the scoped_guard for locking first, that patch would
> still be mixed with the remaining goto label for kfree.
>
> To ensure clean, safe, and bisectable patches without mixing guard and go=
to,
> I had to eliminate the kfree error-path first using __free(kfree).
> This allows the subsequent locking patch to completely and cleanly replac=
e
> the remaining mutex goto pattern with scoped_guard.
>
> Please let me know if this makes sense, or if you still prefer a
> different approach to untangle this dependency.
>
> Best regards,
> Phuc
>
> [1] https://lore.kernel.org/all/ajUcTfG3vSGz3n3d@opensource.cirrus.com/
>
> On Wed, Jun 24, 2026 at 2:35=E2=80=AFAM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
> >
> > On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> > > From: bui duc phuc <phucduc.bui@gmail.com>
> > >
> > > Declare 'stream' with __free(kfree) so it is automatically freed when
> > > leaving scope. This allows direct returns from error paths and remove=
s
> > > the explicit kfree(stream) call.
> > > Set 'stream' to NULL after ownership has been transferred to
> > > runtime->private_data to prevent it from being freed on the success p=
ath.
> >
> > Hi Phuc,
> >
> > Thank you for separating the change.  TheCh=E1=BB=89 =C4=91=E1=BB=95i g=
uard() =E2=86=92 code kh=C3=B4ng =C4=91=E1=BA=B9p, v=E1=BA=ABn ph=E1=BA=A3i=
 v=E1=BA=ADt l=E1=BB=99n v=E1=BB=9Bi goto. design of the patchset is off
> > though.  __free() is by no means a requirement for the locking update -
> > it should be located at the back.  Also, grouping changes targeting the
> > same driver makes the entire patchset easier to follow.  Right now we
> > have 2 avs patches surrounded by atom ones from either side.
> >
> > Last but not least, please drop the filename in the commit title.  We d=
o
> > not do that here - some filenames are long and the approach leaves
> > little space for answering the _what_ question when building a proper
> > commit title.  "ASoC: Intel: atom:" is what you want here.
> >
> > >   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 19 +++++++++++++----=
--
> > >   1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > ...
> >
> >
> > > @@ -347,12 +347,19 @@ static int sst_media_open(struct snd_pcm_substr=
eam *substream,
> > >       snd_pcm_hw_constraint_step(substream->runtime, 0,
> > >                          SNDRV_PCM_HW_PARAM_PERIODS, 2);
> > >
> > > -     return snd_pcm_hw_constraint_integer(runtime,
> > > -                      SNDRV_PCM_HW_PARAM_PERIODS);
> > > +     ret_val =3D snd_pcm_hw_constraint_integer(runtime,
> > > +                                             SNDRV_PCM_HW_PARAM_PERI=
ODS);
> > > +
> > > +     if (ret_val < 0)
> > > +             return ret_val;
> > > +
> > > +     stream =3D NULL;
> > > +
> > > +     return ret_val;
> > > +
> >
> > The entire construct looks bad, unfortunately.  Guess the reason comes
> > from its follow up - the locking update.  The delta (+13, -6) isn't
> > exactly a good advertisement for the cleanup either.  Again, I see this
> > patch as last in the set.  Should lower the delta too.
> >
> > >   out_ops:
> > >       mutex_unlock(&sst_lock);
> > > -out_power_up:
> > > -     kfree(stream);
> > > +
> > >       return ret_val;
> > >   }
> > >
> >

After re-reading the cleanup.h guidelines,
I think I was mistaken about suggesting an ordering between the
__free() and guard() patches.
Sorry for the confusion.
Since both conversions are part of the same goto-to-scope-cleanup transitio=
n,
combining them into a single patch seems more appropriate.
That said, I'm happy to follow your preference.
Would you prefer a single patch or two separate patches?

Best regards,
Phuc
