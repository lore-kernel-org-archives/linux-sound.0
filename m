Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C730B526
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737091; cv=none; b=foMl10v/G/f5XfJaZTxZQZI3t9l9lqNvjVrVXo2PcduIlz22sktoj4lY39nwsKTNTanAyBNmb4QjhJmGOYG7QY7/4k7MbuCzQK/X8VfYpwDqrs7OzUDKN2V0shIohL08pLq/7cLp/vmAANWQEwNXsRw1B5ltHqUYVmjLNFbZcsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737091; c=relaxed/simple;
	bh=SSN7+2SHUlqyDZJ7M9gECbgIzqZWKI8o2SRJwxBxLK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ULaS38/wDrJFG+hodT0I+YcdlsbnlJhs08VUns1VPVgHb2RAGbVkNEGWHkqoX+QNQVWnrfIE7+E0Cq3nerZPaOvz++eZ4ZpwRVmvlqHveXETyfHC65O0WeInGckT+VYpLo79yI5CtogTsV+zBTkPJv7sdouTPj3+HTWjOEl90S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMLLqUHO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMLLqUHO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-421851bcb25so4371085f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761737088; x=1762341888; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SSN7+2SHUlqyDZJ7M9gECbgIzqZWKI8o2SRJwxBxLK0=;
        b=SMLLqUHOvRiXo5bzPpbV90MNXbK/6aZbH/ta4d0TPKSfwmHmyv9AW0FO+PiQqFzDkI
         D9ahNnTjW9Gs+quiAyT5UMxyRNJXHrXOHOuyPqaXEpwAZSgYe+Hy8QaYPg4FrzjTbrPn
         USgHEQIYkKkRZM0tR/wFzFCHbzQWYI5hhcnr935wl1urUHxYozlS8k5+uI7D5dHHarpm
         Zcby/6r9AYLl9hpHOF0iMH6cdmPWo8ZYanRKPEQuRuSFSd3aBcCt/EuCsENAupKv3LwD
         qcNm/oGtx0Ft3E0n+yyJ2DhhaWXWWrbpmiAN76thzPnCD+jsTYlGivMamgKNCnA4T+6t
         H/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737088; x=1762341888;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSN7+2SHUlqyDZJ7M9gECbgIzqZWKI8o2SRJwxBxLK0=;
        b=ZISBCTZ7pm+8ffgKsosrksa6co1hoIFhHxzvptCAXg2dNoQoVqS6nRXD5AIi0Po0lS
         m3A5YW1iRSvIczSbbOc/AvTYwd3oKzciT0r2QFJLJzHZ71RrK0jnbhYj1JDQ82qK5mwM
         w+qEHsW1QfCJuKk08zAceBu1J48pVTzj+CY6ImcHSco4bBKqkvbinThYlS7mtlsLBqdL
         9mMWlBbV6udPp5/ZQNoGH4I179di8aBOmZ39HjOyAGqtxSZvHMpbXCHGacP58mh6GVmG
         /qWw+tQDlDFEQ1sV2eY00eppk1ufbgfZldcSIfcVt6D5xjHRkM+62U/utcXghfsAyDBQ
         ByoQ==
X-Gm-Message-State: AOJu0YzAK+uASjDX8n8tlB0zIctLoVXjbkZfsl44LrtZ3+AqhT5PD4jC
	TODRrQKBkcGS9axp/WH7DHsJYhhi5irjH0IVzW0iFuIWkYFzBjVFVLFL
X-Gm-Gg: ASbGncvDMMnqPbVWubFq+8UIdC3iI95PO2ay/YBWF9RTmk2T0ZY0JsJgri0NHyLsVQX
	Mcb+bmnFp92eaQQMI2StfrYVqh/hQehxN9Ho+fiQ5KYOAN8G7oSxYce3n2bfHtwg4mCQX67v11y
	1CxSIk2LJtv0CcPws4lrZa+woSxOtHEzbP0+zAmxuc8+6urkHIA6Pjt2/vAJZhahaJ5eDsNsB+8
	9tizmvkNJhJ+2YeC4VGvfo9cns+bSONN/lLe21Lie/9jl0s4QGWEPSMBlqe0b7gia1haNbBI2oD
	VPeNzyyGI0GNfK/s7nRfZiG0leJ03NTw3vXPt9OX9R7D5JY0Sk6D8cuiXIP99rpjq2MB1T9n6j9
	nsMI8aOUrxQhaAWPCsc7HmhlMn369ldL4EeIGQTTSgJPO8IrNWdRRmm0P4sSyakXCL1otyTbO35
	wJALql3tYOlnQK05xUwzelBUkBUfSLwOo5b63EMeb4aaBbgD3X/u9RNWLr
X-Google-Smtp-Source: AGHT+IEkpyQtLQ97U7LSxA+GQnz86sOiezs7Bj4Kw0ZYAFnyDPGMmE4GKO5EGWyqrEBvSGThbDG3RA==
X-Received: by 2002:a5d:584d:0:b0:425:856f:70ff with SMTP id ffacd0b85a97d-429aefcda6amr2551180f8f.45.1761737088137;
        Wed, 29 Oct 2025 04:24:48 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b22sm25422572f8f.9.2025.10.29.04.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:24:47 -0700 (PDT)
Message-ID: <3e2ebf04f53cbf801e13fd808d8438c6d2cee412.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] ASoC: cs4271: Add support for the external mclk
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jaroslav Kysela	 <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Nikita Shubin	 <nikita.shubin@maquefel.me>, Axel Lin
 <axel.lin@ingics.com>, Brian Austin	 <brian.austin@cirrus.com>
Date: Wed, 29 Oct 2025 12:24:47 +0100
In-Reply-To: <20251029093921.624088-5-herve.codina@bootlin.com>
References: <20251029093921.624088-1-herve.codina@bootlin.com>
	 <20251029093921.624088-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi!

On Wed, 2025-10-29 at 10:39 +0100, Herve Codina wrote:
> The mclk (master clock) of the cs4271 codec can be an input clock.
>=20
> In this case the connected clock needs to be enabled outside of any
> audio stream. Indeed, this clock is needed for i2c communication.
>=20
> Add support of this clock and enable it before the first i2c transfer.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> =C2=A0sound/soc/codecs/cs4271.c | 29 ++++++++++++++++++++++++++---
> =C2=A01 file changed, 26 insertions(+), 3 deletions(-)

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

--=20
Alexander Sverdlin.
