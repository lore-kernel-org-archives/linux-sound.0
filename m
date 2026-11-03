Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703679;
	b=rLs/oEWVtTmK0A2PCzvHyGoeC9vDOsEJm/T81d1iVB+rsQWKo6aSIgNcY/9ZWdg4iqC+
	 kjj1y8OYKCyQ7hz2nlA1u3xsc5w8GaLwJBL4LbBMnaB5huoWQA5NmmSNe43P/ojcxz1bQ
	 2/51tpt7GLbcVECwwHUp+M0mAZSevvcYnCSi4j3WsXgncifsP1k15ksYjIoaWXYtjS16R
	 Furn26WPP8BaXf8iX8WWCSRCKYFg4vImdMGSbeektmV09cZqNE//2u+KME44EbmaNlI1C
	 VIaL+47MZo4y4KLBXO5R0xWzdrDMtYlM+SNsoBRMKkl0nqARw6yhZt6CPMRobiDBNLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
	b=wOiIGsgrUuWBDtuWRNwIO9f6qsMqRMX3/HRQ2MgPpJKj/Q6L1IMVhwOzr9oQE63VMCj6
	 cyhf8f8+QHo033KF3RFhdJoYNq00RIZDc9nRqTW+8u/hTXKahBZpaR6OX+5Eh+kLar4HR
	 qfjm0ITVkqddxSKCtZVL4Yv9+B7UChimCRIoHaBzgd2ciMv/Rpj6I7CcGBs6RSIiBWcjP
	 x0Id7vWkhtC+xKQJX8gcoGT4Zuf6x3+Y/Wphal9AH84q+UYBLajfPlZJV+uDOeWuWkwOI
	 5qpm6iYGc+o6Azn4oDWhqHOgzT9BYS3NBFCvl21XJ/r9RNQPf8f+GZroxUozjWIUI+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8D2606B109
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 11:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8D2606B109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364042eecfso65978151cf.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 03:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703672; cv=none;
        d=google.com; s=arc-20260327;
        b=tAa0TlVq+fAw+UO4AHEdwHxbQYxdLjnoDj9KPcMPS2AfW9LszwxOMv2BIvZzeHzJWu
         SvkC1PqnRZhw2rkscryqlqA2khwBnYZOPBxTUNiJ/jSMF0OwiA6iL9LYjEDIcmSAUuyl
         xmeongepMXZ5eGvkXGLiLBDdnoJhlbKCWDu36Mkw43DIe7d02e0uHXvspbzIZqonTAvk
         4QbI2a1z0LemJrSn31/Vd6JyNpJdxKFIwPKA6txK2FHiE9EbC2wEasNJbP0mf5GPCJX/
         N7INM1O6PVs8r8iwm8lebrLuB4UquX/mL6aOx3ebKtwbe1IEDozWwWe4t0MZKgarm8sb
         fmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        fh=0v1NAMqZuXKJZoYtVsl7l1WY01RDhg1wi5N6vWkI8xY=;
        b=pemVWElXtK5h50WeprHKw7UokXFBZS5KVBVMDnM++ynvAs8+1AiULz0cowmLqo5FL+
         7ZAutX8YZjsBUIY09E0cdAsqpUtuSEKA9A5GYeGn8FDPTPsQdZofq7yEhMQUuCwqjWla
         SVFz8xqvSd0uOS4vRgaHU4/+/Dw5q7brkaxgMI58NMP7/26CkAKRv8HFTZLqZg16Ku/D
         UG1fUiTogCwgyrvm2YT0AF2x3kiACApWv+ZXMp+0kmvEm7wWd5MXx4uANOEEOaDR1P5t
         40rMVJ0OyadOU2Ia/P5OB6LwsPhRxyWp0mTlW8d4CHKZELg3NO1bnv+U7mnRr6MOxIln
         +Pwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793703672; x=1794308472; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        b=Pz3Y4KMeK2eY7RaHYtlKu1J7sH+3HT1AN9Y1jhkU1u1BzolllJGseg6l0Oh+TO8WmZ
         I787+KldE1OJsVNQ2eZ1lqF2kjDacSGnXeu/o+LOEpxQXmQVkfUFpS/62LO1lxz56G9f
         RkPsCCf8TfPczShU7BO/ULwQqV6l2XIQ/vMOl0YzKXnRMgfI74WdLvnUjgSHxJUWWSok
         iUAV/T1HLxAGh1up7gSomvRNV76+6VaXaQTUcMC5ZBRjgjs71nHOZ27jLrBWjrnoqx7k
         oQDdoOjRZnn9TbtLI3DhY2XCnZ8HBCxPVNA6+eJIfEUPR5CAJ3UmuUeWgkypprr3KVHN
         xFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703672; x=1794308472;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        b=nRdSBIWO3DRZWb44UqQiOLWt72STABnIU5nqBK2w0w9MtoMv4+SiMWerb/T7avlfUf
         9hq+gwDQNiUf30ccZFzrFNfq4AdlpzGdYobo47jnQT5JrCdDApE2FsLTdKl7LpCxbAD4
         yWQH9xDE7B6gmnDE9oa+TK9QFy7Jt7YyWJfw6ubFvuKL3OFTfcbE5aiQ7jRGAV9ynqg7
         nIgp99MgS2UO9sFZQhOXnAdfKNhHXqe/YHz2ovBgdYMARbTbdk6JXDs60sNOEp/8kc6z
         OM/PIkIfA1/KbjaKgcoxw1OhoAgjZ1h/gONJcPCPAsZsHlRZ0rTkPWr/cy9UeSw5XmpB
         sxPQ==
X-Forwarded-Encrypted: i=1; AKwUvBydmdDNU/L6SBbKKDBhU0WM6gWOircWHh3+daDzoHyQ/dlEzLurjDXgpUO9q+KlXbf8O2zL0qcT/hsesg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9W1/paHh185Xc6G+6NitTNz4QFuS6tZ980vpmo+9phtF6nhc+G
	onvE7v2h3mWRcW58G41lPwX9bRpygLX95nanWDeEJ9ph92xkAe+ZT1WVmBzsd0vXZqx4aJpXqsy
	7pfJx8w2ReKfBKXlSVFacW3L9w+FuS+oHOtmPBEtkrA==
X-Gm-Gg: AYBFou3yN11MnuBrCQKaFSgXqtckoBw13GqkjONJ5ej3Nk4G1yRTpzwo7ZmJcJ9g5ly
	03fmnrfqnTYUV8PJtUR6khaZXo2p/j1JQJMW4a+Wo+L6wqAmKYfiFvTj1DdDr4jQC9Sd8uO/6Fj
	Jm/jQgckGl4ld4YHycPJIbmeyAn7g2DtVDbT5V6bRwXjvF7T73fPprNoSSkhLnB8sMN4bd5zuTB
	8yr6/xMFQequLVqOb/UmtmKNY/NIb6rnA1Z4srn3jI4PRA8pvYWo5eXnW95laBABB3SCWpEJ3PH
	PeQmBDlpyAHWX1dDwkVlRzN4Kw2SVN4OVGSrtn4KiHKLG4PJJtXnGoAWph2XuvndYOOR+TTPK6i
	ScyW2PurW70e+7ohz3TDaowGbBaPp1t47ivompaRl17eazGLP0mCXl3qJ6Z34y+bBwK05J78=
X-Received: by 2002:a05:622a:1386:b0:537:f05d:6ae9 with SMTP id
 d75a77b69052e-542b62a5744mr204134421cf.13.1793703672263; Tue, 03 Nov 2026
 03:01:12 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk> <aum3RLDLDa1gllge@ashevche-desk.local>
In-Reply-To: <aum3RLDLDa1gllge@ashevche-desk.local>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 3 Nov 2026 11:01:01 +0000
X-Gm-Features: AclHuK-r_cJD1goYWPornsINa7shzhekDP8lLl1_99QVlK0QEb0lwrUHquiGssM
Message-ID: <CAA6zWZKqCpD8GLjnTwAOnBq+Uhq0fA=eCRm4tkX9YDeiC=h2mQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: Use named initializers for acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can you split Intel LPSS to a separate patch? It will help reviewing both parts.

Sure I can - will do in v2.
