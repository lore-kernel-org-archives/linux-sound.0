Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FF9285073
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142932; cv=none; b=N9HXIHP09l1PmJ0pKlJ/1BjCkBkT97BbuWuXUiD7ydWnBf8nxxBA88KjHDIq5lB/1vb7G+aqtiCIrV2JqZLNdKR7PcaMg/kSClp04t1HnJZGHQ6E59JiGjRaKQbLcyasjArKFbL2Pgg6vRpZQPFF6/OjrKrZtCiMNcv1wTQYjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142932; c=relaxed/simple;
	bh=ag4PlYEHJVXBMjExiZF/9eA9SDDAxehu8HRArbe8HsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCbHuJwSZ38PYRQa2aABrjA6/h+zSQNEir5NSfRAAlq4MHlF3P9C3u06JWAAg+tWbPNPzIY7GuntvE+SLTT5MG77A2HxP2GJmLHg94vcqRy7Pogknj7yJrLfid1/X1C4nItJPTG7kj0Fw2EMs7PiRrOY8q0BWeZOHWFMr3HixAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=MK3yVtKK; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="MK3yVtKK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KRer33WZ0RAzpDFjvzKWKTuRqEhjPSbisxW0Rfo+AeE=; b=MK3yVtKKXabs6gCcFZ/9S3UNs6
	8ioitssf5eQRt+lCFNuQ4+8gsvQaVNnVSU+xdrdsqH3rgM8LDFA02rS4Dt5ck/2QwB9XesheBj6Zg
	JNmmK9p2W/GeJv8MAASxUz5gh+zclaqNZvgNp1VZRYrwgtognvo7X/WuIZX61nW0OyqfVUiLF75Fn
	EOU7Nhbz5SaaPlXGr2dJS5x8c8zTBn+zjL5mKq6UcIvXVP+FhtjfMU9eBvLkdKMNXR0QtAidYE0yt
	xVgAgtRQXIKzr9zJ7NY1bAUkS41DOf5rEviAKM0rNSUi/vLXSkqlsAMmCJPurYp5YvUFygovFFgs8
	30KIX9EXbaa7LYJ/JBH9SuTClQQbZpdq8oZi1f/0WSHfLEXKVUgYEeSA19FFI0Jw21jBlc/ei04jO
	m+Fzbbu+Ygg5zcx3ilZc3kSOCRWldL1TaRCOxbjJ3VUGYMfsD8wrodMf5JWIKsdhAxCeQ/4y7C90u
	lIuBc6FPyAzZ+qQo6RVSpx6yEiQ8LiQA6IB+BLuVZveyNAXhxWgisXPm4ZyfFCSNpNTEpBIiuR4Gu
	BQbNUoOsu8r1PBpwYhiaK0v5vCPgG5fPGZxks7CQCoXYEtLWzd65gZAvXXzhSHFHSLZ5VjgyWsOgz
	giAVjMRZi7dCly5UeK6yCstKSCdp8yIYe1qu9ru7g=;
Received: from [2a02:587:6a0c:9900:f7ed:bcf0:918c:fb30]
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1vOAAC-00000002XIP-09TN;
	Wed, 26 Nov 2025 09:42:08 +0200
Message-ID: <8f399da6-4318-41df-a38c-13b226f45fef@tasossah.com>
Date: Wed, 26 Nov 2025 09:42:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement jack detection for HP Thunderbolt Dock G2
To: Cryolitia PukNgae <cryolitia@uniontech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Jan_Sch=C3=A4r?= <jan@jschaer.ch>
References: <20251126003805.2705503-1-tasos@tasossah.com>
 <84FC3BDF7EA9F69A+14dcb273-e661-49b7-8609-020c3cf79eb7@uniontech.com>
 <74e957bb-95f9-428f-92f8-ad6fcb4becba@tasossah.com>
 <8E36970AA2645815+2ca6c6a0-7492-4636-84af-52c5cea87fdd@uniontech.com>
From: Tasos Sahanidis <tasos@tasossah.com>
Content-Language: el-GR, en-GB
Autocrypt: addr=tasos@tasossah.com; keydata=
 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
In-Reply-To: <8E36970AA2645815+2ca6c6a0-7492-4636-84af-52c5cea87fdd@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-11-26 07:40, Cryolitia PukNgae wrote:
> 
> 
> On 26/11/2025 11.36, Tasos Sahanidis wrote:
>> On 2025-11-26 04:58, Cryolitia PukNgae wrote:
>>>
>>>
>>> On 26/11/2025 08.29, Tasos Sahanidis wrote:
>>>> This series adds jack detection support for the HP Thunderbolt Dock G2.
>>>>
>>>> The first patch modifies the existing realtek quirk for the Dell WD15/19
>>>> docks to allow changing the commands/algorithm used for jack detection.
>>>
>>> Does the HP Thunderbolt Dock G2 use a realtek chip?
>>
>> Yes, it does. When plugged in, it loads RtUsbA64.sys.
>>
>> Looking up a teardown online, it appears to be an ALC4102, however I
>> could not locate any public information about it. The only other Realtek
>> IC in the dock is the NIC (RTL8153).
>>
>> lsusb doesn't reveal much, either:
>>   idVendor           0x03f0 HP, Inc
>>   idProduct          0x0269 USB Audio
>>   bcdDevice            0.17
>>   iManufacturer           3 Generic
>>   iProduct                1 USB Audio
>>
>> I am unsure if this is an HP specific jack implementation (in firmware)
>> or if Realtek changed it for some devices.
> 
> The ALC4102 is widely used in a wide variety of devices. As far as I know,
> this chip has programmable firmware that allows downstream manufacturers
> to customize its behavior. I'm curious to what extent this jack detection
> implementation can be generalized to other devices that also use the
> ALC4102. Perhaps we can examine its behavior under operating systems like
> Windows? Does Windows have a similar jack detection function, and is this
> function provided by HP or Realtek's driver?
This was implemented by observing the driver's behaviour on Windows.

The driver is provided by Realtek, not HP, however the inf contains the
HP ven/dev pair. The generic Windows USB driver does not support jack
detection. It only works with the Realtek one, which you can find by
searching for "VID_03F0&PID_0269" in the Microsoft Update Catalog.

Unfortunately I do not have any other devices with an ALC4102 to check
if this works against them. I believe the only way to tell if it can be
generalised is to observe what happens with other devices (by other
vendors integrating the ALC4102) on Windows. I would certainly not
enable this blindly.

It is worth noting that the Dell Realtek detection is considerably
distinct (4 byte vs 1 byte Control buffers, different bRequest and
wIndex, no waiting for mic sense to return a result).
