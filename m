Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7A1C6FFA
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708384; cv=none; b=Px+/6MARfjH96/Ln2lbpEiot6RvJz5oNZzAi8aWqn9XZ+IeNt5viQoeq8YAAm7Y90AmphXrzgOKoMdOjY+t4nN4KSpA6UpUx8bHjWtmqWw4e0JcRNTYN0HlERFH7UqjYpFFID8NtKqFlREtN4cfX4IYGr/IEPEtS2LQUKm9Q7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708384; c=relaxed/simple;
	bh=r6W3TAOXhv+5I33ck8TeWRk8XDjF0Jyia2bnyr+cShU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfSo/17r3pEX7iPeJ50Ggh1pUcBoQNOrIJqCU0EQzpBDgIhkLXCzxjiZJ57qy1j/l0sP9uPTfKt2tFDc+ShjYKNgCf8F5vPpUceyqdWfPH/Cj7SvvGT+ea9jooCu3eiHxIx+w44NYqSWobz0yav2P85gugFwLbH+D4Nlr3UJRPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=czydLpKu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="czydLpKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744708381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQ9QjN4VEn0nJAxOgbUJ+2T1hskXaPqWVO3KAvXVmSk=;
	b=czydLpKuk6NsSCdwtq7jAqIxaU2nI1xCbnR0w2VW72kvMbll9wqdW7wuNawIbnK9KbWW5a
	9R6GE8qh2bglMvh0k9Mb3rlELaR2IAmOzV0BmR1u5mKBielE1UDgPCRuPgPe1J6L4k1/aZ
	kmjts7HPNXLuWccaujyLQmbvTxlMyDQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-G_d0wsqEOeibn_FhYMi1cg-1; Tue, 15 Apr 2025 05:13:00 -0400
X-MC-Unique: G_d0wsqEOeibn_FhYMi1cg-1
X-Mimecast-MFC-AGG-ID: G_d0wsqEOeibn_FhYMi1cg_1744708379
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5c1bb6a23so6341928a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 02:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708378; x=1745313178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ9QjN4VEn0nJAxOgbUJ+2T1hskXaPqWVO3KAvXVmSk=;
        b=TzAhqijYVpp5/cqlRUVAJRvDd41cpuCZdOxK74SuFZLbf6oNUJubYOH8iVdgnRG7NJ
         qsv6z2RO7+XNVYdbP8tlB6czmj3vLUfZeV+W33hHj3jAUH9VTKCAIlztaqJHDY8CcTZO
         VTUCeoZ58Uz5zbqauSouwRM7Z+gibsysft5Ez7InNO2Wj0nF+gt85tMQ7/O+SPVSUcV5
         WTnNF4Jd3ksF/9CDHV7d2vu9+zEmicSNGGc0QdlWzV8JyOSVyXLRbcr5EAXcKjEIhtN6
         P/XbCN2+KUAOP4ugofPcEMZYzFixV4gCf3DPm/v9ntc0YZSQrwYboewrf26+IaKBXsPa
         nCUA==
X-Gm-Message-State: AOJu0YxnOgHSIeO1llcKIOiZXcdJrGKRYgC98cAqycBNTVgoJrFDqgD5
	aGKyrb+q4phh7prWgJIQTnf21mlrOKxTDLv3MwXhfF6wWilmcjvvM62Y3h+oP3vXKEnIYwVSZ8Y
	9LDIihv1S51mEYeawgXK/D2jqq6+12BAaatQOz7RaQfP8Jggt4CNSeGgVx23/iCDQZzVx
X-Gm-Gg: ASbGncvRnlJKUEvGEUO9dc7YbEmUbR374cLb2WQSC1+/p+ekUFbMIckIldmy3fBegNL
	nr6XTw0AJRAcNxt/C39H0zrMoJlHLwvpKvSQ3dwR1BjQOZqBauL23JzkMCR3qdpQEfOCcgktzkL
	4yXHc66ANB82ESkB5fKPyBdn13x/5oS3N+9t36pncPnhLyerglfbpVRldHiRponbwFPJxCNxiOE
	tw+7CzstXTYJdLBcGobmh+bdhAQ7A9uZmYdILnDdtPXhACY3fD3c01/mIY56NY3wBfgNeSorUuR
	BZdF7zdogX5CEg8F1vDD5tDbJLgSdXT4d77LAsiEW8Uh6P/4J/++0tpdCRUffktH+u38w7zeLx0
	M+e6tn5vDktwbfmZjDfnueYi6SGHWdA1zSfQiNth/iwvmLRlPWf1JpcdGW6Myfw==
X-Received: by 2002:a05:6402:254a:b0:5ee:498:7898 with SMTP id 4fb4d7f45d1cf-5f45e014c40mr1768653a12.17.1744708378378;
        Tue, 15 Apr 2025 02:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG36Gyxf/DEeF7RNkHtAhtBDHeNR2Gi1h1QMf8Wcs1F1vdbSVZMkb810rpK4xUpuKy4hcncaw==
X-Received: by 2002:a05:6402:254a:b0:5ee:498:7898 with SMTP id 4fb4d7f45d1cf-5f45e014c40mr1768642a12.17.1744708378000;
        Tue, 15 Apr 2025 02:12:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f5056b9sm6224195a12.51.2025.04.15.02.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:12:57 -0700 (PDT)
Message-ID: <61e9c9b8-9ab1-4b6d-adfe-41848bc6b30c@redhat.com>
Date: Tue, 15 Apr 2025 11:12:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: Intel: byt*: Avoid OOB array read from the map
 name
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20250415083144.6588-1-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250415083144.6588-1-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7V4kItjJERsDtfhsQH3UV9Alvff86kxH7ZozlqP4e5k_1744708379
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Takashi,

On 15-Apr-25 10:31 AM, Takashi Iwai wrote:
> While reading bug reports, I casually stubmled on a UBSAN warning
> about the array OOB access, and this looks like a real bug in ASoC
> Intel driver code.  So here is a series of quick fixes for them.

Thank you for your work on this.

If we are going to do this I think we should also try to make
the handling of invalid map values set as quirk consistent
between the drivers. ATM we have:

bytcht_es8316: invalid map does not log anything, behaves as "INTMIC_IN1_MAP"
bytcr_rt5640:  invalid map gets logged as an error, but not fixed, behaves as "none"
bytcr_rt5651:  invalid map does not log anything, behaves as "DMIC_MAP"
bytcr_wm5102:  invalid maps get logged as warn_once, overriden by a default map

Note the "behaves as" leaves out the problematic OOB array access,
this is for the rest of the code.

The above means that your fixes for the bytcht_es8316 and bytcr_rt5651
are not entirely correct since you use a map name of "none" for invalid
values which does not match the behavior.

And for the bytcr_wm5102 code your fixes are not necessary because
it does:

static void log_quirks(struct device *dev)
{
        switch (quirk & BYT_WM5102_IN_MAP) {
        case BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L:
                dev_info_once(dev, "quirk INTMIC_IN3L_HSMIC_IN1L enabled\n");
                break;
        case BYT_WM5102_INTMIC_IN1L_HSMIC_IN2L:
                dev_info_once(dev, "quirk INTMIC_IN1L_HSMIC_IN2L enabled\n");
                break;
        default:
                dev_warn_once(dev, "quirk sets invalid input map: 0x%lx, defaulting to INTMIC_
                              quirk & BYT_WM5102_IN_MAP);
                quirk &= ~BYT_WM5102_IN_MAP;
                quirk |= BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L;
                break;
        }
        switch (quirk & BYT_WM5102_OUT_MAP) {
        case BYT_WM5102_SPK_SPK_MAP:
                dev_info_once(dev, "quirk SPK_SPK_MAP enabled\n");
                break;
        case BYT_WM5102_SPK_HPOUT2_MAP:
                dev_info_once(dev, "quirk SPK_HPOUT2_MAP enabled\n");
                break;
        default:
                dev_warn_once(dev, "quirk sets invalid output map: 0x%lx, defaulting to SPK_SP
                              quirk & BYT_WM5102_OUT_MAP);
                quirk &= ~BYT_WM5102_OUT_MAP;
                quirk |= BYT_WM5102_SPK_SPK_MAP;
                break;
        }
	...
}

and log_quirks() gets called before using FIELD_GET(BYT_WM5102_OUT_MAP, quirk) /
FIELD_GET(BYT_WM5102_IN_MAP, quirk) as array indexes.

IMHO it would be best to drop patch 4/4 and for the other 3 machine
drivers I would prefer to instead modify their log_quirks() to be like
the bytcr_wm5102 code both for consistency and so that the behavior
of the code is guaranteed to match the map-name from the array.

Regards,

Hans




> ====
> 
> Takashi Iwai (4):
>   ASoC: Intel: bytcht_es8316: Avoid OOB array read from the map name
>   ASoC: Intel: bytcr_rt5640: Avoid OOB array read from the map name
>   ASoC: Intel: bytcr_rt5651: Avoid OOB array read from the map name
>   ASoC: Intel: bytcr_wm5102: Avoid OOB array read from the map name
> 
>  sound/soc/intel/boards/bytcht_es8316.c | 11 ++++++++---
>  sound/soc/intel/boards/bytcr_rt5640.c  | 11 ++++++++---
>  sound/soc/intel/boards/bytcr_rt5651.c  | 11 ++++++++---
>  sound/soc/intel/boards/bytcr_wm5102.c  | 27 ++++++++++++++++++++------
>  4 files changed, 45 insertions(+), 15 deletions(-)
> 

