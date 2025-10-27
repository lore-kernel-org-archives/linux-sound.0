Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DFD3161AD
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587814; cv=none; b=fvEe8wgVsChUrIFTtQeVpt55Mp8N3hhXZCmNBao10UuIcR+78P0/OWQ8sCiCXIoqInfd57rtVeaHH+dQIhnDJlnKUw6/oG0nI1cti/n0LePzTvFdsKbIGfPt8rba/Edwk6UBrVfdit+Yf6I7qQZfc4nC/k4O9cA5hp+rWOz8nnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587814; c=relaxed/simple;
	bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I76Hyt57PLHsyXebhAvy/VgYggsPUXBwF7kz4A0Vye5Rt6beBkGKOKzDex2GAR9bYXF9QylV/nxcqC8xT9GnmfVo3O5kh216K8B8n3Nldcr6rDIv4ZsrYr0tqvKjEvD21NugT1ljudMFGyJtZxefAVPSGOSP4lntlICAh5JjyBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS5CI5rQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS5CI5rQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475e01db75aso16712305e9.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587811; x=1762192611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
        b=IS5CI5rQdF27eg/WCpXgLI2Zyv+9BcInRCb9Eu9VOCfKCHxPuKzd3ul3LeVDp2Rz25
         gv5lDFoGKy+UukPfyev+KGMqnFRw8ZBsw49dGyuiQERap0Ekw2dz9pzDLupUR5pqeAfG
         tsJloMnfa2Bi7Mo3FtfHqxVSuOLOVuePsGJzdqNtmAQT28TIyIJ1uddZevmBbmJDzSUx
         KIFizCr2A6Axgcwcj3YBPoyk7AUqNr4zLmghZ827LJZ7qi+z9A6hUVc1akUwjUFQ+Qu/
         JUhawW2kDFauJuWErOZ9Ho2AYfzYlK3l7gmMQYL9r/QAbDv9ycriWM3IWUOQ9O7tZind
         H8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587811; x=1762192611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
        b=quyXIvTpPUobRBtYBaGkEfLk7y0nd05B8mkQNlVzMlE/DINHAUTDQiQGlyOsGMQ32V
         zpPq/hRQMqN6VZ6eiJu+hgwIdbt3nmYiVfkzdd1dctUDE6CrM65ItuVtYXfGUHQ8u6c4
         t944ZsEq8qLFymzhsF6hZ5BJKMvvPizdXiXPV034MiUaqy+vAuRtG25FeA99dLk4Mn0B
         eAK1qtYrRtWYrC6noKv7KogukOxhoLNicoVp1TBN9d+Sw6IgFUJy+ukyhmwnwQDX/PP8
         8Blv1vMM3VTYOhp5YY+kojwyZ2Srnxr8n8EIoUueoASyK+ZENk8etr8CiyZV+LCdzpJX
         VIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBQBh9vcmMpEfVdVSix2OcAYHJphSaoKaMKUO7ijdaa9iUAfjS588jywJeuN+TLQsnRVeixbzdeZKcLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+peVmGGyrzr14pWRbG65rYWNT1htdBAK3tm4cN7a6yIJuctVv
	hj6dXUV2k1BPiacU4FjAYTSeQvToLLM91BejsnM7Wj8oyZEj5POdkhpT
X-Gm-Gg: ASbGncsKTCbH0nfDi7+OlMbErcnBG3eQNnHI1/It6KZwvHcLuaNR03d5KZFo9FgvpuQ
	9a3BeGKphMyPtr8c/VWWuUbcUJbnE+K5PWwkFA7AEXzIZiXAicKAxaZdxnIsSaWXyYZDgsol7Eb
	6GqYWFUj4V+llOx4VjG6fmQgsZwHMVcaNUOm2NslcJHj4zjVhSPN1QMzBuHTkBypYgY/fvrFQmE
	LpXErJWx3UGhQOPYzYjuF7Yuw5kR+uveeo6PBCAKaVbbjUY+yPpqsTSJCh65SzT93Pf8E7BEvrg
	s84JijoldtKgywallF/Ja4XpL4T1CO3P2IglF4dn1pSXt/fDtVERphnRzuPg3G1lPsa58Wn9KUe
	vSQQ6Q2vBRKxgckCytNiOfdUtyRdEi/Y+Nf3ftNfeyttYk8PF6q4OtdMvuR/JVC2QH4FObuBsmb
	C1UVOoSUz3I69BcCK6BRlgjEp7H7smiqsi4KS9CDMGUb5LayhCIJ0fvzUyDQ==
X-Google-Smtp-Source: AGHT+IEihm/mMfPTi4flOTdp91sIkNaqwi2a8InYOu2pJ2ai1utyKQHaHYaafUG+/91FRnDBC8gdGw==
X-Received: by 2002:a05:600c:64c4:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47717e512bamr4754785e9.27.1761587810623;
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4cc596sm152270065e9.15.2025.10.27.10.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
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
 Re: [PATCH v2 04/10] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Mon, 27 Oct 2025 18:56:49 +0100
Message-ID: <6204310.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20251027125655.793277-5-wens@kernel.org>
References:
 <20251027125655.793277-1-wens@kernel.org>
 <20251027125655.793277-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 13:56:45 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The TX side of the SPDIF block on the A523 is almost the same the
> previous generations, the only difference being that it has separate
> module clock inputs for the TX and RX side.
>=20
> Since this driver currently only supports TX, add support for a
> different clock name so that TX and RX clocks can be separated
> if RX support is ever added. Then add support for the A523.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


