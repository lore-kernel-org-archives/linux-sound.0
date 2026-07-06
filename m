Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05BC3B27DA
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330315; cv=pass; b=Fn5vPpYvMNzW7mIYwC2omrqfwxy95lxZhAvHPPvdOwP1HObDtTeUBem3QdRxO2HUEx8WwK4BhM5O9TOtQZSkr9coPKd2UGRqwDOALeSW5sNV28W7OqejdmmWj081tPIrK1kRShRX/O9CGaevZ36HsVOo3PimpR3Pa/fuQYNJo2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330315; c=relaxed/simple;
	bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skJzi32aXc29U+MNrHPKymkShbDSPxJRFG5f0fcrqv9xiT52DzherF3QlV7AcQPCukUBnRkJWVf8S3GGFc7+0dEk5Jo9b1qVxoYAPZ1+7NLV+QhjMx7fQKXUCf2b04SHI+fZPdD4CzDBr28PRcPQTJBwjN4xRwHGgXHExAdQlBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFLnTz4d; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFLnTz4d"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so750581a91.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 02:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330312; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7COU+QuPmEON0fekH+oR3GjHSJU0gE13i62Jj/QsmUSH5sUIP0X3WCo9qXWxxNdXv
         zTcxV5h7jGBv0INZOaSFnCB9g/mySQEpDVaSg9R9l+3IfcRopSj7hz5qBkJsJmEepPBK
         pObSjNK7GxPtIDCwAzyJQavaUy4d6IV3YghkMihZTDMqSrW9aoFmM5bCESSxiIUvWwXG
         TwN9VnVV50mwZHx5LhggstJqXEw81e/w9KakhVMADOznfmkwwsTa/HR24R870m0vpGez
         xB/Sa6ixzdDSYwNu2IOtKKnxiAYYDgCBRXx21+kyV2ZbB/GXUWcf3EM/8c+u+dq2u1s0
         RPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        fh=sxKIlVx+MhjBuZH04H670TIQUW34XJ5xlwerf5LARvE=;
        b=OPdCvRBkIouTugstFshl6nSQvrd/sYJ/C6w5dNaEpqM7JFbS/r5/dw9Wn6W1nYwdDp
         2C2iyt3QkwlW3/ITkXtbgst2HSBnJuN6IPFY8nPZiuHNXgs43e5tve8HMOGFh37H5KQ3
         HRvcDAdIqF2KJEdyP3fIMqvmlv9IhERQYYPwggZXXV1UkdKfEzAtB6AI7Nr5FV9Tkg4U
         ntD6L2TnzlGkz24AQMjrAymeaxOwxPib31/WIzz8uColML+n1vmo6Hygm94BQnejMQBL
         F4Yk+IP5U4I+2sLg4XoYz6/PmBnvqRymr+rF//tCUKuaGSQ0PqGBv6XejQajfeyRZqfZ
         EHTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330312; x=1783935112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        b=VFLnTz4dVC2M5TymxlJPNaIHW4u5gQpKvuzuM459dwyz2X8QcvoFhE0UT4vO10ZeGw
         gaRJlJtgLAb18AzRV2xn6hnut58fXNI/8lpFny+qwHZzUWz3OeRrsJzhs3+NYYlEyNVn
         i0106X7Fm0UqrgxqBz8GulA9Zr+73voWNwo3gu0sIQeW/vCe1rjIiJvGElb8sEnVC+Je
         t1XX0cPTqZ1r2y3FveYPMFXBKV0IgmZ7+Yx2EhkPy0pp70en8SRi8tXKYLtEtRp+3crJ
         xI5iSkYBxbvD1Qnp1dVVAodR9gnXSacekmOVA13aiLv4n0/UcBIwhx0oeUdd5SfeIMTc
         FLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330312; x=1783935112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        b=ewqDmnnGezjPrd2uePosFh//xn6xtxU/l7NwgVOMT3HfdVQcyqKLmPMTvEgtjeIyMz
         vlmi26ariujFcNBfHoXcLl62uA8U0Uv0B+zUs+fSUMvQj2iD5bLTxu3nvsiVh19yF9VT
         3HYmq3jgApes6Hw03/rofz0hU0ls06DI2r88KAqJt6OET16P9Y0M5lRZ1n9P95DnQcyK
         cEoypmhyR5O/h0jPS0Ito7b0LsriKH3cHqezW6nJX2OIc1ooK9xiN8UTg8at0NQ+KG09
         3tgVMYPUpxAgoLgGXZZNlOB+ExTIpyiq7hrFdWF0+FZD9tnDYrOQSJDP30F0pvTOyq5c
         HAlw==
X-Forwarded-Encrypted: i=1; AHgh+RqJpGDiqzNom0FsY0kImizXBnkaO/fW0hc4mpu9Vwg1oWGAe6s87AhZozJhbCTG0n34fcpRHvi/k7ZBPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTu0DBULDxyhQ8PeINST1G+mKToGAp+i6M3Vmp03cBQ8UwYw8k
	AGrJ2GorT8d4i67rfbdE+4ZiOLTshxTXYzWmAhe5UIBp/G7+uBXXaPBi1R3Fd8joq8BxDnnP3L1
	l/2qfz85xiHtZ/doSLV4nwA4S8oqQSYY=
X-Gm-Gg: AfdE7cl9ee2lkWN582InsLsdMNeltZmTr4k0axQgEDKXuYaNvyoCuKP2cBWwLi2K056
	d4jpX9+68Hkd2jvHXVs8r8vZS/zEPaTYwK0o69LzCv8D7WAdxljxRgzIT2bS2C7H+W+FYpbwA2v
	6rdanxT0V8Ujxp8RclLumg7yiTlJL3sE6B0F0S3S1dtiAoQz4UIDt+f4VEsKZOspapyPVqQ1jbm
	UuNcz3+NlN0EwOLl25RR6sGLkTSYfh1egO1Uk/RGjOreMuGxIeAP/49rQXad+xcEI+yHgmV4lhR
	0IlyNGdQXoKPHI8O0Fe+kZ9RjeejHV7hAd1RPA==
X-Received: by 2002:a17:90b:3b87:b0:36b:77b9:5c8c with SMTP id
 98e67ed59e1d1-38293b99461mr9146796a91.17.1783330309463; Mon, 06 Jul 2026
 02:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-14-phucduc.bui@gmail.com>
 <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
In-Reply-To: <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:31:36 +0700
X-Gm-Features: AVVi8CcjV27A_4YHtL-aIf5btTq-bmQ7yClBnFPWKFVrjKx_yBqikhyITmOlrqQ
Message-ID: <CAABR9nEx4MCgBJNm-+jYLmAZJLPL-PoOXDwW_yUubHpdZQSJrw@mail.gmail.com>
Subject: Re: [PATCH 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime
 scope helpers
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

>
> Should change all the error returns to directly return IRQ_NONE.
> It looks like a bug that it checks rv but returns ret.
>
> The reason for ret was so it could use common exit code to
> pm_runtime_put() and mutex_unlock() for the error and success cases.
> But this isn't needed now.
>
> The local ret variable can be deleted.
>

I sent a v2 a few days ago.
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Could you please take a look and review it as well?
If there are any remaining issues, I'll address them and send a v3.

Best regards,
Phuc
