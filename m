Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793964918;
	b=c6pTi8e/0fZxAH7XDYduOduXQg98hz0krBYFkZzbt7tqGbnbEse0g05XEC/8McnUG+gS
	 pXukd9dVTu/BR6ir9JsXbzbLHwKLAH0uduk7QL8kwrO9K/4H4WkAtiz3efBWuYJ2ezLzA
	 IYlrEzEcAlDLte+XZxIjhZrI/Rusq/9NZa0RM7KGTwlAgrQVrVowdo4JtMjG8n8nuBZ6g
	 7LtyzmQPHIfSjvdGVta529Yrcc0jRRHBYEjj1thTzq6zOwS79YE6j/yoFuR2N5OViXW+g
	 yUcQS6ZfdJsAimYCOrxzfpQ5Ko0dGGkUJ6/2Ag6byyno5XTNwhiz6Beu3bRxqlm5opg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
	b=ruBceOGhuY1jceK3x4dDFP3peNJybtC+Ef/8jnXdkbMdngGjfaXbi2IO8lqV2W02wOqS
	 qR9CfqLjCyGcSMlL1gvLKePk4+Orjy3dZq0IlDFVS1e17FHZTLBI9DhyLdYDm6YI+o6za
	 KSEuGEi6Wu1gaN/WQrnSodKCkKv1P2gasoFxlzvMgG4K4DMn4GCGxXwC+7hgHUfDhc/mQ
	 vwGtuz9KpB9WbGckc/rN21gNId4Mgb/eOE8DTgkQI2eI2z8lh+wMa1mZ51szk88h5BhM0
	 AB/t8zDtS7UIpjpz3/JqhJ/0GB6u0tEsIWn7Xwx6fhrE7z0+xNvF2+Yz2nMv5KhiN1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZFKxDaR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE938608360D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE938608360D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZFKxDaR
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso218039a12.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793964917; cv=none;
        d=google.com; s=arc-20260327;
        b=SKhRWdOJYMGZIWMDT7aCRuFxxQOaWv+VX+1fmmcTwttlYjtra9iNa2fEOU4RevMxZQ
         1GYhW52ZRRgPxjjhrcijKSyC4+jTT/YfFC3dT9VQ2t6Etr+7Bp8WsW3uFr6ftaRtI2T5
         ZavtLMattalgZVTyt839pWMHce433w31fW0vQh59W9byZA3d5ga2iCS8wvMuISNPJnEs
         Vf1CZ0/DrTJsJWaG9naGYVhLrKBDAMOCjbZfbrXPcKdsaEN2lCqktIjqYtyhoMWRJ3TT
         Nt3fbHX+RtHCMbOY4rnZOyeSfdWTzSJmgqnCBUWomXrWlWIdK2HPAQwWnxE3+f83I7jY
         6hlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
        fh=vdOCpKcfo3qD8MEp2h2MCnpVG/a6HtZr8QHuN8FB4C8=;
        b=YodsZG2czwgjKHIoWZvjo1kdyy3uTj1FZ/nmS3aGnms3HkrSDUEvdTie/YeSxoC8fF
         OZfOsW+2D0UH7wUiVRX6/m9usoYkj4OEtSph8ImeG5F6/qZ10dVU5Qia++fDs48BoYEl
         szWx9+yT9/w0TGJLNipbLPGcW7CJm/iBGKsKvRfE0DKqXT/MANqmXo3nGzO7gUPQiewB
         rb3edTyuoB1D6TNUDv+kIaPE/RNaj/0Hey7aVqyHi3NRwJbA7O5zYflMBtOa3eUT4mAG
         ruHPG4hRaT5+vOVZAZyz2TaWZvVNlaXdauM8+K/wbRRWOIUZbH0PrFWno67ojFcitf1w
         4YXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964917; x=1794569717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
        b=bZFKxDaR70YihA2zMioNe/m84Pyr//3N6YZPUPbw5YTJ/1I02rITNzPmWtFftFm2kM
         9nohl2p1mkvqXo6aG+Cr8WyVpKm123CfDFDiLL+ivWoFx7FegLBSD4hZcrlPWuiJ8NdK
         H46mJvRFk2rTrlpbYK7KiqcIeobj63tQ+GCj16LSAgMK0TwnFDWHsf4o+p15G4aVnCmM
         eLkJUFk5j0IQat6E+RBZ5WHKsiwJZ2XtyIQH52SyrSmw08vX1ag31XU02jAJNLo43yCG
         mTU0KU5CwhQflHv2btnMq8tIqgG0mRK3rN+9CC1a/BN/QwKF4O9UiCJSPggw5heNOQDX
         pCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964917; x=1794569717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
        b=TZilQFWgLlWk0ScMF4tAzqpzZ4QARhx+dPA5jp1xCbXlNgrMKqz54EbAAECFPAyGwZ
         o8RuNk9t6+032nFzHVO94PQoOJuA1Ysh3e8aA6Y7pAA1Lkyzoj+X1WQhobxlSZ5pcbWv
         9wQRjTvs+dIsLmOSWsSIFqULFywKLYTc0zi0RH888WyZvk4s9IMavErLlxoBNfeCx2TO
         7KwI5qvAWWHsKH9+jAtQT6aCHp4MhG8h8dsx4l83IQOsIHK0x8Hfxbg8E8Fur7lpo7+l
         fp2mPzOQMIih09e+SOlZKZt6kjPjRoUcckQwR8JfbaEE5uo3plUDgbPDDAhL3nV0N0u2
         ZkMQ==
X-Forwarded-Encrypted: i=1; AL+hErH1zPtcmIBG6KoSO7b3bckYLEC4ms69HMAJNOqJEb/DUKTjTTKPRjHgFBK1ty0RRvlHFZC88U2AtbwqsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9L8UWSvx9ZhJXA7sRk0Wlql3WYGjtvGJhyLGjeeWVjCZIUrn0a
	Ae0aDpsX8Yue4RkVqfkJEkgS3hzX+qDwGKfkY7Dw0tnUfnP9ZduT7oLMeBzWogVKdG8KDnR8cOP
	Yh+wByl4EdmL4VhZCqqFGXHLlSaTk2P8=
X-Gm-Gg: AYBFou2amUl6ayuRSd1ZeFYOeIZ+eDQMUbYJFSQ+y5elvIPlJUWNEWTxFzzkvZL4t08
	IOn7Hg0QkyOcHQHka3/KCoKUZqzrHt6Sp73ngy1LSUnbRGQmGE28Oc8eDezUnirsc6Z2G4Gy28E
	RYrGPanLuwqvcuqOsbzcC7pp/1cpCb8m8SPquYRmwaHBfPdJE09vSoDhbs73xb7E9SEIVogQbLU
	h7E4wsLP+IhRzHxzz2/lztVxUtOMCG7+Mj9qX4QJERbGnaQn8I6QYQPGveo4Lgt4ZSmUYlGsPSS
	CejEX4rVXvFU4RAYUfyKFodyHFCPmTsF0tqXgeN1yEDAupZqE5WXwoYzyLUQ7geNldx1LdHnvQ+
	iK8/3cHXf7j6q5sZ7pQHJryKXc3GObgocgsNSglrPF/2u8QUKk042zp6illBWGjDB8f5sR25Wqm
	D5tRyinQ7v2wWIa6rau4sDwWdsq6kum9c60ihI8fDrUp6CI2lv
X-Received: by 2002:a17:90b:270e:b0:3ab:188b:c5bc with SMTP id
 98e67ed59e1d1-3b0db6d79f6mr1962737a91.14.1793964917143; Fri, 06 Nov 2026
 03:35:17 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com> <CAA+D8APoQt1uSk9R+O6Xg0zUKc4TaGbB7DJX1QvyZ6wzjDwHYw@mail.gmail.com>
In-Reply-To: <CAA+D8APoQt1uSk9R+O6Xg0zUKc4TaGbB7DJX1QvyZ6wzjDwHYw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 6 Nov 2026 18:35:06 +0700
X-Gm-Features: AclHuK9vZj_WvyDhYxVjJQKavp5g7gEsFZLIBCX-BuGPepr8Uo7-FSCeNAnboFE
Message-ID: <CAABR9nG5bVowBxTXtHZC4S3wnLNwzHMu+8upjOR9Gai+M_Rh+w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the driver
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shengjiu Wang

>
> The series looks good to me.
>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
>

Thanks for reviewing the series!

I'll continue looking into other parts of the FSL audio drivers,
such as ASRC, PDM, and SPDIF, next week.

Best regards,
Phuc
