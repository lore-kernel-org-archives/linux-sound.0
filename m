Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6539D6EA
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844078; cv=none; b=e8N5esh+VntH6n6G1PavvfWmty56BZ1ye9UkhQcSWxVYPbzK4Ll381+zqSiyXdPJ3J8oAHcwpxSy8CBcyoSMVVdXwXm3NrOcnlX+fPdxFoFU3dyVn90NXFBtfqFkcVKdi6locZxdu4U8jQi2x91eQT17i38FnOcVISAxU8Vl5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844078; c=relaxed/simple;
	bh=V2CKovgPBbL3YrqfdVzTYZbUk38RE704n2LsR5Qlxgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKUU1WdkV6JH7H7+OxWof/fXMTKVDDwRnQ/0bEb7zSkd0PlZUCrdeVA3pVZgCHntPi/bMRj40OJ6OsljZIimYxq/cl/jWVSdht8s7+XCdWi7XlbvUzMzVcOcRjvbVmG14ybeWg/JdN2GGPQFPDxK6MYWTBQQ6Rj5QS5CViRBUCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agjZ3B+9; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agjZ3B+9"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ee63e91acfso268918485a.2
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777844075; x=1778448875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+fB6N1kDtTpFfTTO4SeOyoK3hURDyYjimuuMZs4xRs=;
        b=agjZ3B+98QP7bVmUJazHJsSeCx/GUFrk3oUZPsXbTiIn3sYwu+zvkgxId0VaWd2ISe
         IoDa7SN4FNLz09aZBfBdO8M/iojUjAXQAtKyGvHUjVbM3cVTaUxZKMULuJZ6j+mf2HF6
         NOaZGJNMwND6Cyz71XBJCpp7EjV6eoLm5fbf8WXAZaA9IZ0I+iVrWBrKKCE9+BGRN3yD
         jBnEl1wm6VVFxuq+Z7DBLjX8BaN+3kqhd2/8if7FuHpIEftbu00dnYpYW/caNLgNQVem
         97kpt5SkgU3KhW9Pkss58W0L0cRJshpq7sXRv7CuNE1uwYe9HGQKaxNDDfQkt3fY2lcN
         OZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777844075; x=1778448875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+fB6N1kDtTpFfTTO4SeOyoK3hURDyYjimuuMZs4xRs=;
        b=FmRt4Z3DPkAgOYE9NZC4q+tBG/4P3QiMnCgp42vH78fjKFddWnKjhZa+u4WqRzqJne
         IgvM/1XRnki4qJpSqCLiWkR7lPwKdG1zrI4Hq5zRWamaIHpYrA6jMlFtKAZTqkdw3zMW
         FxJXXcP0uPezi2vVFft3WUSvv3B9UCVQpX8+TKFvF7+NeYUTGl+AeD5Pymoeshz5wIeL
         DdSDYe6A68Qiapa7FjdG7KKTpGjqs6xrsOW/DglolnNRn9lCfozEWbsoK3QiCAjXXbgf
         k11OXuhW2wMg9R6sK7sa10hLG6n0jNNBwDu4HDa6auHZComnGOxwt+UvGa4g5fMpPFuN
         5LLA==
X-Forwarded-Encrypted: i=1; AFNElJ8t1dd6a2AhvpbiNTuEwN1HHFTXyxXq4WgkxFn07JeNJA6eFEnRa4auZ5nvNkZt0YgeGUOcY13SzN8WSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG99yELLSMeI+CKFQ2dq3gAkLu7clu6WimXG072f/HO0JKGpmj
	PRPqxbpPH5v6yX9zXmEEzyIB1/mANYDYV/wZiFiFpPEliErCijlRlL1J
X-Gm-Gg: AeBDiet/aPXg93wAC2NYWUecOPZu8pQpNxlm6Vc6t7znEsX9/UhuPVToIaSU/0GOpEz
	w6sO8jfWAvXIKA1LiVBRQ4w45z9Z9Isu/DNF4a9Y3Z+4vKNQPSX4fmM7DeyN0usPuu73/g/+/sC
	WP8Mf7Pbq4Ce+3vTATqObZPAhScIWs5BNE4Pmj+wkXTJDg2J5todB9gA9w6sUbBDCBz3uPYOh+D
	VuCmUiPN/VGIAtfj97spxBwBmXCxQCzaMSyZeiZJ97J01RQEryM5PSWGIPZaILNgHP/bBsdv8lX
	eTNZ3DKxnUVnn62y8Y7CQ3zWlHFs+mGDogfVfyX1/7JgWpMBm3lw6i3CAUSj6E+S/81f5FIs6qH
	0zVeOLoA85RkZfss26SOY7UE/qAsI9q2bpjUuANl1HXcIp90h5P/SpX6xSt67V9m6w4rUDWsFzH
	ncfhnDgofhElOhLyWWcA7c2ZqL84ufZB8lneVg
X-Received: by 2002:a05:620a:c51:b0:8ee:dc47:3b71 with SMTP id af79cd13be357-8fd18137f32mr1102849485a.31.1777844075258;
        Sun, 03 May 2026 14:34:35 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c2540ecsm831799685a.26.2026.05.03.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:34:33 -0700 (PDT)
Date: Sun, 3 May 2026 17:35:16 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s
 support
Message-ID: <afe_lNt_zS0j8ZYr@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-9-mailingradian@gmail.com>
 <afaItZPyanmoWraa@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afaItZPyanmoWraa@sirena.co.uk>

On Sun, May 03, 2026 at 08:28:53AM +0900, Mark Brown wrote:
> On Fri, May 01, 2026 at 11:31:21AM -0400, Richard Acayan wrote:
> > Add the internal MI2S ports found on the SDM660 internal sound card.
> 
> > +	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
> > +		0, SND_SOC_NOPM, 0, 0),
> 
> Why are we using the string "NULL" rather than a NULL pointer here?

The new additions will be fixed, but it originated in commit
32d2c61ba059 ("ASoC: qdsp6: q6afe-dai: add support to Display port RX
dais").
