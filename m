Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F848124C
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155019; cv=pass; b=QJqOQ0MMsssQGK6a/NsxHLCr88Pqhv445P6cFpuBLhisAqJa1Oj25Bi5PvRx6ppuTdFDoiJ1p7KfSnahm5fND+wteQYuNjNVcC9bxmIWsL5F3bZdIkhy2o2PfZ40kmvMno9MqvQD8bqYSho1WneeSpvpEqGL9F8wjQ7OnZ42Gos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155019; c=relaxed/simple;
	bh=1MtXL9mGYyLi0fjYCHpA9fWEu6AI4NWfXD4RPwcMmmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEt8dnI067Ud6YLdjho7S/0G6W0iiAYW5/qXLP3A6h5OUUZ+j+Enj05eZo9C6p7bn+VhrfMOKenL/s59IDbN8EerVb14u8BlaNWrwwdhHwAUDWKw5azwPZhR7J2+3SMUcQW5QOfbRA6hfAb0ViHSgnKDYryJSjLuEU+dQnIcIzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID0hrt41; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID0hrt41"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ab3d3c5761so53560667b3.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 05:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792155016; cv=none;
        d=google.com; s=arc-20260327;
        b=LbCBX4JBtPS9XaZVik8NcghilR8enmAcYjMkYuaG6RwNIWh3w7X9kpAPfzrKYhEJ6c
         9HbzEjYFSK9p+dye3WZfwsgU6Z4hk5uv/Ky3WabfSiR5RQfkLjwD0bfweIgdR0z1qkZW
         a52EBQqvpWlTpY9FDweUcSq3Mt+APhMA/e+8h0ORPh6FeE9oY89ilBPRf98Mky520S45
         zwRpnYcDAkZH/XVQnIJiPAu6dXP7dnQv9PL885xW0VTrpkMahEgTaer/dHVVdEYOOIOl
         0XQk7MOmPH5I+scDEZy8H5DNOq1nUMyCyYrdhsaK7AGj6DcTpS3sSATbrFWPZ4HUeJ/y
         Qi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixZiXg3DpqQLlqPnsFNiW1oZccPMNZwd2UYeKFHm514=;
        fh=Qaiqj/PxzqiW6H0J6nDu6Tt1/MXYd93E4PvqSXpt8U4=;
        b=gQqJaFeKpd9phD6kodBfBGvknGmBU7glqNPNiwHfPu+SEWEVZx/nZQHaruLPw+m9D1
         juGKAbtVyRaVUUDHw+ohlm/fcCFL8r8kS6v6GC4J/pUnMXb77ktpchqsy7tLXZdwDLHW
         6rn1FnJ1TYZZCKE7xRxqiTpvWKgsdzxxQQrkTO6SDoDBzRqxlUhvTvEqIzt7T5/qZ8qX
         YRL9c8MorHaGgMGayyx1DsBnsiMvuWhHZkT+yoaAZlKvy93XGRWoC7BSh5E9ufznXKIN
         ZYr9kRDwxR1skCaTgTJIkdZ/Sa4APGXlHwkRg0ZCHjrsKMXNZYpwjXV2aNPqcX9HJwOl
         dkXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155016; x=1792759816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixZiXg3DpqQLlqPnsFNiW1oZccPMNZwd2UYeKFHm514=;
        b=ID0hrt41wdcA7HOdjTypyvqjK2+bp//oSrVanWKlVq+GjNEu1KvSL9Ko+A2OSqXnFz
         dF2ojdr4b95KFJc4L7kQGdhDGK1Qu/N2O5TrS6tEdRRY79T7TKH/jEoR8IgwYUtwNDux
         lrcxEX0obRU7r3Lgq9S63eAfC0aeditAHS/bghXiqj+qTZlErRgSkgQ+x13b1MQxRh7a
         Z4AgUB+OqGMbBY2dGaAt2neIIQnmtJjRujhquo7OAW1NwNrNKCKoXauPvyCsbg6EvENr
         fORFwJTxE5JQmGAJ7fnoBBupx+lHwcCxh2RxfzkexHCu/jPghxkABxXEEC+trG2lH/uy
         OhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155016; x=1792759816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixZiXg3DpqQLlqPnsFNiW1oZccPMNZwd2UYeKFHm514=;
        b=Qd1A01LIFe1lwgng7hAleUyMUuDT/uJ4t4A3d8Du6cHAZ29Qe2ggjJtHxe/bXtmPxr
         Ut0RyW8lkj/qcZ57RhLN9epflOnnlmZ/+2TUCLnRGN+7gHMweSV+jfShaRKJhpZql2R1
         QFAVqvTqNMYxsojXQ2Dl+uas2mqNaUOpRMvN7wD2bgR3AbTfKjXP9LaVJ/tbHxkkZ89r
         3e4ht+DzLKYVr0qcfOjBOe/csmCJzpaw/Wd09f7bdwVNbFQsXgvdEs7fiSH3YYuUVqZt
         3mXi26sOh4xcBiOGyRf4tPh2on9tLdjWtOLIEwZiAvdIcPrWHJUrSMtCneoU1VaKRwLh
         /j0w==
X-Forwarded-Encrypted: i=1; AKwUvByVRNccpIu+33ei6WZcrPQPuukaafbbxHVqj734cEpvWeNzS/HRbm8KpZA6qIINEDOth/nsckcR/j2qqQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRQ9MpLr3toelxEuTiSZT62MgpLGJS4dhDT+HDMZJAiByFW4IS
	gudkaKJWZOaj4HjYZ2sHXlGFmuBucZ2eff/UJ/iZfRSlYC+w7Hcx1vAstCJy3h8mUl7s0DqCrg/
	xafzEd62PaFObV1dfAq+XiveLSoIcodg=
X-Gm-Gg: AYBFou1bDvODBzIUh5vf0YyH/Yb6gQmOYeyluPdw1eBaGsjKnpI1BabYY+YYWDniepJ
	V3EZuZMo5taDRDoQUOQvKAh/nkmxM/fCp0W82mY62dEIoDnhW6ilWbPZ93Oe9mldZYlk7xaBzNi
	laUmCf6Zk616+9dQSI8VIfApwuk+NrrqS+Z6/5qOiyKzgufUA4q8JBsLpyr6LQggUsvWFk0rge3
	QTf+NCUBPFuxNpe008Glu5zd8SZDlObNtBkrXEOW1E+Vfz2G3tOZpFXOdTj3E+LU1c3Rx/Pogqz
	xZ4ir+7vzKYzhqJGmU8ZZrt03sCUHvYkXGjdb5zaPOJVyj6hqL/MNas28OeGdVR4t1XAfud8H+b
	s3T3yN5wEY8c=
X-Received: by 2002:a05:690c:a186:b0:8b0:d36c:14f6 with SMTP id
 00721157ae682-8b0d36c1ee8mr19025677b3.51.1792155016446; Fri, 16 Oct 2026
 05:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-7364ede2179b8830f660-v2-ca37049bc2e3679bb65f@gmail.com> <87h5iluaqg.wl-tiwai@suse.de>
In-Reply-To: <87h5iluaqg.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 20:50:04 +0800
X-Gm-Features: AclHuK_zr_wz7gkffPgcSUdCxRifxJeRFC54lcCq55oDX3Fga1mI679bJ9E-H0o
Message-ID: <CAFRLqsUi3te_Dq=o8jDCQyXMO+OmjEKMqa7n8KiRLbifRuHnsQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Refresh the CD capture switch before use
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, thomas.weissschuh@linutronix.de, 
	kees@kernel.org, phucduc.bui@gmail.com, sammiee5311@gmail.com, 
	clemens@ladisch.de, tglx@kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 19:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 16 Oct 2026 04:01:10 +0200,
> Cen Zhang wrote:
> >
> > The CD Capture Switch control must remain live while
> > snd_dummy_iobox_put() updates its access flags and uses its ID for
> > notification. snd_card_dummy_new_mixer() caches the control pointer, bu=
t
> > snd_ctl_remove_id() can unlink and free it without updating that cache.
> >
> > This requires a kernel caller to remove the switch while the dummy card
> > stays connected and External I/O Box remains writable. Userspace
> > ELEM_REMOVE rejects this driver control because it lacks
> > SNDRV_CTL_ELEM_ACCESS_USER.
>
> So, the removal shouldn't happen, but...
>
> > With I/O Box initially 1 and CD Volume still
> > present, the following ordered sequence is possible:
> >
> >   1. snd_ctl_remove_id() takes controls_rwsem for write, finds and
> >      unlinks CD Capture Switch, sends removal notifications and calls
> >      snd_ctl_free_one(), then drops the semaphore and returns.
>
> ... how this happens at all?  Unless 1 really happens, the rest are
> fictional dreams.
>
> The same for another dummy driver patch.  Does it really happen at
> all?
>
>
> thanks,
>
> Takashi

Thanks very much for the review. You're right. It is AI obfuscation.
After carefully checking the code myself, I could not find a real path
that removes them.

I'm very, very sorry for this noise. Please disregard both patches.
I'll be much more careful in the future.

Best regards,
Cen Zhang
