Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A0A308F0A
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676008; cv=none; b=ru4mpZ2jp6m2kon2bVdnZKY1bOFvYARK/O2eKSNOvk2pezwAVvzq1XOAbE8BvF4W6uWd3EbB86CAf5Hraqu5xmszFa/9gS7YTjwScnWHOd9e1uKW7WaafAggaZgYkJTxIo4CyzVdaLAcsFrbHdbQvNvjMhFHqoOKzu1EIgts98Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676008; c=relaxed/simple;
	bh=W573z9z99ASNMsDUY/zntZ5UdeXjg2/Hmz39uc/20B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJGcpqVmd+yq+1hoMMaIPSam9NrW0uRnmpj/twHK5oJi89RGFS7P/OU11imfnlcOnOEMQAisBOOt5aDZX8t5yMWsfQvvLYfrvpYs8tyQbdz0f4W45dgmKDSGfmBlvqCCicEl0suo28zG6HYWtLPENlkOIND25+5gsvFQ3GKllyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGu9pvw2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGu9pvw2"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829a568f3ccso2609031b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773676006; x=1774280806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lgy4LATeabOHP6VpPY9Nde33dJrCyFzFwMD7PAvWrk=;
        b=UGu9pvw2w9JlHe62GWIKCK4gv9OXhFsn8QZOwqJkbAs+kT7epu/VYvsdRt21Ht22fP
         bwkcJHdYrJ2iKY+MNd8JIcYksgYCVUcGQ5fpYgh1FGviMwBdGeE8AsNECQohNEiawesy
         6oGGPZZrdLzd6mNMZnslYrfIZ+dBqTGGEiYisWFM+jzoNJ9KoGzzLLmxXFLJKJE6WSU3
         W+N/sl6SdCve8GOp4Xz6/qjZ28q9ZkoPub02kfvHiBsw2GjSPREQ7fc37tDYIhZHED9C
         vAUrKTbYAmMfRk94JQa9Gs+4MzYVZQP4lz0MZ7AMuU2tX0WqTakh6LL8iXlwGUp7rAxD
         2gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676006; x=1774280806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8lgy4LATeabOHP6VpPY9Nde33dJrCyFzFwMD7PAvWrk=;
        b=ZCbRjQT4UjkEv7+eYOIlmPeFDB4/fpd2p/KemtUi6mL5zjyrbuzinJiwRQFs4ozCc5
         LwmVf1zt9mELpcK1CY8pEFHV6xxiz7mA4m/MPg7MlK1fzqw05xQpz97+zvzUhiNwrby2
         U+NIFd0VJfxghpYf9/AC+ylO6G5vs3r0kLUkZx4Scyn42gYRl732I4xc8h+kKMjyhDv5
         LQT0QaaNKv/Q2P9Br9OIvnmVMxEk37jQd7A00FqCY3NoW5KAGQo1Vcd/SWgAOiMFj2PF
         kOlkq2saUBniet6OqS44F//9S4Hk+NiFhIOJCePVWUIxTb/lUq02T8bD2RcWgoEThlsB
         jSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+2heifLvTA7StNM0mQzeSbQw6s3cZgYyymJyUwDcovJpzxIomvV8UzbOC2mVicqxJd30WvioV0Zqo+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOzO67xT4AR/KXGAE6s1WM4+KzEvX3jfieb87B42Hb3laoDFuF
	BQgvngWsQ5A72APMfvdwAQRKlCP/hc7tt7jJey5V2+7fqwP7g3/gjJ4o
X-Gm-Gg: ATEYQzwTrDrvI0PPtiuj6KsSUJyJpRSuYsyahkj/+0lxJ4FI6F2XzRq6CyJX4QIIxQM
	fzWnUyTZ9rx2Jls3vTJsqPaDoD+CF8vmNrt1mehfjENtjGiAsWHX1t/PcGQpkQLHbAVhkYPb9sc
	nzkA7Gi7OPmBC3IbWr/kqQhV4wEcs5P6mRPqsPUe3yg+/AnLT+OjW+RoE5DmtFvTVo5F0nnZoYe
	9GC6OhXrNSnn/2tf5vf5GnoUkgre7igCa54ZmdEbTUf6SIRcoL4YYG5GDQiZZPD3fsANmrK9WU5
	YMjOw4oSGlGI//HneChU6oOeXt0FPFRCsJeWLiqD/j4smkBtKy2KXMuMygA+AkVqk24h7NlA/Z+
	/dAgosRXyDYJrlqu5AupvdDiVN0Q+dIfVQc6p0oC+Lv7zb1kmTDUC/TvEQTZ5xHBWxfgejZACdG
	QDv0A0W0rFSQw3Dl0cy06H
X-Received: by 2002:aa7:88c2:0:b0:81e:c67a:1a79 with SMTP id d2e1a72fcca58-82a198661cemr11900992b3a.25.1773676006171;
        Mon, 16 Mar 2026 08:46:46 -0700 (PDT)
Received: from archlinux ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07366974sm14125334b3a.48.2026.03.16.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:46:45 -0700 (PDT)
From: Hasun Park <hasunpark@gmail.com>
To: vijendar.mukunda@amd.com
Cc: Richard.Gong@amd.com,
	Sunil-kumar.Dommati@amd.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	venkataprasad.potturu@amd.com,
	Hasun Park <hasunpark@gmail.com>
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine
Date: Tue, 17 Mar 2026 00:46:06 +0900
Message-ID: <20260316154606.24110-1-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
References: <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On 11/03/26 23:02, Mukunda,Vijendar wrote:
>> On 11/03/26 22:51, Mark Brown wrote:
>>> On Mon, Mar 09, 2026 at 11:07:30AM +0530, Mukunda,Vijendar wrote:
>>>> On 08/03/26 20:46, hasunpark@gmail.com wrote:
>>>>> From: Hasun Park <hasunpark@gmail.com>
>>>>> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
>>>>> machine driver.
>>>>> Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
>>>>> platform-specific jack/DMIC quirk path is selected.
>>>> As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
>>>> If you are using RT721 (UAJ + DMIC combination) below quirk is not required.
>>> Presumably nothing stops the system integrator wiring a DMIC directly to
>>> the SoC even if the CODEC can also use it?  It doesn't seem an obviously
>>> silly configuration.
>> On this platform Soundwire Codec RT721 already comes up with DMIC
>> endpoint. As per our understanding current soundwire topology points to
>> use RT721 + TI codecs. ACP DMIC is not being used.
>> If we want to use ACP PDM DMIC where DMIC's are connected to SOC and 
>> routed to ACP PDM controller instead of Soundwire Codec (Which supports
>> DMIC path), then ACP_PDM_DMIC quirk should be enabled.
>
>We have cross-checked hw configuration. This platform uses DMIC connected
>to Soundwire codec(ALC721). This patch should be dropped.

Thanks for double-checking the hw configs.

I'm not sure to drop this patch because when i test it dmic only works when i add quirk and enable BE link to ACP.

But one thing i have to update is both jack and dmic both works fine with ASOC_SDW_ACP_DMIC not RT711_JD1|ASOC_SDW_ACP_DMIC.
