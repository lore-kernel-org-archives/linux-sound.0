Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A831DD0C0;
	Mon, 28 Oct 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124614; cv=none; b=jWJ/DpHlHeBupw6itX5Rh7fi0saXX+GjCU8AIVIeZLcZZImAlrY7D/eqahwF5lbZhUJlMUNKPVqCb5b5TrTgoKUF4tf0SEailL6GUjJx6UyRAy81LmpGDo3hQJ+9y5Mu6rRBfcSpCBcP7bGMFgRDEgLZApt/dsvlv67KzFBfEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124614; c=relaxed/simple;
	bh=w9NzcAMM+iN61OPg0k1xFjEljUX4mN8FHC7aBjxP3C4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Te/lks7ib4vt6dIJTNUBtPXu+HFrB9OfLimbNweYHF463BHbmv1y2tMMBfdc1UDkIQEiqhfR5QZrmVjJx81+i5nlin6cpIIQubHkRdbHI9nzI4VyRIPgmG6jLKFTE3Pymc3+LFeSwDJQApPFGa9VuLay1wpJrZCywZ772cHyP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG/e0v0Q; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG/e0v0Q"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so3254457f8f.3;
        Mon, 28 Oct 2024 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730124610; x=1730729410; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w9NzcAMM+iN61OPg0k1xFjEljUX4mN8FHC7aBjxP3C4=;
        b=NG/e0v0QLSbBACbN727KWI653d9p0V32kakB+/TLJnUT+8Vb2NxXLnwu8q0sXi3cvR
         ipcjhMEnCx5pOMfEO7FzmloaiPn71MuH7WEVuCFewbE7GYgDORRlxnxWytLxGkxnt3Pe
         qg2HPGpt/xwafulSMFSTqaNEic9R6UZuqM8KN5oDXC1JRp8WzEPwYWQ7J2AaD69a0YQg
         Sx3jYuNjD+FN1NqMJ8RTgAOW9EG8y+qWDMDOjRsKVHvGVGsj+idPZKlELDQ7wd//HZE5
         BWa6lVhoxMWnM0WRwfX4+/sYKFUXJvklj6CaEaFuJWEvzDY+BL5zMyRsSJChuBQQM9pc
         wA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124610; x=1730729410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9NzcAMM+iN61OPg0k1xFjEljUX4mN8FHC7aBjxP3C4=;
        b=hFfUFuI8DkIWKIzsBwgJMH4LJGgHhpueBwm6fEcpwN1ocz/eSqrdIklDUYCVQ//NkH
         pjHUsGmeU/Q7DEyRcFbAFo0tDMiFJHhQQrM3zYpvdHYvel8Nsam80MgeKQxAmptav0it
         /fjblekfiupwyM8ACINJKzW/7mjjXXLhKNUSEmU1BhN1uc4GGjETewDmZdaQMlMF9UGF
         P7dITt43+ZbVamF6lu7d/pVNBUl9gK/75tesIwAMXXZ7e0vKvhdp0wL9iwUFFYjLjkjd
         s+9BM4aBHQIfBdp9MwSEyShXoABY5QvxiuQr+wKkjOOBh00L14YkXZd40eYlio1UprzD
         Us5w==
X-Forwarded-Encrypted: i=1; AJvYcCVfFenyAhJGSP+3xEY/DYTmqEGgJasvmy0kx0QRJoWJEQjt5lNefodj5RtU+hvnZKx8sTCXgQTJvXTb@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrCGYRQJ0v7+7CKqFIATrPUg+Di1E0OLOwUUIHf7BIOw9KTL0
	OR65f5Vfi/NOCNAaGobpHqpqjZuBYjPf8tEFuZkeNOpdVftchf/e
X-Google-Smtp-Source: AGHT+IECBIlBzaCqDV5M3+pRddxYcdHuT/BVEKJjvvfRuH8KNfTEkKqQEPXpvfVhfSVxvkXdky34tQ==
X-Received: by 2002:a5d:434a:0:b0:37d:518f:995d with SMTP id ffacd0b85a97d-3806120ebddmr6436506f8f.56.1730124610516;
        Mon, 28 Oct 2024 07:10:10 -0700 (PDT)
Received: from ?IPv6:2001:a61:34c9:ea01:14b4:7ed9:5135:9381? ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c236sm9545164f8f.35.2024.10.28.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:10:10 -0700 (PDT)
Message-ID: <a7690fa0841ad1091f8d761e4eb940f3058ef970.camel@gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: document the adau1373 Codec
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood
	 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
	 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 28 Oct 2024 15:10:09 +0100
In-Reply-To: <e6f4b1b9-f860-4625-9f77-ee475235e958@kernel.org>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
	 <20241021-adau1373-shutdown-v1-2-bec4ff9dfa16@analog.com>
	 <pj5clifybfwljpq3usfgca7cy54xpmzngdckyb53wc3u4lts53@gtm2mbuiiudw>
	 <a38c5d3e4f1cdf90f53b8c17ef7508faaf760f89.camel@gmail.com>
	 <e6f4b1b9-f860-4625-9f77-ee475235e958@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-10-26 at 20:14 +0200, Krzysztof Kozlowski wrote:
> On 22/10/2024 08:42, Nuno S=C3=A1 wrote:
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint8-ar=
ray
> > > > +=C2=A0=C2=A0=C2=A0 oneOf:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minItems: 13
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minItems: 26
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minItems: 39
> > >=20
> > > and maxItems?
> >=20
> > Hmm, I had the idea that if maxItems was omitted, then it's the same as
> > minItems? Because that's the intent... We can either have an array of 1=
3, 26 or
> > 39 entries.
>=20
> That's not the case and none of the files follow such logic. If you
> manage to find one file, please correct or report it.
>=20

Okay...=C2=A0will add maxItems

FWIW, playing with the DT example and validating the bindings works (and fa=
ils) as
expected when omitting maxItems.

- Nuno S=C3=A1
