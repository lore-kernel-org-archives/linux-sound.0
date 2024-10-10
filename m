Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D63819884C
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588950; cv=none; b=VQgn95rsXzuQw667LHF/0x9kHNNjwt4VJUCJZ6O4VM46U4L2/X4PjnPW9zL1R/fn1f6fG1Y1NEwOn1Ds71U/f4sFhXhnRMMJpjh5SRKKuA1cjrU0obX7NHOoxvV558df6sp1Qo2hZ8noYpFsd5+JkIzgVTaM9mvzkMDz6RY67Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588950; c=relaxed/simple;
	bh=PJt84NTBV3zA2YWbvMzz9xgxu9rP/D5hJUr8JrYJh50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4SHJxzABAPd0GubY4DXpKNj4b1leQ5D0oP+PMR5d/FGpsVo27YT5928Y+w3bUDMVwHRC/f6gGJ9ErxPTZPQK9W7Z4MtRm/7vXpnHCHWqiKNCuOD7g5sj0FabTAi+8xDm5WGodHpsKcBzK+qp3iDE9i/yVi9Uns9brHReSRza6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q86ldebj; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q86ldebj"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8354b8df4c9so41845339f.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 12:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728588947; x=1729193747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJDokxyi+r4GBO9Yss40MqD2aBCNo8jOpjqls79QOlE=;
        b=Q86ldebjtN9De759CTtFp17aX7vh4UndDvJPb0E7B+NniF2f55+WESTn0gfWytpxbd
         JCSouJU9wolxgR/GoV+49FYO4y941phQmcP2ZhxkFU2Kjob3/uqHS7qLNU4ICbU+y5ih
         9Btu/Lcc2+lXoVUYXW90tRnt4x7shXzWivnWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588947; x=1729193747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJDokxyi+r4GBO9Yss40MqD2aBCNo8jOpjqls79QOlE=;
        b=w0I3PWtYk8LcuRHe6ZGLFS0m6ObfdbO87YaaZ3A+5XAQHVISi99PWfScssv3Ga1fGS
         OxnEMQVf7vMhF8jaFLa4G6LAoVH9cRwzUOzVNJ1IgWCPXy2hDcKQ7fFOLdxkXW96nYOV
         LoSD/Kp6VpJoiaDId+/Q6XOnHWShGEVR8iqLRji7dh73aEZyoazAfmiNCEWuh3YkapMd
         CEk0ILOBNGhaMsqlFBkP/RE6oF+10uigLCwdJlIvKVVh5/vVr3eKRTF/cnMvhS9BR9bI
         0tnWJtJnEvjnv6y4nAU2wFVvT5HfG+ZAjGIv9ldr63B1oCis+8oCtzvW/hvIxTowvioZ
         n0QQ==
X-Gm-Message-State: AOJu0YxVQRvt5mP/SzZkjlbwWELi4/JyEaFSHQpQg3vr3nTUPL32UGpo
	E2yJV2LrFeETYjkLvRQbJXiGh2rSGe8nbFICMmjwirne2BtnUa0MEcvg78uNIMI=
X-Google-Smtp-Source: AGHT+IFESOaWch7p6IZtRKrxj+S/KmOBRuFIkys5QM17BrsPQ0QuvoGRaPAnO8dVZvY1IJGgLK5cyA==
X-Received: by 2002:a05:6602:6414:b0:82a:a998:ebab with SMTP id ca18e2360f4ac-8379428fa80mr5608439f.11.1728588947141;
        Thu, 10 Oct 2024 12:35:47 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbadaeb5afsm358189173.167.2024.10.10.12.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 12:35:46 -0700 (PDT)
Message-ID: <b01158a9-5a7d-41fb-9935-6fd9cfb60a29@linuxfoundation.org>
Date: Thu, 10 Oct 2024 13:35:46 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2][next] ASoC: rt722-sdca: Remove logically deadcode in
 rt722-sdca.c
To: "Everest K.C." <everestkc@everestkc.com.np>, oder_chiou@realtek.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241010175755.5278-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241010175755.5278-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 11:57, Everest K.C. wrote:
> As the same condition was checked in inner and outer if statements.
> The code never reaches the inner else statement.
> Fix this by removing the logically dead inner else statement.
> 
> Fixes: 7f5d6036ca00 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> Closes: https://lore.kernel.org/all/e44527e8-b7c6-4712-97a6-d54f02ad2dc9@linuxfoundation.org/
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
> V1 -> V2: Added [next] tag
> 

You don't need next tag for this. This patch is in the mainline.

thanks,
-- Shuah

