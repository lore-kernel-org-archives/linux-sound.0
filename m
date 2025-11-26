Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5242712B94
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764125955; cv=none; b=bZnnMWePBzcQdRc6R3Neszj7UFhF6Z7WK5jTZ/re0L4m/2nfqNG/9H38W9uQKm3Jeu7emp6Nmgk+ef3E4hgzRNvLRTrZGKSmxUTey30g2evo75WDFXPit84yOJUwPAwJn4pFfCJA+o7Np2QOFS8rR4k2sPENhb2tSsGpCTfS5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764125955; c=relaxed/simple;
	bh=W88Avw5l+wz4HR41suTqHIlOe+aSfX2T2Jo1MRgk+54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXfJ8Y+iLf5hY8KVjznLwh2M5IMgGcCqXMNF+H4uu1KQJeqwPLdvrSPYtbP8j80rbwskRMTrvvwCIcEUuxnzzTPPQMi3rmEFPzVGC0xbzkj6tij3UYFjgNEu/VnqHkUdXLW4piKHKXrVDarqWrcCatmpYHiBY/aqeyi6kwjpJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=kW6RNvsp; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="kW6RNvsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764125901;
	bh=BBMlavhaZdKW4GYNzq/iFXOpCn0X23rTC5czcE7qNc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kW6RNvsppi0fYWvheI3XhymmenQn6ActAg9bVKkYEs/okcNgHXJas94aye9MWUck0
	 qqgn1CwfIitxJcfFtFynrATbw6KVC5XwheZeZsEBVRpZ+0CfYgyzcFGFKU3G0LeuK1
	 KtnZuRWCM3fVzefnAR7MTaCRhKof392HYDwW69cI=
X-QQ-mid: zesmtpgz4t1764125898t9fd43a3d
X-QQ-Originating-IP: kKGK8E2ezxdmXdlfuZDh9DHEbFPZcw5qHF8BnZimKJE=
Received: from [198.18.0.1] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 10:58:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11233986991024952182
Message-ID: <84FC3BDF7EA9F69A+14dcb273-e661-49b7-8609-020c3cf79eb7@uniontech.com>
Date: Wed, 26 Nov 2025 10:58:14 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement jack detection for HP Thunderbolt Dock G2
To: Tasos Sahanidis <tasos@tasossah.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Jan_Sch=C3=A4r?= <jan@jschaer.ch>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20251126003805.2705503-1-tasos@tasossah.com>
Content-Language: en-US
From: Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <20251126003805.2705503-1-tasos@tasossah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MRun/5VSKCpA9AvC1ZMXd7EdKthnMSca+4iFH3lcDDsMONr/yXJySY1N
	z0/xgp9J/kTXTA0OlgPjiomaTjUUss0yUZ0S6Scpfk8MRSmv+NTAvs6fQ8Wrlc5P3MU77us
	mqKKxvXzQEnI4I/p4S/kKcn0+cNoefSmMAna1Z4xHftv6BwwY0k8pSdrJHwwSeEJ4WUNKDk
	BxlTtt3GRCoPX8M/pm22r+vTRNY47OHvf3ud3u+5RAp1DB6kkB23+lmQsHplqRGUVbvSDv2
	rxNlRwjYpRlGUb5EP/cFPuaoQJK5iAUb8EZgOHFiZVSOqiG5shhkDcvw6+9zcN2sIg7prXp
	ssuKyrnwY+InOO8S8F5fz9D6WQ9+7b1D9hL0IQwUx4LT72IyAGT3ql25flwFD1rYWK1C92h
	PWctHpRDQ00i0icwLDLztGK5JkEtpcAS+6CsmnyqLdS7crnfp2e//4/C/AEOGUH0xqbcLGj
	USXM7IQWqMR0slEeV2KIFy1fPFJiVP+NvMvjwsdWMlcBMvqY4ol8RY1m88bwUZRxryTdnfo
	X80BLrshr+qi42gPzjlJ+eG1RGHIW2l6e5AAfPinFtRHNWXCLJWwswpSeJh6BxehI5rlvU4
	JGI1pwkKAiT4sxgNJ/c5eYcqEmoWCYuQs5ZGPDQEMo5Pbq45+TtzSkcJa4Lz7LJw8nMxL1o
	2Yq11to0jQcrgsEDGB+IuL8kN68x7mVXlcN2eWZJ6wxS4qWhAmcBUHKLYfqGdqHJsvxk6q4
	mFouNpm3XVs0An51N/AVOR3qLq7aPLRc8U3bKJYFyS6/+dvKQNhii567qnhZfFhNTj0yz0T
	b2vvA0mofvB0dJHOnbi70sB/a22kwZMhf+HPQSF7PID2On7u5xNmekgY1pK9pT5sseQbZB7
	D1zo6re0Q1/Ejt1IZXpRHk4T6+yH4jR9PiSS/pnAoC6Dgog96zzanCXUz79DzHKIeEP3Rko
	J0J/vWiqQ/H0N5PSTwf/QI9xzfkEQQRgFeLwHwX5u5hVYEZEGZ9HESx9JjeMlWq0n2Z4Utm
	x1Ltv1EQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0



On 26/11/2025 08.29, Tasos Sahanidis wrote:
> This series adds jack detection support for the HP Thunderbolt Dock G2.
> 
> The first patch modifies the existing realtek quirk for the Dell WD15/19
> docks to allow changing the commands/algorithm used for jack detection.

Does the HP Thunderbolt Dock G2 use a realtek chip?

> The second patch implements the detection for the HP dock.
> 
> This series was tested against both a WD19TB, with no regressions, and
> an HP TB Dock G2 without the optional USB speaker audio module. The
> module shows up as an additional USB device, so this should not affect
> its functionality.
> 
> Tasos Sahanidis (2):
>   ALSA: usb-audio: Modularize realtek_add_jack in mixer_quirks
>   ALSA: usb-audio: Implement jack detection for HP Thunderbolt Dock G2
> 
>  sound/usb/mixer_quirks.c | 122 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 115 insertions(+), 7 deletions(-)
> 

thanks

Best regards,
Cryolitia PukNgae

