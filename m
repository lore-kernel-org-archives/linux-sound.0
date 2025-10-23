Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D13093C7
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217209; cv=none; b=YI7xJouEnXaGbdUQIdoDjZCkicfnnKa5oWA2FzijOGk+KKiBOogxZCYeBTUFhna2mD9oASJi2Uh+Mv3wT4271t/QP1SUkBGk27RhAKAUSwXw6a4qkpH+fshHhCb/YC9wFSR2h0Fm+uI3bQqV/47kNsSPA/F1En7tgQVC+TCPs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217209; c=relaxed/simple;
	bh=AOc1t+xF0k55Bn9gM+fvWV2KlW2EJ2nPYROzMERtmAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcBhhMvUa6y2Ww2LJATLqVxdev08y/HotgSgE8mrHoqwTYFOYvBPBybxjqRI+dYGPHR2JmRRNNiYHFyJW1E+EAYklBG9/aEe9RgCkTPzGKYwCVWwVGSMVcaBPWt5MDRCQbix6G5SpFONiN/zi18Iz3eDTRkP5d9X2yLfPEdNWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOz4PaJF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOz4PaJF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26808b24a00so1130325ad.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217207; x=1761822007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAvypL/j/KTTtZz9aXHo2dPeEwbDKfKVRkGLT1fSsUo=;
        b=YOz4PaJFl32sdBEEmwsURuLcETVQnXxh3oBaybPUFcdzHOB0xUr4X/9ajR9j7Jq3Ra
         YRIySaW14VEnocO9zlmuCr973d5+MTZP5+3nF5Cf73ToNTcxDYukL0LOmfnuGJDBVmxN
         nhlOzhWDtPec9lL04YUONuUgLd5VQkUGmf/wk9ro1g2J83edE8vAqcXXyvavsUabOjnX
         JB3tJ9Zt5P1TPg4R60YtI9SSUJLBRmqTp/4OXwg9LFygzmkVln/45/xqGlnCqfMqd6DM
         LmGgtGgKvSEcyl3xUMf5zleVxPSinhTyNVCBElFfDHWoKfYksiRXnnvHSvP2Ux1iR9g3
         /Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217207; x=1761822007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAvypL/j/KTTtZz9aXHo2dPeEwbDKfKVRkGLT1fSsUo=;
        b=uYfTrWpuXPE1oSZRcrZGWSK4Cx3XjvZfmA5tWqz6EhL/z1I51wqErXxKxWi/+bl5jv
         RWP5BZr9Yro9kCBqlzk5B2t+puRZcGRtGyIwUHCteqsuDFmUQ1/3KPl5S+6/jozL8jFZ
         p9/iPrnn2bjdnsySFiGEWWRIFj58Ryo0IBlsJnU2WCPO+YqzrATPUz5Ze93g9z3FE6mR
         kJCQIVsS0SGhqaNsS/d+2272mpO8oKx6ier2YJY1yYBIPMYzdzwguWSn8zfyC9dn3rsl
         UG7eEFoFGOQLeFpM0v4P9/9irgu6hA0En8LZaflTdbHqZsk3ZQluW4wVjjOYIhIVbcxX
         V26Q==
X-Gm-Message-State: AOJu0YwBc6uiRVKWsc4LS5BehE9kQLRyAFv8NYVCjiXl6aMRf9sUAHZ0
	uO8MnVQSlIflfTCmQXaUzx/2qqZDa2g1rPryE/l0pppLS9L9OSnWggn0qt/Rkw==
X-Gm-Gg: ASbGncv31unvEFX+L3kD8+Hpr3P26BkE6Q3kAcIBMFdsH3bk8QkLXmpZeX8OzIXGkEj
	kwxikY4AJcOhP+B71l4w2Mx8DcesgjWb2nLFPt23lbc/pvLFgye9Ehn3hMAdcU3qzlmLhQo2CSf
	2VbrhgRiaWUbJ6xJKHnS7ruPcuX5UAY6qD+jYg1/5un/caeqp4YjhIrJvbvp3obE9DUF82zQ8TC
	nqL0179skNxee+tmSO/dREGcRjwMJkZzi3QwYP54LHsXd5e7Z1TaP8YMHnZmPXywC9rhvCOapWg
	YsbBT59kPCZathshmpo7l3339zYP5Jd8pgXt+7wpB44PL1tqUSfUnqxtLGqNqmIl/sT7mDR2N19
	yXaf14ZnO5iB8XZve7ETDDpTXksqiWqrNVnwXTfOy644JYSF7vV7HBSnRpz/yktPMC24/rdqDle
	kGEE6sVKwTQoM/qhJibFkBn5Wx645FtCFuCJwDzZ+c+GfM+g==
X-Google-Smtp-Source: AGHT+IFAmueG86Eixdrvt67EZK2lf9jJoqphdApj2KGYFOULKX8STzTEFyxhl+6HgVjeDIUZZHBp6A==
X-Received: by 2002:a17:903:90d:b0:290:ab25:29a7 with SMTP id d9443c01a7336-292d3f611a1mr60497535ad.5.1761217206899;
        Thu, 23 Oct 2025 04:00:06 -0700 (PDT)
Received: from [192.168.1.200] (21.65.233.220.static.exetel.com.au. [220.233.65.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f0654sm19927365ad.81.2025.10.23.04.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:00:06 -0700 (PDT)
Message-ID: <c6af69f7-8f82-4307-9550-cf47777732b9@gmail.com>
Date: Thu, 23 Oct 2025 22:00:03 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Linux 6.17.4 - no audio on Hardkernel Odroid Go Ultra
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org
References: <9e966ea8-487e-4d0a-bf39-61428b3f9163@gmail.com>
 <1jldl22esc.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: John Williams <porschemad911@gmail.com>
In-Reply-To: <1jldl22esc.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you very much Jerome, adding CONFIG_RESET_MESON_AUX to kconfig did 
indeed solve the problem.

Regards,

John Williams

On 23/10/25 19:38, Jerome Brunet wrote:
> On Thu 23 Oct 2025 at 14:34, John Williams <porschemad911@gmail.com> wrote:
>
>> [1.] One line summary of the problem: Linux 6.17.4 - no audio on Hardkernel Odroid Go Ultra
>>
>> [2.] Full description of the problem/report: I am working on upgrading ROCKNIX on the Odroid Go Ultra from Linux 6.12.43 to 6.17.4 (via 6.16.9 as an interim step for testing) - PR https://github.com/ROCKNIX/distribution/pull/1898
>>
>> Kernel config was updated via 'olddefconfig' from 6.12.43 to 6.17.4
>>
>> Audio works fine with 6.12.43, works fine (after a wireplumber restart, not on first boot) with 6.16.9, but does not work at all with 6.17.4.
>>
>> No sound cards / sinks picked up by alsa / pactl / wpctl.
>>
>> dmesg log is attached (desg.txt), important messages are:
>>
>> [    1.916788] ALSA device list:
>> [    1.916818]   No soundcards found.
>> ...
>> [   17.645092] platform sound: deferred probe pending: (reason unknown)
>> [   17.645109] platform ff642340.audio-controller: deferred probe pending: axg-tdmin: failed to get reset
>> [   17.645115] platform ff642540.audio-controller: deferred probe pending: axg-tdmout: failed to get reset
>>
> You are missing CONFIG_RESET_MESON_AUX
>
>> [3.] Keywords (i.e., modules, networking, kernel): amlogic, meson, axg, sound, audio
>>
>> [4.] Kernel information
>> [4.1.] Kernel version (from /proc/version): Linux version 6.17.4 (docker@323dec686e20) (aarch64-rocknix-linux-gnueabi-gcc-14.2.0 (GCC) 14.2.0, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT Wed Oct 22 23:21:15 UTC 2025
>> [4.2.] Kernel .config file: see attached .config
>>
>> [5.] Most recent kernel version which did not have the bug: 6.16.9
>>
>> [6.] Output of Oops.. message (if applicable) with symbolic information
>>       resolved (see Documentation/admin-guide/bug-hunting.rst)
>>
>> [7.] A small shell script or example program which triggers the
>>       problem (if possible)
>>
>> [8.] Environment
>>
>> [8.1.] Software (add the output of the ver_linux script here)
>>
>> Linux S922X 6.17.4 #1 SMP PREEMPT Wed Oct 22 23:21:15 UTC 2025 aarch64 GNU/Linux
>>
>> Util-linux          	799088
>> Mount               	799088
>> Module-init-tools   	34.2
>> E2fsprogs           	1.47.0
>> Linux C++ Library   	6.0.33
>> Dynamic linker (ldd)	2.40
>> Procps              	4.0.5
>> Udev                	255
>> Modules Loaded      	cdc_ether cdc_ncm cfg80211 drm_shmem_helper gpu_sched nfnetlink ntfs3 overlay panfrost pkcs8_key_parser rfkill rocknix_joypad rtc_meson_vrtc usbnet zram zsmalloc
>>
>>
>> [8.2.] Processor information (from /proc/cpuinfo): see attached cpuinfo.txt
>> [8.3.] Module information (from /proc/modules): see attached modules.txt
>> [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem): see attached iomem.txt
>> [8.5.] PCI information ('lspci -vvv' as root): N/A - no PCI bus
>> [8.6.] SCSI information (from /proc/scsi/scsi): N/A - no SCSI
>>
>> [8.7.] Other information that might be relevant to the problem
>>         (please look in /proc and include all information that you
>>         think to be relevant):
>>
>> - see attached alsa-info.txt.XXXX7OPGP3 (no soundcards found)
>> - see attached decompiled devicetree pulled from the Odroid Go Ultra
>>
>> [X.] Other notes, patches, fixes, workarounds:
>>
>> In testing this issue, I have removed any downstream patches to relevant devicetree nodes, these results are purely with the 6.17.4 mainline devicetrees.
>>
>> I apologize if I have not filled this issue report correctly, this is my first attempt.
>>
>> Regards,
>>
>> John Williams
>> porschemad911@gmail.com
>>
>> [2. text/plain; .config]...
>>
>> [3. text/plain; dmesg.txt]...
>>
>> [4. text/plain; cpuinfo.txt]...
>>
>> [5. text/plain; modules.txt]...
>>
>> [6. text/plain; iomem.txt]...
>>
>> [7. text/plain; alsa-info.txt.XXXX7OPGP3]...
>>
>> [8. audio/vnd.dts; meson-g12b-odroid-go-ultra.dts]...
