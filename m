Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBED37B03F
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 23:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679597; cv=none; b=p03++t3pmOT51meOP7G9GzblHLANP61LwzhR6fD5MGZniUkyXtHz+MAMW9rYa+ohByHNzd4S2AVWTno7Al9YjqAP9zQp9VdmGY8JhjfJbXIKnXm4EXWxfEFhCFZld/Oj9nm03dOQhURn/v/y1OR/UuVZu/A9C+LBkGpDH2L8BpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679597; c=relaxed/simple;
	bh=sTLTPWbkkR+J79wA5XET+FhSZQxeeBxgYYs31m8y0as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHJIMfe/wiNfQaDU9SzALGYP9TInWiLJdd2dFVy+ah2OCQcOXXIjlUuHmrDwVDhyhF86UP7alr7MfOY04Ca430w5AIg9G3YDuZLrCxB4H3uhYs6eFBm9u/fARGywa6c0tn1+FB06GkqQ2PhcT52VN7rKa+rFpjfIganBtmkEtJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=racDQXss; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="racDQXss"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50faf8ed9c5so12051691cf.2
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 16:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777679595; x=1778284395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auq8XZ/n50n6kobbrJwVjj4F1ZYF7RNuGE7nh7nDocM=;
        b=racDQXssdAUjh1mCnK3JhFd2oA65ibXLnTVq8SB3N2nPXCCcZDc6QultUq+SpZheNv
         LumrafoaaZS7oOimJgqoNpepfjG0tC7WlyCb4rxg8jE2lT0qQAmP/7Gj3TJOwE4RBtU6
         CwlN1Wrf8kgNjRL70W83RR8Xm4mEuKvSWy34mxcnd3K4maHG6871LL+nL5f2Rt2QBQk4
         XbSPciH4fTsbvaiWFu/Yt2X4Kmv/vd5q09xOoDtbqcKMkfd2OVrOaVkHNwDzdlAaYkkh
         0xCx0O1rPYwnfpvX/S2ZHodRETG2ZeJ+XLgGmOWH9bK1Ox9a5NpmfkEm5uNxnaadekIy
         3jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777679595; x=1778284395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auq8XZ/n50n6kobbrJwVjj4F1ZYF7RNuGE7nh7nDocM=;
        b=aWDIDDWXZ0UdB6MLh3jpu7AUbe/+DTv7QRalJn0e29uRpnJBBKCF6QJ/Mha2Mp2RJc
         TAdSMnMkUVHjVbCWHBPMiOTeLGqhFdE5kHYAL1obHiA6G3VvXAT+qGcQord9WvhJN8o0
         mTLTkLzBHAsJTin7kOX0fIWCo4yvDAHZ1pzo/taP+9GQ3n8iFjAJJQmuwUP1zIEPJj7j
         R+Rj9OEI44uwBp05WQpfZcwIaqMXCDpPli+SXlu7KZBVnZOA97gXCGZqQaNxYE8jltCW
         ZO1y66TwL8L8bgxohbq0zSbs2vqv4AYphsR5X+0YEesp2kzqrs/hNjbyGWeR8+6h41Fv
         38iA==
X-Forwarded-Encrypted: i=1; AFNElJ9Q3IqwL5S05UtbxilFnQrXTdMP7cDrrDFM/jo0FZIg0G6WKg/SQ6+koEVQ5XI+7byBOpo/Oa0Xyhphaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLhhlN1OGIkC3yvDr23oxWmCFImdoe6vLMNcIL84w3BLDvWeo
	XqSUij+c1IHxk3Yqs1Imk1e2+SSFcwUY1DSh3l4Ww4CTGK5OFMJNZtra
X-Gm-Gg: AeBDietMeqnxnFpizETbjH428BQhjbVAIviiSNc9QjRm6ryYifwdeAs3GKzZc3aAs+f
	/B21Se6Kzunw0nrAuFF7IPyH/IyvB9qiMKDU0t+v2vkgvVKmA+0n1RF6lbuocYYvjlld9dzmw7u
	h9zNROfBaAhyhjvGTHSAS0XraSbFh9kN2wmWh6kyl3UqmYynYYiNASn1NyN6HPAvC0q02Y8FiCL
	Av+AV9ug4cASFe3lujSgIDjj6sqC2eQoQgNgVJsCH+D6nTIJzpqihzSn2x+pYHQFZeKy5ggtBYd
	LW9ACRuR9loH4BQW9wdqI0JFPdbIIh3DqOOrveDeBSIXGEORieNqgZvOp3dXJKqyrkxmJYZnC0h
	Ocyl8dvGBmBcysPDoQqIyhvDEpvhW+ukBpbvwCWXeSMFwVNzmSmQKnasJMwOCjX8osQqe/GCefE
	wnhediSOjkhTCQa68svRGVtRvGB75HzvtxKGv7
X-Received: by 2002:a05:622a:17c7:b0:50f:b821:9c3f with SMTP id d75a77b69052e-5104c16c480mr21543551cf.60.1777679595414;
        Fri, 01 May 2026 16:53:15 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b8174csm32094481cf.25.2026.05.01.16.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 16:53:14 -0700 (PDT)
Date: Fri, 1 May 2026 19:53:57 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
Message-ID: <afU9FQnWKgRtV6mW@rdacayan>
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>

On Fri, May 01, 2026 at 04:27:57PM +0100, Alexey Klimov wrote:
> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
> > Hi,
> >
> > There seems to be a race condition in q6asm when stopping the stream
> > (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
> > driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
> > ADSP. If userspace decides to prepare the stream again in
> > q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
> > memory-mapped region appears to still be in use and fails to map again.
> >
> > I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
> > qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
> > need to verify. On sdm670, we are coping downstream by keeping the state
> > as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
> 
> Do you have a reproducer or specific steps to test/reproduce the issue?

I don't really have an easy way to reproduce. On a device with a
Qualcomm SoC and q6asm, running postmarketOS with Phosh and without the
workaround, waiting a few hours usually reproduces it.
