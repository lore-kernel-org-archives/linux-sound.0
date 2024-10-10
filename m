Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72011CDFC2
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728589013; cv=none; b=ZZAwakgOyYB+WjhK0Xc7ZHXc1FmlqGJMIaQF70zAIuvRoOCrAK7Ng4INn/eSj25EoLwORap0sqPhNiAW8MaEpwDALH+DN9DYd389PbUA6Wv4lzabBRr4rfR25l/JnSJ1XHEY1Tvxk6e5sQYRl6b/3ZM/e3SKozsOSQvZxTWXT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728589013; c=relaxed/simple;
	bh=LdH2ws4WUbLhEGUxo2Llnun/ISQsR/Y5CEoQqNDZ7Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhXvPXLe1X8VUyCrrvH6jwxWyQvX/IQg+bNrbQ1/q1nIUskSl4Srty8UqSqtKycs6k/dhecbM/A26lMtYhilwWka7czwDped+1Qe7Lg9NTfy18WrL+PE8cEnou/+8wWXTt6HL1zQTQ4SehuJaJbd5T3jK3vohf1hgF0AMC1wVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PL6rd8rX; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PL6rd8rX"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8354d853f91so38415239f.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728589010; x=1729193810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EEjOsTCT982//p4qMynBPn2v7qBB0fVqK87z+caMTs=;
        b=PL6rd8rX9K2PD1eEYJpVnJwSN5wVEX7xMBJzM8xNFZXHb2XBGos36C1EIGGXrsxPGs
         oiOLcblJXBPj3hRWJ919KxYbQw10Qe3O/+CRxJy6LrB3Ob6hFAx3hBF3VZnGkExbXXdI
         dRKfRY8csXWO43OdhpkWH4v2wJhppoSfmiAIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589010; x=1729193810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EEjOsTCT982//p4qMynBPn2v7qBB0fVqK87z+caMTs=;
        b=jVHxASalQN88mg2HRv4AYdZu4id9cTvnQ6tYLzc7bHQKAerWMbaYKk7A1pvajwS461
         AfgS6YP29tPjSJdkDDGAS57nzKWHxCRNkt8fThht/WoU/Mqv2czL/HeprvzVBLRIlDPq
         DVxrsEa5MDa8ptj/Qz+LO4DdCEBarXl3rCtGOVfWBh5weJXQ5SVfswGO8R54+GtrDeuL
         fNRcf6VPVEr9FiJkQwiWBwFKH8yeQs8uryEOhm5wEZ43CCrqgroaLt3f2QPx8p+jbCHQ
         WPPBBJ2tVbbDTRjlHAVoGcMxWQtSQsbeTZY1IydLcBp3o+mi5BBEG3YhtIOXbf1FQ0iw
         18Sg==
X-Gm-Message-State: AOJu0YwwsFP/vQ765rpqxxz96N/Ok1oY+WhzSSUkeqVhU128f1BquvOd
	uKAXTeN4Me38oq6mvFFED0ieS4wp4es7VMYnOWn65pGU8EVy7biVgZNtm7+EC3g=
X-Google-Smtp-Source: AGHT+IFJfagwlyeJRhazsQ8OzF3SbdndAdZV4keDYcnDHDKQVcvrg0LMNOheltT1enhrmGbkf/fLkw==
X-Received: by 2002:a05:6602:2dd3:b0:82a:23b4:4c90 with SMTP id ca18e2360f4ac-83792703cd8mr9881039f.1.1728589009873;
        Thu, 10 Oct 2024 12:36:49 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbada84990sm359492173.113.2024.10.10.12.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 12:36:49 -0700 (PDT)
Message-ID: <419dde21-7477-4eb2-92ab-7062414cfa0d@linuxfoundation.org>
Date: Thu, 10 Oct 2024 13:36:48 -0600
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
 <b01158a9-5a7d-41fb-9935-6fd9cfb60a29@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b01158a9-5a7d-41fb-9935-6fd9cfb60a29@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 13:35, Shuah Khan wrote:
> On 10/10/24 11:57, Everest K.C. wrote:
>> As the same condition was checked in inner and outer if statements.
>> The code never reaches the inner else statement.
>> Fix this by removing the logically dead inner else statement.
>>
>> Fixes: 7f5d6036ca00 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
>> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
>> Closes: https://lore.kernel.org/all/e44527e8-b7c6-4712-97a6-d54f02ad2dc9@linuxfoundation.org/
>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>> ---
>> V1 -> V2: Added [next] tag
>>
> 
> You don't need next tag for this. This patch is in the mainline.

Sorry meant to say this source file is in the mainline. You v1
is sufficient.

thanks,
-- Shuah
