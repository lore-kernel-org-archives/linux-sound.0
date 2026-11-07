Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061797;
	b=DUpQMvddyG1VGwK5dH5kBJPVI3SRLuEIQ0a/lvL41tGYTSmdox7uwCbj+1L6Qa/9lK44
	 qWivmJNi6TKTiXtsFT3cAL5jy/imku7cC5l+MuygeEJcw9rgi8PlTIH7Tqu7yCjYCcsjw
	 eni93Y8s7fcorYr0JbT8OUX4q1kLsyIRFv1AsE/sCEyHgxNVEtpPi78hRYV/58KU29BR7
	 2bvxI+4EDfy1ZwJYe+qv+vJLGzd8RFf3UCsq8Gm2r6ZHw52WDdv/td/Sb+y9GgQ9+PWFN
	 parGO9cKCoc6ht9ldf8FFzw2BpxxO6ljoJcQNSNW7UpY3H8MK48eYI++nJ8RWCqZhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RHsKTspEYmdY59Tijtif/CKS+tTzCp3CkEwc3KhL80c=;
	b=vKG42C5wBBKKZujOh2uUfNo+VvZ3If1ATZPCy3yAC3iHgCtdYR2LTZ/vHxBFFzHI7IJO
	 pvooL598Q9XF0lKV786izaeYIii4IQ2reHjrkWZ9zkGo8ggtkPhTcGneUv23JwNnnGhAq
	 AowAmHdvK4m4Jmf07TteN5d4qvEj2vvwetGH//veUKbPPf0P4uCt1+z+bispHElWxB0XK
	 7Er8vkVe+1UmrwstwlKijU6Kjd36UmKiGw1T0LFgD505ApE0KRly+hS7HFtj4FlDJ8y9g
	 il49l58fu5MZ1fOWH2pzOWSVQRHBV3hZ7WX0c0yeuox5k4VS5PIUr6sBwjqbEuR4LXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOfe9G6p;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77047606A331
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77047606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOfe9G6p
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so2774678c88.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061796; x=1794666596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHsKTspEYmdY59Tijtif/CKS+tTzCp3CkEwc3KhL80c=;
        b=BOfe9G6pAd1+FIxQ0xTSiHbk1JM1jWsYcfhmiL5E3UDl7d9DcqI/haUi1mipCV3VSC
         4L/7yk22492pFXYJjD9HoBBykpCz8kt2e/p0GrDVSOF8rGScoj8piTHCVTTsxwl2ju9C
         Lz7rBgnLpA/d9sV21XcuCvWMydyQ6XKXxH32mpBgz99guFizd2IK8AlBiTfGl3CaELU8
         QdT2XFBSD1Fke9JciqTTp+DNF6W7nqC8L1imQ+QXRjp4AMViIIri473fl8XSWhQeFUEq
         06CoY13+MNzuUYgTee/2edmxnoowa4/bs7YblDI+/xY2hEQa7yhAnbSAjFyeNUSbkoW+
         c9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061796; x=1794666596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHsKTspEYmdY59Tijtif/CKS+tTzCp3CkEwc3KhL80c=;
        b=rQcJhLN42o2GGOk7bR3zhvKNaIavBIkd83Rqss37dPJAIc6HEWIjR8jcL9f6L7G42/
         fyMnANvaqizfpfiygwweyaDwhinS87tfPD/kive3bNeqoq7vm9pgxlo6FF2g4qTjfgmj
         xoW2wlKdATBx/X4ViNTQT8q6LAMP57jt4d4dUiw2hRALDusqA2MuW81UFsWBfn/Uvf8F
         2L3oNHBw8un691PN2hKMsqlinNUD0DyAQVirO25eihNRMOhRVaYeKC1heUhsWWtv+xqk
         e+eoMh5N5nEHoA+HIHteG16RZgSndjrLKjQW/sqleq5DHuedUfE6VycqQNQF6xNUjony
         f65A==
X-Forwarded-Encrypted: i=1; AKwUvBxMV8oKGdoLtF/CjoSO/YOOEeaYLMeUmOBacxQ2IgP2snPLxFabh432DrtC6m5AChVKudhD8GGytDZNuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iJCAwi2zKWiiChrpKvcDCSuNgsw9rMNkX0Z7j69W5eiaGqSoM
	9T0Jjng0K7xutJ/OL+5WZ596Lbgqlf9g4nMGPkyhm106p8bcLP7WloKx
X-Gm-Gg: AYBFou3AWyBTR2oAMkegZ4KlhnGW1Cc35bhh7o2SJ2EBHX+WRSTScqhs9M6GT/mLDB0
	TDPM+ysOs/kPCyeS5t9IaKtQEJ9OjjjHX8NrvWM76cL12zez/LEQCwpbAN/8Fw9f++rgy4aR05O
	W2LDA1SSYMs4c2Ko2CcL14jHUGIzDBkeKTzjN0JbWdsUdWfVKNiGnezKZud/GRhwzvKS/TZ9ckL
	auC8HDjGCHzoOgIA8SM3VqFCx6av80jASDkbIiWzZZByWtuSAeF4JS2HmKt/AZsoOBJcVn5CSZp
	UmizdXs9U6j47EVRGY9hACQIEYxp98zGrDL/uIi52Tk4TDXpG3SaoacANpJYVerLTg8B+QVc+Z0
	adQ2H6z5nAFbpyGghGyT1G5aZi81NxkHmrLyalwZ0Sjo2UrQ6ig+hNzS5Gs4D/osTPGmN+X7lXm
	UT5TID4fJQ7y0GGPvzzkz4gYNRMEGblfPrxmHPZj9YnLf5sze3QqdME4WkCADtgvPXzAzrcUS0B
	W3dZw6nr72DURDSaTFn20+2zPZK+2XwdaUooy53wwP+nlvwc+OXdG4Vlz1slMmc+AKuOJ/mM7P+
	ZE7icxD+gaSYI6JhhQQkJMnZyaWl3GavCeVTO64YkXVDo3+kT1xDSgrgzJGxyjHgLBgSJICfEC1
	GxY5IiyAJblQR2Qrv+HEs1RcPk6faHJhJBYWKA3tBa9J9G61bgNdaqe/R+WeyZg==
X-Received: by 2002:a05:7023:c01a:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b25d334f7emr6852621c88.21.1794061796449;
        Sat, 07 Nov 2026 06:29:56 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm15593945c88.18.2026.11.07.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:29:55 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Date: Sat,  7 Nov 2026 23:29:50 +0900
Message-ID: <20261107142950.125901-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87pkwgyck9.wl-tiwai@suse.de>
References: <20261107111056.667-1-alyandra5b@gmail.com> <87pkwgyck9.wl-tiwai@suse.de>
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

Hello Takashi,

Thanks for adding me, and thanks Alyandra for the patches. Yes, this is
one of the cases from that thread.

I have patches for the other cases discussed there. They keep the
RPN/NRPN selection after a send and clear only the data, drop data when
nothing is selected, and handle a Null NRPN like a Null RPN. They also
need the same selector change as this patch.

I can send them on top of Alyandra's patches, or as one series that
includes the selector change, whichever you prefer.

Best regards,
HyeongJun An
