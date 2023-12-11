Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUfgxD50"
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108C2FD;
	Mon, 11 Dec 2023 05:40:19 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cebcf8a48aso3351739b3a.3;
        Mon, 11 Dec 2023 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702302018; x=1702906818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inka48OAdcaVBLEbG6N8fA5G+Zz4KQZYKI7zI+nD6dE=;
        b=KUfgxD50ARUKrWZGYGTPDz2WU6gZuFp9rCS4TjecB9L4lk/Xjecp/43XkkZFkjkk+L
         7kDrfUXvuInBj/ljVLO3gEj8AibI6lzppR4gVLPFg7jkjDu6q3IZB+COvDalhwPYCC2w
         vefJnkokQ0IcQWwXM0ZMfoJwehUvvLiZs3ISS3IbpBEIfgHbg4s1qx/rwMA46f+w1NAy
         Pvmj3eLB/e2ORqohE8um1sHBNE+aRSC0swKNrFbmuMtXNGBr28OiZqU6uOaea5zuw/Xe
         MsdXyGI8Clk+YAa+itrR/cYWqSBfIJr/A+sfGqEoZIvaarZrEsUewXYjzksj0jmHRztG
         F2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702302018; x=1702906818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inka48OAdcaVBLEbG6N8fA5G+Zz4KQZYKI7zI+nD6dE=;
        b=GK1xXjR4pXIt1XvBhs7EV7w+iK+Fc146gafxe5Cn1MV7r42ozonq7Iq5k+BP7e5FOg
         c4mG5OmSYjff9xFnHdBL9zqp8pD7QHtyVqUpIv/bIaQACr+IvUQp4vGhJjcqNoKxiAH1
         JOqJ+Ek6jif9TqjbwWH0bXQQNJYJjEydWgoDSyrhCZaElnGaFkW/zLWRSoKIcYWpL/ju
         XVimqFHkYlxojmXh3dkGlcbY8IDdH3fr0ZffwClaUu4QKLUb0QUbYSaTnjeSLQfSw3mp
         QyGqqaKlQWWW6hWhc24UrArjAVjc0abcsEnM2+oYaCMgxi1d32NpIbMWaCsdN3/C1z3k
         ZkFA==
X-Gm-Message-State: AOJu0YyZP9mndrX8EVPwTaOuB/PwLGeQOMTs8Da7ZhsCcqYoysQ5F8ug
	BI04PbGOosdCUDJICDwDqsw=
X-Google-Smtp-Source: AGHT+IG7sPY4ZkHUESIL4EePiYoVswp6ZB+4ipr0qdjWdf1SE25hvrqy1SROE6Upfr4B3DwnutZv9w==
X-Received: by 2002:a05:6a20:8423:b0:190:93e:f224 with SMTP id c35-20020a056a20842300b00190093ef224mr6328208pzd.76.1702302018197;
        Mon, 11 Dec 2023 05:40:18 -0800 (PST)
Received: from Gentoo ([2409:8a6a:5426:70b1:a6fc:77ff:fe50:e63d])
        by smtp.gmail.com with ESMTPSA id n19-20020aa78a53000000b006ce61c9495bsm6517068pfa.10.2023.12.11.05.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 05:40:17 -0800 (PST)
Date: Mon, 11 Dec 2023 21:40:09 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC, PATCH 1/2] ASoC: qcom: sdw: Add TDM support
Message-ID: <ZXcROf5dIpKbBMhP@Gentoo>
References: <20231211095357.4629-1-lujianhua000@gmail.com>
 <01cbe664-f344-45ee-a049-1c27b78ac9a7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01cbe664-f344-45ee-a049-1c27b78ac9a7@sirena.org.uk>

On Mon, Dec 11, 2023 at 01:20:25PM +0000, Mark Brown wrote:
> On Mon, Dec 11, 2023 at 05:53:56PM +0800, Jianhua Lu wrote:
> 
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_snd_tdm_hw_params);
> > +
> 
> Why is this exported?

Thanks for spotting it, I will drop it in patch v2.
> 
> > @@ -125,6 +186,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
> >  				*psruntime = sruntime;
> >  		}
> >  		break;
> > +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> > +		qcom_snd_tdm_hw_params(substream, params);
> > +		break;
> >  	}
> 
> The only caller is in the same file.


