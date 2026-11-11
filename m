Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794397862;
	b=i3ipM82boD9mRfJLgNVnnngi0prrgH4D0srnZEM9elcCfIH7y1Xgx8VNhAZ9+J97aTc/
	 XA3zQbmka/UJDzKYi1KE2w0jKruVDydiHmYK2+as1ysGypdHzA3We72BKrdBTTZQWC0Lp
	 QH1xWDeXm1wK0dJ+vphDR7RPOGFPFYu0S7JJ4Qxr4cKaAdFkQv6h6Wu6gauBkkFamOspm
	 a3hqVTVBIk8W1XSC+EDvnJ5CqR1WBEZ+8pU+ZJCeXHgMBXEHGX7LyTtej3wW0kvnV0HQC
	 mtIOmVWN0lTKhziImVJqn3fE+8XLeDEEw00oSHKm+GzFLYZUJnoXYHTFPDQMbBCd7Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
	b=y2ofQbljub8emtex2oEur9vPjJpsdZgfUPYtZ6UgKU2ob+J6X6mYpw3C7RAxTDHXfgDu
	 HK1f1TjDydo1R5veA2dV0hEzST2osAhoyqq6YRbSPFA1nshHdLXEtR5gAzlZZtw5whgMU
	 8WWbmYgg5buHeO4XtBJuDfLTHi9Gisos7566tXIR1hraq1KkrYWRyFHVpr028QOL12QqF
	 LP21j+/WGFyUnPka10YBmIJNomHw6dbloA4jkwgvOcWVxA1tz+VGLQHFGrsXVwdfr9Nwx
	 RFgZDhh8w2vrIsyqMHR4P4yw+zcBqoTJCZmX27dGzICHR4IfUMlgs+9oSyPJ35FmspQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V5b2CttP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBC6606A32A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 11:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBC6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V5b2CttP
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f36c18b75so184404685a.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 03:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397861; cv=none;
        d=google.com; s=arc-20260327;
        b=giwzpphnL8MIiKm0dQSjoRsXV++odQ96rnhiDR0UxRp/k/6VMD4Q+nOpD1dvwYI084
         IoLq3HbB0j0Zv5FeZSptiz4YpnPNWdwOOqkmN181h+1spSlmcEMgPoLRfUBk3thanvrU
         rgqY6OjwPkP2AolEi9sYyHzZj6PNjXstldcmBZBQzwkUtPiT9syGUfXLx4EyxuRLlLgF
         X4hsLwkq4C3C6E4DdB4lcB48RlWQsrD7gfwFfOZhMBiTisO4qXks4/xKePPM8u04GwqN
         0i2jRmVmfZTOpPeoZ52K7Dedhdu2UwOwL7X0yahO0H+ztINqBykANrTuMLN73oN56vZG
         R6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        fh=tQyyDIwayy6R5EfdV6T6gBobBTcGNvoON6g+E9FMiZg=;
        b=ZQL4anTA93QxZ5pDegv6Zcpt0jPIAxu8MQR4I9voLQSCuWe2IbbkBXY0jxGpO9VsqX
         Q6KzxKwzsWPNPIx2i97bt6XFlrxP+n4S/c7O7HD5OI44LbRDsfIEQz8CYCPY9L9yAKM/
         9D3X3wf8A0y/3GTqDDjKiybKzjnHKk9NquSxnEt4KmzT1EseocQVjGycHPNGjp1dirZm
         iIKBgTXJsWpFUJlPqzY0KxMBfEm1P2nRP0o3A9S/DwH/hNYsDPz8zMjcbChLjuf/PLA/
         YJGAYWWwPJfst6xD3S6tyISjxmaDKav5+W6h/8Gf6gs3VOWJeTlXcG5KTLPw6jI/F8zK
         nLZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1794397861; x=1795002661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        b=V5b2CttPgbaVLOVj6ShAbHXi4p9RJT87mHYSQ2huFLF0TIid3B0OYYsH+S43C8BZV9
         9D+7K5VTtq4qrX6bb+aRmpJWX4OF3zJh324PqWGT1mn5sCmaEY/mlYE8QO/HSeLnzz+S
         Lp5LcjvplpXXuqRUqb9o/5LhjixxkPgMhPUxWDdl19PZhejlNgF6B0vLWL7IRsNblZRL
         BQF+ayRBoIUIE0r+npXYv2+V5xhmi6ou+bwi8JU7E72bKUJFC8OLdfnbRUYt/bpm8v/P
         EDD6hi9UaGnRnghqrhZhKUn1jl9/ZIH1mZCsmv3gyaT7BSi3sRQsQ+sbLT+M9LY+qzqb
         qpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397861; x=1795002661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        b=n7OPUCBgf/23SarcPmFPnNwYDBxA+zjhs7PYkpnhBEYoW9c9aAesN75sMWXtgxJcet
         oXLdfIpuKp/0VreDIjx+lYZAxrrkdUaowwOas5+DF/ncBRlZTdWGVlnFlNpvuX/WTzuP
         6Nd3WOaLmtMh6wWK8ouCBpm+tmAg2zWhTg6ShZAUl1cd45GtdRbMMjNsK39zBhQChnFF
         UV4ye18SXpePGgoXfZVimPX4Q3tHjDsPYZ2jZjL9fJF+/BfmMy+7cDtmKbaS5CsJUqw3
         Cs+Hj4JzgVKCOZDpdnG7/Q/+v2fQjlCYO5/QwJSsOV8meO+RBZwqcHkNWUZ7CSn+jlh9
         J3xQ==
X-Forwarded-Encrypted: i=1; AL+hErH9M4Vy+nTW+yQ9VEP6h6fAKJqxx9SPX31a6T3ZhqJOeqnYa1GJWm805A8Go6Y1fahvWzOMqelUnKhWxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rbs9FZb7mV49WP09r5Eqo2MqcNqpPbqcMwGcY1iqQ+0+8OUhm
	xQV+SFZQ+67xG3wkb0zIimompk1oOmciUkIDNGCh9y7FpIQsPx3g60u9+RRfTK9By41RvAmiOz8
	9Pz3GLstPwzQkakwGowmcIdUBT/Udeo3WwZbArmu+RA==
X-Gm-Gg: AYBFou1+1Fj7sU23G1FLj/FxTZkoeJMuazKYuUG+yivO5T3NpOTlFuNYg2gbrFa3brF
	gdgu8/rc+aMH2CVuAShqXvML27obmVHuHCAvZKLv1O+Fyeo2tuKX1uA2uT67lcwsrAcy1LctvzW
	yfEsGfXccLrKddZRciJvT0FGmvkJHroGqcv26Ucc+2hIICjv7ap2LChKBruZ+bhiL92wtnlDO5G
	XRpwRAEpmDKaL08cYtq4T837FhHWoW604BvdA9pP25ACJL92pjjX4sxLalM8HKMUvpJ34RXFokt
	Sjr05fmlTBH/0HM3bS5iTFNYThlo4zaWmb4M07FNQ5hqnf5wh/SwPOU8ToEDbVOGqzdf99ugeOZ
	MmLy+zeTV75PnWhtB3VZUoaDCgNVbIfh7Hpyg+TgqrVQJwJLuE+sgvWsaBgb9pG9Aegm0aihzRX
	M5yoWw9pQ7TRAY0G/9
X-Received: by 2002:a05:620a:8908:b0:93f:34c9:9259 with SMTP id
 af79cd13be357-947affef9aamr308328285a.50.1794397860820; Wed, 11 Nov 2026
 03:51:00 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
 <avQrO4etMgpOhvwF@ashevche-desk.local> <avQ19KBnQ2mnhZa-@monoceros>
In-Reply-To: <avQ19KBnQ2mnhZa-@monoceros>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 11 Nov 2026 11:50:48 +0000
X-Gm-Features: AclHuK9yXImPSOD4H34XxYmcqqFrOLj5GBNrtIWsMZD69B4vZ4xDk3_xNWS8s7s
Message-ID: <CAA6zWZJd7Leaytnf-BfHu5ujAnEhTwSB2007KXnV=eE=pvpz4g@mail.gmail.com>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Oh, I wasn't aware that Pawel is still on that. Initially we had a list
> where Pawel indeed was assigned for acpi_device_id. Since then I went on
> to do these changes per subsystem for several *_device_id at once
> (instead of per *_device_id and subsystem) and stopped looking after the
> initial list. I might have mentioned that in our internal chat, but I
> take the blame on the lack of coordination.

Hi Uwe! My bad as well! We just had a chat and now agreed to proceed
in a coordinated way and do all *device_id changes per subsystem in
one sweep to reduce the amount of churn.
