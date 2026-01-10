Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EA23D7FD
	for <linux-sound@vger.kernel.org>; Sat, 10 Jan 2026 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768075953; cv=none; b=l06pvkPOdCHN1pdfg/cR5yNlcq8ITbFHDqY8biZnxJXwOZ3l+leOK9+IOoDzygsWBkEROpTF9oOqk4xo3LOwFdKLOtw+AQaV9ELoIKkUPGg94La49WLBzpTW8dHRsKOZd9PCIU4A/BzytWun4OF7zla+TSLDoT1K7K+zJoKvM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768075953; c=relaxed/simple;
	bh=gqmDPrBUMH4/Iik7/Uer6th3Sz9nY2P2fa3OEefj3lw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q6de+nJJux5XCjwAhuGG+NLaMOSFNYDWrdqCuSbO62kOqOT6Z4BcgHVAr0ZLlvqLRFF/nnjvJMQf2bAl4BxcvivPx/z00lqAc/qIFSDUxsADK2utijvmIj7sEnr9SpzQl6GeSzZWo2f8e/6cpRcRY8Zs/YLo3mVJ+asg1JBpR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0tycxLm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0tycxLm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8010b8f078so861970466b.0
        for <linux-sound@vger.kernel.org>; Sat, 10 Jan 2026 12:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768075949; x=1768680749; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gqmDPrBUMH4/Iik7/Uer6th3Sz9nY2P2fa3OEefj3lw=;
        b=X0tycxLmRyDKyXoHkjojbT2v4MzBuslSFxT/ppG9rLB6T+dB2ROAqBvBOXvLtMJDAH
         9lOaoaneTHiiJQGtP7F3cWGBXKBeREw2shKY1Yr5R4HoLUaFCsFtsUFdZL9akvrDIjMN
         X7qbsCMdwIMb4TM/UfGlWB9glOIppSXTLFmOtwyu2VhzCFLE2Z7QYTBgDNWGNtjUSicI
         PlGC5cHxxPT4pXLW6fTLVGp8T9kihWd35gO09nhSkGlJqDxTso1jUKimM05HsVJP5eEz
         hBKHfqNFhSfX8dUd6xA+MHioWHpKfmxnDmDBjFObaRq8cMrzn0mHoobCZ2V9FXWP6yB6
         yYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075949; x=1768680749;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqmDPrBUMH4/Iik7/Uer6th3Sz9nY2P2fa3OEefj3lw=;
        b=CAHABn/B1nNFZVM6w6pIZ1rY23p3KDlGyYfxIsmmnkWEH1xg4G4gdq+CKZYeeNODng
         MbYxrdBgBfBvtobXTd1d5E6Z/rxAjHyIOrwpGrfb9vr08gTt7wzWL+jjE4Lmb3Ji6vi9
         vVMseVK3yT9kld2IzGaeL0IYdHSuzs5o2/ofObW6LyHGGjorIVWqHmVAVSRalRjEJF/u
         VwHKLjqv+KIuvHAEqtFc47iDv0lWJCowfakfDIWWS6jDt+sf/UvSo9u4aA07ZQPtPkTo
         rHbGIF92KDdPTFKI6hAkY283DHDrge9S6O8mTBZjfu1LNMIrwLJTp7TEX9yGmhj8WHZ5
         DE5A==
X-Forwarded-Encrypted: i=1; AJvYcCVad22JQS2lPsgb1sBxiZ8JIPDUzE/f9SlqZd9m+qyvJES7mRe0eIaPLWrSaFgqTcuhTgsMAeFXWxc+RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+dGIiZKanIFZ2tpG/Akb6oZamvOQXhmwsNbnO3wpaaeqpDWi
	/AHTZy7Qw1qS5r9M/zTsn4Nyh7etgUGMJt+Tlp3gztg+qAsg5LwN4TdA
X-Gm-Gg: AY/fxX7FhxXS5BoCt1+dMtb+X12CVS17vAo/8H40lL1L3Vcd2+gL7kNllV09TzGyvDP
	A9aD0riGiYJiEVGelI4noZjwel/9LuJRxynVD1mFEZQi9ZL2ePLZ8kwdb9USO8XaNfq+pb3GYBo
	XuooAqR7B5AKKD1Gi4ccNzdcLGONRoiFbevSExW2Rk7E2yMm3iBTwALIbHccAvQdo5mC49eOoOw
	PdKFNx/IQcnd1lY30//rJhFau+r2LHfxz2l9nvA9N/vRb4zRXU3xgb1Z7aD/oVukil6f4Pl6W70
	XE6XiBM6eU/ep06jDN5d8VkqiVwWNqZ/PQaCq9+FzG5D42FdDwK0rW45kj6Bn9g0oWTdxvIER+R
	SfCTFK/T64IWQx/0qkqiVW4r6qpHQY5Z4SJwV/CLtLt5fbJRLzkP3mUkSs923Ul6FAAy+mzQK5q
	JFqTpfI24Z2MOJCmB7bVcs1xgDD1lH
X-Google-Smtp-Source: AGHT+IEqyXVUoiPOwCm8thcx8YpK6aUWILpHTpo0KAnsDDgdi8HgiHbo0Og3YdF+jqmLDC7wVbzBIg==
X-Received: by 2002:a17:906:d54d:b0:b83:95d7:9d50 with SMTP id a640c23a62f3a-b8445179fc5mr1359399366b.38.1768075948938;
        Sat, 10 Jan 2026 12:12:28 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84591b6240sm922872866b.10.2026.01.10.12.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:12:28 -0800 (PST)
Message-ID: <c4d68a6c862e071d1ecdf3a0d7ba566e8d0e5223.camel@gmail.com>
Subject: Re: [PATCH] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, David Rhodes	
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Herve
 Codina <herve.codina@bootlin.com>, Pascal Huerst	
 <pascal.huerst@gmail.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
	error27@gmail.com
Date: Sat, 10 Jan 2026 21:12:28 +0100
In-Reply-To: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
References: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for the patch Harshit!

On Sat, 2026-01-10 at 11:53 -0800, Harshit Mogalapalli wrote:
> Smatch detects this resource leak:
>=20
> sound/soc/codecs/cs4271.c:548 cs4271_soc_resume() warn:
> =C2=A0'cs4271->clk' from clk_prepare_enable() not released on lines: 540,=
546.
>=20
> Instead of direct returns, unprepare the clock and disable regulators on
> the error paths.
>=20
> Fixes: cf6bf51b5325 ("ASoC: cs4271: Add support for the external mclk")
> Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> Only compile tested.
> ---
> =C2=A0sound/soc/codecs/cs4271.c | 12 +++++++++---
> =C2=A01 file changed, 9 insertions(+), 3 deletions(-)

--=20
Alexander Sverdlin.
