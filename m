Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCD17C21E
	for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534338; cv=none; b=fbpEID+HoGwPPTxq9ySEsr7Zq7apk+tQwGvoSehXxpFEkI4ddw45vNa1hZyv275BaxWLRUhbMCX/JEvJ6++c8KuvMriJsI2bEVl/zCpWdPLJ1NymdU1Syd4I6jKLhLg/R9fjKVKbrcNXyVaqG9kplgTL1fPsi703TuuZOeEW9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534338; c=relaxed/simple;
	bh=IJyZfLY2s0yZ6rO7Oz9oDF9No5CuXyzpVy8AxSjRid0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+3EG2Z7Icdbrxa28M+6HGSCEON/tNx+5oe0dYsBJhBudVzasB3x9pJYsfY87XE+v2xA4cadacDxcjAk3Zm6+pOKK7aYeigpHzyjDjp/Z/9eeqdEn5UgzgKU/ve4OErXQf7KAlUN8aaoRqAK3WS3Mqe73sM7/sID8cIAc21eoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lFr5KN1U; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lFr5KN1U"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so37947215e9.3
        for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732534335; x=1733139135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=;
        b=lFr5KN1UdVXhHkhMlT9Tlqyx6ePt1XfonltvvRjPt8ax6KdEWWA3APdhv1Q5z4ympZ
         SXwaeilxH1spLvtZQMLx2MqW200UyjqzLaRj3yVr6+Rsb66xcKrXNUoGB+Hf1WYyrBbz
         /V5OewHHwFEMH0QTkjVT4YtcJv85d46derB9/fqHXE3+B/YBPdUkwrUF89qNbXHjqHz6
         DzwZNxHZPaJg5ySSeYi6mmIqtFN9eA9ee5uVq1VVev9RXwbnC71kxJlcqy+8LA9G+OSO
         mP08Aq+Aq5gXVTgKK2LhYwrgfoIxDocjRwdHe0tY7NmKUdSPqLEkhwCpokIVCsT89eB9
         AN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534335; x=1733139135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=;
        b=SpzBHD1/gJ0+NsoZ8IptwF9y6TILVY0slV/miVXSK6i9g7n4yeMIYgaAAc7ApIL2H+
         NSyrfmZ0EIBi3W58ROiO28Uk+lmW/cXyMXwzmbVx1JtY7iDNly+GNeLXjGoC40HoYj9K
         EqN4A5r0Il1w2Nuoj2jfAH2vxz9o+MMXFBnOUYCUuUqKSUUIF28udwERETwV4U32hmnh
         CuvLXOd0Kjl8Ii1GRjiuY9O0BauuAqZvLYA+VOXEClHPyNzRksD/Q/QVKB506jCC2Lyp
         9fLb3/1lc4H8PmrTxqVoYqCZS5lSaushk0gt7k3ck3dCT/+jN9szJsDA9LETnSLPm2fC
         omlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWifPUZcTrkTHezDDFrIKh+O1/T2KFS6Lx/+g8f2Hxt8xCmEUfMYwRUTx7nONPUaOBaeJs+YbY6dWXIig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2V1wkx9BRKNs3Tj9SQwUFUWi0Nq8UtdIKt4oFHhGdoPgM05Ob
	JWWSAtFqzJkA/DAsq349pU3TSX/EQqOStGcXm+XejogU2kE2Fe4BInL6BpwKS4o=
X-Gm-Gg: ASbGncu+hGVNJXR7UG72o6fZBzM9ZcoEvB5paGsDBks4hGNSWLaxJn3M3v0pMY+QrAn
	qRyHM17jRD8jvLVbRi5WsqtOySym3yE24GQI2w/1AQaZJCe8fpFi2xjAFUCYgtSBz8Mmm28Fs+b
	1P74ukjuhwbQF+xK08fABgCvm8mkv9ENvAz99dlZRQdJWhFRtzIwe8dTpl4HNm0xd0Kza6+pqmX
	tKxELLzwfbHLAx7vYK8j9zi/oJknFwSJfyV0S1S/BfLedORo+q/osOJU8JrKduMPaD9k/GvZkVo
	pE7thiSKAazWOw==
X-Google-Smtp-Source: AGHT+IFS+7K0lEJaKeykwcJTAWzQZ4yXS8JJlRIPKoQmKX+XT9czJ5uZIfuXu4QgSvNX8SY83S/kkw==
X-Received: by 2002:a7b:c7da:0:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4349499a073mr49405845e9.25.1732534335055;
        Mon, 25 Nov 2024 03:32:15 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3dfasm10487119f8f.76.2024.11.25.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 03:32:14 -0800 (PST)
Message-ID: <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
Date: Mon, 25 Nov 2024 12:32:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
To: Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Andy.

Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.

That mean all added include in this patch aren't required.


On 04/11/2024 22:12, Mark Brown wrote:
> On Mon, Nov 04, 2024 at 09:06:26PM +0200, Andy Shevchenko wrote:
>> On Thu, Oct 31, 2024 at 12:27:25PM +0200, Andy Shevchenko wrote:
>>> Update header inclusions to follow IWYU (Include What You Use)
>>> principle.
> 
>> Hmm... I think we are waiting for somebody to Ack / review this change?
> 
> Yes.

-- 
Regards,
Alexandre
