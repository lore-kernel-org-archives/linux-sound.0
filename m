Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61B39BFED
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308329; cv=pass; b=LnjsV7aP5OqXDJPqCB6ntLV5BsGt7fYTpKIaJPvQqRGQDljUba9heN+QnQzcWIkjTCU9oiF1InmVa+1Sg7UstnslCyfWheqw3A8mQBNa9U2AinKFyTMSqBYGC6LrJKR6NOeDx9kF5kNBeGxcZPsOm7lWmA9oGnkMTKeX5Px0igg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308329; c=relaxed/simple;
	bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ip54jvlpaoIT50FXBiwxkrCtN+7V/TZSfqZjUWlasEHRw7ztCc14H+ny3DjjBm1WHp34s+yIevIFc+2vMMoYfux70kw6AyeIugsxugQ/kcVQC4t1hWMQgv9N5l7Cx9THLKS1iEIFvZyzI/10Lif0zmKfUVpIeSeXCvU6qgA4bwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK/5IGOw; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK/5IGOw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so6900625ad.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Jun 2026 03:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780308323; cv=none;
        d=google.com; s=arc-20240605;
        b=achO1mnCj7oLCu3Ghc4mtYom428HgWmmpNS8IwDqNSqx3Q8ZjmwTKAm/6XzVTlI00q
         i2AxQ7XQmxTazOxvaQXqFDyfOM3ZX78weq9LxwiC3r9dHAXf4B03vS2Ab59jMqPzG5De
         wnYH2jPQaVw1nLbfvNku5bmJs7kbztJjCld97tlxFycjqv37SZDRFV3685hrY6zVyJ0w
         wI1rFXxkl9zDvhvJwK7Oz0I6iw7Og6Ll8BjFvjmLX701rRZc4RYWL6bHb9majOhcA96S
         4jpDFRrbpjL7T4JSUdgaG44gogP6p4tfNkkRJ1n4X62m9p/cG2Jk4gxOWHKtSb4ZpKal
         DoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        fh=G18oPqpKDkYT/mfEHd0+1H3VKPXe5qqX2c/98n96fmQ=;
        b=Z1j3ne+JjtZxueZ6Sr2vdJ3Hx6H7oKjt7daPlR1VWJzaWCoRB+266krCdUPiYDhXC+
         M86gyRovnAZ46pIYh0FyEPpmEhT8yHMYm5Qm8C6XuzkFTpyuiNOuZurYFUt3UwXbwJ8I
         b2nPggqjJUNykv53+ux2WL8QR02Uoo7fVIESun1WUHqrneVzplQzgnYYS1JNdHmE56Yl
         3iCFrYfsoZYPUKHqkLrzE0yQy37ajDrydt/GCN4KvfTxeGHvK/W4jCKQX+d02UDna9z2
         pV7r3NVClmjo9u4ARYdCZKJz1dJgc12f2cW55WS4wrKzaxmtDx3lE3iDopHrvZ7DYsbl
         PxKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780308323; x=1780913123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        b=cK/5IGOwSQuxlxt0HchblokCewI3gvi+x24drbm5aVXrP9WZ7w7exDF+phC9WBgVXl
         yCbi4X4oJsEp66B+qTxc4rmAHsSwSXLX7JO81BOiVlVcJxAB0rQi838R4dpn6Uc7+Yqv
         M2wH9nY4OQ2RlqkgIp+MDHAu5ANkAP25iM760mVmBIwJC72PoKNATlpLR6NkSwspLy5u
         H5nvleLpI7QMONpkmoWi8Z7MLuqHFVcVfHU5PwEnfsqgUQl7vZHHx3kpoYFxCX4fU1S7
         mCSLHSnvBnsDiewDYEPics9GJg0Qfj2E3db582asltRXGKqsDo4di19V42pJY/3eO4UW
         Hn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780308323; x=1780913123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        b=qNLsHga47CNpALRe3g9pJxW4TApYm6jipt1IKeLRx2KP2Vphf+1UlWXgKvIBN9qR+E
         sAwRsQ3ESz9hBxRqF+be+Ln5dq/GhmHnLoFkX3RgTTX5dC25hv9ARiOzdkmBbPuOLK1I
         ZDK48LTwZ6SzmGYTYhBXmfj+tTJz3GEHZQMLjBMDaDM6vYGVmNFY513vCeH7K3uQCeqb
         IQwyFoM0asMqq7QgVTkleInqQfjgFNYjL6yv2VEALA+YxV3/XUr+XxIxKypsnckmHweU
         NX6MR+K2Qjsj0AhbOreudTFqeMi6Oe82OsyIi8HuGESNAl1ojam6xxq6ceSzbYei+9rB
         pRqA==
X-Forwarded-Encrypted: i=1; AFNElJ9ytXWbKkzUDl1fj/3sgZg04nQ2kaPsabdEjYQ+LE7OGmxOTUk4t69KGSac6qB3Wq0gb73VaYAhRE+5yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoCS7UhIZbqla9fUhu1sjV+q8SFlWi2IOoaOtUqKlvamy3Qf9
	XuAunOp9dN7K3FDnMSvdzfTm/3p+nbzI44Xb0pxV9OCuBGb0XF7uUCKXsyArUme+thkfKjpA017
	fAF6g5ATFBHftEJ23VuQWuu/N9DbwSgA=
X-Gm-Gg: Acq92OFLs+hCTAuWqnr0gzkGYZux0SbuhFzD02iEdEPf3VAlruwqJ3FbjPGJBm6+dM4
	T4hNX1eiKeUjYB5gfR31GMHMiLL7y5B3pb0UHNxdF/mmFKqPhDLAhvmToCi84KJWbQh8Il4jk4Y
	1t4Mym3UlTcTXvwQxSFl6beFxAQH48vwxnbGCC7FXuWKWIjJyAYOekvirTHlI/CeeQ8IZZzKzOU
	1mN/G0xKDgeCbpEMgeKtv91tO1tAagaPJ05YUvoWgTQzRXcu03Gw+2mf/SuPDwyXgpdQXxrl/4c
	JqcgvWP5kPfqgevteHxA2Mo3fd0ySSpunkFbQvYWYzB1TcWc
X-Received: by 2002:a17:902:d483:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2bf3684aeb9mr121794295ad.23.1780308322810; Mon, 01 Jun 2026
 03:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100318.73474-1-phucduc.bui@gmail.com> <20260522100318.73474-2-phucduc.bui@gmail.com>
 <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
In-Reply-To: <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 1 Jun 2026 17:05:11 +0700
X-Gm-Features: AVHnY4K0HX288K_cD5Sf10SY7BujkeLaPeGOHP02VGsc25wWrKbaxn-vW53Y2o0
Message-ID: <CAABR9nHh5WbC+A-7KV9jKEUbmK8WHgpf=VUk0DJqFrhhQFRpwg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your review .

> So example is wrong?
>
> What about all the users?

I only updated the internal description text to match the existing clock-names.
The clock ordering (mclk followed by hclk) remains unchanged,
so external .dts files and the example section at the end of the
binding are unaffected.

> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>

Thank you for the guidance. I will address this in v2.

> > The clock descriptions are currently swapped relative to the
> > clock names used by the driver.
>
> Why would order of clock names in the driver matter here? I do not
> understand that explanation.
>

I inferred that 'hclk' is the bus clock from the driver, which uses
devm_regmap_init_mmio_clk() with 'hclk',
and this matches the description found in several Rockchip datasheets.
However, I understand that the binding should be described
independently of the driver implementation.
Therefore, I'll drop this description in the next revision.

Best Regards,
Phuc
