Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8633A16AC
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966115; cv=none; b=dEJdNFLYSiyrPrmu45hKhas9ml3PcRjI3zi4yO7nN3lM9PVacwAmyidqSPTyVF2xcLyTNsyALIkhvhH9chPGOavNbCe7UTVNSOsDBVXg1FkWM7gVIzRT/Cy9N0J4ZnEJgut2FICXYKd7S5UyfwA5Lo+bIhqUlqA2YKa3Ru8YW8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966115; c=relaxed/simple;
	bh=V+NhUZ000yDhg745eCeGjhHxJ7fXSlr+Nu5y7Soaqvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVW0B6L1ar5ObkLNU4NBmRqiSMJcJntytLHjjwLGnADDO/tdAI/bjj7eWpt6XISewwPulqLM9IjI6YjM+pO75VW2Bt08yq7yt042C2ULkG709rWq2SZBB3PN9wF49tv29naMn2hDC0Lq0pt0Rtavn5Lf4igJX9sZlfbe6Qx9K2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqacNtCV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqacNtCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D8C1F000FF;
	Fri,  2 Oct 2026 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790966114;
	bh=DEJITFIPaLzKDGbO8m/Ay8pPFOH8cHD0Aa53YFEFNuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GqacNtCVppYWVSP9xf5j0XkdQvUfhFymU6E9O9CJO8jtV7Dcx2znbRN6Mz3Dtmv6v
	 MdCKayI+FEiOPP5kRzvPwTNOEZkX5XhduwdBuhFtjV8bRh6IX35RpdUf98rOny0Wo2
	 Y6gxpjAqIgewiUCDKauvJAsXXrKlT7czrV4FZzy556Cd0J4icyvsJPa4+vIJPUTNg4
	 NSC8AEKpt4L5FfJpPnWT69WzdafEidsJXtIaBEw2K9Q5fJwI5QgAx5oLy2y659pMWD
	 +mdOW8JvofDlSBXEoDlXmpdW5sjkNCfculmf/Hpe6eGetn5hDNAV8CwRJjU1TS4pCa
	 fRom3N2YpCAKA==
Message-ID: <1b7c3c98-5fbd-40f1-9fb4-61403615c51d@kernel.org>
Date: Fri, 2 Oct 2026 19:35:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Arun Raghavan <arun@accosted.net>, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz> <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <8733uoys02.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks Takashi,

On 10/2/26 5:41 PM, Takashi Iwai wrote:
> On Thu, 20 Aug 2026 16:31:48 +0200,
> Takashi Iwai wrote:
>>
>> On Thu, 20 Aug 2026 16:02:45 +0200,
>> Jaroslav Kysela wrote:
>>>
>>> On 8/20/26 15:34, Takashi Iwai wrote:
>>>> Hi,
>>>>
>>>> a few people including Mark and me have talked about holding a small
>>>> meeting for the Linux audio stuff (finally again!) during the next
>>>> Linux Plumbers Conference (on Oct 5-7 at Prague).
>>>>
>>>> Has anyone already planned to attend there and is interested to join?
>>>> If we have enough people, we can try an official BoF session.
>>>> Otherwise, we can just have an unofficial session at lunch time or
>>>> such, too.  Just let us know.
>>>
>>> Hi,
>>>
>>> I will be attending Linux Plumbers and would be pleased to participate in
>>> a BoF session or another type of meeting.
>>
>> Awesome, looking forward to seeing you again!
> 
> So, the conference will be opening on the next Monday, and we still
> haven't planed yet -- business as usual :)
> 
> I put people who showed interests in Cc.  If more people are
> interested to join, heartedly welcome!
> 
> If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
> AM/PM), let us know.  Or, since there aren't so many people, we can

I have a talk at on SDCA and Devicetrees at "10:45 AM - 11:05 AM" on
Tuesday 6th Oct. I would really appreciate if yo can avoid that 20 mins.


--srini

> just have a lunch or dinner meeting, too.  If you have any preference,
> speak up, please.
> 
> 
> thanks,
> 
> Takashi

