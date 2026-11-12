Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480691;
	b=jzOYuEK/x8uGxcxbxiB9M1uXuocuhir+BtthB0T95izb/TpR5PCXx8pcytPHx03j64YN
	 ASyMEdS/guJFpk+xjan7tWbwGIu9de2Xw86DQkhlfK5pJClt6sjaaU2lDbFP8nI7PtPRK
	 7YRL4fsg9vAwVCg1FQQSYHIfcGVVt8MuTK21VzSQhcTqGyD6hNWif5mZjFLCZN9axiqNZ
	 cW42o+y8qIbqCpyJ1yYL/zBGe6D6yHgeTcs0LCkkDnVqni9phK2y+QTr7H1Et1ZrOx85c
	 eu4KfLn41/6GwAHq13jpo7mde4f70euY2TAGl/SXVcZ+NUzFKaxrlCQ4+uR2LewYG+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ei7oe26oYP1pIuCcwgZ+hnh5XI2lMWOHH8yz8N46X6Y=;
	b=dM9obpByzs9LgVPwEvEYKdiXwSlmhTjVqKlaRO3ZwsOqnV/MRjZRGVlkXxOhi7DSoRJz
	 r3UsFE86ws93C2FoVy7S/YF0ymu/CzDjQOt1GFWMK1gIywW7xkqGUlWYWeO7Wd6TQ1FR4
	 /1UhWpjGv1XJT7GD6pOwVvYpNZeLtz50tOsTVDf7E49TqZeZjtZTfQClweQNbR8oxgqE9
	 sDoHWO/jZKQZ2miYo8RhqyexKAuYvllTCR8xj/ewVCXajNJWLsUnQofCRrf0fAkYxkTRx
	 mqSFa68H0o2NK1aR1dZfOXomHjHnioa//cg7/1gTfrOteBGLWIAyPS21jeANc9xgVbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFy5xjcZ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F5606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFy5xjcZ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so6197380eec.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480690; x=1795085490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ei7oe26oYP1pIuCcwgZ+hnh5XI2lMWOHH8yz8N46X6Y=;
        b=XFy5xjcZMqEFdcI3AzendICQp0IX8KlL1UsJyQ4U4XEnPM4S/EQG4GDL/kJGndJoPY
         8gg4trQBY4YkH2Lh2ydAaHD+drX/dFXm83B2UHXRer4DsvKN9gLgHtwXc5MvRjBH0oY+
         3hy2RjoVcVAxusv2rxbM8yPBvZzZwlIjxDNhZiat54vDJlPvY93MNJGyDyK7VTGiy/BR
         uKPBctIBqAuZ1KLmximC9Rh+yNfBnLycm/e6IBg4Gla0l1Bzv2Y3TwXQqEfpbAnarV7x
         GtopKcFexOkD7n8dQMqEiiKiAQ8oxC2de7+7VAVi+xSju8JwMQdF5Kgh3xLtr6Ld1xJy
         +NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480690; x=1795085490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ei7oe26oYP1pIuCcwgZ+hnh5XI2lMWOHH8yz8N46X6Y=;
        b=Tq3MndH6IO5bH2IUrhdUUJf13jN/UtalBaVQ0ewIm69JITZ9BqZGvGwYtVJOX1x1YZ
         XbopxFfLAkCWzEGB9tS+ziBg5Imhqw2PWTljwZUtdg76KM5q4Lmzmj48sY9Bj/YdXMYY
         9UlWVygAwg1TEmaYiT7uUyEzp5zs7FrrwBgo7ZgM6QI0Lzg0QjkirHOrLbUI8+2+FqNd
         SQU2dR5YiG6JNgUz/yH9ll1DCiyHEogtdLLRzX6eHrt5p1ymKEwDMFZKVsQYA+WlpZbZ
         z9gVrDboolHigwaas2TjetkfUeVD67ayxjxPRAAfvye2j2QzocQUrRr2jG69YqQQwyjg
         LYGQ==
X-Forwarded-Encrypted: i=1; AL+hErH/ym+/B1mwdLVh02hqEFOA/PwFgpznr8svY3nnVePZS/3VGJzjnMLCW4r35/OvLK7UnlR1hMrTsgSf6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GXEW0rOFV33quPvgzK+vSqqd4D26nK02Lu24l2poirOB6VJPp
	E47qiU3YT++/uNUlJp+Q7orbYUNDMuwsldGGw/NHmgaToVhPNq66idR/
X-Gm-Gg: AYBFou2m4Z2GBUJ8pR4GAA7iu2CUfpa9imggklfunpeaPzW2B6LiqX6eE8n5L6/vo/x
	UcwZmDo0qMXCf0HHjBVMBHQQcIluIfB+/jaJ42IrbIkhlCxHz9UFP3SbvcZ0b4V0VoEF8FY5O26
	Ed8lEf4TY4obASxy0qqsH9Kn4mC+fkiuhQpR0nSipu84PuhCnJWWNZxTi0jZF2Hea6r5eYh+F8w
	RwLVJ2bkQrV7ol5WxdoC4UNLkU7ZP+Xw7Rcen3kPPnnXHIWcbZ/1WksFN2eu0dTqJ1bMfKnBJH7
	6C2oS7X/RJgLlcGVwX5Ie4rV+ndaez0ISGEmkxTS6kPZ1sv22J81zfnAbhhfTzXja5zfV4Pfg7O
	sNF640Xl7UHIr90sIz5NczKS+JBbc6X5lzGld/TilL4bFBA6mfPB/0TFQUE/tQ4s25DdkJTLGCv
	nUrPJ3CZc92WzRtdzpR7hm5jS7zSUfdFjtBJy96cmV7D94XvLNjSHjONZyGUxUQ2jh31LB352O4
	vdSekVgdO1luMt9Tqqpv+AFNQz87ocMSZUZQaysDuRQ/8xcORqRVHebIiVf5DG4QxmamY4k7yuG
	yfSjY5I4q3xirsq7qTC2Up+bMcxUvIH5BOeJWin8+/35kxlLemZtMxPvNbXUQhsMVnkBHiQ10G7
	CNTaXks5zmwX/7HaH09Px/llhdipOsoXOjXhWRWCshAyx
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr7982100eec.10.1794480689606;
        Thu, 12 Nov 2026 02:51:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:29 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: fsl_asrc: Fix probe and resource management issues
Date: Thu, 12 Nov 2026 17:51:11 +0700
Message-ID: <20261112105116.32274-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling and resource management in
the fsl_asrc probe function. It fixes deferred clock handling and
runtime PM usage count, ensures the IRQ is requested after device
initialization, and moves runtime PM cleanup to devm.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: fsl_asrc: Improve probe error handling
  ASoC: fsl_asrc: Fix handling of deferred spba clock
  ASoC: fsl_asrc: Fix runtime PM usage count on init failure
  ASoC: fsl_asrc: Request the IRQ after the device is initialized
  ASoC: fsl_asrc: Use devm for runtime PM cleanup

 sound/soc/fsl/fsl_asrc.c | 92 ++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 41 deletions(-)

-- 
2.43.0

