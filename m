Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B973988FF;
	Wed, 15 Jul 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127259; cv=none; b=clCW3vxfyJK/8M9qgx56ORyRdLDBeus9QC7MC+RxPj5xpzb1Egr1O2LFY+aoRZlK5TnEMwi7GTEGlyBCsoSGz9UNiadmkhupfC9OTnV9aNg5aeCNpcHsDWKQqFgPlvcB5ZDGw0gvioYyMenWr4c4ovmYl/1Qg9xCDtiC4bpmfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127259; c=relaxed/simple;
	bh=dY0Xl20ZyaZgnYQYdfKCGalQh/19ov4i60FmtmkQaQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNKDEDvtOB9z91d3bRvzezBI9jy6Er1DBhRvdCcrhqliQjLI2/jFgDEYaHNPKXOXjA5hXVjNmEOKohIfPjeJLhrlAVbVI/KayFHZFJ3SChFBaOzOPq0USa9Ce7G7tgYFcBSmZk8bF03eFoVFcH+PhhM791UOIowalRZ6IXV5eR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RVhB019p; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RVhB019p"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 17BFE9D8B8;
	Wed, 15 Jul 2026 16:54:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55yhe2e1cq_C; Wed, 15 Jul 2026 16:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784127244; bh=dY0Xl20ZyaZgnYQYdfKCGalQh/19ov4i60FmtmkQaQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RVhB019p4syHvEY6j43I2DmedtyhGBnzB+IywDvhuBURjihPRD6AE5qAZt/wcxv5G
	 26/OjfV/CMMzLwTgecm9eNXZuRH//MkfLiJE49D2B9wsimfGg4BS4kBWq08NB9IFl7
	 AosLYEWoPG0ooctB0zOptWXFRBoANARLSo2c6uYrZ/WcNXio1w8omnxRnDjT0PBPf6
	 xdz1MVWgMkTXvyKDfBLmB18CnK/F81Dy09aeJqEdB+hpMnCXp69PxOlGC9AZk420XZ
	 /EeEXIOc7EH8OuKY/+YqU/9B0V6JGSi65bXoqjj/MzkHOchmZ363zYu9+HBiPi9h2n
	 DRzXD+QhZoMmw==
Message-ID: <085da715-1e44-42d8-9608-c321598aba72@disroot.org>
Date: Wed, 15 Jul 2026 16:54:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
 16-bh0xxx
To: Takashi Iwai <tiwai@suse.de>,
 Stefan Binding <sbinding@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260709214414.8461-1-skbotnl@disroot.org>
 <87pl0owccc.wl-tiwai@suse.de>
Content-Language: en-US
From: Sven Jans <skbotnl@disroot.org>
In-Reply-To: <87pl0owccc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

For what it's worth Stefan has confirmed that there is an issue with 
this laptop here: https://bugzilla.kernel.org/show_bug.cgi?id=221185#c11
The mentioned bug report 221479 is mine 
(https://bugzilla.kernel.org/show_bug.cgi?id=221479).

On 15/07/2026 16:34, Takashi Iwai wrote:
> On Thu, 09 Jul 2026 23:43:53 +0200,
> Sven Jans wrote:
>>
>> The laptop has a malformed _DSD which causes the cirrus,dev-index
>> property to fail to parse, so it needs to be supported using the
>> configuration table.
>>
>> Signed-off-by: Sven Jans <skbotnl@disroot.org>
>> ---
>> Resubmission, discussion of the previous submission stalled.
>> The values are equal to the values reported in the _DSD.
>> You can find my ACPI dump to verify here:
>> https://bugzilla.kernel.org/attachment.cgi?id=310050
>> Link to v1:
>> https://lore.kernel.org/linux-sound/20260506181807.22547-1-skbotnl@disroot.org/
> 
> Stefan, is this also one of models with odd firmware?
> 
> 
> thanks,
> 
> Takashi
> 
>>
>>   sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
>> index 416d7bf3e289..e14a87336478 100644
>> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
>> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
>> @@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>>   	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
>>   	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
>>   	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
>> +	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>>   	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
>>   	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>>   	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>> @@ -511,6 +512,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>>   	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
>>   	{ "CSC3551", "103C8CDD", generic_dsd_config },
>>   	{ "CSC3551", "103C8CDE", generic_dsd_config },
>> +	{ "CSC3551", "103C8E60", generic_dsd_config },
>>   	{ "CSC3551", "104312AF", generic_dsd_config },
>>   	{ "CSC3551", "10431433", generic_dsd_config },
>>   	{ "CSC3551", "10431463", generic_dsd_config },
>> -- 
>> 2.55.0
>>

