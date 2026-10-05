Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C947F791
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203209; cv=none; b=tL0L0vnhUM0FxkdRVGlInmXu3qthIVuzlKk8mjcEgeQS759/1e3z0MYIdfh3jdn/5AcYUvhFu7C7TaL8iPmwHlVwJULr65wnSRcRLAi1ivh1VMacGM925vB82SWOUokVSQ4uOyZ/MHJ/Ow2WthvUaCF14STf9UrxqD+MGZJiVw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203209; c=relaxed/simple;
	bh=2wrZ8L3fuDou8T3wuy8I5zA//dBy/9DfZ0w0WLLM6iI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bue8feeOOTC6CHrjFi5GByNv041c9dAfF92ZbQgUNeauebzvda4buaolAoaxUquZSMoqNnyo+y4lDT2BaeXogzL11Am4tEJpRya3WhRGq/9LjFi1/c/RueH/H0qAP35gV2PlPx8iO9POhNiIMFCVwEZ38B4B5J7FTzi8KnMTvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJLEU9+E; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJLEU9+E"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so911635f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791203206; x=1791808006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9zwmMvE9fywmpezau/UUq/GtmNz0qdU1IaBwDhE+Js=;
        b=jJLEU9+E5M6Vjc0l0lzQZJcZwbN9YfPd40jKPCJ/IyrVTgbbioggdFul8dWWqUN8WY
         z1XfxvR5uI0RCozpYjH4VRbMFEnpuPi47xR9D6j4N4eQxG0XD34ufU3pit1MKL2dontZ
         127zDteoUIxXajQ1w2UvIxdLy2F+BULWRd48wVOj4x5TOziNR2LzRYYwsqZ3CSigDy/k
         1KskKUdqQ66ea+C1BOQq80lh8TlNVei4mIQc0U3aIOilkQZ17L4xbrehnoTLzYItlTP4
         2dx7NVUi330wROC378S/jVLM7ZsdAyl836qNzawaAW8GOsXm5J9lQ1FQ9BDn2KSl2eg9
         yl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203206; x=1791808006;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9zwmMvE9fywmpezau/UUq/GtmNz0qdU1IaBwDhE+Js=;
        b=sZwE7aMd8DfADTl0j+mdlPC3KkLphlrWoa3lnWsmLrD8JKsbe8xgZhV7Yvhp2xJgJt
         PGDQyGvxuELdghC1Yoehul4lSy/QzlszKp7f24T1bkiRWoIy4gttInJzTq5CeoAp+g3i
         gaj0vSocAeOREqUeWxqi5C+Exi6F2OI+LKWQgqHxeSr2GJPHBxUUGkM2u+CQWVp3Hugq
         A/7sr5V9ipn7i1cj5tDiak1DHlWsKfJAtqsWfA86Avs96JjpFIq65WEvigoRRHnUlScX
         nxJsxCfDwOqKbSxUl8Yygy3slMXwcHN/58M7hYxhnY3th9dZvRMtO6FHwTbgxMwnEk5N
         WNjw==
X-Forwarded-Encrypted: i=1; AKwUvBxPP7Egoy0glVQdM3xODDn6rTF2mh5rI0mt3I/depfw9zmE7JB7N+s7UuEYZ+pWL3aEPsATjm7aWT+rnw==@vger.kernel.org
X-Gm-Message-State: AFuF++kYf0xZxOBiJkkPSfUKLi7A/MoRrAqZF/PeeYdoQKzsTtSm5YcJ
	I6mV9E2n3aiTG2J6/EmyZmQltEdjz2oiop3NAkJpIycbfvjPZlJZ1Gn4
X-Gm-Gg: AYBFou2FpvZ1TLcHRVvRqnVSjhhlYqCrZWdNE7d+sTuL9gtv6E//EbPXT018LHMeAZZ
	KIWNcg5DW80JUikWKg3zgBypsW3V0U8B+pssZntzRNmKyXABVYLDMA1e8prFqGbAyy1tzF4DSKv
	jBJPovhCyX8ar+L/68jo50mV/KHLVimXXOba8VNxOvw52QCtfZBOFaAuCC5pW3HajkPbV+SkQZN
	208p/2vaXiMVp2RTxKESpK0geXN5cM2HHChvsdoEF7hquNR6FKQG5DHl8ETLkTr3L7oSgnFy1G1
	EW/Uz1A2fBX9oXrr3/jzThitdMCOUIgbFJtvB8sHUfXGXYEcV75lZHDzxQ7T2lSVpZ6GhcQH1j2
	QPj+QpGcs3R6t9PwNqeqqVd4Qgag9y5cDMK6jZdgaSlnctcDgRVhmj+wB6khKMQP9uQ2WNmzgFY
	3gSEX6GWW50z3HZ8C3W/ekjbs7aJ/53w0afL0zJR8RzXjRsy0CWRxOpuQDjBiDt1B2s9AWAtIfd
	p7GIo4YFG0Mj7mjz+O54LTeqhC/G0U4jE/rcLXau3Uyaw==
X-Received: by 2002:a05:600c:1f87:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a0275a1d54mr186457595e9.20.1791203206334;
        Mon, 05 Oct 2026 05:26:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm336935255e9.4.2026.10.05.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:26:46 -0700 (PDT)
Date: Mon, 5 Oct 2026 13:26:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, linux-sound@vger.kernel.org, Colin Ian King
 <colin.i.king@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: tas2781: Fix spelling mistake "config" ->
 "config"
Message-ID: <20261005132644.583ba73d@pumpkin>
In-Reply-To: <179113127609.150114.13801161604243660987.b4-ty@b4>
References: <20261002113953.1782731-1-colin.i.king@gmail.com>
	<179113127609.150114.13801161604243660987.b4-ty@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 04 Oct 2026 18:27:56 +0200
Mark Brown <broonie@kernel.org> wrote:

> On Fri, 02 Oct 2026 12:39:52 +0100, Colin Ian King wrote:
> > ASoC: tas2781: Fix spelling mistake "config" -> "config"  
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Did you fix the patch subject?

David

> 
> Thanks!
> 
> [1/1] ASoC: tas2781: Fix spelling mistake "config" -> "config"
>       https://git.kernel.org/broonie/sound/c/7d6adf283a83
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> 

