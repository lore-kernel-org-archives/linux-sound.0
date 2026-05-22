Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890A27A47F
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463550; cv=none; b=jl6PSw05KclWV5TZMbQ9XcNw9FaD5U3DtKucB4NYJJGme+Uk6VVxft8Dhbey3UgXdaFWX2QBjpbnvuDFqU32CZZGGzis66XqhHLdnVAfQAGM2jHMy1/uUrRy63zCoJG3uS+P/ujnwvR1n6r8PS5euAXBXo6NedlV6GRr7Z5jFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463550; c=relaxed/simple;
	bh=oxlVo4xOLxbhceqbtomwz4QGyuLvMO4plE8zxBTmSOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dzj1U3qyvhP84drl1e/d4hsv1AQu6nEiimfZRz1v+uwsDH3ii2lHTvFXlxBx3fMwEmXzn1wNDSojRLgFmCGLkkeyD2ZFc2Hjz1P4FG45h9o2v40Qs1zhWVTsJxcW2qgUHUwzb7QI/J1PS5UhLUOzG7vdp30P7QvV0TyhydhAbZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 05EC14C1511A96;
	Fri, 22 May 2026 17:25:26 +0200 (CEST)
Message-ID: <630e9bed-5323-4dac-a6f4-569072134c41@molgen.mpg.de>
Date: Fri, 22 May 2026 17:25:25 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9315: *sof-audio-pci-intel-tgl* still not loaded
 automatically
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org
References: <d67d624a-35b0-4865-a288-8aeed04f60ee@molgen.mpg.de>
 <13e71656-90ca-48e2-b4db-790d4ef1e3f2@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <13e71656-90ca-48e2-b4db-790d4ef1e3f2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: Remove bouncing ranjani.sridharan@linux.intel.com]

Dear Péter,


Thank you for your quick reply.

Am 22.05.26 um 15:18 schrieb Péter Ujfalusi:

> On 22/05/2026 15:31, Paul Menzel wrote:

>> By default there is no sound on the Dell XPS 13 9315, and the module
>> *sof-audio-pci-intel-tgl* still has to be loaded manually with Linux
>> 7.1-rc4. It reminds me of issue 4540 [1], but that is supposedly fixed.
>>
>> Please find the Linux messages attached. At 184.662140 the command below
>> is executed:
>>
>>      sudo modprobe sof-audio-pci-intel-tgl
> 
> if manually loading the driver works and then audio also works then can
> it be that the driver is on denylist?

I am so stupid. Indeed, that was it. An old workaround from back then.

     sudo rm /etc/modprobe.d/blacklist.conf

and removing the scripts loading the module later, sound still works. 
Sorry about the noise.

[…]


Kind regards,

Paul
