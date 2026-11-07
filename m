Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044544;
	b=k1+ckYyZ5oIb6icM5hQABVqmMsQM4VVgTZZMWsuOUcjwgBLsqNvfiwzLoI1WaED048D3
	 ZQ5xxeGksYZ33cigICmdtLmsQKShvSchgP2NLEoG5BZT+okvx7HzL3Hzb4KENDr9HBT8O
	 kj+Tu4WgpVFcgOoz885KizNPn9I2W64GEn2xRTbB0ArnmvVmyfB0qijE3AYTQrgwsxkTS
	 7KRjgGPSFl0qybrC2BAg/+eYI5eIIWch5hHiswkqwR0BpWofCu9r5tfMzlgGOr5hrp7ba
	 t3kwRm3CAylksXXyiSo5qsXnLvYKeQNcXIc38cmYI5z6vwBYXGKVCSbQUiWBvbPLBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=zfwQbtmpC0pAx+53T8w6stcQGkfxgFQ+Atupm4eQP8OCP0co00TR7YH0mU33LtOrnm38
	 9ZDy6OnSwtBVISr+k8VsQBbH/3aRsoRTv36y1KegQ4WEvAAcw4vvPS0FIvLq89jTB9wnm
	 QM1DOjl0aTwoTqDXVlWCTf3EHhRjAu23hcDqjZlA20/J+k54sud5l7w6YbGTr8Jt4JVNP
	 +g0+AEWvVNwKdcAkxjTbvqzRWyQAyJI74a9tikKYV1BbkvgZQiswhmgMKyxe4W0oUpGbu
	 KLwso9OS08Yb1ldx/lrDVJASsLG6Iq/bxSOhSUC7CIOx9vhviliQ8ExPh7q/XdGDKHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxHxoSCX;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294D6606A330
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294D6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxHxoSCX
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1adbf62dd31so1884773c88.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 01:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044543; x=1794649343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=kxHxoSCXN/eMf5H0bPcyolPKHQS7ah1Wuhn71swXqYK3WY+pIDxe0NZKIVI3/z/vYe
         xLEyll+sh9roSdmxG7OAddgu0Wkjad3ifaLdmwHV595oTll4VNVO8VQmFOXdWNM73p5g
         rAA/yCgUBTP5nOlDK0DO6z+e2ETF4B0YGg6u3tIFb0Ziiux7liyMogcyIpYQ+fLAMiJq
         rwD5UXtDkIDnGNSmQXQjtK8z6vn1n188oM44sMaXVH+VDw6A48gIZBykN1f8mz8ID01b
         XJqCJkDOq7sB6HK4ZoAff3xpXMnd+X/f4urzSs2VYsm9bk3MWDa2fjthH2jkBomno8R9
         ue4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044543; x=1794649343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=MWTbZ0FtJzb3GwfUw19i/emgkzIwcBcFY+xoaDYGkIhVHyee6EkNex6G04DXR2X56f
         ee1f24XXlv6I1+omFRIvDLjErNOAdh9SPoxI3PsGKdub3Bwqk9CgwgptMqXhNDOMfPE4
         IS5yB/N0HiTPaJEUYeMUM+k9MqbUaA17hjUl58HUI4vOMG8EgCNDYJnAFbiYqcH42w+V
         65jHwqvmPNjdiyf9LhJL+ftBwZ6c9KFKHV11V04rlrMP/xxXMXQ7TnPZRR7lV34rJSi5
         +0GEyizmiBUxY9601uPttGk1JQu2sapsH0USJfbz7S6mYKbLuTiOi2f4EAHnYE1GExVh
         4Mwg==
X-Forwarded-Encrypted: i=1; AKwUvBxdQ6rdqQVe5rfp2K3qp0ujpx4xblzmov1HLgAAPsmKOlygUwyQuInRADuzsrW62sKmU5/xyl+yf9knMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8l8+QdMxH/CgwI5PdDae7ujmQi7vePduc6LpEVRX64MmvEJ1AF
	f8JonWlda4GR8PiQ/dzj5G3Ujh4xSfIbRv7Fb6BmhteuYKWteWu+sX93
X-Gm-Gg: AYBFou3KY4HK6fkkOS0Ic3K3JibBEruC7Yfr4TaTgZoEZPFYpblKAVmJbz34sMFfEqD
	ZOEvrruxIFr03cBLNbqdsAci2IbUBSHy/d+/gJgRqamvttHrxW0xKtDbgn23LhVm7AktRsbH1xZ
	ItvJ4ucNmaba5BkpGoLH9TuLQQnCkZDt7K6Sy7Ow0NSavpiifqDQ3aFgaUisQ7AELRx2kJGQbSy
	FCA55Sehy1aJ2lfGjaFDWPtNb/pV7ch0tLQBYf4ZiMg/ENedxbgZeEB84tEGMoPWjdqNV7IuPiD
	ad5yz+ya+FfKaqq0yDNMHgFc7Uek6ENEtN7sLduCe7qn90GJTRq5r0FQgRo3sjq7WYbNmV4IkYJ
	lKIsVED+oo/1yqJ7U57r6OUqk7a5RYm7shveDtC+owlMtafpgtbZKJqvlli04LAnlDwLYADgPxs
	g4xDgkPJJepQqKVAzRjn6MtArcUOAMgwxNFpk/a1gm9z23thaIdP7aVAGx87n9C7X/vWN9k1Qj2
	EMYVdaVDyflNHOymONqPUNlpM0R87Cgz2Jbit0O8UM8ddBjEd97+0F8rJJ6zxoqDpUsbsXkTuUw
	Ywm7Od7uk0l2nnuUpYbaFQBoQjB5G98z4i9haUdAIoPdx3L2VsJsePdcdtvSNARV0QIqmwXgY6v
	HgBYN13PGzf28Z+H20Mbj+qTZ8SkrJxdrPV4w6f3qQMguVcDv9YPZUNjinWCd/g==
X-Received: by 2002:a05:7022:294:20b0:19f:527d:96da with SMTP id a92af1059eb24-1b25d38771amr6259735c88.33.1794044543075;
        Sat, 07 Nov 2026 01:42:23 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a5628sm13419939c88.10.2026.11.07.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:22 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] soundwire: stream: Clean up allocated runtime resources on config failure
Date: Sat,  7 Nov 2026 18:42:18 +0900
Message-ID: <20261107094218.3952033-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-5-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-5-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
