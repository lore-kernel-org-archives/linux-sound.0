Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052557;
	b=pwGPk2OdMMZi+Vl3yoB1ulG1YjYQMOnmTNRVXMLWQb/6Izok1VnEfaK87L9mDObKm7Fz
	 P7CfUiSu3F+7nrp8L8SxJyEkDW9SPSz5uqANQSpfOs8QVJjf9gtQENXo5CZk4wFJWg1GF
	 ltYRheNnyCHiTegJy5I09tbxKQYI9VWQ0uShhngiJXEE7uKd6UcsJTZwyKl0akHYInGD7
	 IQTmNVTrf1hSm/SnDisLyNzYtXrUwapVKvp5Uog9ZimmhnI49ItexuJkDMBQxHdbL0Rzt
	 hlxp8JV1F1tynCDsxeiBEOvExhlRv6L/o17feOueHmUyyId/itN1eCfWEp2JRwhJgIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=HMzxr0AqEYY6ywbHhqxod2Y3AcEfpkgQtXWr2lWppo0FxGAkUdcZf0ZS4QCeukMzNnMI
	 3O2fI2qccEa7HV3EZXASOSXnurcSCnHq6F/uPbMlTeWMg5KHe/fwAQkfh/36ZinDv0Dh1
	 hV57yWvg3QlMLjGI5zXnpm4iTUQgI04ZDUKtk8yDEzj0r/4NLT/yV9APLBVvT8jLK8HOe
	 kHXxWYobSeyPzXVXlSw7AHMu1Gpz3UsJtdNlql63Y0I9xRz71YPFmYU9u93TcTo1L87on
	 cSghwrRNI29QteSRFysVou/hc5sqKtTzJJof6aEqL21/su7tnDD8wKn3PEN8NxPRX5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeh4vtiH;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142D606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6142D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeh4vtiH
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-19305bcb72cso1426995c88.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052556; x=1794657356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=zeh4vtiHSkORdzDCz+sg1Ik/yrjHIxYdBaPlsymLlupYOdbmACbmjwnNeCc9u+MRNC
         BfO/ZawTeadAT4yXSPjIzEKOHXn1O5pfOm2fsI4msID72zTVYiopUPnjFnu6GUJNMOc3
         SIsynd9XDih2RuGxo7/FrPrR+iSbqO03WtTdpqODQziiY8VuZZ0ejd82CQRV/rPEUu//
         zerchnQyXML0YMHpt82+QuQqIQhrSAahRVJIeAyQZqmveo5x0bRxFKjcKsSvvpCM/yht
         g/p3ttPKR68+GECNpwHQLshe+zxwNnycjstDIEV+7zE90QBhgyIy0Bp87VMCwUmZJTy3
         99TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052556; x=1794657356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=eF6rd+bLWnZ+bIinUc8OWUL4NBr9idbXTzAIfh0Q85g+sqj1mZiqmMRT9AC4EbmKgE
         4E+8yoftRuJMKsnkADHfh20CvRwSxk61LjO8brm6x3WpKBcOMtkgBaQUKzdZzhthNleh
         YH8Q/dwJJ2YhJRXx+IL/Ejo+3PpFEHy+zry/WxZb2fEC6gqY1zO1gl7/wSI92vXWydsA
         QwjNco/pMdGmrKhTEamf3tCfzRQ/0HHVLOBpAicpyBz19vKKeSxI15rCtaBv+iQ24awj
         dwPodiuBO528inpYQebdmf8G8FMLxy8l2DpcCMA43KZmUg8cHe1ondLbfgJ8pEBMHz7E
         uFzQ==
X-Forwarded-Encrypted: i=1; AL+hErFH9w2708g6mt6Od16D0TWpjdZlZ/55QYTSPynOt8bgVW60/YU/N9cRa/lp464yv20QUY25mkDvkal7HA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mX/Prx2smJlHeLr9izaXMk9Tl0BCQS3hucQSRo6tCLeGEClkb
	rZG8QqjIZybgNm3nI1PJ6ORXnw4Fmkym3PNPmTufmuA2yxhBK2YGCBmR
X-Gm-Gg: AYBFou2zvrUMpyaQxwqVoIn6WQ1xBFsTdJBTFAYyrwFvw6XHfbT7yLDWZB5/uZjLFW5
	mT4vjN0b7TsFDv8Xv2QPLNGSdP3S2EekRFUXp60li8cgqW0LPJUdybhtxWt3GLUZuEkkjktYcyr
	TXSZmA8xd3+953Wn0+lJ/ghCzpxGsEWisO04gMty611pWj0J3yNRt27ORbUxZAXgk7SJ677pKoQ
	Mt8f7FzBNRfMcn7T92fA814QSu+74gcBJYG0B4Nc0iaF1RfkEY8kjB31CjPuWWH/Pjj5HW22ug+
	hHscAXhynvQwok7NkQLsqX+xgNMMlaiRUzC/mSO5j1SG/nnM58EfoG341NzDcuzqWEq8yqyODXv
	er7nLJ3sh/BzMTiqZQGc2xbqvU4o2sv7AIem/ZXBoIFSxmM++0v3FF6QygpQJR9va7Q6HdG063S
	KFwPiq2bvJyJccngbQOn8HKj5mW73znn+/xjtX8x7ZHhtZ+HMNBOg25GV4yz4jx9zrH0JdM6heY
	54niS8iCTWjQ7c6W0YUCwySrGsoXfI+RsVqgy6hWU/KULw8c6JHUlatLG/9p7e/CmvErDHhgNt4
	bEBr1rXcamDDdGEl+oESXLMj7hEFw/0rH9j8TBz/HWM5naMBIvd0
X-Received: by 2002:a05:693c:808b:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36f7682254fmr7638705eec.26.1794052556398;
        Sat, 07 Nov 2026 03:55:56 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm14440717eec.9.2026.11.07.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:55:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: control: Synchronize LED mode accesses
Date: Sat,  7 Nov 2026 11:55:34 +0000
Message-ID: <20261107115534.2748-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87eccxyplk.wl-tiwai@suse.de>
References: <87eccxyplk.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
