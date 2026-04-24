Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8A363090
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025591; cv=pass; b=foBfY3uRD11w4OFyCiQhwxciuqt9GnfIqHugoShu4sor8q5IZeHe7StlTXpwSInFKslGUUFgZdnl4Ij+G3Rxoz5EWxhtYG3Jd3Y41s9L/My7JueK0Eha5dKTjD3jK3GVl2FaKk4SjtkBm8h3pxJdw6cdxVkih82sg0BMaZDazW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025591; c=relaxed/simple;
	bh=bGAh8HP1XJ3pNI0I6v4GUBDrX2cjKfQinlKi4kQx/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqNbBQarEZVsqVY+9ESqiKtSQdaAmBlJiBE2WbMPu8R7n1+cWue6lTBQDqBF7rFZSleRm92VpJy+QwkxOXWnNjqeo56AlOx9rHEXW9PXhNMj/3fO3gs8bZBtpQDK99jABhDMXNmQ0v0jPV+sC+VKhjBs0CfidK0bz8HiyoOyMRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=P2mMgd6Q; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="P2mMgd6Q"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7986e0553bdso73333767b3.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 03:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777025588; cv=none;
        d=google.com; s=arc-20240605;
        b=O3PkBeFomiOv/+JCcRoP20rdMrpc0Bt/KAhNjxGGXtEY10R16TgcQWIRvWO5t5hTCK
         ZAw5iDlXWdp3eWgU9aiSup6aTCq/5RxM0g/pDkPbVOKFA7Kb1hPJy/ZNCfpFp18OkUux
         XbUDyQ3OA7k8Ym/tkM3q7DRD/eLT8zVC19K2j0j6ItwB9LEgrc3icc7EGVSLN9NCglJy
         wd8+CBhaItQ0COSPVcR1C+zFAyyaRX5tJwrgzI2b29kaoW/w8w8rxO/BvLow+zgzCLST
         nloqVPySI1vWYVHMFSgSGeshPMYUfcH+ZGNoGgA+ikEf/jWljFQmljEJXzoqerzUqFxW
         YEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2irfcGbprq1AW2FZ1Np+40bjZV8ZTBW0rYH/FdsUVzE=;
        fh=nAahVD5ZR5S8Cvusxcsk9BLvSQOknQLtbaxypg+kwmI=;
        b=CPA9X/uFsTfa6qBdHHEfvj55gWNgfSGVzI0KzAqmgkCDBhGPwdC6gPmNwXRESQH7p4
         JWpTsfw8wras3vbyJMAIdj4K+bfTJ0om/vjpQuIeX/HtzybabMqPP6ky3Y81ptf+yJHS
         KtfezouC/nqymFr+b3Df1sabTaALFI9hcZnQ9h2V+9yJ/JWxHZ5JP4MMcYNmkUeCgCUj
         mZIPftQm8GabdRp/Pq6aPbpheDsjc6vCZHgmF06Y7WjDtbCQPzCUwk/d4hxtn9YmSVlq
         N+vbitoD1IGFSRq/SvDm96IerER7OWcUZyi4prIf/ftVGNXqsxmfDg1xuYhRfKOm8UR6
         8C9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1777025588; x=1777630388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2irfcGbprq1AW2FZ1Np+40bjZV8ZTBW0rYH/FdsUVzE=;
        b=P2mMgd6QVndCDCuN8lAm5BLrpDISdEBiWkoG/fEZl+TUzXgzK6nYX+FvB35eZbZoSC
         MSr3xoRIyiTPYrd4wYM8Ro6HWhHKBG2MtQCsOlkDg3GQwkHwifGfALCSERjcvj3pHl+7
         K8nurDihYU+3s6OAqYqUqvqfYY7OXOmNL76Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777025588; x=1777630388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2irfcGbprq1AW2FZ1Np+40bjZV8ZTBW0rYH/FdsUVzE=;
        b=FaA8XT+/kSU7fxyt5rGHYOxIyfynfMDH+SYYbxFboUqTjoYRYAuyUWPz5448KDda+t
         y3FmgDNhCHr1yhZlS02jasbpNCigD0YuL70QSVN4vyb5TM6Twdk9dpQDFqfphDzPqObG
         KJALu6zjWTMZYz7FAfjk5pviTiC6yy9MJJSmkGAuLKXEyDT4xkZ/5UAmqqhRgwCCkRmK
         UH3TOpUXwhC6f938gIANJdelKg4cCeIOU+i11xMlrJtMqCA01Q3IKEBVtRfDA5xLT7C1
         aRuvbXzgy8QKlUXP5kP2CpsrrgWh640yx9RA3FBJNozBHH4/6SVl3MXThJLGZMJDqew7
         08ew==
X-Forwarded-Encrypted: i=1; AFNElJ/TJkv4M98L9XW7yAFUHspem2u8oVfcaUq7RdiLlW43UcuZYahTjWundj400oZQOuoxLmySVz89+6GkgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAGVBKd7Y/SvD0C75jhvzRrmNUEGYSqPPk8yd54UbOr2zat3Y
	k/zUSnDikAQ7FM9pRfVE5wbbTSKiP0L0LiK0fZrcK6sPvpVaWGtC+WUuUn9ZoAuINQL+VkEE5Np
	bpPmFImU56nDb+pvds76kyokKnfGBYAGWj/6aIF6hdQ==
X-Gm-Gg: AeBDievNh4gNWdPnsz6iXMzoqVDPWxjuhLhUhe19caSlQLppiS8ygmZ1wrUGIWoS7G5
	smKHc17/gJ6oBy6yC3IdNZ9qkz0vp+0pjFEqthMVCqFP1JDmeM+W/2t3tS4QItFO+wCfW7fToWJ
	mY2lmETtuy7DpxEkvTvKA6amks44UNRZoCUME54EtOCHf8WpgbOPmw158QqPflU41nq2uD2M8RY
	QuSBYnTjrrB3VyOHmt/fr6kd8/cULnc+bsRxTNj0iHU0J00Cc+BoGAbmMayhr1eF55Hi7GzuKaO
	Wh8AyJ18g15PvKNTBTdiGIFrpBRc2yhHlv2tYl0Bjb5DS/ZkIpk=
X-Received: by 2002:a05:690c:c4f9:b0:7b2:4735:b99a with SMTP id
 00721157ae682-7b9ed05fa8amr301889487b3.49.1777025588033; Fri, 24 Apr 2026
 03:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423145330.210035-1-jjy600901@snu.ac.kr> <87a4ut3dfp.wl-tiwai@suse.de>
 <20260424071208.2388558-1-jjy600901@snu.ac.kr> <874il03gpy.wl-tiwai@suse.de>
In-Reply-To: <874il03gpy.wl-tiwai@suse.de>
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
Date: Fri, 24 Apr 2026 19:12:41 +0900
X-Gm-Features: AQROBzB9VDKt7yUH_X_Vi6UIercZ0vqHsqs-oVQJW7i5aYDG7AzbR7aNadbgZEU
Message-ID: <CAD6E879vAXrUasE1Jp6xdPO_AZ-wbqRoThZTKSfVu2s0BbntiA@mail.gmail.com>
Subject: Re: [BUG] KASAN: slab-use-after-free in ALSA OSS read/poll race
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	byoungyoung@snu.ac.kr, eulgyukim@snu.ac.kr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 5:28=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> Does something below work?
> Once after confirming, I'll submit a proper patch.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -2155,10 +2155,16 @@ static int snd_pcm_oss_get_trigger(struct snd_pcm=
_oss_file *pcm_oss_file)
>
>         psubstream =3D pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
>         csubstream =3D pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
> -       if (psubstream && psubstream->runtime && psubstream->runtime->oss=
.trigger)
> -               result |=3D PCM_ENABLE_OUTPUT;
> -       if (csubstream && csubstream->runtime && csubstream->runtime->oss=
.trigger)
> -               result |=3D PCM_ENABLE_INPUT;
> +       if (psubstream && psubstream->runtime) {
> +               guard(mutex)(&psubstream->runtime->oss.params_lock);
> +               if (psubstream->runtime->oss.trigger)
> +                       result |=3D PCM_ENABLE_OUTPUT;
> +       }
> +       if (csubstream && csubstream->runtime) {
> +               guard(mutex)(&csubstream->runtime->oss.params_lock);
> +               if (csubstream->runtime->oss.trigger)
> +                       result |=3D PCM_ENABLE_INPUT;
> +       }
>         return result;
>  }
>
> @@ -2832,6 +2838,17 @@ static int snd_pcm_oss_capture_ready(struct snd_pc=
m_substream *substream)
>                                                 runtime->oss.period_frame=
s;
>  }
>
> +static bool need_input_retrigger(struct snd_pcm_runtime *runtime)
> +{
> +       bool ret;
> +
> +       guard(mutex)(&runtime->oss.params_lock);
> +       ret =3D runtime->oss.trigger;
> +       if (ret)
> +               runtime->oss.trigger =3D 0;
> +       return ret;
> +}
> +
>  static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
>  {
>         struct snd_pcm_oss_file *pcm_oss_file;
> @@ -2864,11 +2881,11 @@ static __poll_t snd_pcm_oss_poll(struct file *fil=
e, poll_table * wait)
>                             snd_pcm_oss_capture_ready(csubstream))
>                                 mask |=3D EPOLLIN | EPOLLRDNORM;
>                 }
> -               if (ostate !=3D SNDRV_PCM_STATE_RUNNING && runtime->oss.t=
rigger) {
> +               if (ostate !=3D SNDRV_PCM_STATE_RUNNING &&
> +                   need_input_retrigger(runtime)) {
>                         struct snd_pcm_oss_file ofile;
>                         memset(&ofile, 0, sizeof(ofile));
>                         ofile.streams[SNDRV_PCM_STREAM_CAPTURE] =3D pcm_o=
ss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
> -                       runtime->oss.trigger =3D 0;
>                         snd_pcm_oss_set_trigger(&ofile, PCM_ENABLE_INPUT)=
;
>                 }
>         }
>
>

Thanks for the quick fix.

The patch looks good to me. I tested it on my side and no longer
see the KASAN report.
