Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50F37DE8C
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 04:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053508; cv=none; b=FIzpMFYWNWCpU8AEGgD/owc51EaZxVgyI+emQaF5FqNnanYtQqdcHM0+vgXoMCzob+09anmskyEVijYwrTfNkA3awBlDCowgwdmkGB9jJR8fdaTJKpvPoKLoZuLkJjE/fYL2Z97EOldSI19RXRr+e4fkax9oCSJUbLdONz5uYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053508; c=relaxed/simple;
	bh=4L8WQU1yUwKkw0WOIQz0G++XTKaurTWNP8GscxFwjaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gsV3mATfHtKerwIosOerGohX4fNAuFPHprMFxUwlxYC2u5WqAj6mECeUXxisMvSTia+2KdAM4UwxGUJtiDIhBP3IRCKpRL348WcZmxvyZMLkhCnQrl5BikwJN5yks1V0aRYUmN+mh6HZIcqua88lK3FbEGNfWdZ//TVVDZ6+g+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+qlZgkW; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+qlZgkW"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76d797b180so2438263a12.2
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776053496; x=1776658296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpHkHpxIq3fLcPGxqj57fWIAvAweXTqSaoO59Lg6zL0=;
        b=f+qlZgkWGIvuoHFZBERdrxR5gCMoLXZQv7wiCcES2a2yDkvIaTPiG10ecQWjYCmBf2
         pWYEGIlQgadKh/YoPjFb6UW5zCsugemdQZc5DiEUh+1YEj8BI6R8jxiVzZlKZ5oZCIy7
         5Zel0bVBPaD34s9SSZAm7bK02ITmwh6ngILHNRj2meM8EWIldjojOkElubKUcAYFpHEh
         Nds1RSaxzRZ5XmGQMS0uTCQX7nV7qUv/GKp8z9zSdmKrqIsg2KzHa0aHQ8QnkMcknzSD
         CvEnjPz7Yfc7D/Xlkk3vynrvkBNMw6UbQajhGIV7WLGg6uZ06zwDudueaKl8eWy7EfC4
         3uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776053496; x=1776658296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fpHkHpxIq3fLcPGxqj57fWIAvAweXTqSaoO59Lg6zL0=;
        b=Yw/HKrgh1icL2CLlKNsBRx+ZEQ/AjHXO2AAlrw3wtvV0QsdRAQt3vWgPNT3sfCLime
         djI3k3JxcqcGgxJEN0VsvES7+j8VAowLsF2uFItJl9ZVLPaYYUlIVGkLy8kODSKfhY/k
         8gnme7SGX/TdV8kRVfC+2qNplTXBKAaeSOGtbfvWIj+Sg+Dqp83XddjAed6HyTGJdy4i
         6CMgfalVljyFGGxnahR6SXorrFr2H0ZBFDjexMd2Nr80vIbxgYZ/PzHP/RVO/+s/UYnJ
         0J7N/akMmzKEd0+egAI6JuJLfeoW3uRhiRf7cN8pmz8cDK6ZNPmxU0I1g11Y8Tgr4rHA
         jq6g==
X-Forwarded-Encrypted: i=1; AFNElJ/OvJXZywX3hegzfInHDvdyHBvPmOLmherDdK8fgWdOaf98jWXOLz9NR88LvpNIwP7utMZCEGlHmnrj7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu61eeVc9yJpP4x6bcFTbdKznaPltM6cuNm3srbeHOMkRfNB47
	XM+zHKS/60Lj/6Sz26hdggfPQ7EcKJEVFl2uYSzc4RXibI9z0+P2Bw/c
X-Gm-Gg: AeBDiet4YtmupypreMYcPcP1Cq/U2EGf7DfYW+EaxBaUZMG8788Q0sp/e9Ez+kP3PSO
	fWn+p+HvwWMqQmuqyNzm/8c9Fd7zzXEaj78Vnu8Gp5R/23lrmQ3jelU/1hQWkq12sv8h3VjROhz
	5fDfHNWZssM51U1LCRXKt+3b1wvlBrhfRNDymu1YBGR88l74MvD9TlGAyxTxgbtRj4+2FfI6TMB
	V6A6KKvVv+xaIz7WiKZqOCMMCBt1KaFOcyea+0OipvBXVNQgvzsTNVWvA6ZOJNTIip4J6JPRyz1
	uvo/WaUL/5TKvrwVYxvbFYTTJOVvXv/nqxnxYUwJJ5cbQL9CtiF3qz9duLX+HRuv1xfTjmCQbkH
	/bFYfXUM2pvi3sjDydujON1YglFMEGsL4wuKMFafVLNDGQewHPdqtw8SBLFGQ1R9YLoyV2kz5b/
	txB3XF2TKki/hWWeTjnJlYopO7QvpZCKh7QB6YQNdbsQ0t21zQ4I+yjG6RbW/YrDmHs+B+i3vYN
	3YBzexyluhD
X-Received: by 2002:a05:6300:210f:b0:398:92ef:1d95 with SMTP id adf61e73a8af0-39fe3d85ec9mr12452524637.21.1776053495799;
        Sun, 12 Apr 2026 21:11:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:6580:9cc0:8700:96ae:8c3d:9c98:97d9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216ff41dsm7997462a12.2.2026.04.12.21.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 21:11:35 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: tiwai@suse.de
Cc: andreyknvl@gmail.com,
	berkcgoksel@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	stable@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH 2/2] ALSA: caiaq: take a reference on the USB device in create_card()
Date: Mon, 13 Apr 2026 07:11:25 +0300
Message-Id: <20260413041125.1134788-1-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87tstjgwcj.wl-tiwai@suse.de>
References: <87tstjgwcj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My bad on the Fixes tag. I'm on Linus's tree, master at                                                                                                
9a9c8ce300cd (v7.0-rc7-227-g9a9c8ce300cd). Respinning as v2:
                                                                                                                                                         
  1/2: Fixes: 8e3cd08ed8e5 ("[ALSA] caiaq - add control API and more input features")                                                                  
  2/2: Fixes: b04dcbb7f7b1 ("ALSA: caiaq: Use snd_card_free_when_closed() at disconnection")                                                           
  
Patch v2 is here: https://lore.kernel.org/all/20260413034941.1131465-1-berkcgoksel@gmail.com/                                                                                                                                        
Sorry for the noise.
                                                                                                                                                         
Thanks,         
Berk
