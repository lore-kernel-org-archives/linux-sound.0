Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463536;
	b=GGmTBbjVWeVq5Te4c070GPPcrE8RWEgsianDa0IsS0t/3MMM9e7QlxYl6WBfy+7lRlvM
	 /HrIZV6KFSIrY1SVPKOVjJCYTulwKsv6mEsiExeRPE8VYmx8oQKOLNcv/jGv1cnX3tVjs
	 /npmqmDlUQWmL37Rcm259YOLVp2MS3YaEB7BiAmdKIW1YhRsQ6hyvca1aIVM2JiKsGxqL
	 qylQrEEKFjof1zSv2oukjJD4O3wZZ2XRqq+QCLwEFibdWUShPKVUG7LYr709yX5Ho8pSl
	 z68aHJHsTbFmgXpQXu+k/FLyINpZtpM7yu4N1sP2bZeCjWDoFHtlitxcIcOMFGYU/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
	b=GhSzTsRymDAceyNUOFPnKp10lAESErt36pM6l6oHu6BHOv9SNhdJNvI12CxT4i3Dsfqv
	 j8y9rQRIW6KnbBo9lZw1MCyKfLMRLhXsb+HFTdNO8PZQ1OE0G22MB0Tgxclz4EGdKKecH
	 O8PKm6UwT9YxPneCyvvnAo69Sykay7dYnCNVNaW5R/5BOVUFw2WZS6E0anPXMgHG7aYI1
	 XvwCmItrJOfICx3ciT9oHylAPy6bKFk6znqZ27YBSokKoH+kCrf2hxp1i27yxbXC403vN
	 +BpLkiSVRNqdN3yzx8WYWy9HLDltiw0g3kxThZXfff7j9TRfvKmPUbeNd86NLcHgvQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eKjXMJpx;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC0606A326
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eKjXMJpx
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so2847613c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463535; x=1796068335; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
        b=eKjXMJpxtYOICHKcuFQ6A1dpf2dL4D0gZySlQGDXZHMLC1UCS6iGLPMH793/2WL8sa
         uwnT+vVUNBsaW/DzG0iqUfC8K51GsGNRx0I4N0WM++5s987nWrLa62t2mauAVmf+vcjg
         aPa4D7bDIDcSEXGqWZ3wTXNQwKhQvjCLmqJaj5zQTm/ezpz4n+d+T6o2r+O5ATvf3NTV
         dFm0QqKc+0TA4sWYXHDTCkx2Ns5QfkxKT+mcjvSMM8oEh9/HFDj2NjBXinEGLg4MA8VU
         RUlBsssMaWx8nMd9uD+/hfBn14cAhjjRkLwL9u21l3Lm2qn1OO1UtFKwlh03ZvlF31ZN
         qImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463535; x=1796068335;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
        b=CYHIiAzicBR6jHS6yK+kgWZf+ZOoS9tyboOUVZMGCNBdY/wYv4LlbDDrXVjo/g93+9
         FKLEyv8BoG9RvqnsaEiYLwVnhah3EK3FvjdQwMdJnWQKS283GQKKfD4hYUiAOovwn37D
         8gUuAiWWYVSVQ0rG7+em2icy09TNvend+6uTG7d1tdCrXBiAW/f5c3u7P94CplAho44N
         TsMjApQV7P2FxVsA0Ub8TSTfViBThdNb/Jg31DTuyBV1VZRIa3sQTVdO7eRExGKUGURV
         WEtZGOwA0JREKv/VXe4cgD8LfrXZPSi7h4AgrKKfA3/G34sHk5h5hCC8ZW3pli4He7iy
         R7WQ==
X-Forwarded-Encrypted: i=1; AL+hErHBAUUinQanA1Fn93f7dyfzD9xV3GEEbuHDOSHE2lJxPWlT1ZZjXq/+EGMZ5ICMKfFnnPXUpW1qYFFP/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z86SRkNl+AYFgJqGY77aminiR6ddD+CiPUs8llW1WPehg8F7I4M
	7gyxuIOVOCB5U61kr+MXAZkwBkAIk89erbKGAukU1Fyecb3t4KvMzfu4
X-Gm-Gg: AZFdTZf3Brs1yF/0OKDQK/u/AFvj6LyeeDYT1UNPDo5n6okYkw8gZv5e63EULjIFd+w
	XAxjphPBZ72CnTiIjqOQK3IsgjuF5dNDuxAbxQrt6ZxvGcj3pLmmNDZWzNW8y+C0FMY3OAt+oY5
	Ceh47SCBLiMOoJlxTT+WMRpU5Iap0+lDc2DjzlDf6V3jlEZmXP8oqelwqsatXczDJaZbOCkdJAc
	mJSCs6bwLZ6cRWcoWxGAPTEijaSlQQbFzVIDJXCWGRkLdXHMF7t7etBZCl2L6Wjs5oVEI1G0DNd
	0zoDkU9MGMpVfwFY/NGu9u1zGxIBlTV4mMKp6hmPVMq7u/74FVi+JkyK+aCLoZbSTChKpSQ1Q2j
	rKLcvmtIrqYXFm8byChLQMUTYA90gMKslwjfllZv7KS5ssjeje9zXo32x4rpwPA71I9mBTxI4of
	m8ipbGUpLfYKCCD2AxWA3wE6QY/84xeWQVNx4+tEsMhQak0jd1Gk+I4/wEVFHkXG01FuOWLv8Ri
	u6Ng5IlGO4DiBqjD4sW9PLZ9bg6zmrYFMSwJ2RvWb2oDgGodt2ReYjlGTyDwFumFWgdqZH1HrBo
	jHUv1ccCrnqBiBuvkJ3rjh6DZwdoZE6ODjLELaL+A3fWHSA8R0a7uhK+a9X1pORZ7HEIdg/r51Y
	CCHCsOaH2ssEoVtg=
X-Received: by 2002:a05:7022:5f08:b0:144:c112:5f24 with SMTP id a92af1059eb24-1b5568f9e24mr12609285c88.25.1795463535268;
        Mon, 23 Nov 2026 11:52:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm34957036c88.7.2026.11.23.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:14 -0800 (PST)
Date: Mon, 23 Nov 2026 11:52:13 -0800
Message-ID: <dfdf0c3f2c02672514077465784ae1e6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lee Jones <lee@kernel.org>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 2/4] ASoC: arizona: always parse device properties regardless of platform data
In-Reply-To: <179414246010.3630016.7821414370886873553.b4-review@b4>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com> <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com> <179414246010.3630016.7821414370886873553.b4-review@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mark,

On Sun, Nov 08, 2026 at 12:54:20PM +0000, Mark Brown wrote:
> > @@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
> >  					   struct arizona *arizona)
> >  {
> >  	struct arizona_pdata *pdata = &arizona->pdata;
> > -	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
> > +	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;
>
> This changes the default from ARIZONA_ACCDET_MODE_MIC to
> ARIZONA_ACCDET_MODE_HPL, and might be clearer if written using a normal
> logic statement.

ARIZONA_ACCDET_MODE_MIC (0) is not actually a valid headphone detection
channel: hpdet_channel is only programmed before starting ARIZONA_HP_POLL
to measure headphone impedance on HPL or HPR, and the switch right below
(as well as the DT binding) rejects 0 and falls back to HPL.

Before commit 9e86b2ad4c11 ("extcon: arizona: Add support for select
accessory detect mode when headphone detection"), ARIZONA_ACCDET_MODE_HPL
was hardcoded for all boards; that commit only initialized the default in
the OF path, leaving platform-data boards that omit hpdet_channel (such
as crag6410) with 0 by accident.

Fair point on the ternary though. I will rewrite this in v2 using a plain
if check (only validating "wlf,hpdet-channel" when the property is
present, and defaulting unset pdata->hpdet_channel to
ARIZONA_ACCDET_MODE_HPL in arizona_jack_codec_dev_probe(), matching
pdata->micd_timeout) and note the default behavior in the commit message.

Thanks.

-- 
Dmitry
