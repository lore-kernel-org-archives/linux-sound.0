Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348980;
	b=vkZXwlrRgH9nIa5c75StbRtmFZdTruz7zQKw1B76y9FMnlq0XB8lhL+3ZiqNQsCDav0e
	 G+OnVKYlF17d98+KkNTvf/DZwX0CI91ZKMXfFuvINvEyYP0bUaDw15z+dTrchGVz8N3Iu
	 VPm2JqF6OwJIRik2uCVOILtrHOkNPNwuHr8pOrcp6NUkd0dJ8OWGX2S+P14HgGP/5BF7F
	 AkGzABvicFbCxvCOTH4VuwLAiCiQnRTBfLwkI39BQILoIg8/n0aa9tMEfSBTHj0U1E6ev
	 yPEkD40+9I3V0Jb6pFBUTD39uYc4c43k5DMd26VSgmcY8RRrBLjwzyVPgPMQLRP2mHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
	b=Uo0IvKJTdD3DW/xzU9fvuHm9pXsYt/d9YxtfwGnR1uja8QEIfyBpTfF1/8bKLw4F3rVF
	 S0f301DPDeBdUzS7ddCe1v4iGYsY8vVicFOxkZKPQp/tsx9cOYbfXJSoW9w/AqfFgGscm
	 3fPXtRORR7bvr/hAfjrrxoCNEp6yLZ/erGsxTYgWLV7JM9u+jpHVL99DDjKGsEJPZnxJ8
	 DkQBLg+pHVdnkefjEjPGq1hT7ZU+kX8L25cxnajfIEfwXNRbwFetPvkIwj7jSGrf/Ygnm
	 uXcN/JahSuh0LU/v/xZcTaEdoR0W5/+1n7M1cbVmERF5+iJrU8fT1RUbTGAHxeVVj0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=h37WmvXl;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAD606A32C
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 12:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=h37WmvXl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17784715e9.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1795348973; x=1795953773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
        b=h37WmvXlzeqJOg2skDXkuZ2+T7AUQHNgThGjgdFemHp3spzjs6KBY6eYQMLhocih+J
         vdEYZeECN+/WBbybSUhmDji0q0kGhSN7f+RdRRtaFsNi9yWY1lNGJn7xuB1cn5i/8ScM
         tk8BgynI/J3dvysUVS2moeOvYoAiSkA16sgDP4kNic15y1ifZ2XzRwI2fFI708nj/zbj
         k4sb0gC4CgEJ8mxFEo/8xTtmnkXiveyBTOdD35D2PGlgGGZgfKF8JiO/OTZt4Ix5WVAr
         GHqZITv4Qhv0YjEyHEL3stdQh8wMyhT/oJLoqFHi0za1Jcw0cgXO3wOQ8RQ8wuH5oSAQ
         kDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348973; x=1795953773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxKNiMftVupVb5om+wXy5zkYQQ2Gh2XoL0QWLFEag50=;
        b=oP32JArtUj5devxiy62huvJoXluJO5Gd3QFAzckqTB0L/yngC7te8u0J7FTkuzgPk3
         s5frhTfVyz8YOGOYWepMfzJIihOJt8GyxjE+voTufcqxk9slZ56+xf7K8zZQURUd3lNd
         vASG0mEuqPIeZDUXyMtbVoVOVe6dGMOBEe+rsEQyKIqioZozRkmzAsbtkL4/TiA6opBj
         iWTmrEApZYraumk/a8fNrg4OxpZVQ/e2VWtco7aVI8FW1YcTlsggI1rmd7Wop5R/NWnT
         141V+7UDdpiy4GxpvCw4ecQK78gQWPjq24pGDrWYFdBayQUOjoFIblWe1NBfbglr4C1W
         r4FA==
X-Forwarded-Encrypted: i=1; AL+hErGyUxcrHXdYR+TavW9VgOAG+XRqoEvXGPB2seUsK0CXDiQxI4q9vvwsw2LC/6cvzGE7FkCMYfqoZ+v+wQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dq7McKN0pbewanLGovaHrIHlXOs5fxzYZvcU+NEhNh+ORoKne
	B4MB45oIbnotFpe7J3JgeYzFl1dzEx4SvlQw1CbeV0jwhaIyksahJMPbjjUDdh7cqwE=
X-Gm-Gg: AZFdTZdLW0knyyid2UQJoVwSNUj4UBM4p+GiiOzoZ97vqZbtjRMN97gnprPabkgcDa2
	WzLHbVhU6aTwkooHjKFEz1UcJ3lhDVfxIRHz+VfPEX453KHaotJdZi3iJ2+TrkVZ+/tpbjWkiI/
	Jp4d6XUTYhph672n1wmE9my8M53zgr4aPeagL8IBL2UO+xaJTPK7RQMFRWFnhQ3sL/5AYvvXLMT
	xG2kj8d+zwcCvBWBqTqsjUlleMl+2OM6LR+fWkv2o3w7UybkODEiua7ecIK97xaf+Uq3KvjUUNR
	Ofv4XZA2MSdFdktOu1h8OIU/Hivfz7rqTKAlLTGSLTkPg3a7++208J0P5TaVzrmyQaP/+Z6aUpR
	2MMPUyKsZ3cwC6zUCDgXMHxHUCtOiSoyjhSwObQjqscAeBy0uvmZ+CqoArVv0fJwiz4atYOBYmY
	vwPVnqYmFI8ggZAoO/sH9qJYW05o7vnQL/WZRKXhx1CAZUDmWoxnzYGuEJPOBH/M66i6y4n9Bl2
	8NR+HRxyBV2j+0wzAnHSIaQuSU1apsvDlT1ietXWWRCYRYBLlBewDzPghcaLZZKcjMklGoUqXaI
	KbHTLEZrzI4no3ybGXFXLLdbJ8zx/3WVJnf1Hino496DruCUM3dtxJAl7Bf0FpORd1s27q8LQHt
	NhcTAF68=
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id 5b1f17b1804b1-4bb88810708mr212949495e9.15.1795348973238;
        Sun, 22 Nov 2026 04:02:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:a5ac:a6f0:7687:6596])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm209160435e9.4.2026.11.22.04.02.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:02:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Sun, 22 Nov 2026 13:02:51 +0100
Message-ID: <20261122120251.2083-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179495557744.2707353.8222109296948133350.b4-review@b4>
References: <20261024214438.33342-1-olivier@mgcrea.io> <179495557744.2707353.8222109296948133350.b4-review@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark,

On Tue, Nov 17, 2026 at 10:46:17PM +0000, Mark Brown wrote:
> > +	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
>
> In the v2 thread Nikolaus said that there are separate TX and RX
> dividers, is that the case?

Yes, I2SDIV has TDIV in bits 8:0 and RDIV in bits 24:16 (X1600
programming manual, 9.7.2.6). RDIV is only used in independent clock
mode though (AICFR.DMODE set, the "6line-mode" with its own RX_BCLK and
RX_LRCLK).

The driver writes AICFR in probe without that bit, so the AIC stays in
share clock mode, where capture runs from the transmit clocks and so
from TDIV. That is why both fields point at 8:0, as in the X1000 entry.

I could not test capture, the R1 has no capture path.

Would you like a comment in x1600_i2s_soc_info saying so, or is it fine
as is?

Thanks,
Olivier
