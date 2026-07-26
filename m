Received: from wp23.hostingpalvelu.fi (wp23.hostingpalvelu.fi [31.217.193.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7283D9DB9
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.217.193.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785088356; cv=none; b=O0A8APkOAqPfVRc4GlD2HAIe0EKWITlIj8rQEiVpDZ65yDg2myaaGvmn6+Ss+mSvBOkcAZl4AKuBYpvwhk56KVqPfVF4/5OQ0pA8E3a66FIzU7/Ex8HJsmVNRuSbYF5vb56nyKlavfd8VPMn5x9+chQwEPiDdAtTTDvH7A1UmwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785088356; c=relaxed/simple;
	bh=ASs8UGgvN9bvC0GJbHIrTOxraVBxd/iHizKDBgvEDu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbuDwG4POVXL/QxLpANWHM4BaNbfdpNwH8MtCD0P+WCz2rPBQRZRCfpYpMgogDSdvVYxP0KeIJvOmPSgIrdR1y4xjj+/kjd9Auc6LwYp8us8uc4Y2t5oHo5+3+Y6PztlUWpAA3YrXWArYan+eX2Vf3xWlmDajKZgf6zRxauH/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmer.com; spf=pass smtp.mailfrom=bitmer.com; dkim=pass (2048-bit key) header.d=bitmer.com header.i=@bitmer.com header.b=PMbwMloe; arc=none smtp.client-ip=31.217.193.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitmer.com header.i=@bitmer.com header.b="PMbwMloe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ICLFF9ZTq4ZQcgHlF186wvCbeFDS3dM8qg55pHO8oyk=; b=PMbwMloenD1jFHwJLKP1x4utl7
	4x3F9wkZ9JzU16/FHL8Qhv+96bwM36A4E0Ow3rPhDZIUf9/KpoOxIciC5ajjUfFKXtz8VV2FdJfRy
	lBOMd1X7iLO3BwqFijAE3GnvpKcDqGswyHzaXWAJh5USh8MJqe5zpf0AvdRqoZqfQFNEcTzowYFnH
	Tuy9mJlGonoNfzUUyAaM1XfvUuaZEhY+qvH0/GODK//ue3K186PEDSL1by6SjGnRfEaMv19G3CkzS
	6h2sGeCnsMsI2qf6vats815TqIfHg0Se8sTv1jdSaq1xXlMdCkDvYg1D3DsjviiTI5LEeLgjCYx9y
	hOmGeKbw==;
Received: from [91.159.31.97] (port=54736 helo=[192.168.0.12])
	by wp23.hostingpalvelu.fi with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.4)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1wo31b-00000008TJh-0hRx;
	Sun, 26 Jul 2026 20:52:30 +0300
Message-ID: <8a65462e-85cb-4cf5-b448-5f80e7543f3b@bitmer.com>
Date: Sun, 26 Jul 2026 20:52:29 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: ti: tidyup not to use *card on rx51_soc_probe()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
References: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
 <87ik69i0d0.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <87ik69i0d0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - wp23.hostingpalvelu.fi
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bitmer.com
X-Get-Message-Sender-Via: wp23.hostingpalvelu.fi: authenticated_id: jarkko.nikula@bitmer.com
X-Authenticated-Sender: wp23.hostingpalvelu.fi: jarkko.nikula@bitmer.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 21/07/2026 4:43 am, Kuninori Morimoto wrote:
> struct snd_soc_card will be capsuled soon, its member will not be
> able to access from non soc-card.c.
>
> To reduce the difference during conversion, replace dev.
>
> 	- card->dev, ...
> 	+ dev, ...
>
> No functional change, but is preparation for Card capsuling.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/ti/rx51.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
