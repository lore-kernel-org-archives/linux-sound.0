Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F31348C75
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 22:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288048; cv=pass; b=mULINsauwfexE9qbj7/o4UYeZAArejXyASXJynMs+eqvdtkhBkwE2IXIklhuf+/UbPSBlJUZHvGal/SLrANwIn7RR05k32ShinPFCm8dgaC5T+ZnYkd+WwTFUmzx0ttszWXiEKHoA7U0VFPl9hggESqGZZ2p6mX+UwXQ3r8fsuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288048; c=relaxed/simple;
	bh=Y6k/VDdVR7T5GQtdNCr0LEwRZJBjUJRB8yrHYl+hVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sb8T3ARq0Z9HjHt0xox+Piz9Rdtb2R7lzR/YZMNBY31K37AoQezmxiocjrJEWjI8s/Rg+LH+ivvTk0dk6sbGP70Hnp8kAZ1VFcW+wALJzC8J7uFPVgBjJB0NY/IwC9XLhef2KJldTtMkcuX9HaWDHIFTtD+cLmub6FkMn0S4w1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jcMdewhO; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jcMdewhO"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so85747e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 15:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790288046; cv=none;
        d=google.com; s=arc-20260327;
        b=is48cVIqOgd7BEm+Iw+3OjQSwTRcVgbzVstysoKnlpGYSTjMh1tFLqX0ULfcmwJ4cu
         5KkMNG6t3S2EScuReintMOS+EFNwNG69FkmnGRBM2B8sZsYkuc0xSwd8kZrTM9kSU5na
         g/Ij25i54xIGeqojVR6FkTzLeoTzz6+e5fK2vCJKdfInllmZGMdHq0jt54wbfKk5rLUT
         NgHWm95Qubnpz+k2Xgx4SpemzYSO2blYDO5FRIOzUcE/4tvVoCdv5I3zztHHEMTG78dV
         jwsc/2vEZisUL9OKh/Mqo7Q1m8PdO+sqf34TPDMPPUlyhNMJiBpuo/lRJC1M1bGheI5S
         4AGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        fh=UYSgP60hF1hxYgc5YgYGJj5FW6sK/IjYaPbNQgTaxpQ=;
        b=oD8bQgVE1OlGhBSlCFs2PW9kYLm3aAsOEpwYtJXfhhnQZiYuQ5gZ0l9hjZ8QR/7P96
         KmZHVYeGiB6EBailvmnPCeXhU+Pw5d60wchDjpxj7l8QhDZ1+fHAw5JXalZSNlkAkoN/
         X+snu1B/A9SsaZFJqZ4RpZaI0S5Md69w2K4hCX3/qPOvKnTGHrR0ZyhV/errV6WnhxDN
         r4cHudWujku+ixqCtOCxqri4KZPM+dhoWcCBXiMrnlX91/kjv5KKGVXR9q2mFjR58R+k
         PwEaI4H2U/4RTZsagIVOL+WH+RbE/ZKUdCuqxlztoOtuThOlMZ1fvW78PP1NftEXdq6/
         iRLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790288046; x=1790892846; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        b=jcMdewhO0LuCU11N9vOKUuiG2uuR1U8epwSilRscOvpeLdoo87Cl/tl4jMZvs/uoKl
         DAxxNKoAx6Wr2oBBk6qaT4HbeKDj5dma9b8QK/q9lozofh9a4ZhtfS8GeAXD4MXoe5p4
         aMKlCkQ/kAlbyNOtHnbfe4MJgnMhmFSlEz/RhwFA7+xWAPPTDm1sqSOFD/XsqjUrwNRz
         PPwh1fAccMUnGfZF934EOSi8YUBuiXwPlI83HPP6RvANcXTCL7dOqPh8JiePVNjuY1bA
         BzbEQ2CgKmaC/fKWgjWtfi1kvkSfJP83pPdwmzR5t/4T/ZS6aMv/OJy5b6Gyi+E2NqDV
         uUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288046; x=1790892846;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        b=Fm7VdTAWX/Ro+/GgoDu3Z6Go5NFGoflk09yeVldQo9sPWwHPbPMzb0MpznW0Xa6hIK
         GwLP2AwhsIo8caPIs61Zg5AgctsbrwHmclO9QGwKeIJ24kIcrlrkYv2HLPXP+R1Y8NFz
         zA2kO7Z7QN2rJBzMx2LqdRZqeynXqPiSiWu81WwLJWGWBSfzCXThvV+Rr5jkeydMJqj+
         4oLE8B+1PU0dAyF6Zb0mP+6lT+2UYnSFScZf9lf7l9KfF4//PhS2NUDZGR8GfAiQ6rHe
         DVyn9KK3St1mOm7FfhsNf99zlR/8tXhjFEKWrFaAZGfym+CY6varrMlk4Bkq1RPB98HO
         H/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzqtRUQi7oYiJdQMw1qGaKHxVnVLOZ1x4aA8ZQut3qODeo03umjKjafxdwoM7AWZav7fD2VkB3m4TRIBg==@vger.kernel.org
X-Gm-Message-State: AFuF++mF1wuO+U2wBYZmzgkw6wqrbEm8EDN7viTf1i8Dlg6+zY6NH1i7
	l9c+XelwtWMSRbg3Rd/bV8eQdfpBiC/YFxALHZmF/D5feMyvKG9aUCGeHxRHa4cu5vju3bFYVyH
	ayQprwVa8LCxRuPqtXCEpyAXp/DtNJU1bGBtQbtqYyktwnmsgthJpsaCP++R1
X-Gm-Gg: AYBFou0jQo3blJUa0+kv2KxCHT8Qe7NfAHt7ZY9N1GXWiYcYPbf46m+jmApZcHxCUq2
	RVq7KZcQFP/F+a98XymvhjWD8XqhSKT5L8I5L6cpu5buJ8PA/jPSBLnrlX19v8ihTFOPm91z3gS
	mqhXciFZT70isQKJKuScZ0pp+MasMwPqSz2q1lY8H1nfPTpGZNpygpcsP0px8MgRt4ZCMLCoMge
	hE6ArwwrSmqLue+HruykXzocfVxmlC3BtDS0HGyrEPGHEEQ6CX1Q/5WMhEEQjsQidWQahJDjAvI
	vTo1TMcHN+IfIM+HLBhU5D1Ah7JaL1JsUkoTUgGNsQzvLBwAlcilW5CvJ49Gjjn0qkE=
X-Received: by 2002:a05:6122:3295:b0:5c9:c60e:3a43 with SMTP id
 71dfb90a1353d-5cb0c04d686mr2341350e0c.21.1790288046416; Thu, 24 Sep 2026
 15:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924125940.22665-1-lnicoara@thinkoid.org> <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
 <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com> <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
In-Reply-To: <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
From: Liviu Nicoara <lnicoara@thinkoid.org>
Date: Thu, 24 Sep 2026 18:13:54 -0400
X-Gm-Features: AclHuK9Ny-J_xRX3edCHYS4smybOTebjsGXoFfMTc6mVJ9Lh1EVgnmD8m1H0i3E
Message-ID: <CAAhq3a51vkfsmjsLSyVBydzLrCAEW0mUjXMAPqzGLViwVCS+Dw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> in this case, while its playing with the wrong volume, use /dev/mem to
> directly read the value of the volume register and then write the same
> value, if that fixes the volume from 69 to 81, then this patch might be
> necessary, otherwise its papering over the issue like I wrote

Done, on the unpatched driver (v7.2.6, stock lpass-wsa-macro, booted
with iomem=relaxed so /dev/mem can reach the macro at 0x6b00000):

I played back a tone that I changed from 81 to 69 mid-play and the
volume went down audibly. It read back 0xf1 through /dev/mem. Then:

1. With the macro runtime-suspended, I changed WSA_RX0 Digital Volume
   from 69 to 81.
2. I started playback: it played at the 69 level, quieter.
3. While it was playing, a /dev/mem read of 0x6b00414 returned 0xfd
   (81).
4. I wrote 0xfd back to 0x6b00414 through /dev/mem: the volume went up
   to 81 at once.

So the hardware register already held the new value, and rewriting it
with the path running, without regmap involved, is what made it take
effect.
