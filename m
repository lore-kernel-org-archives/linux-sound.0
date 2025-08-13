Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452ED3C33
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096204; cv=none; b=iO3R8We5xBvVsmYNgCAM+VwO+3z6bnaprdeL5CE7MWre9BAy14yc9tKeX2V6K6fV1n+vG09p+H69WAeFyo8GRq+jt5N7OhkA+Zr2/lK/u/5teBK6vPyMpcN4IpvTeFFdIO3oTEOarTd6AwOrELmICG79OL88vdMWF2oRqbMbxzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096204; c=relaxed/simple;
	bh=UjOJjpHRh2AuYocWV0p05yr9a0gx9C6rZfnckbIh9u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1sUBj4xcBWtbuYpbQcEcWPXBhUwVg1c+jhyTiBJZoiM8/cAm86UhAJgCs2kRvxVwWP5KQojguE52SlwYZ7l7kuCLXppZ4yNGR+4HX47EcpXbjvS3kd8AHXwhO+AiInUCoQol6gF+p2ENgeFUg1fBkgtkeaJE24rQVZ8xcX6XEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqdY71F+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqdY71F+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55592C4CEEB;
	Wed, 13 Aug 2025 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096203;
	bh=UjOJjpHRh2AuYocWV0p05yr9a0gx9C6rZfnckbIh9u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EqdY71F+7oRNo1p93UIpfX1EzhLOjZTG1+RVOcqvt9uL74E+Rspio1tY2qprEEwMD
	 AKTPCaGHuVxPFQVNwoXmLL7/zsmAQP7g/GXtRX5LZ+LESEiaLFgHDdxUyGZKEuc9Zr
	 fNcXzjJI3eaW3dndVqlNc/HhnaE8m+eAsFLJy2PKiPAiixPKONdQ3+ztbty5wn46f9
	 k1+idimaFexPZ71ueXvOQfRo4psZygROMa+HISr/yTz01bhnuaX5t7rd3Pzyia592/
	 4K3GVfP01TsVVHmr6wE0lAr8wQUTPWD/Tggzi9sohiSYyUNscnlzx3kZ1RF+Z43T8V
	 7CMkiXwFFp6fA==
Message-ID: <960e9d16-9a81-43a0-be60-5cae921785c4@kernel.org>
Date: Wed, 13 Aug 2025 09:43:22 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "ALSA: hda: Add ASRock X670E Taichi to denylist"
To: Takashi Iwai <tiwai@suse.de>
Cc: mario.limonciello@amd.com, perex@perex.cz, tiwai@suse.com,
 Richard Gong <richard.gong@amd.com>, Juan Martinez <juan.martinez@amd.com>,
 linux-sound@vger.kernel.org
References: <20250813140427.1577172-1-superm1@kernel.org>
 <87ms83wbnl.wl-tiwai@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <87ms83wbnl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 9:15 AM, Takashi Iwai wrote:
> On Wed, 13 Aug 2025 16:03:08 +0200,
> Mario Limonciello (AMD) wrote:
>>
>> On a motherboard with an AMD Granite Ridge CPU there is a report
>> that 3.5mm microphone and headphones aren't working.  In the
>> log it's observed:
>>
>> snd_hda_intel 0000:02:00.6: Skipping the device on the denylist
>>
>> This was because of commit df42ee7e22f03 ("ALSA: hda: Add ASRock
>> X670E Taichi to denylist").  Reverting this commit allows the
>> microphone and headphones to work again. As at least some combinations
>> of this motherboard do have applicable devices, revert so that they
>> can be probed.
>>
>> Cc: Richard Gong <richard.gong@amd.com>
>> Cc: Juan Martinez <juan.martinez@amd.com>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   sound/hda/controllers/intel.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
>> index fcf67e97a546a..1bb3ff55b1151 100644
>> --- a/sound/hda/controllers/intel.c
>> +++ b/sound/hda/controllers/intel.c
>> @@ -2077,7 +2077,6 @@ static const struct pci_device_id driver_denylist[] = {
>>   	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1043, 0x874f) }, /* ASUS ROG Zenith II / Strix */
>>   	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb59) }, /* MSI TRX40 Creator */
>>   	{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb60) }, /* MSI TRX40 */
>> -	{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1022, 0xd601) }, /* ASRock X670E Taichi */
> 
> Hmm, it's a bit awkward situation.  I believe this will make the
> problem of the original fix back.
> 
> But, the original bug was merely error messages and memory wastes, and
> the PCI SSID looks also not specific to the mobo vendor, so we can
> start as a revert, but we'd need yet another fix to cover the original
> problem.
> Maybe some additional DMI check.  Oh well.  Such mobo vendors should
> be cursed if they don't assign the proper PCI SSIDs...
> 
> 
> Takashi

Yeah I thought about it too but it's fortunate original issue was just 
messages and needless probing so this seemed like a pragmatic approach.

Thanks!
