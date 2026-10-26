Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030515;
	b=2TTzdpv7nEMU4b53YPsIXgR25B2p78Ur1kdJQeHyVNZuiIpWWiDDYceTxcNemfBB6eQA
	 HWZiO2RbpdKrhFLiEzAjcNeL2J1nhujlnDdwL6a+LDKpNYp+XLdkS4I2YWQy5yqwQqKvE
	 58LaU5lGwU4UPBsTFfnjH7jsExavocgkHq1+4LVAPE17IV4liIZn8RDHqHDrJROuqn+uL
	 zYvVNo2sWQeidXDHG2Vk11CabZYUVfF/8S8/vtBKUFEQAWIbhyuUTccMXwhQDZlArb1cD
	 QyDDmI4hWuk7NIFA06CdjmJp56YxtSmu9EmN1xdxbUHQztHvy9CYhaQkyt59sNAE1ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030515;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:Cc:
	 From:In-Reply-To:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=YvivNAlWcjP7FM6FurQjzE4VWDGV5JwJY1hc+0F7fHs=;
	b=NIoOzm8E8khKoL6qFElcdPqP2537t+BRcUm4hBU+yanVArVz75J/oZ7GgabXWg4nd0Bt
	 gBFQr6ZlEOXTvbQGeTUgSfpj5lBEI+Y7Mlf388w1iSMcTBbmMBEB2Z1VJaIGimQ6tqrD2
	 vmOYVvJ8H4zoKde/th536MQedei1qexmb3ZMHlM8HtnQzTlPk5mkmpPlXHiB28VJs4EuV
	 4OveH+nwkrjx8OCTlg4CfqqpNoUwt41KSBKUS7fFy9dcxprXTABsmHvx0tz6DTEpfPp3Y
	 PITk+mNAIuuzlacVaSq+j1CRznof0LxvPVqxdmB1mPKe1ZLQwY0x1PospQFAV8QxANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.tugraz.at;
	spf=pass smtp.mailfrom=student.tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=T+48+F+O;
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681F606A33E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 16:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C681F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=T+48+F+O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1793030493;
	bh=YvivNAlWcjP7FM6FurQjzE4VWDGV5JwJY1hc+0F7fHs=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To;
	b=T+48+F+OGR0dxzMUpnQK38ela+CNiOTZ7CHukqMNkKB4vOzUJgjSsV4pta2AJpjfr
	 yMYeaNw86MBDqgSDrd9eY92DytaIXU4zq/8pAj9Fz+yEJZeive/kGBz+GYf91MKZ/Z
	 Ysf9LYt8l04VfynAr//Ea1h7nLKbgDIb5i3NDkqw=
Received: from [192.168.1.197] (public.router.steyrer87.ffgraz.net [193.33.150.55])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4jCyzd24dZz9rxr;
	Mon, 26 Oct 2026 17:01:33 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------6Q0iHdKCrZa4RXfDOnpuhyNM"
Message-ID: <d5dfd044-69f6-4fc3-9884-6599d88afb55@student.tugraz.at>
Date: Mon, 26 Oct 2026 17:01:32 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: MOTU MicroBook II playback fix
To: linux-sound@vger.kernel.org
References: <6690AE3A-5D2A-488D-BB09-1588948491D9@student.tugraz.at>
 <abf3bf13-4f91-4026-89ea-74b5f42ea935@student.tugraz.at>
 <fc46e94ecb01b6f09ad3548e1654d128d74dea03.camel@tsoy.me>
 <1ceb66f2-d5c2-4419-b75f-33afb2f52fbd@student.tugraz.at>
 <e79d259f7a3892aba307b3674b235c53b68e1ed3.camel@tsoy.me>
Content-Language: en-US
Cc: tiwai@suse.com, perex@perex.cz, Alexander Tsoy <alexander@tsoy.me>
From: Sally Marcher <marcher@student.tugraz.at>
In-Reply-To: <e79d259f7a3892aba307b3674b235c53b68e1ed3.camel@tsoy.me>
X-TUG-Backscatter-control: bt4lQm5Tva3SBgCuw0EnZw
X-Spam-Scanner: SpamAssassin 3.003001 
X-Spam-Score-relay: 0.0
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.116

This is a multi-part message in MIME format.
--------------6Q0iHdKCrZa4RXfDOnpuhyNM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
patch is attached to this email.

Thanks,
Sally Marcher

On 10/26/26 2:57 PM, Alexander Tsoy wrote:
> В Пн, 26/10/2026 в 14:40 +0100, Sally Marcher пишет:
>>   From cd7f80a8beaa40bcb2b313586a3c698d35982c21 Mon Sep 17 00:00:00
>> 2001
>> From: Sally Marcher <me@gry.sh>
>> Date: Mon, 26 Oct 2026 14:29:34 +0100
>> Subject: [PATCH] Add correct datainterval in the quirks-table for
>> Microbook II
>>
>> This patch fixes playback issues on the Microbook II.
>> The correct value was in the older driver for this device
>> (
>> https://github.com/manuel-rhdt/snd-microbookii/blob/dd304c097bb6a9d522
>> 76ac29c6969fa02bc7674a/audio.c#L914).
>>
>> Datainterval needs to be set explicitly.
>>
>> Signed-off-by: Sally Marcher <me@gry.sh>
>> ---
>>    sound/usb/quirks-table.h | 2 ++
>>    1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
>> index 71444c2898b4..ac7861c3d26c 100644
>> --- a/sound/usb/quirks-table.h
>> +++ b/sound/usb/quirks-table.h
>> @@ -2781,6 +2781,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>>                        .rates = SNDRV_PCM_RATE_96000,
>>                        .ep_attr = USB_ENDPOINT_XFER_ISOC |
>>                               USB_ENDPOINT_SYNC_ASYNC,
>> +                    .datainterval = 1,
>>                        .rate_min = 96000,
>>                        .rate_max = 96000,
>>                        .nr_rates = 1,
>> @@ -2803,6 +2804,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>>                        .rates = SNDRV_PCM_RATE_96000,
>>                        .ep_attr = USB_ENDPOINT_XFER_ISOC |
>>                               USB_ENDPOINT_SYNC_ASYNC,
>> +                    .datainterval = 1,
>>                        .rate_min = 96000,
>>                        .rate_max = 96000,
>>                        .nr_rates = 1,
> Hi!
>
> You should send this path to linux-sound@vger.kernel.org and CC
> mainterners: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
> <perex@perex.cz>
>
> Also your email client garbles the patch. For example tabs are replaced
> by spaces. If you cannot fix that, then it's better to just attach the
> patch as a text file.
--------------6Q0iHdKCrZa4RXfDOnpuhyNM
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Add-correct-datainterval-in-the-quirks-table-for-Mic.patch"
Content-Disposition: attachment;
 filename*0="0001-Add-correct-datainterval-in-the-quirks-table-for-Mic.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjZDdmODBhOGJlYWE0MGJjYjJiMzEzNTg2YTNjNjk4ZDM1OTgyYzIxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTYWxseSBNYXJjaGVyIDxtZUBncnkuc2g+CkRhdGU6
IE1vbiwgMjYgT2N0IDIwMjYgMTQ6Mjk6MzQgKzAxMDAKU3ViamVjdDogW1BBVENIXSBBZGQg
Y29ycmVjdCBkYXRhaW50ZXJ2YWwgaW4gdGhlIHF1aXJrcy10YWJsZSBmb3IgTWljcm9ib29r
IElJCgpUaGlzIHBhdGNoIGZpeGVzIHBsYXliYWNrIGlzc3VlcyBvbiB0aGUgTWljcm9ib29r
IElJLgpUaGUgY29ycmVjdCB2YWx1ZSB3YXMgaW4gdGhlIG9sZGVyIGRyaXZlciBmb3IgdGhp
cyBkZXZpY2UgKGh0dHBzOi8vZ2l0aHViLmNvbS9tYW51ZWwtcmhkdC9zbmQtbWljcm9ib29r
aWkvYmxvYi9kZDMwNGMwOTdiYjZhOWQ1MjI3NmFjMjljNjk2OWZhMDJiYzc2NzRhL2F1ZGlv
LmMjTDkxNCkuCgpEYXRhaW50ZXJ2YWwgbmVlZHMgdG8gYmUgc2V0IGV4cGxpY2l0bHkuCgpT
aWduZWQtb2ZmLWJ5OiBTYWxseSBNYXJjaGVyIDxtZUBncnkuc2g+Ci0tLQogc291bmQvdXNi
L3F1aXJrcy10YWJsZS5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MtdGFibGUuaCBiL3NvdW5kL3VzYi9x
dWlya3MtdGFibGUuaAppbmRleCA3MTQ0NGMyODk4YjQuLmFjNzg2MWMzZDI2YyAxMDA2NDQK
LS0tIGEvc291bmQvdXNiL3F1aXJrcy10YWJsZS5oCisrKyBiL3NvdW5kL3VzYi9xdWlya3Mt
dGFibGUuaApAQCAtMjc4MSw2ICsyNzgxLDcgQEAgWUFNQUhBX0RFVklDRSgweDcwMTAsICJV
Qjk5IiksCiAJCQkJCS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzk2MDAwLAogCQkJCQkuZXBf
YXR0ciA9IFVTQl9FTkRQT0lOVF9YRkVSX0lTT0MgfAogCQkJCQkJICAgVVNCX0VORFBPSU5U
X1NZTkNfQVNZTkMsCisJCQkJCS5kYXRhaW50ZXJ2YWwgPSAxLAogCQkJCQkucmF0ZV9taW4g
PSA5NjAwMCwKIAkJCQkJLnJhdGVfbWF4ID0gOTYwMDAsCiAJCQkJCS5ucl9yYXRlcyA9IDEs
CkBAIC0yODAzLDYgKzI4MDQsNyBAQCBZQU1BSEFfREVWSUNFKDB4NzAxMCwgIlVCOTkiKSwK
IAkJCQkJLnJhdGVzID0gU05EUlZfUENNX1JBVEVfOTYwMDAsCiAJCQkJCS5lcF9hdHRyID0g
VVNCX0VORFBPSU5UX1hGRVJfSVNPQyB8CiAJCQkJCQkgICBVU0JfRU5EUE9JTlRfU1lOQ19B
U1lOQywKKwkJCQkJLmRhdGFpbnRlcnZhbCA9IDEsCiAJCQkJCS5yYXRlX21pbiA9IDk2MDAw
LAogCQkJCQkucmF0ZV9tYXggPSA5NjAwMCwKIAkJCQkJLm5yX3JhdGVzID0gMSwKLS0gCjIu
NTYuMAoK

--------------6Q0iHdKCrZa4RXfDOnpuhyNM--
