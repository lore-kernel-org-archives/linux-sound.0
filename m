Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137813;
	b=bNg8GdNm8rDkLyTDelS0918JC8EU8hGYYue0rKJX0J3pHAwskzFo1xQ5lQcF3ies2mOL
	 n+tNaozTgeXVr+pOfKF0j8Yisi/o/G44jei3R8WaIq08iz/8+VwQNNdGeXCx393xB2krc
	 pj8Uu7kxViaEoH/R4UhoCOhPGE3TQzz0yjD6rWhZYaUxJ9jtx05Aq1yYZIEkTEy3TDo7n
	 QhIFkuXcrXF0DtDVQflQP/JTYyxdE1awu7bIckIvUWEBGcjqzmS5kzjQRmtfI4B2kB6k7
	 94QZ3mjepJPwUUi7Y+BZG8a6tQu2zb9i60HHIMv/bH83rIOTZuc80OnPqWskVDmv00A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+oH+HxELo4BGokpx5I2UXN1j4CpGX8mo4PNCadAEpaE=;
	b=QFlKnrAYvkj93yRXDOurkqHHMhS82wGn90QQ0LMx51rOf0Y56TeVnv5HT05ENdqc1UT3
	 MO2ZmxK7ru0FBHuagVXrTemvwvVfvLt9P7/y8D2i7P8xJglTGkSBsCjLX8zGhEyqU23sg
	 FyoV1EksPeuC3EjDZ0ALpc8o2MFe/BwVf5yw42CSz451XjCgotm9ZMhitqM02QaVZf5i4
	 Z02Bctkd+hVS4CYnFgfD0J9venjo0AqiSu/RphmmGk4Zy7vKOA7oqvDJ1ySrHzg2Gn3Su
	 gCy7BiN9v2BKlICIpjJ4455H8zv98v/j1oTesSrkOrlUhJTkvExSDqfMQgKFDwJa8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wT4DmX5v;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA33606A323
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wT4DmX5v
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so95491c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 03:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794137812; x=1794742612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oH+HxELo4BGokpx5I2UXN1j4CpGX8mo4PNCadAEpaE=;
        b=wT4DmX5v6g8ragyrVs1tQyMVQDrbpf0i7mYsKboBOonG44h2jWSwrxD7GEq28ZEule
         MyIxx1fCdjfa7TqdL2hpGKaLD/wO+8ySVlJdGEYKOc15mno4KK1ZApthumeHomLbD68B
         3H+4VqtFRT0t+ilLrJ4p8bibw7zXl6YUnNc2Ihv2N6NVNcv8ufuNL+4EQjIRDhIUN3e+
         JzVi05y1HBp6c3y0ds7yyPhI51PqPMXrYiooQ69WpldDLyrAf69/rW0FPtGUGQQzTRdn
         aaUuNE8g61FFZWe+zE6lSGI+Zf2iFOIrpnXGPNjmzucC7PkAjPC4OOkK8ko4/fW1hlOp
         GZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137812; x=1794742612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oH+HxELo4BGokpx5I2UXN1j4CpGX8mo4PNCadAEpaE=;
        b=pbHelM4J7PAdeVRTFsjSl0BabA/E4PtUjwmAw9nXrmpKu4soY+4q+gUnm1a7aidEZu
         xJIMD/WAsU4jdz0OPTbZhBAAMXDaoixfd0LpRzZ6mrgo/gKnBwS0Iu/HxCHmj0P2p8iX
         bO7U7QCDgFd+0KLTkUOuXiHN12ZRoKynKiZUrL1GQ0O0Lo73fRhcQlrIJzJ72V2CiyLE
         BmLicoL9mzz1z+GzGuLC5LIW3VgRzT/PINRQJ4RGG9vstij806+XH29t+OZ1fF2mGzf2
         +HaCigTOm5l1Ryzp4Umk/I5nm32yTHDupdrby8lqTFIqfyiDd2PSf8h10f+/NhDQC7X8
         pmTA==
X-Forwarded-Encrypted: i=1; AL+hErHFBVtNG8t0nJm2BwumkEGv6AmIHPe48Sf4UE2GbV0meh188W2cJjLwZBUnIFXGuGNpA9Y+xue6YH1TEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/geEC3yEK0rYSc6FnwvEXEPKOJcrOBTt73GsF9lhs9GljaTIym
	NBtKiPsJYfZohJ4VtD5MlKMtMA8Irr1aEXp14WG/m81QyaAGEEx6YSsP
X-Gm-Gg: AYBFou37XC08210lwVXi/NqHXgPQseyLxJfKdOysUqskgFIyQ4ZSYgg/ekKeLF4jfqn
	JHJ6lly2Klqin1k5hha3HDCIf807JI5occZLdxJXmXiBl/BkSelIlKuKUcNvvUo09PgCQPOnUSV
	AndT5qf2YVxhgQUAScjRH1l2+ISriVvH+laxAv8tQJn6s6khhxjlIEdrXsK0rjNutBzO32+5CNA
	K09zFM+8bOXBabmwkPdOInywWws2wCtEbrIIntG80QYKaUTpXf54J16AK13hjHcPvBIzxl1z21W
	00Ra5LMWEm6QyhfKeZ8nwwO1Jj1ZfZtYWhr1oxiIX8EeE14beF/zM7MUdGNC1c/pABIfrXsrgwr
	CvRX5XE5jBbTsjoDGDM6ZKkRGRU6ajUcSntZcTaknN1IvCA8VNoGKvmBsydikjKY6PQL33skWwY
	GKPgnw3PgXr9A9FlS4Y/wI7uybiZ8pT1jmgldyx6Vz4ibBcZJdw5B9g3zaDYj0sL1nehB3bjVdW
	c0kfF8A5VSLrWIM1L0ali61cG0V44hKlzrupVHwXRsgqdJEgmcXY84HnXpI83YVsV17ZKKHv0DD
	TIFr5KmhyQsWbgZTymPrKNG8rAn94ssruLUcpfr9wE2TYKcZDcJJM1JwwEKGHlU/wwyVV6WO8bu
	KMw7362UPSHxd1bWhApOFpYA1p3Lf800+vO+w28bp
X-Received: by 2002:a05:7022:4591:b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b39fe8150emr2783771c88.16.1794137812026;
        Sun, 08 Nov 2026 03:36:52 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm4687161c88.15.2026.11.08.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:36:51 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Date: Sun,  8 Nov 2026 20:36:45 +0900
Message-ID: <20261108113645.1730429-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <878q33y4z4.wl-tiwai@suse.de>
References: <20261107111056.667-1-alyandra5b@gmail.com> <87pkwgyck9.wl-tiwai@suse.de> <20261107142950.125901-1-sammiee5311@gmail.com> <CAJYQYHxrpmBPiyMiS2oK8eugUMR=KFmf9D5jwLdoYUYQgKkXjw@mail.gmail.com> <878q33y4z4.wl-tiwai@suse.de>
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

Hello Takashi and Alyandra,

Sure. I'll put Alyandra's patches first and mine on top, without the
KUnit part.

For tests, I have a sequencer test that I used for these changes, and
I can turn it into a selftest as a separate patch, with Alyandra's
KUnit cases added.

Alyandra, would that be okay with you?

Best regards,
HyeongJun An
