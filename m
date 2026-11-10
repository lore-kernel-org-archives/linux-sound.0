Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311478;
	b=KZzRdIaA6yQ4yBgx6V/R0RSuBNMI77V3rAtkzH+UZr1/8lwExxLW9R88nlRd91xwt20R
	 bQfhh3LVuA7Ebotvt86G9I9dak74rmQQUY9eYejnt/S5FZXVdKmKhXWgwySCcDg6R0Oqd
	 SV7nP+Pet8oISH3Dcx7R+mCgBBTlL2/8NKr9Q8U18Oci+xzkDiAX+cJp0WCMb7nT6LDe8
	 dwTbAef9Mgh6wf00sQRIp4VzNbp4nI9I9azsOr3m9TzKUV2qP493eMaKxaMfb1NADRml6
	 xPWqxlncziIdY/rDpNomj1sjU1k9gBbInS2UH+LsGprd90TPNjwMMjsrpblp6PwKdEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CMqiiywlLSX/magk1AgnOQL9lgKVlf5mAM1veg6/n8A=;
	b=OFnNAqBIEip39n9a8ECFwkMtwJsrI4TZ/g2Zd/RVmJaDxpWXKTA1tLsq+B8ZFtB4TbYV
	 SOIBJ9cUdYeXMTGgaV517n14NxsLrMndDud1oISaJ/lOc8L0xhtcUF7yqO819tWw5FICp
	 CtG4hqCjbh6gnTqXnetAyVZN3hc8sSyGTNksE2zezQZcWy00DMMgAWZ3l65HjW6jNbexO
	 gsVa01fVcMMprT5SxZKm/6xjyKiBA2ZLUqA5HETyrZMQfC1w9zfAnOe8iw91i67DjEyg/
	 TV0vYcHTV4E4PYHtB9C94ODZYOUS5WB4B3siSdZ27eqBnf6OURK7GMpVNHVzGcdKnnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmgVolmI;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A540606A338
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 11:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A540606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmgVolmI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16190465e9.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311476; x=1794916276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMqiiywlLSX/magk1AgnOQL9lgKVlf5mAM1veg6/n8A=;
        b=gmgVolmIo9iohlu7DnOcjpNJ24aroHo3ALlnPDCuoV8YxGLx8MVuS+QCdp0c6XhLv7
         fYhmn3fJYbSfFGeAd/fVd8K1lfgH0ZxsgjCXkBqG2OnOjtBtE0O7tx6AQA+cyuYYltcc
         lTt92qYkFMBKS6nWwZ9G608ILAtcImY16iZsIoh2Xkx3/j8qdz2l3E0+6k/U3z04EJ1q
         N3bDNJcTd+5KIFqPqUqZcMOjpJ2+skkbsE2mFHmy9tBKhG4ArD7/+UCIxVt0vDdxVeZV
         lBOEC4FTKOoUi9bLsiOYrmtNOpRyDAcx33wmKvD33ySgjNWlV7T44aYGCMEEplE6j8c8
         BpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311476; x=1794916276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMqiiywlLSX/magk1AgnOQL9lgKVlf5mAM1veg6/n8A=;
        b=Z3TjkJmcOf9dUbL0uM7laGxu9dm4cR+F0Dre/pq2ocW02lNnCKyRdYOrFc8xyfsQgq
         aerSmzjRqvr6lAjK+nUWXUNi5dD2dlOJWu48l1UN7T7INylaoAYa9q+qGrSNRUy9lxps
         /Xir/+XrDToCfpn9w/QoGHpBVmivd5Of1ZbGG+nHePmX1YW+SQYWJ9PlSijLiJtDzztQ
         xLQrkk+iPPJX81cSMaUBx0HtfbiMS8ulrcIWbQEQ1+Hl8HMyOl402rEfrXd3Mzef2iVL
         pospovegINzXkcg1l4+WbjJFYnpWTExVrKXEHLQADdj8giRGeCCztgJJobdxrdzsp/D/
         ISmg==
X-Forwarded-Encrypted: i=1; AL+hErE05Rp0InLnfWsrQ23uE600ImvjZmnjFs8vuxMxpeM2McRVlTi4p+424dyNoKfAlk1mRo7XrFjA469iyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kAq0l11MaCVT4fUg7VBdWUPhTvk0RxzMU1n1Oy39GDjhiK4XC
	dNMuY2b9dYjAf1LQtECg04Mkoba8xbakrc0O4Q05Wa4R1F5YMqx+D++3
X-Gm-Gg: AYBFou284FqQzo1fnIbEIqLalFL7KRH0wac+g0GULi6+MeAh41f78njqr6ezGhfrUQY
	tlrMItASBs9HAxEksFJB1YH89QdySvGgWPE+C1+iJZlw6I48Bl1RQP3zAJVh5Amin2SsvQtaBQr
	uzrtFEluTxYpA6oCYA3pbyeVCyoHfctahijhwW9Rn5wTQOuBT5kke+3fBuw1o7Q2BxOlgIlctuu
	7pB7vE5tBBJvisxWPkhE0K3ml9+ETr+fZq8C6ur71I/wP2dFRg43Wp9x78b5QTNLlt8IJTjYq5r
	mgw6+eyKkUpJ3OVdNVxCv1BVEqq0YpQiLUH87qHp9Bv7SBFaTscOs5US64bj9YFFBnnkjCeKByl
	Y4DqF4FytvZoSPq1htPsgT9VZqNpPF2Lh52gulCTQuDFCDNKsN9+OejC08nM8qEJgejgI/YzWD3
	yVYrVodSThW/1ruqwj1Z8g/OWcMxMAvNQDcBynCkWJs+2kHIUXKvR1EFX8MT40Ln8H+/Syf3Doi
	ZybpV0TfanlKJjS1g/GAizTwO/aPHSyX+GOawdrRFbXqlrAPFluXsCB9xI7WI9oviK1ygCSczcw
	gZltQ+m6yPG9fU0rEm8PfMRZk5AR3gRMSMpNvSTJ8yU7nLErN+fi6SCqQqvTT+gLdA3uzU/joMY
	UDi7Bc/Y=
X-Received: by 2002:a05:600c:3b11:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ba02357922mr35599775e9.34.1794311476364;
        Tue, 10 Nov 2026 03:51:16 -0800 (PST)
Received: from [192.168.68.73] (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01feee1asm76370685e9.12.2026.11.10.03.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:51:15 -0800 (PST)
Message-ID: <59c8fa03-3ff1-4dd6-887b-d3c9044f2052@gmail.com>
Date: Tue, 10 Nov 2026 12:51:15 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails
 with ASoC route errors (-19)
To: Rujbin <rujbin@proton.me>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alain Cousinie <alain.cousinie@laposte.net>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 regressions@lists.linux.dev, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me>
 <318f1745-acd7-430f-818b-c961987fe108@laposte.net>
 <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
 <A2lXWpWj7wjBwPNTvCOh2-bCqRbX0Pb7od1dICr4c6SegAilwp8dERHk6riu7tj1b3XUMgcLnDDSP_8AoZAyj9VHm3NUkBB1NW2YPQfZLYY=@proton.me>
 <mSuMDKuVQS8ZjTjivGVr3SMDUYuxZDrlG8aM0vLajVxIN8eq7OJTwAtWLWgMGypqzNolhoAsat_-nBy0wAq09eap6nIDkUvCES32gFvZ7ng=@proton.me>
 <bC5e1B4L-OemXflaxyhu6hZVqEyiiGQ9_Q3cejRNYI2EMBnD6LC7sgT6bskk8FjeIwsbZviJBOmIGiz5t9xgfwAm9czm8ihYLGsqyVLHyjk=@proton.me>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <bC5e1B4L-OemXflaxyhu6hZVqEyiiGQ9_Q3cejRNYI2EMBnD6LC7sgT6bskk8FjeIwsbZviJBOmIGiz5t9xgfwAm9czm8ihYLGsqyVLHyjk=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 23:02, Rujbin wrote:
> Hi all,
> 
> Short update: the num_components explanation is now confirmed on
> hardware.
> 
> 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the
> devm_kmalloc_obj() family") switched soc_new_pcm_runtime() to
> devm_kzalloc_flex(). __set_flex_counter() then sets the __counted_by()
> counter rtd->num_components to the allocated array size, but ASoC uses
> it as the number of populated components. With GCC >= 15 it therefore
> starts at 3 for "Analog Playback and Capture" instead of 0:
> snd_soc_rtd_add_component() writes past the array and
> for_each_rtd_components() stops at the first empty entry, so the routes
> fail with -ENODEV and no card is registered.
> 
> The fix is one line right after the allocation:
> 
>     rtd->num_components = 0;
> 
> A separate [PATCH] follows with the Fixes: tag.
> 
> Verified on v7.4-rc2 (commit 7475ea8b58616), same kernel build and
> machine, with only snd-soc-core.ko replaced:
> 
>                                unpatched     patched
>     ASoC: Failed to add route       18           0
>     fail to add hda routes           1           0
>     aplay -l                   no cards    sof-hda-dsp, card 0
> 
> card0 is registered, SOF firmware 2.14.1.1 boots, and there is no
> UBSAN, KASAN, oops or WARN in that boot. The loaded module's GNU
> build-id (ccb6a039...) is the rebuilt one, not the original
> (daa875d8...).
> 
> Caveats: the module was built as an external module, so the test kernel
> is tainted 0x3000 (OOT + unsigned); Secure Boot is off and
> CONFIG_MODULE_SIG_FORCE is not set, so this did not affect loading.
> CONFIG_KASAN was not enabled, so the out-of-bounds write itself remains
> a static finding. Tested on one machine (ThinkPad L16 Gen1,
> Meteor Lake-P, Conexant SN6140).
> 
> Thanks,
> Rujbin Nassereslam / zerox80
> rujbin@proton.me

Hi Rujbin, all,

I ran into the same issue and sent a fix here:
https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail.com/

I only noticed your report after posting it. Could you reply with your Tested-by?

Thanks,
Emanuele


