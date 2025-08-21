Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F982EE281
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766453; cv=none; b=aMRZ9krVogBx5j1xbhOtM/o6VvzoX8e0rz5I5ypppFUpy68m56rEGZUuiP1NKT01GgH1S4sN/8PPZ51IalBIWwEKOqMdS2MyKVWDpErmMQvW7cTyAK/3HZbYiIeaUyBiaRo1Z9af9CosTFunnl1ZdiGwlIOnkrG5i+eu7/Y5AWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766453; c=relaxed/simple;
	bh=GIrYS0OmlFt9LKTpoCymctnhQ+44IqZBFk1EpEs09Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUCMr/Y0AbCNjbHsOlVdasc2CRbb36/EDjQF5EoKXw+bmZsuqs8bs6BNnPVWTwCxX7N7ZfOlA+FZPDQBEQ/o/JxXCICguQVC1sT7YAHSA3wsTeQjl81f2qZSMBmT2aj+2dDvXlWOE1DjjP9O7SnZ5aLJw7TgFD8A2AmVAojJV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxD9TlRC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxD9TlRC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24458263458so7180175ad.3
        for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755766451; x=1756371251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=;
        b=KxD9TlRCA0A4ZXAR8Okitj5EU4UFjLrjRCn6OrHRKyS9gOqo0shoSjvaOvmu2w12iH
         alzvpbSmmNpzxL8VQsTXcPD7nPK1qXolRgAJyPLiglhlueISHLEo8ItCM6QjfzzrkOe0
         85El6+zUOtsfmbdVSIzqOT1vx0vS9a9N/snvIjQ7mVhEmmb8uyRefVPjjOQSUy+ttTSo
         n0hVUgS1gkSt2xZZsxCs6orUuYe8jj+e1BA/OuiKF+v3FwS9pL6DEW4rTUbCxYEJYvnA
         5cNnqDZ1AIIwIqNbF9avj2IIOp6N1ilwkb0wG/KD6RBlPG0pQ8Jn4b49kRutvR4rh9Yi
         HO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766451; x=1756371251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=;
        b=KUMHm0u/2LR20R96p/BnHkOmUOA5CGlX5Rq+AtBc2QG5uWPxDQiqzxOwrshMs1Q6z7
         hpvlQluBFO61iKjD5v1V3oYI1jYv3XDv7rzsfR2kHa0IPGCQ+wRLDJBzofSwGdPNEasg
         8j7NDtUfGUpwY2treR+R6EbN7tL6LCeNHsIZazIRvah/O1D4HSoWTUMfEExXf8TnjlB0
         yMY2lypyVVF0PLpxdF+wtxY4NtLxEVF/OR9NspY5Vpllx4ieO4+g+H+kdRTSNNV6T+Jb
         cYtQQR+lTEa7CnQhjKeA1T3NVhf2s7LM0H472SSSPZxyFKgjxaVr7nz4j2nUfEBg2sVw
         QLrg==
X-Forwarded-Encrypted: i=1; AJvYcCXIeO3sNo+ZyzBID8Ix2a/WeQga952aZq1bIEHz5h1S2COLsLJMmPSN365P911MjIFJXdysgN4oqBB8lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhW0l7gUL4AAbZw2ss44qois9Rv14b7MCoUnmYJHOnK0ZWL5Q
	ei2q1B2Z/JGPFfO8TkmSeUPGtvLnL/VWTs4A9ZarpFcnGohBpVuhNFlngsfE8vE2E3Ae96SV1a1
	OzmhJDsajwwz741N6nRXalk51E4tEezJHeviV3CMn
X-Gm-Gg: ASbGnctvoaKQkZW0Uc2OxT/xm7Ug1y+Lq17F+Ez0YXcPUlaaGrhxv+R4Oa7PM1xmkhq
	YO8wcim9yIxyvJTK26Am/e/xdwxxGEOrAsZFo1iMZ44b9WEWJUeAro1k7WHaWzGomvBiU+8a8dG
	8i1Bch/mvgTtH36xIKCPyufEq4Tm5qPwGjWHUTZY0Of0F9YOQ8zvUrVEej1s96Yle2xyvDEXvvj
	odYOe2QAzGxhyOagUrxEtC6
X-Google-Smtp-Source: AGHT+IEOJ+GiHnoM0xXwePeIaKaKu+bZ/GYxKzuA6yTE5qBa74SEtPQ+etUTrmOlcSdW9xiNKjgOpyr6oyET1zwx1W4=
X-Received: by 2002:a17:903:46c3:b0:246:570:2d93 with SMTP id
 d9443c01a7336-24605703276mr19916595ad.59.1755766451273; Thu, 21 Aug 2025
 01:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-4-verhaegen@google.com> <aJGNgphPCTuE7FFD@vaman>
In-Reply-To: <aJGNgphPCTuE7FFD@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Thu, 21 Aug 2025 10:53:44 +0200
X-Gm-Features: Ac12FXzXjgkmnFwjD3_zb-Ps1Osi-BQvLWpKMG84-DK22RezOWC3UFnJT0qOukE
Message-ID: <CAAntYmKu_tsm1D9koxCZmHpBMQYhrt-HxNBYFeWz6rCqdMZqPg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Aug 2025 at 06:50, Vinod Koul <vkoul@kernel.org> wrote:
> >  static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> > -             struct snd_compr_avail *avail)
> > +                                struct snd_compr_avail64 *avail)
> >  {
> > -     struct snd_compr_tstamp64 tstamp64 = { 0 };
> > -
> >       memset(avail, 0, sizeof(*avail));
> > -     snd_compr_update_tstamp(stream, &tstamp64);
> > -     snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
> > +     snd_compr_update_tstamp(stream, &avail->tstamp);
> >       /* Still need to return avail even if tstamp can't be filled in */
> >
> >       if (stream->runtime->total_bytes_available == 0 &&
> > @@ -233,32 +230,47 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> >       }
> >
> >       avail->avail = stream->runtime->total_bytes_available -
> > -                     stream->runtime->total_bytes_transferred;
> > +                    stream->runtime->total_bytes_transferred;
>
> Lets not do formatting changes in current patch please

I'm happy to revert the formatting changes. Are you only referring to
the alignment of the subtraction operation (avail->avail), or
something else too? Note that the second line of the function
signature of snd_compr_calc_avail got re-aligned by clang-format due
to an actual change (type change to struct snd_compr_avail64) so I
assume the re-alignment here is OK, but please confirm.

> >       if (stream->direction == SND_COMPRESS_PLAYBACK)
> >               avail->avail = stream->runtime->buffer_size - avail->avail;
> >
> > -     pr_debug("ret avail as %llu\n", avail->avail);
> > +     pr_debug("ret avail as %zu\n", (size_t)avail->avail);
> >       return avail->avail;
> >  }
> >
> >  static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
> >  {
> > -     struct snd_compr_avail avail;
> > +     struct snd_compr_avail64 avail;
> >
> >       return snd_compr_calc_avail(stream, &avail);
> >  }
> >
> > -static int
> > -snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
> > +static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
> > +                                   const struct snd_compr_avail64 *avail64)
> >  {
> > -     struct snd_compr_avail ioctl_avail;
> > +     avail32->avail = avail64->avail;
> > +     snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
> > +}
> > +
> > +static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
> > +                              unsigned long arg, bool is_32bit)
> > +{
> > +     struct snd_compr_avail64 ioctl_avail64;
> > +     struct snd_compr_avail ioctl_avail32;
> >       size_t avail;
> > +     const void *copy_from = &ioctl_avail64;
> > +     size_t copy_size = sizeof(ioctl_avail64);
> >
> >       if (stream->direction == SND_COMPRESS_ACCEL)
> >               return -EBADFD;
> >
> > -     avail = snd_compr_calc_avail(stream, &ioctl_avail);
> > -     ioctl_avail.avail = avail;
> > +     avail = snd_compr_calc_avail(stream, &ioctl_avail64);
> > +     ioctl_avail64.avail = avail;
> > +     if (is_32bit) {
> > +             snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
> > +             copy_from = &ioctl_avail32;
> > +             copy_size = sizeof(ioctl_avail32);
> > +     }
>
> Same comment as previous patch

As agreed in the previous patch, will leave as is.

Thanks,
George
