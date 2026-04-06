Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1054086A;
	Mon,  6 Apr 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775471588; cv=pass; b=UDIIhkP2S/LJ3cgQmHmlYSU8FkaEf9/QKz2aBrEYp9L/GehgObhsp6UkWhkScb1u47wc/v/lhZIu0Odhu6HUGjhXWstVJxKtogk7u1VloBogEYFBTx4FiQVcjyGruYAHGgdfELUcKBwk5uOFtZ2gVWkzw/QitBCzeT2BMqG6Ie8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775471588; c=relaxed/simple;
	bh=WuL83UxxyNxlLz+YtmRlM4qb/6DAw+9iYkt7exotziE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9+KxR7zbneff/bRD6Xhs/CJPwOnP7jjJIY8eyn42q2pRnjaY6Mc9JIlaT8jFXzj9XHIwqYEqhMyjHcocLErWy3/R3NTE5JzUGeCugACJdnqpZJ/uejStb1H3N9qHEi9TTUayxq/3sOfUWWVQyO3GHMSvGGZ4BIwOPdGwC3H0TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=Kr+ii7dw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="Kr+ii7dw"
ARC-Seal: i=1; a=rsa-sha256; t=1775471573; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GmMq1YF++t34nucaEsXsYEROaO6X/9q+M3MTpV/aNtxMVDCnCjAhShPzYZZo5i1/c9YqIkZWKnYruP8lqVp3tQyKYb66ogRJ2Wv7SBC/0Uvqp7nikj3aGfYosiLtHZA546qKY7ZEh/96DNLUzI8Q8GCVJPHRJg4ocYPNaqojgQk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775471573; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ov71i6SzQPqOpdh9cfwB7JsKtZ2gy8E7qZcTeFEn/2A=; 
	b=BsHYNCfzJUeBjbubbCtwP0MdJ0Hfqq9WHAzFkH5Kof0lIZaiEpJVf6ZsdAhnBAtR9X4aMn44IlKORXqiwD0RlSrEHuOZAXGgn1Vj4rQ42haJOUZCXE0UdiJ718mL4apGjU4heA6y2g1Ge+UO7aLgHp+t1WuWlLQn0QY92vK/1YQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775471573;
	s=zmail; d=harin.net; i=me@harin.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ov71i6SzQPqOpdh9cfwB7JsKtZ2gy8E7qZcTeFEn/2A=;
	b=Kr+ii7dwlS8FPZyxfxoK9nrnm+SW1WEpKulo0yaLmaUE6vnyE1FeHCrQ+dfv7ZBC
	98VP3PeeOp89roa90X7YuSJzgT+K+XxR5NHhjaHWOkfKO9xTIdf3slHw8zIWHDtKaK+
	nu+3xXwCeegP6G8Fu72ZnOrjiMfDjos3g7Ea6TaBcbQRD3stSPeFYA9tE5s9PTFfp6U
	hNnAXZ6DnI3oP+tqz1K0LYzMG9ig/lCXf2+4G7BjFMvtfN+n30uR59dJLAEcrnHzf7f
	XC2Zkdq1aoWD7Zsjk4ncOVq0XeYZ6wYuX80pA1Y9ZoPuBn1UCxSfz5w2z/5E9bTWKvB
	LLnXPqjJYA==
Received: by mx.zohomail.com with SMTPS id 1775471566995842.4232189746164;
	Mon, 6 Apr 2026 03:32:46 -0700 (PDT)
Message-ID: <81e252e0-98a9-43ba-af54-e2ed152345b7@harin.net>
Date: Mon, 6 Apr 2026 19:32:43 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: ctxfi: Limit PTP to a single page
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260406074857.216034-1-me@harin.net>
 <871pgsmpzv.wl-tiwai@suse.de>
Content-Language: en-US
From: Harin Lee <me@harin.net>
Autocrypt: addr=me@harin.net; keydata=
 xsFNBGTISwABEADmFninPoVcq/XKNS5RAgT9GHeoPXMpIHVR0/WaEpEuwi0RBjXuscnStxGF
 uKnu1wSVArTHVrUH3H+DlpQMmdwhvxIJJqGItVgmuOTFEvc9+wyh9CEE7xeXSPsbNKUL+7WY
 A/oBaXsIR+PxaY9F3oIcK//VLN7WYJt6qqPGfdDEeIgje66LSsdo5o+ZLaUc0pCuGlZt79UD
 vSPUZvPfk0mTY0UQVi3QbiOWaHpias70ZXyTkAqga7azyUyNylMkd5ot+hGOfq/lEymRov1p
 qJ5FNcG0zxUOmnx7LIXfEQO53OVT6jquNS6u+8ohT9x501is7khebQo9jPfqp6E8HKuS/ryB
 j/GpHUNd1l3Yhnu3EYaeANtlnmfcG0yk+gd+lCPfx8esjHhijnBHgpW29W+bRs4l6MRdTjnL
 25nJLvWifjNop4XYPX7tTpzJ7Iys94XroGESkFeNEHxNO8n+7+0oju+FXJstcz6PqFgT9g7d
 HibvIRhOWsS+f9XVnC/BffhtAwbuomnVFTUKr31BycpMl1gUkB9wTjYvhGoPjEZ8TmPOmmPl
 EgMtlyGqK9CLG/WGkCN5S+rSnEHca+USyDQoW1FV+X8HrQCM4daFGFEc7J2YkxIJphTDoLdM
 vBuFmGBFYr/2qNidpfl42Z/rwggdQICHsq7YtrA/o3LT3/roFwARAQABzRhIYXJpbiBMZWUg
 PG1lQGhhcmluLm5ldD7CwZQEEwEKAD4WIQQB8U1e3DNTsF3+GT1J/msjUbJSGgUCaLooAAIb
 AwUJBaOagAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRBJ/msjUbJSGitbD/9FSkaMuxdb
 TRsBVhVqPEVb+v0rzmOTdM8gao3PInaMGW489tYRJ7pCHPK6LwxdD4+omRztLgRqZiDlZEGE
 HROUWhgeWxQ09eWUq3jwxFhyUayYcMfLBc8MGbANngVUWO4zRGvVi8KFulOlqhugK/oJF1jw
 QIF6liTyqh+avlNr3WHVmmGSwatXXV1E+ZgLJUsTa1HvrxxBK+MDpcBxGeaY7N+U+GTzxdiq
 Mq7x3xDoV4AtPzcmDO5w2AvzilgXRHVW6ntnq8dYoq4kLk0O4e819oJETJyU2VuNO7H4PKsR
 D/YJn2E1ZBFx3Z6CpyJMXZLVIrwrAW8a4+CzI/DQzkl3OfpG28AS4Qsa3KUSYG4qMEimnIT4
 mGYOH59gkpHwZHpBzpJMWDf+OY3kDIHOYTJkP/7QC2L8yXt8zfhLMb/knXWzjslEQBupkzXo
 psXFqgAPvwOyPYdf/0eexwa0ljT8AE2Cuvgpj21m+NrG+rlOO4rqTxSL2tOFougKWw4wgYgc
 Oi2lmwRxRGHUkdjn84ofg3yjlvTsUN/PI1PxYR/JEuro67Av1M6D/x+a5a1Tf49Zl3qr7CMX
 tnX23dw4bcgG3wzEPRAoJUZcOIQjVdaZl9Qsk46cKLi+YB53PZYfCjBC7KeDKkv4NW+UFBu9
 RaMdEi6ByeKTTcy3faZq46nogc7BTQRkyEsAARAAtuVCcP+dXZ7moKUZy1QKFbD2wNScDY/B
 nGa6uShjvYjuvAbiDAVkAYfWniHuv0cuAkBtF/wvba3JAxOg1IjMSse7QhHCLlkE9MgUiq50
 n1nSChlGZ2m3oB4S+VjroVjNLWURIBkjmiCclRJVqSZJu3h1+SguocMAIkYVtJddZXyCuQiW
 2lhjfrMMM5m3HB4NQdj/HPIpo2WYIohPDqHeJxKdPQrC3W/FjtBoCGvBPsPwtfxrBB+isTRz
 9NonQPvONDR35rtSKHa8KUpmAu9ScaiPhqEG8qV+9VoZbMe7TR7ZnL5XonexCUdr7NHFvpcS
 m2mpYMh4RmEtRjxnHzr1OVGHHAIC4BoTOcZveMu4/4s3OJZcp/mtfLJrYfy2IccAgYebx20a
 7gbMhxkOD7A1Nbt9nOoA2W7wO8SNo1gG1Rn+2+jPjihkQmH9BMuGm5glj4PabhiFP3ewrSxh
 ABLRQ4PnaQijTty7MU2Lw+6uwlocV3oLB+Bwen0M9+2m9AcsUFuB2NEXERJuVcJX7STlm+Sa
 gan03N97cnNyFG0hDHiAO/xwxS9qMQpqTbXjHy1VQkhyw9I95+R9BltApML/miZ71Istyy1g
 33ljRGK403j+we8Uf+OsAkHtnFsZqC06m82ADvgbI61DnEPHZOF/QEAn7vDNWKID0SvI7/qU
 h6cAEQEAAcLBfAQYAQoAJhYhBAHxTV7cM1OwXf4ZPUn+ayNRslIaBQJkyEsAAhsMBQkFo5qA
 AAoJEEn+ayNRslIah5sP/2O9swc5W4EAQ9GH0OTEnzJbCOBXP+IOodqmP5iMAq1E35hT9U4I
 i9CJGAgNfZLBSgTvcEU+h2mZvoLlg1By7j+meLfVm/vLK9nZtjIJu2XKfVNzsCyYc5QHAscS
 0J5MCSHuJhAXSzXfenmZ9rXxm6I/zCtRWnniNReMMmLItfiFLIIHp9X9eICprjAGqVLUaKRN
 K9ZaAVKQAdQcdTWYFi0tg5WS0Fz+CmlZBkmhqN0fdkHLHIbe3lCywiMIcR2uLZFutAbkQwrg
 pL480sMdpJbu8HLzPstfP+N4oLZOrHxFSNv2H1kynMwN7cIOO3BrIMXsR4Qw5Qomui8jC+eS
 hZhCBt04gHAEwiLkgoYag+uuU9eNjC9Lx3Nc6J9RfhVFSKuVNgPR665DxcCEfu1Jte8RQadP
 8DQYzMinMU5ehz6guSl8qUlvQ1NT62xa2Y8FlGX1jzHRL2ZXcH3jrAO9ZgIVnPcxaE4xLv09
 fvq4FKuLwqmVP13zsl/D0twUUMZjmRrJE3NhF8EcJYjYB6pogIGKZu+F5PCVmRPSkZ34CIMh
 8ArivO8Ok8pbLBBzJVehxOXi+06cwMUXs9+lx3RVFsZiDWz2OJ1HcjfqW/NAiB0q7qH5D6hk
 GmkkvxDpJEPVzmCcCws7mxH2FE6llTKPJuUdLHGCNrtErU26SVHZP8X7
In-Reply-To: <871pgsmpzv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/6/26 5:50 PM, Takashi Iwai wrote:
> On Mon, 06 Apr 2026 09:48:57 +0200,
> Harin Lee wrote:
>>
>> Commit 391e69143d0a increased CT_PTP_NUM from 1 to 4 to support 256
>> playback streams, but the additional pages are not used by the card
>> correctly. The CT20K2 hardware already has multiple VMEM_PTPAL
>> registers, but using them separately would require refactoring the
>> entire virtual memory allocation logic.
>>
>> ct_vm_map() always uses PTEs in vm->ptp[0].area regardless of
>> CT_PTP_NUM. On AMD64 systems, a single PTP covers 512 PTEs (2M). When
>> aggregate memory allocations exceed this limit, ct_vm_map() tries to
>> access beyond the allocated space and causes a page fault:
>>
>>    BUG: unable to handle page fault for address: ffffd4ae8a10a000
>>    Oops: Oops: 0002 [#1] SMP PTI
>>    RIP: 0010:ct_vm_map+0x17c/0x280 [snd_ctxfi]
>>    Call Trace:
>>    atc_pcm_playback_prepare+0x225/0x3b0
>>    ct_pcm_playback_prepare+0x38/0x60
>>    snd_pcm_do_prepare+0x2f/0x50
>>    snd_pcm_action_single+0x36/0x90
>>    snd_pcm_action_nonatomic+0xbf/0xd0
>>    snd_pcm_ioctl+0x28/0x40
>>    __x64_sys_ioctl+0x97/0xe0
>>    do_syscall_64+0x81/0x610
>>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> Revert CT_PTP_NUM to 1. The 256 SRC_RESOURCE_NUM and playback_count
>> remain unchanged.
>>
>> Fixes: 391e69143d0a ("ALSA: ctxfi: Bump playback substreams to 256")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Harin Lee <me@harin.net>
> 
> Applied to for-next branch now, as it's no regression in 7.0, per se.
> 
> But, I wonder whether fixing in ctvmem.c would be relatively easy.
> Isn't it only about ct_vm_map() and ct_get_ptp_phys()?
> 
> 
> thanks,
> 
> Takashi

Hi Takashi.

info.vm_pgt_phys is set in atc_create_hw_devs().

   ...
   /* Initialize card hardware. */
   info.rsr = atc->rsr;
   info.msr = atc->msr;
   info.vm_pgt_phys = atc_get_ptp_phys(atc, 0);
   err = hw->card_init(hw, &info);
   if (err < 0)
     return err;
   ...

The atc_get_ptp_phys() function actually calls ct_get_ptp_phys().
However, the index is 0, which only retrieves the address of the
first PTP.

The hw_trn_init() for CT20K1 and CT20K2 writes the value of
info.vm_pgt_phys to the hardware registers.

   ...
   ptp_phys_low = (u32)info->vm_pgt_phys;
   ptp_phys_high = upper_32_bits(info->vm_pgt_phys);
   ...

CT20K1 implementation writes to the PTPALX and PTPAHX registers.
CT20K2 implementation writes same single PTP address to all 64
VMEM_PTPAL and VMEM_PTPAH registers.

We don't know if CT20K2 hardware actually supports independent PTPs,
and refactoring would be risky. So I think the current approach is
the safest for now.

This is what I've found so far.

Thanks.
Harin Lee
