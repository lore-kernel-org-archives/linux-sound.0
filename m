Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34AD3CE4A2
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649282; cv=none; b=ibe5N6TOVxzgZga+3ihR7U6UcPcH5PrQlRhjwXhtWgR+JDT6k7Ws+mw52jqLKTGAZbOLj8f5PKr/AjRDFo3a66T9jGoc5hZcs0fLjg7KkzX4sfwbzrjg4ueIpR/t386a3TzdJB8JqoOVAQHPdz3+6al+YzZ0qjjEIuBkU/JjbZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649282; c=relaxed/simple;
	bh=ztIheWCEenfSMV+AtYcqS3UltJIMz6ZxwFIk+z5VCbA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=ZtQLT3OcyCkpIxRkJkFYQKYRh+Vp2ZTo7h7bEPH8LPON+l56oyqEooqIYZbTmougCOALGJOSYEAM18UFfGluHnHLccHG+NNnFCXdqMZgsv8UPBvNjh5/VoWgzLmckRqrgbIMTJwQWCyqO857QZvUl8Nhn3zK38TcGax0TFbRWiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVthTsFX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVthTsFX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so19565975e9.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777649279; x=1778254079; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztIheWCEenfSMV+AtYcqS3UltJIMz6ZxwFIk+z5VCbA=;
        b=OVthTsFXq0VlH+qTMhiaQMjpb0CcQSOAgd1O1nPXMt7MnKDPiRgBzRVCrDRR7UJf6I
         KohjaodJW+EHPpl7Y/oHkVtERxtGMMlFhdSBEf8pVAl8ERg6pIkTQzYnL9RoKa97ZtTF
         VhFOwcDHqXsIYxU/BhfqUMtvrqwyJRJYfV2tebnhQEB9xH/DSNDXYdewmfM5eILXTS05
         4NvUWXu+0WvwFJb9wtd2YuIUgUdq7oAyJkZJemq+TzIDhhatLcpaVyNiPHz/Io/635lv
         0RY2wHdpzDvYgK2Rg6OFaOyC+koO88/FrVLL0OsQSuAxgHcrXdNMM0Hk/v0NXhrB1Yqj
         zmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649279; x=1778254079;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztIheWCEenfSMV+AtYcqS3UltJIMz6ZxwFIk+z5VCbA=;
        b=IRy/uh+s2YFvmqlSvuBYWQ4OWRNOCrwJVoq5/2/OGW63mFSY518icHAPZdk37J7RiF
         8sHHQ1sWOmxBAyz52gj9GWzFbSYkle+h+rI/E3O8AkxHbSW/sxcjG/G3ZQJxacQQiteT
         oIBB+LMr6161cgPYEPfndLQwvaDVGvPamKpi8RI5sfN/61QKM5fXjUSaqPWFtR2yr+ZZ
         06TWWsmRX6USipgOCRhsIxCx8OpvuSSCAGo6GVMdgLm5VYve4f7CVMw+GrnoPAHkCD04
         HLSLL7bgUZDOOxkOZKoHigAz5dPiKiVW7FemLLUeaIhd3mjK6Rsn458plKdshsM7ZWKp
         sN9w==
X-Forwarded-Encrypted: i=1; AFNElJ+mqKgeM9UAiU4YGjOZlUSXRsL5Sg93Eu93P1gACZzP4yZ8Z07BOXZhVojKjCs0jXuipfpxS9SgmdXwSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDU+AQtoDeODzAbwnI90lk1MdqWOwI/cJTjsHG2VyhzCWCB7PF
	dp1ngT1xqr0zUwbn7iKFbGFZvXf5TfU0cQLTnvO6A8+9PyrVouCS3/X/5pufQh1uT9lwVG8JBes
	33FSzJQ4=
X-Gm-Gg: AeBDietifxJSWJhONwnrLHS+xMtKBOQW9emr/KmUcVLGRuuoZZBJ3YA+l1bQoNm/nA3
	koJbYBar22GT3WHG5weAEsNwK6lVOF2BIrkBnsV1reLqJeET67gwbhkdNwZ1wyyU0ZjxMlcEHvX
	e/w8xbrlFSy12xly0wLw/Ybc3NKNF6X8T601wNm2DEqlvNT5NbQPpI1NY8Eb3X8zQKlTYvTMcEf
	QOb87a3KDyBFWop+UDxjm5CjZQ3iIVD6K/Enxx7OtQqFRiqwbHb4Wx+FPxxQc1LAd/BojmT4mWH
	h9uJ4AJCZ2+j9DKjBNvadiAOXywGwOtArR5suFDOXihgUBv7t7FOmm0zOXXSOpJnqbzwhfv3Ng5
	ha/V5B9OzkoPeoppdqKTEUTQHI5+d1HJ3/6ae3b1vqABrmMFFwgdPKYeot2AaxWPoLX7sQS9vPl
	x5cS3gk0tkZUDSF/MmTdyB+Npg+UI/iU8bTlXS18XR5SWPb2Ea4sqpK39O94nL8bEr/MjDxKGOD
	/XP0lmykA18pQF4Ip5fEu5WbYaFQLryBHk=
X-Received: by 2002:a05:600c:4e88:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48a844438f5mr111793475e9.9.1777649279314;
        Fri, 01 May 2026 08:27:59 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be902sm151439305e9.6.2026.05.01.08.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 08:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 16:27:57 +0100
Message-Id: <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Subject: Re: ASoC q6asm race condition when stopping and preparing the
 stream
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Richard Acayan" <mailingradian@gmail.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Kees
 Cook" <kees@kernel.org>, "Joris Verhaegen" <verhaegen@google.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <afS7rTHdc9TyIeLx@rdacayan>
In-Reply-To: <afS7rTHdc9TyIeLx@rdacayan>

On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
> Hi,
>
> There seems to be a race condition in q6asm when stopping the stream
> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
> ADSP. If userspace decides to prepare the stream again in
> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
> memory-mapped region appears to still be in use and fails to map again.
>
> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
> need to verify. On sdm670, we are coping downstream by keeping the state
> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.

Do you have a reproducer or specific steps to test/reproduce the issue?


> Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
> We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
> so the driver doesn't request more data transfers.

Thanks,
Alexey
