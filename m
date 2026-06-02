Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED44B306D3F
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393402; cv=none; b=n1+9Prak5quexFLoGkU8+wqme1Zf1dp2FE1yDNJRjt8KhOtK+Tdf+To4KVnSqRCmRU8YSldL+Y1b5fdx5rUxp4eOoSA+10Ya2XXqhw9kkfAGmupMIMg9Sb/2b/eTmeCWqelBCeGjK/zTyknthiuEp8h04lVl+GYL3IM596vJ4mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393402; c=relaxed/simple;
	bh=8xyHhJ7FOK40jJL9A3NqR4cuESNgurpe4nRJP8WrfpY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=bSOLF5MOHQZ/pazjpLc9c60PxqQxCUTpHxA6wL38Brgk8vqF1jDu4j52SlfLAGWOAc5TjKRRy6wSv/aXyS/3FqtWiV86DEsnXutTjXHQplIytEy41fk7Qp/uZe3EG8kIkfvpvezour2Ak5RR3+B/hk0vTI+ZPrulKg/CxX2Y/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJEsdT5Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJEsdT5Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ae34298aso930365e9.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780393399; x=1780998199; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xyHhJ7FOK40jJL9A3NqR4cuESNgurpe4nRJP8WrfpY=;
        b=QJEsdT5YW0xLrNyxlSNXuNoo0rvF75bjscnENRqzTAXe9GIdxeW3guTX1NlzYR2Mhg
         r+iNDpNq5sTshIISOxX+bdjUHEA3afMly8xgXFmUeBNA/4a1p89EdpuxuKdNc/Tq/Y1H
         rXZqc5w9ssy8y8A+hp0JQ5QmCiGbaAZGpZMM0S/S6AqLo1DEz5PupUUr+ACAPpffOF3O
         jlPGHSwvwhvKSQSWokjIg/GAIhW/9mAEt3zItnsG/+OmnDInRWLOPCXXu8HFIUgMDeJy
         zDtY+8+R+9VZBy0Y0TBCXJYI5OJxQ4En3Ny6bpGbhk6fVpMX9JlPum/EeMNROgm3G7NO
         YvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393399; x=1780998199;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xyHhJ7FOK40jJL9A3NqR4cuESNgurpe4nRJP8WrfpY=;
        b=bjnyN6wMK6MaJjH8b7HYuq1gR8jFb3hzhzy4q+94DsHWj4lyQ2JMGmtCvqgrPbp2Ty
         hqZEZopH/6d6qcqEZ7De81kcNStAIxTxNufPecSjvzthVe2Pxr5OXLArdpwjLFiKXnA1
         wszIGzRcK7xflhAAdINiPBlGF5Byv3MOVl3k3BK3Ip2yQPEXizQppp/+fqwvoVo/wEqR
         MFE3VTkrFI7ZOqp4AMWJJatDPqSa9unUNPb3FL6J0E0bfCWhCkrFuCc8az18AcRRX6XE
         ++uSBCwcbbeUfesKXr0Ec+WcBATmZQSPhx0g/for9iCYQUoTo7u27ePmh8iOb3z7wQ87
         829g==
X-Forwarded-Encrypted: i=1; AFNElJ8LiLPThK0l6pcHaFzmP1UpdJcM/ilfp/53lBItbjayj4DwVzlTQDi1r7yDYyx6e3rpFS6Y7S4lVpq1Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIxA+WnHB7T1EeXxcORVzL4SBlk9EUima4HnKtZ3fEJIVaLqp
	CWecYxKDQtO7fu3zUU0y0djsUF8wmx2ry1rLxQE2Oc2kZW8RmKDfL+U=
X-Gm-Gg: Acq92OFfMkZzfv03BS5vXNt1Ctma1DRPN4BGDd7XqYWDNY0lLKm3eIrpVdMdnm3ZsfI
	j3Fh0m2BviVlB5VpeWp48aojc3g7fgN5DQ15G74+IuQ1xvg4qXJ8m2rJjeYOI3pdyghiGAwWjjK
	SDJx0lTQhnOhIup2GNyEH3cR3A9KMQ7C/cs1rSfBTLzV6S4qJ6J0tE3zvxiBc2obRBBgrCISOLe
	J/2C5eHvhhXo4w1eA+L4SJi9i9UkJdpoMWgUiAKbzLiZtNXnwArkUukrNdhfisHDD9AUzVXnCeK
	ZClyhvFz5P3+UjNCzunAf0n4l5eKi8yK7cych6P9F6e1B5rLCYTpQxtAR6TUpKMM222IUItCkcD
	nVue0KzJugILX9j7EUnt1vGaRCYe5z5gQADH8erv21wzOu3EQsPrRfWADrcNgwyheQgFvCgAtWX
	WgniHeLXrwgXYsGJB9jJ1e+AcTKsovXZYJfqEzLK2omnT0wYzkNJJ0HGmpEfBF9rOolTPrw+8=
X-Received: by 2002:a05:600c:871a:b0:490:b1bb:cdbf with SMTP id 5b1f17b1804b1-490b1bbcecamr17109605e9.7.1780393399317;
        Tue, 02 Jun 2026 02:43:19 -0700 (PDT)
Received: from localhost (32.red-80-39-29.staticip.rima-tde.net. [80.39.29.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e28fa0sm54936315e9.8.2026.06.02.02.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:43:18 -0700 (PDT)
Message-ID: <ff761ce3-ddd6-4dae-8e7e-392874d7dc60@gmail.com>
Date: Tue, 2 Jun 2026 11:43:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, en-GB, es-ES
To: "Jaroslav Kysela <perex@perex.cz> Takashi Iwai" <tiwai@suse.com>,
 SOUND ML <linux-sound@vger.kernel.org>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [linux] sound/isa/wavefront/wavefront_synth.c : Form feed (^L)
 characters
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed that sound/isa/wavefront/wavefront_synth.c contains
several legacy form feed (\f, ^L) characters used as page breaks.

According to the Linux kernel coding style, these should be removed. They
appear in the following lines:

$ grep -n -P '\f' sound/isa/wavefront/wavefront_synth.c
513:

593:

1478:

1710:
