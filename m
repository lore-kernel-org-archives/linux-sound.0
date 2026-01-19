Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EC2DA768;
	Mon, 19 Jan 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809253; cv=none; b=NTPnLqIO4nxK/+af4DCEC8JnQuwDet1eMnn+RTidJ+LeNe1ZBJvU3esLNUn2Mden5sJDodRDRW/t6UzH+2nBH3TLZzvWoMyck6hM4rCTPL6Z483z+N4T8tbO3zVOBJjmSDn93rmW/kzrl3Uhax2EHVN3mDqMay4tDiRcLp62qyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809253; c=relaxed/simple;
	bh=mw1QWBHQVhstTrmTL1Hn9KimJbRssRQzoItWSrKZx/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfXfSjFL5pN0Ca5mJCtoNSKDWVAKJVZ/0qMKIbnhzKHrVFvdz+FRqdM1PGdH1iVAd5Qo7R/5o9/EdQQ3w33DFbzMi20nN9PLSwpDvCkGRPLkeaNCw2nXOYGFWR1S08OFFRzFEYPz91ehjr81ATDoVm/l6Cb1UTO6WmjN+XD4etY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=D91jJG9B; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="D91jJG9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768809183;
	bh=yAqqdL3xpYwD9LXUs2zM/vma3AKZjzmMCYfG+tGp5tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=D91jJG9BOcTZzDfGJLY6tg3nu3Ys5gc5X2xBFxmUuPFIi6OAyVU+0ar26ftjFbT/8
	 jlu7fvnes1mVZ1q84zn/H4qrI5atMu8bOc0J99xkUxZW8ctexa2AbysrdaBj5oXTyA
	 U7Jk/B9iRyn+EKI75aJMg2wKTK7cPfye7fePDQ2s=
X-QQ-mid: esmtpgz13t1768809180t6c07192d
X-QQ-Originating-IP: 5ugahkIOki0cFfEm8e1xJttH7oblmRMLPrKClIlboe0=
Received: from [192.168.15.210] ( [223.76.134.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:52:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12286561571373342893
Message-ID: <B03F6E13BE49922F+fdcc20d7-4c85-41ac-8c0f-d1bd1016b4d2@uniontech.com>
Date: Mon, 19 Jan 2026 15:52:58 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: usb-audio: Add delay quirk for MOONDROP
 Moonriver2 Ti
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "pav@iki.fi" <pav@iki.fi>, "jussi@sonarnerd.net" <jussi@sonarnerd.net>,
 "roy.vegard.ovesen@gmail.com" <roy.vegard.ovesen@gmail.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <75B330C7B5DC3241+2e4c56a1-e16e-4e1d-a491-1f5f4bdd2587@uniontech.com>
 <87o6mtd4na.wl-tiwai@suse.de>
Content-Language: en-US
From: Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <87o6mtd4na.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: ObnZ7lQEDLTRGCP2LLi2bRT8nT7sB2mklvKpPrKlf78yDw9ahMGcFgWo
	gdiyEeAvmavGjskgdJdW1YwoUP0fixT6O68VQZ02+0Ki5KwAbW3qHYBVgj55AeNJOy/DB/T
	ZNA98tVeeulxr+rUsVE2TA/biYNK72kPTklUl+dD8hqiQbFvH+0fguVoaN67pKkMy13YIno
	CeyJh9o5RmKV02/XevxOUd77eWk5E20wfcjW6+xSK3QlVF0JqJcbRGM/pX8bD8Sn5lOM+C3
	iQRRX26NwBi1aHPZ+7lZiImb4ng1jIVtrmDgZ4wsW32Ij7YbEok0IMUH9093xvbiK33ByrN
	lkZCeDfrcnZSScWCa6+aT361aVcEHtfJdcmj3GEFij9hEn73wAfjnkd+N/2TNecIq0sykt7
	pAgZLV7kw245qrjgLeP0Dfb6aTHjhV3jcK5Y3L/APAv9GdmzQSdDRocg07NeV2w4k19WlyF
	qs75URH9cJKj+GvvN0CZRxYOnWYuOEpkMJ2QU256grbz6iQ848atV/9Dg7lk/Gtvmk7Aohy
	krdVEJB4SyYAIn99A2P9alQv54GRpUop2jtAZ4exV7GClEUrXVFfyvb/Yr8ppjnebC9TH+r
	X4ScCtsKdt/72xv8yKp1myVJHUZWpSZ7ncBR7FokXrgIAmNc4SBVQ/ZSdMEfqY+zsXYQzFf
	g0jiEX/XQZw9lmvse/GRG60olnMSV+Iq9hiW/DUs3827BeOvRpJaygPL7nG+YsmEqUCVy51
	rao/yB70LDIQwTs2nvHLFA1yb7NRBuebXE9uHG8f2fEgdOHe64xpmayQ9obAi7ZTDG7W/L5
	TrODuyQBNZootOiBX5tsVp8O/GyRrkdEiLv/upPGPGUvt/h9rE3HrObAgH8OLS+os2veHuo
	ADStkhxveNS7xrCM/RcEGVd6VoqW0Ob6xY5JqR9s9NA4Xx4GFwNKgVKKwv3JkNPrdgGBswV
	qtmo/v265bORJkJLgfaVUs1AD9VuiwX/oy+0IlxQOfgAg2VoeKhwOLp8su0o88Jr9+T0tER
	5ZLkc8gAa4b0nwp2/079SGSVunLgH7W9Bhovn0+A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0



On 1/16/26 22:16, Takashi Iwai wrote:
> On Fri, 16 Jan 2026 07:36:42 +0100,
> Cryolitia PukNgae wrote:
>>
>>
>>
>> On 1/16/26 14:33, 胡连勤 wrote:
>>> Audio control requests that sets sampling frequency sometimes fail on
>>> this card. Adding delay between control messages eliminates that problem.
>>>
>>> usb 1-1: New USB device found, idVendor=2fc6, idProduct=f06b
>>> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>> usb 1-1: Product: MOONDROP Moonriver2 Ti
>>> usb 1-1: Manufacturer: MOONDROP
>>> usb 1-1: SerialNumber: MOONDROP Moonriver2 Ti
>>>
>>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
>>> ---
>>>
>>> Changes in v2:
>>>  - Reordered by PID
>>>  - Link to v1: https://lore.kernel.org/all/TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>
>>>  sound/usb/quirks.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
>>> index f38330b095e9..2d9f28558874 100644
>>> --- a/sound/usb/quirks.c
>>> +++ b/sound/usb/quirks.c
>>> @@ -2390,6 +2390,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>>>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>>>  	DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
>>>  		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
>>> +	DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
>>> +		   QUIRK_FLAG_CTL_MSG_DELAY),
>>>  	DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
>>>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>>>  	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
>>
>> LGTM
>>
>> Approved-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> I guess you meant Reviewed-by?
> 

sorry for the mess

Reviewed-by: Cryolitia PukNgae <cryolitia@uniontech.com>

> 
> thanks,
> 
> Takashi
> 

