Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82D31F942F
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340852; cv=none; b=PM2TbHNul4Pkx1v1OZ7FC3y26ff/yJNFwImjY57bnPsgYS5ESqEd6GFYCRizYR7uYSz8i5U6GEKQcimex9+gj5MMPFi3Hwfs+aQJGjyC8fWNtqonM7BY2IQywx7hCHoYkob35bB18SW5p9IUrUThhWOhvovMpdndzayWQVDBcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340852; c=relaxed/simple;
	bh=Bdt0Ek+8uNvC9w4e4LSz2+aFt2JoeAnu4IpKWfLXKkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXOERWD97u7RjAAGrwmdHu7XoQWVe9hP+2BQbkO/FLz8gKWmCyRT20wBzgwkZu3S2QpAk7vvj5ddUXbddKMsSIo9biT8Zjp264P8gUKLho5Ya6sEtU94rYIv6SXD4TdNLXnUbxwuPm4Uujz9hSr+sNfpP6yMi27Icc4k2Y9UWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9NrwTST; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9NrwTST"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso120966685e9.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jan 2025 04:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736340849; x=1736945649; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJ/s9DyS+GEqF9zqnIGYDx8ihdm7eFKYQPvmgM1uC28=;
        b=k9NrwTSTD1YQoqnW/qYmnUPD9E2T1iC0UNVDK2ddtFggvgleAvHZxzY0lgOIo/pqvl
         TPDqADY2Wz3ygb9lilxRzt+Mk3rmJwglXrQmD+tx7uV2OFZs8G7USoSNzyfPh8dO5fv9
         4M+pqYopWE23DzzHR86TcTAuI+YCyWB2nRK2fODn8qR3KujW1QcDoM2+3HKw63xTyAQv
         46MYizXOwQsOcvS8MtZnpoAQl/QCjJtd/bVA1BQXp7wtx4xGB/rNh/yMGuzOv/3RMOMO
         4qLDjH21An54bAKqjAs8/LjOcrWm5KrqBMFH8zp3ksil4VkNYIQWfoXyDoAcuWpHQq12
         BUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340849; x=1736945649;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ/s9DyS+GEqF9zqnIGYDx8ihdm7eFKYQPvmgM1uC28=;
        b=saiXOi8hAjYgnX48S3LeKLcWSv19GGykfEhU1IXMSWvfGLJQwG2h5ZwcVNJz/sWG3t
         zUnjWZ2osUkt0Bwg2pMNauzYGAnjv0KKRHjPqRv2/NNBTsFAUnQwaLb+IhjUC5ctxBe7
         8udaxW+raB1/D81AhtUlwq2MuEWA8mrTaMVbhiX/ULG/yd5B0Rx06LcRabqmKZ4PriHc
         CfZxLe9cs/01PpXGWWaph/bGeTOZTtMfUxLG+gLP+zXzehzv26bY1oXKUWMAXxS0uDW5
         u5tNUedfLAtvWU9deLLyQihouY/msXqoPcPB8yW8QP7r04BMSBXjOwu8EbQwhelszHs+
         t33Q==
X-Gm-Message-State: AOJu0Yz2IWeXfM6NV6v9e40x4QOVtaUBTd4rQDh/RlTdBoTBUFLSqSZd
	YiA/Tegia8c53yw9p5OV6KO/+3eR2wcxKid/MfxYhNN4aLVXrR5p2hWsZ+MSaisLIDDxANdf+eA
	z
X-Gm-Gg: ASbGncubP3RSrUq0iFqCOoP45Fgf8acH8C6U19425uPxpchvcp77IoZgcxLeRsvWi3f
	oXl6xxU7G8W65UkAXIYKztFj+9WQrNlJuZfOWNUtZoIPCK3C3pkBV0Oh96GmF4UtWRSe9nVq8ys
	kKBi35MiMQQ84x1Ss//0CClbxOeqU3uZc3fbcQdXiwzNx6irG2zDQAZuE36MnfCItxdvqOk580R
	Wr8iSE6WKyB/42jGWmNQab08bEWZ4K9/I/j1OVMaewOfEsqw498xi5p0QVhMw==
X-Google-Smtp-Source: AGHT+IFg6wXxEdnzO2Zv9AUr9gtSJlu5Oev8/rPhVAuL8z4krpc8ks5m1KgWUlEo9M4X84xkx7Qdag==
X-Received: by 2002:a05:600c:450d:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-436e26a9510mr23772205e9.17.1736340849040;
        Wed, 08 Jan 2025 04:54:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e219sm53572841f8f.84.2025.01.08.04.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:54:08 -0800 (PST)
Date: Wed, 8 Jan 2025 15:54:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: fsl_asrc_m2m: Add memory to memory function
Message-ID: <35e52534-8ea8-4826-a355-c18db459acc8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Shengjiu Wang,

Commit 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory
function") from Dec 12, 2024 (linux-next), leads to the following
Smatch static checker warning:

	include/sound/pcm.h:1514 pcm_format_to_bits()
	error: undefined (user controlled) shift '1 << pcm_format'

sound/soc/fsl/fsl_asrc_m2m.c
   347  static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
   348                                          struct snd_compr_params *params)
   349  {
   350          struct fsl_asrc *asrc = stream->private_data;
   351          struct snd_compr_runtime *runtime = stream->runtime;
   352          struct fsl_asrc_pair *pair = runtime->private_data;
   353          struct fsl_asrc_m2m_cap cap;
   354          int ret, i;
   355  
   356          ret = asrc->m2m_get_cap(&cap);
   357          if (ret)
   358                  return -EINVAL;
   359  
   360          if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.format) & cap.fmt_in)
                                                                 ^^^^^^^^^^^^^^^^^^^^
This comes from the user via snd_compr_set_params().  Syzbot will
eventually discover this undefined behavior and generate a stack trace
etc.  Normally we would add a check for invalid codec.format values in
snd_compress_check_input().

   361                  pair->sample_format[IN] = (__force snd_pcm_format_t)params->codec.format;
   362          else
   363                  return -EINVAL;
   364  
   365          if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.pcm_format) & cap.fmt_out)
   366                  pair->sample_format[OUT] = (__force snd_pcm_format_t)params->codec.pcm_format;
   367          else
   368                  return -EINVAL;
   369  

regards,
dan carpenter
