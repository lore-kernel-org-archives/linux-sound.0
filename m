Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcdP3N1K"
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3219E9;
	Tue, 12 Dec 2023 06:33:05 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d076ebf79cso32844625ad.1;
        Tue, 12 Dec 2023 06:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702391585; x=1702996385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgtrwCld4CcJzZn2fDspIh0QCBOkWG+UpKY4fFhtYqs=;
        b=gcdP3N1KA2cWjtkugsIpxjNAxWqO1m2dUA1lOxkZKvC7p+69DfmMUfD9OfwcMlDyvu
         odrYpYOKPg9fKSg7JApk9j2kbQVDj7jJQpc5ui7UE1OoWeh+V4j0eeDrfwtpf904yCp4
         nYIkXbXyh9LokEEfJ3Ob/XMTu6tQ0JMQs6sq3gP+9/iE0qfVaWHiVSO8c2cOS7Z15J6R
         8qSBtRNaGQaZ5PL4DzyZpnbabEHD8wvzrOYJZJkMZFTkJGJJKjNC9fmcTn4UEAiaj0CK
         gFQabyFqmm1jwp1gRjv5sIle+hvDs4YRz1IS5e6qwZfKlmdknFom+4Hf7q3oeGRf0h3J
         VtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391585; x=1702996385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgtrwCld4CcJzZn2fDspIh0QCBOkWG+UpKY4fFhtYqs=;
        b=pXNjkCLdahd9klLOec+J2uG45IBPjDGI+yu2IDOzd9y9D1TbT9uhmtTkmIzR0m6aTu
         jRPtgQ9ZTx8GENZavTQpQr+BDn5TyMSZN51ZDiE80UsDoXFTtIBFzvZALGkg/K/T2I/a
         WO7hh/z3EI9kXvO2uohZMYh+mIs1ae4E2rJ+YxM11ooh9/9+DNdZzeWiuQEaAfXP3yoU
         mVwu2JZJDegSBhbkGUO2Zck6gNAIFNKywU1Amk2aLSEQwqNHeS7m+ej5/E8sTSRTvpDZ
         q8COoZQMxmrBy+L/Q00LvWxuTjwQpdlInemK18KhGbZV9Rw6vYHM60rrzCR0YUNVhUU3
         zb7g==
X-Gm-Message-State: AOJu0Yx5HX2RZyB/LvW0NXQ84nLa4R91EBZin/q9dw2Wc5z+6VZ3LIim
	sAxJRxlaoUwBNXeQNxYv8aGN+R/astyC+w==
X-Google-Smtp-Source: AGHT+IEIsWEtcl3wL28xc8lcH4vTgfH7wPqcFpwscBr1whjZyLhbBmOtDQfzVbXOl/StNV2Ux+dZZg==
X-Received: by 2002:a17:902:bc4c:b0:1d0:6ffd:cec3 with SMTP id t12-20020a170902bc4c00b001d06ffdcec3mr3345275plz.124.1702391584856;
        Tue, 12 Dec 2023 06:33:04 -0800 (PST)
Received: from Gentoo ([2409:8a6a:5426:70b1:a6fc:77ff:fe50:e63d])
        by smtp.gmail.com with ESMTPSA id w23-20020a170902a71700b001d0c418174fsm2902272plq.117.2023.12.12.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:33:04 -0800 (PST)
Date: Tue, 12 Dec 2023 22:32:56 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
Message-ID: <ZXhvGEN28L5EqMx-@Gentoo>
References: <20231212095850.26482-1-lujianhua000@gmail.com>
 <c43c4303-ed59-49e7-940a-62df6ad1b575@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c43c4303-ed59-49e7-940a-62df6ad1b575@linaro.org>

On Tue, Dec 12, 2023 at 11:47:36AM +0000, Srinivas Kandagatla wrote:
> > +int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
> > +			   struct snd_pcm_hw_params *params)
> > +{
> 
> TBH, this should not be part of sdw.c file, its intended for more of 
> soundwire specific helpers, pl consider moving this to common.c for now.
> Because, Not all old qcom platforms have soundwire controllers.

Acked.
> 
> > +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);
> 
> slot mask is always set to 2 channels in this case, should you not check 
> the number of channels to determine the correct one?
> 
> 
> These magic number 0, 0x3, 8 seems to make the code unreadable, can you 
> do something like this:
> snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, 
> ARRAY_SIZE(tdm_slot_offset), slot_width);

Acked.
> 
> > +		}
> > +	}
> Finally  ./sound/soc/qcom/sdm845.c does have exactly same code, can you 
> consider removing this and make use of this new helper in that file too.

Acked.

Thanks for your reveiw very much, I will do it in patch v3.
