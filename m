Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22D27E07E
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 16:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532853; cv=none; b=TEOOJ2BttKKUXvwnE98FaxYxO1AWP1xwoCjizhRk0r20ExIJLR+RoasfV8pn++EmKXydM9o6FUdkr8ZxDZI/pPsGhIzhKE/7DSZYdHx4zsOFJ1gKvV7P6H/AdKx6ZDu43kJn3kRiAQfpFO16o+J+pP6evTXsMw0lcqdSUHNxnBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532853; c=relaxed/simple;
	bh=1ZYlBp5vpzPi34x0DteKqN4nKqjK+cKdtPyQq3TItws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfhqkENwPAatp2lzVOR6rtpI3zaNKjN3GjV2Via1avH10/SBrHaYNuNm0zK8Yv077d9IVMlwxcaaphrubeG23vhwak8Y6++TRkzMBDU/ijZBYi+lmh6UZa+XSwys2Xqh13c61FVs4/7kkEY3wb4wPRi4OEAhsox/rJMZF4Q+rF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqmDBTM8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqmDBTM8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b95cdcacd95so638647a12.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 08:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762532851; x=1763137651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CX1ZehLJDso9stJ9f5XmyHuDOMwQijlKUUb7er1MnaY=;
        b=WqmDBTM8gPWM77vtwaHmx+1j904Lid0Hy/sfAaNW4TY//lfjGeEGBYZ6nb4WjP5jdg
         1NFbT04HmNE/tYGWZw23pKxKvPzx716uZNMukN5o2aeRGpzGbolfD00zwcRcdoATvCkr
         y3l8yptfY1ZiAaH7FeGjuf1sTBUlrCGuhx9WC0vNJ/0P3qNHbEVl4M5stIH+HprCSt5m
         seQQe73WYE4BEat4HtM+QUioYQ/Qjdd6c+2aDETD5JzFB/5kwtBVPJX9/mlIt8MtrX2k
         k7Wuu+upKG0Xmqmyx5yt01q/uETTW7HlnT3euhHT1BedQRE5wcRTAeBFyxJBz0DlGyJW
         VNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532851; x=1763137651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX1ZehLJDso9stJ9f5XmyHuDOMwQijlKUUb7er1MnaY=;
        b=bMCyOI+0Zw3JHOq1avXh8IRpC/4K0sd2ICCdZ/YbN/f85tbu5Rl/OXJ+mX4MTMN1OK
         POVPvWNEVLkI8DHZMA+ZrE6yj9K4z6gTQtuI/ZQXSVM/Q3hZ0Brs9iY/svRiFRUg0j6v
         heaYcoLS0pnhTJUVcNCbe03nTE5LzoNJK2bGwkKzuYwJrY9AVeYYho7xorBLQJxQdPWM
         jI8+1kTwLq9xotLSVZsUDWiCJ95KhI9mgdZ0/CxezwOTMMBpWkPSAHXWFXpU5iYE94BH
         aAoPkMoe4jyoU1LvJV23eBzdI2f/x7i6r4TbOzb9i3EK6/2dvdYUmilsV4YOf8648C9c
         sFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2xdNeFcpy43bmn0JMFkIwjoOYctmcjAHwDLjJ9pH5BbpruL+yNxze4NvR7H/7FJh0CxwSsa0SiOxXEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzINdeoI1nBtFB5UDG+e50tN80UPjRhk6RaV7unO+iHs5NQG3X4
	wmWGMVGE8mE2R0LsZ/VHHBVA+uDqZZRgpwY3EjIoF4IB8UBhH4csq4dP
X-Gm-Gg: ASbGncuYM8pKWnz3tpjKyT9MUDUUUUi4toLlAOXP+rJHBpBDhK4XrzQra+GcBzuL3pm
	EPUSTlrxY2M6lHa20yTvAWqfhd+a5rzq/JPtAf19rMubkvJcjFN1e/FfxWPwo0Ign3R2HLnAWQa
	x1obMJxndz7340lr1+2VCjmK3O/CsFuUWOcNhuvlIXZ9M1JYDKv4mOLStOE7JYWqrZfL0xH9ivB
	nbegS1kxBD6/c5tvMAB1iFuK7vL4VpAXdwH14tcDwmtxIyzH57MTwSQo6A2yUMeE067CkW952p7
	qrAmdqkqADCOBOYe7VToXa1BZYQUkpzoeQMvdcezQ/DouEjJxmajc4Zs1mnY0sUBLptRAaVB11C
	JKQuS0ESf57JvfzXCe0LXFNQWDn8TsolVU/VDuM02qVmk9qBPzfcQU6moZGfFjnLNf4ZWpyE0Rb
	dry0L6h9tc+P7JWBLXLaIQdz6tgYzKt+ys3k3xp1AsPwyzMN0ylFpyCAVbqqOreymLJRMapeFoi
	GGRj+nJ3fKhijzXaGEl6g19jaL4152/7AGD0tFAchExhEuEC8utx1auLg==
X-Google-Smtp-Source: AGHT+IEAwnhq8fVpucsSXNeRs61u6uV6hNbakIq/LMsapAkB8PACzzepguxOLcfPfbF4AVxuWJAoCg==
X-Received: by 2002:a17:902:cf0a:b0:276:76e1:2e84 with SMTP id d9443c01a7336-297c03873b8mr50136455ad.3.1762532850886;
        Fri, 07 Nov 2025 08:27:30 -0800 (PST)
Received: from ?IPV6:2001:b011:2006:fcb0:bce8:7cee:580d:599a? (2001-b011-2006-fcb0-bce8-7cee-580d-599a.dynamic-ip6.hinet.net. [2001:b011:2006:fcb0:bce8:7cee:580d:599a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651045bf0sm65289595ad.48.2025.11.07.08.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 08:27:30 -0800 (PST)
Message-ID: <04d5353a-b9ac-4ff7-ac77-5d856a10be27@gmail.com>
Date: Sat, 8 Nov 2025 00:27:25 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dapm-graph: Handle sourd card with space in name
To: Markus Elfring <Markus.Elfring@web.de>, linux-sound@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251106165802.3780-1-s921975628@gmail.com>
 <fe032b8a-b7f8-4e80-be96-72667bb04c55@web.de>
Content-Language: en-US
From: Yiwei Lin <s921975628@gmail.com>
In-Reply-To: <fe032b8a-b7f8-4e80-be96-72667bb04c55@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/7/2025 7:01 PM, Markus Elfring wrote:
>> When the name of the sound card has a space between, the
>> script will fail to output the dot file. Consider the
>> case to generate it correctly.
> * You may occasionally put more than 56 characters into text lines
>    of such a change description.
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc4#n658
>
> * I hope that a typo will be avoided for the summary phrase finally.
Sorry for making such a mistake... I'll send another patch to fix 
regarding these error.
>
> Regards,
> Markus
