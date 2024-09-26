Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B313B5B4
	for <linux-sound@vger.kernel.org>; Thu, 26 Sep 2024 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727367128; cv=none; b=C/EGXpVtSCO+sB52NczKUZ9KcmUG+M/Ta4kC9Mimea5HSESev3K8InxKt9IsIv36Pes6LjAXdWefOnhk/o9iRghjxcJPcG8F//BrIxnVpJ+d9FvNO+27bBEeBIYVs8DnwBdIf3UPzel/6sJh6fQiLw9rZAZu2sh6uvoZGIQZ5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727367128; c=relaxed/simple;
	bh=nkkwDyXoxEAKcaBvqfwuPFrD/PqXfR9ogYM2RBVmcOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNR/GabRXyvkzHSNFf587AVqMUpBL2ed/HwtX+AB/vTyG/G+AtKLZEZVCalyzyYHgGXbKhtpNYgX+Y1CU8LF3pz2qdFlJ1ayhHDSI3J9dOg66Dbb9F2PdYamxSzUUHnpcGMqzHT8T5iKUHahqzFyXu36LftVzwhkL6GRHgG9PJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CXF3isln; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CXF3isln"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-82aa7c3b482so45695739f.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Sep 2024 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727367125; x=1727971925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXe4I9fA3wiOsNFl3/de9Hw6T1XdMoOh/1M8Lx+MHF0=;
        b=CXF3isln96IEGJmWdm9kFAXjW8uZC0nGfZ2ZJMvVJz0vsX9Gk8svvfUn7nYceC5LoK
         QUO1O91yoEFjLG+sKaWFoKjUsi28wEZcPWcRuH5dWGB1MYthu+XqV4B58gkp2BiioAkB
         iB4xdMrbcl/cTa8SilKSfkCYyGHBzasJpCRzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367125; x=1727971925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXe4I9fA3wiOsNFl3/de9Hw6T1XdMoOh/1M8Lx+MHF0=;
        b=c+QL3Tio/WytX/VWgjg8IHZ/iaQr6DegpmFtMn0F/xAAM6qQy5+3u98d0SfO+sMbUo
         zeBH7ygVYUAY6eO6h2EsrieCBqnRmRH/r2wt86P0m5xv4aTlUd8GVdbUHVQROLHD16Wm
         cpiKGtjBO1RQXRMGVjFC0s6XuIral0rcOQrebkvuFWsIMAz+dOhNCuziu6hJ8xrHxLg1
         JRFmHm9JRzDaIko6DGzNfBrLyopjSNff9l8VQRQecnEa0PqyqG+PyR77YiiHbkt2GhQz
         bAXhZ6Q9Fs7348HOftVuQggHi0QqdWI2blSvt5PNeabgimXezTVvYaPmEkSYelsa+XDW
         Yr3w==
X-Forwarded-Encrypted: i=1; AJvYcCUhICxUIm8rgRK5ZTa5YhEm3z2RjVnJjU6WxWdcUwJiOQB/VTklC4GF7uKEYjTo6wF/Uqnha9/ZrTZWug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4k9yRbSo74ih0zbaUrTX/fMm9Ciq23gx/dy6Qg5lZW1w70+z
	IhCyy1ejPqNCC7xdPdeWswzWZ1nz6vOuT4uHbhkS+nRz3Hu5Ov6grEl2K2dSMlI=
X-Google-Smtp-Source: AGHT+IEvE6107yExovZjcFsUxizIxC4rtlHj+wopr6Fb1m++dX51+cu1X/5Rl1UB0wF4yNFN/S/dGQ==
X-Received: by 2002:a05:6e02:1c47:b0:3a0:bc39:2d8c with SMTP id e9e14a558f8ab-3a26d7d0a87mr70629835ab.25.1727367125014;
        Thu, 26 Sep 2024 09:12:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344df422dsm101335ab.81.2024.09.26.09.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 09:12:04 -0700 (PDT)
Message-ID: <ad6b7073-4fcf-41f9-b6ff-e01bf7089017@linuxfoundation.org>
Date: Thu, 26 Sep 2024 10:12:03 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, perex@perex.cz,
 tiwai@suse.com
Cc: kailang@realtek.com, sbinding@opensource.cirrus.com,
 simont@opensource.cirrus.com, josh@joshuagrisham.com, foss@athaariq.my.id,
 rf@opensource.cirrus.com, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240926155112.8079-1-abhishektamboli9@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240926155112.8079-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/24 09:51, Abhishek Tamboli wrote:
> Add the quirk for HP Pavilion Gaming laptop 15z-ec200 for
> enabling the mute led. The fix apply the ALC285_FIXUP_HP_MUTE_LED
> quirk for this model.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219303

Were you able to test  this on HP Pavilion Gaming laptop? If so
please add that to the change log.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   sound/pci/hda/patch_realtek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 4ca66234e561..94125a977f08 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10315,6 +10315,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>   	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>   	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> +	SND_PCI_QUIRK(0x103c, 0x88DD, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
>   	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>   	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
>   	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),

Looks like this has been fixed:

https://lore.kernel.org/lkml/20220918171300.24693-1-dhould3@gmail.com/t/#m0c6aeebe5cc89c9a4228d49f56f4a0a4c516e012

thanks,
-- Shuah
