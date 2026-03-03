Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605147CC8A
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549564; cv=none; b=WuhuqBIrM5OfAJbLa58pp0QEZDxwM5+gUrMKK1mj3MHmAGIckgGXBiCAJ/mE5l1ZBaTQcD9C156MF4kWRchCJiROHyY6hq6MRz9Frhu2mmVwR81eca4thidEPO2jr11SAdVrjr/5b+DQXC/W+vmvSMYAXVk2ac03NUYTB9UsIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549564; c=relaxed/simple;
	bh=mSRQ1eMomHCwVtqBWfZCdjiyysv7g8iYFUzJOGWZess=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hyHa94eT6UYdDqqiy0cU7Z79S6kiklr/IXUyDbwwNufsV4X4AfQ0vC7CzEcQzlIeCyyE2Q0ADtM2HywSCVp+yfhg6JGX7VqsNVcMEBb43Yo2aQYeE/GRyo8NyRkyWDo6uxxn+BEeP+kpAejZYwhbR36PN8LvPVAdtv4ZJtxRPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIeDQHi0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIeDQHi0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2398523f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549561; x=1773154361; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=DIeDQHi0AAP91R6YbGWauz2eMg14tui6twbk5qs60s0DoQ+1m4sNZYPu4gM/D9DH1t
         hNmg2wPiCPvmc55Y13z7FQ6XbJB5Tou0H+GOL3lB5aw7HmnYKeMv0+mwUBic/58SF7oZ
         wihlcPIH4+FqRGqWqn04EyiWDXuZmM1k0zPviKdcBcgND8M5aRd1aWRm2fS16xL1pjoh
         boqcDFZv3MptHnPpOhCbOZnxFpV+yeIZ36XKxIy48p8jJ7CGYar4mNBW6FIPHgKRrOj7
         U+jozLWw9ItdmiDZTQQvdptl4UqQuTo626xTP3rk0nf+6jVzTUnnvm4a9kMDiVnUZHyJ
         yaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549561; x=1773154361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=CAF4Whx5KdBhXloEOGSW6e6nP7csvxVRz23g+GqE8s+Qixl4AO+dyRTbxQZXxsh6t1
         /pVU29GYZDPlnRkU6PgiW2sDEkaKH14W0ELUrjxRpr7+zff1CeqIA8fMPVsZDlfEr+kT
         LNes+BqgdhtwfZBMcFHqTbXJOF/C45KBcQhGVvRpRKu7yGT5JrntNJwHroh8Hv6Z5hh8
         p2WciN80yUCJsfQIh4C6fEktgAa90vGdV7niYyYQKIxkbctMNINoak60gjUiYy/Zjlex
         kVRl3nJsTqihokjfhiwTOUBVM0P0/5hJ08BmkfC3GewjmCoAqhw4snrugJShiMYTfNeI
         1FGw==
X-Forwarded-Encrypted: i=1; AJvYcCV/aHCm8KiDyJ5k7OjyZmt3aFu9+Ow4tJlpzIaJ8uUZKD32XnD4J/pwx4rfHVtR5MngDDmW79T2GdufLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaVJ1iqBHtc9V0dGTbZG200d4QiKYtkHke+vYME5nyZ80ghh4S
	RUbthawbn0kOLrH9eeEHkwFO+Jy/K1+6x+KU1Po+LYbnecGMAXeo5/RL
X-Gm-Gg: ATEYQzy2OizGngilcef4P71YNCnkDzZGYJv9PrCVxgrzNclbqucfnTIbusRgV+mi+eq
	fpD0Qw+11h+bMSN96kQHaOl3iqRpxPcoOZzXCyUKNMxIb3ZKr8ji8nGg5utq+h6XvaRUKS3bqPS
	SoADn7YxTGiEEWm60BHEy0ob0SwcdKLcAsAs7Ga0oETlI6a3pm8zB/gtJVphstUjXe7i7yiCO/k
	JHzAn3o1lxrpf4QKyAxrqCq540Kh7Q5iYP1LDqUFEgl0as79s5jhcet9BRQgEacJdBvEF3oEayL
	XH7DcIjBgUY9vRC6J18tIIzFPfgI8I8Ez/hR829qDoSgD00sdigCxI7iNnpZxVFcz3CNI9h2FEE
	dLDe8iDc43mAdZerYaldvO/A7SoD6F/QndTUHCF6ynUMRVHMcpq9/q4c+5+EfWCOYkXeu3f5Ze4
	8/5qYVpt4JH4WSyJFp5APUDJcqYwlVVaA=
X-Received: by 2002:a05:6000:4387:b0:439:c279:32ea with SMTP id ffacd0b85a97d-439c27935b1mr3280566f8f.39.1772549560930;
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm20531779f8f.18.2026.03.03.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Message-ID: <bddd7c86f5d9535ce5fe58e6271396da40750cb0.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Tue, 03 Mar 2026 14:53:24 +0000
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
	 <20260303115720.48783-4-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-03-03 at 12:53 +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
>=20
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/axi-fan-control.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-cont=
rol.c
> index b7bb325c3ad9..01590dfa55e6 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_devi=
ce *pdev)
> =C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
> =C2=A0					axi_fan_control_irq_handler,
> =C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -					pdev->driver_override, ctl);
> +					NULL, ctl);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(&pdev->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to request an irq\n");
