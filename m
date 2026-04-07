Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD1E3B19D1
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571280; cv=none; b=N/K7u8M1L3JPGkkDpMXSj2dzmLltYWhkL3uA9jgT9ZrdMjajozt47rFBWssnZ9m/bEhW+rbT3J8xjYfc6KMVVGGPtD8HY551JuLqtRgjTE8p1zVdD4sgoU5Gf+MeOWPbEjM/8I6P3sZWwOmK2IkXWdapG1K9X3oJtTBygFdK75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571280; c=relaxed/simple;
	bh=UsMg9wNm1R3pxsxmK0galiQ2A9flf8GkTHa728D7cLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYAHUquDRxnzOPC2oEBnkNw2z3TloB+6gMVva6/qAvoVd42R89RejiZDygBSok6+uQbVCLZJ5hwRcry+eix3lMG3QSkRkeSsUeuOycfoYiB7qQODacAIJiNxQ4WbGpaJ018c2/VWTQwmwMvHD7/y5ZKON1T8vgthp2Gs4tIf0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QabR1XWU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QabR1XWU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso46960615e9.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775571278; x=1776176078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAnWzEPQoA2FJRVlcq9BndgUIdvLuLoG6VyrpTAb4eA=;
        b=QabR1XWUqW6qGQ3U2cxZDgTWiil9OAmM60aR949uRzcZjVwJCDzzMoDofpXBSyRTru
         BZ41F5z+w5PYr2gM67Hn84Zkadlz8FdulF9dL4nVZM7ZFTgyAEvXJvRkt/mRUV/U6wHI
         bLOdheYc5lSTdoM+CDIP3M07Kb/E9mnoYQa/BTICG+aoREW37ma8Idjvp4ahKNxvF9AL
         oQM4Ab2ME0tY6sByRbH+zan906sQxah5BdyvMX+dIuOuHrBQ4DmwthirbNWOxU1Ij7Kj
         2IG3T39dukmK3ozn4SP9smkn/Tl+kmffivEyh4aCW5Kf/nJRaM1v+E9b0CvCAGJuXeYs
         Ur1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571278; x=1776176078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAnWzEPQoA2FJRVlcq9BndgUIdvLuLoG6VyrpTAb4eA=;
        b=rW/jsweZ5wcd6Kj12ip9qu7OiGhgKUIPRDeGUX4CiIMuaT+sufsV0OuUWWHg+8EZKK
         oIlwHmLuvbeIbDwtvATDiZXxP0RHdBzCWGfHfF1QcyKSCEqWvkznZDtdlxTP5eEHpvJA
         XY8bkj6piE9cH5wASu/1OgXs/ySk+V0vx0KVL1Fzciub8AHQnynfCNrMFGY/XwpAi4Ey
         JNdgwtL+Xr2JvmYh9veOOeeTUP5bLrcriOVx9/au4FiwDO5UNxM6bDSvoFLfQhFr4lhN
         YTQGGPSBH9bnCIbDboSVOWZsJu54v4D8eNA4jRG5BBsac5xxMPRCBI9ftux4ga7jdbRn
         y3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVDBG338hmAlsYdt3bQTa+Fxd+Jx714DNrt6C4geuSfK2kk/W6RoqfTymYEeng8SYqW7DPpuJNnTIrNhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ZMFgaRwlS4cBmBAxjKfimTOt5V5kBBnnXsO24X4qGoyOBwpQ
	G55xMKaYr9q9X/X0bDuDVQb1Vw3wEWp+4Ir83hCNKSU+R6hpubZMeTW0flerSehBExjkexp0n33
	uxm6z
X-Gm-Gg: AeBDievvEtuQNBPf+iRhDnEdgDE8dcG1LZ+OFRvteLJnZC5Vy3w68Q2Uwb7+KLAwRR4
	FSpunzgQYr1ncBqfTUcdEgjku0TU1QiaqNJaeDcL+S5GiZyvmMaIkW3/5ikIIsQAgy6Q7MGba5h
	VlwCut45W/eDkThCnbExBgzTVSIK3I6sdT0F2VwxBc6jCcUi0F0JZZsMr5L1iLJyokWygHFlPMf
	FIJ0X77C5aK5LRdA3C3SFuJKqmy6iSsTm37DOqNAfRYIR52snLlClKisORTIiQQ7ZCFYrtutCsA
	khMqescSZw+tjl/qSnIbUaVpRGFQE5sm99F6MJ9W6SvKGhNB5L8ezHyydEeNPisuGHkLtWVj2ny
	m9EnkbeRnpHaNgzqFc0PfueIRvdY3qK9wlJrgUWDc3XEblMMN0blj0Lp4e6IFbtMjhdTMyRIyvK
	Lpl2bmWgbozFHA5EYW4J0wHze6EzttAtY=
X-Received: by 2002:a05:600c:8b32:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488996afe1cmr234508035e9.3.1775571277569;
        Tue, 07 Apr 2026 07:14:37 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm538378125e9.5.2026.04.07.07.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 07:14:37 -0700 (PDT)
Message-ID: <27486df6-2a28-40fc-a5aa-daf07485ea5a@tuxon.dev>
Date: Tue, 7 Apr 2026 17:14:35 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Drop the space after ! operator
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, chleroy@kernel.org, zzzccc427@gmail.com,
 nathan@kernel.org, mehulrao@gmail.com, bigeasy@linutronix.de,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260403132301.2743319-1-claudiu.beznea.uj@bp.renesas.com>
 <87bjfunb9z.wl-tiwai@suse.de>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87bjfunb9z.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/7/26 16:35, Takashi Iwai wrote:
> On Fri, 03 Apr 2026 15:23:01 +0200,
> Claudiu wrote:
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Drop the space after ! operator to follow the coding style.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> In general we don't apply a patch only fixing the white-space or
> trivial coding style issues alone, especially for the files that
> aren't really much modified.

OK

> 
> If you have a cleanup as a prerequisite for the further changes, I'll
> happily pick up together, though.

Nothing more than this. I just went though this code while working on [1] and 
noticed the coding style inconsistency here, thus this patch.

Thank you,
Claudiu

[1] 
https://lore.kernel.org/all/20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com
