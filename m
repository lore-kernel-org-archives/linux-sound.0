Received: from smtp134-84.sina.com.cn (smtp134-84.sina.com.cn [180.149.134.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6042D7DC4
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173844; cv=none; b=GjYI/DaJXUTDqeHfUyRpYgOzGJRmqwKNA/pzWLNvKE0voKRTIbUR78lBWqm5mwFxSlL8o7B8JVuirpYEOKgWeIF4fyVDVIc66Ek3Lji9zGU5bQMMzavc4e3odCVF3qmNaeoGqFrUbjWNGrrM/Kh8Qj6XwMnG7qwZTIF3nioAm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173844; c=relaxed/simple;
	bh=O79Y0ybd4N/R71dCPjLnc1s1zdSp6s1ci6Pz2EAoNVw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Nyi11RMFe1LQOOdABPuNuq50M3UhMrVtwonyUq3uFWeLcx8+40JHQkIk5jT8FoPbGkVqfLadjZke8TdPQVXgaFS8av1yNfHzkBUVUzC8mFGfII63bDPn4jyzkdeP1Z6EKMFdoIC/li3kaVJFTwbJgIDiEndka4AwvWVYbVysQNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.29) with ESMTP
	id 6982B4FA00002D68; Wed, 4 Feb 2026 10:54:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: B12F44F0B4FB4649A7AD76282F6639EF
X-SMAIL-UIID: B12F44F0B4FB4649A7AD76282F6639EF-20260204-105451
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: RE: [PATCH 3/6] ASoC: sdw_utils: add soc_sdw_es9356
Date: Wed,  4 Feb 2026 10:54:45 +0800
Message-Id: <20260204025445.31669-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> This breaks an x86_64 allmodconfig build:
> 
> /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c: In function ¡®asoc_sdw_e
> s9356_spk_rtd_init¡¯:
> /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:83:39: error: passing ar
> gument 1 of ¡®snd_soc_dapm_add_routes¡¯ from incompatible pointer type [-Wincompat
> ible-pointer-types]
>    83 |         ret = snd_soc_dapm_add_routes(&card->dapm, es9356_spk_map,
>       |                                       ^~~~~~~~~~~
>       |                                       |
>       |                                       struct snd_soc_dapm_context **
> In file included from /build/stage/linux/include/sound/soc.h:421,
>                  from /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:14
> :
> /build/stage/linux/include/sound/soc-dapm.h:654:58: note: expected ¡®struct snd_s
> oc_dapm_context *¡¯ but argument is of type ¡®struct snd_soc_dapm_context **¡¯
>   654 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
>       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c: In function ¡®asoc_sdw_es9356_dmic_rtd_init¡¯:
> /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:103:39: error: passing argument 1 of ¡®snd_soc_dapm_add_routes¡¯ from incompatible pointer type [-Wincompatible-pointer-types]
>   103 |         ret = snd_soc_dapm_add_routes(&card->dapm, es9356_dmic_map,
>       |                                       ^~~~~~~~~~~
>       |                                       |
>       |                                       struct snd_soc_dapm_context **
> /build/stage/linux/include/sound/soc-dapm.h:654:58: note: expected ¡®struct snd_soc_dapm_context *¡¯ but argument is of type ¡®struct snd_soc_dapm_context **¡¯
>   654 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
>       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c: In function ¡®asoc_sdw_es9356_rtd_init¡¯:
> /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:127:39: error: passing argument 1 of ¡®snd_soc_dapm_add_routes¡¯ from incompatible pointer type [-Wincompatible-pointer-types]
>   127 |         ret = snd_soc_dapm_add_routes(&card->dapm, es9356_map,
>       |                                       ^~~~~~~~~~~
>       |                                       |
>       |                                       struct snd_soc_dapm_context **
> /build/stage/linux/include/sound/soc-dapm.h:654:58: note: expected ¡®struct snd_soc_dapm_context *¡¯ but argument is of type ¡®struct snd_soc_dapm_context **¡¯
>   654 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
>       |   

I will fix this error in the next version. Thank you for pointing it out.
