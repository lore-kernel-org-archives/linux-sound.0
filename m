Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494515E8B;
	Mon, 30 Dec 2024 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735573646; cv=none; b=Dr1zfcI5S4wW0drhgBlPSwwpcKHeC0E8D7C+ptXxCXluUzCRbpSR1fDoNjRqyEW4AiZeKujhjQURIAEXTc7Ojb4wWmDxtqqXmTi0CyuvFCXpkYLiH9UQP/YkVEz/ljMi8qfZn4CO32jgV8xUVuq67LDc/qVUgdYd2PvZNhv955I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735573646; c=relaxed/simple;
	bh=BznJGo8aP7NWW/T3EwhidORaeIXClk9hbnbxkyBHpCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKGb+RGssyzyX5lTeBQObm8D6r7UaO0on/v+gKpScECnY/vMd252nz1e4Or8h+Hyl2xbehT2lngt29AYwu/kP52gFUK+yZhv2IVolaUDtSVXwmxU1y3HSMqbM9feFcknnsjMbH6SXFVowjdJzpGSwE/7BiAzL1/p3dd7nuoIdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlTaLeJj; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlTaLeJj"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46677ef6910so98283761cf.2;
        Mon, 30 Dec 2024 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735573644; x=1736178444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDTrfWuUrgmfAfoyOwM9ejLYiIld7JwB7zG1mMjTkuE=;
        b=XlTaLeJj3o5eUImRsb/+LjRJSBOsFCc/xbzvaf8tqzM0KzKuG176x9k87pP1a86Ub3
         AOBCdsBVqhUtrb1fmgGpokGKCnapqt5zPSD0QbAiMuZADfWbiraEBAxLZqHzRd0c86zb
         zuS6BsUO6PjBtiHfIV7KeJk0fD4i3VBj5wDpIm041VzaYKGT3CG2MC2Pk67mVzRFwwa3
         qy/BMTVrpsqImmRU9fTZUMuXQxhcDPzMrNir17z0892sUQ9ymtxWMKl9RGujjB7FOJJC
         pPONT27HmSRg7XBEh/EJ2IEz4VoSVsBKRIMqgfVzR1sTKq6C+rn3POG6v4Ha+zIPjVJC
         aUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735573644; x=1736178444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDTrfWuUrgmfAfoyOwM9ejLYiIld7JwB7zG1mMjTkuE=;
        b=lUu4OHG64l30SpTC3kHy/gxELVvmE5GlgTnp/WFJxwkFQqsIMsHMUa90M51SjNK1dJ
         XJDSzumEVWnZavG4S1R3RoBCSdZWmORI0fWGiKiCfvoM8TVfKuWRsxs9+RuNxtdVq94q
         4iq/v+BXo45xOw2/ZjTHAb0Jl57hePwKXCT0OgF9lkrl0C/YWMWrpn1wdBxQSP3LbiHs
         NmeAOjC2xIIhyqbAgvN4bD1yp/f03tFGXRANA1DV70JH9ZANDZdO7OyUUO7K/4raS8MS
         sJ7d9O67UkaBrZSlaH8kMNwm4DlBQl/SOpVTuHLkZe7BxfrbIz90m+kHrinu3OwzmaK4
         EMzA==
X-Forwarded-Encrypted: i=1; AJvYcCWo4kp7c+ccA8UB1Cs/kyjamxSodud5tFQQkIp5zrOQAM4tkWSSG+pD9nWDA0BfWtc/PD30aKkXOKD0cpc=@vger.kernel.org, AJvYcCWrIfY5Ku91UVDFX1jBsZIga2gzO1FT/JUEORBaNrpCJjsQsEa9hpxbPvhiZv/eAkvYujtrojYCViI3+jU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQps2M9d11sJBOHU51ELhFSGY3Nlp2GxIWqcCxVc1Wj9Y2n3Ah
	+NRagv0ALFmpJC/pap5dWzI7jndT51XwUO19cPSQ6ZyutZN99vWfyOo1gMZg
X-Gm-Gg: ASbGncuGhhnOCY3rWSdItBIaQE4WzyLCKcUHL/I5S1leEwqjDuGCbKr88hH5FStaSzs
	Vli7V1A/JgGkUtTy4aprj6wgHRqm7+6b2rizzff0np0B5p3iVTwLP1X7l/KvA7Qk9a6nppFmSFg
	npbXOcVcBJeckraPJ2mW/X9wSXq1nzl04S6HzVcA1OK3wu2hetCCh2GCgou0ww8/9Nz3/JCsrth
	c4DlaQL2TvVFzY6lPK3TKUXp4rJIEqXgnfcMzoC0SCB4MXclNRvUTqQFEl0mA9R2hda+yG6tMis
	w2+6kBDk
X-Google-Smtp-Source: AGHT+IELzW4HId9MZwd45UZjNAMeGVns3mM4PX3quHxWzwf6v/YIJHCT6oqe3dDP82ESu89JSvSDzQ==
X-Received: by 2002:a05:6a21:789b:b0:1e1:a75e:690b with SMTP id adf61e73a8af0-1e5e0815b11mr56319469637.44.1735573633937;
        Mon, 30 Dec 2024 07:47:13 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c2bfsm19962261b3a.188.2024.12.30.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 07:47:13 -0800 (PST)
Date: Mon, 30 Dec 2024 23:47:09 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: tiwai@suse.de, tiwai@suse.com, perex@perex.cz, arnd@arndb.de,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ryan_richards@creativelabs.com, wychay@ctl.creative.com,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2] ALSA: ctxfi: Simplify dao_clear_{left,right}_input()
 functions
Message-ID: <Z3LAfa0cIY2eboNR@visitorckw-System-Product-Name>
References: <20241230153243.2874102-1-ethan@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230153243.2874102-1-ethan@ethancedwards.com>

Hi Ethan,

Thank you for your patch. However, there are a few issues:

On Mon, Dec 30, 2024 at 03:32:58PM +0000, Ethan Carter Edwards wrote:
> There was a lote of code duplication in the dao_clear_left_input() and
> dao_clear_right_input() functions. A new function, dao_clear_input(),
> was created and now the left and right functions call it instead of
> repeating themselves.
> 
> Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com/
>
Please move the Link: tag to the SoB area without an empty line.

> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Co-developed-by: David Laight <david.laight.linux@gmail.com>

The Co-developed-by: tag should be immediately followed by the
co-author's Signed-off-by: tag. Additionally, the last Signed-off-by:
tag must always belong to the patch submitter.

See: https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Regards,
Kuan-Wei
