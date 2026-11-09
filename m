Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240473;
	b=d551s27n2Uv9F4Mnt9+eN/WGyZbVDBorX3kC5aAOC1Qn1wi2sOSKcfa7OHhPcYIqb1Z/
	 xQe2Hwnr7jCXfew6CuG68qZArfSRY6r97PvbgW7cViB5qjRUlc/nfBOkTXCFEq3Bl6JK5
	 gWuCsbB57ILr3WRVpXu76BDXpcxqJxcDosHWlsx1AeJwWjz1SM6+J8J0fv+SpGuZZvYH7
	 G7FJZ21XUUBS6tjV+bIXj0ezGb2IoiVXUcOdSSiNKD76PL3ym72e/Bz3EkFWIgrNXVHMT
	 EXEqz0jg9EgfQNjUNsWv6ngC/DR+XTK9L9V4zZnJ/33yHb90WQxt/gr0KgKkxiI1otA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240473;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XtJ4YyteZsnKoCwVOIP20Pfd75I+yc2muEEWiiNBLNI=;
	b=lnFsjGPLQx7KQOlznBCyAj2XOAOfY0M0lBleIs55z/6XWwHtskbCNwbIovFhPokuiTJb
	 J/SLZBrfku3h00fdhpuHXzMk6uNa7PHRZgYlwDf5EfztOZ6NfsEKMKMcW7Lyyl8ElS/B8
	 bV+v2pKkryqg4pYObR4B9eOvMa2Ud5GYSxedv8gJlIype9jg+5VujTFdNvUog0OyDO+qm
	 pFqMQjqWUH2CVUDjwM5S4er/h6QKEA727Zq7nSq4B1845WRfZedJFupCz4b20n8CaHfgM
	 9TtdCUW/bGmcOla8GPxmi1GYNhGP/rbZkB0NK9nXtuT6W8+p4LAsGHmViroSyCN7dFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9adPJ2X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FCC606A334
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9adPJ2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980C31F008A1;
	Mon,  9 Nov 2026 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240472;
	bh=XtJ4YyteZsnKoCwVOIP20Pfd75I+yc2muEEWiiNBLNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9adPJ2XplwMflQaybe+TZ6KVFGinUy7OqqlkhtvV6T815IJbkY6nczZ/ZG0D1BoT
	 Xe+bSGluYBJJuGgrasNgVMYQ/WpY9DD9RGVa7Rr9VNEed6fwulcbiUyXNOJUrjXBcQ
	 1FI8h+XiR5pEtxaEGn2PZtTQNlV99QutCHRHj3mfzNEIhG/Fj1H2lZkzSNXWxREL8q
	 6/j8TX8ogquSueMN7sLtfZsW1/IvHXO6X/UxuM5kGvKsI9Lq7IqDbnjvmRNQIEzgH7
	 d6eZhFE1OQSyHiYEli6j7b0C0yyYYpJdhwtk+q5Jaddnj8/m9wXfblo5xr+twoRkli
	 b0iCIEuzgTbBg==
Message-ID: <sashiko-outbox-205209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] ALSA: control: Fix parsing of numeric fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109155941.5850-1-sreekuttan2156239@gmail.com>
References: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
 <20261109155941.5850-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 16:07:52 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: control_led: unconsumed closing quote in parse_string()
  stops parsing
--

commit ca72582941d6fb9701c15b50af83f1b948e9bd29
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

ALSA: control: Fix parsing of numeric fields

This commit updates find_eos(), parse_uint(), and parse_string() so they
return the end of the current substring rather than advancing past the
delimiter, and NUL-terminates the numeric substring before calling
kstrtouint().

> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 3d55da3af2a05..8cfd305fc1d2a 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
[ ... ]
> @@ -491,8 +492,6 @@ static char *parse_string(char *s, char *val, size_t =
val_size)
>  		}
>  	}
>  	*val =3D '\0';
> -	if (*s)
> -		s++;
>  	return s;
>  }

[Severity: Medium]
Does removing "if (*s) s++;" at the end of parse_string() leave s pointing
at the closing quote when parsing a quoted string?

In the quoted-string branch, the loop stops when *s matches the opening
quote character:

sound/core/control_led.c:parse_string() {
	if (*s =3D=3D '"' || *s =3D=3D '\'') {
		char c =3D *s;
		s++;
		while (*s && *s !=3D c) {
			...
			s++;
		}
	} else {
...

Previously, the trailing "if (*s) s++;" stepped past the closing quote so
that s pointed at the following comma (or NUL), and set_led_id() then
stepped past that comma.  With it removed, a quoted name followed by
another field (such as "name=3D'Master Playback Switch',index=3D1") returns=
 a
pointer to the closing quote, causing set_led_id() to miss the comma and
break out of its loop without parsing any remaining fields.  Advancing
past the closing quote inside the quoted-string branch would preserve the
expected return position.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109155941.5850=
-1-sreekuttan2156239@gmail.com?part=3D1
