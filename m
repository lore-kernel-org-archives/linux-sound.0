Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF707A92E;
	Fri, 16 Jan 2026 06:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768543727; cv=none; b=TNKg7TOBmBqgscPTPilOxtagyJ2UQlXqzYrvdv7e9gdNZpSKXFmqidg01fgnMGedFcrRcfvoa2hLSsyESFNB8GrhPWJtKRl7IhsTvNNrqzP8TsophpmjzpKpqUtN7b00OWgmzQmeGPmSjAu5cqvQa7si+/OKvTbQKIgYeN+Chdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768543727; c=relaxed/simple;
	bh=p1c2yTAvba4VBidIG34pwyfpSGKrhjglCeRwixlUl60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQiTbYZrmZy4z7QL0hcu6I1df8ZQq8kj3iNl/HLZh3kgSiiuoXw7Wjk30i+8d/ul8XiF37yuWrjorsZYkNgVZrgEZdWLisqvkRCkDNsQ8eWNCJ5Q+VTu48MafdlhJ7QBl0qeHt156zn7nRt/ARgIfHilHKfsQSVisE1J+ABl3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nZujVOUH; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nZujVOUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768543649;
	bh=2Jc2uwrQlp2HkAFBya7HKzLmmZADHMMM5BsFXvSawKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=nZujVOUH80jwqRF8C0U0EYL6kul8f8se5ocw+Z7mt+e1KJK/4HLXV5JUkNNsAI7TZ
	 uuvGwGVN6+XIuxBXLaEh0mmyl632y3qRi//3oWCbcwiawl7zZU/dDji76s2mUe8iit
	 MEWUFRYvj321+SZp+jebZkqv2pGedttA+DYe8ezM=
X-QQ-mid: zesmtpgz1t1768543646te5b10d0a
X-QQ-Originating-IP: d2uXSe95SxgNfOki9M7/Cc8nIEKe8EKXlBGqaAzLuoA=
Received: from [192.168.15.210] ( [223.76.134.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 Jan 2026 14:07:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12118712819633790812
Message-ID: <0FCE737713CEF540+3c332023-e0be-4742-8f8c-f2ad09e8c99b@uniontech.com>
Date: Fri, 16 Jan 2026 14:07:24 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "pav@iki.fi" <pav@iki.fi>, "jussi@sonarnerd.net" <jussi@sonarnerd.net>,
 "roy.vegard.ovesen@gmail.com" <roy.vegard.ovesen@gmail.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MzaucrMAxYhd4KNIoxiLbSCdCIORcj/0Oz55nkuu7bu0T7e3m4mOHa9a
	XkQ3e+S6eTQZ/93Jhy9fjn9+rE8JNDjXFjsqjr4uLww1MSomBNj28ictjTnSrTfkXTLndMV
	7JzG/MDdFydW0DxvlLUZzFmKx5/zlEpMNfyF15782Zu2ZeidsHRS9zpjO9/5OlvQUZ9iMUQ
	upBfoFyhNdIIFmXlAJ+IKxUr8LT/KAbHVwfQZgo8ULRewilmQP7FH0XG0n5w9pwVziDs2sq
	xnjBn/B6aiWFkK72JgMuF716Tt9WOcuJ1mISYzKv35KU+OpJdGDYnNWUD7/GWd+/B87xmVx
	fZFUyTbwcGSFrhx8t1w3waiD1pdD7WoMZ3Sw7p/rl+bsXRZC4SrNEU+t0zbJjE9rB0tLNAY
	O15uryq8CAV001jDMV2EiqcTetv904zCHw6qcI0EWI7Q5POzaNGhblRwUbymiR5x1UkaWqu
	DyPOxovsONSs+yqh353qA9CYQlvlR0xiO4LKbPXgeiCP8XVBB+uK2ucvvl2RS5XhRMgn4ad
	SteLlHYttcg7FB25LThx+W27MElJ0hSdZSM9qcisnKINkRTQJXU9Ca00qrETDj/OqOf22KI
	rhjdVXwHvDqaI/IEbKl0jUt1jgN621htuDUUc+FZ8FW6AjZDipQst2Tfa5IJg+pHGYrYIW8
	f3ASc5Jm8UWEy+8RGXspL/cySBacPd35s4Ung8AH4b6oAygEDWPARBcD7zRs6ivbQwToQNB
	CtScn3fpFhhjwAMWJneSTbxn/aLBM4dLo1TnoG3KJ0t/wHJTRFLFe1zvvhjBG53xgjb9na/
	brdcob9h0hkhz4T/vbvgfYAfupj88xf1AmSAKljb7ocxJbSc4nVMyGp0UzOsVp1gk/mTAQZ
	HzyyTZ0FSOmB718M9SGO9kEAVftjXPsrLZ60G/vRcnL7FCw504z4U/wV6qNKsIIW/U1iunn
	yyuT/J1+SaEBXUQfYxrt5NVm2RKIikW0m+hNYgwGpaBwUpKlg6L+hC3WqsaGQivMIcD1YHR
	uJjzIRwA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0



On 1/16/26 12:03, 胡连勤 wrote:
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
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index f38330b095e9..2c51b58a5f15 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2392,6 +2392,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
>  	DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
>  		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
> +	DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
> +		   QUIRK_FLAG_CTL_MSG_DELAY),

please keep it sorted, should 0xf06b be above 0xf0b7?

thanks

>  	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
>  		   QUIRK_FLAG_IGNORE_CTL_ERROR),
>  	DEVICE_FLG(0x3255, 0x0000, /* Luxman D-10X */

Best regards,
Cryolitia PukNgae
