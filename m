Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6524A3D25
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050350; cv=pass; b=CvbWlujRTPF56EmWo1CmZP2rktHJYxvGzYdSR1Q5JXxmsN7dwD+jR6ODeNBbbbjtDFNrxexav7Bb0OA2Mk9hEgqr9d/8lNpNM0jcNgf8hdt2Rh0lUBpGeKN6rJneu7sDXyhwoxkb7Z92P3UpQmGwmGEYPkcOVrRDrfCSAvQ65uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050350; c=relaxed/simple;
	bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJHiUAOgBcNhOPLuSsqpGC8JsWaCYAidv074q42SrIVkqvdETJg7Pt2DsCMT5Dyb0mNGc7b2C/n/g4ctSc1X0u8aeXf1GyWE171sATDsJVUbrEqs+wg44UoUVr6FQMWTUR04+sN0Yh/nT0hk1T21zhT+LcVnGNxXeSeJ8LjJKQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmXD1OgQ; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmXD1OgQ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so2661384eec.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 00:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050347; cv=none;
        d=google.com; s=arc-20260327;
        b=RpfHC03A+WHJ7oZZMu+bS3fv7Ue6Ws8w91iT6WTR/ngUKha6zrpXB6FLp1xlzIdoYd
         fOefmQjJbgwjTSD3h2sn9GYlH9DmBNB6V5eIBscIf1sptg0k7/b5htynWWaL/4X4H/s3
         T8KTDAGxgf9Ui/9oInHgzRRXjG6rmA0p5fHwuVUTrHhbeOiwPV5gzMAhZ824oa4ad2qE
         N+nQ6MNY1Ld5hqSK6qn+15+1XVRd0uQNQSwhcgIBlY8rUEKOUfs33cOapcz8GWOVDIsh
         pJSBOVThbT4QCVGa3KGVLJvOh5xLApy7IFjTjS0zfcPda0enGeWcjtTxC59uGepTa/qx
         m8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        fh=fAdVLPfHfCpNh1FxRm7/H9RJigrUrvrKqKmVqB7tsE0=;
        b=ctklLeKNmpvQE7kPA/kXvCcY9DZ7D6XlbokCWPKVQdVpz4QmSn1bmXIvLkMAXLlmT3
         WPjDFyN8Aqb7jfR/ZSsCT90m7GCOcJRLsPvpcmVh7JK/m46z68DSY5WImkT/9xElF7uK
         JDcPrF9OvHiKbhVMX3xmLhrRbmLcD6FtAGo7WQ/mY53HGbKCpoJZTwGeZifxO8GEbaXB
         9wwF2GXXSkTNPdRBVJA0EHYphTPtkuiyfzEMtgxqajT9kXSb59MW/bbb5CDoKzWYxpAp
         fPc9fNVjwmDKjxIBMcnM1WsfFlhMGRnSpJuvlNzdaBgi0Kz+rZq7RjurqkzUIjVxM32Z
         5ZQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050347; x=1792655147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        b=cmXD1OgQNrTBAqk6/7tmP67vRolPXu0Xa7ZtqukZYtIDJgPxN70Rcg07wDtHYLcsZv
         fMp9NT547SVB8M5jdMDaL+JBUZiFjMk0PnWPaf9eoTl+hnZvxlD1PhORlc20YwxyrPxb
         HqCc0lhFfdqW9h3WW1rO8q9oiyXEQGOT2n1Ly+Ahtt9ydAVAVJWXMakI5AZaQpW3wYqt
         BigEV/1xk1GHikzUjdAseEFcPswxjdeAZKG6i9GdQJSH+ExMpHiU9MPGGRx7BpOzp32y
         1JLo30aBPFmKYuYJH4ES7pfc221fxc55xO0k9HpebR+MRmYvzpG9bEFaUfBIrdh3SSp3
         W9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050347; x=1792655147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        b=qKb1QKzlIGRepDIPTrbDHwwFUUFFQS5JJRWqmk/pGBDaw/pvSbrRytPHkOLr0COP8J
         k6GRRXmSrbN9Z6lfTvKELX6cckuTSnEcNiIQ616Gj8S53gsrPlRP7y1kmDyGLn6dXXRH
         MC5tjVJV4Ua2ld+EeyH8wSRLapH9co+yLC3yD7uhVbR9ZJFDOcDCq5NqgBc1E630Dv70
         ONLted9KbOrd8xSJAcaCf99JJ2dwazEtw2AvZBw4lyJx1tpDpHH60zOssHVbwCsY3hDy
         Cl+JxHi05FRJt8n9m7y6ZaXDcWybJUlGXJNHeLLM8MWJdRk2SVUZOFv5QaVr+v0nY1xi
         TqXw==
X-Forwarded-Encrypted: i=1; AKwUvBwqb7jJxGpbESPlxVe1bjrhbTUUFzRZxPLbUvZ10GQ8o45V6XKggJxw9FwCGRCL3jJN61p6DzYuTAL7mw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkmx0IuSqHZToZrwgqT3IOpuXYXGn9IQFKXdumH3xG9cOv5h42
	LkLTKd8s2kD4fnWsB75eCJU/56h07EXLFRdU0ul0EqO8U6zHH/8KRwezk1PGb6XaheDSVWhbTja
	ea37I16ZJ7pcTgc/Gzn0WuHtnNr6U25nwHg==
X-Gm-Gg: AYBFou0+6l65HJHAjOG483v2K+iYIzaf3r2XYkAC2MypZAMY/L0/nHVC6nAjFw090nD
	8YG24JD5XPciZDwx0Jx8J1sIAYNH6Ttl9loQ2t2xNM0d6bf9DhXL9uVrFTTNtaS1RdWlaywlAMI
	CnLcZTl9Y1rJoDmQ2i3MnH96tjuj9/mm/PPeFk/n8bKLB7RJv0arlxbjPvhtAJig+1TqG0xOj7S
	UAIdMos4pEoq6qQ9XI2v/SMomz4B8XzAdBQNGz7QbOTKOHwP3riOiQyLUOS6XDg7N+OTitKfRPL
	Y+3nHGJ/8IlFFnq2nlUsvXWPKov+oiBB47xOyoueVhpr4rm1XjCmVGdhUhx6j50kq8JYioyfQ2q
	qgIWnFliCRX2K
X-Received: by 2002:a05:7300:cf92:b0:35a:3c46:80d5 with SMTP id
 5a478bee46e88-35a3c4689e0mr13623404eec.0.1792050347121; Thu, 15 Oct 2026
 00:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <20261013184755.530392-3-clamor95@gmail.com>
 <atBzoZhsanU90pxP@monoceros>
In-Reply-To: <atBzoZhsanU90pxP@monoceros>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:45:35 +0300
X-Gm-Features: AclHuK9K2QRydAoWIjgvp0vfxdb0H0LVdOrWtHQEIZxa4k3bTKOXeIz17sOm7BU
Message-ID: <CAPVz0n011sUEWzdybBf=M8Euf4oz+E0J8idhsicpZtr+dwKDgg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:3=
4 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> On Tue, Oct 13, 2026 at 09:47:53PM +0300, Svyatoslav Ryhel wrote:
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
>
> i2c_device_id is already provided by <linux/i2c.h> and
> <linux/mod_devicetable.h> depends on a lot of subsystems that are not
> used in this driver. So please drop the latter.
>

I must have overseen this. Thank you, I will drop it.

> Best regards
> Uwe
