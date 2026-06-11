Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97183411695;
	Thu, 11 Jun 2026 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202166; cv=none; b=bowj9Mj+HIextxnzdNyE3WrGGg37EYoDiQpFrj3s921dQy2IwckSINLZV4VkcADMp5AvjMwEtc3q8cIVKE15gTCGDPSkPrQ0FrDM1kxlZqzEhoHNulePELh60lPJjIUhVUo0FKLS/FgkoKIP1A2n+VmsQEsYjwD7K+7fwLQUcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202166; c=relaxed/simple;
	bh=fw32aETREpZ6A2OjeA76IM867nHS8I6bmSRSbhzXCMI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iOipmM7GFH0ktjgirxmYDDFugLAKVY/IGNLTiC1ZjxbvDvYyjAqQ17m5uhM225qtfMrT17BtPj39sNyRFPsFniuYuHVsyy8gG0vP9RmOPn9flj0iqxUuhfueauBsa/2l/6t+um2b4nJ+I09K9mT9dEa0+1HTLMrVbYcyg5/mEgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Yl9himhG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cgweFlr/; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Yl9himhG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cgweFlr/"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A5FCAEC01E2;
	Thu, 11 Jun 2026 14:22:42 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 14:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781202162;
	 x=1781288562; bh=9Et5SEXuWFd87Fvt+mZr2Pr/FJlXX8zwNpb/xrJ9v4E=; b=
	Yl9himhGhI3bfxl46NXScRO0uzwqUerhjLLukR2NPODt4an1fkH12nn8aMZ5xnN+
	39xBGAVQfPwScxYMYKYlTvBxZjT68BnZsj1lHzBHsmBIioVwMJrPVVDohE7/xVON
	Tz8ZC8ZH8NK5TirO7Vn1pqBhhG9zEi+dS6vrqkloQmnMjHGqG3xu8/RGdAWhPPg0
	4G7qDzGxEuf6FoAPYZlWTKyOgtozcTaiOKaJ5SGcTZy6xrVM1VCOU+9wy0FLndz6
	A6jkPvu9rvnJ9nNI04OLEgTF1cyswUwUwo82Ves+7BcaCVl80CS4rGpm0WXXbgyv
	FM5jvK+loWTgh3SokZTD2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781202162; x=
	1781288562; bh=9Et5SEXuWFd87Fvt+mZr2Pr/FJlXX8zwNpb/xrJ9v4E=; b=c
	gweFlr/6he6pjojKdnSdbAmAWEOs8qUx7mCeA//rmualzwU/jHPBst6EvEXEjaK4
	aEJA/AWZs5wEKsvX7dI/34NGzPEsMFhNXzN8CRu1/JzTALQaQMCter5iieKTy5AD
	irnC2y3wjKL8pl+cO6tpymQbjzMD9kq1/uWU1CIuHX3bQCG1M9FJwN9Y7h7X+ryk
	taHiCGvLpKyk7stHSA2RmeqA3fYJhQVurwMQqvI8Lu94nLNAjx0+sR+7dekE6YmI
	pcyDLMM3Lsyf02rqqKHQnuzt4M1iYK8HjeBt1Cj8Zsod7YyiQluEqwPyU89dl1zj
	7xt9YtWB4liKiY1BQ83jw==
X-ME-Sender: <xms:8fwqamVkT0P9LYwm4wRAzs5D6jpw5GWBJDnSjw7t4QCk8oI6Q1RaSA>
    <xme:8fwqaon0HvmXSVTh5mChEkeKsA4tDIc5Oli7CSAJuvIFQT3wC5HvH_zQ4yLQjIff4
    PFdMQD488HlpUlVYYOmOdVY-MKgfatF4jncfO5BmEXCPfvK56s9Cg>
X-ME-Proxy-Cause: dmFkZTEYxHTyov5mw6nzS6ITZISbR0s0w/3uAtFjtk0FoETHDYgua2wldA3lWoFH2yCyO5
    UC6kLrYwt9i1hULZp3uj+dVA6iWgWuxqMBE3IbxOTa8u9mOt90x0z2CTGWXDVXXEp/TOEq
    Zg2Vwrmzy32uAIKQ6Ia9lz86sJ+1Ho0Fir/bqnOGeUeshkDln06Oju57Lb/fSZeaMVSsoZ
    A4zSlOwy48+w7dgnh2qkcbtY77GvsmKfk+MX5YRNkTZqzzpJWgBOoZ8qcSQWP6g07S+WP5
    w1WjkbR4b6tD2BkiZ5PSEZcdnqVv7cTNWqt39iROGHvzj5pFXdJciL52BEyJb5sG9NUOOt
    +/MWXNWiJUDMe26N84+0xmhCQ9peGapXJ278N58REPBAbx0lMYO9ASgC7MAzT6Q4mi+86A
    JZW5Y4FjBA4VVPtZQI9Zl/nSrGcfddwSDe0arU0qiAprCwwYh4K6oamI05QCGPWrNL9VNt
    wbfEt6oo0/UEz1iS1R1EbDV+3iNdSHg5E7MLPxG4vJ7XBBaFMIuWTnhhh3/yThg2Suc/PR
    DKKT20qZ6CavR+FbgvXKHOLTAewn5O9ErlOnDl8u0jKrIPVL0VXqkFflnZ/6nHfmoYchf0
    /bg59WPsnXA0oXnuL0fDKygXkdCPb8q3ZxTm0PWoznlGB36VzFIDnthSR16w
X-ME-Proxy: <xmx:8fwqaiynUmWJlq0iTR8pckgahiwshNepiYqONSIU24FDHe3URNaf6g>
    <xmx:8fwqapvHO6oQVo3mssnvsi4UwqzZxN2POzA9WD6m2XN94wdLkG0-9g>
    <xmx:8fwqajBlnu1oxt6BZ6Daomg1OhGYr9do_UL_6jk6jylRcQqvOY0QvA>
    <xmx:8fwqalpkPLxwe9n0JJgtjiTgNsT_bUKZ2HGdsPCDbDkehrpGVllpGQ>
    <xmx:8vwqauwuf0tDk_2i9UvC9WTD9wwnsy95F4Qbj2AXtTVJ9OoVghRANgXB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E13471820082; Thu, 11 Jun 2026 14:22:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8g0-Z_ty2kZ
Date: Thu, 11 Jun 2026 20:22:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Daniel Baluta" <daniel.baluta@nxp.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c216893d-0548-42ac-8a3b-4be397a79fc7@app.fastmail.com>
In-Reply-To: <airEQ7ER7jUF3SQ_@sirena.co.uk>
References: <20260611132310.137688-1-arnd@kernel.org>
 <airEQ7ER7jUF3SQ_@sirena.co.uk>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 11, 2026, at 16:20, Mark Brown wrote:
> On Thu, Jun 11, 2026 at 03:23:05PM +0200, Arnd Bergmann wrote:
>> +++ b/sound/soc/sof/intel/Kconfig
>> @@ -335,7 +335,7 @@ config SND_SOC_SOF_HDA_GENERIC
>>  	select SND_INTEL_DSP_CONFIG
>>  	select SND_SOC_SOF_HDA_LINK_BASELINE
>>  	select SND_SOC_SOF_HDA_PROBES
>> -	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE
>> +	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE !=n
>
> Can we end up with SND_SOC_SDW_UTILS=y but SOUNDWIRE=m?  Though I think
> that's a potential issue anyway...

I don't see that combination in any randconfig builds and haven't
managed to produce it in menuconfig, but I can't swear that it's
impossible either.

I do feel that the entire set of dependencies around
SOUNDWIRE, HDA and the Intel/AMD drivers is too fragile,
so it would be good if someone could manage to simplify this
in some form, but the best I can do at the moment it to
address regressions when they happen.

With the patches that I have sent, plus the "ASoC: amd: acp: Fix
linker error with SDCA quirks" one from Syed Saba Kareem that
I'm testing at the moment, I get no link failures in randconfig
kernels.

      Arnd
