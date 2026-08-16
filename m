Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FEC3B2FD6
	for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786915273; cv=none; b=VZCKTn/hUeJy2QrvGdVdfZRHIHdIwngftyxF8hqWQbhHWGpoAntiKm9+XkNVgradW2n1TQrlnYU6d5lL4lQmq+un2z11jEcpTryvs4S1Ll8R4lCw6rvAVaJFwNbuBg1fHIFEF7R3j1zgQpHD6x6IIhN0VEL2NxKe+v80ikTFL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786915273; c=relaxed/simple;
	bh=SyBzG8tgXnX0VUfUgJmy5OmXu1TW9rOySjd3Fo30FqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbFUBIwOsFBggs4VppIQ87phHmm7f1i+BmWbYEkT+Q4P6UXeP3xSG7HJHiW/f9hMuYE3esNdBRXryJ8NDUNNCvnOQSdb+ttYNDlV3uhvF2cqihpO3z6+A52/Uy1Nyzj27IUnsyJ8qNYKQJSPSOBJDjSePTXDux6UEdtwzVgQm88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jANSKNYH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jANSKNYH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so21893925e9.2
        for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 14:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786915270; x=1787520070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhVr3MmkgG7lZrSEkj9eSOnYjsgd84dLTq7WCL5Ocdg=;
        b=jANSKNYHzaNAQd/a/DbYPf/c8lwobp2OqyOmzgFts44Zg4JdfOngWv586YzXKwJW1W
         +BL+pbZukkOgilbUcQ9CWp99oixiSeB4d9frOYxyXNxJKTcb96TR+AgoJYpKNHl5XAmI
         eXB3Kbx0RxA9hYWEwaSQb+9ORM88SNODs9NkyDAww0N19Un4N/EiWk+DApnBuCiuGkYw
         jex4IbErPop+n9/rjSqNQ2KkJE62LVwwbqcwl+HhilWVZeAVwUXSspfXw4fQlXcqLhmq
         phJh4bEatnx/KEv4qbpwOjNsgmDSw7hCZwYNwnKP+9mI/G9FZFIaIX8g8j/T2I7h1+8J
         MdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786915270; x=1787520070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JhVr3MmkgG7lZrSEkj9eSOnYjsgd84dLTq7WCL5Ocdg=;
        b=leDzcRhWwSYQZJQFKUDDAqszI0yDbWyY32FLzpW0T/Vq2KSWfSbse4poYWb/5loO25
         924Osl068RFrvkITK3gLAHZzsdE4SxVYDYwNaEn+2sJQ/dwTb+BGc+PcCqhvnXnO7lBD
         YleeQqCTsbCJhgdtW11sdzQhGgXpGzJfdbiAnMUuFg904ED6MHHzrE15cvAC0A7TUbR9
         SLMeMV8tIxM/SDmwjjCI6zftIV2x0JuIwaZRUXUPxnYyiBfb6EhCoOMTqNQFs6p3tsMx
         4myvOSYgB+AvZYfUvzlF7+YodsAeWfYEdIwmtYLdv27zIMfDkfspOzLnFSxJWDVemg2l
         3iuA==
X-Forwarded-Encrypted: i=1; AHgh+RqClpvH+9qVrUZYn0aVMeTLUm0oW891Dl1Slx9gBQy9jYk0MDGEqDapPdEPwXs6ZqNi/EaYJUBtpwH/VA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynodwub4KxNxWfpIm6KzBKnBNRS8Einq9u1W50gtoD5lNZy+Hp
	ySmBZrtxBMisJRofXfe63VtFAE8UY1qnhGVeap3jtQezrfJP83VphWH3
X-Gm-Gg: AR+sD10bneqXcIxbvk1akI7ujqGhoQA3dcWgmnywU4159ahxr1lzeMF2sdBCE50w/wz
	8V1GeqiiLbIr22IV6aGULDzaOX6xNMcL539WSWUc/+4gm0D84H/y5T4d1twW8fU5IjbE5F/aiT7
	+tVOpjjHbuKMN46TmHMLItoBf6GLaqDZ0ZodGWriV+jEMNRpAeYDN/UdgOTowru0bS3wOnWrMtk
	zO63wfZWQ0JqLk8lAImYwSGAFbRZ3YVGY9w7fK6UPDhVFN65wNpuSnr0qMhDJSbWoOcwrF58JkW
	k5LIIaJrekuH2SpVTskKjNNQ3Jr2VQgjOjfGNR4Etc0waiy9yVzQ/nDywezJ66Lle6oCKFBCnN3
	ylfHU5LrpuLhRuRvhNJHJbkN7l39j7BlfPsAwW2uVokzuK5zQDjp0ke0+udQ3PqNa502rN2nb//
	XeydwbDglExwUfGAFcQNjQN9srmm/Jt9JYqMu2y8yhUWjFy1puUV1F2JwHUpt3PwVOASJ3rEey8
	3t+XDur/BXdmrCn3YlPV+xcVn/BwTZCT3trxsSYyqVd7fgRoDzGyqIv
X-Received: by 2002:a05:600c:1f91:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-4998797c6dbmr281240785e9.9.1786915270255;
        Sun, 16 Aug 2026 14:21:10 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960fef95sm94521045e9.1.2026.08.16.14.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 14:21:09 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d1bca6c9-4af3-4f61-bc73-cf6a193d7af1@gmail.com>
Date: Sun, 16 Aug 2026 22:21:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fix unmet dependencies on PPC_BESTCOMM and
 SND_SOC_AC97_BUS
To: Rosen Penev <rosenp@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 arnd@arndb.de, chancel.liu@nxp.com, jonsmirl@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802144855.3596995-1-julianbraha@gmail.com>
 <CAKxU2N9HkStUEo+iTa6xc2BJGe6KE==vARDdHPEhRH9yKOMLuw@mail.gmail.com>
 <999edd39-43d0-4973-96ce-a205283277ff@gmail.com>
 <CAKxU2N9mD7tLH2j7p-mV4B4eGcfVP2g52DZViMGELp0ds3VBBA@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAKxU2N9mD7tLH2j7p-mV4B4eGcfVP2g52DZViMGELp0ds3VBBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/16/26 22:11, Rosen Penev wrote:
> On Sat, Aug 15, 2026 at 5:01 PM Julian Braha <julianbraha@gmail.com> wrote:
>>
>> Hi Rosen,
>>
>> On 8/2/26 22:14, Rosen Penev wrote:
>>> On Sun, Aug 2, 2026 at 7:49 AM Julian Braha <julianbraha@gmail.com> wrote:
>>>>
>>>> SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA both select
>>>> SND_SOC_MPC5200_AC97 without ensuring that its dependency on PPC_BESTCOMM is
>>>> met. This causes unmet dependencies such as:
>>>>
>>>> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
>>>>   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_BESTCOMM [=n]
>>>>   Selected by [m]:
>>>>   - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
>>>>
>>>> SND_MPC52xx_SOC_EFIKA also selects SND_SOC_STAC9766 without ensuring its
>>>> dependency on SND_SOC_AC97_BUS is met.
>>>>
>>>> Let's resolve all 3 unmet dependencies by adding the dependencies on
>>>> PPC_BESTCOMM where needed, and selecting SND_SOC_AC97_BUS as other, similar
>>>> options in this subsystem do.
>>>>
>>>> These unmet dependency bugs were detected by kconfirm, a static analysis tool
>>>> for Kconfig.
>>>>
>>>> Fixes: a9262c4fd404 ("ASoC: Support for AC97 on Phytec pmc030 base board.")
>>>> Fixes: 6ffee43ecf8b ("ASoC: Fabric bindings for STAC9766 on the Efika")
>>>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>>>> ---
>>>>  sound/soc/fsl/Kconfig | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
>>>> index 8ae59c094878..a5d7cf534391 100644
>>>> --- a/sound/soc/fsl/Kconfig
>>>> +++ b/sound/soc/fsl/Kconfig
>>>> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
>>>>
>>>>  config SND_MPC52xx_SOC_PCM030
>>>>         tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
>>>> -       depends on PPC_MPC5200_SIMPLE
>>>> +       depends on PPC_BESTCOMM
>>>>         select SND_SOC_MPC5200_AC97
>>>>         select SND_SOC_WM9712
>>>>         help
>>>> @@ -253,6 +253,8 @@ config SND_MPC52xx_SOC_PCM030
>>>>  config SND_MPC52xx_SOC_EFIKA
>>>>         tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
>>>>         depends on PPC_EFIKA
>>>> +       depends on PPC_BESTCOMM
>>> does this really depend on PPC_BESTCOMM?
>>
>> Yes, BestComm is the co-processor found on Freescale MPC5200.
> Just took a look at this.
> 
> --- a/sound/soc/fsl/efika-audio-fabric.c
> +++ b/sound/soc/fsl/efika-audio-fabric.c
> @@ -22,8 +22,6 @@
>  #include <sound/initval.h>
>  #include <sound/soc.h>
> 
> -#include "mpc5200_dma.h"
> -
>  #define DRV_NAME "efika-audio-fabric"
> 
>  SND_SOC_DAILINK_DEFS(analog,
> 
> compiles. That header indeed references bestcom stuff, but I don't see
> the driver doing so.
>>
>> - Julian Braha

Ahh, nice catch! I'll send a v2 soon.

- Julian Braha
