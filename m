Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A91A275
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 01:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860578; cv=none; b=lU1yc44hFn3gkyEOLFSq0Gkqw7Kjzm0csRs6JMxjR3Ld1l9VhZoLYso/7T1hUfXcyElzC3WQVuSYP8NQJb1cGDTQcHV8lNb6wmfTOL47szxyo25Ew0h8YiWBId9WFq6PpyLTxT6/5LDMwNlljtT2wwAKiBk85Dy8GKGxriaEzHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860578; c=relaxed/simple;
	bh=dezn1tlNSwn61vuysSJhoWxD9vkcEMM9i1EgpXrMFlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MP+4rf7BLRsC9xojFSHQsKkjJH3PUKglHsyTMo4wxHtz8AxGsOigC077p9sZ5Zx3yZRt/4t0ilsZ/kFmeLo7o4PtkZ/OYJAs1/eDa2lKgM+00XXFNBOTYMHQaOFX5GIx1XTAuqIn21RtXq87FeSRj+4EMNqZL0HkSVZQrjBF4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlSXrtYv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlSXrtYv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824adc96ad2so573566b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 17:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770860576; x=1771465376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0lqwhXJbHRySA1dbjzVngLdYDWrJfx4jfbqwh3Hv3M=;
        b=NlSXrtYv/i7N2IDRPar09u041C9VJ7skAlvB/Zc9uvV9nEZj4pzxqnNhjYjc/K99nQ
         hz+l2WP7WL4ar0c1u1xcQ+UuxaNpM6scpTTE11bJL7TfJ7QM42irXy42FE9NQLw4N7k0
         9FV3zsA1Z/EXJ7fGReWPxKGCtAcromr3DIbmfhRon9C6rwLu0Q8Dp5tGfwvBc2BwDv9c
         JT7d4tWjwPRkA5X/9ZQR0k7dmeXjGqMF/NQGoQxUsS9hhGNZ38FYMHuHRn2AEkm58c4S
         qJru+ZF/XN2Rin35W2BdcgAb/bkQjUAFqtqR2xXQtPbFCIygwI+yC/UPTRlUBJ5MZCSX
         UMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770860576; x=1771465376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0lqwhXJbHRySA1dbjzVngLdYDWrJfx4jfbqwh3Hv3M=;
        b=RUD4lXnO4wWuvlJLWHQdG1tKkCgDLVi6zCiw1au/56dKXzXe6AYU60YpyEY4cNhsAn
         8B7oSM4E/rKfbpG2tSAJ512Wx06zJJaZVGeTUAc6oNcf0gy2r3pqFE/FWxQYUpPeMguj
         QNaRE0FYghouG/gahFDR2T/FpYd+Z2kMSUB2GpV5wSIH2DneaEha+jEVZpRpG3tXqzny
         ipY891NcV80wwn1NMgp7Ndv/Iw/uBW+BA707l91mQKH0HLDBCe6bmbeo7kTGo2NPa/1t
         PJRcpsBdcD9PDvo4ffClh9hNybtejhmqZREXZP1S+R9dz53Nh/y6XPSIBtGrL4UtMomx
         Na5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGFx3hUwB+Gmd2cPijXId+4yCJw3UurDa3fk+CZLyOG9jOry8/lNNv2STHPk0/aw8CZbXbF2CxGUcbdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5TKAnWonC0e+pFPDi69emfieWDsY7+clI6hnTCqAFd1Tk0qc/
	v6ONdP/nwTtuHfEsVBQchgropiIc9rrbKByQcMEWLm9ObnxGpZaiWilM
X-Gm-Gg: AZuq6aKcH9TBlvQN0R3PF9zrho7QZtbat1PGrakMb88UN/O8ClRY4SbncCHYi6fsgd0
	cvFWuoR3wRTIuTJZKq5suv/Rz9V66XyUrYyxvZzgH+8PNs+MihLAiJnw40MELKmEpW/lExcqry3
	40PsL82WT8jJ9noh26QxAErIWs7cGY3Q+mbcw8ZIt98myvE7Ilh5fyQJqvwdfwJtNUW9NrmpXue
	cdYOdTxjoCvxcAECyGGdJh5oZAh4g9952Ab63CvQfyRRYrDw7Hq4AdjEwBnyh8EJa6M0iqmDs+o
	zYxqYCXbt2HCQo6GznRwWa38kuW2GNcBuCleRQFdeGRIgUQT5couyCjKS/VzuxhZPzLgh4wAoMy
	kYzlnZ74tyG9Nlelo+kp+cjWvTS91tuI4w25MZb6WuXiXMfcVeTY2rA8mGxkJF6UZN2Tg3yfryQ
	==
X-Received: by 2002:a05:6a00:348f:b0:81f:22ca:257 with SMTP id d2e1a72fcca58-824b0477d50mr981515b3a.20.1770860576183;
        Wed, 11 Feb 2026 17:42:56 -0800 (PST)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e85198bsm3175306b3a.60.2026.02.11.17.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 17:42:55 -0800 (PST)
Message-ID: <a68b5c3f-3938-4402-80fa-08da74b87405@gmail.com>
Date: Thu, 12 Feb 2026 09:42:52 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: amd: add DMIC support for RPL platform
To: Mario Limonciello <mario.limonciello@amd.com>, vijendar.mukunda@amd.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3487b803-9c65-4371-b83e-c7a24ad45e2b@amd.com>
 <20260211115008.100239-1-qby140326@gmail.com>
 <a33d3400-81e0-4090-873b-7687acab4893@amd.com>
Content-Language: en-US
From: qby140326 <qby140326@gmail.com>
In-Reply-To: <a33d3400-81e0-4090-873b-7687acab4893@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/26 23:21, Mario Limonciello wrote:
> Your diff should be relative to sound.git, not relative to your last 
> patch.
>
> That means you shouldn't be "deleting the rpl directory" because it 
> isn't there in upstream.
>
> On your local tree you can probably just rebase to drop it or revert it.

Hi Mario,

Regarding the sound/soc/amd/rpl directory, I believe it actually exists 
in the current upstream sound.git (and mainline). You can find it here: 
sound/soc/amd/rpl/

The goal of this patch is to follow the suggestion from Vijendar Mukunda 
to consolidate the RPL support into the yc driver, as they share very 
similar logic. By doing this, we can completely remove the redundant rpl 
folder to simplify the codebase.

PS: I noticed the Makefile and Kconfig problem, I'll create the v3 patch 
shortly to ensure everything builds correctly.

