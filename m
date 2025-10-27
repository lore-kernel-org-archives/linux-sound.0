Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DF31812E
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587927; cv=none; b=k2ffVyXrzPizQEJppE/gpBdinBZvAgKyEjMyKAOC/ciofZdpeHz0hpeIheNYIm5GZv7bHutEWCBKIwIbhMwX6s/6skRGOokVNJKy5+EbizhyLjdP5IiOTyZslLwDVj9qamiqWDgo/LjmWioDLg+oABKI/EFpIMVvDz07phG+CVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587927; c=relaxed/simple;
	bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5GEtHxvp1p1kb9JiT0bOblMP6uhrAgnTRgTuXPAUx2SYXRH7FYfAnnjmeHASpgSQeWP87muaFSg8L91d4LY2rtPN97Fd0qa+exjNkT1ffHH6MppaY8N+v76JKIja6k6FrtgvWfOvfNVuAkzeoJ0s3zGc/sPYvf5SK0isBoA188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5dMn04R; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5dMn04R"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so3476977f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587923; x=1762192723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
        b=b5dMn04RsBnItqzMCrb5hnhZy7S5RbR+b34HZ83ocRWHgAEC+41JFR/XB9gGdXfhOX
         AEy5dHe3CpmqPWYAgEgp0XIQeIxawt1YD8j9ObNaAUgkN3kj46zrjZFzuGKGz3Y/LxYd
         QiL6xQ/8/epQfyOZPzu/5eFO4BhrmoRE+nOqooYLV3lLQrJBMpedGZHDyGCF49BuTo+p
         xQhOmLbKmtWl9p/JnsxUHeO+NRKpI2GZvDsho5pqpVjW6X9OvTKtgA6dpYMO9OjnSiSL
         EW/edlUyJLao0lgmcVIoziB0HYEPyN75dIvuePvJPwahmVPokHxRYM3kj1dgB00w8wCS
         iwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587923; x=1762192723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
        b=sGYzits2zjfhISxyQUceMAc7nlmooa1zJN8SVD2WxXbXXeI0gAhelV9ZjjzVdlfL6E
         fLwR8w5Nk8QaARmg93L6OSRUKw+PtpV+87wK+P10trkXwDIgjiDnC/caFmrjKsVLzmjS
         nib22hUuAmXBIuVcu0KHPLPoQlyBD8m95tvO8jkXYN9U5ylkFl2N/JT0jzVraHJ2nOvg
         qeGCvvK7PXNzvAptj5tjsFFkqp5fD3NoEbhc6krDIKVLAa/5b7bm92pg88SvyXWPmPhu
         aIcRF118p7mT1pNeaIec3h3A7zwx3phmRtPvqAA5Fc707eBAfKtq3lO7pM67b8W5ha/E
         1JoA==
X-Forwarded-Encrypted: i=1; AJvYcCVm9Pv64zrfmsaYFmlvAjQ6jXiYTHF57hqjtDXROGbov/EXyjB0oEswf8kD7FhVLnFxjnU+p9+LIGSn3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIT9edgaF62iAwGBFLqYqMYBCRVMkrkec7poiVaYHdxqeJ9xz
	sdKLWMtJRg28oiycihecdbpSB4Ewo4tvUe6S4gAVlAGuXGexgN8aXP+G
X-Gm-Gg: ASbGncvctvd9BQatrinXJN0YN7FIlEfrTYVOD0bcykatqto03/IyDfj9wW+WGLILuVF
	LyRWCK1XodIRmkOKu5OPp4WyJRmT3y+zXNNDVDTGYXLCpA5UwYBNmBx9LOvnmFvYYIAZDSHiL97
	0NBPzfYps0kFc0GPBBPbG3YkslNqeiaixeRXprwYA6AxpXO4ibQRy2ycuDdiEYREgHjnGV4cYYh
	jYGAN74/Yo6GvJ5DOIGAI0g/k/30pdItnNgVWJ3DseuksEURzPGoHwOaRihCZIrUhtz7/iNCnNq
	INqW+tVNyMVQ086T29HH4YBonTM7eOzWIinHISj8QbGVI3W7YL+ek4M9NymQSzdLPOVdf+pzgG2
	16c+1GiatFAD8spQ6h1M9Kb/oE2MxLanZ7KDCHJKKTpy86FpIEwLSBo3tuU80L+GVMxkDwMHKbj
	uJ/wtchnDD56i3Q4b+/fOB/zPzRzCH7oiGD6lxPJItIUUWn8Cv5NugUz6r9QlyUfc0T19m
X-Google-Smtp-Source: AGHT+IEEbY/WNAlAvL+pz8s7XDkjY8oak1WE3FbbRf2JSc/Ve9J9gkYo1nnN4xz8/yWauuSoOfnmDA==
X-Received: by 2002:a05:6000:2287:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-429a7e59dbemr594649f8f.14.1761587922569;
        Mon, 27 Oct 2025 10:58:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm15264123f8f.40.2025.10.27.10.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:58:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 09/10] arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and
 PI pins
Date: Mon, 27 Oct 2025 18:58:41 +0100
Message-ID: <4686611.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251027125655.793277-10-wens@kernel.org>
References:
 <20251027125655.793277-1-wens@kernel.org>
 <20251027125655.793277-10-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 13:56:50 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The SPDIF TX (called OWA OUT in the datasheet) is available on three
> pins. Of those, the PH pin is unlikely to be used since it conflicts
> with the first Ethernet controller.
>=20
> The Radxa Cubie A5E exposes SPDIF TX through the PI pin group on the
> 40-pin GPIO header.
>=20
> The Orange Pi 4A exposes SPDIF TX through both the PB and PI pin
> groups on the 40-pin GPIO header. The PB pin alternatively would be
> used for I2S0 though.
>=20
> Add pinmux settings for both options so potential users can directly
> reference either one.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


