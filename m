Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D628850C
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760504513; cv=none; b=JJvDfQ3ZdyU+0vX89ApaFPnmO0yeCC1MCwd2ZglE511pgZv8ZOwZzVKtErVXam22K3u+ruZQoNHIdBvTwDQjQH2bLUx1O0xiYPX2U1U6rTCp0XhLCkM1WvJfgxhY+p5s0/tr4vPZxx+PFy43XRTz596ONaxnVcoe6SCzXGpttck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760504513; c=relaxed/simple;
	bh=lyvdSWoiGKpaGPp3oOT892/RaHh9ujQ0BGQiS6Nf1bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsSU9ASNStqklnlz6JwzoOozyGtstimcktq+pC3v79p6Tf2XBaRy0oJ0efsm0Aiz3QtdZNwBPWTrEXxNJByubPa63ud+RxUYmz6USz2vhf4sQarTsuUl/Oi4UkqiHRarPG/HZVNphsw8fe7Hv8eMTPxseQkTRi3SQXR+kP2OQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzxdYBsr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzxdYBsr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e52279279so43374505e9.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 22:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760504510; x=1761109310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEp4eeoKWn3GVgLvyD/HVnCI9sTnqOsvCePziXrO91A=;
        b=dzxdYBsr6gqSAwaCWSEc5NF15gEE1hE0EP9JFC6IgcjhTRpZJLK+u47UKiTY2sgCkD
         cRrV4bqxwWUM9gUnJPx7Rd6FTsBj0WSFE4aFTSIfZFcOiCHB8UioS3pK+23ZLMPj76A1
         tQMgO8hM5Hzo8rYa9cmG/822H2h5rLMMwjVUl1kHBagucG3Gfr/zL2SqoIvYOmxD4BW9
         SgAenOncFcSZpmlxuaNmg17bl1OKEkgsaCZ6xjUIeGOkHxwV1nYoDmhd7ll5FJeFhNjL
         Ixgbk7xFt3K2/lYzRnq8YbWWQq1lOzHTWVKkGg6h/cokIcph0exNb85xRhK2IPWgczJs
         7uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760504510; x=1761109310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEp4eeoKWn3GVgLvyD/HVnCI9sTnqOsvCePziXrO91A=;
        b=cZ9hDYl5AqYejWmsJC5SQLCnfhqYDwzBIEgQRmYDXxtzuFJNqjNsmleLLU6VVMwL/j
         PFhKynWoAykrYv43lu8Q9dzkOp6LNGzRf+Jj9kv+AW/OURFzk48CdjOQn2AmcDv2C72K
         OfpEEzSsxcbfF1XKojUp1hHBWIsB44cYkBP/rjfRuORqO4ojuVg9qQtw8iWfkztbo/IB
         BM89LqrSShfKzUlWRr/iDTvJ2bmLHb+i2iZ0Y5e3PPS3py3gFWqNFF24CVX/NhauKpkw
         ON/SncAWA0VXnuyZieoXiOk2BucoDRbNzNsGUSPtJdbtBiOWfQZavh3314L4pBVwa6Um
         3BUA==
X-Forwarded-Encrypted: i=1; AJvYcCUKDifBG6xJuq7UJsMBlrGQmK20oNSka8MCRweUfpxXPuhafUn9UpiTMDGmTDSgU0Dy5XbHRruXyMK3TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqKLSeJkqwJJslTFhZ+z53xGUQ/REkjh47J3BhsyAmAiGTYDJ
	9cqrB74GPvQt5kbgQUiK72cUke+84C6F3uBuUkh2qpoPhK7hFu4aF/kAOkNa8PkB
X-Gm-Gg: ASbGncvcS739lVW49HZtsCPDIw0tEX1y5fps/+enQT8vNrsQXaDIrZ3JAj+LHvLf8ID
	7+A/N0kYqYVhBw/AzlF1nMHSfKnni1uN8kWeTNcyNkhnlUpZNwd65boBxyiOkU2fNY381ZEhvjW
	aUXJmMAn6BlzNbx1l63b0inRCmp6JZDpInh9tZDlUzy7oVC40dj/+dwb+oEb5zXhCalsTaiDi4j
	0FaW0U7RMRrF5Ey2GGxF1THE/P49eOXhth3QwJqkX5W24b1BWj09+eXSqlTfXErPnuScd/17cYs
	ttSS4mnFOaYxVlJCa7KJnVUviEXIeWidxORfZQ+fS1C6KmxnjgzwfY3pYY1mckLkv8so5zg/kUx
	DUpl4IhRGAq+pFFNjWFkCe8JWuhbAs0E93tyaeVFcYEY=
X-Google-Smtp-Source: AGHT+IGbf0Ob87ZowTliThcINxazpXz9BmMRxdDHEBAcrtmy2gwZxe7jNR3wRz4zV2fmJvReZS6B2g==
X-Received: by 2002:a05:600c:3f1b:b0:46e:1a14:a81b with SMTP id 5b1f17b1804b1-46fa9b17e09mr180188875e9.36.1760504509427;
        Tue, 14 Oct 2025 22:01:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426f6773726sm1241599f8f.49.2025.10.14.22.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 22:01:48 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 15 Oct 2025 08:01:42 +0300
Message-ID: <20251015050144.3922-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <875xci81dt.wl-tiwai@suse.de>
References: <875xci81dt.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 14, 2025 at 9:04 AM Takashi Iwai <tiwai@suse.de> wrote:
> The oft-seen "regression" reports for 6.17 were rather the incorrect

Okay, I did another test. I tested pre-culprit kernel
( 146355ee880e6d15ba12e2baf5be70e5efe07796 )
and culprit kernel
( 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f ).

Here is config used for pre-culprit kernel:
https://zerobin.net/?41f6e4dd438b4671#cZc42NliA0eUaXz03w17ZOJcIVNW8FCMZ9f8lQhdmkM=
And here is config used for culprit kernel:
https://zerobin.net/?c1ba4914bf3f0852#DBGkXE/9LgBc1Q+T4tWrePa0EGsJ8oBoaviaMvE3VRI=

As you can see, they are same, they differ in order only. Here is diff:

$ diff -u /boot/config-6.16.0-rc4-preculp /boot/config-6.16.0-rc4-culp
--- /boot/config-6.16.0-rc4-preculp     2025-10-15 07:45:14.096152974 +0300
+++ /boot/config-6.16.0-rc4-culp        2025-10-15 07:48:42.585031860 +0300
@@ -4794,8 +4794,6 @@
 # HD-Audio
 #
 CONFIG_SND_HDA_GENERIC_LEDS=y
-CONFIG_SND_HDA_INTEL=m
-# CONFIG_SND_HDA_ACPI is not set
 CONFIG_SND_HDA_SCODEC_COMPONENT=m
 # CONFIG_SND_HDA_SCODEC_CS35L41_I2C is not set
 # CONFIG_SND_HDA_SCODEC_CS35L41_SPI is not set
@@ -4832,6 +4830,8 @@
 CONFIG_SND_HDA_POWER_SAVE_DEFAULT=10
 # CONFIG_SND_HDA_CTL_DEV_ID is not set
 CONFIG_SND_HDA_PREALLOC_SIZE=2048
+CONFIG_SND_HDA_INTEL=m
+# CONFIG_SND_HDA_ACPI is not set
 CONFIG_SND_HDA_CORE=m
 CONFIG_SND_HDA_DSP_LOADER=y
 CONFIG_SND_HDA_COMPONENT=y

And yet audio works in preculprit and doesn't work in culprit.
So it seems like an actual bug.


-- 
Askar Safin
