Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC35D8F0
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077222; cv=none; b=bm7p7Zq4rZ/u5K9jKEwfySSlE+nIm5kyn2PkMsDip/h072nR7WsDtFx41fXZwNwjhn1CMUII1M6Uk1rANaiDJegSKqbHziwAbWv1aa3fMBIHVfHzoKld4HCA/6L53nJbEmp3VInmz+oeOm26Q1Fj8SU73I6Ximvf41qizQQwqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077222; c=relaxed/simple;
	bh=ENelbjUMYtttZc5KEREkEeLihVes7V7c0B9aT3qfjr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPLM7MPKqHn3+E47Gk2gLzBpYD/r1+200HIRkh/Ba65zrJ4q6t6ElLE7C5sTBnwJJHshPqKbeYBJLKwuoQQxvR5WGl7BLFSWZmuDDXwG+lMlLD0DmgrSf4qGMkkMGHfBQysn7asoWGvXbtubr34fmvj7Af4VI412VRNwHoi0uuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3gWnIVn; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3gWnIVn"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd8807aaso3165961e87.3
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077219; x=1722682019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqpaDDYEK1izIaPS4VXNn8Yq6EehHgLMYxtkn12m9Mo=;
        b=K3gWnIVnagakBsm7LShMtFTmyQfQl83s35R41aCPQTzO1KQBcwDr8iZSkZ1X+RQEwE
         +u9xjg6vifvbUDku9Q0r4k0z7zG/nP1MKQkRqLtP/7Hj8y8diQcgzb6318pM5px+j6oG
         iIfc4G0gsCgFZo0apWEyxbZRUiAZasoYbj6fo6ebP3LaLkLjDJbPlsJspVZ2RVks2Lvk
         yqmT4JDy4QyJluzAF7W6kcQGTBHJuCN2JUNrGp5rcH/k3GbIPJ1jkXRKGxzJ2kpAcwAT
         w4lG9FF81hy3F55doGAYkzRX7Wmj6sHx9zft5LyPY9h/8NLU7FrEEnCLspFIs+qbig6E
         qg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077219; x=1722682019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqpaDDYEK1izIaPS4VXNn8Yq6EehHgLMYxtkn12m9Mo=;
        b=euo7Zifp1uj0CMxVf84tSM61M9rXILMcmMnPZ44qEbIBX0d52eGqUNlitUKECv3r/Y
         HTWLTDYDoVk65g3aKVjRddXz9YK4RvC2h7/dTW6Axg6Dt8N99TRIGN7E+0/nxHiaSvdo
         YuMkd77qd/yOftnRdFduDLnmegFLUWy0bDkYvNQOph3V4pISHZncCsmUlLgyfTknpUMl
         v+S9F5xqdeeQhDAdoNL69AeNw8e2L7vfxhMrFmDP/myrEvjHfwDXTQZss4JBD0KGEejv
         EDJQqsvkasu4eFTMReMd0YGeCZQZLvEE7H336tLveeN3UEl+kTJKVVMZlTGjClX0IZzW
         uWIg==
X-Forwarded-Encrypted: i=1; AJvYcCXVEWnkxFQK2bVxSupfBFu4T7dWDHN2ZemdgIVPgaJQX+w5NYOlN70/X/XbWpHYbA8mMMmF4Ew9hzWYdIde97T/Hz3SoS+DmSqm1j4=
X-Gm-Message-State: AOJu0YzcUOMwr5A8o9ACYw9YBjC3qo1BZvdwRMqdxJq9K5Tllq/LTZ62
	KlwzMrSkDVqHLY2mph4nXA9LIA0AaTP8M02MgouI3rMPPj6D0qRln6xmeKV//cE=
X-Google-Smtp-Source: AGHT+IEAA8Vyu/jvBki3y6WhpcWjn+fJcdPYHZX+yGcEKRmJlDSK/lXOf+6qfu7//+lx2sfqwCIwxQ==
X-Received: by 2002:a05:6512:3da2:b0:52f:368:5018 with SMTP id 2adb3069b0e04-5309b2d38cdmr1397881e87.43.1722077218856;
        Sat, 27 Jul 2024 03:46:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc402esm737671e87.51.2024.07.27.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:58 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: codecs: wsa884x: Use designator array
 initializers for Soundwire ports
Message-ID: <3gd2qwpsty4owjzlborg5hkiqltpkk4gfzuj2zvxamjgjwvrlk@2x2zhokcfbv4>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-3-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-3-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:45PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa884x_port_ids, e.g.
> WSA884X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
