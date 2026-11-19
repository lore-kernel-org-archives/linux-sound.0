Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100897;
	b=ZbGPpRPVBt5/ht5oYGXxxO15rWov4PlBNM4UtBJ1XlIsj3LaMTJA4ZUCoxoApkDQumxf
	 HN1YXDsseN1UZJpIG9dAwGCeWYQs17HFSFzAJz5a1kWRWw1m511w9K55GkzjZxNfvFCuK
	 +stFI+UdMsYBqsXLFhqVbSo2UA5euDbSrwlu+BZX/ssOG/x+keLJGZxdu1YX/p9Hh1FoQ
	 FTVQOFCCYJpkcrBJSf00CiTYLah2HVfVwC4lPxMsxGvAwRgpLzStecAKpVwUda8cB9jxJ
	 2cZPRwTcecMSGOXpeiQeLLVQFKuXg4R+PebNA7h5mqZoEACSsJvUUs6LgwxlvETbtfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=E1bLtb9wHueLfnqkvvYwJfJe8X3CenOVhANQzEmFvbpNjbYVxyjFqdOjeP2E4wCqSugJ
	 VsapOKOUzMNW2AuSj7arlbzUTmmvxHZHTEps4UoIvt+gnXN65uAc89VHIP/lQd0pclGMg
	 bB61tHIoRwGjmUOovfrqa1kE7yN2FdgLvAMukJdULdXFzABZQC2I/6UOah9wdHfZVX0Tu
	 Dqrzfr+bbmOBiXi5Sh5awQD3nNaXRE+CfI5AVB33XTLfJXPnTWgTH7tY9uZuY3ob1Q8RZ
	 Wq6p1PR02tM2lVNf5XDqYPjGRZ9i7ixxhboEpNRUchG0L+KIPoe4PxeGnK0x0uiWPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJCoBasc;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E8606A339
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 15:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785E8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJCoBasc
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so5366782eec.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100896; x=1795705696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=MJCoBascf/JD6aYl009fafAxphMqfJEuwkk3KVhy+8xCRIxSNk7uvnlkI9V2Ykvubv
         J41RAVlhjAQe4phLfqrrMNqrQsAYSkM2YJKWgRHoviKwXN6NFRaed7qHOTsEVrOUg9F3
         gAXouEMBXI2GB6LGS53qbah0tjrrCbuDGMVlhqBt+VXuZYgcvldE0wOvvvvi9cuhNrjL
         So6btNB++z0Y421mkgaHeSkDMiO4O/Fj/KMlUK4tB36B6oxYquD0quw+Y7OkDIvHwoBl
         5kUE3RYYM/lLSwc8Wi42Yor7nXXC3j2bPJbj2p2o2ivO/CdO4+jYu6In0T0I2Y1iXITE
         M7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100896; x=1795705696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=1WN06WxjYxREYf4sQUlb07Gbs8YK+R6JCZivgvFcN3T1rFXRf+Tw73b6Bj/Gz/pLvR
         H8PCiVW4kTJfCa8O9UyYCrGR9pcSpHiBzQdSMVTaV5QXhxBmezFe0Iw0/o3LWHO3R9vU
         6PC925GHhtw+Y/UMWfNv6qGzeB8EAzk7wcklAEAwbgjlYjP6nZ/buvthmhPUax9SMugm
         dHqekSmiaheHrD5OfFrEMLMQHZUHwgZYVikFk6LHmixdrjiR3JiNdgY9whMvbSJA/oSV
         ql9UCp/JyVBeVZW+gC3py+To/B2A1zvNIS5TRz5/gTKCCf3n6aiyjBPzfC3oPXDPe65N
         nAAA==
X-Forwarded-Encrypted: i=1; AL+hErGGBRtxQIq8FRey9k2tmIvTqleDraQfmVANHR9JzjGcii4mUtCv2uvrAJw9p0hAXFtpo+Wm+I61ZTqwSA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eh48vZhKY8D6CmgtJRR3z3+TozCRPjJzo7KwhR9PNqmzHRtjf
	3OnkuF2UC84rnKZDiZ+7dgNQgecOK5nVD76XfywNKi1vgZPXJTE6siZN
X-Gm-Gg: AZFdTZf9HnnyzggnqPpDmNbBJL6d4oW4OE04xSPjKWOxMhNIifSEK1glTaVTyfuhzKa
	4LRJrGvB01KbXcjcKKsjj6yVUdHX6naGGJfxb5vHJHo90yQIexuFX4L3d2ppUYSVwPutOAACJ0q
	wcgpMR7Ud9jxideloRH1GMHPBdTJv+zjAOZX37xHeyBHkTGL4UMQdCqkU/HsBh2SvRbwRHq4Sad
	ihtc2sSADpuMc9P9plapEqpXPWG3KS8B8UDmCQmVaHZ/F5ObMhXFQd92z/rt6hyw317x0PphaPU
	7rWe+RGru3olzMMOvi5AymnkeRNKCGoyGDWuSu87RGXU7CXVIcoaib/nPBdTDEqOQYF+ZFdgJd2
	iHH2i73MktLwjhJQ6hoxrUQ8EE20iJnCD9XKLbpY4pCio90QC6dPuK7m1+cRYheavV/nezSJHV2
	yRL8lEr11XNtMSumqSTnoeUKg2bewEM+hzWPwSFxQqRtMNLtObRyOln037kpUm4THA6H7e9Ym0B
	6ek05CbE1sRmIqvze2vznqWnflANa6dc0qakSGMrL4zTnmhq3t8KigS+DVrY8um+1IsOnoN5wbe
	VaL4To0jJkSFjrugf20448i5/jnkRmW6Q9/bileY7JqUWBuJlur4
X-Received: by 2002:a05:7301:6794:b0:384:ce59:5e1a with SMTP id 5a478bee46e88-384ce59897amr1818428eec.16.1795100896568;
        Thu, 19 Nov 2026 07:08:16 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm19845018eec.2.2026.11.19.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:16 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Thu, 19 Nov 2026 15:07:45 +0000
Message-ID: <20261119150745.3450-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzghugfm.wl-tiwai@suse.de>
References: <87qzghugfm.wl-tiwai@suse.de>
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
