Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189867;
	b=B/1qWamrAyP9gYqEYCqV7i2gyqX8OwbSRohwlBM2S4IQjPe3EBYEcMNE9ONELiI48zHC
	 597nPnYaw2Zsoo9ca346X3lytEmcrykTt48B9hn8PGWPnuasGwaiKUUzPtj/0avLpJSAc
	 duxkr+w5e/tIWfKnnixHSpg03oeOjHtJ6jQgcQU6FcnY6KuZCnsmUXp0Mkgg9/pJpcEtv
	 AN/u8n95IIGLnE99Sv65shKK5qO8W9+sIbCE2Y9zNksKNq/aNLbgeDWnWlE8+59lIFzsK
	 Z1OWy2oHfw82xmSe3GdRpzzMwX19Ke4JC/3KXVMiJA3CICg6o3Ho8p8uR6dLQCGX/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189867;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gHQlAvGfXai4P0Ur+OtnG7chLLJh7KNbFTLF8Ef0EMo=;
	b=BEONhVlqSjGtT9GtpxSH2iBjhnKjkNqmmSfmm65fcQAM5OyY0XulZX1/N8xKlCQvr9tw
	 vsLKLq8i+iyR1qnFGYMZUJm+ycckr97fkb6nEtPk1vAqw5UBt9tty6CsdKkhYyqg1iQxy
	 1GQiNWwO3Ywd7f95CnREraL8385ehi5d8ZaD5D8IbVBZ3vcGtoY/xbqRXSIOqbvQIUuL/
	 22Sk0LM55aLA6ZyUwm8nA6ffp3/IfXBxGdlQfgPwVKOpVbL1X8yLLZsso9e0i7DoPn6i3
	 1avQdZGYfL5jBq0H9NlxCUwyCPswQS0kNymw/oGf650Jem/mCXJWYuWVgI4BBcVPZ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJqKRtuH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E643606A330;
	Fri, 20 Nov 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJqKRtuH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CC51F000C4;
	Fri, 20 Nov 2026 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189866;
	bh=gHQlAvGfXai4P0Ur+OtnG7chLLJh7KNbFTLF8Ef0EMo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hJqKRtuHg9BF4LeKnTV7+x3wkKABeBj6uAcfAuVLuY81FTLVL4VTfRhnfZSBTLvcC
	 KAkKhzgBnqIa88P59XBVm/nLG42gsqO1QzBsXDeFhk4+g03YBI2CTSbpu83IDWMwca
	 UERmXbQQcYHVk7kmfuHBT2+dy19GLzfk+PVlW+APxb3G3u3Yd62m9mJ7KwHxbtGSh0
	 YHREA09OyAjYncid8qCZ3y3E7nuPC8020XtVq49UC2SwVE0XMyrlhyAq1VyU11IaX4
	 4BF5awM2Iw46jzsecj3s9aJEJD5Hd6L7sqq3C/2QRwaoPJMiU7wKKYEEdCtEp58PnK
	 +5vhWqZnl269Q==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/2] ASoC: codecs: nau8310: Add NAU83G10 amplifier
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, 
 neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
In-Reply-To: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
References: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
Date: Fri, 20 Nov 2026 15:51:01 +0000
Message-Id: <179518986190.6016.8091344211412804808.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=510; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MmsDmAXwergZgMM5yvh5taIlamjrkCtehaE+x1riQ8E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZctJWKvuFXK20qdAVNIs+F+vCeSpxY6vmAl47dzulb
 R9cF3F3lLIwiHExyIopssRlcb+sL3m9hu/gwjaYOaxMIEMYuDgFYCLeMQz/E8LPC7uuuuekFmla
 bHaCa9Nppicmwlqqs/c3uu+3NlzYyMjwTWqKf6IPn9WOGdeOC7Md35E1K9vsZ6L570o1NSG73io
 +AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> This patch series adds support for the Nuvoton NAU83G10 audio amplifier.
> 
> The NAU83G10 is a mono boost Class-D audio amplifier with
> an integrated DSP and I/V-sense support. The driver supports
> I2C register access through regmap.
> DAPM widgets and routes, TDM interface configuration, and DSP firmware
> loading.

There's a few issues here but the driver is mostly fine so I think they
can be fixed incrementally rather than needing a full revision.

-- 
Mark Brown <broonie@kernel.org>
