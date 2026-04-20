Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34685346A1D
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678763; cv=pass; b=drSauhK9T+ksNdDrO2tpClCcR6045kJHExe/nVlz+weAlETPb8bLaWEQCf1EFVMNHLBbhgE9DF+Efz1PID177FX0PGAhwsKMfsIJMD+ZFkXte4jtU6GAhVXganozJAOtuiC7w4O7T1S5dLcdNkZJ8ugRdIsvM0DFF2Nl+IQ1CSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678763; c=relaxed/simple;
	bh=K8QyqTJ7u3MbNmIt3uEDoO7EyIeCq7qUJowH7wGWT1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfGd332pWtfUYqGuFglSPZDMmlgFd4VO2awrzcCJKdOy7/ai6NmpGB0v93rVmuRSsiFEkrXzFyL9MS8BQenqQb/Xl98pFwGaiT6lVu2fLb69bUzC2maeSQGbzKvoO8N7e8ObYLN3JU+vLdBJVeHQ9o95KJSCOl9E4QnIGmFBJ3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g6wjz4g3; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g6wjz4g3"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50d6b393d60so1359171cf.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 02:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776678761; cv=none;
        d=google.com; s=arc-20240605;
        b=eQRWAWUfyAHfQ+v13GyQOXlyw6sA0LXD9gU/Hx9rbiUOL8orop3CNZOPOsIlGlBwua
         mZGIR+xIQtLyW+CCB9OCVhKgGjsOnC4JOPTaZ6dKMK1aq/VHTONnYdNLRxqvXp6grZPx
         MvUOpkLC7Vjs9P/uTS/rwbRKG29ku4I3+9oGWQDZnZmOGvk7x4nr0XpUykFIGBHQUU/r
         2gIfpuYE5CSXtuzNSBN0Raj923elN317tJoQpUpV30G8JxdLKH/m4amSebeif9YjAuSM
         TuVD8bK+DaI2i+/OMk5tzSQdFLeJe8LBd3L+sa26BuE3cL0xp3LDOz8pXXvQV9FFgjRV
         jClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZJFqws+j5AOBYzY+cLd2gYlVXG4eG/jMxghRU4EHA/Q=;
        fh=ebwyuzi5xCyrdomzAuYYBY6QMMkX2pqPTQNSulChRCw=;
        b=VWou2IWtJh9dvxWjXFQfzt+TYMUhhFy9vMoCkoMb8Kj5eANCtVNiuGG1lL79K6VFu+
         8V50j7qqsh6Tsgu/adyAOKTI/u80TqBnhe9/Qvt3lWoD5eE+oT0th9F2n3f4m4syZ1Gt
         G9/Z0/Y4pLlLzksuyX0kLfk6GV4s/mpCxCIXnzd4fK/q+yI8AP/g76a3An3tR9TOsoqk
         3JCADP9/yYVXzlnIytDDkhiW+7Q8aqVGbWw0H2IbCy5l/0dPXVKpOHIqQAVU/a65/npB
         T9gcFHDKMPKQ4583pEnoO43wiZebwbFqaNzKoGb1iePK5bcsvvaPRtIllXw7/Aqhg+TI
         /59w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776678761; x=1777283561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJFqws+j5AOBYzY+cLd2gYlVXG4eG/jMxghRU4EHA/Q=;
        b=g6wjz4g3xOQYVKRiBE9kXjRH4o8rPAcEgEOKIkqbYIEfntBreCwh97pgaeorDn7kLK
         hwBovQ9NklHfrH3jT2+J8BFOPsHTmOzWtrp4yiR9oIKq+SPzj6RGV0WUpQKCfbtXoJiC
         cWS7kUeXJcByM8M2AuuHt4zQsfbqXCW4smogZ/0Dkl0GOcoMduppoorPallqh7Ned/dP
         b/vVACHKEHCViiGI4wlmJuTNB56MT+yMs3cG294yiPb7lTSxdQ315F2sV4FRDD8dXqFj
         e5uoytVCjWghjrUxsAm0Gqc3VlCrc2V/q6//MisUo1JZjhMPrlPm1EGzB8iCpTPQRgva
         vn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678761; x=1777283561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJFqws+j5AOBYzY+cLd2gYlVXG4eG/jMxghRU4EHA/Q=;
        b=EakSa4EKQh9cqkLBdtc3X1Zm2qJweiAiIIm5sJcQZxKmwXL8TV+ABGrC82BEwF16CO
         wWWVhKlV62aC2EZCooF9UDa6bouLhN5WlAsQdJ7W+QSYISdwYzrZCxKrrOCmKjPPpWb9
         L8uStkHJgP3E4BPEkIEJCI7jAJrHYMTO2c/W2aq6q9rzTCSfyTHJ4NvDz1PTKuZtBPBF
         8APBD9F1Ha2pwzoTWH9IiKnw38EVWlHYKGmBNH00yb0q55kJbtxRgj6RxtXiwITy/UPa
         7usDb/xju9H/j/qLbChGbmkjOtz9QsioT4OMtVYr7x5Fp5pkPJFRCSy00z8zB0/7lBv8
         /k1w==
X-Forwarded-Encrypted: i=1; AFNElJ/adtQQXXmCVw5zXAtEk69TqCuwZoTDYON1Xt2Q3shQq+mTHxbWVuV0cm4gKrXY8edkj3fLxisi77QtOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RWHAVkeEMURa5FViOgDxefe92YWROCDuZMC8IkE0XRRownOX
	FCgOTosZwaRlT01AoKWXtHAHt3smZFlF2Z/HQGCjvxi9qDMqW00DgSCCCChr7RJWZuDQDHnd7aM
	gQAUuz4qpa/d/whPJBZkmDct8Tti7MIRbt+AHWMrr
X-Gm-Gg: AeBDieuUE7CVv3lJRhranvsyXvbgS9u+X+Rbx8/9tOUPV3CzNRRyJCrjWM7dlorO5/2
	1Ztvf+HB9UTGAZhD5gaS/Q7D6uaG3+915Ru6wVyPEAbAeOrPm8xs7OEpa/2A7mQFnp3/eomjsZs
	wySUNTgQhrrWPBpal4gWRbWu011LYgL8ybrEdU7PHeST8DJvsS8rt0rrMZeDV8tumk0f52EgMn3
	J+748Khg9ViwT3yWtCrI3WJl1nxtxF2O+NeDSBQPONMACb478uA3TDjSXY0bkS2V0cA+TWpQi0g
	MWIHYtPOXrLfroyAQ74MIm8ndrgZuKm+Luret9ntv7rRbA7aTeHsPTv8
X-Received: by 2002:a05:622a:191e:b0:509:1d4b:f86f with SMTP id
 d75a77b69052e-50e42aaf95fmr29462291cf.14.1776678760747; Mon, 20 Apr 2026
 02:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417054641.3814385-1-guanyulin@google.com> <87a4v2dla2.wl-tiwai@suse.de>
In-Reply-To: <87a4v2dla2.wl-tiwai@suse.de>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Mon, 20 Apr 2026 17:52:00 +0800
X-Gm-Features: AQROBzBt4iynjxxcoHExHwdWjAhR-qGKggECLwyUrWLXvMm_G_6ofcbqcd9rycc
Message-ID: <CAOuDEK0j5Z2am2bWkzvVdMo-7cd2An=QnaB_Yz5t8PnpV6HB-Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: qcom: move offload usage counting to
 stream request handler
To: Takashi Iwai <tiwai@suse.de>
Cc: gregkh@linuxfoundation.org, perex@perex.cz, kees@kernel.org, 
	tiwai@suse.com, quic_wcheng@quicinc.com, arnd@arndb.de, 
	wesley.cheng@oss.qualcomm.com, nkapron@google.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 4:49=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 17 Apr 2026 07:43:30 +0200,
> Guan-Yu Lin wrote:
> >
> > Centralize usb_offload_get()/usb_offload_put() calls from various helpe=
r
> > functions to handle_uaudio_stream_req(), which ensures the usage count
> > is tied directly to the QMI stream enable/dsiable requests from audio
> > DSP. Such design provides a clear synchronization point for the
> > offloading lifecycle and correctly balances the count for both playback
> > and capture paths while avoiding redundant increments during auxiliary
> > operations.
> >
> > Suggested-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> > ---
> >  sound/usb/qcom/qc_audio_offload.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audi=
o_offload.c
> > index 2ac813d57f4f..cddab55d4691 100644
> > @@ -1605,6 +1597,12 @@ static void handle_uaudio_stream_req(struct qmi_=
handle *handle,
> >       uadev[pcm_card_num].ctrl_intf =3D chip->ctrl_intf;
> >
> >       if (req_msg->enable) {
> > +             ret =3D usb_offload_get(subs->dev);
> > +             if (ret < 0) {
> > +                     guard(mutex)(&chip->mutex);
> > +                     subs->opened =3D 0;
> > +                     goto response;
> > +             }
> >               ret =3D enable_audio_stream(subs,
> >                                         map_pcm_format(req_msg->audio_f=
ormat),
> >                                         req_msg->number_of_ch, req_msg-=
>bit_rate,
>
> I think the usb_offload_put() is missing at the error handling of the
> call above?
>
>
> thanks,
>
> Takashi

Yes, I think we should add error handling in this case. Let me update
it in the next version. Thanks.

Regards,
Guan-Yu
