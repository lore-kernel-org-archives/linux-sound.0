Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C02D7DFF
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656651; cv=none; b=IyKuS5I4VQsvV6DcP2o8IvpEg2DF14iQi3HK/NSxDR/Lw0u1iPnhJHDcCr7NysYPm3euqgJ3MOLgrGRFepUyNOMEmA5c/wII3JaQkP8hCL8wFCQgz72zMQTNjjfFOHJemx4wvdUrczmMlUB2uonEf6auctz5b89pR47MAQnKk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656651; c=relaxed/simple;
	bh=o+gsxF2a+s+BG+ImH/NesDa5oejSxzi1zOrUT1zQ8HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ommd4jHJOGTpz5H1bGxb0ftvmGyQUXp5DpbyhFR//digRPdaq3+rbk7WuVsssrDm58mnhaW2Oh64cxndfDe2aD5noIpxEKmlch9rcuXHkBiVlidYhEKDYVLQUPdXUltKFEcNAogiM5PlQbArLd3DEY0+bHLxBPvGhr3S5buyUjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQwjsR1A; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQwjsR1A"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d71bcac45so61641777b3.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761656649; x=1762261449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/0OtKa0fwpsGbbWHnbV4jMYc8LFQ8mSjlnSp1wdWyE=;
        b=LQwjsR1AZPmQeEPX6UkC5Hmndtcu0tLxyXAZo9OA0s/yscdDgyGKsmYTG29lYQB7LH
         +o5X6EBkKD6uCJHKb2Fw8D4oEuGJNAQTo15yi2fPkJGVlJ+xDCBj3ZsKbJuBZaS+6/Ga
         d2o/PLmMpZFcAB6JshRSD5a2waBPLC4+veV8HSUEZV4NM/Krr5qGrbrP/KP1TGng0Qe9
         w0vsjwh1+Lf7KdExaxhJltlbneeG/qE38Dout1ZvTmWeEpXRfDO4v8wxuyNSUKhPXtWn
         spfFkMttIaGUBybKQr1J2TjkzTRsWYxe/vqkP/EOIKeYGgZSMS4K/17pCAqdehMNhquL
         k8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656649; x=1762261449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/0OtKa0fwpsGbbWHnbV4jMYc8LFQ8mSjlnSp1wdWyE=;
        b=sOwWnsiGvMw54TSukhKdXLM9JemBSFLq2NakqmleLgk+WDbBMLc5DXD8NYxscxU9hj
         XOv5yvpb59nfBkhxrkvPlvQ8z4tzRdWX+IJ5F7zHAxt1+EOmPHDOGL1jcr6HppXzR14b
         RQw86SogzFrpakeh+9enWH/GohluQbE6g3QhMPzZv9LudnDsmsAn/oIEtJCI9rWbSIDq
         qAMOI5L4dl/6vZ9ZcbMZf21IY5aQ3IUNsq6n6Ha6KWtUbAq4zolvGnZRXygaRQxhm1YR
         pDkc+ABg8A718kC0rkjeajer9ltjLVt//LiDahstHzUA5/CShO/p73ubDaoOh3OazGb3
         z3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCU3+ornSM2t6MpWwxu6Z+px5rBvgu4nYi+RE+wQjA5TRd6J3vjNZaB5MqNNln6FbvVMit5BHtuFs/GMeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6ftYlPO/y0MSxSbLoyPPtsy5FPs3f6jhAM1oAGjiMMu+dEJX
	kWup6RyDHWbBEu+6qkTVoAicet6cPPMH1N1Ry3DJLqwA6JOXIqVyS2s/6GJrugPjHj6vz8zm1d/
	wi4YZ/ousR47sySqVmJc9lNqisPR1hEw=
X-Gm-Gg: ASbGncvaX5CNC7dAmbEVqJk/+nUAgZNakorA+jyuBOpIJnAiTgk+TvPC7Gp75guINP9
	Mg2S7XKtgVH2q6z2BYycLv7qZ3tzwIxaG4ZVV6Cm8+s3CTJ6YCPF+Mh2cfJasmDuNX9VOblYPqP
	59qs4OoEuaS1LHGM10s7j0BLCJE2bmc3YMNh5nREVegYIjqxr9ZmSM5pbtcR4VJF9hyxdPf+OkB
	3pdkgduzu6DRIGa1cDTM96BroxwUdE73KraY79k6N15cZG7pEj7LV9ajWpnhWoP
X-Google-Smtp-Source: AGHT+IGl+GnLITy+almrkll6qV+UR1AjovGvr5jvY5xg5QHKzNmw/ZHW9q9+b73du1ozFlDeRGPiDs8Hs7aOvINNsAc=
X-Received: by 2002:a05:690c:630e:b0:784:9883:5fa8 with SMTP id
 00721157ae682-786181cafb0mr31790047b3.68.1761656647431; Tue, 28 Oct 2025
 06:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <878qgvgrk0.wl-tiwai@suse.de>
In-Reply-To: <878qgvgrk0.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 28 Oct 2025 16:03:31 +0300
X-Gm-Features: AWmQ_bkosASxL-kMiGEUK0uLtyvvSN2aJsJnCBmaxZOZLhuSFph6rGxsUC3ATkM
Message-ID: <CAPnZJGD9DM6Rk9NwdJZtZRKp_8wBtS0z47v0oRmKyNxdUzvLmg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:05=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Askar, have you tried the above?  I was off in the last week, so

I will try later. Possibly after two weeks.

--=20
Askar Safin
