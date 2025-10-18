Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133CD25782A
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760807908; cv=none; b=UDmKgSjTAZo7J3w7J8ZcPbNd/nIrxiMN7Ab4J+EjofoyQ6iqSBdY0qAnig98tBZNrm7qGXrmchrbVmI6oKtX+523U+h28kfJW/WdbecB+SAndSodQZZgqrWWLxuHo2/ZhrcNjhgrn0BW+hVcQu+cDCwz4Ta6jRJDdnz/PyB6DmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760807908; c=relaxed/simple;
	bh=TSRBvewG0VTpHDT6mNUQdOTkBoSKDeHRtger0h+giyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZAt5Y304nf5GJCzCvNrNH5cvECr/YPZx6PfZ9dfdXamOLWPdKmi5UhTJw7NEoerVDmAHC+2FdBIIh0j1760eN9xMrWTBiOYPW0J6tOnrc0PGj2ZYzIX9Bk24zkyVMF298pDwt4yjqwjkFU/5ATNWVdgLJ6lgB6YZ3ECpoVkQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka/chr1c; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka/chr1c"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso25126151fa.0
        for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760807905; x=1761412705; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMyJBIGJlpvj3aFHau+Q1D+pZ3iVXET1VeAj1j7MQxU=;
        b=Ka/chr1cfrJ+J8Rg5nTR/MT8R/cnMMv14d7rONWwuYhZswiZ1/zKIcjliLT3pFpA7x
         SNCVgQu82/vBFRiSxOzm2eMhIL9/CQeYpiYrM2Yo2T/2TP2+IaO0uE+FvovdUtJUeP3u
         DulBs91NVEZZtUTnkoiVZgemeLI51dMux4WjailRumGrnfW8yBXiWrTYBRAKiZFgmiOJ
         pgXluCSztyCwtu8HsUoyTFmhWdg564L43cZTWgh1pJr2+dxu8X9BQrygyU50Sa93Nlpu
         21BRg0dJMgAJ9QkMBeLLaS3DSIDCn7cIpljoAN7vuz1hILAgxhBefmKHRdqyhe+6VTZn
         jx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760807905; x=1761412705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMyJBIGJlpvj3aFHau+Q1D+pZ3iVXET1VeAj1j7MQxU=;
        b=X+tx0hkKOicK1c9ow82XA2RVahh589ajK/QdNLsT74pgH+e8zpYVOyQFQ0SldeCwS0
         jpfYXMHtGukuufw0Y5CUZ036Hn11RJ8BdnisBZeXOZ8JUnTohVZq07AGPQrPEptwbGU7
         N50hZOiaEZPdvpESJpkynN04ffXtJz1KqHZw6NDyldk7d0wHVE48eblbIgWZTdtcsTiv
         bTSoTEbZC7mpZDNxYhATa4tyJx9g/22gjEc5Suw1oGwAJZbAMCKpBU2m8FEsnNS/bK/y
         m/mREi57Q9q8Qk+dNMfsUn1nplJnd1P6ofd0dMf4Q9o/LCJvw+RDMAVomFWsxekgz3ba
         qvYw==
X-Gm-Message-State: AOJu0YwO4AktLl4K8Hx3vzltlrKtJxZKUQQ9u2mmV72Tc6M1wWEJ9RDO
	jaNJvJydj0pdsxW4BGqo/pNoQ+wP939N9iaToVtW0XrueOQG3nSo7mqNdxoCrdgX
X-Gm-Gg: ASbGncvvz4mkj2mqBfWNgVmvIQqO49l2n9RQGX+EqZYp3JMHoNDzNTmtaXkhJa2esxS
	i7hCYqr5UYRH2QXUx37iRFORtp+KhEZocdI71eaHPb84no3XIJ/PWCC69S2tq4iVnVX5rXHcno7
	XhDBjikcPMfHHDDBMor1RkFhWGBDm+CKmNGthWzjNScyBta+Z5OBuHePeVn5lpYxavlJLLZREJc
	G3prkzJMlnev/jKvvF1D5qNvrkAurHeIi9IiEt1NxMLH4tjq0vrmgmy5jrCnvfUb9cjWlyEx+tq
	Lr8+xoJOCMtzIzZoFqT9QfbKVrszI9oP0ZSxo8E3m8fckRVZNf61bQJMtAZGOl1yWnpJ9LUOTkx
	j/NFoBe6foeV/5MV1L5vCY7LrHxEmvLYJhqWjHpdB81eUG7/64+XlOftV/N9b3DgzvlzG4ZgwvY
	PrH8ORyw==
X-Google-Smtp-Source: AGHT+IG4g2r89WzwIRPj8bURmHsd2JRavGwIFhO4seE2BaurD6XhT6R5/OMjUJ/VZqhmGoSfst7L/A==
X-Received: by 2002:a2e:9a13:0:b0:372:414d:3cf0 with SMTP id 38308e7fff4ca-37797a79d00mr26489511fa.39.1760807904494;
        Sat, 18 Oct 2025 10:18:24 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921e467sm7850211fa.24.2025.10.18.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:18:24 -0700 (PDT)
Date: Sat, 18 Oct 2025 19:18:22 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Xj <xj@wp.pl>
Subject: [PATCH] ALSA: usb-audio: fix control pipe direction
Message-ID: <aPPL3tBFE_oU-JHv@ark>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since the requesttype has USB_DIR_OUT the pipe should be
constructed with usb_sndctrlpipe().

Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
---
 sound/usb/mixer_s1810c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 15960d25e748..89c652434f71 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -178,7 +178,7 @@ snd_sc1810c_get_status_field(struct usb_device *dev,
 
 	pkt_out.fields[SC1810C_STATE_F1_IDX] = SC1810C_SET_STATE_F1;
 	pkt_out.fields[SC1810C_STATE_F2_IDX] = SC1810C_SET_STATE_F2;
-	ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+	ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			      SC1810C_SET_STATE_REQ,
 			      SC1810C_SET_STATE_REQTYPE,
 			      (*seqnum), 0, &pkt_out, sizeof(pkt_out));
-- 
2.51.0

