Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74521A453
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739795086; cv=none; b=gmopTXZQHsA8X0FMwzPH0F23Dd0tiOTJTZjJ8xuvXuJ2e43OLOfeSpVa0DdHWRISiheWGvpkEnFdm9WFxZr/GpNWTiYaQBymon9/88I8RjCyYfjHzn7RXJNXRitCuTVhzK923QeLoKwMC2LqAn4OzHeF7WMBRCrmXAGGEfJdY0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739795086; c=relaxed/simple;
	bh=1Rbdw1jo8y1jG8aQWvwWlh7ZxFRiMVFPDdbYfrQQpu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+tvoFCeDYB2C9cLbWlLHF9y2JKouu86jLiC8t5BN9ATbVWh/JT1GNZYxN5Rv1RP7H4nk/g6n6Y4vVdcbx9zWsWgmYJFhzWcmEdm1l8OTlp0y5D6ZFuwdXqMNl+IxLKELN45T6PpFHgYMTb92iYmsTyoW7yFvUIMFroEGCS9uz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pelago.org.uk; spf=pass smtp.mailfrom=pelago.org.uk; dkim=pass (2048-bit key) header.d=pelago.org.uk header.i=@pelago.org.uk header.b=m6dQkMrn; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pelago.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pelago.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pelago.org.uk header.i=@pelago.org.uk header.b="m6dQkMrn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pelago.org.uk; s=mythic-beasts-k1; h=From:To:Subject:Date;
	bh=XKW39DGIEWHkuJRWSZvkjvHZkMxsKoeOekz/TnEzjBs=; b=m6dQkMrn2Dss04Eg2W+lOBxdA4
	Evm6R9zzaKrNX1xlkq5/IKy1gWSEeOVjbvjEmDemF7Wgf9pZVSDbV60sPxITEVvTg8uE5/ebCXCHy
	rLFAI3uEwel7kX8jUkq/+/1bCF0br8zOuIIXyq2VaLnnZZ+4XUhDIZbfN2ltv9By1ZpFica7gsear
	iQCC4LVxxUABmlDwandOKcjtvLO1OGKOQKvWMr/kS1v01ak1ZTowzE53H08wFO7YaYzKUhOb7lCUf
	C3Nd+OkYx9U1hig4YLRLduXV4K+4NRE9ovPa4jYLxvSYgPyB4IBpPLvn7Qx5UqeJB3sJ3TCzvjTws
	Q6TQw/vA==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <john-linux@pelago.org.uk>)
	id 1tjzov-0051qI-Us; Mon, 17 Feb 2025 12:01:54 +0000
Message-ID: <6c69024a-bfd5-421f-8b0d-c0a4543481b0@pelago.org.uk>
Date: Mon, 17 Feb 2025 12:01:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute
 LED
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <5eb4305d-48b2-43a4-a30e-2bbe8d409146@pelago.org.uk>
 <87ldu499nn.wl-tiwai@suse.de>
From: John Veness <john-linux@pelago.org.uk>
Content-Language: en-GB
In-Reply-To: <87ldu499nn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0

On 17/02/2025 09:56, Takashi Iwai wrote:
> On Mon, 17 Feb 2025 00:21:57 +0100,
> John Veness wrote:
>>
>> Allows the LED on the dedicated mute button on the HP ProBook 450 G4 laptop
>> to change colour correctly.
>>
>> Signed-off-by: John Veness <john-linux@pelago.org.uk>
>> ---
>> I have only tested this with 6.13, but I expect it could be applied to older
>> stable kernels too. The HP ProBook 450 G4 laptop was released in 2017. 
> 
> It's fine to put Cc to stable in the patch, then.
> 
> But, your patch seems inapplicable, likely because your mailer
> converted tabs to spaces.  Could you fix the mailer setup and
> resubmit?

Ah darn it! I think this was a copy-and-paste issue. I'll resubmit with
tabs, and CC stable too. Thanks for the feedback.

John

> thanks,
> 
> Takashi
> 
>>
>>  sound/pci/hda/patch_conexant.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
>> index 4985e72b9..34874039a 100644
>> --- a/sound/pci/hda/patch_conexant.c
>> +++ b/sound/pci/hda/patch_conexant.c
>> @@ -1090,6 +1090,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
>>         SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
>>         SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
>>         SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
>> +       SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", CXT_FIXUP_MUTE_LED_GPIO),
>>         SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
>>         SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
>>         SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
>> -- 
>> 2.48.1
>>

