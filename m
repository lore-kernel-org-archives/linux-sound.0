Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B12914
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 00:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.219.244.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747095771; cv=none; b=nfWOSGRfIZEPZofGz1LZnpwqkG40AM+9iFp1neIU0ugHae5j3pd7+uJuTzp3yjUoML2TljPYzcY90L+/Cj1HNy88XghFdYJzx+WOzRgMAWY/o1Ned+bV7XpiIWn2PY9AR15uPkAlwBbMOODiTJqoF7WeskPv9dzvmzjEz4ZnJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747095771; c=relaxed/simple;
	bh=cYKvUOD/kNr/5wKEwfjfbJIVzhu0DE17bIXOJ6GktgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k/ecJgzyrcqfA4eU3N/T/LMNVbUZiRwcdTonsOAqx8natpVk9D7usIuz16IKoSXD7awNL4ZETGkFR9BBy7JUBqZuwj8rj3EK61folk2FnRmG4zUhFLfy33U8NCDXv01LVRyQM2Z+scn/Sn57DZFuW4S06tw/BKB9Vx7Ya844BOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frantovo.cz; spf=pass smtp.mailfrom=frantovo.cz; dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz header.b=UdC/lDvL; arc=none smtp.client-ip=91.219.244.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frantovo.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frantovo.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz header.b="UdC/lDvL"
Received: from [192.168.1.4] (osma.doma.frantovo.cz [192.168.1.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: fiki@frantovo.cz)
	by posta.frantovo.cz (Postfix) with ESMTPSA id 678A112FFA7;
	Tue, 13 May 2025 02:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
	s=default; t=1747094872;
	bh=cYKvUOD/kNr/5wKEwfjfbJIVzhu0DE17bIXOJ6GktgM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=UdC/lDvLrN8Dv4S9U9eCx85hWaNueNfGLR4a77OWwu9cqryV66RO52Rq7k4M5kR9d
	 hTq4DVa4lrNPmBtvxH/NWFhH6Tfd2+d2s8v8ErSWvptwFDvW0kEWU6nVPyaE17YerW
	 ulzX2CQUAJNzF/QyAYjOeEsDLtyIHRqmoxYDqVf0=
Message-ID: <b9d2ccd0-9b92-4324-bc44-0fb1be5f465e@frantovo.cz>
Date: Tue, 13 May 2025 02:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Rename Pioneer mixer channel controls
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <20250508192223.4847-1-konference@frantovo.cz>
 <87msbjxmew.wl-tiwai@suse.de> <87ldr3xm49.wl-tiwai@suse.de>
Content-Language: cs-CZ, en-US
From: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <franta-linux@frantovo.cz>
In-Reply-To: <87ldr3xm49.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean

Dne 11. 05. 25 v 16:23 Takashi Iwai napsal(a):
> On Sun, 11 May 2025 16:16:39 +0200,
> Takashi Iwai wrote:
>> On Thu, 08 May 2025 21:22:23 +0200,
>> František Kučera wrote:
>>> From: František Kučera <franta-linux@frantovo.cz>
>>>
>>> so alsamixer can show the controls in correct categories: capture/playback
>>>
>>> Signed-off-by: František Kučera <franta-linux@frantovo.cz>
>> Applied now.  Thanks.
> ... on the second thought, I'm not sure whether the proposed new names
> are the best choice.  Now we see "Capture" and "Playback" twice for
> ChX switches (also for Master switch, too):
>
> +	SND_DJM_CTL("Master Capture Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
> +	SND_DJM_CTL("Capture Ch1 Capture Switch",  250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
> +	SND_DJM_CTL("Capture Ch2 Capture Switch",  250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
> +	SND_DJM_CTL("Capture Ch3 Capture Switch",  250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
> +	SND_DJM_CTL("Playback Ch1 Playback Switch", 250mk2_pb1, 0, SND_DJM_WINDEX_PB),
> +	SND_DJM_CTL("Playback Ch2 Playback Switch", 250mk2_pb2, 1, SND_DJM_WINDEX_PB),
> ....
>
> I guess your intention to make the differences clearer, but still it
> leaves me some itch feeling.
>
> And now I noticed that you've submitted to a wrong list.  The kernel
> patches should be sent to linux-sound@vger.kernel.org, not alsa-devel.
> So I drop the patch for now.
>
> Let me know if you believe this is the best naming, or if you have any
> other proposals.  And for the next patch, please submit to linux-sound
> ML instead.
>
>
> thanks,
>
> Takashi

I agree that the names are somehow weird... (I asked for advice in the e-mail "Pioneer DJ DJM mixers channel names" 2025-04-24).

I tried to find best fitting names in <https://docs.kernel.org/sound/designs/control-names.html> but this convention fits rather classic sound cards than mixers with many universal channels.

The "Capture Switch" or "Playback Switch" at the end of the name are hidden in the alsamixer utility and only "Capture Ch1" is displayed. The suffix serves for assigning the control to the correct category (F3 - playback, F4 - capture, F5 - all). And without "Capture" or "Playback" prefix, I will see only Ch1, Ch2 etc. and if I switch to "All" (F5) I can not distinguish Capture Ch1 from Playback Ch1...

Hope we can find a better naming convention for mixers.

Thanks,

Franta



