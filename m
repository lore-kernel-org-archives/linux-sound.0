Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D065935DA61
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775243004; cv=pass; b=QpiKW+q5r9o6Bi5muDA4xwdAID1bbuHDkz76GBKQRgwOEBjMt1Cyl49jYozYkq6BhrN+WD+u0tpvTW6S5IeUOG9ECUceZr6/p+lG3Y8FqapSaSTPnmTUyhFeZ66Z+t3GQjVyx/YaXHgc+W6zXnsk9lcvyqK5ZdRzO3vOjHiNqhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775243004; c=relaxed/simple;
	bh=A5bEsUTPdbw8oJ7pnW2my9HkuqnRVCyqgoWbFJPYmd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+Xr8imMlJRroXeFfiaiQUgmfBqjEmU1YF3YhCMVnxgrJSMNdqkBqPBOp58GRzuwm/3qL2GU7/bNENul9NYL/IN63LhslW5mzCCqhHtFX1LqcpJABK4pPddYhhsY/p02HWEQnBUd341U/t2EDxlU2iVI38th2YLrwpZBMu2vzO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOS7dCxT; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOS7dCxT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66db0cf6a4aso4051082a12.0
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 12:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775243001; cv=none;
        d=google.com; s=arc-20240605;
        b=ljd2ARMGMVP1jJZ1bU8IFfKMQJ6tNtYX1XCepu9niZwCn4JG02lNFzQUb+KGaK7u+j
         edDBKsADikRAXy5xjoWWcaY8r1Db5DclZmtG9wt3CM2ETBKXum23AikT8lQ5TzZiuACP
         KUyVkenuR4XJys/LJHT+ac9o7zsZV8qyq3VoKdWw9jeUIz/U7FQ5HJc3G5Iw3SwUNwf5
         AXNHNj+yKwMT3uSx7ZJ0JOzeVVYhp8ucsWnShhs7Jq3/eBLge6zhzCAx+hckb5XOHuJp
         Juet5xD9HzfEGYIza2S+wYpAFhrr0PC8elmT3h04rq6EC2qmEoHu/BKV/N3J+jNtM5Tz
         rfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OcHtFFhAWsxsPBNmUZK2NmSQE7pDjWsrNsMA+DR2SnM=;
        fh=lKOjjQPrveilnxLAq/yQDj7C9IGM0n25yxzLdkuDLfw=;
        b=ayid9CbuPbZ48TZynLbp0RXEb6CyPobYX4ee9NhUtBx3iGGRz46ZhzPL5hfkvVpD/S
         z2JSpn8+jdr/vNFk4sUTQifLRCvsfkRq4GwH3F/a8Cum90Q64kF88sMrVd/CeU3hYGtr
         nLZroGt74DnlC9tfGNjUCMriZ2+oHr9bbovopRbkKklmvjF+kQR5+F+OHwlvc+bmf40N
         9XQ5bnHzoqqsEvIc3bPWv44T3vfQQ3DGG4zEKfmXcciZvYQ7htXY2JZtR3nktDCDwED7
         OEOpi4bzuoFVKOTRLFJBPZ0HeK4hkd0B0j1EsHkgzhDh8CLWUs2YSC3sCNxQ115/TSdA
         j8hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775243001; x=1775847801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcHtFFhAWsxsPBNmUZK2NmSQE7pDjWsrNsMA+DR2SnM=;
        b=JOS7dCxTk0CWBQTg+86nHKcu5UqX20FR2RnpFZDvrUXqPV6cON1hbSnHABtg8TKZay
         zSCtFdM4NTfgihO3JYir2PBIPcIHdDJZzgGaIs9kTtPjL+QFFAaHkk3/imgQuVm6aPrl
         Oh2JYhDEtxkivIfqG03gY5cAx/p0Tz1Ltkv8lDntfg32da6mi4T6JCenVr4bQbzoOjLw
         gIBlVi9FcAZHAv4S+oB8uJjP3fA2jrjf3D01jg4YAPUFCQgHpRuOpzjrqQUBJHynGIhN
         SJk1X2N6UjyRu6olpKyTbxnAltpUa2hdL30SeBpGuYOmbty+QB4yvp12kJihKOKy8iSH
         SdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775243001; x=1775847801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OcHtFFhAWsxsPBNmUZK2NmSQE7pDjWsrNsMA+DR2SnM=;
        b=Mqkn9Av6mbkfbP7C15WE8jRXIoVWCNxnrWhpZkTjQHGlr2pTIHh0JiWhIhIT01HEQ5
         NC6XDOK4J4RFngYGXsqtm4Qa+OBkUNAz0w0ZQYme13SZFy0f3r90pXkAO5BlIfNfTiYq
         iHEWHzupx1dfi2HtkT5mL0sr03b/5agMtITVmwXnXm3BCVG7YJcOuSTLibeF2jfymEOR
         vKWGCQhC2SfpZeK5L0WIP066xhfN6ZzBwQ/vKvXVqhYpsPsJIkOsavIdr2FBbMxgfPd0
         e7+GEr+jyUcXAqNIkhDKOsy+0FvqcTMB0pWtQ4ZmF0o6nZ85p2PGp/SMpfS1+Y1JIDWq
         dTtA==
X-Forwarded-Encrypted: i=1; AJvYcCX2pmlnyXWOByvUM6nZKqEWZgE9DCSDRM7qUMUJb88h8EVm98g+mj3v6V8fLvLbHfdaR6ManNwNbEo/hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynAcbvJE3HS92//pmN/o/LqpBW0IFNFY4gHn/HJGtudxvRDx++
	S3uyWjZJK/Tqq+LqGodt6LXrXIIqIhKq2eHKHG7gD3tQw3FV/Ku0/9JvyO/TK+nqaMOdfMyl4m2
	6bemFAK9TIK++3/kdX0IyovN+rtrugnA=
X-Gm-Gg: ATEYQzxsnywInu3p+RCW5OB/iQPmrqjD8eY4F7/sxXS0X4DO/+T+La6wiwe6dtJGu8y
	OCDR2AARGlIW/pV9poFQUFLms4Vt/umtJjZvv+nhPum9b1AK/NWmohIhMZHi8Xvzr6Z7O0up4Ms
	IykmODpzWFmVRxXgLzuvlNp1I2cg+wbSTrrYcieu8uDbMwJUNABDqDhgNGOl7iQzn9sSMXbwZYH
	FHv+VnAORPMJfMTGqxYK6Bqk0zjTr9gaaje4AXgC8Zwre7CMS7kFhTkKh1sNUevyNqBLbEhmM7A
	yAkxNE0uwMa+5VRS3Sg=
X-Received: by 2002:a17:906:5182:20b0:b98:13b6:38a1 with SMTP id
 a640c23a62f3a-b9c679a5003mr158128466b.28.1775243000875; Fri, 03 Apr 2026
 12:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com> <177522571080.52946.8298472605710550772.b4-ty@b4>
In-Reply-To: <177522571080.52946.8298472605710550772.b4-ty@b4>
From: Aravind <aravindanilraj0702@gmail.com>
Date: Fri, 3 Apr 2026 15:03:08 -0400
X-Gm-Features: AQROBzCSF4N2Ha_g3d6SZ96URhYEa_Izqr8x8hOgB73_PSl3XjO5KwojFXm8ZWg
Message-ID: <CAPf2Ut0SwPYr253CvifvheLRvSyXb_estjoO8yRsUfoWPR8C7A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] ASoC: Intel: Fix MCLK leaks and clean up error
To: Mark Brown <broonie@kernel.org>
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
	pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Mark, appreciate it.

On Fri, Apr 3, 2026 at 12:53=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, 01 Apr 2026 18:05:03 -0400, aravindanilraj0702@gmail.com wrote:
> > ASoC: Intel: Fix MCLK leaks and clean up error
> >
> > From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> >
> > This series fixes MCLK resource leaks in the platform_clock_control()
> > implementations for bytcr_rt5640, bytcr_rt5651, and cht_bsw_rt5672.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
7.1
>
> Thanks!
>
> [1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control =
error
>       https://git.kernel.org/broonie/sound/c/a02496a29463
> [2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control =
error
>       https://git.kernel.org/broonie/sound/c/b022e5c142ef
> [3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak on platform_clock_contro=
l error
>       https://git.kernel.org/broonie/sound/c/dced5a373a96
> [4/4] ASoC: Intel: Standardize MCLK error logs across RT boards
>       https://git.kernel.org/broonie/sound/c/85c38c2fa17d
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
