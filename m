Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853925;
	b=Fa8YHlRAlRUKdTXgNQW9UCtO/yaYnKy4WudTHpGvwLse0JcJo66cHqvzvRkGjl+gdKkw
	 BPkZOLYd+TDVdGvwzYlH04EWPs0ebRYNdTrPIXEuLN/uvV65hopKGqJYbnsAZm1zDgjbG
	 z+FSzg5VCnNPGMq+7HKjGbbQp9OPncmsf62KFSBs7G4F9A/tbr5uzQQrEG2WItfqZnGUC
	 nz4ilHbK85qI1poTWIcTwvOKPoJCj83VkyjESMb6nVu5yE6Oic94pMYxPMzVu9Ob+NDnm
	 uidYl+CpYvmmbE/bAQIACkARzi++FNDIUlDvs5c4q8HFjiWPPtwhyVHo9bpS01NtlSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=Yks9ICjrtqII+AoGfFREuL1Z81FC2/J5Ayksznmz6nRu2NXP3JGvXXCS50aHOvTyqbhS
	 ciWZiJr1e76yatQKS6MSJjYUzhWkWatZJUQgUSC9dqmWExemkJkMs+c4R5jlM4yXMJQzE
	 MQferKR8anVN6Cof7VfvI7Yd4topw/K+lVVmZqUn0ZXc3zVOxqJufax+RphYqlHsTqzQ6
	 OSK6bDHXQ5VMb/2f/nO1ivPvavxYzCIuYMGOa5IZBPk+wH/7LwQkgELrX3U/VyUHARIc9
	 K8ePKsovqGPHYRrbivCbJySCUbHstHwZVRl7NZ5yqDcJt5W8rZZmfozphvH/GSb3gDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nF+rRutO;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB2F606A33F
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB2F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nF+rRutO
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so13147205c88.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853924; x=1796458724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=nF+rRutOj8aYEDNdLcB3FhFMtcFXf0c0a4XIw5yxmuSr9Fd/2ERmLYbjETWE7FzRgs
         p/fhHM+Tr+ioXpQXL80S/v3UGsy2qJXPi/do8Vy5ZoFa92dawBO2kK+unxxcf9ws2PyC
         jDpvu0wchBC1LxQ3fYb0sQj2+JpJJUZZMV8wNKUKSLhpWFEL2oOxww7atfQPRtVyF0hZ
         k0kWmAWBSxNL9GqNoeZVHhyuwfKeHa5NEgwrGIHo69gBwspJRQxW72cIqJmOzbm4uaa8
         7aKePbAg5ec0DZ00B/y5LjauB16lKygnSMfVCTqZTsSB8qs4aVb51vim8gNBuZ8XUMYt
         Pg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853924; x=1796458724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=aJKenrpziQImXkONS3Os9BI4SSzKsd4HunXRzcgB9mW48s2FbiizJ1OsFqJlM8YFva
         jKPAKT9HaWZpuMPoeRpWV6FTU4eYVyD/SsG9421r28POyfhmBMnw3xSGCWOCyOvZgx2c
         GmQodALYd9vANLjrscCkp28RxQFOhjGnwbhgGeaOd3iRQiHhRZn/cFHj37q4t44Nw/hh
         y8r8YfLuW6JK0gGVvJXToTVwwz5dSkce3hpj8MDSBLEYgOolnjnz1teAIBrzCnBHmbh/
         qkJDb4e6jxNTPxjQe4IszYHIJGuLmx4elrAM9MmbnHJFPH6Alg631VY9MDob0om/jChS
         BPPw==
X-Forwarded-Encrypted: i=1; AL+hErH8FI+8AdpVrS9dudPftBRurO1llLcQR+qvJLo4Y8VUgFB+oaxZ59S8MEB5MMjTXnyubYZwZTt7q6RU7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z93RDw5JtXk+0aNyWsk+UZ2OydWqqME+/umuGf2/SFLmv2o54zM
	XRaLAHiYRQ5avTjFPmUGeRjCqHzxajHUtSDQQZ/wxg/KLmey3q4PM20B
X-Gm-Gg: AZFdTZfGVZpIk6Y48oW+XkxxMVyFEYWZCeXyZ6yTocNPFrMRt4B/05TqL9FH1BbcOvp
	4RR11/l5V1FyIHaDctct2IH4CQ0unRIQ154H70BCqH39XF+UQ+5b8Rb3SZLFBT73BNBxUuOOQl4
	4ASI6Zw09hUSTMgVBeIRL569uMVkiG0Ov1FUCbZYCJPzJe5Ygb4eIxtihvOzv0euLzaIxRIhcsW
	eG/r75JKprYJ6w3rqw85hdtGdEQfnOdKTQ3POCiH69QZIH5z0w31KZn/2d74doX48S83i9FnmSR
	qZ5xLKyPhOk7hh2cvswSGMyIiCS3s003qqiGSqQnrmCmDBFUQm/c/pzJoq2xszsqT/RGouUL5tj
	j0lWVllUqL/bPhLQD1FrLXKclT7wUnRRsdhGS8yE0gSsyuiz4m8+JzqXCY+hofhrNhvWz1Fb0sD
	33fuGL3fE0tJdxdrisWY2VSBvkUREriHVainARD0dps3tl3AK7QQnw0IMquFCCAs4ptF3nXSiKx
	FG+7C/SJG6wVeQhZe2vxVqVNRllp2ZzP6cOjYwf4n+cG0QZ4VEcKReg9eJ2d3p8xilWWCtX5gbC
	PnhowDUJVpzTz8qiCauEZfxrIkz/mki94Rp8SyLBIZ8zUq0oQeHA9E/FF1LxXU44y4oC9/jR/Q=
	=
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr33965980c88.10.1795853924289;
        Sat, 28 Nov 2026 00:18:44 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm55344948c88.4.2026.11.28.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Sat, 28 Nov 2026 08:18:17 +0000
Message-ID: <20261128081817.3132-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <878q2emazw.wl-tiwai@suse.de>
References: <878q2emazw.wl-tiwai@suse.de>
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
