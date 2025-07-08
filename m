Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A4223DF5
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752018117; cv=none; b=hXkP9qnqBIE+kUSUSZqkqezQHSkw+CVQIblKXNHNto7X468nm0rY9/o9XSnHmJU8eSAQtuoEgKtFbSoIr9r3WNFeXoeXJOwPI3sFhaOwLlk3E89kb0Uvww/2itbnsltsicPgx8OcOv/v/RWd8U4KShYyaldloSzXkguR4FMkRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752018117; c=relaxed/simple;
	bh=biAh7YN+xzYMmSaFXFQ+8BzRtXYh8G5ulekC8t3wa/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP92cBR36FDku5oqRvUJMEBSZU9atKLdRaCTR8PrYtTrg6U3xT6YY9kc+nfE0aULakZPisZWjP3SHI+vRy42MMrsPg9xiLENDPMvYmu899ETBsrWI3w7I1ofP38FIzN3QB0vXFHgsYSK03cB4v1QfhTSrcWHx6jCv/REeFzZDIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgkfpO51; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgkfpO51"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748fe69a7baso4188589b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Jul 2025 16:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752018115; x=1752622915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W58VYEKJFJB+H6EpW49MKnlu3DhsTuDYe8TnlMbu0qs=;
        b=EgkfpO51SPJZEcben8jR60WRNlCmcPQpZFqM7b+qot7v2EyJMwcHhKu7kM7LdgAGKk
         uu6lZkuXh0Q96MkRxVWsHyJH9wwm1fEmBIIPwt0JJHitKM1vHngoj7Kk+zhuOh79tPpm
         V2sjFE5MG0ICWPC3bg0Wvk8EQaaqK+ZTgF8iJqTjg7WE8DXgP6DixZnoq3/dQjUTJ9dz
         R20bdT1UfJc3bkxOy8l+uZWg09XELLkpakGnUB2IH66nlnkFKJoiPJpXodoKGFxvEV5L
         rux8nSl2Lhb4JR/qGvouftL4SlTy4piJNt76KZajD3IyCylJuVNUkWWSBQ68ITziNjl4
         S5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752018115; x=1752622915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W58VYEKJFJB+H6EpW49MKnlu3DhsTuDYe8TnlMbu0qs=;
        b=ImEn8WHmla7RdYa+0nva+DpLa8dygThaIkRePGtnkkuUgy0Ol9bmUU1IsUFt+OeGKh
         xzqb7kfZ8q/Xrmr1YXbha0TKvTxccIVZSD2CJOfAQN4XyRBAKmJGDCgi2rI08vujgCsK
         oc3u4125Km64ZGdv3b7QLrHsJyzg5D7JqJ9AQizJ4DLLngV3JH34WeVvpVQkAii2wElk
         Palbt8wH0YFWVgpa4qBYjhY/auHDINmAghowKceTerBm8ojir991QhR8TobDaKZTHmRE
         kiFP+fTp0QcZPCdCBYG+frwxCaZhSXVqlDpOWTIIIkWnivpchs1l7iy68zLbWiITvf1t
         ceYA==
X-Gm-Message-State: AOJu0YzL93JxHSGXLhOgk53n6aEqeKFPxMPOFffbBEyixRwzQ4xeS9wO
	WdyCX7VHv1v6ycR9OvGOKTyuk/eVkCmTJyHpOG/NdbvI5+XTZyKtHpxzzMtqS6xr
X-Gm-Gg: ASbGncsGnYSypB1XzVrxevmhOWUczyDWCbNP36PcYctLCJ4Ll1EAlO464vjDTdP2vKj
	wrhpaCB75ykDdi5UmElifNlyusErmRlHQp5AMGrNobygbTZLQJ5VCegRBiSPU6JkqgLbwBSFJer
	n/fMKlzAZS4zHofBu6FWeVdcCRTN6k7i3Vq/TCfN9h78mlFNRC5qL7hvBH2jV5/3ujWbpKoqAMl
	+caYziDGXSOKgLAdSHikdd7/Bgp/bQsOWxnWzY2BI3ZjH09EHlRfQFTboo5MG3By20X+PgMzRN4
	hKMIxPNe+itKTkAHjhNi16NR7hOMRgyBP8CG4Z8uHfWlv6q3a0ztBuHfLdkRkInQ3FGq
X-Google-Smtp-Source: AGHT+IGrdDd1hat1epEGBKMoRnVMFFemaVaDeW3eM+dV3e6uy7w3zI8Vecg+yeYnbNazzSu23VySNg==
X-Received: by 2002:a05:6a00:2e26:b0:742:b3a6:db09 with SMTP id d2e1a72fcca58-74ea66d303amr670952b3a.16.1752018115199;
        Tue, 08 Jul 2025 16:41:55 -0700 (PDT)
Received: from gmail.com ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429b358sm12551232b3a.124.2025.07.08.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 16:41:54 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:41:49 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org,
	amadeuszx.slawinski@linux.intel.com, cezary.rojewski@intel.com
Cc: linux-sound@vger.kernel.org
Subject: Re: [BUG] No Sound on Samsung GBP 5 on Linux 6.16
Message-ID: <aG2svfnHTt4edrZ2@gmail.com>
References: <aFdMjm-GEVT_SIYr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFdMjm-GEVT_SIYr@gmail.com>

On Sun, Jun 22, 2025 at 09:21:39AM +0900, Ryan Chung wrote:
> Hi all,
> 
> My Samsung Galaxy Book Pro 5 fails to output any sound even though it
> recognizes the hardware. Below are the details:
> - linux ver: 6.16.0-rc2
> -  lspci -nnk | grep -A3 -i audio
> 00:1f.3 Multimedia audio controller [0401]: Intel Corporation Lunar Lake-M HD Audio Controller [8086:a828] (rev 10)
>         DeviceName: Onboard - Sound
>         Subsystem: Samsung Electronics Co Ltd Device [144d:c1da]
>         Kernel driver in use: sof-audio-pci-intel-lnl
>         Kernel modules: snd_hda_intel, snd_sof_pci_intel_lnl
> 00:1f.4 SMBus [0c05]: Intel Corporation Lunar Lake-M SMbus Controller [8086:a822] (rev 10)
>         DeviceName: Onboard - Other
> -  cat /proc/asound/cards
>  0 [sofhdadsp      ]: sof-hda-dsp - sof-hda-dsp
>                       SAMSUNGELECTRONICSCO.LTD.-960QHA-P12ALY-NT960QHA_KD72G
> 
> I am able to see and manipulate the sound settings through
> 'pavucontrol'. But the hardware outputs no sound. 
> 
> Thanks,
> Ryan
>  
>  
