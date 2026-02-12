Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34B2DE1E0;
	Thu, 12 Feb 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889168; cv=none; b=sP3/jvPwqAwEIRy0cfMmRaYFmsB6dFcAZRzhAJr8nbE16euxE/J+otGSe1n0ITbP5Pd9uo/01GGmqqT6NJ4mZxTdT4S2vKosfKpxjLRF+mibx/R2KymPol2Mgt/+4ktBbxxfI+H7luhmi2lMQY1vIzpJg7fz9ok8mUQ33Wokmsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889168; c=relaxed/simple;
	bh=OwY3fCUXHvn7c0b6myczIXZwS6nAMjOf2RxQweyvf2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ucbOZkLMBeX7F78/gUEjJiTpqhLvxNLHL05ct5l5ZUfxmuJMAUmv9rqLJahTlbDwcVNUnQUK1DzDUlb6A1MHYdeUAmflVlPgVoxJoW2GWCefcwXvcX5nVGLmitpfcBqH2fKxv7jEtR1FGWNNEYXxhCXSfkrBPoCzkLIfLMdUHUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=eLjBsm6B; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="eLjBsm6B"
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 0A72940010;
	Thu, 12 Feb 2026 12:39:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 0A72940010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1770889162;
	bh=MLELW5b3tq0rLe8NynhUtk8Sj1P8dS+MehnwoUa3xpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=eLjBsm6BYyo5/I4ZwiS+nKIMbg2h8KSA3+ZzvlF74ZtYvmrdgkwk0CO3bkCZ+P5Ju
	 BT7UjkjKwjzGfqAVpTnGTBIlTthdi9YxpnqQXnedh1k49a9iuiGHWhSane7N+NApVx
	 eFE4qDMarHbkBwuF+i9bwapEMbOvIW1/hQqMx3fXef5mHPqycq7JHMXKdSkk0Xk/Em
	 qDQ8Kyk9/3NM4yM9V5Umm2bCXSLR5wuGHdspFYoKt0w5shPFkuBgzF0HwDQePQJKRB
	 bzNgFsz6vRZgb8LeyfBZmPtSnPaefGud9Af+obl5YE+UzqIlZKqz6qT7csgYUYoDLn
	 ZyTpK2B+RjRzg==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 12 Feb 2026 12:39:21 +0300 (MSK)
Message-ID: <e7ef697d-b7db-47ed-b622-4cac026174e0@salutedevices.com>
Date: Thu, 12 Feb 2026 12:39:20 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Fix snd_soc_component_update_bits return handling
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Igor Prusov
	<ivprusov@salutedevices.com>, Chen Ni <nichen@iscas.ac.cn>
CC: <kernel@salutedevices.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rulkc@linuxtesting.org>
References: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
Content-Language: en-US
From: Ilias Izmaylov <ikizmaylov@salutedevices.com>
In-Reply-To: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-exch-cas-a-m2.sberdevices.ru (172.24.201.210) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: ikizmaylov@sberdevices.ru
X-KSMG-AntiSpam-Info: LuaCore: 87 0.3.87 7430d8ffafccd8879e1d8370e5b501352446c2ba, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, FromAlignment: n
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 200435 [Feb 12 2026]
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

