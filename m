Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B46329C56
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 23:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767916786; cv=none; b=Y/RjCppg4U43Yb0XDBIwXimmdROlKKfgOyOh7Ss9qwYBSSKnX5TXtrYqFcXp54sW6y9ltcjotUURbLGW37xkLhPOn0WPA6bazvhr5Nk/cRztU0ukkXLW7/SqajeQa1FpGY7XwqpNaccD/ecTHfdeNlBAcrG0RGQqG72PQiqtmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767916786; c=relaxed/simple;
	bh=gpuHLEyjnbFK580IKG7eKnULJFTqKi1r+taNtc2cjfM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT4XjRg+uvedmlfNXLFjT8orBhwlMyxwXopjsxqeSli7K0aguIH/QWlLHk9YIAlCRYmqZ2ar6etm6lvKPlUzlN1cH6bc8fmbGDV7pFQWY9og6iI9/gOi4ejtDsumhDNa08SwuhySp8QuODIxZqjhuzkCCr9c+MInvkNAJK62om0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+OairRq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+OairRq"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b76844f89so1391450e87.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 15:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767916783; x=1768521583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjwbCM/HP8XDZXpvP+x/YKQ5QGXzfx8bWSZEMpTqB1Y=;
        b=G+OairRqcfLPLLTMCi1sm/mhKNGoE1xJuxxEwf5DS4rXejz6XMLNS8HMrJinNyjoF+
         iyDCbXkXvXGSngQVf1+icKPz5u6ODZl1Y3l3llIn5P2/rF9FkM/19K6zhiEUwi0OC0a6
         mT0hWxHZ9G0FJAoIF+of/lDTx6IeWjVEnxrSuzwp/uCRexS0G1xpNtELd7EGJEGb6e3c
         hPx1Aohyog16GhPZcyXNbdDeyaHJzif9t4ZMVLszLWMLAW7aygk1QB8YXfjvxr+wJYBC
         xHum6UBF49jtMmW1FGzuPFkU8Die3KKK+C6InrXRzSWikc5PcFceEAGsLOcRvkKDbYSG
         hZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767916783; x=1768521583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjwbCM/HP8XDZXpvP+x/YKQ5QGXzfx8bWSZEMpTqB1Y=;
        b=nBgSIMd1NE78lxXiBr98nsTyczI6hKZ2b0WSd4hTnV3Y6NSZQo7FaDElHfc6MqElf6
         WdE4ILO1wAYvbT1ZrO/ippqXAEVZFQfB0AJ5j0VX23wc2jZjkyHkBk4DbmezFz8xnN4o
         NKtMxjDtWB4mHFzygWUfsDjaXzfdj0eGvg559GDqgcz30CfS9iSNFwWpEUeg0GSBvETy
         fdh832iVdVp0Quwwhu6PEgwNG6Wd/97TOsUry1UmNkM8vNPNO7i77eqFPLPOzToIDp94
         w1b87KS9+IWq9bNXm1/Ji9TOi1sLIH9QCCBvJYv6Ymdv9ADenCq9p6WNgrl516pNGMDg
         eVcw==
X-Gm-Message-State: AOJu0YxYsc6zAeeQmAIMswEqZjk1sGhie7sObVed7XQiNoMIPXeVUVwJ
	sfCg0fpguwmXYIJxPigttHolSxTPa3Fb/I46qh1N0Gmw0yJz0mYoWuyr
X-Gm-Gg: AY/fxX4i65hGdQVAPQchfzdLgPnD+Mg0rfCnv7K5XXVEc+lmi+Ydw+d8tjRRei1RR9+
	Wf+HPFRdsF9bpsacdMN6cPTS3qeTtTDtu5Qs3qwAo2rU4loXtAvsjoi59KsAyfUbm+iGuzXF92E
	BSexbLDPAQ6d+ezQfaqSTDBY1nHMbT4rbZ9tZ62jwkwwpCdqnNl2yaGjiqCVT84BXvWfaraNLDW
	IGFGX43cwdPzZyyM8lm7oCvg1C3T/wxULPTs7jQAblxyCLhVggehgduzi5Z7+52eD5RBjpBqtZG
	EB8sGdszaZWrtlLENB7JQ2FV2oGoGcaFWxDUKG+PBgrCuOY63XA9slzHlC00BlYCI/rQrs1ZIXW
	Div71JvFggrRwESXsFFOA1HwV+Fi0ZW3GTbX3ntc9YyeeGU6ItymaIbV8ijAQ7g==
X-Google-Smtp-Source: AGHT+IG4JyeuCDUA6OwjqPK7zGJXd5Wl4oBQkLlEVwr8r40yF5z4TggzGIP7ExwB7TtJt3P6sZC/Pg==
X-Received: by 2002:a05:6512:3b8c:b0:595:7b24:d353 with SMTP id 2adb3069b0e04-59b6ef028c7mr2219338e87.2.1767916782995;
        Thu, 08 Jan 2026 15:59:42 -0800 (PST)
Received: from ark ([2a01:799:8db:a400::1006])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b76d18554sm865585e87.46.2026.01.08.15.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:59:42 -0800 (PST)
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
X-Google-Original-From: Roy Vegard Ovesen <royvegard@ark>
Date: Fri, 9 Jan 2026 00:59:40 +0100
To: fenugrec@mail.com
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: accidental revert of Presonus 1824c quirk ?
Message-ID: <aWBE7DlmgZLoDkaI@ark>
References: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
 <87h5swh8m2.wl-tiwai@suse.de>
 <trinity-f8cff6e0-b542-4caf-bae7-2a84a9a58d59-1767886416445@3c-app-mailcom-lxa07>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-f8cff6e0-b542-4caf-bae7-2a84a9a58d59-1767886416445@3c-app-mailcom-lxa07>

On Thu, Jan 08, 2026 at 04:33:36PM +0100, fenugrec@mail.com wrote:
> Ah thanks, I finally found the commit that explained the removal. However,
> testing here, it does seem to be required.
> 
> Test command :
>     arecord -r 96000 -d 2 -D 'sysdefault:CARD=S1824c' -c 2 test.wav -f S24_LE
> 

I did the same arecord test on arch with kernel version 6.18.3-arch1-1,
1824c firmware 3.11. And that recorded fine.
I also tried all other sampling rates and 18 channel recordings, and eventually I managed
to "break" the interface, so that I had to power cycle it to get it running again.

I'll have to do more testing to find out how to reliably "break" it.

-- 
Roy Vegard
