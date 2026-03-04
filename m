Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9A6371D02
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623137; cv=pass; b=sMffDWXzhXZARPbOWr6MUPEfTJ7UjFAkmCEe9nWCpour+JBOj6LXMsGaT1fQ+KgkaS+S878sqmS91Hk/7OHXie3RPrS9kk1xartRQCRrqA7nDSDa4OBbnB87eI6LX603BJz/ABXm/ombm1v+Qa0v9YV1jZFb7Sw6NAvD+ddx824=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623137; c=relaxed/simple;
	bh=k8xntpSn4kLN9LGpsUOGFCVWlyTenObtEwlAbjkHhNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CT5b9uNoaa3Ug2vhRaAmfbkx4hWC/WqpaA2RAFsgGGbgUR0TjnEZMZrfg3P9R9Fl35zfip6YXLhdaEcealDEGTZdmbWYPQkHCKE7cP3eq4gqMLVp2t7Iyiv6bVzvhembIF6mMQuWggFNel8AKYqvZ+BIFpGhrDf/9ac/2jczFHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbchpt1p; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbchpt1p"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3870dec27f4so55487361fa.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 03:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772623135; cv=none;
        d=google.com; s=arc-20240605;
        b=ABnJwvZ2ojrv8RYLHC2qJMrEIm7ob9a711dv0ZhXgfC6LxN3f6svW2bxKxermLwntV
         xAs90aMZZte7s6IN9w5lTt/I/J+7XrqBDPQ1TnTRTeSovD6EtQWf8LkSIJCnTvbdCviU
         Rk/m53hRoJNxux9DRwmEAmmEKVuO32G4SNbCl+MaWSbG97HuXFHeb2wN4nL31l5UJbcE
         vNDM5veRWxumlYePZodXQOZeUK3PyhG053rrWCO5oX/HPswSUBAuyDpv9ZXUnapYs0cp
         9nWI4GTgAsVz4K4jfwcZGMxh0weJ+ZjNzPGdyckT3WKXzRyw4ULxiN7pdOodhOefvqGM
         wpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k8xntpSn4kLN9LGpsUOGFCVWlyTenObtEwlAbjkHhNc=;
        fh=k7aSBir3THhsfLrR51C3PW6XwJyQiQ/IRaQkoQe73/0=;
        b=IjMZlFYy12gZNVDrkQL975QwpJc8njpZWnoOye7N1U37UDUjAzzwc3s5jWRqVH/tZB
         t0NpldMgaxLgHzfpklFULYE9f8Qti3NcY06gZuIJ4BBU5or2HwYUCynJiyUjK5Oz2Re0
         P2QCFmeBIQ/F2s6JQXpO9tOQ++EP1z6mPgS+7thWxGkGvj8gr+pYuc4sZtYT6Bu7iMKS
         rZRMcSatWLLPhUZXQemLWUHJrqhY4hUtwbe9HAas7sDUgqfa7upEu2IAKrq8d5auiarJ
         RLImk4ExV+Q/JMT2ENW2tpPdq+C73banookM79dr6MUeA+iEwI5nO7t0F9QLbLPgF/Gy
         0skg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772623135; x=1773227935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8xntpSn4kLN9LGpsUOGFCVWlyTenObtEwlAbjkHhNc=;
        b=Sbchpt1pl4qwgHDInOHJzXeSlpxrS+H1Msbr2Upjx03lnRyN2gfVDl6JDFJNMEiUOS
         ywskKclMsagXf2IhHKuVUS9tIvHOn69Y0EFiM87tnnLFXDp2ke5NEqfZHtkzGJBl5P7Q
         yihGEJoij/q4uQiQsTBSq+fvLsxcEPbAg9Hru0GkNHA7QArcWWfxg+PA0eacQLOrNG0R
         RxttAB8xbWLauffMTW4giS9beEOvWUVAzFSWHtDf8qe68Zi5q2Zpt/HRGJge2unt9Dde
         itjmd1+k8vBdt7ceAvjgTDvhco57vZaU5jsVKTopMwHG5YVW2Qpzi2asc2gtLD5b4eG7
         qJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623135; x=1773227935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8xntpSn4kLN9LGpsUOGFCVWlyTenObtEwlAbjkHhNc=;
        b=jG7Vz+jawbYhlscQd4t2dtzXvzDQxNc7h+n7QcvY2Usbp/gTkveg7bX7Lh58WjtCaO
         jVvuDYQeyhb6foasQ2YCLgj5qBJmAyqtVGWk+fUBhCi36HoDML36PKC+5ukmWIULpVK3
         JL9yu1rmFVZezGbMPDwXEhgUrDuPTk52X67otJwLrPsl8Pjt+MXy0dsN86RszexQ7/yj
         9/h9NpWG/Teuut/FCsMBTGYAkmiXLefoQrq7WwgdWu6s6CwGoR4yK0HvES+YcnUEF7YH
         2DP4r5QyNootDvfavonyEgNIkjZhJLUNACF80ysE/LeHlHlBM0zzBwDUCp8C09i/q9gj
         kFjw==
X-Forwarded-Encrypted: i=1; AJvYcCW/9IbN03OUqnZCUf2m4lQIZ2tM4oeAK6j2zxzrHtKCTp7BUMXm1Pmc922JdSA45SufoIhhdPXjQnu81Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmIYx4BVUjjWE9v5I2gNfNV9YUyksjwsRrKd4pxjs3hmTFX8Mk
	a9QrfvZ7fmSoXggb+5nfoE2vA+ZHLNcCpOwvDzeXLPn1SHbu7KPzm1fDpMjGVXV+YqrroyMetcx
	MXyaL+GiAqLyA0yYc9wFGKIZxBpX1xFc=
X-Gm-Gg: ATEYQzxg/F6tqFLMYWDGYu1Wao+1TQC0H1SgQRLKEuwDzl59dZrphPuVSYuyyfFY/Dl
	NDMo+ts88jyZCkACpy5ilgaZQbTmNltszJklPs/Z+oQv2tJU0gvYVPPm+RulTa+q2+dMB4z/U6P
	ne1+i+TDZJC0Rbex1RVUl4SBp+KsjGA1B0B5XweeIy7KlwFpvbE7K1yeUnNjB/WPPSJGotkIddL
	iqLMwQX/Lo/4LID6eryaganrEmyTK8L/F5066Wlx1wk/ziGAtjen9JuarRHXRF66wWqlRVAqd5w
	h4wVoBLw1Fnoy7Duyd/DsGrlzt+rh0SfVbw+KGqZcw2T7vnHfLTo+tissiQY+tilvScVPWNZ
X-Received: by 2002:a2e:9699:0:b0:389:e2e8:4f4c with SMTP id
 38308e7fff4ca-38a1c42fd11mr29290901fa.21.1772623134489; Wed, 04 Mar 2026
 03:18:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303132143.766078-1-festevam@gmail.com> <20260303132143.766078-2-festevam@gmail.com>
 <2026030422-snore-parsley-2501@gregkh>
In-Reply-To: <2026030422-snore-parsley-2501@gregkh>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Mar 2026 08:18:42 -0300
X-Gm-Features: AaiRm52Zvt2iFWuVjmnPrIN4MBFnJMLdY5blf3E7Xmb8ZskefAx76djlwC0TdMA
Message-ID: <CAOMZO5DioXemJEmX2Zu+vrwpOii_hQCoz-Z8XQYvPkcuzQXx9w@mail.gmail.com>
Subject: Re: [PATCH stable] ASoC: fsl_xcvr: provide regmap names
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, broonie@kernel.org, 
	alexander.stein@ew.tq-group.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, Mar 4, 2026 at 6:08=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:

> What kernel tree(s) is this for?

6.18 stable, please.

Thanks
