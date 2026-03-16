Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234638238C
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652074; cv=pass; b=uXgTEPK1Jwd5T0KwkFBpCE6eBPLVW0KV9VHkeSVdPY/l72K6+WfuCIdIosnFhp/xBmFNlw6bXt13WnisBCL6oSdJZZG51dbuP/shOo45Fy8DCMjHtGEtNnrrPRyvlqVITiV4sTc5IY8NWa4XlS+yMO2yE02zZSaLhYiFVrg58zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652074; c=relaxed/simple;
	bh=s+KHY9gmRrHkbb2KUiblv6oxHo/utI75eXgoQMFDGOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkdqIPRa0VviquX6LaRiQf0TKa/nC36KM/w6NQpQ+rn5f8E+ro3S0p2uZwxREqe3WKaEnuCh9qhw/WaIsuvHIgcA/vu41U1pzJ1aOPtmLPa5CGjdDf9jm8peSqa9AZDawPwMwl1VtCzw2Axc006KJzS1fvhpKFcYezotZn7ntBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHODw2Oa; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHODw2Oa"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79495b1aaa7so38722467b3.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 02:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773652072; cv=none;
        d=google.com; s=arc-20240605;
        b=Tuklt9vqHHAHr/yEan2xeqiijzHcO5JyxKzPLhElpDubKvpScOTPQniZTS4Qbu7VPs
         jwRBIHTH2eLolnzcBi8xxeOcjTG8BUr5LVKpAQ7gXNefhnj9CmpBwx9W2cmUHGsVm8C6
         SfOYBgNEWgd44N5djsd1T2TYJyvq9m2PcpOMsQoWaZDO04T8t0DPeggHc93Bd+5/SUDT
         AmA/rlN+t7YB66XmvkmEjh4OfJSis6c7PRR1unLTLCWKngsf1v+Pk4TFSSyXBTmtgw+N
         qlcAXW+8KGxYR4YWiZ6eVJnNAKzzssOYt6EaH38uXEPxyHgH6DvurXSlo//Oj2XxcN7B
         qdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s+KHY9gmRrHkbb2KUiblv6oxHo/utI75eXgoQMFDGOM=;
        fh=mU3rLR9RL/pqbHY646jNn+i+cnkYZMksWOJLbcAxNok=;
        b=DGtc3hOtP/H+yBq4p7guPdWCqZgN/8Tinq3ccG8AcLNPBzSsIrwUApUReH/dRJB01Q
         LkzLEra90nGXOyCcVfiOkzEP8IdkBxv+oHQCvVq9F1UKUsOslQyxqGs114fCxixkjoSA
         TvRni3OGLK1Wv7mFT+p5pr4Y4joPVmEET142J4YmpyE7z//U1HzR0laBqXy+2pFVMxqa
         ZhaVM5hkRv0yOrh7lBmK60l7vH5dyPkVoWttlBT2mCl4OIBWxHobgVeC1phe8t8Vebcc
         bRfEr8Ari2Y7R4ooMFSEpKChilbvHWVrS70fYfLEwadAGhnvWLei0zsdWrcPiiwTnECS
         2KJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773652072; x=1774256872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+KHY9gmRrHkbb2KUiblv6oxHo/utI75eXgoQMFDGOM=;
        b=RHODw2Oa6eYGLHRNppgdAlsQ4WoKI+vhXahSlutXCb+WpuXNp90Af25s9QZpUFyEnh
         kzM39wdvvzTsvKnfC7ONg0lcOj94GyA423Hdq19RZKIFwLDnps9zNjayCGoRWVZEYIyd
         6rFWPH2qPUGOm8IYRdrrL8ruv8lW7HWrj6YpzqY6IMh0m7ZzDS/wPsTLIBaZmccW5DJ+
         pwGBFPTPiKfSrqtClfGf8EfJrcs5bcxv20DMGzoO9o4yPZiBDVGRVaiYcQNfvm4/pEMf
         vBmzR09kVaSaTCK0sJdjd/7z4oXWNCWN3y7sHZKa2LENYRVo5RZnqQlzITBGwniSg/TS
         yorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652072; x=1774256872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s+KHY9gmRrHkbb2KUiblv6oxHo/utI75eXgoQMFDGOM=;
        b=iiq1wlAcVgP9TFvkQVfvsp6YZ/MtRnJm74Oe9s89oJO/arUvSrKibCiksK8aObvOCW
         u01cOnIW6inOChJ4VpD/Yv6pgshRMXU2LvLpMVmwT+v7ZOYWS5ajb0WO0YiCdLoRZT1U
         VyJ8KqmhbKm2W0BoSXu4zCpyYb4RaOUtnn2JDXRsbSDBJcfYcR7qJudlbpvu4tVdN9g+
         nF2jYRovTkqWLMb9g3eWhIEBchW9cKSBJE44r0qUu3Chi4pR9WRUndv9VylI0VYR4n0/
         2XTsPqMaoCZ+hFQ2vRqQQLBF3bWbdqU95liwNEoJnezKa41ZFoFoG0eNwDGIFJJoiGoI
         mqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt60ujvnaPkiWCEYLICBcJTn2c9E5QyYVPDKUB+4ayK+YCUizkInm0tIfp+dWXBxue0YrP2cCWfdixLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZ9k+mPfC4Ry8oXGKYSHhiswLrQ3KOfSy1ywPBCeGzEHo5OmJ
	YY0r4oz8+gFDhi4dPBlif6lniRhdekwFDptRxuDbaJ5+Ic9wwh8TC+gWvP/fq3J6G3Z4GV9AlUu
	8TK4NErgzUCOmEQY8PGXwgoEEHpwmbC8=
X-Gm-Gg: ATEYQzzdMMOoznVn4WJ+q43G7Jyj38eayuIZB6aQnMLsXxVjvp0y+OETYUa34nrCRVX
	p2zbDDTBNeVg3OMO6GQkUDnS8z6xPiyUZUmB02ijSkxYtyr8axYx1d6HEocUubQ62v4uucooGJt
	bq0iCpm/2A6szshh/VA55Gc0J0OD/6e0h+evB1F5wV4ffuNhhK4kZ+0gEvorPTV17StgsSXVs54
	DzG0Aa1cFoj0DfhCQZyEVRLWd9h9vcFoD1Y7L9QWzQP6n5DDxnBn4PiP5+6ZVKDtxmmwWrCYnEa
	PUHGg/Uh
X-Received: by 2002:a05:690c:1e:b0:79a:5164:bb1a with SMTP id
 00721157ae682-79a5165165cmr20847187b3.15.1773652072207; Mon, 16 Mar 2026
 02:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316030550.2848349-1-zzzccc427@gmail.com> <87fr609nha.wl-tiwai@suse.de>
In-Reply-To: <87fr609nha.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 16 Mar 2026 17:07:40 +0800
X-Gm-Features: AaiRm527Fxpi9V52An6EYd4S7In0iPq5fR2lf_d7yF3PEpwQI6Gy37cB8h0PEdc
Message-ID: <CAFRLqsUDJU1587xqjs7EPKf47nGxPGdNg3H34gcZV3Lmb+TKQA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: oss: annotate data-races around runtime->state
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, chleroy@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, r33s3n6@gmail.com, gality369@gmail.com, 
	zhenghaoran154@gmail.com, hanguidong02@gmail.com, ziyuzhang201@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I believe it's better not to go with barriers but rather taking the
> proper spinlock, as it's only for this OSS layer, and other places are
> already doing so.
>
> That said,
>
> - Export snd_pcm_set_state() in pcm_native.c
> - Introduce snd_pcm_get_state() helper just to call like
> ...
> Care to revise the patch and resubmit?

Thank you for the review. That makes sense =E2=80=94 using the proper strea=
m
lock is indeed cleaner than barriers for this layer.

I've sent the v2 following your suggestions. Please take a look.

Best regards,
Cen Zhang
