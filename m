Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721121BEF79
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737530285; cv=none; b=vFz3XBcV1jQVp0cUYTL7Wnbwz1kXJtSpvWxa++Et8gNRcr3YYMXJGFFFfm3rgGgWjCy1ScfflPz8mltM2vJXnXNDpyQ6QLwXtRw8P7ErkyXGXpr+Xf907mXPJeAAcA6SncpS8VSQlfJS2bW3POvuPYoj3D1IJoCV7n0RkBGTKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737530285; c=relaxed/simple;
	bh=wRpRGuYygAXO9SRA9T50q43OCswsNW+WXfuDvfVYyeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6OVpA/6tV77K8sa+i1Bfi5aIlCL31NZy0rioKoWxH2Sh5ok1XiMWSd2V/bPeS1HZTJgKRR1FohsTxbrpPCPWvQEr6nNreDw2pCE3A54ooKKvTNvOsjfCjh8d3T3epkm3TVPCd06QYcBWxVV7BoRadwqkUG47c0cvUQweq/hzn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XmCT8pDX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmCT8pDX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385deda28b3so4090355f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 23:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737530282; x=1738135082; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6CgZOM7htMfnJFcqpUIbZ/+70lUf+12I8N+igVwmdg=;
        b=XmCT8pDXrKf/Mb1WlGNSWJNR9xvsS4eIy9ALzcv3UmKXaqX+gSeVElANqWy+1G95iw
         ZujeC6pxLR8Mf2xXJZ/AaPXBpd+po9vaqVKo+VEGUsakutsyW4QCB06VhsDObwubzU8n
         bdXGy29cLrCrvyCUM2cQto0eTib0Dd+8deW5jIP0sntuu8isLaq+2bhDaMOTnf85angw
         eHKJXF/eVkGMj6n7HA0keoWz+wnthXHBvfRaoZCTrOTggb9ezeocy5N2m2kD+9kTJ1Ra
         /gLBMKz3Bt3fDXcSwkqjsx2ba4IsE+bYNbkYdyFp4YgWHSd2BxaqVwrorlq9ZAnktP+o
         uNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737530282; x=1738135082;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6CgZOM7htMfnJFcqpUIbZ/+70lUf+12I8N+igVwmdg=;
        b=JxzWMlinFh3hMU3vWq2HcDDTFglHP4F1NiN7wVeoFMx5N3T6jOQU4Wb6klz1e/hlUH
         FmoEKQp+6JcGs2F+83r7VreyMXshvlX2X6cRxhAux6I6MlVObpQPW1vKeUK/NH1xYEmJ
         qniixyZW7yWp6eDBybkWhjPd8ayRW5aT0j52OY7ONDUuu4XY1BIq/KHjqS66NXX4TdBf
         7kOJhrT0DDc/GxDPeMAuCa8u0R7jq4951P3h3yCqPTFmCUJM1hzydf1hMPvAJUY2DVxK
         guThbn8LSmpwVmNI6jxSlkrFqdL6Jt3q0CkHCkjlUdcyckcIjQSiQK0adr9WYQNjll5v
         IyRA==
X-Forwarded-Encrypted: i=1; AJvYcCXZcytK3Ralx7McSoH7M+gucBSVdpAMZVdNorTDOemhrJjkcG++++56Sg2xMHP82WrgmbrhbHKlkYCAkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbiOWxrzJONgc4DumHXlXXnvRT0YU6urdgSFXLGmhBxiFJ85Y
	O81K/ygjesqsiG39Z3I2auhKdsOmx1DCVfyCBce3L9J6QOn3G78M3l3HEH6pYdo=
X-Gm-Gg: ASbGncvei8veBD9GGi5OFIpKZ7RHwMVHpTMceHFMQJlQSw7bN8IOuT3cxIlPBI/AQ9G
	IuZEsaYJmvpmqEsQ/iBDXI75zPk0nlAu1eGZUjTuvMJXyyYr7su2eLM+zkaBO2FNbfFdn6zr/Ez
	r8OPlDNw4fbTA/kt3gmHAiMr/oTgOKoMTfSpHf5A04BFKMGHPnWbfuUs28Ku2CCnXfiYsHTpZCm
	99xrDcPYnqUs/p/DS5JqiYfkPuDFY6Efkx0nHPHit/JWvtfRVYqOdIoXFuQ7vWPrbdbFRs+mymT
	TxSLKyEkbQ==
X-Google-Smtp-Source: AGHT+IErHed3CVkesm0Kpu4jOFiDBISzfoYdOk2vLua7I0HavGdbDDS1hxB3WM5tTEsU4JY8prlKUg==
X-Received: by 2002:a5d:6da3:0:b0:38a:4b8b:1ba with SMTP id ffacd0b85a97d-38bf5662598mr21360558f8f.14.1737530281684;
        Tue, 21 Jan 2025 23:18:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327dee3sm15270970f8f.86.2025.01.21.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:18:01 -0800 (PST)
Date: Wed, 22 Jan 2025 10:17:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ALSA: hda: tas2781-spi: Fix a couple Smatch things
Message-ID: <45cc3652-a7a1-4e0c-9a61-5ed5579cd9a9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a couple Smatch warnings in this new driver.

Dan Carpenter (2):
  ALSA: hda: tas2781-spi: Delete some dead code
  ALSA: hda: tas2781-spi: Fix error code in tas2781_read_acpi()

 sound/pci/hda/tas2781_hda_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.45.2

