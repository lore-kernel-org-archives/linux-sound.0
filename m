Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A638627D
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696731; cv=none; b=Zc9VCjOvZ6q2SDFL4glD5T52X0rNcPk40C0079EqP//BLiXHWknvmZE0xldt6jIZ5qK9OHN9R8JRBTxjTEUXyEnG440ySwytcySyjJ55ILaSFyq5JknKW+mN/mrsuAmRKRCYW9uWJ6Qx2+AfaObgMhj8YUVJ71BfcguCe3xqHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696731; c=relaxed/simple;
	bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8safV12OO9DueVsQjgF3a2Y4EGmyCDKAYzEDjRSQAxH8rXbtvkTxhsk6YRABz2i14PS1kWCGNCuumuIU/tMZRE//iLM3u/L9Cn7EedaNC5voyv1hSCH++QjjDI8ODGv9pekMChB3nkX66tkpx/FWMPgj3HUYADIViSxh/c774U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=hWXSjWUx; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="hWXSjWUx"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6b4fc2b5277so672986d6.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718696728; x=1719301528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
        b=hWXSjWUxp/+QywILHkarQljr0/9b7wjzNcg6UpG5ard/0oACWbBB1y2iFzMJ2Xhu39
         QG50Pqvvb09TbN6Nl/A1dYdNO5NNiRkMhdJx5ZMqj8p9T8dq9RJNW7+RtzK84x6po3Fw
         r2F0jO4LDbxmgV3EVcCWOYLuiICpcvsLHFkDZBNW0EJP4MVYJX0quuZuTngvq9ABVx1D
         dwvtPZGu1uwV9ss/lX7iITypdqcG6DowwkSZiWzjKtRMcIMutRBOcFbgJibBRw4T6sUl
         SkLbloFLJYarBdukj4sOl/uGRPcLBdK8Cm3dm/wxtiYI4+7XoMiCv0VWWYes6Y4pEzOt
         vSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696728; x=1719301528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
        b=sCguoDC5m6sitYYX6kJpc9tQgMZ15W+6cBy1HQu6fdCJAjn7+2JNsr2KmysNzEAWPr
         qobCQb6++0etFxucBrr0gQK4aC7Zj2PYVoyZusYhHVcI2hvSmGzt6ToSzz1UsenNMXA/
         Byj9Tec0B9xKQuOVtsalCfYkpPDsLz5GxDu7aNOUAMzyEvpbyILrEavAQw9VGKuYFwnd
         DDZIcV8tjbsIcxlMwhL//dlXnlFrHJlSu4X1tHjw8ZblBrgZcuEh+4qjOu9fcRxNqb6c
         sMZWtx4wIiD+I3yX+gZZ4rWEjqvzn7YEjn+I1wzSovwVv5fwkmoUyvNPCQqohptcz5Uo
         WNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq9XIe+olRnDonkHeASABnEBv/hWw65k2fmciDu1Vfx/TF+T494bY3XzvS9ZBO1TS2NwfxoRBkmSgZ6h4u7LdQt4vgfD25RfQD0Oc=
X-Gm-Message-State: AOJu0YwYPcBxRiwVrzbmIlL3wmO0Kz038PNJtRW3L1NY1Zp7cZQLPB7Y
	n6kyeOTbQ0Rc+A8xDUrRJ/76YNqqF1DkqomwK2SH95GeBZYMcuXVu8pS6ezYgJcJU5O+AJT38Ja
	1I6CYiKABTjaohbGBdkymmsk4BQ/LUmeNwfLnsfKTir3Q4ewmqCc=
X-Google-Smtp-Source: AGHT+IH7+3WcSHlqSCn8E776/vDX4KlNni6h709sa81SFyuFMo7TNQZN/dD9TK/cBC9XEnkBmumnQonT9vtIqu2MJcM=
X-Received: by 2002:a0c:c58d:0:b0:6b1:e371:99cb with SMTP id
 6a1803df08f44-6b2afd7792dmr117082556d6.3.1718696728034; Tue, 18 Jun 2024
 00:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com> <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
In-Reply-To: <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Tue, 18 Jun 2024 09:45:16 +0200
Message-ID: <CAG+cZ05LW5WZJqzs1yXZ3zV972iA-mE2HBtdGZPf+B0bAyWO_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Markus Elfring <Markus.Elfring@web.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Jonathan Downing <jonathan.downing@nautel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Takashi Iwai <tiwai@suse.com>, 
	Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 9:30=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> Would you become interested to apply a statement like =E2=80=9Cguard(mute=
x)(&i2s_info_p->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L=
196

I take it. Thanks.


--=20
Piotr Wojtaszczyk
Timesys
