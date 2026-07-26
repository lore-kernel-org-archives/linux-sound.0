Received: from wp23.hostingpalvelu.fi (wp23.hostingpalvelu.fi [31.217.193.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B1530C16A
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.217.193.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785088345; cv=none; b=kqghmcBvxtj9pEpNsanuR/3Qq/r9r7AhHs76aDExGC0MLnjCx7se3V/1pb/B4iZRXsVFcrfH8BH2DpUrtdZJIs7/vczAdAuAreCSbcGrfyC65wqCkUE1aCS4xmexYNwWyhOSVH0JyVjC4vNe2VwwaEuejUKWpG5kO/RMWdxKjq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785088345; c=relaxed/simple;
	bh=aTVC5dh6Q2GrxxCfRgsTXPypC5AHdYcL8IUEYW2aSPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTuMxrALDQqUF/xomA2H2ozj2Bcl8MCNBNtMP2iP7/IDPI9IdEJEXcTGW1auZIB5PWYQiMGpp+SdnTWHLtj7p+nyEFwy0mxMP4aWOKjqx5T1MX7f+7N3lvpEVTiViQTUJ+oESIL/P2bLOZj/0zDfjCbAccFW2Zggbd9d58jl/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmer.com; spf=pass smtp.mailfrom=bitmer.com; dkim=pass (2048-bit key) header.d=bitmer.com header.i=@bitmer.com header.b=LM1RzXbN; arc=none smtp.client-ip=31.217.193.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitmer.com header.i=@bitmer.com header.b="LM1RzXbN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YSgt5PcV2RpfWmIzdTf6XKBUblQFojALpxEseb5Azec=; b=LM1RzXbNM04hX4De3usZYVGlGN
	TyLxi/k3pGkmuNdrKYuxfBmG7Dgk+3L7VaE2mA3ffUqHg1Aoojof86hrfs9JY/BRe+bYzBS0ZGAqI
	EJbPMK6oXo1Odsn+o3SbiZq0sWEMECcpqNqThgYurtkHt2/vLT8XMbhYEINgExKg23n27VGsOm2vA
	rMWTvYab6FvaFvZMjKigK6mXcCSJNPTFjW7PSupUNekK9Hs0/kk6Yf9Bo76rqMfUJ5iQjAzuxeANO
	CihmssuVuKanOxb+FAt0CHp2qduS5Y5srQT07Lwg+HyeIukBiy9OAuKIFXDt8DGVr7RBcmtCNL8RG
	uyxdPeHQ==;
Received: from [91.159.31.97] (port=53746 helo=[192.168.0.12])
	by wp23.hostingpalvelu.fi with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.4)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1wo31S-00000008TGD-0b6G;
	Sun, 26 Jul 2026 20:52:21 +0300
Message-ID: <ef5ae031-f495-4d02-830b-eb345039a401@bitmer.com>
Date: Sun, 26 Jul 2026 20:52:20 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: ti: omap-hdmi: remove unused *card
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
References: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
 <87jyqpi0d9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <87jyqpi0d9.wl-kuninori.morimoto.gx@renesas.com>
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

On 21/07/2026 4:42 am, Kuninori Morimoto wrote:
> No one is using ad->card. Remove it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/ti/omap-hdmi.c | 3 ---
>  1 file changed, 3 deletions(-)
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
