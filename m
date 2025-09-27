Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C83C27145C
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758978228; cv=none; b=umiZmTPoI/+F73saFYKLShrUXzReDnoZTM+s882x85idI71iCn7JT9QvWSVEAtJfP1TCKAI9F+FZkYHKIRVIpzNdrABqoTpZ8VYz9aASouKIwMx4kFMHFV4XG8+wUu7sPaMqbl8ef/HtVqCyACs0m8tNiZCq8ajtmbz62iutqm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758978228; c=relaxed/simple;
	bh=/fWjDy6V8avarvNTCc+QfosD1L4dICg/f5aj4SVzYzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAcSSrRUux+likQSdIR40sh/QdQPmqQonjQImthT/mZk8hpQkrpxIlLJf4Q3+ePrwtOh9tky06j2ckklUMm6LKOlafAA0F3Sn5xGcvyJdL4Q9rHhVMA+YdNMJvuuYimY5xJiZr4ba0eiF9lOTVLC5Cr23nLloZpgwqfGHvetHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPVfMT0w; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPVfMT0w"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b555b0fb839so2263751a12.3
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758978226; x=1759583026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj5tk1g12uwJWHZQdttUwkD9hZl6wqd9nBrGl6G3EH4=;
        b=aPVfMT0wQUDt+FvdtdudZWosKF/I0wA4eo7Shg7D4A0K4FgXH3UZnSvkR0SuvvygRq
         6BnH+m0gDfI1qTl/jrofAvBA3buKb8VJsTKq2AULR1626pLc9DwdqvqbAN6VH+0Ve2Xy
         MCtuX6jHtSmQjuEz/fzXrLfbhrJWfsxWmMGgfdkyoNpTrbqT/xtMgacPXNgat8BE34QE
         roDHQQtWmxhjMyTheLo54IqmxaiU7CiykqX7DfY7xopneaPf5PzYLg800jSXjuL7wu8a
         ksqN8sfxkI83UIb/KNC4X17bjaY2SAWPdOQfI3h/24sv2YQvlt/vNkxBOOWpz9sTdY96
         ufbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758978226; x=1759583026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj5tk1g12uwJWHZQdttUwkD9hZl6wqd9nBrGl6G3EH4=;
        b=RQNQBxwuAJCxbrJi7itPyQwOYmPFWexVf9vSBYPgKJ/vtCY4IkGOzG6xubjGdSUAuG
         xv8UVWOVlkDtxUsrvKvn3tRMLRHnLwR61MgVNmZgWJumN4Sqrqz86a8PPxtPCoL/NPV+
         Uh62Z7GfTAaoIshfxvLQSY22ZxZtQZAS/xUKX9WB4CVkYLnUkuD2W472ikcJJajDnIIw
         Lk/MlX0OYW6nznHSJhUxVFYbMwnTwHwKw/dHM2dwyuZZpw8ZvPiWfHBoT0tEMSrHNKcz
         TDpePx/wVrIfdvqoo+tI/2gclJsqpRr2alSicwHsLSvklTiTIl+2P0s1CoxZSahtOLmG
         /RiA==
X-Forwarded-Encrypted: i=1; AJvYcCV9GNm4egWffqU9Q2hNs9t9Zw0un5dFZkd5l20iHVAhFaltp7HvMcMgQGz3stina517i2jvko+EtcOLUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZZhK2s3LCLGo/ouUYBCqghnNZ8+PbKA31lLzPhHmH5A9BiLj
	9AusKDiWroigpJfIwBATISJT21KONB9IKONiiraHl24DYh0gaWpT6ngUi2u4ptCY4n6ILMHURUM
	y/DTEAkQyMt1X+RBzR+b/03w2j7/J6A0=
X-Gm-Gg: ASbGncuvRtzLx4Orka7G9WdMhYJU+eY6jSx5+ltZ8d33Kh8ipRcbF96tUhIDdL3d/Gg
	UwRHDcdw6rd39gxK8uz0UtT1od74s3QnggZVut5l0adTSH3VRbx5VdMkBqtEIIW6GCdCp5by/L7
	bfrFDb5y3+K4J7QwxBxYVDbY+rWhKTVIAycwxPgVLusz8rI7aNzTthqKl2S1aPq2y81daK1Fink
	vBrpZ7Jnch63vTv6NTqdejOXsYeWiQXzsBmjima8wd63ySLYeNvkRQr1iE5oqRkeHhIkw==
X-Google-Smtp-Source: AGHT+IFQydMe94D6FwmBD6D2qXtQeTSXE3uir5zVOh5IAVVaCaSW+eB33R3ldR/4t5FzOh37nVJmnRCAO0XKqK8E6YU=
X-Received: by 2002:a17:902:c94c:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-27ed4a29ceamr124277135ad.12.1758978226334; Sat, 27 Sep 2025
 06:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926162658.989479-1-kriish.sharma2006@gmail.com>
 <878qi0b97l.wl-tiwai@suse.de> <aNfRhzjqs6Z2fi-n@archie.me> <CAL4kbRMp912C+xqO4RYnGBO_VSqXJDSkNMgktd04zcUMOn_4-w@mail.gmail.com>
In-Reply-To: <CAL4kbRMp912C+xqO4RYnGBO_VSqXJDSkNMgktd04zcUMOn_4-w@mail.gmail.com>
From: Kriish Sharma <kriish.sharma2006@gmail.com>
Date: Sat, 27 Sep 2025 18:33:35 +0530
X-Gm-Features: AS18NWALVElsH8JKQCuuo6ictSDUaIsPrD2BhEg-AqZ4pZxaHqYhteAWJCms6-A
Message-ID: <CAL4kbRMLnkJJcC9zoS+vSbwPxsU=82960vc1pOcrDZKsjLbz_A@mail.gmail.com>
Subject: Re: [PATCH] docs: sound: describe 'chan_map' member in snd_dec_opus
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies my previous message to the list was sent in HTML format

> Thanks for the feedback. Do you prefer me to send a v2 with the Fixes tag=
 and nested struct documentation?

On Sat, Sep 27, 2025 at 6:28=E2=80=AFPM Kriish Sharma
<kriish.sharma2006@gmail.com> wrote:
>
> Thanks for the feedback. Do you prefer me to send a v2 with the Fixes tag=
 and nested struct documentation?
>
> On Sat, Sep 27, 2025 at 5:29=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
>>
>> On Sat, Sep 27, 2025 at 10:17:34AM +0200, Takashi Iwai wrote:
>> > On Fri, 26 Sep 2025 18:26:58 +0200,
>> > Kriish Sharma wrote:
>> > >
>> > > When building kernel docs, the following warning appeared:
>> > >
>> > >   WARNING: ./include/uapi/sound/compress_params.h:364 struct member =
'chan_map' not described in 'snd_dec_opus'
>> > >
>> > > The inline struct 'snd_dec_opus_ch_map' inside 'snd_dec_opus' was no=
t properly documented.
>> > > This patch documents the 'chan_map' member and its fields (stream_co=
unt, coupled_count, channel_map), resolving the warning.
>> > >
>> > > Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
>> >
>> > Adding Alexey to Cc, as it was added by his patch.
>> >
>> > If any, please resubmit with a proper subject line (e.g. "ALSA:
>> > compress: ....") as well as the Fixes tag pointing to the affecting
>> > commit.
>>
>> In this case, the Fixes: tag should be:
>>
>> Fixes: 5d36370f3431 ("ALSA: compress: add raw opus codec define and opus=
 decoder structs")
>>
>> Thanks.
>>
>> --
>> An old man doll... just what I always wanted! - Clara
