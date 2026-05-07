Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E542F532F;
	Thu,  7 May 2026 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172841; cv=none; b=hoaYGvYP2gGB8x96jrGvKNFnIZvQSggr5OXgwTfN3pe8NEQX7UOlI86aNpOGW+IOdeDRi29N2WNFXoRKMVNaMKEjacL0ud9RnKYoGCsginEAAKwyKqrvqdTcrL2Nofk6k7uiF7ODfA2BzncfHMkDBtgFwm7WxwqfZrLcbI/mvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172841; c=relaxed/simple;
	bh=6HH/sXmrehflOPWBNfR+fOiBJdd68A5+qeK+SEGMDzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWbnlHYNHll866fljkwuifn3ajKJM1aXmwIv+LsUhp9xvQZJ0p7T4EIND0PcPmaiyVsuM//zcz8v2KEK3Z7jp6HeOvjy9Owd4HmZOle8wlQEWsir1mRjn4xvguzPWqiS1bQXBfdSmDjxlcS83JLyEfaMFOpy7VSatEPc6og7ggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RLbO+SSB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RLbO+SSB"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6B8C3266FA;
	Thu,  7 May 2026 18:53:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTVy4VpmB9OI; Thu,  7 May 2026 18:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778172836; bh=6HH/sXmrehflOPWBNfR+fOiBJdd68A5+qeK+SEGMDzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RLbO+SSBq/IKqZAzi8KugWK/R+kdHCf3vWRtz59k3BiKiQ0OzaYMaVrQT56FEgqh0
	 FEhrmLGU9EOOq0Yak3y7kyA6kkbTseESqcyWbaMEaVqt+XdQAuOTQu928ROnmI3xyO
	 2ic5Gm35GIhYJ+qUDLjcuI9SiIMcSu2Um8RDLRrr3C9jF3ULREyhC4RY3xMHu/S6T7
	 Lv9akGPvUpAJ7xWDt8OXdU5y4UmHBqbnGj1YWwUCqQoxPVeOP6GYweDJi1ld2DstLA
	 Ex5G1wsh9v2zA1wAfV9JzVRZaUmzIbULqODOyPVDnEjXI4c2OL4FzcmQ1ebqF4euIl
	 FLwzxJc0k0vig==
Message-ID: <c022442f-111e-4022-bbf5-d084d9ec4f95@disroot.org>
Date: Thu, 7 May 2026 18:53:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
 16-bh0xxx
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260506181807.22547-1-skbotnl@disroot.org>
 <ee73ae76-4caa-4151-ac87-1a2061cd17a5@opensource.cirrus.com>
Content-Language: en-US
From: SKBotNL <skbotnl@disroot.org>
In-Reply-To: <ee73ae76-4caa-4151-ac87-1a2061cd17a5@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I have created a bugzilla ticket.

I do think most values are correct with the ACPI dump I looked at, the 
only one that could be incorrect is the boost type, but I haven't had 
any issues while playing audio using INTERNAL, even at max volume.

Regards,
Sven

On 07/05/2026 18:28, Stefan Binding wrote:
> Hi,
> 
> On 06/05/2026 19:17, Sven Jans wrote:
>> The laptop has _DSD but the cirrus,dev-index property fails to
>> parse, so it needs to be supported using the configuration table.
> 
> This is quite odd. As far as I am aware, this laptop should have valid _DSD.
> 
> I don't think some of the values in the table are correct either.
> 
> Please create a bugzilla ticket at the below address and CC Cirrus Patches (patches@opensource.cirrus.com <mailto:patches@opensource.cirrus.com>) to it, we will investigate the issue as soon as we can.
> 
> https://bugzilla.kernel.org/ <https://bugzilla.kernel.org/>
> 
> Please attach an acpi dump and dmesg to the ticket.
> 
> Thanks,
> 
> Stefan
> 
>> Signed-off-by: Sven Jans <skbotnl@disroot.org>
>> ---
>>   sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
>> index 732ae534db36..a972da0ae4e1 100644
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
>> @@ -510,6 +511,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>>   	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
>>   	{ "CSC3551", "103C8CDD", generic_dsd_config },
>>   	{ "CSC3551", "103C8CDE", generic_dsd_config },
>> +	{ "CSC3551", "103C8E60", generic_dsd_config },
>>   	{ "CSC3551", "104312AF", generic_dsd_config },
>>   	{ "CSC3551", "10431433", generic_dsd_config },
>>   	{ "CSC3551", "10431463", generic_dsd_config },

