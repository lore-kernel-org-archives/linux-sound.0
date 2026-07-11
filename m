Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19B2882C5
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783745379; cv=none; b=BcDQ3YFIo5MWUE8qo118sbJUImfJkbxR6B6F7uIpmZnmWaC901gRbzaDO3ylRZS9XYeShzX8GEMtzd/IISyiwi4SC827tTXvnoJlVwGWC9ry2/h1rJqIj4+K9PoWKA+rgKcEtWrPqKXB3VbUxItwU/LVYoH1hedy9dNqTbI/6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783745379; c=relaxed/simple;
	bh=S7g5HdrobVHgSI3y7yFITx6ZdgODEA0xXX0TnH33v6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKo/vA+6WTstE+vnzUghLcHTXcTXYPCwwhPESQfaHLcPen3oPqXkgxENGG2qu+1Vmncv1lT3rOYUltgW7PEJBuH627upHnWElzaiC1hkE6xPhMPEeemXh3hytACfwoIFsIoLiCH2BPuBLV2KZb53nvnOG3DtHtv7KcIsompaZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrUunfIs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrUunfIs"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1949903b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783745377; x=1784350177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=WrUunfIsErXFnQOhWCnUXZ7TKyOqI8TaNmxv25pZRtai9YvHHJ6dlC29g3qtOv+vRE
         xYGb5fhsMMmG+7vkZUZWHTJrvL8kinbikFiRoVPLvRke4dZUuCv6kQy49n5hwBvqeAqk
         xhvFXMk5+PlucjVTUu/1Pu+FLP1RNmVxnd7flmwuS/1jWdtuSE6HgVyff+UYnMkYZU+i
         WKs/DPjTZ9fvAifwp0iUhJX/P1HqglKBU2GvRdGjc3RYGJV1ljbf3KUJ6sjsWI8eM1aC
         hyGezqIdlIEcKo4FcZkkfuig2XwLgIQsIOl/Jt/fuqNsfwuLe67ocz3RFcljSVK89Ybx
         DyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783745377; x=1784350177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=XcS9GK4qn+z3apTxnIXJL92iEhbNDSJYeoJED5Hog2Z6sh4dI+lTVU1GXdc9U+dC/p
         fm8xsqJ50mpw9W6beClOTDdSA+Mfyea9jTgQsN/FMh4zylzvdWuFP+RIUuyvG8I7PC7Z
         LNYX6bWhL4S2U1pPWUmElMpF5iJSjqR0cdDtEwuZjJQEOHXvT4SFokwa0BPP9T9Mu6MY
         qPyzkXDEz1af7Il+J4uBAdEtr+tyfcANmVdcjDUAp/vbyE4iac5wSapFSq3CWW+7r11W
         rD8Qlv0oKw0UH+rQf3sRPofGSuwppvqcGFu3BWE9Q7dsUXJBtV5N6nwQA1VHN39pWBD7
         CE7A==
X-Forwarded-Encrypted: i=1; AHgh+RqA86s1LCDzMs6Z/IwvHvHkk6By65iKDg4jpl7VxWDhDO+e2ozb0/BTKSTaE5XhzaEpaFyAWpK1/JDStQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUMs1LQkhWCJ3ZOlFF0SW1cvwa4wFhGNwFkimOGcFoTsJEDAi
	hi7C5U2lYYYGNt5GJn0dCqg/zrWfZ8S2hC5ETvcrZ+d5rFy+m4lDIsdV
X-Gm-Gg: AfdE7ckanV3mcNflDYewUal/1FLdId1UlpTk8g0LyuSSF2S1rpobw/PkBrN1OGqcSOC
	s99T9ODW6ruCEGTihvl2ACt0lzIWtVpHLj4qbAys0NmBn3XCno2lW2SBafK8qraOyf6IhgUil9C
	IZOA6pxnUzGhg10l6ga2jwOi/5M1ILvSuGVbPLfGlUsY2nxdqr9NjTID0JMd/Nl5tOhgbePqkMU
	AJOyiBzDHVsmREs3dI/5UMqApFy2xtpt3lJTmOXaQkBai+1R1m1JwpDFF95dkjyLpsCs6oUVaB+
	tFRzR6nJoKYeskTPryY7ZYopzZp3gk3sL5fvH4OOAxjISLF8+5X/VeguSsQ9bkgAcQL8eNgehTS
	jrwX3DMZIfCvyYY7jPbDPL3qNIQjwaq7tK4i3jVSP17ufdOQVkKUebApk/BkXAAAbjM+goE23aV
	x5u1Py4M3czWiYOI9IctQxpW1jjgRPt5uDyYH2REuRWRm+Jlyl3+EQBg==
X-Received: by 2002:a05:6a20:734f:b0:3bf:6763:f0d0 with SMTP id adf61e73a8af0-3c0f085657fmr7458822637.4.1783745377459;
        Fri, 10 Jul 2026 21:49:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d42f:71b6:335c:aceb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm25970082eec.22.2026.07.10.21.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:49:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:49:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/10] Input: matrix_keyboard - replace linux/gpio.h
 inclusion
Message-ID: <alHLK4O77khiKwtW@google.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-10-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710211954.1373336-10-arnd@kernel.org>

On Fri, Jul 10, 2026 at 11:19:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away, so remove that since the driver already
> includes linux/gpio/consumer.h.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Adjusted the subject (s/replace/remove) and applied, thank you.

Thanks.

-- 
Dmitry
