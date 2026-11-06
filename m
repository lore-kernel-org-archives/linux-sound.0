Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968701;
	b=tFf7tFKVwIIZNQB12A0NJ6alnAJEGia5oGVkaFiqXkG/tv+3ppoxPoYZCVBqPs/8v+lY
	 GAwap+dOu8G6Nfjr/vecy0ixlwvSHrhAM7C8X73giGB3/OVBx9jKzOh3tNNYWfb2sIL5w
	 pRX4gMv4EY4g8j/MohvWPe6hSFRO/njRoaHnYHIGTGOKuiwOTPZQUG1a8hrwR5oWhXftS
	 HgjjN2cIJesfZLQJuCAdCBOJN7o0MS7uEocEcbaUVrRI7PK0tTgHINAhZYFHJBxrm9R+x
	 SQ4ArrQbTzgbs7/rBEGoAc9EzwzcSJrqDG3GURxnmwAifP6/Ndi85Eldqqdy1Tc9rfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QsrEde8nJ7HRPtmUzm2UfXTLkbUTS89YPJDCTLgdY4=;
	b=J6uMKXbQDV24wV66oV/C3qkK+3nu7JF8uD3g1iuZYQu/qkt8Id3Pd8gA402f8WLZLtP/
	 qlpuZmk4OauaSJJo142GmD0JIUO7F+zGLgTPfaH/s+R9U6lBEX5M5noDsYUKgHN6i/4E0
	 0HyXiiC1hyVkJYE2Tzy2kYD3LuL+FNH9izNt9ZJ4yqO47ncoeg2bTtlfTQDLZuhtbuBd+
	 NHx52QA9zRg3ZmL4kSDYFEvD72Q/pGsF76KVkAq0cwNBR0oSQ82aDv4yN2M7A60PNqwW6
	 5VAVj9xdLQI9Zz61OeUaKpSCwUVGqA78iVlsJAU+ZvHGl0oTzWfJXHw/beSypMI/TZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PPnu9a4;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6376606D811
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6376606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PPnu9a4
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso481207eec.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793968700; x=1794573500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QsrEde8nJ7HRPtmUzm2UfXTLkbUTS89YPJDCTLgdY4=;
        b=0PPnu9a4nMKujTp22muJ94wO+R7V9guocm/JWcpKOn1OnJQg7/2UJkg4ZsT5snJ310
         sDm+zhMGCLlJyAeKyM7VF+jffxNqw42kDBuWHXJqp9w3nSQ/ko3FPCtqmYMJeyyXhf9i
         hBQu8rAFHUs7jIqsRvv6I4CC3r6RMayq5Ezi0Qgt1laI7Yg3DSsuCugLoeeH40IC/Ay/
         ygOo1xh8QgsQwpjfogJMVbT+smQEXIbZE4psyLUl+/8LfcadHXj/5RxBezq3ZBM55nc9
         U7jo7p3j/jocDPYd66yVRuX/TcQOmr0543welB5ku89JKyKIcIQGoZTTKrL7Z3B7Htnl
         tklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968700; x=1794573500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QsrEde8nJ7HRPtmUzm2UfXTLkbUTS89YPJDCTLgdY4=;
        b=TD2k3DDl1mZbBvPXpUYdV5nNwmHEFYjAQkf0AdGWtYpDjTf2qPezIsVSEFhiYiNZDa
         v3Y5xsV4nRDJlBxwVbshfZFhT3GUUn9sJxy4YyfVa48RpIuibqHv1UZ6oeQh7HeqrwPw
         69u6nyKmwgkJY2mUBRvB1j0aW4MpIHPiCwg4RLDCGdFqkJqGwjm9kUAKn7xI4Sh8KFOO
         BAjB9NB4nywRtCnvwmM0AxpQ6qNexmD9tVz6mtKXSr/BOX2PmgAKOzfKC4wqMM1koIzH
         Yxehg5MmTozq+LNp46EHtVa+OCSi4yURSRZJF29YXTLZ64C6bgNKOinASRi6x8a1nDBZ
         t7bg==
X-Forwarded-Encrypted: i=1; AL+hErGLXMENxPdct0RytO6K/Xfz36HQN6WHQX6KphBUj2BGgNPu7fW5+HtR8Yqt/yS2J+HuphDFil1xU5agNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z99R81gWmkJOgQErekVWMtWtjkfOxYGNCZWb4yONtkISYmN/qGm
	m6jwI5/YOe1KdC6iVXWLb/HJ/k0V+on1LqBGa2fIAfKW0BcPxlCpYkgB
X-Gm-Gg: AYBFou3zb6SiDTFfOigOh88mUyI5g+G8BsXgzq7YMqlXDU6FBAct6ewPxbgE34Whtz0
	Uilk0FPMZa/GJFSHBu7ihQdNXL9/Y6ffJYpiIxzZjuOTB+1Y/lF0zEDV6j0dEH174QMQZCrITVL
	RZ3w4fDAk3HQiHpJ+zNj5x+yLYnovdyk7N7aH2fOfFcZRPiRxqj/LZ0DNI7m2OvRQMZq0yVjWY+
	EYz9IlOh1a3iT6jYwoHowo/aqyvrS8Vpa/Q4KGtNX7fmIaivBwpJK50FKx90KuvspWqANHIrf+U
	ELKZpSG270jezhRlYVNFbj7likDvt6FZgOUBndYCNX8FFU3LM+YbFuhGeBN92e1+oFe6SslplL3
	xJO9oYOmyKfykBwy876pY3RyXM77PRhRlGQ+/zFEuq9qwIn91X6mjrbU7kgWlCZs206oWCZ9AlR
	IG/GYY1zVNcpT4j5xK4ztTe5CeA+4Tzo/pnDMJcthifFtGeOS8z67gV0NhN6uzzSV/YZIvJFIuV
	wneeLhv5ZqYjrqN0Ifa60RPcX/E2lJ2Eqd5Pm7lIYCjzCUfDuszTuV3ary0kEnFykLktOTzZvZq
	Y5WLRWDsoGZqGcRO2E/OT0s9YuJABjcf8ZYChmMBv2tRdav++QT7
X-Received: by 2002:a05:693c:884f:b0:358:3426:d601 with SMTP id 5a478bee46e88-36f7398b911mr3264870eec.2.1793968699691;
        Fri, 06 Nov 2026 04:38:19 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm6411411eec.26.2026.11.06.04.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:38:19 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: linear: Check frame count for all channels
Date: Fri,  6 Nov 2026 12:37:50 +0000
Message-ID: <20261106123750.2981-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733tfs4cg.wl-tiwai@suse.de>
References: <8733tfs4cg.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for reviewing.

I added this check because I thought the available frame count could potentially 
differ between channels, similar to how the alignment is checked separately for 
each channel under CONFIG_SND_DEBUG.

I understand that the ALSA plugin framework normally keeps the processed frame count 
identical across all channels.

Is there any condition or exceptional case where the available frame count could differ 
between channels? Or is it guaranteed to be identical by the plugin framework?

If it is guaranteed, I agree that this additional check is unnecessary.

Thanks for your guidance.

Best regards,
Sreeraj
