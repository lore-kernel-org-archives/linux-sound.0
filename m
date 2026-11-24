Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555305;
	b=hwu+bxr7R7afEBtyZic1Q571vEpsBiGWQ7cirk5h2f+WhAmHuSTydWYf/3ofMEXcjBf2
	 Rohcdu2y+oiC2vDo1BFdZTnhHgMmrpxRXix8r4NbTnhRbJLVFT3fhRwf64BBEHa9e797f
	 Eu9thy+8j7NzZBjEQLzJgD4ABo7c67drzJmIEF8dT2WBSUrPcruvjFEVu40aRyViJfEkb
	 7qUsvQBWkO0bBRlddzGP7SXl+nKgyPXRljdfmgDYpM+JRbWWgn/iWuI5U9ZdckNwDR69l
	 XN+VoL4GzhJny4gXzIIjAVdqXHPgkvHmcrO0m6uNNCh7hiOUPCeUWvnPo8JPdwG9eWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
	b=qQKNHxLyGeTWyXNovCYj0HqOoN0TVqJbwubGbmLbIhMaSjrGY1tNj3JV+V1O48xG4iFB
	 KksHPclr/WAaAYt+iPApSUffkgHGp2auD+L+JdoCadVkd3HhtNL+K6zEE/PrTOOieOPek
	 X0h1Nxxlm9OWK+7m/8Vlb8WxgmfTaQniLWNTEe1fAb48l7dLsQnM8p4LqfHY2f9B8uo+R
	 EEUmjWjQJaAOgLXm0ROGEOlEv3F0VU46X6zO+NCPVWCcf5/fJ+fuu/rzT9O1a7gwBDpEJ
	 Mj1dK8fDPZBSHx4AZqnBWGcxNpEbGj9zu/QabFldo9iCI8KHrJh/xkYh7zTD07vm7Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YI+KcRB8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03C606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 21:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE03C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YI+KcRB8
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4c2da74c0so32451177b3.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555304; cv=none;
        d=google.com; s=arc-20260327;
        b=WsDStDU74egPrU4gm5FM192f8nV97ChVQBDK1eCyEDhXcNUWioIy5ZEO7PxYF3xZch
         GmtnQdFshdZf+/9ZctAH2hsSO3x+ML0vB189kTqtc9Y+63SjoP+/3DSkslACdDk8MUT/
         jDxVVSVVqtiPmdXXC8CcB+FpguScvKqbS1Lyy0rsOsjiLILfGc9zztbKfle0Jz1MgtPg
         KmJdaiDJg9VDW1vi1FyYZ3W7jU7iAYCeG2GGWWI8Isv9GAW9nwaImL4kGi0qziIrl5ut
         fp8ywE9QPeT9rqHb6K1T/fRh5zEArBIiSP2JDShLvGXD7tKT4se9H7v/qgN3dI0nF6W0
         IwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        fh=lOn6ECIPT6TaV8rU0d1B7KMeFOyrcRXveFXJ9PYvlK8=;
        b=ZzXcjbF5oM2uEOlY1Oaw4rsmsdAE8oLJqOL9jjXED13z2hn9QipXjmeB8CRXM+EDJH
         62RYTGiZKClu88nZZx8hUDiT29/R3hGXzXEP+rwUNgfZo0hgC7yTljeIR/e3uZwdlIki
         Gf5gpbDPsLROqtrsjGNQfjig68cy3J/Jov4z9YxnfBi/aH2uHjjSAohBNbwKfBMgzV+/
         LzcAAMcRL92FWIGN94bM/4ic0gBEJRzlieYjFmV+6fFBXQcO5PK+iAEvVn8hEkcS0zsE
         V5Tst8bfhs/DyAsNQCvfdsxU98JyJp2vBLV2NY3gZ9WA2PVpi/4Ewnd4KpCB4QKeTRCt
         7h2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795555304; x=1796160104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=YI+KcRB8+lAE9AY5pSod3xhKPrtxh2vzQXySdKNHgIsa/d5VW56FCDTYBIXj4Yd+vf
         XtPdVN4LsEWfC0NcrPhBRyn8Zs/EHBcZuDttbTCGszkcRGZIBfnuwTiNwLF88AuUZwsK
         WM4X4BboEaxjz/5rvZIfiY1YuivEiVlvsPjsxcqN2ljh62EKE/MzIuXiUEJz0U8Qb6bv
         yZtl8Q8TJ+Kd25h+TvhE7cPrN7htZZMDtHLRw6VpWyYBbBCh4Bi+H1VH5oSZQHANrxNv
         NZVvkw79EUuHYxMmw8Fd7BjHdqAliEIsrVaWpUaUm3dGS8wJI9spy8UVJjh5QnnZBv0Z
         qTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555304; x=1796160104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=JKY7RemW09SdBMoerVl3fHxta+hqvteIrO/cswZPeWoBkkIiQZTkHX6vG2n3cpikxE
         XVLGQjXqRYtkS2CrL8CWPK2rTUnF0d3/mp7jp0UP1Y72UDvpZQxAVVNAVNUp6J5SaJcs
         +1mB/D+7+MKDMKIh77f6D257YqETdThhOG9PBclq205+7VknVKSiK1lzzGkzGaL8ZE/f
         rtirHCW5B0ci6BOsJwGcCbQ0vAqfN/2ErxvXuyeRhjC9FchsOi/RPSIrunknwZCuLHCg
         r+u4+sVUx6Vuh8kf1ZQsr1KJXX686xU0O3sJqFTf4wkJbEoWTn66e6c4ZDl+pBzOkZrs
         sZGw==
X-Forwarded-Encrypted: i=1; AL+hErGtpRuQ9FY3JEdUBgqEOR1WePZw2eSF3ekNZ5kdsWF5JTL0KL7bZawZbnktFEgA63xGvHFBx5KI51Xl0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f7PZL3yyuZvPEVzstmRpW5QEhANOA6gV64JGRraPUdCOjtd6+
	/PDbFVSIcyMPL2hJC3SxtM+y4R5+k2yIVuux/YvXqjfmmNpVY7Q1ycSq01xGUhOi69oExk3Hfur
	+ymGCnbVDDYHF6mnVuWpe+aorYpUaOVU=
X-Gm-Gg: AZFdTZesYvvWaITjlrAgXhyuaPHLw+MaJw0pNPQFNPsYFKmm2tyIC2amAC9cJeGf3kM
	lSsYsc+qq3gOe3bAeXQYBK6zx7zYTp/mqLFp4P0uZ1mBp9VsB2gwseltHDrcVfRd9vrfFP7bu4S
	jjupn7oYfbJ3LCWsmQ+U26cNirzcWKFN+P4qJZpMJaukO2IfNgSxG5TYgjbw44pehRMCXCqjznz
	pFnZ2KKNmLH3hmEsCw0Z3zWlv4MH2/nR2B/oSDAdPIZzWib7J11FUIx0gz8kCKUTnhw6auXMxM6
	gK+bbpj+VwJO+PiT9nZJUK4xYy28RfYFQjerLDzBAsXQ1wemZ3qWS4zi0EQ0t4TGvW5NDfw6vlV
	V8Ww7tUh8iLtfyGVqJM5S42xRI/kf58YGXM+2GDPjSHg8+OWR+hnpwR6krGmUnjN/9/JXHA==
X-Received: by 2002:a05:690c:6213:b0:8b4:dd2b:10dd with SMTP id
 00721157ae682-8b52050f0demr45322637b3.64.1795555303828; Tue, 24 Nov 2026
 13:21:43 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com> <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
In-Reply-To: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:21:33 +0100
X-Gm-Features: Aa3M54qIikBwR4PI-ZQunVxuxoqfwLNl1dfjIK5NjVa_KqUN1kcswl51cnQYi_s
Message-ID: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:06=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> > On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre=
.com> wrote:
> > [...]
> >> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin=
", "FIFO"))
> >> +               return meson_card_set_fe_link(card, dai_link, np, fals=
e);
> > I suggest using the "audin" prefix. AIU / audin seem close enough on
> > all supported SoCs that we don't need a SoC generation prefix  in
> > there to handle this differently.
>
> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
> compatible?
> If so I'm not sure this is allowed nowadays. As far as I understood
> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>
>    "DO use a SoC-specific compatible for all SoC devices [...]"
Let me use an example as I realize that I wasn't very clear:
  compatible =3D "amlogic,gxbb-audin", "amlogic,audin";
Does fulfill the criteria (as far as I understand it).
What doesn't work is "amlogic,audin" alone.

The GXL example then would be:
  compatible =3D "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin"=
;

And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
  compatible =3D "amlogic,meson8-audin", "amlogic,audin";
  compatible =3D "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,=
audin";


Best regards,
Martin
