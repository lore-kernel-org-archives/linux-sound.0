Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28D356765
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783391366; cv=pass; b=t1Jn+7xw9uIPy2BrQlGlSvSBS3zFPdzdVcR14f6lgfr0NOX6ND/tyDkLe1eTL4R49eTHt1nFGUr39I+I6iSuHhomTUQwEucGQelSWk7eL/0rY01eB/OeywSoy61UXrhVTnpJ7fVmSIxZtMkNn7G8a6DytKAQ1CLd9bqa5hp4I4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783391366; c=relaxed/simple;
	bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFGf3h9VAhqYzK1+YsYkcguwSsPXTp+2OmrsbZIRqffxJMhKNNmW4+uC0q+7Wl46JDBoxscj4xyovpT81LhZJIOrJVIdcHz0Sm0+kGz4dhLRy3Kxe+cw4qLqDcHNWRinkGFoDAsvsbtEnImge8b/zk+ALvv5sBwE/Rue3C0Gx5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlB/CB+L; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlB/CB+L"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc891373e0so18201775ad.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 19:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783391361; cv=none;
        d=google.com; s=arc-20260327;
        b=Lq2priYjI589GmTi1mVL+l9585XA4lPGOzwOQhg/DiJ/a9NOgikJ0wVz2qbIK2v7Ez
         QsqqvUg3hDWXG6hoLQm+pdNn8Kjp+s1MkY8LbZhqY//jUnDW1Qnv/IIaRBETOHk+6nYU
         5eC6V6u3+3c0nMPQpZwNGl4ueOjjt9NymvLLeGe3xZCfnCo76yhUgcxANI3r1IR/k6HQ
         U2ncz3Y9ueSuqUxyxmZ9IPI0isjIXUj4r8cOF4hXT21oagdTn/ehOaqnEXWpa4VnO/Ad
         MHgiQd65XIDS7PwICs37baBq3c4/F06hj9KhR38fQ4bGmN4B4xclsILLyakkiTbiyVXK
         TAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        fh=1G6AkqWrWZgYmGxWTk442PttCLCqxJEeSw+O59RkxIs=;
        b=UIn0nzLWgQGtkXxyV019AzGP2OlFzMiSk6NunuA8P7dPHMpITJeBgJrInK4lcD5sLF
         uM96XHzPoaBTZAgKaUKmMb93+T7JD5faCrNd2l28sXOIiqrU/fpVFGUpfYzSfZdCEYs1
         jHzyp+Dhbi7+JRI65/qO0gbDRsWfFUADere/jB7WrKJT7RTdhKFt8mi2dlJHARmbRrMP
         +Qnsl0eelyOPKoz5X+x9Td1LKfIPd2RCcYrrWW0WXdJT9tdJfevRh/MMlctljD7kLNQ3
         qNLya0A1Y/8zg7YzGgYLCtl5zsb1N3HX4XBG8Kxk61j+L2ay5MFVDRNQnKLBZk//2RFl
         WDDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783391361; x=1783996161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        b=BlB/CB+L8iKAoyIwZtOPRu0+1TKtbdEJ6XLQHuv94gprp8ysVgnRCIm63Duu3aXBbj
         E6AHq4+zcz5Rz3YfqbRzs9iWhAmjMkA8zj3dJu/NyMYUUBlVtyW5vReNM5/tYOumZ4cz
         O+q8WghKQCvIiTcsd9AjM7ebVXDjyxZxsNuPx6EbXawhoUA5v3daYvWRS0hUvZRYDDbB
         Qlv+pDZGd9M6HJzdkFwWRt6iiK7j30uGcOLdx9GIafZr9MVvnKI7tz6JWFCx9Vfz3XM+
         ONyXgL4gbptOaRaV86HcND3ExyaEI7MrNZwUbCFDLoCETOOwk4y4SfeuZuzgCdhK4mgT
         N0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783391361; x=1783996161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        b=O3iXKgyU3JyLSpPsa9lfRo8SsJkqSZ0rJrSlWFBSAFvWEXWxnDthcc+FqON85zEJy/
         BhsNSn2K7+uWNFPFi1YwVK1NopR1G4DpG6aMZoStk5SZPDP/q6iwHS10p65m7RdsBdPI
         wL9+dhCwaNTGWnNXLaOUS6PVHTf9R/xlGDGSBnf4aDP05OpVfZFl5X0lMp2ccW2kazEF
         9fbC5j04vjoNpPWe7KjQU/e5+U30euigRf044YYk/2ZEc2FowHWheAQBh8VO11SXEShd
         81y7XbjNcqx/Q/ZQw4+2cbaWcERtLKgABVLJCpB9Uyq78YInq2CySASwuj0quiHrKoDh
         HOCw==
X-Forwarded-Encrypted: i=1; AHgh+RqfWxu55bmt5Y8wGFutEMxMnSTgVv45Kik+B8B2mufqrR3Bf63pJSrPgPutQEVlfWrzXERdXzko+8ZYvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtm4hoWcDkFtx48ORrFGx3ljgoW9HOU9DGl4+uChhLF18et2x
	J3+Z/+As8ltgVHb40vtbQjtWrs+++gVfDZ2j0S5UCs72mSONXohhirHtvQRedF9UeCvwbPoK9Iu
	/4KIydIJ9v5MVfyV0Y527ck5SfFVmrfc=
X-Gm-Gg: AfdE7cnTlE41keVjOXmIFm6Ovo1StWMKHn7TkKX3wpSZUobiR1GjybHgODMEku8uDjj
	IWgV2rU82/3CPwR2w6+m7Uz94pHHL+D7Ka9607vu8TJ7fXHNJka0xry6F92pvloZGEOMgilXOy2
	u7MUzbeOh5girhdfIiWMjGmQ5dQwec7/n2oA6n7t3y9qYfoYe0lyfDpJdfEbzAlvC8tbNQadnv5
	1o8Jj2NOlxJhQYzKA1ObC/8pH7dk9e3WCmiQ8zWTBKX1zr20bFQV7ZCPyBnBK0ZyMXDxVBCNYSS
	RfAzGplxPkfMPUKACODT8nzBEUw=
X-Received: by 2002:a17:903:234d:b0:2c9:e86e:a9f3 with SMTP id
 d9443c01a7336-2ccbe3fc503mr35838785ad.10.1783391361490; Mon, 06 Jul 2026
 19:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-4-phucduc.bui@gmail.com> <akumgOIMYes2CXS3@opensource.cirrus.com>
In-Reply-To: <akumgOIMYes2CXS3@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 09:29:10 +0700
X-Gm-Features: AVVi8CfGeOLkdRsN-huCp4z6pOuTIEw2V-qPsop-BpnMow1W_rEArqC8_fPlfDM
Message-ID: <CAABR9nGwZHMrMer2e0zL78DQ7Kt=O2CWcQUKmht6ZEkUQej3Eg@mail.gmail.com>
Subject: Re: [PATCH v2 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
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

Thank you for your review !

> Minor nit, this leaves a double blank line here.
>
> Otherwise looks good to me:
>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

I will fix that minor issue and add your Reviewed-by tag in v3.

Best regards,
Phuc
