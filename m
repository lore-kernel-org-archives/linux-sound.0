Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F517BA3
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850080; cv=none; b=DFSMfwRGRZPQt3LHEo+Fu9dGP7TjMlKHhIbg0k0ckgtPeIqjORM7q2KBhS1X4HDivd8meX+UMQ5eqWxkaUNtM3LpIoWh2Zp8NPY+WHbyXLf/XPYWs2/Pdo2hXR2UuAzTllbcY2j/bY/VgWn6SxcR01P99Vp4OxxJnTaYmSCst3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850080; c=relaxed/simple;
	bh=kuzFX98wTqHyIM6Md0qFeqInACYTi/NmX3TpxMtOrN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lM1zPhXduevu1UDMbC8g8r/LdA6v83s59zY+2YFLlDrY2y5B8D+EemSlFtpB6uuRErqo3RC+y+1UCKmm5+bZjJlhsF+SIj3lF1mQU2DulFaU9PZ9CGQ6QudlaAmZwH9OAW7YAVeaEwwvjbYu3Q1JByOSi57c7omDMmILvaHKW/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/zTDQ56; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/zTDQ56"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso10478115e9.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850077; x=1756454877; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFYASJujKPo/3b3arYohcDtwJDfxcNkqXsmJ0JdHC2M=;
        b=a/zTDQ56T7YXktyFMzGsvsxP+jgKnmwMLWP8Ggof0B63pXc2wcvh/Vy9cEu/AwQZhm
         HV/8KESeywklvrIzCH31VFGSawnBUEs/+pRNHz7tHbR0c9oyOZTEtmGxazrhTpqidWXU
         +aaW1b64AK0X1h5YeNMPA5LA+4i16ROXoW3j1cjD+otota9i75hapbMP+aUGz67zC+fS
         5cKJNptoKS1MAuaAEnQ9raNCnZIHosCrsgYs/JGtp1vJkHXUOwuGEX1F/3v5Tgn30jPa
         FYSi3YIPqmvuI7U50Wx1ltlIMiK2/zMrufgm41NaAtnPUR6tkm+VR0G1nHl5rOGtQ9W+
         hkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850077; x=1756454877;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFYASJujKPo/3b3arYohcDtwJDfxcNkqXsmJ0JdHC2M=;
        b=CqNoT0oGniTBvsQuR1fmJ8OH8B7SNHSlr0IMl4lfV42bZPOXCzgn9PhXI7Dh9i41Ol
         hx5vW9Hpq7eJeh1CjFvKnSO189Ap3yhuxYizdBITzulMoNNb+Xu8mlk583OrCydBp91G
         EzrKtUOriy3ZZ0b5p9eDmjVZSqXZFmMpaZl4C7FP0SDxZOjUNJcMbermPXMw3wJt7vUM
         PMOmzhy/Np9BQRlOE5Eimj0IVqiXfet9w3ki7on6PtLScXTbbeN2flENgdQTYs18Ltvb
         c8osql7z9vcEjjHV4iMMc4X9JAGcSPXYz0VM493ggZO43FMYTf90rXNxqlCOnEM4pYq9
         /2LQ==
X-Gm-Message-State: AOJu0YzlBRGGHDqvLjzDWbNomy1whPiOXKTn1Xt+sjb1085vWhyqHA0X
	OTT7pOYYdKhyOwbm+0+m1+Erq131dN9OtoKJXqNWK9utEk+KZZ7ggsOsimnc4Gy/9bcmZKtgM+0
	HPDok
X-Gm-Gg: ASbGncvSdnkCo5ymWLaOkg58wUCNceqp8xiHnFqoaRNMPiGcsxLa8k4M6ldY+tBJR8/
	oMtMWcu8E1qsOHi4xX5RFhOf8jyX8w97xb9PELSYqJglRvG2++d0miPovqXp7iDa+zpzizFG0Hh
	iaEBYxosxXqmPBWqv6tqVG7douhZBrh0RY4TJ3uKMQKodqXGk0Wqrv6zTTjlMNAnOLmSJPyIDG7
	lA+XlU7Z3rZBOZvDiMypUKy8gk/ji7sLszS6yZRVawWoVItQV452vDAk6EVCyBpPy5pSdYfTXw5
	h5Y9VEKwA4Eq25/1IbtseuG8W8Hr7wBGBRm0KvjPCVp1QVPHtSCLqRynd+o5oG6AvaIpfEQb5vu
	NALt8A36AIlyuG6PMJywBRqrVikg=
X-Google-Smtp-Source: AGHT+IE+3r2s+ZGxIPNmh3U8DjXNh1rces51OUuhDzoPOj42q9Fg++wqGRTw51UrHgRMVrRwpbl77g==
X-Received: by 2002:a05:600c:4ed0:b0:459:dfde:3323 with SMTP id 5b1f17b1804b1-45b517cfb81mr12632325e9.27.1755850076621;
        Fri, 22 Aug 2025 01:07:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dc4c55sm27406875e9.4.2025.08.22.01.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 01:07:56 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:07:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: qcom: audioreach: add support for static
 calibration
Message-ID: <aKglWJPzKWWXwp_b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Srinivas Kandagatla,

Commit c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static
calibration") from Aug 19, 2025 (linux-next), leads to the following
Smatch static checker warning:

	sound/soc/qcom/qdsp6/topology.c:613 audioreach_widget_load_module_common()
	error: potential NULL/IS_ERR bug 'mod'

sound/soc/qcom/qdsp6/topology.c
    591 static int audioreach_widget_load_module_common(struct snd_soc_component *component,
    592                                                 int index, struct snd_soc_dapm_widget *w,
    593                                                 struct snd_soc_tplg_dapm_widget *tplg_w)
    594 {
    595         struct q6apm *apm = dev_get_drvdata(component->dev);
    596         struct audioreach_container *cont;
    597         struct audioreach_sub_graph *sg;
    598         struct audioreach_module *mod;
    599         struct snd_soc_dobj *dobj;
    600 
    601         sg = audioreach_parse_sg_tokens(apm, &tplg_w->priv);
    602         if (IS_ERR(sg))
    603                 return PTR_ERR(sg);
    604 
    605         cont = audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
    606         if (IS_ERR(cont))
    607                 return PTR_ERR(cont);
    608 
    609         mod = audioreach_parse_common_tokens(apm, cont, &tplg_w->priv, w);
    610         if (IS_ERR(mod))
    611                 return PTR_ERR(mod);

The audioreach_parse_common_tokens() can return either error pointers or
NULL.

    612 
--> 613         mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
                ^^^^^^^^^
Only checked for error pointers, and it could still be NULL

    614 
    615         dobj = &w->dobj;
    616         dobj->private = mod;
    617 
    618         return 0;
    619 }

regards,
dan carpenter
