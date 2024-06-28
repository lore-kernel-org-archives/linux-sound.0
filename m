Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9AC1581F3
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576640; cv=none; b=tTvAVa9sO7cSjr4VBX0/wiptfUBrw4PCtO6EYTtn0kW7MVvqa639kKClwd0nilsICYXPIvrvR3Ky2NFr2TsOzWsCsBLgjdtRbvZvznvesTvogujmNOdfra2xD5GkndTtq97zSfF9SotPNN9b6aawzkPybtNsF8JPUeOoPBdNIGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576640; c=relaxed/simple;
	bh=TpsyjuhUgCHQKSSZSg7cuIwHP/180fUv/mHIwMdrzuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8BpZ8DGoL0zjIom8qjD1kpePo08TDfCV3qDsmgrdlXWe8l6/wSf9PldR8heYOrXJIdeJFytovf+h/Z5WwenjGlwi3jW/8TpE0Fs9yHBmIDqyc/vLrsEKcjzsLeYhkK85NK4sWukkyevSTmYBEpNUedFwNM416ETbhfX3ckybPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CD3F161E5FE01;
	Fri, 28 Jun 2024 14:10:23 +0200 (CEST)
Message-ID: <455ad25f-e6f8-4574-8fe5-35d3c62161f8@molgen.mpg.de>
Date: Fri, 28 Jun 2024 14:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell OptiPlex 5080: `Unstable LPIB (352800 >= 176400); disabling
 LPIB delay counting`
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <a653c2f1-9095-4b21-aa22-c26504ef3efc@molgen.mpg.de>
 <87pls1b898.wl-tiwai@suse.de>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87pls1b898.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Takashi,


Thank you very much for the prompt response.


Am 28.06.24 um 13:45 schrieb Takashi Iwai:
> On Fri, 28 Jun 2024 13:11:18 +0200, Paul Menzel wrote:

>> On a Dell OptiPlex 5080/032W55, BIOS 1.17.1 12/18/2022 Linux 6.6.12
>> and 6.6.35 sometimes log (`sound/pci/hda/hda_intel.c`):
>>
>>      snd_hda_intel 0000:00:1f.3: Unstable LPIB (352800 >= 176400); disabling LPIB delay counting
>>
>> Is there a problem with the system? The value seems exactly double of
>> the limit.
> 
> It was about the PCM position reporting and the hardware report is
> somewhat flaky,

Excuse my ignorance. When does the position need to be reported. 
Continuously or only if the sound card is in use?

> so the driver gave up to take the LPIB register value for delay
> calculation.
I looked through the logs of our Dell desktops and found some of this 
line from over three years ago, and only a few from 2023 and 2024. What 
I noticed is, that some happened during the night, when the users were 
not working in front of the system.

     /var/log/messages.2024-05:2024-05-03T21:38:40.548614+02:00 
fenchurch kernel: [1243538.698524] snd_hda_intel 0000:00:1f.3: Unstable 
LPIB (352800 >= 176400); disabling LPIB delay counting
     /var/log/messages:2024-06-22T17:53:02.705160+02:00 fenchurch 
kernel: [91380.287519] snd_hda_intel 0000:00:1f.3: Unstable LPIB (352800 
 >= 176400); disabling LPIB delay counting
     /var/log/messages:2024-06-26T22:16:53.731007+02:00 fenchurch 
kernel: [15864.501200] snd_hda_intel 0000:00:1f.3: Unstable LPIB (352800 
 >= 176400); disabling LPIB delay counting

 From a Dell Precision Tower 3620/0MWYPT, BIOS 2.11.1 08/17/2018:

     /var/log/messages:2024-06-25T01:43:44.172792+02:00 freddie kernel: 
[58525.565008] snd_hda_intel 0000:00:1f.3: Unstable LPIB (349592 >= 
176400); disabling LPIB delay counting

> The position itself is reported by other ways, hence it's no serious
> issue and in most cases you can ignore it.
I ask to know, if I should contact Dell to fix something before systems 
run out of warranty.


Kind regards,

Paul
