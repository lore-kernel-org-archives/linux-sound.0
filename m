Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A5334C1C
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563442; cv=none; b=FKNqG/8HH724+2kN5B3Z1F4KBldis4wnzVysZbjJ9t54AkiTo9QfSnVAGGbeWTEcl2m0j2vH3q0CZyOUGXqqnMuZweiBJLQA9JiJ9xE/2XQkGVQGxFz+Mgsf1B8Wd7m8J261h1iQ6b7lHEfU7n2BO3KxRpDAIeSteTYFiJjXOoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563442; c=relaxed/simple;
	bh=p6PDNVuYeqvst96/mUiT936U27o1lYUly0E3cP2Nub8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbikGn/bCno+EPTrkIjqC9ANw8tgar+LT27MvU9iiNMRrkDzYu+J25KsOhlM3J8DJ+pPEo7ihIH8iiEHKlp1jmbXivuOpRnbMmNboPhqy+Mn1+NRgdAb9ubfMKyYbB0n1W/0iDnsbc89BWPgeC+M+9rthMtyQwpD+kYEuhOJmeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npxoA7CO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npxoA7CO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358bc9c50so712785366b.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775563439; x=1776168239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1LDzbcx9hv1SBKLVaF0WXtQT7MEV/JaBSgS16LIvcs=;
        b=npxoA7COMC2tNYK0AuFqDQ2n5Je3JH05W9Dj677mIv9VKNFAsXlZK5jWTqJIm5b77P
         gXX2jgqqFHXV3PwkS1S6p6W+DQcpedSfFHkAON67n/DB8BWnN3jGSuqNMACt8JUKnwLd
         JkxNdSWpbEFw/8vbHhJiH/u73yJSp5xZqcRwxKWwUmdGYc9u/yc6DLZFIiIvC8NnHlM7
         Y7sZzuq3smddpFpYydaIQP0awkO81wQq3/e9FfOh6jVomlpqQFaYnUfgj29qHv5NoLE3
         ZjQ/+VHKruw2xYScXYA+9NDGE+gPtcCUEFB5K4skwRoxTHoLogzU8ABmweNGXdVj+hIS
         5z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563439; x=1776168239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w1LDzbcx9hv1SBKLVaF0WXtQT7MEV/JaBSgS16LIvcs=;
        b=F+GmqCsPEuLIE8TudSIVskeoIuf6gYbfeNvrp4tO9WRHGDo71fF4TVSCrlT/dYPDRW
         WNuJnu/YgL8rQuOPnknp37q4Oo2veQWFIngUJNoyfbSng5LHv4Tb3sYnxGLEBx8IuMqo
         +0P83bAk7Szs2Ob/gB0bkpaLtfu6BX74FInQhtsGCTFGTJ53GDYNXTxACfWjTSkp1Ei+
         CeykDYfkelftX1rAnOhJ56pV2akekWXdhgZ1zBCoNTzJVhw8d7EcEr3uKXoN/vBZI5y1
         Fbuev/65TbO8ygyPxrMXQPcBpnvx23Q5a+lS8b1m9m4CxBGZ+ntcNyacdUlQ7bNjVehZ
         FE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlz9wFtmo3o635Zwxun1i/RDgQ5vgRm6JTvH9I3PlkEWlkbIEFmE7xNbztUNSQJcgrg0xQvsMElKhH9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnsMlvEb/jWdyglMJUKYPJaQ7uqCH0C/WQvyY5UELy3rmh0BVT
	ZpC8669WBj6G72t9wJ+tapN02FqjNfQmyClTRl8J2LblzlNY+2RKb13E
X-Gm-Gg: AeBDiesDD/FF5ufs2MqtmiGhSRfF4I9raVTg5iZGtaSm+H140a/ZshuF8sc+2p6/p4N
	uTeFUTOnGZ08D8runSZlFyivkCs4FY7ztZXbJkW5nzcjcRrCmGvJR0ggdY7xCGEashRGNNcwLX4
	OXbMEsrwvCKWO6FnyELosrqyEhZS9B9rLRX7lY5EJLuzEzGHCGAkEbS+OH1gtIPFGQQ03WzpZ28
	zCSHasYCRBvApr7mr1LGywIKYQIBlL+ohQCs0LlrfxvfAPWObD0nZXtCnrMmREOVwcIX5ssVl9B
	C6Km1FalVc7RzX31UVJHqFVOvgnbfM9ex5D1TZTHQ6qrxv+e/KIDlCte1NVyzC13xoLb7Uo3j67
	XicF5thAHZndJ/AlxiDH78VskGfDhQgUkJVocr1iNuAeI/HAY5MY6a2TKAzImh3odmi6eZ5Zb4+
	Y8rDGPUcSoaYm5p2vUf4MXOX/l7IKjCC99wRsxEVk=
X-Received: by 2002:a17:907:a0cf:b0:b98:36cd:7e14 with SMTP id a640c23a62f3a-b9c6793df4bmr837389566b.42.1775563438646;
        Tue, 07 Apr 2026 05:03:58 -0700 (PDT)
Received: from workbeast.orfanidis.nl ([2a01:90a0:1ff:b600:6f1c:4ff7:1aec:3fd8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm545515166b.48.2026.04.07.05.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:03:58 -0700 (PDT)
From: Theodoros Orfanidis <teoulas@gmail.com>
To: m.krycki@gmail.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [BUG] ALSA: hda/realtek: SSID 1458:a194 is shared by different Gigabyte ALC897 front-panel layouts
Date: Tue,  7 Apr 2026 14:03:48 +0200
Message-ID: <20260407120350.42282-1-teoulas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAEfRphPU_ABuVFzaHhspxgp2WAqi7kKNGo4yOOt0zeVFPSj8+Q@mail.gmail.com>
References: <CAEfRphPU_ABuVFzaHhspxgp2WAqi7kKNGo4yOOt0zeVFPSj8+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 06 Apr 2026, Marcin Krycki wrote:
> [BUG] ALSA: hda/realtek: SSID 1458:a194 is shared by different
> Gigabyte ALC897 front-panel layouts

Same issue here. After a recent kernel update from 6.19.10 to 6.19.11
(Arch Linux), I realized my mic port had become another headphone out.

Pin 0x19 (the physical Front Mic jack) is re-tasked as a second
headphone output, and the microphone input disappears from the
available sources in the system.

Prior to this patch (tested on kernel 6.19.10), auto-config correctly
identified the separate pins:
  inputs: Rear Mic=0x18, Front Mic=0x19
  hp_outs=1 (0x1b)

With this patch applied:
  inputs: Mic=0x18
  hp_outs=2 (0x1b, 0x19)
  Front Mic (0x19) is missing from inputs.

Manually re-tasking Pin 0x19 back to'Microphone' via hdajackretask
restores the expected behavior.

Hardware: Gigabyte B660I AORUS PRO DDR4 (rev. 1.x)
PCI SSID: 1458:a194
Codec: Realtek ALC897
