Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76CF2C0267
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958973; cv=none; b=cjMJJZTWMSR3Vi4WoR1dKHkTgWeWpTzaHwTfkFNCywGVainCKhTY53XZhqAdcXawnjl7NkG5lQHLE6JIGC7rxEN+UbXZZMWCtJYi2LDrndEjAn9RY80TofNJgpG+86+R5HT25Bl7Zx58rhVgW/bMvdA2OAWhKZvwuhvqE6PA6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958973; c=relaxed/simple;
	bh=2yzUnr9Ui0L1rSmCiCoKOl+dint/zZhYkZEu4jNtf1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+D6VIcnAD6UMTRD+ltvYmJq6ORqAHK5jjuFmpUCEkrhZUooGQUH2CNKbciOIgnKoDpiIBj1l5WKlCvFZ345I8tz3uOZqXzHPjN19aMhKiMcdrd7qxVXbbyjcjICu7j4bfApaJsldTYvcwA7IjkU0BNwc6/GTm6792AwO2Ej4Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tevq4UlC; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tevq4UlC"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7b97ce4fc60so107975a34.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 14:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759958971; x=1760563771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yzUnr9Ui0L1rSmCiCoKOl+dint/zZhYkZEu4jNtf1U=;
        b=Tevq4UlC4X+tyvS91mM/Os1W33dJeCi4j2vIX77VjZYOGA+9KrkD9mPSi8B+/WUSZP
         1ClNvfuDRMnsPEOMp2r6zVreHp13o/90CjJzvYao6pB4wGTwcgTsA13FzrvJLlcJ0bDG
         iDwr+S606AhcT9QA4OpCXWNo8kpqB0AUGlmFObg2Q8N+XoIxdqXu2okKphOlku9bpRU2
         lnd2DZ6Y/1uWAmTMJ3Q7cMO2YtHYdwlx0ac2EBwJQ8BiZng668PDzEHw9kxPd5Ak9Z1W
         YfC0l0O4o8e/+mux3qoiwM5MAK05vj2AHEYMZ2Rue+K/0Htx8jz74zWC0OTSbpVnTMAe
         TKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958971; x=1760563771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yzUnr9Ui0L1rSmCiCoKOl+dint/zZhYkZEu4jNtf1U=;
        b=VKISiXpB2sqho0+vDeBXDMM8BrLt1sdOjl0kMoDxr5VcQ4mZeMv454yzv23MlfOqfY
         D9Qs3jajPG6+QqReQXwfr5JtNTAdKh1fwwyvwivlei/q87AWWK7ujrgYU31GPdCwr/MO
         YXRAV7aY0RQxFg8XewNBYPXTJkx9R0m03eCEdxrm7tW37ozLR48jWywhAHDUdBjyozEA
         XlnO+jcKcU5+nq8fCXIrZX9tbszdM2RyruVSSeSGTMGsvh8ZFBJs0XCwax7cfNR7ivIQ
         iSZKVteY1rgpV1PJzBFUZGIHOuI9TBpfwjoS/6aiW3k3UV++yvY9zTPVbZDidKoFKAOb
         pkwg==
X-Forwarded-Encrypted: i=1; AJvYcCUmOyNADMZ/zx1aHrvdo9JGJiBAkkfQmP3Mp+86J6g/10GwTaJELUdbWfuv5kaxbgmmd/9C/5gXsvxziw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfsw9FirSEozdmlDhhZHY5m6D15MyXqFPmfKr9QVco7//IGz+
	qhpwBMTLvj7DSxpYyzq2ANC/Y7u939GLNSlC4PaZ5onmMr72twLnDf8z3vGQncKFwKLPyyMay8a
	lTcBM+5thFKmtdwHJvpVWelABOIGNvgA=
X-Gm-Gg: ASbGncv2CcHwBL3Ila8bo0M4kdUr1HRAUr/33k0Kf5Du+S8XCUjwDl1QdKr2vV6emPB
	jp2yAo23zfZzfoU1XsAqGyVYl4y09nXAJaMxSZOUybra/YwXY4OBVPinykRePVaIxDsh4bYf0cj
	12+1U1ETtNXBqDa42h58ZnpTV/VsHUyowSTZCKD6vFU5uOmCTYNsf8GwvH1BGBoIGXdE8KK3CxW
	ExNc9GrTc4RGUicIKBLhXhhwKbAbIDorXVXZrakgg==
X-Google-Smtp-Source: AGHT+IE7wq0GTfr6Wem0mYNTlAkaEzK6ipA0S8kzfZ/y/0u2+zPT1QbZBuaSGMpa3xSoErIYIls5LtEWpgjFQsU+jdc=
X-Received: by 2002:a05:6830:2b1f:b0:7bd:cfb7:1853 with SMTP id
 46e09a7af769-7c0df80b567mr3334934a34.35.1759958970922; Wed, 08 Oct 2025
 14:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008162719.1829-1-briansune@gmail.com> <aOacZAiWxG9XfWLS@opensource.cirrus.com>
 <CAN7C2SCDNz5TB3deVziuNNYFnPV_hmrsPL1k-j5Dsj58wvC2rw@mail.gmail.com> <aObHCq6JAHbtTJZ8@opensource.cirrus.com>
In-Reply-To: <aObHCq6JAHbtTJZ8@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Thu, 9 Oct 2025 05:29:19 +0800
X-Gm-Features: AS18NWA6fff2AtJtJH769wFOzOwXshBwzO7k5-SHU66b3SSc8BXOaZvpYrb_ykY
Message-ID: <CAN7C2SCkdFCCnNwQ+HEWNb4W7fxdZt8xC4DEUu9YWOVae5L3Uw@mail.gmail.com>
Subject: Re: [PATCH v5] ASoC: wm8978: add missing BCLK divider setup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:18=E5=AF=AB=E9=81=
=93=EF=BC=9A

> 1) Because you can't generate the actual BCLK.

If you can't generate actual BCLK can you generate actual LRCLK
on this codec through the same MCLK?
