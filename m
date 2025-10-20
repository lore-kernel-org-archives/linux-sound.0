Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB5332EC0
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983176; cv=none; b=IiHfJkBG/OzELoF7ZtSJeCJPrt+YYPcwQB4Gz6LMKzlhkMr6vt8plNf7MMtHz58m67y0GqKh+yVeY2hSTJEv3J04PPLRdwuCJztAEjPeqMtZFpvbBveVBCZt3f6PNlyjxS+rIL3u5UVXWJnaMdKIht8qi/W5mxLPxVmyISka/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983176; c=relaxed/simple;
	bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q60TBL7SjSySFryXNFny55HV/c4CqaDYTJ9uKCIZoOtuMXRyV1z7ZgcOK4z2Ps28f2tEEXfg+Wq8zh/oVL53bLhvz4F74GRrBIvVqy8gEhdxR23XWWhNTy7yn0LYw7Ltsloo4MbVjEdJNOxbwmEF0ZCZwrdrQAKX7/M+74Fd5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDAJU26Z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDAJU26Z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso2111643f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983172; x=1761587972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=TDAJU26Z1JCMKfmUGDyMgFDWfG/BKzVyeythVxkCiY1UImv2QpnNdy+eFtyd9iPHvV
         mAY9DNLERY5mNX/qTEjZT7JT9A3DEKVoJYEgpStEjf7nz4GPewjBhLLvbQZPxTrL3a2e
         WA4RCHzI4/bPWZyQxVm+PD5BM4VYrFOAz5xMKi3B+NIYMeY9tIF3gU7tTlaDb9HfY2ht
         Heqmi5HMQmlquHu+lpFmtBZfGTIggDmjpxl42gTzV4y50+jVxaQB91o1SAjcKZ/inJlz
         UHMxVqZlqZb5UnGZZp7alNSrnMTaDxuqSXH4kt8Mqcq9DKt4pyoD8wsgr3NQi44cduiR
         mE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983172; x=1761587972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=I2b2kLAxzhxA1cUGsJ/XDGAHmsDVLJbohumTTIORrpRkPf5yAN3Iqnq4MavHAJHLXH
         PrzUySzo85xis1F+XEZ8YFo2FMRVJktyFre7r5Qpyyy1oIOXdxIjq7xWbI8OgCfia2hR
         fI4AzQYfPBPdoPVatbphqrr785WRWDvApqfPpwtNMqXnCMW1DdNVb7aATFXkHMYrgwS2
         l+WXp+c/qYLuH0Io0csNgqheVVtfucAhOHJT0U3KhTAS/zT8yzaXqjAhvJxrLy0ffTpy
         XOn5kF/HCq6KHRX/zWRkid2BZVVuTpoGB8CF42z1mfY3aAHAKWmQo6MKxHnaklSMgkbg
         f2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVlID9P9WO72WHULwZ53ds44X5ev3umUtAuDjVm2rYr8eVaDWlDq7UcUpWgIGdbDnwGohQiwk1OOOQBCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZUhN2YDfdmiPn6BK4owml8ltfJM9Hy/2xrhLIWL/Jb696Yzn
	NiJ3gC5fFoTuxIIuwUbbaczQ/5/RotMgvz74lfbjlCdwDTayO86rRNIH
X-Gm-Gg: ASbGncsoGQX91T/X1qwHq0qUkXMT0cpHFrlgAPX8gurCjn86O1EBgnCtJRz9VNyDSlY
	67vtDaDhYf0joaj4vfzDyExYVT3n1ykipBLLoRqJxW1O0AS5dWqWRICZdWHpikdfMqjYjr5KOVd
	Y5PLpFWx7Rt80mRrBUsDMINJHluH4UYU7WImJ1NTvvv3yAlMQL+ypLQvMbOqo1tX/a1cy+l9QVm
	LZGj2AAxHFHcC1f6DYxdXiWLNl+im8aLNn8nKV1mKsbNxME4hL8tcoAlPM0DlYJyx3B09P5u5S7
	Qdgl4OzfRewV13F8unssqg/lOKvLq0UWB2W+aTVxV28MzZF7fzMZpE8lhsWNzlAM01WtFKduxe/
	GutwvfllRmeOuJyB2dKr4LeP84c0Jrj5aUrqMBHPA2kwVv57iIW4O8OdyDvmCnU89DB3Ba7geFB
	QbDBYegM5kp7hEiYn76C3P/W8Q2r+CzDiYhmZR/bonv5eVxDaFhenr465/KNbNk+NeKiI=
X-Google-Smtp-Source: AGHT+IHtpDIuvy4/yF6LdQ4qVWSEOm8AetCbAHS/ajv9TB9bfuiRLOt0expo+wltP4XyjrMHK3544A==
X-Received: by 2002:a5d:64e4:0:b0:413:473f:5515 with SMTP id ffacd0b85a97d-42704da2b6bmr9352936f8f.48.1760983171751;
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm16822163f8f.28.2025.10.20.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 09/11] arm64: dts: allwinner: a523: Add device nodes for I2S
 controllers
Date: Mon, 20 Oct 2025 19:59:30 +0200
Message-ID: <3906069.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20251020171059.2786070-10-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-10-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:55 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 family of SoCs have four I2S controllers capable of both
> playback and capture. The user manual also implies that I2S2 also
> outputs to the eDP interface controller.
>=20
> Add device nodes for all of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


