Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F8329C4C
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736445; cv=none; b=oWeAbdCFrdIDy1BqskhS73ZSdpBBwvANOW43Doyoq1UHBr6MajI14lMI7mrw02g2+kqawFYwf3+6sL9ov8euitf0Y9X0NSF8jbtzQljTz9Mwu2XLoGVcXB1tdP+vhRu7H0DdFg090zabaac3j64ii4jn8v4sh57tTtZKva9HrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736445; c=relaxed/simple;
	bh=D/lapmvTOwB4w+eO4w4TOz+x/hybYzymaElHesTMXeg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QBePonAf9Bzydu8+VJ23AysEHPgVtK+ZEi0SZiCA9OzQDG79RFAa+8v3fONwgYQL0orEPYChZv0rlBVBktKJt9DiRvWBH0bWFiJ+CV+C43yyJndMDGS1Ru6pZjtj+7f3dzXylgS0JNDOCH3O+icFTYKxSaFu8NtrKBhJLRdsXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMkOPDNj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMkOPDNj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47112a73785so45284055e9.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761736442; x=1762341242; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D/lapmvTOwB4w+eO4w4TOz+x/hybYzymaElHesTMXeg=;
        b=HMkOPDNjTBtwNSGyUdsh90hVcMTgwt29vCrohawwxgBIRvGVcsrdQl4T7uJck6O+R3
         8GCqfr4X3NJWetrtdmX6vbozpxVLnOhbeQ+yNTjDOImQe2+vW6vGUt8hKmPhCySmYhX3
         X+eHLlbaPkZomu0wIyN3RN8EpkqrIqtWdaC3l0eOLj8rgeqW3VIosa5A603xlWzlLH4U
         mfkyajlp/tzIApDVErxeRPyn6FNSeDAUffVockuf4LJMnYIKpMaPXZo0vHb6ogroup+Y
         Oza6KTz2GE7d+a85ZfUV/jihKxsr0J5/5sogAo9vNBIEAtZh+tHcJWAK6D0rUm0Xuc2k
         WfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736442; x=1762341242;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/lapmvTOwB4w+eO4w4TOz+x/hybYzymaElHesTMXeg=;
        b=HGt0GsP9WBRJIHmmAvJSXEIaGogeDpJFbvnsQhmCsme6pkiAHUYIUQWGnXOH6BY5xB
         WkhEil63pTZ+vINBDqMi7OPFJ/gTfmETWmjZKKVyNNGdeRXYqicpw7En02DasdEMgCUk
         A6vAxvTVVjfgFUamCe+4zWxuo60yWUfbR9J5juXcD9Oi++XNLHj52C/Bs8GptRQADapW
         TZSYNx/9kHCHQunf3T9yLibxjIDQe5NIE7NBz4YRJJ1jVt3eUEYT5woGnNqxlfmHo35Z
         delqTbEitO1XtGQjL1far1cPkvQ8tUtj7aQeKx2/TpDwSgVI8x2U48tRebdA/d82l2gb
         eibA==
X-Gm-Message-State: AOJu0YxMgCrspE3eYb+o5T1yYxTcVOzjiTHyq30+IkkRsZt031xc4g4B
	rt4CwzdTYIe7F4glitwkQ2/skPwEYtPulVHUlHHmxXe9qFv2sn4fOGMo
X-Gm-Gg: ASbGncvZmso+a+C6IjVaFvp9KC01MAGN9kxddPrsQdVWYiLNxDvIi9jTnVaJFZ/LyO/
	a9AN2uD4PFszv5ZWNbRE+xNdfJ74pOwpmkMEEQmFNzvdOV4tPWdw8WGtVb707LhwC0n/muEj1zm
	gvESiu6aE38yM5/iMRewG9FZLVCOcLUtsM+JbCHtUig4jbwCY4nnQZ+z10IV3f48gMfTqq6nCKQ
	OFj9blQx7oWeqLTyF9QgcDVSg64tHKPs6wHpW0xPlqkxp3UfHbJfCW4K3wItsV/ZcojpQPO7huH
	KVgGqLiMtWTh23FAQGzmT7rh/uhY9dO/QZ+K8feKI3G0s4ywsSxW9CB9AIKdsn13CLPvotyMrsR
	e7wPnftJ79bWbo75/Y+5ZuolG2Yw4+fWJNl0ReSHKO51QHLfeECvxRVrcqmVMg/zCwyoEd/qBxn
	ewFtQUekiVuaURs82vFA==
X-Google-Smtp-Source: AGHT+IG7oVJwZfUJXNbRBLD+lo+88EHLuFLdA49goSZs2zZITHJszlARkVGhqDOeg4E/63DSjHyGIw==
X-Received: by 2002:a05:600c:34c4:b0:471:d2d:ac42 with SMTP id 5b1f17b1804b1-4771e333a08mr22980435e9.14.1761736441418;
        Wed, 29 Oct 2025 04:14:01 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e18caebsm44190725e9.4.2025.10.29.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:14:01 -0700 (PDT)
Message-ID: <ab9c1f88026058fde8cc37057864f25889ce47d1.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: cs4271: Disable regulators in
 component_probe() error path
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org, David Rhodes	
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela	 <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nikita Shubin	 <nikita.shubin@maquefel.me>,
 Axel Lin <axel.lin@ingics.com>, Brian Austin	 <brian.austin@cirrus.com>
Date: Wed, 29 Oct 2025 12:14:00 +0100
In-Reply-To: <20251029093921.624088-3-herve.codina@bootlin.com>
References: <20251029093921.624088-1-herve.codina@bootlin.com>
	 <20251029093921.624088-3-herve.codina@bootlin.com>
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
> The commit 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
> has introduced regulators in the driver.
>=20
> Regulators are enabled at the beginning of component_probe() but they
> are not disabled on errors. This can lead to unbalanced enable/disable.
>=20
> Fix the error path to disable regulators on errors.
>=20
> Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

--=20
Alexander Sverdlin.
