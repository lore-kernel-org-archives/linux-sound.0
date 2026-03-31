Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F503F7A8B
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973759; cv=none; b=NqYFORSoTqzFloRLxMyJdR128E/Kxh2hE7n57C9VI5EI6NcJ+8P7BwxA4TirBhD6Dff1+qnl/dm3IwATXRFMlLu+UU1qt9mMSNlBxH7Oehu9GxaKBdmRWLkJmChcoCXlLGEFlnJfhnVxRVJzAhAT51U4NzfFzlSc7+46zafTNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973759; c=relaxed/simple;
	bh=pWhATMrXS5+kJCnHa+IordNd5D4ph2EQ4BfxubEUmSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9h1flLrGc75Vqv1MLYZmbsQCAlovR8k7NPKNqE71y651uIhy3yhnesTpk5YuMkklpZK+DoMtaJcv+CBpjubdRp6Y3Uv+E0Xapib912DECQjdI3BJJv7Q21UOUr982v66WGM+akSjO5vx2cpSsL/ilWQo1X+bJ9fw4bF+kAOAmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc3HX7L4; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc3HX7L4"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so4254701c88.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774973757; x=1775578557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZBhlRLYU65z72BBEjtivUZpgR4C0BvXMtceQv6bjFA=;
        b=nc3HX7L4AmLhKdLicjHTgl+7vY+0hlikiNdcxGrLNk3UKSh+1k0gedHNugrBg2DvAy
         bEGZAe8GN4gStP3hzEHL6LVoJfE3K3TH3L8Njd3JyfhE6ic+VaWVHrHGkielB/w1Y6aa
         IwiZBx35oNZeAuI1pazCHrOQQaY5gBzBBneFDDc0TfxTzBPfKtcV0qkAq4LjJt5nYPF3
         7JbDlzmBS/mqAtPrxRRrm3vySqoJB3U2Iauv25caZDJSJ+Xk0KRG5j4+Q5Ae3p4a7VBD
         +jB4sXz3CdGC5BP35w3vgtjAL+kPoUkjL8evlyunilGd6VquoRXh4WbtTcXDsKyzuLu7
         Iifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973757; x=1775578557;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZBhlRLYU65z72BBEjtivUZpgR4C0BvXMtceQv6bjFA=;
        b=gGrDT+9t/1QBseoyQJS1k6aWRqsM9WWv0GXvztnZpuLugzbJFrrQXdqdRuqOPGFrHX
         FVG7uNPWQmlj29lIL33mONAfwKx2hmj+pvPvdleu4bdwAx2m3oOEGAIJEyedvKLaj5gF
         DKKkQDir4GarJkHC4pQZEtDOr4IqzqlxSoO5VM8d19Hfj6MFwCyykfn8iNgr7NT0iwgc
         OEM2ZXjZ+CdScm655ozTb4KpuONJ2fpwOAQX63c1MQYxg3bId3l5O4zBBuUrvqueISnr
         M6zwGodRYT7XMy1YfjlEu4ggbr8o4TWfs7OLcDK9mbOOhyorA7894UwsbwHEVnqOtuH6
         4+lw==
X-Forwarded-Encrypted: i=1; AJvYcCXLlRoXxmkgAz5eHBr4nH0LWGFJ0TDIxfSVyffe7J5R0lKjCjwrrmIdTg3BvZMHXhNCr5i23817lfD6dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx540rNCWIC5iXQvHlEvROT+vcNFbCs2w6KhYCquLskN3zw1wze
	W8ETgHCkPSUakkVQtOFtrO0Qiex8hj02t4HWBpoUAeIQkhfaNKZxc2NG
X-Gm-Gg: ATEYQzzPt21VyxybIJCWn/j5C0PYYKhsZT7Emz+4vxzggy3xBYUftHTxM/sfLfz468h
	9/YtxtgxQzOsgLF9QlSNsD4Qt1CFXYPG6YQgyYcbaVVAnYYo7ZSpPLcLWzpcGuob9anMIopp2Vw
	ZdIaNpyc5K6uq3oOeMMqoGPkzo9sRzhryz724ExOFjnAlDPrjllVs/9pCp3DpSul4bc2BWhqUUk
	m7wstx4UeOLh+xeRIYK7clTKzGIFycgLYHQ76eWHo/cZ2U4ytlYn6LoBys6IEUaKmhO+pzi5bfe
	UEQU+yO7eqatolt44GG7kWFoBdXI42BDUOM87q1HMvTtpISd1UihlAlwT8yHceOUcMrRfvzvhx3
	SJr1+tjN4wlKZD2suetrkyw6C1QcBu2/WN0Q8lcwFxpEozFSxPsoQLu6riOh9tASXYr6+ZfPGBw
	OH5yKZTOdBnJAE0UOzrypnYyWxkgA+1OKk8GgBamUbSuIE8f+3jiZPZRYk2ImVPbF2L2M1sNh9F
	7n6
X-Received: by 2002:a05:7022:e19:b0:12a:68cc:3efb with SMTP id a92af1059eb24-12be643856fmr66976c88.16.1774973756726;
        Tue, 31 Mar 2026 09:15:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab970da7fsm11494127c88.0.2026.03.31.09.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:15:56 -0700 (PDT)
Message-ID: <a5537802-ca5d-417d-9fb4-18e0b0d21467@gmail.com>
Date: Tue, 31 Mar 2026 13:15:51 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: aoa: i2sbus: clear stale prepared state
To: Takashi Iwai <tiwai@suse.de>
Cc: Johannes Berg <johannes@sipsolutions.net>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260330-aoa-i2sbus-clear-stale-active-v1-1-47a6c0a3ac9e@gmail.com>
 <878qb8rs48.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <878qb8rs48.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/31/26 11:27, Takashi Iwai wrote:
> Do we need to clear the active flag here?  It must have been cleared
> by hw_params call.  Or is it the case for errors?

Yes, that assignment was meant for the error / re-prepare case.

For the normal reconfiguration path, hw_params() already clears
pi->active.

My intent there was to avoid carrying over a previously successful
prepared state if prepare() is called again without a preceding
hw_params(), and that new prepare() attempt fails before completion.

That said, I can drop the clear at the beginning of
i2sbus_pcm_prepare() and keep the state reset in hw_params() and
hw_free(), since that is sufficient for the stale-state issue this
patch is addressing.

What you think?

-- 
Thanks,
Cássio

