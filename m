Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCD1BDA99
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 19:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730403177; cv=none; b=CjxBHAdszomyesnSKgcnBP/xBmB6fFrQRes8zHckwg8DjspT1yypnJwtFGpxdDaGd6a3UqSpLM53Bxg/ivBnVWSXlabc7E7t6T/jsHQ4M+JknfoFytI+TaxN1xStq4XCBSXjumkQj/tOjAhlwkr8TuR1PA7iNmH9+5tPq1+e9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730403177; c=relaxed/simple;
	bh=seH14HbOa0G2TI6FtYNVyHz93mLML89znvZKAJV7Th8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=r0g8bTz2yovN07SHpr78cipvntQr/NCfwhodZfXkVgLPLH4dY3xAtdxiMUwZy7Mhzns4bUhG1nQ/SxPtWlAq8fa2QMgcKP8TIahE5ow00xsAEqIkqCK8k9BMsdfhois+ehix66ZK/qLgPLYofy0TRm0+xJgnyW/WtaddjcLxgoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHCoc8th; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHCoc8th"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso143939566b.3
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730403173; x=1731007973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1pzhSlqlbKPTbcnIugKvI3ZJqjleCzOO1Im3Is6eyQ=;
        b=ZHCoc8thOYFuXGIzObtY4SwIJqbDXI7IVvhWDTd40AC8pm+9mxz3KVFTL9VRAi0iiN
         qw2Gs4ZyI6Npj8iNCYKKjIlNjOQ8nmHkti662eIXbgrPUkdrVuSZ0wrcg/RiKhm+nYR1
         C/PPrzA3B3632dyi1OJHrqLpzH7wMAvIFl5v96CX1EFU/w6sEhbE95nczDKSblK/O6Hb
         R14JWWrNPF2DZ539pFad59LJz00hd6cwhPn3kftSm9eI5Pxv72nY65qpG4qWo22Bzz98
         G8Xi99fZpJrbu7MnmAeQ75eJs0GcVP54rR+9AslsVaR/u1/WtzKqbmwppcZSVlYHBvqd
         B81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730403173; x=1731007973;
        h=content-transfer-encoding:cc:to:subject:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1pzhSlqlbKPTbcnIugKvI3ZJqjleCzOO1Im3Is6eyQ=;
        b=Bbdbmbb3kPm6iWd2VcZ1hdljlGGBXrD70No58cP8G/Bs94thC5+ydYZsy0vxrKFVoM
         l2zItEbQmChQt10+UqcA/4Y8aBkzfSl8JbEICLlqQ7LR/yhdEfOMfOHN08LT4x3ltx3F
         DC8DW+cWEWfzB0H5tqpADQAsPRM9WJ3jKTaNrQLh3BCagK4Mnw5VOgK6nhfdtLZPdMI8
         FlH3KxJe0+VXnSOj7yJYkwNrx6yptGyG2v0dedl86AXt4QxxmSfFgKZ4fXBN+3z4S9Dy
         WGVWb1PbPs5x4kNhAhNb/gCFtxELErGAV6D6YB1JbM7tvXEUTNPRDKXjLChIPsdA5kfu
         7W+g==
X-Gm-Message-State: AOJu0Yxjzr7SstyAWZvrRcZ3aA/enSOzvK8fyYZvGc5PqKyqZvlfBozE
	XWNVekzGG6JXbyR27S0RCZ3s7Q/BW7J+tYVeKtVoytJdwxcAIDtq
X-Google-Smtp-Source: AGHT+IErRPUwN4pv8NXYMrTgioMLlIkJMd1sX7RfLwNUIQm5RGrOV5iAcSQgEd0aDBst8tlUlA0ubg==
X-Received: by 2002:a17:907:9814:b0:a9a:20b4:4078 with SMTP id a640c23a62f3a-a9e508dc1d3mr374728666b.16.1730403173313;
        Thu, 31 Oct 2024 12:32:53 -0700 (PDT)
Received: from ?IPV6:2a02:3100:af9e:3f00:f876:f664:2bd5:aff4? (dynamic-2a02-3100-af9e-3f00-f876-f664-2bd5-aff4.310.pool.telefonica.de. [2a02:3100:af9e:3f00:f876:f664:2bd5:aff4])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9e565e095bsm97101066b.99.2024.10.31.12.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 12:32:52 -0700 (PDT)
Message-ID: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
Date: Thu, 31 Oct 2024 20:32:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Subject: [PATCH] ALSA: hda: intel: Don't free interrupt when suspending
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no need to free/re-request the interrupt on system suspend.
PCI core takes care, using functions like pci_restore_msi_state().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/pci/hda/hda_intel.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b4540c5cd..9fc5e6c5d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1040,14 +1040,6 @@ static int azx_suspend(struct device *dev)
 	chip = card->private_data;
 	bus = azx_bus(chip);
 	azx_shutdown_chip(chip);
-	if (bus->irq >= 0) {
-		free_irq(bus->irq, chip);
-		bus->irq = -1;
-		chip->card->sync_irq = -1;
-	}
-
-	if (chip->msi)
-		pci_disable_msi(chip->pci);
 
 	trace_azx_suspend(chip);
 	return 0;
@@ -1062,11 +1054,6 @@ static int __maybe_unused azx_resume(struct device *dev)
 		return 0;
 
 	chip = card->private_data;
-	if (chip->msi)
-		if (pci_enable_msi(chip->pci) < 0)
-			chip->msi = 0;
-	if (azx_acquire_irq(chip, 1) < 0)
-		return -EIO;
 
 	__azx_runtime_resume(chip);
 
-- 
2.47.0

