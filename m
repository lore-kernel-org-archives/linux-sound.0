Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621381E4113;
	Tue, 21 Jan 2025 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737466417; cv=none; b=U9JDphcgVkymhjsWqpX8vAfEh9t9t8kiH/m+kt2JdrriIEE8ZY3S3HWHH/4EJ+a5/Bb2Ai+W4XnlnhBrwrhMp/cecNIMtSOIdG2/kv/iHV/Bxn5weE3cxFLCBNfBtPj7prrY9lhNo//AEzecmOY+R0zKQ5HrP3hlkm+nxRdWc6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737466417; c=relaxed/simple;
	bh=73T+48Iq1UkAijkYK+1JE6VeYrnp8/HTmOHgqwnVNF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BD1hYwbE8QqNE37WKLC4a1p9OdtsbS0mOjEnz64Pak5MaVotPFI4n4eSCsCoJe2wXPrJ7AqOJdC/t8A1fldQQAMXGDna9OJ5RjMwtxXthEcTjxExpLR9pO8wRaN8GBddwKXXI4mJbHRRgs6p5lTkweRqhipwHoR1GwrKJ7eNTQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQqvBr64; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQqvBr64"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363ae65100so61887585e9.0;
        Tue, 21 Jan 2025 05:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737466412; x=1738071212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0JGk9OrGx13ZU+TG5nF+EoRGtJmpx50bG8Cyu5WpCs=;
        b=gQqvBr64ai+OSZJud+eFfGk1fu0d5SSNNsbzpdTg+WPQdhHLydAhwj+DITmPFlufht
         tzJ677ONe7lLUmHhyaSKm5qdkTn4bW2N+zAt28bvFo0EHvEKCWPw69zCpuakw70WoeEJ
         F9S5GTltU6AEWsTlBbnBeu+aPwuZ0ulV2WWoAScdxrdU2j6ffC7N48ZG/xPnjQh7ieCo
         P9aDpBYEp7EB9Te4c7HWD4zjZQ82Ws0YkmnvK+D8+CxPOtn88QYmrEzXxyMFMD43W3l/
         HYSajK/Pb9cUD/aqSUY/a7d5Cyx3yZCYrd3y3CLkmDPFj9RR2YtzSKlc1sr00XDJyzsC
         eSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737466412; x=1738071212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0JGk9OrGx13ZU+TG5nF+EoRGtJmpx50bG8Cyu5WpCs=;
        b=AhYbya9osqpGXU5BQ9UPKLyxMiZmmpRQblCj4FS9wMxfIk0O9jqPqSvM2qFIqNR3uk
         lzg6dYZKCl99/EWzwi4uSb6JDcunepDvfccIBNgnqQZ8oSEJZeQj62m8Gdxkt6TxzYLv
         w9Fb3ILg2ltEVkQYRqY073a3hVarVBqfqHgf92RQ16EwAMFiLdppUXKWIBysSAvwh4YD
         T//xxKxMx6F9uA6BYsb3KcPMdCrIywpl3gqfMZ9KhllzBbDlOgsJATd8FDI79KDr6kFC
         KQbE55zda83AtQ3qIdq2DXCZiFQ/wEPB2RzA74k/VWcyKJJysXygeYL8VRUrLwHuvaQz
         LnsA==
X-Forwarded-Encrypted: i=1; AJvYcCUOVVlIB3JnMEWw1MKqjoWsrdSsc0xR8wSGJBckb9yeLgYgm9NGhN2qatasdQX1l5fFnS/zuQsXCcDMKcc=@vger.kernel.org, AJvYcCXHVS7fkbDkoKOvnBjkVIv/GKiF/SJgN09DBpKvNbBN8E2fUZm1r+Aal7iEkUfufhLvmKGtauxIlJsdJ48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSijMXTBO+889m7ujrYfHvuREcnF8IBZU22ewMUPZuplTypgcC
	casd/+KDsYjP3jjn77XK5B8esBC+nLMpiEI/VkCzfHaeieC5SYLt
X-Gm-Gg: ASbGncths8vO2osbAiZJCdM3Ma3r4NcX3xlo0Y1cotF26WDiiyzVyyOoyhy41NYFZ8t
	JYpmNyBo8s59ykPKp6Jdl+Dd1Xo3+7Hyo50gbAAeFOJ+Ky1LtqzQf14jw2zurtVOt58Bs76G/ai
	3TlMG2hW2GZmDC9pYPIg0JY5IgI1YxjcJ+lHFE8l2wgTwuX7mzawc0RfMNLqRYeXN6iioMxZqU/
	4dd9Or/YOxDnPQgkRgXIY6Y6atIR+JTLzBB6kflFPds0xk4Ikca4KcMIIdAfiNjW79BsBAQsxIc
	5K3A+d0=
X-Google-Smtp-Source: AGHT+IGQJrXP+Q8txeTtxjer4X1kcN6Vl05OObEDyaLTbR1w0i2g0XCt/pnhwE5QmjVAoFRwxwz3SQ==
X-Received: by 2002:a05:600c:3c82:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-438913f08a2mr187721085e9.14.1737466412336;
        Tue, 21 Jan 2025 05:33:32 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf32755cesm13318096f8f.78.2025.01.21.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 05:33:31 -0800 (PST)
Message-ID: <da9642c9-a6e0-4846-a438-a5c84334cf36@gmail.com>
Date: Tue, 21 Jan 2025 15:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: audio-graph-card2: use correct endpoint when
 getting link parameters
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
 <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
 <b111824e-d691-489a-baf9-66c6e3ec7a0b@sirena.org.uk>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <b111824e-d691-489a-baf9-66c6e3ec7a0b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21.01.25 г. 14:18 ч., Mark Brown wrote:
> On Tue, Jan 21, 2025 at 08:48:15AM +0200, Ivaylo Dimitrov wrote:
>> When link DT nodes are parsed, most functions get port as a parameter,
>> which results in port endpoint@0 always being used. However, each endpoint
>> might have different settings, but those are currently ignored.
> 
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
Ok, will know for the future. Shall I resend?

Thanks,
Ivo
