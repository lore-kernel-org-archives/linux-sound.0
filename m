Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079DFA31
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377546; cv=none; b=PPQBcA1VqgrErbrGXKKRsOtDEic//vZXX+3W5uZbfw2Ch0nBG4b9d2t1bW8PIhe/gySZvxp4VPtt0TJVYUNprHq5nZuo8uuIytH+qFgH2JlgylKa6jxUpMYt2783kYLorSR+jmKGDuqDzqqT61nzZPpSyRg96GlqRQ0B3kdoYUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377546; c=relaxed/simple;
	bh=UH7Guk0ZViEtNHLe2Rm6vPoD2ZtesweQWurg2zPQG0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3hgJVd6kO8BQSIvA07ypu4EQacUmoW7tSJPWR18dccdrbqLUasNlWDUKMmyUuMPAeQmzmohhwxd85FgLLixe9gRuLnbu9C/56kpDCexMxsk0sdEDpbxGKpwwyJ7tBco6OkeoTm19/bVTx25x+Njkx4qrVHx1JZLFhyt7Hu4sKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgZalXMG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgZalXMG"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso3421190e87.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 21:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377543; x=1719982343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHtEVEj8JBWiO4kzFiIiv1rmTa0ntU60eMALIMv5KOs=;
        b=BgZalXMGqmsF1ttSDo91MGRGTVeRXbdmHms+95r7kn8GCK7E0/uVLqhvvTNcdv03z4
         1c54dx4oUmsOf/CHofFgHJkQGjtEcij8dMNWHyQb9TYE11y9WClbH5XnjjLl3nmt7T/P
         CsfYxJ+yvQCAq8JUeanEP8fXmMOQGuXOAo+Mviivd5X1eRQ1w5m8e5/tXTBWw2E08Uzy
         wRDGa1K/aLQzkT6PK0nvEli/2YwM98zdQq6dQTaYrnzHoiiD0mknsndoUtWN0afnx00c
         fCoG1r8CXWIGtOtyZAVYo4YFUvP0qQVq26hmfO45BOOo3HOLH5pGPVxdDeJX1PALY2Ef
         0Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377543; x=1719982343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHtEVEj8JBWiO4kzFiIiv1rmTa0ntU60eMALIMv5KOs=;
        b=w8XYrR1t3uqa6SO9BjS3Ylcl3UKVhLcwyVmZJIW4cWL+zsLW43MQ7VvTcT4/T2IvfM
         ETl6jgKlbRaCjEgfdRPw8/OvEKy5TaoIw2fCAOZYrXvNxondLUI8yrZ26hgrNxS5AZM6
         jFh/xOVXGGfa81O6jIlKR8sRPs14PmAU8G1g1uaA7zvymB0r2bbkYUmeS0wutIqM/tH0
         asMe6RgrIc5/c/ya4RiFnjaPj8FOwpjrXAwpKRoIDYjSi9ZJMDCUQV1mHxxqnJB1T/+x
         FGFDgVKQdWeDy+SkruoyefJQcqjBDACll7kys+wMwVa86J+SzvqyGTwOZ9oCY5KNzI/N
         Dlcw==
X-Forwarded-Encrypted: i=1; AJvYcCX7WxaSBBTb2VRxiYtZayJJosSjnX4To6aVVarJ0TpXSFsrwaHNyKh1hPydzoReBRtjO/Hku1YJwKjhgjUw8r+UEbvzGvESbPm/geU=
X-Gm-Message-State: AOJu0YxGgciiH+uDCKFRy/Tf1tJKid5W+fljNoRIgD56UzAY7Ti3vbFb
	bO6j817/uXIF/D+fdWBs1n+CJrfslp1sBldSZIrVYwbkA35+uEp+k1AnQ/DIk6A=
X-Google-Smtp-Source: AGHT+IG2adZQtvwyPskuS7BzV1Hv7koYS1cTyuzBuEl/nHq624PyB5bLw8U2WyHXv+Od7Ngz+ahDJg==
X-Received: by 2002:ac2:5e79:0:b0:52c:8909:bd35 with SMTP id 2adb3069b0e04-52ce182bc95mr6906334e87.10.1719377543219;
        Tue, 25 Jun 2024 21:52:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cf3361cc7sm324288e87.65.2024.06.25.21.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:52:22 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-macro: Use enum for handling
 codec version
Message-ID: <fyuovswhhso2ishvullvj473xnstqcpc2czqiqy5lfaafy2cix@kfifmubk7gy3>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
 <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>

On Tue, Jun 25, 2024 at 06:57:36PM GMT, Krzysztof Kozlowski wrote:
> Replace 'int' with proper 'enum lpass_codec_version' in every place
> which handles the parsed codec version (not raw register values!) to be
> explicit about contents of the variable.  This makes code easier to read
> and compilers could check missing switch cases.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.c | 8 ++++----
>  sound/soc/codecs/lpass-macro-common.h | 4 ++--
>  sound/soc/codecs/lpass-rx-macro.c     | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
