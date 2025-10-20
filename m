Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DB3321C0
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983083; cv=none; b=Ng78HihdFlVblV6dy7Fygh9E3Z/1DgyCoLfpFQofb2L9EGLZkP4bfDaQi/zB5e6noGxD9Pwp1zIJCFNM4jTw8BdDHwMu0UU7O1cp/iIRTWu6WXYS4++uNK60DzJI7P3YlLOOntClUmvl+uOrnvEJ3jf2MKymmj0R1Pgk5b/kuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983083; c=relaxed/simple;
	bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDn33FF0obxYwj54Xbk5aoPs1VZp8aDlvR8sYegukbeV/OR4dxxBoBrjcpVUqhnL7vIWn9ucncUogCXT+sxzAyN4Vx05yE1wCe/UQsVPdUaXAyt5XFlFbCmJsm/r/TYqDdmw5AZXffRm3+Lh9BHi7xiyZdsbj4TAO/a7FRC/Qpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB6sa/bx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB6sa/bx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42701b29a7eso2114583f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983080; x=1761587880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=TB6sa/bx5bkTjJ5MaRhcpoj6Tf+mFleUpkzyR1LtkRSW/kXnqrrcGWLQ7C9+UprhCu
         K1XY1qd1HVhm3OvgiCsqJNj0FM4j2JMbZEDSRepw3+TdidZRy4/ZurPhN5XLQYdrbMmO
         Lsn/gkkqUQ/7qMWdk3UfjUTRMGxLLUJTKxihy2FsmjW/5+zCubXFEEs+/IaRPFEzQzEJ
         wJ7pyfU1HWpXxsuNJTR7E9RGoDFMVintFSrrcBougdWmQv/+YiDsKLoHahosFgX35b6R
         9i4JyJGfT0SlDNxpF2MpizZ67ZIo8q3L3+faAIJW6gXLbFpDbZUvzsbnJ8bJjvb24p4r
         LE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983080; x=1761587880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=OcjTrcvDEYIvGg+u47zX0DHgmFvJDeBIUkeCDs77TE8dQEtFoAMjJW1yWGdkpwqYrW
         NhMshKPsY06Z2mvF7oSI41BIr4MhgwVfTQz+GnM8pOoroh7zOmZ0CdmD/A0NgJmg+9Oe
         zEhx1n1VI4XqLVtf2XcP6/O0igzV3B6qUHOyH1QHvkHoA7i1BnzIK7mMj43WxUmYYGt3
         SK8Y4Tkq1RPVMx+bXIEgmfY+y/owMLdP6tqqCJ4ztycgOvSo3G0dhvvfYrNd2G1cFZ9n
         dPFCUidzHb+yyEVdbiJ6MF72sN2TjZRtE+vpNouk5YjsoRRv+kc0r8ToUGr6f7DP1NB/
         Ok3w==
X-Forwarded-Encrypted: i=1; AJvYcCUPTn36bMKuwJXHodfQdPEOgNAZTQEiB8MXVPzcvBzQeG79x/mW0QTajN4kmH55Ep4xNKS9MKB22hXLuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMyG8QympjQCXRwKgbCkKmbzvncNH14FFCpkfkBFM3qjWLkjK
	gxnRKhOM4gMfEWkkGWKesqx6RSaAd4czrVbyaON23SCqnKD7wWKznIlV
X-Gm-Gg: ASbGnctiisRfIAJC+8N/T5G04RE8/aSsNcAwXKkNOjI8YXVu2H0gpoV3AL7tqwPfDoA
	xvwtAjJ/V9PZKk3MyCfprzkZhr3lRweXBClCbCtgTQnPlV2IdkVQnQTmk/z4kSx1SCt8Hrpq2xf
	g6AV7nbLImJ0Ko1hA9ILgNYmTfcE/8AFLPM0OsLkiGdJV9F4NLxpu1++mxKAUIexx265KLZG6vQ
	1mnPfK+/9+08xIFxJHAR2W7Hiaw+g8Y1EXOfkLm0kNhwwF9p95oGxBXeqFEq5wO0tPWpyrGf4Tc
	/Uh1LKzQlIj4iZ1WZltV7gPDyEM2PLXznDzBOZPEt73mMpiorfBp+iUJ4cTVzl6t5LOD0LbudZm
	8NuuxkrhwTwUuvoJkNwYp7wNKW9gS6EH98mDhkiiPJtPPeNGHVdLyFJctPNK/hoJlKs3kafnVHg
	80Tej8h3hKBvj1Iz9oyayJ/dTe5Lnd5zcrlDvf32qBZTwCPLEky/V54OGsYAfNeoIVgAdm
X-Google-Smtp-Source: AGHT+IEQQl9YZkR1BgzZ6Z2Nufpu9HBikDewEvyF4EuaS29j/RILS2DM6SBqWX87g+1TkKzsAinQ/A==
X-Received: by 2002:a05:6000:705:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-42704beea1emr10367539f8f.23.1760983080172;
        Mon, 20 Oct 2025 10:58:00 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce08asm16294878f8f.44.2025.10.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:57:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 07/11] arm64: dts: allwinner: a523: Add DMA controller device
 nodes
Date: Mon, 20 Oct 2025 19:57:58 +0200
Message-ID: <2324646.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20251020171059.2786070-8-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:53 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 has two DMA controllers. Add device nodes for both. Also hook
> up DMA for existing devices.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


