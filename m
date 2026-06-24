Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12253033FD
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270091; cv=pass; b=LQ31ywz+S1vYd4r/+tKBFxvCKnDUFSobCBe7YF/x5bI6UpbfCJb6KQTv+c13MokSGo50LnbFDvYknvkaD7V+DV08SijmU9PtnTlIBniL8Nfhp0vlutPTDr70bVAZ43iRBrfSSamqlWKeAuBt5fKTt1MQQcisJzDRUV4PoQloYqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270091; c=relaxed/simple;
	bh=guHUT8GiNVGl4dxs8Z5rjcX/cS6lcLri1PCfUPvgiCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9inzAzDLfpHdQsaK9w1q15mft0HRNnpfZJUzHS4hMV7OZKaUau3lHFbAaOxvpSS6oFF/xhqEEUHcrn50jTEb9ZHXLSvU878VZoYjKU7xLZj33o7OXhFAmoOFXpvbT/F5PcjqUZfw2vdUF+r9E0jPJe93j70sePOpeUZTKRqMsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsKSZ/4R; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsKSZ/4R"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37c5b9d42efso983448a91.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 20:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782270089; cv=none;
        d=google.com; s=arc-20260327;
        b=rb72LuiGGKYh+e8YpZ0dlfJSmrmKheWi39qOBM2/P54JHAfTE6T43ZFVJRqoq4n7uo
         SPzslOpAn+x/VCOfDoJmaPR2LvfIq7kdaWetgWkoVFViuTB3qW5P0wptHaEcZASXG+b1
         YkWbtQH9Xw0QuOVOfWjvXBFVtNB1e+GD+6yTsVwqvHUQed1VvlOMGBSk1TMZuvH8FNiN
         isBlKrjlRB+N7B1IU+GmNPZlz02aRA6kSVwhQut6avi2l6Ug2qlwloRl7xLEn56M2Mfa
         2MLjGEvxDz2Mp4Bh1FetV3NudFjge44nbb9UYhCaJQdn8nINF3qOtgubo43uh12h3Anz
         hlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rz2M93K2OvfErtDCnBiaR8Aa021afDkuQ7RpTv0tMyo=;
        fh=zqejwDNimTgpDLERLHtIOkpdMEQBcHXeFNJx0QJKd5g=;
        b=G5bJU6PU3J4YyF31jlrlShcQEwk/RVTJxFUZNmina0l3p0exOBpeb6j+1e8F43xDwF
         GPe7m4f292mIB56fxnXf92wsc7q/Rz7/srMOvqPi6zhksQfzWtkp09Svv78Kz1ZEn2F/
         ZfmN5mYbTGy/wSrb796qQ/95Yc76PvlrdICv7TZu7d5pxLK2cCa4bREzIz7MgGfS9CUZ
         iS7/p+UI4A6IG9RLuaOW6sLp/ksOkFidUQ1J+BhsGbKkGIxJdn1nXlxcgbozuydwkWNC
         A+17nHwcmhVadlgPHxpX9u6Eo5X2x2xo32vZxCaeuFmqYlCHEjae0XHu/9kbxc0ovgGs
         wnaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782270089; x=1782874889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz2M93K2OvfErtDCnBiaR8Aa021afDkuQ7RpTv0tMyo=;
        b=GsKSZ/4RBOxlifOykikugUXmsixu4Hq47ikGHOUBp4EV23S+r3vEbmTRykYJ0A+ePC
         16a1ind/iVddxvbEc8HJgilDx9ckaFNeFbuvBLcHnX6SPc3vKt29mIH0hrkxd1DRMQj1
         bBoVl0JcMz2V3u7aqKHjlUjW4o9fh6th9rvcL4DaJshKjLMYPs2PGz26F2BeosMpIIRz
         U4tmXTzfm4b3UTZWDjBVKHJd5D/8KfTELq3TWvOSPpbo7Wh7dDCYeuJkFTE8eeFxB6NG
         OpiudNWD+W7V9eqmrxBHHQ9qtJmZOV3BiLg3b3JgKQ04UJPfouUjBQ/Sazxaz5Dwlqjk
         uPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782270089; x=1782874889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rz2M93K2OvfErtDCnBiaR8Aa021afDkuQ7RpTv0tMyo=;
        b=QKe7lfXrOCWdr9xe5wP9MpQvbd5wliloLlW2wGW7Ux7jJIFMNHbMtz7q7dCgrZpwFG
         /u+TR1yNe89uO2lJzI0fzwcFC/IpnLdqqSSIWBVrolh1Jg8F6/2gSCCCykZQ9kcsp84F
         q/fN/hH12BjKQsx8HA15dY+Qs4/tiaMaLuFgW3Yz5GB4LZ+Oflp7E8CxsZH9GKD82LWb
         dor8FGPcM+F9fm8Vm+54i/YM7IOxvllkM6kjD/H1SdbVTWosLwzEYKnftF9WYp9cnWFa
         JZzOmlNMxNLo6y8s/E0oMA4GH8YQ+6/ZmEl7onUhiQYlzMPY4onRYzksS/dtcObhL+Wl
         R8Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9BTxqPDNI2d94fJszgEhaHaW+wcdTfDzys8lJrjwoeLj+TAmR7Mn4ZqCc69Ppk3f/XMuEcnnEqFXHVcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZgqYQQdg7JPBLewy1yheXBnpKUO7I1Rt79LbVOG4dFcvn4wIn
	VPGTivQvHrOkvT1/mxK+7qW7L7l6dphUNGCJ345CASqK6Wt1HPSQBaLPL6I4MT0dOmgfI7nx3US
	Dr2JX5Fj0meUaKieiuYigXiYazs+8o0A=
X-Gm-Gg: AfdE7cmu37Ho3gfHbLoOdYEpbJRb2lcUh93MmIHUtshRWEM+m/iNOxKdp//qd8tFr/+
	XiSNhia9nfi7vFjCHyCFYCj8eOJZa5ntsiE7IXQ89GOtFHzMflXJsKo6z/OAtKZXEdMTDdcnLjK
	ny6uqNgeP/UvNXoM9w8ZMN3XQPRUewht85laAPkHyew9n6CV1M/9903c5C+5Vjg1t0aow+d0UlC
	APawL/oGi2Z2q0nsVV7j0E91fDJq9s3VXhYNADE1CSqU4+W+zVFDlqn++2xrBSp2PsvmhF20Yl7
	W40FhZTv1oQpj9ofMCJfjuGWJck=
X-Received: by 2002:a05:6a21:2293:b0:3b9:5efb:cb2e with SMTP id
 adf61e73a8af0-3bd10b019cdmr5917959637.21.1782270089047; Tue, 23 Jun 2026
 20:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <20260623105721.25865-2-phucduc.bui@gmail.com>
 <fffe4925-c5aa-42a5-ab8a-d8da4989b9b9@intel.com>
In-Reply-To: <fffe4925-c5aa-42a5-ab8a-d8da4989b9b9@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 10:01:17 +0700
X-Gm-Features: AVVi8Cfis4_zHv9r2Orkj7vx0CZGaMhWB6zOgsOtjshAYc3xZ5zL6AjoCaP_Wt4
Message-ID: <CAABR9nGh3nHnRx8yROqUuHLVZ1nWsDWKxJqAJaX3q+fiOBL+Kg@mail.gmail.com>
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

Thank you for the feedback.
I will definitely fix the commit titles and group the patches by driver
(atom and avs) as you suggested in the next version.

Regarding the ordering of this cleanup patch and the locking update,
I wanted to share the rationale behind placing it before the locking patch.

According to cleanup.h guidelines and community best practices (as
also pointed out by Charles in a similar discussion [1]),
mixing guard()/scoped_guard() with traditional goto labels is highly
discouraged and error-prone.

In sst_media_open(), there are currently two goto labels: one for
mutex unlock and one for kfree(stream).
If I introduce the scoped_guard for locking first, that patch would
still be mixed with the remaining goto label for kfree.

To ensure clean, safe, and bisectable patches without mixing guard and goto=
,
I had to eliminate the kfree error-path first using __free(kfree).
This allows the subsequent locking patch to completely and cleanly replace
the remaining mutex goto pattern with scoped_guard.

Please let me know if this makes sense, or if you still prefer a
different approach to untangle this dependency.

Best regards,
Phuc

[1] https://lore.kernel.org/all/ajUcTfG3vSGz3n3d@opensource.cirrus.com/

On Wed, Jun 24, 2026 at 2:35=E2=80=AFAM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Declare 'stream' with __free(kfree) so it is automatically freed when
> > leaving scope. This allows direct returns from error paths and removes
> > the explicit kfree(stream) call.
> > Set 'stream' to NULL after ownership has been transferred to
> > runtime->private_data to prevent it from being freed on the success pat=
h.
>
> Hi Phuc,
>
> Thank you for separating the change.  The design of the patchset is off
> though.  __free() is by no means a requirement for the locking update -
> it should be located at the back.  Also, grouping changes targeting the
> same driver makes the entire patchset easier to follow.  Right now we
> have 2 avs patches surrounded by atom ones from either side.
>
> Last but not least, please drop the filename in the commit title.  We do
> not do that here - some filenames are long and the approach leaves
> little space for answering the _what_ question when building a proper
> commit title.  "ASoC: Intel: atom:" is what you want here.
>
> >   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 19 +++++++++++++------
> >   1 file changed, 13 insertions(+), 6 deletions(-)
>
> ...
>
>
> > @@ -347,12 +347,19 @@ static int sst_media_open(struct snd_pcm_substrea=
m *substream,
> >       snd_pcm_hw_constraint_step(substream->runtime, 0,
> >                          SNDRV_PCM_HW_PARAM_PERIODS, 2);
> >
> > -     return snd_pcm_hw_constraint_integer(runtime,
> > -                      SNDRV_PCM_HW_PARAM_PERIODS);
> > +     ret_val =3D snd_pcm_hw_constraint_integer(runtime,
> > +                                             SNDRV_PCM_HW_PARAM_PERIOD=
S);
> > +
> > +     if (ret_val < 0)
> > +             return ret_val;
> > +
> > +     stream =3D NULL;
> > +
> > +     return ret_val;
> > +
>
> The entire construct looks bad, unfortunately.  Guess the reason comes
> from its follow up - the locking update.  The delta (+13, -6) isn't
> exactly a good advertisement for the cleanup either.  Again, I see this
> patch as last in the set.  Should lower the delta too.
>
> >   out_ops:
> >       mutex_unlock(&sst_lock);
> > -out_power_up:
> > -     kfree(stream);
> > +
> >       return ret_val;
> >   }
> >
>
