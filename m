Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41D3B14D5
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361512; cv=pass; b=Ay2jzY7qK/Sgf7HsqZGZeqmgG0VogAgAHcjczNRnagSsPjeEA7ScwLxdhCCq5zZMUgaWm8FYkdqYNcnbp/NsnxMS5YJvjcIMjMnQYavuv5W4w09Y2iPUTkPc8qPtYhXqsc37bRhSjing2eA4Bzyk3THYDZlY/tyXZtZvBvjBfoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361512; c=relaxed/simple;
	bh=VD4tYRxxv8tbQ8hahRY/ysVT3PqfH9iPQBMxS91ejUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJTNePDi1kXBROx5Yw7mnBWrHylpM6Ef8ZDlFLiDDGWNNfzYvnsFYvP86netAH7dyVaMf3sJt2o0dBxj3C12g/NDecNv/ZGp1EwoMSWmY5ol9FIbjzPDY3prawkHeugB8fL2aRGU8bMsOw2JOHhGEhgprBf0NwmR7Q1dBbtXrxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtEeWARz; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtEeWARz"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c2808dbc3so10364601cf.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 04:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786361510; cv=none;
        d=google.com; s=arc-20260327;
        b=AtxB4TwG7ObvIseOWwAcDietbOaXXOyTquFQifLC/EiKu9G39U7GOdOVaqG0VqJhKW
         aLR082U/d3FqlA2nsGmyHVL1frmi98PTIEpqTZCcxzVHzD3J8F8mIWSbFnQma+dTS3kT
         gH+J8EI5rZYxa3v7yThQu9YeCCThe7ilZHYAdverswsctNon9ieWKgWh7+zCxZN0rCQ1
         QMqJwPKFheelXk0qjytX7iiRQQ8hLy+w4Ga6PBaSoldYL700TJ4YRq5Fb9JenhuTCeN5
         BnKJj8IZiggoqfHrz5GzyIp+/J0Zu9pbMy39uGDFBTaGip3F5Ugf0cVjo9mTUqwSze6j
         7JaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/3JP7ohaN8UlxNVSWWMrfpGwIDHl+syjR7z/n9+ClA=;
        fh=7A+gO6X8fxA0urfhP/DliltIyU/P+YpDbfCC1h9pX4Y=;
        b=NM05nxBtrEdW9muraxaNNsYWxXd/PrmjORhAg5lFVHViP70pxHJbVWz4Oicnox2tUQ
         OyhFBRQk+Zb8uQ4YCXW3V2JWbE+4UUs2j4dPKOjKBbrV6mwm8TxhedyTh0rdA81Q9ZDO
         cZPfwgcK+sdeYWvKxCTTsfcrXp+nNQ1A+xX4BhVqsOndzDqebLp3h1U//e1wrda2Dd50
         07FtzPpjp6YoyLzAHuSyw8+x2RiPnTAGSsFqo+5k2ABCKjezFQYkcU1EsnMbsMaHMkGK
         Q+lneyqxlGHtbDCBOhHoIElltOorSVQEFyNaWdgr31dzAj9VRyReamEWSAex8OnYvNZ9
         p7kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786361510; x=1786966310; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/3JP7ohaN8UlxNVSWWMrfpGwIDHl+syjR7z/n9+ClA=;
        b=KtEeWARzdukSlLPXwB+TNZFBt+WWLXgKL2UEh8kX3MKZISFizUvtkQLUawT+c+O0wr
         o99GmF2/bmivtScDRmnmo2AIlVSJ8LwH6G6IJ0OHdNwMPPYggfAIb3LyYzFGTV9D3EI0
         OsO88mQJ7EbGmndY5MX5iWa+YmtbI63DUm8CJsxcpbkZkIYC8F8NnP2SpN+UPYuX5lHH
         YZQdqzGIKeCMLvuI6Iy6OpsMX8SBsk7UBO0SdPlhQxA1qm2AExjDly3qLBvN1ZJI5Zq6
         kPcuHHayVWVeBdZFG8/iMuxiliagPTwB7pBriCsa5hClzitVoxdE1omMPFJbP3USGUBo
         SSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361510; x=1786966310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/3JP7ohaN8UlxNVSWWMrfpGwIDHl+syjR7z/n9+ClA=;
        b=a/iV5h18PT9uZrRkx+wTniY2dMnXtT4slJ8BU2jcNKoJUFlCULDmTq9MIWpx/JMYWQ
         +WxRUTusgxyuruYM446Jm10xOnG0bJKfh6qiT10bcyrJ4Uz1L5Ak70ieHi8McuptE7dq
         iUv240vbTyNcuOGoZyRsa7X24kcRZSyFFL/KOnFHXxbhyRFd6aUZU+uaxnJPNlqiqsJT
         vS2C05aHk+ReOmYmdFvVRCPXpD7pMBzQOKVgxsVYPke8gH32jBOsHfZkNxziysGhEImX
         4vHbJZZdhyi1En64J0PK05zXixbL+2o2Px9dp6o7SaseXHynIDZLXIdf0/rXLuQw7syQ
         njKw==
X-Gm-Message-State: AOJu0YzGtzPXC954SOYHHoUy3xvrA8xxX1YrNjSvOxRROTcuByEvaNft
	EKmjSf5is8ycgf+Roe7AfRLRNNysn60/0O6re2NCrnyn3N82jlGJHTySElgB5+aeH32lhZQ9l6h
	2rhTzNx+lc8KNJ6LwghGXg7Yndyogx+A=
X-Gm-Gg: AR+sD13psB9kaXKHbmlPQ/J7c0x/MgGaPbyyRN1ZxldMxWZCsDRqIF3baECrb4+UXIa
	Ft8AqbrAt9mowlfcJjFVhoT45ckn3gEbiSrVFvaQH+/R6z2+BivlIOHKhJlVBPtFAkKIhLz53Dk
	plAz7YAW2342bwCqE/0jLUGL/EKMwGUSHEqLNQlRGKE7Kw+/Smt8sSvJXNloukZpWxwgWbjVt2O
	1arYhP+wcMKKfqRIe6APAyPk2/7c9hYYaJUSkiaGiGV66GTXxZfck9MSkR1C8ROHPW9ACei9diV
	PRCrkmdK7D+P/T8iMTSPBUkQH2LBFyQyXhSDhM5Lx8R4ZAZbgofNkAyhlEEMkGyB+qDHlUK1510
	4nw==
X-Received: by 2002:a05:622a:c8c:b0:51c:19af:6341 with SMTP id
 d75a77b69052e-52ce61d2d25mr472639051cf.36.1786361510049; Mon, 10 Aug 2026
 04:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
 <871pcbg3wr.wl-tiwai@suse.de> <CAEQ1D3ky_7+g6_1J7ymxGUq4DNrPyx8OCsQ8Z42j2-XncMW8ZQ@mail.gmail.com>
 <87ecgbecy8.wl-tiwai@suse.de>
In-Reply-To: <87ecgbecy8.wl-tiwai@suse.de>
From: Gert Burger <gertburger@gmail.com>
Date: Mon, 10 Aug 2026 12:31:38 +0100
X-Gm-Features: AUfX_mwBcEerPa1GxdXbV8JSwvecJm4xDVw8D0pPk8f29GgNAY0mOIddW_sxjQM
Message-ID: <CAEQ1D3kmssJk=ZFiiV1wLUpC9BTnu7RNjuLopYDU0XpocVNNCQ@mail.gmail.com>
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer
 controls disabled as sticky
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 11:54, Takashi Iwai <tiwai@suse.de> wrote:
>
> Good to hear.  Could you try the patch below?  I'm going to submit it
> in anyway, but it'd be appreciated if you can test it beforehand.
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 3330eb604911..618baa80d2b7 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2363,6 +2363,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>                    QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
>         DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
>                    QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> +       DEVICE_FLG(0x1038, 0x2232, /* SteelSeries Arctis Nova 5 */
> +                  QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
>         DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
>                    QUIRK_FLAG_GET_SAMPLE_RATE),
>         DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
> --
> 2.55.0
>

Sorry for the late reply,

it does work on the mainline package i have.

Regards
