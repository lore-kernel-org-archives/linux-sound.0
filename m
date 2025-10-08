Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228622C08C2
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 21:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958892; cv=none; b=uC8gLpPUmP17Lw6YbVYWATf6k0I4ylzWintAApKut6NHZlkjxlqsE2m4lYWs2dOSv+Mr3qzUxMlPBS99wM/3hk9PYBcVeLGTb596HrctDXMwXnRUo2qqrX3wbBw7g6BE8+GXa4al0Qg9A8mI4MHCjq6EXOWD1PdI8V/tEMvz+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958892; c=relaxed/simple;
	bh=7n+YI83Xj4h934x6MbxCQNgzt8Vm1/5zHm0H8HdzX2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asp1AhAfBGgydDdB3tavg+euS4keRpae2y1U49FhxpGn3yGYqNkVbZd6tIjLbF2jW+IObMh4plGYGuR92vxhQSLVG/LwRz6kMwlv5//umTHYz3gxLKuJw0crYLWBEYVeVjsR4Drg4YMOb5K3ggkUBqLcbZqhelj274foak+zhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDtyGF07; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDtyGF07"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7bc626c5467so265688a34.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759958890; x=1760563690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n+YI83Xj4h934x6MbxCQNgzt8Vm1/5zHm0H8HdzX2I=;
        b=nDtyGF07We1umQHNf8j+ukDKmkqD23RyI+5kMwnOJCmGpVEwfEMv76J4bamwJaZaoo
         284nXOxvS2uJz2XkhUUwqd8I7VeXVvutRrP66FlZTZmjqQ2PwTqTOGdWrlIVGkZDB8+2
         U+kYHCVRdWNZgSAlxelcRIIwGirsilry9Gtil+SiWWfMzmIlVAZ3UqQMFSHCGH6IdQLi
         dWvJxY3/qDkL2cBWcU3+Rl0vOSGIU5p+aNTLuqrulHkHalOGoC1+85AhsMOAlHMbUknE
         PjozJdbz+bsgMULuKbGQzRP4FPMvjFJGuW7KydDJDxqqY2GUngJ51J91IGSaew68dLLa
         cNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958890; x=1760563690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n+YI83Xj4h934x6MbxCQNgzt8Vm1/5zHm0H8HdzX2I=;
        b=BNKh+d+XbvYcArvhVgfGtZ97FiPpq/+5cc+FaOWcUOu3T81bi1t/xaUqXQ2QPi6mlB
         huLbIFVSQbLXXoF3qGHGFOj14jHH+1+9zZ0smN+PrqpKNhby5LMvN1lSfK3Kg8vWz3UB
         otHHKMVURZXMZRBWZo9N5NVkgU+cmQkC/FdfPOK3Ao85aZx2HE1toAJ2htdDs5QBMF5E
         pP3I9QSEVRttQXvXDmpvNMTg6fX/1p1emoBscXqhmz0Ab8L6EfPcGB/0pVETF/vhvCXi
         8FMAfp9gr6cJsngSmOB/8BcR0jltT15+at2yDlSUTZSqGaPK4rgvQitM7Bd0gsmREU4m
         JW/g==
X-Forwarded-Encrypted: i=1; AJvYcCW8LmJu4JGjL53BEyVh+Qm1oUu5n94lGUMKjsmG3c4sDKIos3jfjF20es8lpUO60wmDa9LPVehJJZIAJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrjgVptWOLfR94LZIw96mEMjnoGlzgueUrxAwqQzd7hQ3s8EP
	5YBm1MoUa156W229VFTxa9qtLp2R/fjfCC1m+vvFXRzY2GOBuA+DB/qMx9ZEEN4n9e4B+p84h1g
	7Lbhuxicn5sbl9weJbHkcdjIp2S0f9a4bMJ5QnoYfig==
X-Gm-Gg: ASbGncscpPunF1qGT+1hsYMn//t0CPt05hxZ8UsUOfrqUrgWpQKSJN3j9gixLywJoRz
	uda19gXasSxJtL3x6lUoOAACcFAUtUO2Z/+2yd59kwkye6gQZ4W3zLnKq/fxpsFPIibuaSRGhlm
	QuRFZSxVRlCRvv5IAAngXcZagwNaoBfDtdm5JAqzMSX14544sL6CmQ0vy4pFZr0eJgWIdPzlxjE
	+V8GCYIncd6F8ZDFu9IxBh/U6ZHvUk=
X-Google-Smtp-Source: AGHT+IE98GgrC9jXpPWvx9TvskM3yOdcCbcPpo/3rkti4JNTQTO6XvWho5Xlo6OFAwChVZNifMjlsCVGT7YzZAVwjhM=
X-Received: by 2002:a05:6830:b94:b0:7ab:9f6d:6916 with SMTP id
 46e09a7af769-7c0df6f4b35mr3347617a34.8.1759958890034; Wed, 08 Oct 2025
 14:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008162719.1829-1-briansune@gmail.com> <aOacZAiWxG9XfWLS@opensource.cirrus.com>
 <CAN7C2SCDNz5TB3deVziuNNYFnPV_hmrsPL1k-j5Dsj58wvC2rw@mail.gmail.com>
 <aObHCq6JAHbtTJZ8@opensource.cirrus.com> <200b17e5-9655-49c7-a4af-7adaf2838168@sirena.org.uk>
In-Reply-To: <200b17e5-9655-49c7-a4af-7adaf2838168@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Thu, 9 Oct 2025 05:27:58 +0800
X-Gm-Features: AS18NWDuir5zkMv_d4mFWSmBgTAHpZlq4_iGaDwQbcqxaO3UHAZIim2oAuFFIIc
Message-ID: <CAN7C2SApVuEBTpq-E=bT=1yS+hQVv4J6FSe4ACa5_1a7pSprkg@mail.gmail.com>
Subject: Re: [PATCH v5] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=889=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:26=E5=AF=AB=E9=81=93=EF=BC=9A

> Another one I've seen is that you're using the BCLK as the MCLK for
> another part (a few devices even require this), you might want to run
> BCLK at 256fs or whatever for the MCLK even though it's not needed for
> when used as BCLK.

If you need BCLK as MCLK same clock rate why you need to use BCLK from
first place?
