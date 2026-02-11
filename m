Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099BD350D7E
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808571; cv=none; b=AG8kqJx/UGJpJFSMxCeQvH2uPZLUidhpGA0aSoM1gorq/RbowPNeoHq4SfHEs1bA4qzfwSBhmWct+kYYpS9nLOdRyQmYgOU4IxRcn3doRKDdZDr8tyEmGC8Xb7NDcVJrN4LF7mcrFgbbzaAzaIxReEhUvHC78tWZz1soW7/Jkt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808571; c=relaxed/simple;
	bh=u8XUu0GETk9i/4xEK8Tl18JEs5hNmwJM0Wm06SzVHog=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C0v7CbOnWceTEMfVoyfxHtinPairczN5xYDbR9MIHNkD4bFvWIwzG1J0GJZ2DJJ2+IbvrNCRXZU0UYTlaPcyrc7Bxz5EsbZgzmdt8ITzBROAVRHOsNWaIvd9ioYQ6EjsT+xg9dFYZFY9fn0XGNL7esIPfjOfXPqYolcomO7pDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V53NGqCk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V53NGqCk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35640ad94d3so1585588a91.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770808569; x=1771413369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YNxwJl4cbkb7JZOxlsRSk0oaNC2SdmGy8/cKTCvxXcA=;
        b=V53NGqCkzbfBk1kn9Ov6wSv4RavzRUmTYA3A1FYzslVHl/0C0DTVDnocKACZE10j/5
         B7oy9jvbnu3uMrvYDF9evAKa/FWa99FDijni2g73O9qQbyDIarcw1K1egkxTOHljuAAK
         x+ly58N+0hMqXq/CBX2e+qJMOMXG42qUcIukIWr0vX2TrT3KapSp9wbQGKRPDrwXCXek
         Egdc9w8kf6lFrdqc389hZevw4ZNjchto0juPyWDjeSGZhGVweLy8LZTFEpzFjdVn88bp
         rsGU0XcAtFOLT0Hy3k6zqSPgzR0iS2OjmFXWNRUlfq0OnfW3/NSGYg1toDD11iQJLH5b
         +dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770808569; x=1771413369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNxwJl4cbkb7JZOxlsRSk0oaNC2SdmGy8/cKTCvxXcA=;
        b=SJEoEhJrKnct56mVysv0f72rs2gzbPp+gk3xLkpKbLw3kwlPrFykK3R8VziQx6XqLP
         LmTr7fNiAVyAsElfLZzrjBSwCxf7GgFUJhtqBeulUjPSthisdruTIJ0jEfLuyEccDSrs
         LaLx7dj57blC0CEViadJ6bqyDLRKBENUzorUCn9i/Pmhouw+9LzFGZYM/IFDqaoOZ/nD
         Fqctdi0dTymsWvnZCw35kw1qRVxeF0TtaA9gBqQnYshCqwLHtWRlJd2rLSQhjTisBkTj
         DH2fcD4zO5e2g217AMF0xxVODn3WvbzHnCGsdFcwTZ7Xd4zKWQsWhoN95BPWDdwh6n46
         xPuw==
X-Forwarded-Encrypted: i=1; AJvYcCX+5O8w7MgM9TelikafyuYcBX9TtY+z3Q792cdvO/ysoVyQqebKW/45yW07gpbeL3J0kyjQOUW8T9dXuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytH8R8uoHXlkXeRlHC+JylYUti1CQZ+dXexYqAa81njvcaRRZg
	HSHie4RkGsJFHIjFdvkJ56q6omjcxMgmfnEIJl4ytCRRfI0FZZl1xmtg
X-Gm-Gg: AZuq6aJQ4E1Cg5Ic2D+4F947Sx7oF9J/itMAnvJP58RKvGFQAzHrtvO1+HR8dobzyo+
	s3u31OrFfTiqufu/0yFhVGB8QZFEHFQi7rZ29/XT65HrBLaBhnb/QsM6FaM87pfWRNuHLC8QZPY
	OcErYBgM5Ts6YQWNdSBK/CqJRGOsA1xbqZeS2Ps7k3CgrovZucpVVCqeIeF27T6gnpF6PKn46Bi
	nYbF0Kilblzt0Mlku9wUnMKbppzA7YT5V3VKfsDxPp3U3qWohRlBV1X1P58xH+8+5bHphLnlDd0
	nfRMenXkOy96SvJLzQjEAMlzhpQdjdSLORGqbE16TWWvMussVBH9vZ8fcfFAYfdG9Yl4ER8ViB7
	4m3mMjzwVfoR/OS4JUhJF7n4g/1cG+NNv5iHJeonQ3fp57LlX6mbLAkakARlDEPuHcaL07BYnLA
	==
X-Received: by 2002:a17:90b:2785:b0:356:3032:1d5e with SMTP id 98e67ed59e1d1-356303224c0mr8880239a91.22.1770808569327;
        Wed, 11 Feb 2026 03:16:09 -0800 (PST)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567a887ad6sm1786313a91.0.2026.02.11.03.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:16:08 -0800 (PST)
Message-ID: <fbe05482-90bf-459f-9c77-9a8425badc5a@gmail.com>
Date: Wed, 11 Feb 2026 19:16:06 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: add DMIC support for RPL platform
From: qby140326 <qby140326@gmail.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260205020706.29058-1-qby140326@gmail.com>
 <aYYqIjmPesB_bo7j@sirena.co.uk>
 <6967305c-baed-4f0c-8201-b1610bdefd4e@gmail.com>
 <3cf99569-36a7-4ea1-be73-0605043a95ae@amd.com>
 <b30d7bfc-f92c-48cf-988c-b7dda4f56d36@gmail.com>
Content-Language: en-US
In-Reply-To: <b30d7bfc-f92c-48cf-988c-b7dda4f56d36@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/26 18:46, qby140326 wrote:
> On 2/11/26 17:22, Mukunda,Vijendar wrote:
>> There is minor delta between RPL and YC platforms for ACP PDM IO 
>> enablement.
>> No need to duplicate the code.  You can include support for RPL 
>> platform in
>> yc folder itself. Most of the YC code can be reused.
>> We can completely remove the RPL folder itself.
>> Add extra checks for ACP PCI revision ID.
>
> Hi Mukunda,
>
> Thanks for the feedback. Could you please elaborate on what the 'minor 
> delta' specifically entails for the RPL platform compared to YC? 

Additionally, I'd like to provide some context regarding the current 
behavior.

While the driver works correctly on my hardware, other users have 
reported encountering I/O errors (for reference, see this report: 
https://forum.archlinuxcn.org/t/topic/14050/8 
<https://forum.archlinuxcn.org/t/topic/14050/8>).

These are the information the user provided:

Hardware info:

05:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] 
ACP/ACP3X/ACP6x Audio Coprocessor (rev 62)
         Subsystem: AIstone Global Limited Device 1301
         Kernel driver in use: snd_rpl_pci_acp6x
         Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x, 
snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, snd_pci_ps, 
snd_sof_amd_renoir, snd_sof_amd_rembrandt, snd_sof_amd_vangogh, 
snd_sof_amd_acp63, snd_sof_amd_acp70

dmesg:

[ 706.019901] snd_rpl_pci_acp6x: loading out-of-tree module taints kernel.
[ 723.527213] acp_rpl_mach acp_rpl_mach.0: Enabling ACP DMIC support via DMI

arecord log:


# arecord -D hw:3,0 -f S32_LE -r 48000 -c 2 -d 10 /tmp/test.wav
Recording WAVE '/tmp/test.wav' : Signed 32 bit Little Endian, Rate 48000 
Hz, Stereo
arecord: pcm_read:2272: read error: Input/output error


And this is my device (Working)'s hardware info:

07:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Audio 
Coprocessor (rev 62)
         Subsystem: Lenovo Device 383d
         Kernel driver in use: snd_rpl_pci_acp6x
         Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x, 
snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, snd_pci_ps, 
snd_sof_amd_renoir, snd_sof_amd_rembrandt, snd_sof_amd_vangogh, 
snd_sof_amd_acp63, snd_sof_amd_acp70

