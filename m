Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898A2DC323
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767392913; cv=none; b=ZtDbsx6NR9dBip2188nDOgXaXiqNZN+KybeUOCUYHEm8AB17Lnxl8zKPsR4GXXb6jQZ9T46oA4UkB57KN/e5bIAgVR7J5WS3uUP6TDN5+2+dpQkDZFzJDQodriRlQBAqiqmtfQk6Cv/+QQUX5njT6ZjCwJYnX+3/HAFhufh3zpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767392913; c=relaxed/simple;
	bh=v12toz5kmCaN+PrUoB6C3hx+gdTT7Rngk1AHIAKCD+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQ+wE/GjRX0gJ4nttX2EKQZj1plFD9HVBuiGW30chRJaftjCk1C/8lcrMXVjMSYHn39Xgw0XDv7MkdMEcD4qqpPQx58TqJ5L/9tABelga8uor29+Y76RIf6P78wUfWIiqwh1DNvxK1H/+3H216a1nsJ7Bj8oPw2h9MUFUO4XFpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxhXE3ZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxhXE3ZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20A8C19424
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 22:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392912;
	bh=v12toz5kmCaN+PrUoB6C3hx+gdTT7Rngk1AHIAKCD+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JxhXE3ZEETgXRtUG1L4UlGHkecs0gAhjnHV7ZbtKbi9vqcRy8XhuT90eNbaTQkg+E
	 kHqNI+PAcTF3hLjEKvRA9PGzxMxTutPV2vLvqYU9rEpETvJ8wFhuVGj7AmO7Wd8hTk
	 r2cwCYvolmUI013b9AJPIC4YrFhqb68MA7mpkl9rxuXMwaHA9rC6hOA+90rWeC8gLl
	 bvbrh6jlw3AHJQbhTSZX50UZuRZn9ghtek+BC7Re+kL8f3w86rZP/YDShU2xpQqTVr
	 TY5CGwMf5I6so/8kv+8lUMetKm+j0GetTBjQzUVKPY0OroyklMBBSHN2ec4Zc/xW1G
	 LPcdSHFeErg8A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso21421223a12.0
        for <linux-sound@vger.kernel.org>; Fri, 02 Jan 2026 14:28:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ1Cxa03tT0dAh/pRAi9mXqrM9uuLWFt4lgvP9/T19SJ/IM0Cx7RjFKAWDhNFX1an561JyEouiBLoAgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0dDr77PCbsU5z3e+4zhH2CB9oezMTPJ4on1jiVRftQYHeoqu/
	U7UOGbvhAui0YwAeCKpxQyKSNxJ/VvwDRaQCJtnpRkiMletBUeF45hrVRdrqZEgseCpS124+9we
	Joc4A1vhVZIU/ifN/oeRVaxJBrGauSw==
X-Google-Smtp-Source: AGHT+IE2JLIwT7IzxFl60D2dsx0IDVP1SIlSI+s2AD7FdZOQSMfJy6hvEhKAAA21Q/AGI3Vf39dZQogTm5dSOtl2jfc=
X-Received: by 2002:a17:907:6d22:b0:b79:f965:1ce1 with SMTP id
 a640c23a62f3a-b803705df6bmr4538227066b.42.1767392911283; Fri, 02 Jan 2026
 14:28:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226083914.1052653-1-oder_chiou@realtek.com>
 <20251230175333.GA854335-robh@kernel.org> <2f37dcd86a9c41808b918371a23dfebb@realtek.com>
In-Reply-To: <2f37dcd86a9c41808b918371a23dfebb@realtek.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Jan 2026 16:28:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dwkZqOi3F9Fi7O8e_NoMsATa6HX=9Ns_7aQ+WRatRkw@mail.gmail.com>
X-Gm-Features: AQt7F2pS2jCEN-893t6kWLP9CXJ7CiHTBU9bOR4YQlzq-UnRBBtTQMljDjmrh3I
Message-ID: <CAL_Jsq+dwkZqOi3F9Fi7O8e_NoMsATa6HX=9Ns_7aQ+WRatRkw@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
Cc: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>, "broonie@kernel.org" <broonie@kernel.org>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Flove(HsinFu)" <flove@realtek.com>, 
	=?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>, 
	Jack Yu <jack.yu@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 8:27=E2=80=AFPM Oder Chiou <oder_chiou@realtek.com>=
 wrote:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Wednesday, December 31, 2025 1:54 AM
> > To: Oder Chiou <oder_chiou@realtek.com>
> > Cc: cezary.rojewski@intel.com; broonie@kernel.org; lgirdwood@gmail.com;
> > krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> > linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> > alsa-devel@alsa-project.org; Flove(HsinFu) <flove@realtek.com>; Shuming=
 [=E8=8C=83
> > =E6=9B=B8=E9=8A=98] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.co=
m>; Derek [=E6=96=B9=E5=BE=B7
> > =E7=BE=A9] <derek.fang@realtek.com>
> > Subject: Re: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add sup=
port for
> > ALC5575
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > On Fri, Dec 26, 2025 at 04:39:14PM +0800, Oder Chiou wrote:
> > > Audio codec with I2S, I2C and SPI.
> > >
> > > Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../bindings/sound/realtek,rt5575.yaml        | 61
> > +++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> >
> > Where's the rest of the series? You are missing an In-Reply-To header a=
nd that
> > breaks the tools (b4).
> >
> Hi Rob,
>
> Sorry about that =E2=80=94 this was a send-email threading issue.
> I'll resend the full v11 series with proper In-Reply-To headers.

v12 please so the tools aren't confused by the 3 versions of v11.

Rob
