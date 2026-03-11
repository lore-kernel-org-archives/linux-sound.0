Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E753CFF61
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226348; cv=none; b=T7eqo/Ki5VACW0UzIrFLmxO/RR8YW0IqygWzMrKAG1iE/zeLABfbOpQ5RINfKEFxXBQUnmBhfdkIClFv+VY1QrpdSPtVOgSTg6wiIQL5GK+rrkr/vahQsNyuPFke55/SRPfE4SRDSCO/dq1ezfmZLVcMAuX1B4e9oPOK1ZJBcm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226348; c=relaxed/simple;
	bh=VTFbGjqMuCilNHDxgvaQ2CTafhfYnCrd0sXbQe7PI8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOmU9t9PUzS4eRDAhfxSz7SGEIkLh3CVXDG3+mwR+qQkiPGZ2WtA7pUVLM7Cn+KIXmXI0XQT5VOf0oxSXA/Lx/6UZxWO1/VJsGSwCc7SrbGD2i7aVBTOYHh4FRNBDpI+1/+G1asSCAzkNMe62Wh+GwsuQ4IcYYxQwb9qYv/4CT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaSpd3xX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaSpd3xX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-829b2019b39so2508804b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 03:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773226345; x=1773831145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPTO/kKMdzOm1yb4HExAVv5DEVkwKacMrp7m0gdsATQ=;
        b=HaSpd3xXDX16q4GBUGcfxoIEdELCiJ03UWkTdU53HjcZGnsbR1ACyNdYWqkMf7LSIQ
         R4gc6J3pfGnv/0c96kdCI1ItHfcC0ZGMnI6FC3LZovDrNu/jRN/CToZ3JIzVipGE6eGZ
         MUuWRebr5z2Hx/sPnmhZg8MO9iyMIXch7rRSM/YnZv0AVrrI3nLeGlwTxtzXs9WMvemC
         yVu0WArwzIp1uUZ86uTGYypkS23aseuC/M9IOK9CkO78738aIuVR7EPRnkmAEfruq3jQ
         H3oAfIoXAYIIwSRH76dKC3oUEZ6HeYPD8MiTkoc1fQ8lLG+BKJA+vREb5bpLxfZFhrQh
         ZphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226345; x=1773831145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPTO/kKMdzOm1yb4HExAVv5DEVkwKacMrp7m0gdsATQ=;
        b=Ier4fIXeRoAyS64z9MIML6WCw6WNPfqYjRWvBsaytUuGUyw1DAgVTKKtsmeOa+ouws
         9k7h3xyTQ4F4hS0N9jeVaWqo4KX1c1MtPBGaBWhLwrKywpiYohBcYKQpgheVRJ/cgah2
         o2zaiKUiCc+kAWXGcP2ItbuM8UQnQdMIjMsLYezUt+ogwA2ea8AT/XtpvlQ5O6BGlW5U
         MZzX7D/mWgNx8UPXk4xmvkspxWetYz7r34Lo8EONuf3IGSsqWmWtLM1Q+Ols9SyngaLx
         a2Zv207VQoXZvL7MEdgH1aAMAKDtNQHQhO8gqSAVV4yKodkTGiFRcDWvUB4K1yT4tDs4
         57NA==
X-Forwarded-Encrypted: i=1; AJvYcCV4I1Rt8NPgCxO7b/NoN2eMsRTcN8ry9saTx89kjoa8REI6658ENIaNhv9P9skhr1eRbxn0b3E3hKc99g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8g1pudvkEYT/uCt7FWcEbdMQONGqnRX0aAdmyXXHsO+ECmdWY
	l7PU2TGx4D+0xz7ZUXPUi0gpkdZCZM83niljHiY1ZplWfB3wquM1s/Si
X-Gm-Gg: ATEYQzzdkFscKUyholXe+WJ+OyxV3JSP87fXwASSoHyBPn2zymPFWcwb203gl69NtKh
	TLAlFqe4Sy0u0H+WMZsFEFqcPEqHRh6UByGdVgq3ej5TVsN/sjo6FuePlMh6MPZ/OQtATvCt8oL
	kB6vOdNFnN+1FRWOLk6WAaqzCy3uHOk827YmMMK2vTt3axzTvB7VqeAQmVF5iP2sb6O9gGttBup
	WW8Ls4X3ZqDT7iZVPtm6AFSEuOkynXzmyToH8F/0G8NvvX9g9AJIEVYaH0ImXVvAdNNZLGOfpwQ
	alz0p15/bJxicezgjz9wlwcw32f0NHM+3g9i4FbeKCVin+JlBOF04DlRUqeVIn3fjr7E+PfD/mt
	Sv/hh2rkdmjyPEEiKe9n4LvRdU4+RnL0QYOqBstErZqKGBT8n7ha7gZROhzHcKJQzWElX0qsGFY
	ClOu96uLfDsBUEcXAVxNge7LCg2lPGqtUzyzF0xZ6iDOCjkzjZTdNYheCq7sX2yrS7yrlmB8dgn
	rTpKc6gH0V/H+BByBqevvJNag1TBfAH3NOXxkyKsuFumUzqpZLagQiw/wjgh7QaC3c4rjgdP5dn
	qZFVsvolGW3ubg==
X-Received: by 2002:a05:6a00:9510:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-829f707348bmr2146847b3a.1.1773226345365;
        Wed, 11 Mar 2026 03:52:25 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df32a6sm2255620b3a.14.2026.03.11.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:52:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: cs42l84: set up PLL for more sample rates
Date: Wed, 11 Mar 2026 20:52:18 +1000
Message-ID: <3333069.e9J7NaK4W3@minako>
In-Reply-To: <ac417b14-dcdd-4e67-b1c0-b41ff1e22fc3@sirena.org.uk>
References:
 <20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com>
 <ac417b14-dcdd-4e67-b1c0-b41ff1e22fc3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

On Wednesday, 11 March 2026 4:51:25=E2=80=AFam Australian Eastern Standard =
Time Mark=20
Brown wrote:
> These are adding 44.1kHz based rates with a new value for MCLK (the
> final value in each entry).  Those values are read with a switch
> statement in cs42l84_pll_config but that only has an entry for 24.576MHz
> for some reason, that won't match 112.896MHz and will just leave the
> pll_mclk_f with whatever value it had before.  Don't we need a new case
> statement there for the new MCLK?

Yes and no. According to the datasheet, the chip only requires the PLL to be
in the "region" of 12 or 24 MHz. Since we only have 12 MHz region PLL confi=
gs
in our table, this does actually work without changes, albeit unintutitively
(and accidentally).

On 42L42, this is configured using the MCLKDIV and MCLK_SRC_SEL bits, which
behave identically to what we've ended up calling MCLK_F. I will add an
explicit arm to the case statement and a comment explaining this so that it=
 is
not ambiguous.

Regards,
James


