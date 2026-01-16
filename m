Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5425EF9C;
	Fri, 16 Jan 2026 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768545471; cv=none; b=Q3k1+PfjiyIURKsohSEdiqJCrO5+1YSzlDcxSPQOqxUep98SOmQQQvm4AN8D0q076X0pv1s7CSSeOr05/9eReL//jPyLNh+7VEau/Ov1OjylmbA6TqYxjFP5tBQARbrcQAm8ZOnkmaF88UEEfa9Y+0kMv4Lci/JFOxLGqMq6IGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768545471; c=relaxed/simple;
	bh=CAcIekDFq4jeTyxJGFDi3145vXB8ZiywrPp/gE7NPkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/uRU4rWJZXJnjqAiJ8s9ivEGZZ+2SEYHQv7Cfs1AIJpELvZm5ICw4JxYnOQDpwiL1FQssdSTJXf7gi4xFBhKdYIQDevNdfZgrwALHoCW0QwC528NwGwcV4qxqvsuEK+77BUAr4XFhPZoq/CvUu7KpDATCT18gr2Z9tYasUSqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=eE95ztiY; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="eE95ztiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768545410;
	bh=PkZJx3aAV431sd5ugw3sesaZCtLLZ4bNNFL1h9+z7HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=eE95ztiYZVwEdCJNoueji4gObh8hiAeKzO3gB64jdAev0f+m0F066hV6A4YZMOgd4
	 4hP5APlFMUMgKUagyrt16SEpaF17nGpDX+LrS9Xoz9deXCFUNRdlmyI+uw6vG8k/Nx
	 6uXskPCKFxBCiVDyN/1iVuL86ouenpZ1CAlDl4Tk=
X-QQ-mid: esmtpgz10t1768545404te772ab1f
X-QQ-Originating-IP: 75k7r6Gq8V27pHasklf5IipD4a3hsrabBa/HW+W9tNo=
Received: from [192.168.15.210] ( [223.76.134.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 Jan 2026 14:36:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10946515425787919499
EX-QQ-RecipientCnt: 10
Message-ID: <75B330C7B5DC3241+2e4c56a1-e16e-4e1d-a491-1f5f4bdd2587@uniontech.com>
Date: Fri, 16 Jan 2026 14:36:42 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: usb-audio: Add delay quirk for MOONDROP
 Moonriver2 Ti
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "pav@iki.fi" <pav@iki.fi>, "jussi@sonarnerd.net" <jussi@sonarnerd.net>,
 "roy.vegard.ovesen@gmail.com" <roy.vegard.ovesen@gmail.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: Mr8dvQovIHgZZHXoSsbW1ae3AX9ccSp41nNDC7OGepo41gS4hXtFC+7x
	cig1vaWiqmSCufyopJT8rrACndnqmnEi2tvzZmzX7krX328f2C8WXAf3tbi9vU67XMhf9bU
	b1wkGQGdY6p5ZLR3mMsZTn7GDfXoB74CH7P549WfexlHHr/rimFsGL4xe+K2Esq3V7QzIa2
	lX87rupqSQEYDO+K5TfthKkSK6idAxexqxJEN94jNENXVe08MDaMCEjREHoondJCaxECVqo
	yXVNTLleqDyvU809yd2ZWeldBkUmW+VugmcmWuaS+Cjw5SsYyGLveEAkWBNcEh4QvBBdSMi
	NYVXawrzzbume2rnDuWSkQKJoxJFCKk1VTLz5mpWJjoZMAIA6VVqyL0mdHfabXzuFIJazfN
	cminLeCFsgRa8pBq+5xltNj27NNa3ak3EjmwqG7vJ7BLdmJCc0wcUumZZ8HK9VcCjBlua+U
	IGX9WFRky9bZGeGnvcUvw5Rk2nGzr4Mud32/yly/xvFs5TxVbheXLvX1HemOGjm4WGQhjij
	1aSGXTu/0zmvtEYap5L8pWOaL/VbXRYs3/dBZoUxD07w7hlRsSqfLPoJL7It25EP+EwATDb
	Jo+C0CCGdBVfQQrvPK1YnnhpJ49MQL7h7kKAkTJXIKbtr6T4jPehQUb34yLSl0CpU9jrF2x
	kuahOtUD7Fdwi4dZ4f+T+NxnYDQp0YncLhq4i/OSWrdZZjlBaRV5Z11lJVf7/a2FLK0BPW7
	VM7qKg1zBAa9UIGBHy9pd8MloHntLILQxSop4VDunAFlu8TVx1fowxqPsjBJTkrCX8LRUOi
	EG2Pd2q8xeybj0HwOc3AflehdWLop5UmghVYu2C1pW8WVTG8V3Xv2ZM/CV73kOzOlBO0bAY
	fII3pXojDcXhYMNer50s43fwboGBgdAw9GFDtgjS0hSToe/MtQFO6ToXyeRH1xYLhq3aAwN
	gQk923+hbpM45kZR9cF15zi0Pf/OiYFHdOuG0RL/OcICw147JxKgKQo48iuofsmpzk8f/XM
	Uzz1Og/oOq8hAsmj3GkWukYYTJ21FFbQ4IQDqpWPO/yyxSjC7t+6E7UkSOFSEFJUN7XIemI
	A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0



On 1/16/26 14:33, 胡连勤 wrote:
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> usb 1-1: New USB device found, idVendor=2fc6, idProduct=f06b
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: MOONDROP Moonriver2 Ti
> usb 1-1: Manufacturer: MOONDROP
> usb 1-1: SerialNumber: MOONDROP Moonriver2 Ti
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> ---
> 
> Changes in v2:
>  - Reordered by PID
>  - Link to v1: https://lore.kernel.org/all/TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com/
> 
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index f38330b095e9..2d9f28558874 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2390,6 +2390,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
>  		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> +	DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
> +		   QUIRK_FLAG_CTL_MSG_DELAY),
>  	DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>  	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */

LGTM

Approved-by: Cryolitia PukNgae <cryolitia@uniontech.com>
