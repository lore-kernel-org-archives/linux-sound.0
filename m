Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16998406811
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187665; cv=none; b=tYGX9drQoRAwlH/FS+aQddGSIdW1VxAydYnaMyqMPExg+GokmyfddDOlOi4+tssBkT/CdauYEc8WDtyDbnCL4KRkONYDphoevVf0nPUGKECa3rBrxcvV4S2fpWJ2e5vBTnkMc0Bh+g/RdGpDTw7aqqFWxuR6KlTooHU4fNc41M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187665; c=relaxed/simple;
	bh=o5eFVrzDYtgPX9pwYg2juYQARbqB2t2pvyFtWr30cEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG8muGNJqatxOLYboBqVXCwewfnTO/b7a3Sna3LF7LT5haqHbO2zzImf5rpBi+emd2JLKxmOhk4na2F3EJnVJUMK1LvBnRjQfiybo9SmVLR+fJYCKOEuuT2c7Bg0Uoe74XE4cmoxlVBvmqbmmtcIhCkGxKdkCgyNxqNIKfqVR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPkwrD0c; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPkwrD0c"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef5146b56so683025f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781187662; x=1781792462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JBc88Q55uZTKqF/TBcHgXHrPI3dGxcLfIeoBVBrm1e4=;
        b=jPkwrD0ce0f3b1ZQppDYI4NdZKWvAtW3poDzBj7Ho9MZyLbo2NI5loHxXPPhjTzDiE
         JjwF3Xql4jMzbfwMwLHTtxE0y+f7vW5QM0Pf5tNhaB8zUVWRiQW4gpHoEaNVfsH2m3VB
         aM58EmUEbiBU57kvrIqWF7UxzDDAbZG3tl/hl7wv/zW94wzQOLYzrzpz6a2H6imdfONO
         s0MuCiIXHXRCS+t6mWsvJ51/la8BGpEClKpF49i0btz4FdERMOoi+SVoQ+sv8sOOQD1I
         eqzgm7I2ANg1RlOVZjiTfgX+/W09BCqHhdYrMoZsn+VPw2OJdh04Ysy7PTibJ3hicAUI
         lKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187662; x=1781792462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBc88Q55uZTKqF/TBcHgXHrPI3dGxcLfIeoBVBrm1e4=;
        b=qRz6xGvyb+d9/vC2YAJN5UTgWDxHwbnaLDSBGfnGY7FYMgRDV7DS7NHUbB9tKTeuDq
         kp331HvXW03Fy7CQwGqHETwZo9sxXyXc0e2hTH/BGAcrvzpeKX3TPJV1M9l+Dmn9GXjF
         J+Y5YBlhFBfXieP3dsDBunUOVh5zhECSbe9YKGjuPQXL09Ax9eUSjo7jZQA7N3R7oKNI
         FM4yoIRGEVY+/vlmQ0XnWPiqVW0RI6/pfOYRRT+v8lMnSfMKCC7xop5CzoCogMFoIl+5
         509dh87HQMGfrVYCj6GiRniwYBNto1VhkrTTKbCj4NOhyFqPR+sgqRd4VpWZTRbOUCGB
         8mZg==
X-Forwarded-Encrypted: i=1; AFNElJ/1rsu+1YWEW8yJW5zod+uNPK1XymOCj0GVkrvejhFQx6yT9ioitKqAM8ZYhoFgWoBJnK+1BY24m8Qb9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEK4WAbRE993Y4rKsG3r+OHvoqq7dvWNqUg6m0pRVvmsVXXaok
	yrpBBuoOkGOkHhnt7oJVlcC1zcZ1iNY1G9oT2tHr15vg21jY1yGD63s9
X-Gm-Gg: Acq92OGOSsz48ra7OnmiQDLsWT+8F+c3ZZx9bkV7TVshVEBkqnAXI5T9LsllU3fHhaF
	nveuFbjGx4VNJf8P9wUBXMCQXR7w3U8p2LVhsUgM/uJF04ve/eWNgWODgGRqS77x5An7oFZEwgD
	fU0x1FQ3VCE0euJoHIgGTF5KKFeYGOz1i1KPy+DjAq+1pMRivJvt//nMXhYC2yfxO/jyWinIVok
	EipTm3i6dRF5cWq3rHucuXnARqrFq9+cAeEuQplYbNAGFpuqTuqroh9FE3lx71Tc5KOQ1Np6XDL
	RMxgZOpibyvTOk2QhCXrvkS4zxlnFJGxhss8XnVHV3+9aXZTs5oYZwBmxIbsQe7rdR1ssG8C0zU
	yhfypni/7VWKXkw2sYdHO/5MumG4iKU/ixU7eZcdc66O5tF0pVwcoIWHJOX4y/6NMnp8rL0DdGF
	PDHIzBOoGotrxYPrrkU05OPW7iIc+dHtBr4fBXIK35+jY8m856IizEyllzRWnMDe76+qbS+UUs8
	W6J6H29meqiShIVTHzb1NhQADzDFg==
X-Received: by 2002:a05:600c:354b:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-490e528451dmr34116345e9.0.1781187662109;
        Thu, 11 Jun 2026 07:21:02 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2ca21f4sm69251115e9.7.2026.06.11.07.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:21:01 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d0be0934-41f7-4ed2-b955-850e1ba5d938@gmail.com>
Date: Thu, 11 Jun 2026 15:21:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260611132310.137688-1-arnd@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260611132310.137688-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 14:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 

> -	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE
> +	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE !=n
Well, I learned something new about kconfig semantics today. I thought
they would both set SND_SOC_SDW_UTILS to 'y'.

Tested-by: Julian Braha <julianbraha@gmail.com>
