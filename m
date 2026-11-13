Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553448;
	b=zo0LlZ3ytIAjbMrhB9GDTyHIrzRA3v+Hdovqj8WfwE4ZSEXnAc3CiZLd+Sts8Mk5wGDZ
	 SpDHdGp9IFYL6HR1yy6wAcJ9C32xPkhVP2qrgBuwZklM+BmI/JAu335sUBAWH4+D0d+lD
	 VcWMkHfftXq4+lOlupEPmmmAjW5sfvkGe6m68SVgt98leZqycuagxkkJTrj0vZNBRTggj
	 qn5JbBBhrkKfYs5N2CBv+Rr/pdHv8ludA3Tz6rhn0kqfUDq9JEXPo78e2D0zXT2ECdqe7
	 tYkfaul1Yoxi+J7ziSymK4aLoh2Cn7G99mL+yxL3m5SH0asPCiymCLbNsOy04fms6yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yJI/AwvWw9ZtcVwYBN7RmHmHmpfI8JmDi9ntIdzMotk=;
	b=lmzx1A35Q3qODsJADbAwgHqGAT+Ql0utvsb/cElekIkeZIAvyIXCwYWuZaWbepx3adAC
	 WUlG3kdqhhQrn+fe09KWjAmF1sI7v1E2DskJSZP8j6fWR6t+a0EznaSPN0DEWqPaaW+fJ
	 h+X+6pKywPlxzRW3LyQ7kLgs6s4JdXGabk/z45sjWCp6xKdPF8dARmXpWuKFFqTJBSGy2
	 TbKFCmipitVemb8Sw2yS1vAVoCffC8iGuPUUphKWXm8d3bRheCs6nfuLhZH/oWvvGn+Zx
	 j1mWuNNHP6JEFXUg3PrsFk7oN35/DXF/OCMWI86A29oEM3ohwqAdmsv6LwCwm4bw78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQgkAmWW;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB6606A323
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQgkAmWW
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37628596783so1178094eec.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794553442; x=1795158242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJI/AwvWw9ZtcVwYBN7RmHmHmpfI8JmDi9ntIdzMotk=;
        b=FQgkAmWW4/I0W4K20CURutWBmGJObO1eojobdvW1efUvVPMdcVdAAW4wrWVb1VSPRc
         Xb18tS1oPeyJILsOogzZd1xWKkODzM1onNrq6oMlpDYNffgwhAyPOJ/TpFVTXSOzSwf5
         hzN2sQXNW2e8zqmgE1FMUMxPnTcXIkqlu3H0X1aOimK5Od7A11b0SoyD2fK3BGcFT1OE
         Uo4sDqn+YSIAihI84sFCgf5Wz5hiw557M/NrtnYf+VS50UMzR2NcG6AQLzNsP5C5us7H
         BvT1WtWfZM01uGrhc4w9vpamf7w7LfJvPabaYZ/2VQeQzjl7xI+UfzyWCt1mnbBGbuKm
         eFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553442; x=1795158242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJI/AwvWw9ZtcVwYBN7RmHmHmpfI8JmDi9ntIdzMotk=;
        b=P3OQ7KsTMiuHR67XlY/yqqAFzJGlSarWwQaQ5IgZxknSMwT4wRV+yLGXuEAcqEn6pb
         l4F52WzZ8doNf9FdM8oL15OFqPU5IOMZZxckm39YlvUYSlrJ8vDicfzOsaDiGWD+XOd3
         wDprNcoPEhc96lEfZakmTZBqXoMX6T/tozmHbILmJ68vd8aDwg3him1MOxPZMpHY+Knk
         x05cCjVY7o2uwLTu60EHPXhbduhmTVrYTs1PtY7m9BKAeMteHjMPUW7ugXSxGsa1pWue
         LxFtI1hjJBsEdTj5AmJMrho4/l+ntYpwbeKxNNY8bcmEg+zDJwR+iKUWfAeGNXBctkHP
         bpRw==
X-Forwarded-Encrypted: i=1; AL+hErGqaDlVlxbXUOk458V6F04+VyRkB7X6WrPoLgYSlyHOzACKCHZXZFShPuO2SQjdzDUGjSCAz/IBRH9+8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tNuF00aEbp7iiYs6gjYti9JY5NrhIifIz2yNvGXWtsGNlAphK
	T7pW21wfxQRv2AG97c4OA9NYnZYedgeo9+N1tTmjRmscpYQXEDXMBOJDy6mj9ddk
X-Gm-Gg: AYBFou2OEC+IWWStiV5P8OlrOoHm1G9jAsy1+6tMSChbxI955jDjed8zTx4jrBaGlnn
	W/5r54BGM30+m1fK9QVsP3vJi5kF8IafhPbH2s2pefIXfsfWpHeSrCHLXU2FQJXoH59s4PMeiDi
	bCnpHJOx80xcugLrFJ35uq66O61FA11uLhvDaJZAvO/ayHcHIFEVHnzdQnPDBAVkchcQM9Jbvo5
	5LS1V4HNzG8RH9pSqIE+evaUJa0vNvnsox4gt+8FJLGUHsWVXtbP7hgJz7C1WHqhfUptdkP1wcA
	VqUu4LeczOq2WWIbAlnN7BP1vAVTYGuINULyPVNPEy0WUYbCqoKLLgrLLuLo5HpjjynhY9jdn1t
	lLuI9lA8aXV55ujy/Qt1MvRb5hIqcEm6N+qvTJqxLc8x1gR8iIQ0so0Fwx0WWz7/mIQjpRyVwOF
	tCE57LLmHCGETpe03NqpBbCkoYGQBK+kKQEo6NhYKAw0JLgjauxeNndkYbiQDVIvdZElOxfB+R9
	bJ949Q5ByTZDjiP6pzpr3AKR2sRsThAgyQpbr/1CDBKKsRRbtq58Ya/KmPZitKL/Odje1gbLGhL
	+phLqSwlO9gD2yI/Zhax+VvKDOl4RIZy1okppJtsYfGMfQDcC4l5
X-Received: by 2002:a05:7300:d80c:b0:376:682d:bf1c with SMTP id 5a478bee46e88-379679e4a36mr1513614eec.41.1794553441845;
        Thu, 12 Nov 2026 23:04:01 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm4487778eec.17.2026.11.12.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:04:01 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Gentle Reminder: Pending Patch Review
Date: Fri, 13 Nov 2026 07:03:39 +0000
Message-ID: <20261113070339.2750-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

I noticed that my other patch has been received, but this patch is still pending review.

Patch: https://lore.kernel.org/lkml/20261109092249.3559-1-sreekuttan2156239@gmail.com/

Could you please take a look when you get a chance?

Thank you!

Best regards,
Sreeraj
