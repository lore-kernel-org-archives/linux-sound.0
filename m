Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C61D9663;
	Thu, 12 Feb 2026 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884258; cv=none; b=pUlVpepi2IvM0RGGjDMvwuprCCJbzuIinF45QnvVZIukR3ovnB7de6VGBod5l7VspDbP+UqpS+a7PGbu+yk1RyV6BSpzcFIsXpBHlZCIbXX8MnvHPIby3qyFA1JqHx8OHSLG26QeWeYKRNjQuTROpwkdV9cJl5MXJNfJqb9VQlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884258; c=relaxed/simple;
	bh=OwY3fCUXHvn7c0b6myczIXZwS6nAMjOf2RxQweyvf2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U4H+7WWDquivBcjcw+zllPfl6M0rtcZNaqGhJGhUL+xi2/ZSKlr1BmDVgPSMEJxa0xvHy6CZvwdNzizlI55XxgNQCFL/6QAZCSCj9gIqK/bxqiI1UqqBXdIcE2HZZlDsFQWEO+puUfphHZxqpAY7JFD4J69jReGmXdkL0TTJfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sberdevices.ru; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru header.b=KKzaoBkL; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru header.b="KKzaoBkL"
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id BDE6D40006;
	Thu, 12 Feb 2026 11:09:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru BDE6D40006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=post; t=1770883765;
	bh=MLELW5b3tq0rLe8NynhUtk8Sj1P8dS+MehnwoUa3xpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=KKzaoBkLfKidGW321d2pNpi2ClcRZ68ZqzCayW77q6OZYaRBRWi1fOGybl27c8c5M
	 KeWCWCSKIFPdtwm4Dg4fkmiejIoyxdvJ5JLpJoh0e9BT0aYalmw91TrXWZL/FH78w7
	 /zcHL/EupGq612MJYuAwrs8wAD+ly3985G1tNIJJVTaeYWUm2XfAxJIrgTr9fiDIqe
	 NKOw9RlzxGaIqbfYH/qHk6E9wm4a9Ri8pb+6RfFxDV9itVWdst4+CRsWlbaPERIlz7
	 Vs90qVP4UUtQt4z7qD4yjxDOes6yPTu4fc/WAuRUfvVqT0Joy5EwwT18E95EbQ6Mm+
	 OO9t0FDw8GQ0w==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 12 Feb 2026 11:09:23 +0300 (MSK)
Message-ID: <810bf4fe-8c97-4580-ac8e-31c6bdcd74d9@sberdevices.ru>
Date: Thu, 12 Feb 2026 11:08:42 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Fix snd_soc_component_update_bits return handling
To: Ilias Izmaylov <ikizmaylov@salutedevices.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Igor Prusov
	<ivprusov@salutedevices.com>, Chen Ni <nichen@iscas.ac.cn>
CC: <kernel@salutedevices.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rulkc@linuxtesting.org>
References: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
Content-Language: en-US
From: Ilias Izmaylov <ikizmaylov@sberdevices.ru>
In-Reply-To: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: ikizmaylov@sberdevices.ru
X-KSMG-AntiSpam-Info: LuaCore: 87 0.3.87 7430d8ffafccd8879e1d8370e5b501352446c2ba, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1, {Tracking_white_helo}, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 200430 [Feb 12 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/02/11 23:32:00 #28234100
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

Hey!

I noticed that it's been more than two weeks since I submitted this patch series and there is still no reply so I decided to ping you guys just in case

On 1/20/26 19:11, Ilias Izmaylov wrote:
> This patchset fixes the way that snd_soc_component_update_bits
> function's return values are handled by codecs ntp8918 and ntp8835.
> 
> Currently the return value "0" is considered erroneous when in fact it
> isn't and what would correctly indicate an error is a negative return
> value.
> 
> Ilias Izmaylov (2):
>   ASoC: codecs: ntp8918: fix snd_soc_component_update_bits handling
>   ASoC: codecs: ntp8835: fix snd_soc_component_update_bits handling
> 
>  sound/soc/codecs/ntp8835.c | 17 ++++++++++++-----
>  sound/soc/codecs/ntp8918.c | 17 ++++++++++++-----
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 

