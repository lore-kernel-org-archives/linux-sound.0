Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00633991
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 07:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737530296; cv=none; b=ht/0yl67hQlFcOSQqqu3IRszLMmSy0WOXPQncojDOWpOZVwkwwk1Pc/uO4jjMkGSR7UL2wXPDLV8rH8wGeKcMFAT1EwbYRDmyMNHtAJQdRlXGoizOWSBoOnLOz7VxlOS7AkyyriebdtZO4vdHcOIgM7CiHwXxGR4y8PoAqaG6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737530296; c=relaxed/simple;
	bh=qQKXLvSXGkcBqIw76AWV5u/YiDQuTIE3E78Mj6qanVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGx+To8Bskz6jpdlkQAhqU9s+70YVsjtLFF6I4ZrSjONpw7dvcSnhVtf5DGw3zwUIYLk/pd6OdpI6zFfcyvLpwhsJWBQP2rDhY7Kg1fvVjyLpxjXf6aYDC23c11IvnOUnQQjOcVsq7w2Y28ikm0OZw+X54qoeMVFUky0+Ceo/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEUJQr3J; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEUJQr3J"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862f32a33eso3001021f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 23:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737530292; x=1738135092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ufkapajn0Vwdq0M+/CEG3TdxQlY94mxEu4iOhuuQms=;
        b=FEUJQr3JABvXAkBmGiNaYqvFVuvauu/+Jd5M6mQF6ymWJfrcPlkV96WYhbP27iqVIn
         6W0bXgOHc8kB+bYFFk9S2apY/QWWS/79aHnjWU+BDzbgv/PHWVNe4Xlmb8iL3spFCWKT
         AtFglpLdYbWqQzyd/xv8Abr2BBSvujhrDClF1AZktJMC+dfd2PRgPGKhjoELrQRkT3Pw
         62TWJsLO1GaSsJIIQIDkXcgPaw2PSxOTzLHZmZknvRceRWvrW9Ia7NkEuVLhLTErOemW
         i/icZJKyhiiV5jobFX4RcXbIyJF7vfv/pLQ5AvIWDGJ6uF1yNtyqVbhTqpTzQ6FjzSh1
         rfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737530292; x=1738135092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ufkapajn0Vwdq0M+/CEG3TdxQlY94mxEu4iOhuuQms=;
        b=IsUkBUXmazxdSQex6iKyDcOEHWWNCTUkjXlYDowOEgkIN8ax28E1SJ5nC1IgxhiYB+
         UZkkUkCQtcx2QF7RJDp8G6yoZhHOrpW8iLYBCvOPFx8RehijsfwEHUB2msUoBRteFUtY
         r5PkXrETUuyAsWwIWyxbM3lszpBy8yzlnZN0TiLpdnFLfWJp31+WIXp0lNmY+5z0Xi9y
         XrsJR53P41fDdRb8OTswKYpIlfWWk1z720UvxLVnz1e1LaPsLRO2HA6e9+drkt+RAKCe
         KxxipcRWEMa3Y1QYvfDP3zgy9Jd/VMh9i34KqtdYC1a1Qto1DlbONhdcGnCY9ZEYCcKw
         736A==
X-Forwarded-Encrypted: i=1; AJvYcCWUnSzbPLQIwc1Hn5MoHcFgfcW5A+4D8v/o1lHiOCtYjMV75TF32aMptq3XTx1aIGh8f3qPb555jyovNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9K/pRxoofv68DAZpTxuAus2UnbLu6fsRlNcnZUVdCJG/PzJD
	XHQo4isSBhpgT3lSo5zPT8BdDiNWW/nG5zRNAn5AYqBVk4Hw6lXL6uPr6cH0h8E=
X-Gm-Gg: ASbGncuhJ1udEfREuihOIcWJIi8rHRHomaRCtSIKnYrtv129bPR4ip+yUifdSpxyiEf
	mKnLYjjp2IRvyA0Zze41+oiAMsit7COHbqab0D1QHe+JfQ/EggpeziDdG2lACLbQxNqxDhUfUm2
	8bw+adnf9PuI0oz61G2xe98+EFiht9OBfvXXSN/A8U878FeI4hDCZMexAuC7MbzGKHGE36cdS8e
	LPmFhFGqfQiCsvtCZpd5PBXQvGvMTckHEf+Ip02jsTly4xlLZb24XW9xojN7tDAGrD1PaDaSZw=
X-Google-Smtp-Source: AGHT+IEkzOKBuQ82tZh59Ridts9NNGBwp7FmUershCrti9nU99i+0rDa51NaSprYbijp1Rz/rjPL9Q==
X-Received: by 2002:a5d:64ec:0:b0:38a:88ac:ed15 with SMTP id ffacd0b85a97d-38bf564d6aemr15746966f8f.4.1737530292595;
        Tue, 21 Jan 2025 23:18:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32755cesm15359411f8f.78.2025.01.21.23.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:18:12 -0800 (PST)
Date: Wed, 22 Jan 2025 10:18:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda: tas2781-spi: Delete some dead code
Message-ID: <d57ded9e-9969-4922-8347-67b758499483@stanley.mountain>
References: <cover.1737530177.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737530177.git.dan.carpenter@linaro.org>

The scnprintf() function never returns negatives.  And it won't return
zero here either, plus if it did we'd need to fix the error code.
Delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/tas2781_hda_spi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 5be71b538ce0..02794fd6003d 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -274,13 +274,9 @@ static int tascodec_spi_init(struct tasdevice_priv *tas_priv,
 	 */
 	guard(mutex)(&tas_priv->codec_lock);
 
-	ret = scnprintf(tas_priv->rca_binaryname,
+	scnprintf(tas_priv->rca_binaryname,
 		sizeof(tas_priv->rca_binaryname), "%sRCA%d.bin",
 		tas_priv->dev_name, tas_priv->index);
-	if (ret <= 0) {
-		dev_err(tas_priv->dev, "rca name err:0x%08x\n", ret);
-		return ret;
-	}
 	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
 	tas_priv->codec = codec;
 	ret = request_firmware_nowait(module, FW_ACTION_UEVENT,
-- 
2.45.2

