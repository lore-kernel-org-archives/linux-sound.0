Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761AD4D9573
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351980; cv=pass; b=ZpugT+Squ6WxLZElhdCGp/Q0ocng/Ag78hnFjsDH1vKqPDF0p/YjmPXzW27SOtL7iNxLHBI9sURiKjhuVps0EW2RId9BtJD+ugAdmBptzYdj4467xj3lOjm/hscyFf3yP9e6QZvhUdngFo6zIsjswZ+4IKPq8R2L3Pi8b0TTLnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351980; c=relaxed/simple;
	bh=B8qXiETtR85WVcra197BwDvJNPoWm77eDu9rHOSvLKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubMQYRQnTzk8jrQ8/fHz/wYKDugnh8IEhFAj5jGNd/A1VqGD/VRCRkWbDOAUWWMTQcJ5Ne3ZzAPWUNpyEfRNMDx1H4i2HOW4vU3pi1rkk/9nURghfqtuSif7bFo8j4AaLQbnw+QoirY34KVlHklna3SjvJy8RUH29C04a9hqKeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTV7BpY9; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTV7BpY9"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4d9bso734263e87.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351976; cv=none;
        d=google.com; s=arc-20260327;
        b=bEUOann6gPxmjr2pSC0k2peVZkUlHJGlmwrIGVFq5uOKrTQgy7RGwkgWbj6rp177LN
         ZPbDOhNln8lykldSvvWsJJQ0qEWcZpzYbGTT9ui+7cVIDPyDVukwHKncwU38lnpoVcvA
         haR12pXbWrAwTcjmd41BQ3eaVxX7ny/9n5O3fgZcP/k/NTWvbvNpF2FYBgKzjcf3nIh3
         n1W7Src/8PNno79YiC99PFsW9iWLeTQhslCBgX5MKNGgRtvpcLKJ3OH/pRdvIBonTskU
         sOHRhV5+8esKoNrpkGjxiqkTl/eZ7GPnnwp6kJKC+gFVQm6s/v7k9A7xSxBxl3wDbiJX
         cw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itw8fQgIicRGc9nxPOOoIpwP28yPsa9toRCa2T1HmuQ=;
        fh=+/X2H2o2MMEGVB+kgBAz+iI72gJbzpr3yZQ59Ybeuyc=;
        b=lx5aar2vD/HJu+SZ04tdNP1wI5VuVhn9QhyJxek4Wq03oNgjb8RtwmNE66SGRpYHOZ
         0PVgKMP7XlMaT5cfaCfqMaAHD0CBotkE2C0DOJmV2DBWM9J2lgjna4jXO/kJGY4qN4q2
         qzVM/pRn8Qg9g/7eq7jgtP50VGkw4thD4KjC6r+AYi/36A5lB/3TYi21W/hHCTpRJmTd
         AyP/g4YTypyJigf4g6rTxJ/ixJ+t/7F8rQPVLKiCOxb9YR9dAJKezfntdMrCjwbiBoQq
         ccix7JtgORN4Id5Q5cneqo6RXjrfkJXIg0tJlmE0YNVm4Odjv0+GQKYvMYzc1gz0LPO7
         0llg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351976; x=1790956776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itw8fQgIicRGc9nxPOOoIpwP28yPsa9toRCa2T1HmuQ=;
        b=LTV7BpY9ONvaoJqYVmYD7Ld+4/7TYSzUmRS+YZTOgw8a+OhOFZIPScvyI1GhZxn0EO
         5Dd2IPdoSmQ8DNmmdqhA7OTTJAnP9nQ0A/OxfHWN4orXknK/BSVvViEwAnKN7k9KAtGe
         mUupKxshfPAPFhF4PmTjEBjqb7vPnjeq4A9IB/Aacgd1SwpwCSdeshpEyTlWSorfs67E
         xaR5Pe4IM7zzwZkS8S8Fl7HrLOLn5MZBcmGUHWRjJOo4Jppg5mMiyPBBmMEHVxyteSwO
         kMv0JDwvPA1qVOCQCyH8gj3dWYUExqkEh1M3svb2cWRHSexOmLuDSv2JMqjm/4zutBop
         AeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351976; x=1790956776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itw8fQgIicRGc9nxPOOoIpwP28yPsa9toRCa2T1HmuQ=;
        b=bEd48SXN0ghFmljxbH5haQDOKdML+eBat1PGRg16cdsrWj76DIcVMEqvMAp4jp55vF
         u0NMAvGk7fvrbNNwe0iM78BPnPvnE3m+MSNRHd/V9OA/mayXtvupmcqYi1sy1ww+wfgR
         K7k45N8gGGsXuMUzkBKRxqg71zaOVXc8l2DENzu/bohNzXo8dR0Kkk7Ww2gMFeLD8Ovk
         lm836HheymEeJ7VXY2e2y4mriw5NdfMWXWOPZUYJ2dt0jc3QvzJ7Qv3NlOAbNFlNv90P
         qMSJPwAYmKpDx03d4Y25sjGd0J76KvNHhoJBM/PV48re4tgUONc67+DDke98ao50nziq
         BFTw==
X-Forwarded-Encrypted: i=1; AKwUvBxjRXSdFzU7qoSPGZm1v1phK4poeTuLTBmbmx3TXfh18/wnbI3ty0tMbsuPzwbuvuCgruvz3KbcSbq/xg==@vger.kernel.org
X-Gm-Message-State: AFuF++lZSQkFqbwodCc9Fny2/anJb8c+rvK0aUU5UovUcNsLJnMm2Ayi
	rBvz1uap3F1LsDvHQwVgDjjqdrPmj2puY1ZXlvcFWdP5zNh2ykg9lfx2zuk8XwMKrTn4ppe15iI
	qVBfCEbZXBEoEsEZYtC4e1FPvCFoV4zc=
X-Gm-Gg: AYBFou36d4YiIgGdwGLjYbyhcHYW0Qr9p/CcnkUh5u8q7vav6OqAZWT2lYiOft0Nx39
	WsSkivchqjJSwi+TXlp/IQCfNNj7uicwEbcpSqZHX3QoELcAsnF7GTdXF5INTJdHaBf11r24YWi
	dXyuyPbqqdXpJ+prs7xBK07RN2DV56FkZI0moWn221T68u7fr0e6IEEAYxvFtxeRltYm135e/To
	Pn1u+d3YIsA06V8oH/IWsQmK+/2YXcntPT+531uzbcAztDvKTP658jHnXXhb9ZVnB+kxwEBiI4C
	zAi0XnhgkpLUmD/U4qbjj8ri1mXK6+KNpWinIuqLLUhfh1YHmb9pj3HA6Ooca9BRZft5noOr/2X
	S3cmplB2Zd7GgjgGfu2dzBboQo+TYgdcM7QFZnfhTSbo=
X-Received: by 2002:a05:6512:3c8e:b0:5b8:993e:6dcb with SMTP id
 2adb3069b0e04-5b8df092be5mr2238351e87.20.1790351976183; Fri, 25 Sep 2026
 08:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-4-11f74cb5fe28@gmail.com> <3863fc1b-dd0b-4841-99bd-f2b34b2a97f0@sirena.org.uk>
In-Reply-To: <3863fc1b-dd0b-4841-99bd-f2b34b2a97f0@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:59:24 -0500
X-Gm-Features: AclHuK-7gR3Qf5WaP5Op8i4YKKqgNim4U9DhMEJiZAJfouW5l_AEjU9Gv5kf_EA
Message-ID: <CALHNRZ97Uije_nbzZp7kba88di=dXrRr6_1S62SXMyUBgP0gcQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: codecs: aw88166: remove fade in/out on start/stop
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:11=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:32AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This "feature" was copied from downstream, but it does not belong in
> > the kernel at all. Remove it to simplify the driver.
>
> Are you sure?  Some devices have really bad pop/click performance and
> need ramps to mask the effects, we've got other drivers with soft ramps
> in them.

Ditto replies on the other changes. This was accepted for aw88261, is
there anything specific to this driver that doesn't apply there? I
have not experienced any such noise on the AYN and Retroid Pocket
devices that use this amp since making these changes.

Aaron
