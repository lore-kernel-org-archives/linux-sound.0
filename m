Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7623C8A3
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135306; cv=none; b=H0z5sWHnTqyogQRqdKgTjogV2p+FQCq4yMhubfwLmmy4mJbs3VSomOkQ8FkFYBCc8PFMUSjMC/CDBz8sbIQMsREoJQ2j711ClQTBa303jc5nc626Pv97VERkNFMnj0ryWJz7+LSZ/6Y4s+PGni7ygxo0YVXcTuH0XNNL6wMn2Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135306; c=relaxed/simple;
	bh=sJya2DljNTgLYto0GBI8DKFohUssAU7pHxuFcSO0qvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a+RUyDli5mIMKZg/JTvz7vf/uMeGe/pM+svf/0jcGpGM5ZZmIRwe1I7qn/r4gKb0IK5NtMqunurBHpeaNVUPN1db5SSJ7gvMQqA6kf/xn9QF7DdpiRjA6INxEcyYnXC+MfwnGP+K7zMiU9Pcyl7AOaCSuAJ0Vr9SEQcNlFdLbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=0l7Ql5cL; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="0l7Ql5cL"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 55CE66B8D;
	Tue, 13 May 2025 13:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 55CE66B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1747134869; bh=HaQ09J1Cd75Um8zAc+4HNQ5dlvG2q3rXUr0wqtTxSa8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=0l7Ql5cLVq2DeQLSG0XPXAQD7ipvz93cZiQY9fHr9BKt1oLngrzGn0uK0PRXRnRY2
	 ZlNalDzu4Rxsv0dAE0pq1iddseIOsi012Td2YOV3XlTI3OmRpQuBfuTc4rOCky/n9m
	 MfeVdhjPHjnXh1qJa07YvgqiEZ0JZXIMryUr+WiA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 13 May 2025 13:14:26 +0200 (CEST)
Message-ID: <3f7c2dec-25d7-470f-b840-8482c8bce48b@perex.cz>
Date: Tue, 13 May 2025 13:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Rename Pioneer mixer channel controls
To: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <franta-linux@frantovo.cz>,
 Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <20250508192223.4847-1-konference@frantovo.cz>
 <87msbjxmew.wl-tiwai@suse.de> <87ldr3xm49.wl-tiwai@suse.de>
 <b9d2ccd0-9b92-4324-bc44-0fb1be5f465e@frantovo.cz>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <b9d2ccd0-9b92-4324-bc44-0fb1be5f465e@frantovo.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13. 05. 25 2:22, František Kučera wrote:
> Dne 11. 05. 25 v 16:23 Takashi Iwai napsal(a):
>> On Sun, 11 May 2025 16:16:39 +0200,
>> Takashi Iwai wrote:
>>> On Thu, 08 May 2025 21:22:23 +0200,
>>> František Kučera wrote:
>>>> From: František Kučera <franta-linux@frantovo.cz>
>>>>
>>>> so alsamixer can show the controls in correct categories: capture/playback
>>>>
>>>> Signed-off-by: František Kučera <franta-linux@frantovo.cz>
>>> Applied now.  Thanks.
>> ... on the second thought, I'm not sure whether the proposed new names
>> are the best choice.  Now we see "Capture" and "Playback" twice for
>> ChX switches (also for Master switch, too):
>>
>> +	SND_DJM_CTL("Master Capture Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
>> +	SND_DJM_CTL("Capture Ch1 Capture Switch",  250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
>> +	SND_DJM_CTL("Capture Ch2 Capture Switch",  250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
>> +	SND_DJM_CTL("Capture Ch3 Capture Switch",  250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
>> +	SND_DJM_CTL("Playback Ch1 Playback Switch", 250mk2_pb1, 0, SND_DJM_WINDEX_PB),
>> +	SND_DJM_CTL("Playback Ch2 Playback Switch", 250mk2_pb2, 1, SND_DJM_WINDEX_PB),
>> ....
>>
>> I guess your intention to make the differences clearer, but still it
>> leaves me some itch feeling.
>>
>> And now I noticed that you've submitted to a wrong list.  The kernel
>> patches should be sent to linux-sound@vger.kernel.org, not alsa-devel.
>> So I drop the patch for now.
>>
>> Let me know if you believe this is the best naming, or if you have any
>> other proposals.  And for the next patch, please submit to linux-sound
>> ML instead.
>>
>>
>> thanks,
>>
>> Takashi
> 
> I agree that the names are somehow weird... (I asked for advice in the e-mail "Pioneer DJ DJM mixers channel names" 2025-04-24).
> 
> I tried to find best fitting names in <https://docs.kernel.org/sound/designs/control-names.html> but this convention fits rather classic sound cards than mixers with many universal channels.
> 
> The "Capture Switch" or "Playback Switch" at the end of the name are hidden in the alsamixer utility and only "Capture Ch1" is displayed. The suffix serves for assigning the control to the correct category (F3 - playback, F4 - capture, F5 - all). And without "Capture" or "Playback" prefix, I will see only Ch1, Ch2 etc. and if I switch to "All" (F5) I can not distinguish Capture Ch1 from Playback Ch1...
> 
> Hope we can find a better naming convention for mixers.

Perhaps something like "Master Input Level Capture Switch", "Input 1 Capture 
Switch" and "Output 1 Capture Switch" names may be better. I guess that the 
channels are (or can be) handled separately.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
