Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1CA42E8CB
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341438; cv=pass; b=TWRcghR9vRNecym3Ox3y6JKNs3k8JPRDDyD/9yiDH4FZxygmo02isPbHLqRsqQ1AHvIUWEJiSXkUFlICTNxgUkr4aALwQFJ00jbLsjfpa8ygfESUsTaaMDL1Vd8Cu6UAD8CSDHlL2YcfcsISpcgxEHa1l2QSAV6WnWbNwl0bZYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341438; c=relaxed/simple;
	bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6iwzYuvrQVOwd+keVnHhZ31kkifmuJmz4s6XS+0lQBbDxbsPHgjxH429nPX7b/jXto1n2tyfFLTc4smQQw/tWvRGPc3I7DRE1AF2LexSoURFSue9D53LRx4a6kCK0wOJ9ofB5XDlSqdsJU30IVVWXWCw+T3lT2Id1mn7WAW7KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyiI6M1J; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyiI6M1J"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace7da66eso27506985ad.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783341434; cv=none;
        d=google.com; s=arc-20260327;
        b=FHoMAID2BDAfjRYo44ftGZvptC7gTjIiX+/ttvx0Ft0ZYhqOIiy8SPQqV6E6IRH+Fd
         XM/HKzjg+YNrVN1OdUnOR0bS2+UXqS0KAcUu77Bzlax1hhUvMowM1Nwe/2+C/JTe4c5R
         lCF1ROxQTW6wdxzeFGlMhoMQyUZU8dTjZQIigJCaZXQUFjqK4b7ZnSWPwb+pTtL7aIOu
         Gqbtnlnoxt77K/HNHHfv6q2PxCd3MfzEqyle2V7VUj83qPcKkCxRAIGcXs+8uf1qnmtK
         lcYdGeuoNFqjUjlxuva8l9OGTmx19v0Y+gzRAkbhhOlbFddSHPJgmYdz1zT7dNaD9H45
         Jlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        fh=j8YcsJ/z2Gytc974IpikadzEA1MtEe2KEbYbw0KX9ls=;
        b=XF7CYNL3DUvIqyWZ3eo2Ch90QewfZLeacoObJZnRygki7AgXG9SfrCf20VtSj0qONR
         oEM5jBrKZaJzVEj0gxOdJYKzB2iXtDoFdyIF+IS+ELLFnmQZEtWamso3PU1dlrEUN4Ir
         R5cJEdlU6LVigqZM6HMqUuU1Yx1QXomL6vcTEvJ+6tp/G67ZMMqQpxyyWtGF0TwF/2sU
         xfFON9BrPNofxsgL5pVRP844dT4kee/VgBzgvZJaY53UP5NuviDw0qrHraIwpeMHvLum
         bGLoCszUVKJVtjTdoNZA+TqoT73XXRDD6rUMu6m7lHVCSxIMK/N74NnXm2bflUnNbu5m
         9Kjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783341434; x=1783946234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        b=QyiI6M1JNbidSRRcF+Ar3mbBBuLSPCsYno+NbYvG2SWBQPpWnnhNrhqg1YXuhzuvxz
         D7HuzqBaW7UY3uiM0RABiHYX0JrQ21QkijYc0393Tq/xwFvErYMG6MV7Z6RggYBZCM9e
         8J31dfWJeHvzRotPejZjah8LgABkvCfswuUUR+F0f4tvGoNVj/nVZf57Q6a0kXr1AiN/
         ujIQjsL82YLQrKqPsZWFLEV7oz+tzKSyrwUo1kgtMmSU01AXbmPAz/gk2MCihi8dJVHw
         H2hVhSUbJkQT/2kFAxbCgxgS7B55y7Xvhdymb1uR4cljFs0Z6yABEXuOm94hRQSMZXjG
         1J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341434; x=1783946234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        b=b6lNeKRdNQkHX0u2GUAeVLcoOSjQ84O5iD2Uj4csC3v2+O7bw/ttPL6lHls6vaDZ0m
         K3oV34BL8e15PHFf0VMzQeZx2pIOmcW4j0aYpN8Y1MPhcAcItyJdoHWQvlCXB8DuzWWv
         Zf8IhbSlL0nrPlLZ8/x0EGg0kDXbBgTNE+WnHrsiORv7jZHN5EQUAv3swpMpL/JYpIk0
         ksAKHq1TNl6zxUX3pMEIWDKsj8pl4WVJloNeEHP8Qn8QBSq34aCmNCchwFbMjCmkbjXR
         +us24qvDWhIkq7xAQ+phCFses9jpolM5dFcU/uykGPiiydZaQtXNcXPz8z+9uuMzX0xK
         oUdQ==
X-Forwarded-Encrypted: i=1; AHgh+RotSNV2HWbhi4+d9TNlqQmBm9vFhYUNKSI8QW45J+UQsHulazF+Noi0chMgKBp7JXIhJYlw/PUxooTx0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgOrU3VQOiu6AbeLIsinbkUygsRRWk/XHOmkpi9kzqQhbshFWp
	F0SjevoEHPMaKol9OOd6k/PNQJusV493KieTPkBLXWW7Ody4FFkbcmUx701eiCcHF3exsLK28hf
	F8SakrRmiT/yWMapdoK/foyxCcZgEsmo=
X-Gm-Gg: AfdE7cmHC5k+qaoH5Sg1C17QP3xh+8HcbqI0xPVclx31DD3AasX2F4yfVPOpKB4NIbW
	1FR9JAaOMQ9IB3joybpwmYZoGFudmI/8Aokxyr5nfi8cYGLVhV5z5Ph1MTFH9ay2NoSL3ob6zb+
	Ru76FCYjwK5X0rtlOOKga/FZhf84j+D0cgAPE3APis6g1D2iBSRcgmNRMwVrDPTdgbGjSMBPkyV
	Bq6xOeIs7Axarx1UK7IdP2LffWVoNktmfuZ2CNxoDaO4QgHlpXklukVBaNsbIS6TcBpAMKGcJMN
	egKpUkt8aRe+P0eUVmW9B6JJx2M/3BaRFwlMqO6HICGnO6e2129FLHnfJYZd
X-Received: by 2002:a17:903:947:b0:2c9:b8e5:5741 with SMTP id
 d9443c01a7336-2ccbf07b545mr2322555ad.35.1783341434357; Mon, 06 Jul 2026
 05:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com> <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
 <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com> <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
In-Reply-To: <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 19:37:03 +0700
X-Gm-Features: AVVi8CekunH_Av_DBeV6qAHzPUl7QVZFKXN1EOeDHNYBqX9OGye6fLchJawVKpY
Message-ID: <CAABR9nE8WN=HnYo0JYhQ-uOtW5SZ8fN-x3xG90dzMzYDrue8zw@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

>
> I mean the code is correct but it looks wrong. Because it tests for
> an error in rv but then returns a value in ret.
>
> This can be cleaned up now. ret isn't needed because it can return
> IRQ_NONE in all these places.
>

Got it, thanks for clarifying.

Best regards,
Phuc
