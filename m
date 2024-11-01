Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1419BBC
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468029; cv=none; b=P59OCQTV2SEpD10S4TNbwzwFmnEJkahCaHYXrC3fUmIqO4Pprrx7K4jk6Iyotr/MyfSPk443VN/D7l7K35y1DOs7bOR9M/BmhzxECCeyIV4Oe3shR7/csc9kxD8P3pOxZ71/I7/vL+ofKGRtprqNchzmiU7lHer3vTlj/HyiThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468029; c=relaxed/simple;
	bh=cSRSVKy6fxvv4pqCUjjonIGzc8O9xPKLp2iSTjcSfEE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Znx9M6P0lfizjzC4wOdWp+QBkP5t7Vp7anwqVZ8PR2ZaDkNNX+Aue2WG0a2Ewyfey03S/FnonJCSVnERApXM/S51CBBlEJdi3Xt1rOGLZk9jMOX4w+vN6tB5Az+rfumkp+E3OTRw6BPmXbM0jQ5HQZ1abfoW10tbkObnPc2QvTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1p6q+MJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1p6q+MJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so15494915e9.1
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730468025; x=1731072825; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSRSVKy6fxvv4pqCUjjonIGzc8O9xPKLp2iSTjcSfEE=;
        b=G1p6q+MJJsqRhFUr4G6NIFliI4oHAarbBW+Z0bn8r7KXDunY+Fs2RjqPqZQ5CecLPU
         zfihzov15LAEk8GurA+dnZTnL4p4M5fS0urjnEfLyoEyXKabJUoKU4wMH+C4AYomXOHX
         8yrsjHuF6Tg0g0mq5T1OlHzUxl4vvnmwEJH2RjtM+OG8KWKG3ekX6JDWzeXexTloTXp3
         +IhWIjhExQZmd/muLy5fy9C3Ha91Wqz5qwkfKTF2P0Qsr/J+4Pf/rdHva9+pPINxz7a+
         9/MEz9bnXYRp+O9DbnMKviAV0miArJWdr6vXUIoPuHNgji9d9ap/suTwyd8UMvfc1Wop
         pjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730468025; x=1731072825;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSRSVKy6fxvv4pqCUjjonIGzc8O9xPKLp2iSTjcSfEE=;
        b=Nz4A5r48uPimEyEaAQN3lTrXkMTo3Rs56GA0VZYlruzglLo8S5OgMM+29JJPxQ0a8+
         h9l8CLX5kEUWy4oEEbnBsoGP1GksAQhO7P6gA9QiWpCRQsEE69Vb7aDNBVdAxN7/Ngn7
         Zps+mObNlEcnAxjbglF+Kf2PreJuxojeXcOzNqfXzGN0YKSltWG8nN0nP1oCTtuv29qD
         NXZijCtwRTXpqHB6LTj2FNRmKYCx6uTVH5z5jw8fWnua63TbgBemW3dYaIDoa0hFoTSj
         TUZsCiJ8Gncu7UjYGtZiAsPXoTeBh2DWyTX5bMqQZDIBrl/TcWoJr/3fUvINNqlC6g14
         jZjg==
X-Forwarded-Encrypted: i=1; AJvYcCUll2R6LAMroZqEMxczAfrYR0+0vMgDoXet6hXt1xOO6C92DcdfFmwmgl4xwkkeWFthTnNTtjPCGVOt9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9QQ3Ryd/8C40XUbyUJhm4F2hGPGvJKBPtETL1VwyK47NuQJPq
	uwUf4boBfjOUmAXiykVidVrZaH/sXsHO+N7BszUSpP1Ey2k5QVj6hK4emiR360c=
X-Google-Smtp-Source: AGHT+IEH/LV34+9Gvkw5TCuAvD/S65wFK2Ymadi8Nr+OKQpBYeZS9kWI6PwyE6h92sZJAW5b995gHQ==
X-Received: by 2002:a05:600c:3b88:b0:431:5e53:2dc4 with SMTP id 5b1f17b1804b1-431bb976d14mr84779975e9.6.1730468025405;
        Fri, 01 Nov 2024 06:33:45 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb78b809sm105155455e9.1.2024.11.01.06.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 06:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Nov 2024 13:33:43 +0000
Message-Id: <D5AVPVHDHG9A.ARDI8CYMPNCN@linaro.org>
Subject: Re: [RFC PATCH 0/2] wcd937x codec fixes
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>
Cc: <srinivas.kandagatla@linaro.org>, <quic_pkumpatl@quicinc.com>,
 <a39.skl@gmail.com>, <quic_mohs@quicinc.com>,
 <linux-sound@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241022033132.787416-1-alexey.klimov@linaro.org>
 <1995b110-ff67-48c3-9a82-c29a6a95a059@sirena.org.uk>
In-Reply-To: <1995b110-ff67-48c3-9a82-c29a6a95a059@sirena.org.uk>

Hi Mark,

On Wed Oct 23, 2024 at 12:21 AM BST, Mark Brown wrote:
> On Tue, Oct 22, 2024 at 04:31:29AM +0100, Alexey Klimov wrote:
> > This sent as RFC because of the following:
> >=20
> > - regarding the LO switch patch. I've got info about that from two pers=
ons
> > independently hence not sure what tags to put there and who should be
> > the author. Please let me know if that needs to be corrected.
>
> The tags are fine there.
>
> Just as a general thing if two changes aren't directly related and don't
> overlap at all it's usually better to send them separately to avoid
> creating spurious dependencies which can slow down getting things
> reviewed and merged.

Thank you. Noted. Yes, they are technically independent. They were
somehow connected in my head, something like "both are needed to have
working audio with lesser troubles". I'll try to keep not related and
not overlapping things separated.

Best regards,
Alexey
