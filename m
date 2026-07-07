Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E732367B76
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396766; cv=pass; b=j6faOEG95Bjht4JsV/elra4Jb0DcNTQG/Sv6an1nJKv1074j1hm3FvtjCoEuQ7OGv1oH/Uto9nvV1+e7pnA5CqzVirnECGJLFe1Bn74QsKwPiHWnDrr0/1WICzm/aL0e4pBSs8Rb0qq4LpO4MrOxSiwAG5gIgOPzViHJbl4vwBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396766; c=relaxed/simple;
	bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSNKbJ2se0Z//AYFQnLanUxB47N9AFQ5xxigbSeRI/sHzMmE64pNl26d2EtU8eP5iwUWn52q8ea95CIRPUmqzpbqZ9yn3jLHrMAcpCSZf//L7+jo3wk1TYAWHeC6+nUUiUalfUyYMAf9U2TN3R7DH9ECvw3BFEY8YYgD9dr1eeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NV2hdj7f; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NV2hdj7f"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847921eed4aso5077026b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 20:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783396764; cv=none;
        d=google.com; s=arc-20260327;
        b=UFWIpUErXETLcoc3JcTFh5bxuCYrYHQUTFxpHV2jtk6Wb4TyWb3w09u1RrVHEvA7te
         47DLat0gIJXQj+K2IBvVyJt7Jyf2cwEzLg2sSFMwISwqhagZsjKGZvlzkocIiPAPK73n
         zeqam4lQMow6uJy9YU/GtSgq0fyGj6MKWWIJ13Eu5IYvS1qeqrNnH10POUPulO3mHNQm
         329TqjeEeYzW918oLhxyxkm50z080Z+bv+SL5YH6j/4peEGHrx7E2jOH1BlLUNWIrOs2
         ZK1Bd+V9xeQ+xp/SOGFtFHIDVaFTa/Zjqk5jSGT9aDjrHF2oH4Ivo/1CJLpflLVhEaSz
         6Ebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        fh=UiAzMh203XwDqikoNeNT+n+LsLVGNI9JNtoqHw2AmFU=;
        b=pwIPP2/gXDQpyKIPFCAu61hP2Jq2DrqYi29SoOt7+Q5bdDynGgGFjQtLD8EhxHpZjd
         N0NrrnZuPZFbGLjtrSXQMiuP3Bkw3aD0c547P3i923AwJU8XoNXukHjcpgVDNQZyNZPX
         WAxi59aT+GKfEssMyb5KOfYC0JjsDQva45plrnp4Y+8NiRVtQFI3YcL2vAHDcOmHpqbF
         o7/6P+Kw8hUx3+tM7Ntn7qAY8Y86g7Rhf3JyDkUW8oAGdp+C/nUhoiHWzhDKs0S2+Xj7
         eoDF+JjTYYysxxvHlRh48IynFpvdSawMyj63ERv5KQ5hGY74TkRaAOHSoJeWao4Lcsm1
         gFJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783396764; x=1784001564; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        b=NV2hdj7fgOweFiONiVQc5zM2UCw5b72QYFO4zUZ6zC/N63qTBW197vFgqyiRFf6Mwh
         RrU8Yk8P6rWd/4gFN/ux+YEWaPmd44QLXl8Ee2pkEHAT5rSq2nzPqHw3bYAuNxlU20TC
         ZHEqoH62GfeNy9qATmq1zLjgxTgzyt+t4x7fjn1MpNbzD+ks1s8vf0d44fhDnTU8Mjeg
         miUw+sH0c3Txydo6vHxgtd70MReRnLscD75Vg0JvWbvvqCk9J1+E39cWr3gQfOuUGU38
         Zl3lwolSH4O0i+ukfnio63sbCJW5oA1hmKg4ezWz04KuksjJb7yDEnkRPCxq6iGWKh0+
         sNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396764; x=1784001564;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        b=SDvYtaOYBhBjktSZls1OGNw6ngaPnaY06ldNYSgh1DY3c+9KpbKopvcDcvM8YweAUE
         H8KgrArew5FR7oVj7YVUhTTEoLSBfk0ZbRGchUxb/J21r13igKXmAsxm99ozXm7u3Tl0
         JBmfLMOD8nMubKaGswS44qq9cQVmtEOnBkDu+2HIco4/xqCuQmzMpS1eOCbyw0quEdYX
         Utxpwy6T44NPDoMj9mCsXJn4Ttx0pkoVTBPLjLc6ZgvCkO5MSl1AdNz8dLypc/16XEcx
         TZzPk4gUqz7flCjHMeyzVTiDM9bRKxGACp/FSgFqfYbVfygTQ0Nd1Rs+q5D1tU21SEj8
         byXg==
X-Forwarded-Encrypted: i=1; AHgh+RpVHCwr5vwA/d3Mmq4iG45SKHmYEM9Y0txK3403D4G4G0VEAqWweZE0UsPWJceJeSNsSSGJNZ1gkea06A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZtXsES98hWYNCV4ZaQEb88nes3U0sRaBjT8VTrIQpNeN5O+n
	di8rmVBnHj9jQUmuZfvRUlsEsDisQkZwJwuZ8ETKLXzLi//bVEyB9ecUOFMszFduwfD7mRQuTYQ
	aoyOXoDUpe3NtyS+Ki5WsiEby0SbRjK0=
X-Gm-Gg: AfdE7ckdIrvbCdCqqGZlUpDJZgvQPzWNtl9Y+TAFxE9gk+F9i50tSZaGcpcKZncn3qA
	u1Ss3LTZY8ND6yvN8vA7XReNQdmL4tl+xZ06GramPpRnmOKMt2TP8Wq6Jgzp/E0BARv3WNb7LLa
	tfmL8WxavU51dhu4qNRe0DXjcGmO2TWGtO11q5sTYIoCzfZn1e3VhDTVOV1CH1lNL5ffV9NTgDV
	bdnYSFSpD+KC3tyb2ju+Tp4Y4KGlggUfqLqxJbSaP8jAtZp+Edfhf12SOBH8PGM2+ZpODD/E9n6
	gLCua6wj8i55CgA9yCKucasDn12ftjFyFIRgMw==
X-Received: by 2002:a05:6a00:9098:b0:848:2f77:e2da with SMTP id
 d2e1a72fcca58-8482f77f285mr926489b3a.67.1783396764389; Mon, 06 Jul 2026
 20:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-16-phucduc.bui@gmail.com> <akurCIxgAE8DIaX1@opensource.cirrus.com>
In-Reply-To: <akurCIxgAE8DIaX1@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 10:59:11 +0700
X-Gm-Features: AVVi8Cdr5GH5D3WCL3jF5XnsYudncDmTeKJyjdqU4Gu_BSkC_ifMDT-rWPN5IPQ
Message-ID: <CAABR9nFpFR5JpU4BK_mc37sVzi9qF67Pp9y7Zqu0-uj+e44iyg@mail.gmail.com>
Subject: Re: [PATCH v2 15/24] ASoC: codecs: cs42l43: Use guard() and PM
 runtime scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thank you for your review!

>
> iret only really made sense with the goto, might as well drop
> the variable and return IRQ_NONE directly.

>
> Same in cs42l43_button_release().
>

I'll address your comments and send a v3.

Best regards,
Phuc
