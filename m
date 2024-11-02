Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915451494B3
	for <linux-sound@vger.kernel.org>; Sat,  2 Nov 2024 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587539; cv=none; b=LVYjss9y1fnZv1kADaCSjDZ2prg/Q9zPlsIbF1wyzw/EiqWKUSJvjwWihRjmlerVaoGIML/T8JRPj0gIGabqvHFZ2pZADJoRODpBkke7/qSsDVj0DNnzi4xmhmri7pV7FdstG24sOyuY/+mKRsCyPmg1P7r5rspf+4paIvzRvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587539; c=relaxed/simple;
	bh=ttm/NiX9Parvdyf5QIMcS4fEy7VbldHvIlVnlMxNhKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsafHOuXvZyal/E8aK9HNQZLWPDJbFRXx6QFOm4aaiHdSsFWmyJMfmGauLfQaU41xwuhwc4zQOUm1x4EwKNZLnbqxp4z3r3Q6pwqblOwyimpr4Pvwr3j/OGjhGSXhtdi6rygyuZopKdpHqBslYHu1xaSMwf48VVbVDQfLus2bBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1qx14MW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1qx14MW"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3159343e87.0
        for <linux-sound@vger.kernel.org>; Sat, 02 Nov 2024 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730587535; x=1731192335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccpxx1cczXxXz722cwlyJA1ab7yRJrEjgxAOJtRPbio=;
        b=G1qx14MWnppROTPBXRuc1ol7sUThhpZX6V1fMTL7zCION9EXXsPFacEDGgJppH19f9
         eX78+LGhueqefUmt9MMg1G4wU6sRinCV+p7QB4M/P54aXwjNJ654u9u40I/NGXtxPDqw
         Ja6k8z8JDCjH1vDcnqFQTZl5HBd5Vh1XS2LWQqDGd+y21okoFI1P9Js2KZWDm1E3qg+V
         M5AaM74A4iXLKXPaoW8kKUW6n2vvgniyVCbVvtik8bb7romg6UgYdZKuDwMnk+Txl9eU
         shy+Z5omNr6U6DsJ6nTQOo+ls7sX7TmOcZa7bXBj7xggvVht2M90HngvAOmnOLNYLco4
         Fm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730587535; x=1731192335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccpxx1cczXxXz722cwlyJA1ab7yRJrEjgxAOJtRPbio=;
        b=jcdGGC2LjfMLpAjQYSDXXPQgpHOLxeZkUSCt7UzuZbimgljOHuh8rybofosOIvvSE9
         uENXfYd06PTPlP2l0tcS2gHYZpB+5WTMFIHUZr52tO215zI9ohq7vd/ecLPv9DEYVGdJ
         d/z18mVR1SRf7Rp7ogTv8OjVs6x+7+/AmpqA0rqtPzoeieMt9Q5TwyoWbOphgrxkqWuF
         8CIeBYLbPey5+jy0HY2XGWkDadIH4a2eNqAhLqSzsSFkDMrI+icmI9kvTUOfGK1YdIWh
         NGmWcVfBW+mjyZMP6wdBWV6Ykju+DvGBZ/XrqotxTYeUd5yYPuyueLuzutjIzWkPvQxu
         V/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0IpcfOUaAf40ajp2FHEf8/VtoGeGeD7rgzv0UPC8VMFm86m7dzcOFjfuthI1lMKKRcpzt1le1soXUOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkdAeKnqCAcavGuXiFIgJC4xDVKNsyAfJGuqVagbHS60XCqS8I
	6WhG+vl28fisT2wHhy9mz1gy4GaeluKlsJEkka6rfiLr18vtzvTT
X-Google-Smtp-Source: AGHT+IEN6ulwgHJ9QqJjg7OIDe3U+hIJhWgccLbUOjLPH5tOTFTyqliDeDEAqgosztIlunZBBgD0JQ==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53b34a18f24mr14193976e87.38.1730587534331;
        Sat, 02 Nov 2024 15:45:34 -0700 (PDT)
Received: from [172.24.224.254] (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9571csm1081727e87.48.2024.11.02.15.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 15:45:33 -0700 (PDT)
Message-ID: <18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
Date: Sat, 2 Nov 2024 23:45:33 +0100
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
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <871pzuujkc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/2/24 09:27, Takashi Iwai wrote:

> For checking the runtime-suspend, at best check the sysfs file entry.
> e.g. cat /sys/bus/hdaudio/devices/hdaudioC0D0/power/runtime_status

OK, so - just to be sure - I verified my assumptions about PM state of
HDA controller when "nothing interesting is happening" (suspended) and
for a short while after I generate a beep on a console (active) - so not
a huge surprise here :)

> As you see, the simple beeping stuff is really complex due to its
> history.  Although it's a legacy feature, a few people still love it,
> hence it can't go away soon :)

OK, so (again - just to be sure) - I understand that you are going to
revert that patch this is all about (no more tests or whatever needed
from my side)?

-- 
Regards
Jarosław Janik

