Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2451BF58
	for <linux-sound@vger.kernel.org>; Thu, 21 Nov 2024 01:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732151748; cv=none; b=M2PnX2Ve20wCOaphF6gAqqZv4mmk3u01BaIQXgqom5Yuhur4jmZJVgr0Es3FYTGrMMmu8bz+IK7arB5TpXsywy7Z4TliepD9dmLEzmILEIDWcEah1fRA14J8S2SgyQbhNmuJZomaqjlp6J0GkfQwRxxGQfeooU1MrW33pZMZpqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732151748; c=relaxed/simple;
	bh=9GeMk2VsdT30TPBjdckuAvJCL1XA29NP/k6IfUjtmds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKi8DtKkWTaadzpUwfAMIY6G+ulg4JkoJrruM3uwBM+lUSsm2ovFPYPd3x7W6GZ2huHq2vHBSZONfgQ6Q4G68aNNBAkDBoRjHJveaIQXfP+AJkKzUO9ap+cMIKf8Jz31i6ByQgZOsqCUXu4EXOdweJvJzROVVAgSFbf/rKgmXAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9swbS6g; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9swbS6g"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53d9ff92edaso353847e87.1
        for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 17:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732151745; x=1732756545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+dVmQ15qDl7EDwsnnit36rYkCOxTBypee/ateMECgM=;
        b=O9swbS6gSY9f3mjwhkNui0h4a7nTU8WC4hcN9Cfps1anmN/+xc9lu/Y1Nb/8ENpeqp
         MbR8dObF7qO71hUMC8069CjzGtcNRuQsYaqG6skruQAOQ6EY0fGY6SfHvTXcndImRvwn
         Ufnh35NPb93Z+ev8cZqmYzk83Xum1Lg40xIhNhd4B7QLJACGYZNvKKvCMz1zLaxEWu/1
         ato4H7rqG4HftDHh64uNE39NvME1vatQutqSfKtF3FqfbMV7ZsjEPgfqR1U9ho+x8QJ9
         MZOSGzu62xhTFLDOuVhiDV97V2eJ+FsigcGRVH0T9ngtX3kf0lPxr8UVHfTpb3YshmeS
         NJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732151745; x=1732756545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+dVmQ15qDl7EDwsnnit36rYkCOxTBypee/ateMECgM=;
        b=QN2Fp5B3tbjpuBFGL161WCZS9Y4INj0gP3w6RNI+lemQAhNIkgUZOHKFpWfzK5C+rs
         JJFzgIMZGoDEugJzkEhVUvrn6zljqxrjHa0hAmCdOnVnrU+AQl0iO+a4ZgVv+k7GIs5Z
         Jz/JB7r8nDpdFXgZRDB7g4qaCJ0/xOdR/+/PFH5ue3prNAsX/b26LwWtBCDXqeI6AVJr
         7/tL8/lZedoQ6eIxF7ovE74B9pz4ntU9xM7tSH8awQWUMz25enG2gNO6CL9xR/inz4N+
         GWzLcenGZWoQ93RY0AsGfXlcS8hU4LsFpbpqB87Clr6/nWtRZpjkR9aGOgd15Cb6Gphj
         j4ew==
X-Forwarded-Encrypted: i=1; AJvYcCV3JKORp4ZAkzO4hn4lDcfpq+2GfT1mMLmGBAe8U6NKctNf0AYYzbJftPx1tpaqr3QW2+juoUoPCYM5RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYOqDqKLXMDsSFCxwKW2rw5xzZ1Zb/HO+oLIFQgNtoM8riDh0m
	ItGw4eREOkwsV/PMsLccRZafs9CELQU4XbScVHoSXPNICusgutPz
X-Google-Smtp-Source: AGHT+IGSK+rQhUAzJmmbIJfe0YFaQmetAXUAH8QAjYwH+ThkcjRgC82R9hn9krusZcHkspDB+uE94g==
X-Received: by 2002:a05:6512:10cd:b0:53c:74dc:2252 with SMTP id 2adb3069b0e04-53dc1373e4fmr2396803e87.49.1732151745031;
        Wed, 20 Nov 2024 17:15:45 -0800 (PST)
Received: from [172.24.224.254] (admh162.neoplus.adsl.tpnet.pl. [79.185.37.162])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd4670e6sm798481e87.159.2024.11.20.17.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 17:15:44 -0800 (PST)
Message-ID: <4ca8fe7a-a81c-4a46-8795-60f7f5d1771d@gmail.com>
Date: Thu, 21 Nov 2024 02:15:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
 <87r07wws4j.wl-tiwai@suse.de>
 <5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
 <87o730uttl.wl-tiwai@suse.de>
 <5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
 <87ikt7v028.wl-tiwai@suse.de>
 <74e49336-4552-4224-9b14-204d4264d647@gmail.com>
 <871pzuujkc.wl-tiwai@suse.de>
 <18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
 <87a5e9g68w.wl-tiwai@suse.de>
 <e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
 <877c96szig.wl-tiwai@suse.de>
 <98af4276-927d-474e-a78f-7c6f0bae3090@gmail.com>
 <87jzcz5jww.wl-tiwai@suse.de>
 <13b257a1-8336-4286-b801-bb09082bd316@gmail.com>
 <875xoi5qto.wl-tiwai@suse.de>
 <af71370b-e68b-4dad-ae04-8b9f5742568e@gmail.com>
 <878qtec56p.wl-tiwai@suse.de>
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <878qtec56p.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2024 16:09, Takashi Iwai wrote:
>> The speakers are completely silent once you connect headphones,
>> regardless of Speakers Volume / Mute Switch settings.
> 
> Even if you turn off "Auto-Mute Mode"...?  If yes, check the widget
> NID 0x10 and 0x1f in the codec proc file
> (/proc/asound/card*/codec#*).  The former should have the output amp
> value like 0x40, and the latter should be pinctl 0x40 (output).
> You can override the values directly via hda-verb, too.

Yes, speakers are always silent when headphones are connected,
regardless of Auto-Mute Mode and even if Speaker Mixer is set to max and
unmuted (which translates to 0x40 for NID 0x10 in my
/proc/asound/card0/codec#0).
When it comes to Pin-ctl of 0x1f - it is "0x40: OUT" as you said it
should be, unless Auto-Mute is enabled and headphones are connected
(it's 0x00 then); but it doesn't change anything - if you plug
headphones - speakers are quiet.

-- 
Regards
Jarosław Janik
