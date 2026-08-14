Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845B3E3170
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691788; cv=none; b=s9EmkGESOOdBmyxkdMB20eQJxEbttEwVyhF34VlYcICN5v3zrzTgsoS4DN4613ZHxoah44TJFy0ADDyBcYaoKREg2Lfn1NbfyKaLFxuQnaWjcclEvRSASZKbCG9Ugt/npXx0yjV/oCy3lCUNSEzeXzArTJAJzC6w7u69FDgdmHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691788; c=relaxed/simple;
	bh=yAW0M7SOM/2LFb7PATO5rURhJJsjTDrHh9Vb49FMgxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIHnPhEzS55pw5uzHOMKZujP5R4Da27l0Y+5K/wvFt4oI3dgGcJeUVPw0KgqZIMEaRgUTThgT3e1DvtLMkSm9PTcZBmuN4u4ic6cE0naON2X8oAbeZBNeAa3hKb17GGcZGKYQLcc48YklvRby8jLAExk/IDXXD2faVToAb0V0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8nLHvUQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8nLHvUQ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso773668e87.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 00:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691784; x=1787296584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ7S0W3qMPbOFc01tBZFVil/ei0St+yicsQl/q6vkhI=;
        b=N8nLHvUQep3M6k9Zy1NbxKqjpeSGd8qbmVgFK4E+Jr3V3BXlhG5UX/VYp11tJIOYrT
         PIB8zoSmigPW8WzsQEfhGwBYebIYKRrrXhUYUNWqpXQsP85MKa4kJShutn3tKBFqI7sk
         5wohf5VkHoZXuziI4rgX8EZFhyIB7Qy3bjOG0XbVAHg3Mg5OjoDx2OddunNnVRh/LxXF
         Wdw2VDS4MpRy8MAD/742pBa2eWZWjwIRXgkTy+lIPn1uyksMa+OR+EaIbnue4oNzV6Bn
         4+rGmBUvbd5l+A8ANYZztM93gyplNpMWwiL8TYu4Hwvhm0JLEwaWpiQED1wIFskYU5ZZ
         A8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691784; x=1787296584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ7S0W3qMPbOFc01tBZFVil/ei0St+yicsQl/q6vkhI=;
        b=hPzwa10KCxeu5v/uIWGSJ1L7LHkCCAbvB5H9F7i3+Lzti6ryuJ0B7bEF4MkSEg3CNF
         s/7Fij5jxW9Wkk00x6yNPUEAHfA4hEkB/mDf9MXwDqyI3MrsdBwjSmgm/uL2vCBaM5bk
         4AXFFUj/gJiSLkeYaNu/YrvyDWG3qeTWfPILYhjXQ+qAi3TEAf28OUs6uI/v0QKMz7Yj
         nBZ7jxcqnJKZfLXJoqKH38UCLcVUZKMG2+Ij7MYX+6T60F/BliWFMzgMH2XOA6zrQYRJ
         gnzG98Rm6lz4ljti/NnBHxQpYr8P/S5Gc7HKuKGVX6l5XMeVGtUqF3oVx+C+RNhH+7QC
         Sx5g==
X-Forwarded-Encrypted: i=1; AHgh+RoGYMATRLID1y+D/82v8pTw5Vrh1xHn8aYVHO9ru35fmeanv3jXk3nfFa5pKR20DmTf++9Q0+0InXEB3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzASMVkyBTXo7v9/T0furoT2r4mISbkOb62TMKbpAgN4YthNB1+
	o5meqTWgPP/BebY6EsJ48FMdRaC6Y/ZpwKAfjyd78J2DAWQxEawGJn6v
X-Gm-Gg: AR+sD13aNK50Q2aY143ClO72t7MUDxTKip3LItfdVBYz5+zw9Nqd7qpO105L7c3sdKY
	ybVMEZ4B71WCGQ8yI43I+tED27H5nGB3iE4cuLIV5Hp58jMmsXql6exJBwYDvVtbQBdeVTEVtqB
	1CXxe20IMiyfjgUJqUYPMjD0oNM5rdATLBdXwSyMgqtxDsc2FRMy4qqxnGbaBKjT5Q/HBpmt5qH
	syOrI2Yc4XIaxe4nypuA4/jd1ZDk2QmaCO44w9T48V+d0465xmVSzqFEzHPXXJKNyd0krCYA/hA
	/XxYODtqSL9Bcc8FwASrDwBzghVnXS7FSIQIspryvRGKsS0u4sahAJEN+C1M1XmBH8TmhtQqltt
	v6s9LINvEjRG8L2qESpRpmS5O9kkGqAhxtX97UAtdLouhrE+eNp7ULcIOQy0dR2ojjnsGlEhyx1
	rb1rLLta45uVxHd96pnNC0C4ex0qVJ/ijatV0WZnfSNfg/p+AKe1Psx5IMC0VBpbxxm6iqQHVoY
	y4hLE4XWHZ9QcUq4bp6vEY=
X-Received: by 2002:a05:6512:1381:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b4591173e8mr508576e87.17.1786691783802;
        Fri, 14 Aug 2026 00:16:23 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bac84fsm372309e87.37.2026.08.14.00.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:16:23 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: do not treat read-only Controls as
 writable
Date: Fri, 14 Aug 2026 09:45:00 +0300
Message-ID: <20260814094500.22349-1-andrey.golovko@gmail.com>
In-Reply-To: <4207280a-35d3-4902-ba8e-e8466f5c7f47@sirena.org.uk>
References: <4207280a-35d3-4902-ba8e-e8466f5c7f47@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Aug 13, 2026 at 08:53:10PM +0100, Mark Brown wrote:
> > +	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x14, 0):

> 0x14 is SDCA_CTL_XU_FDL_STATUS and AFAICT sdca_fdl_process() might write
> to it.  Not sure if that's reachable with this device or not...

You are right, and the entry is gone.  I took the Control for a status
the device owns; it is a handshake, and sdca_fdl_process() writes the
host response back into it with response | (status &
~SDCA_CTL_XU_FDLH_MASK).  _regmap_write() answers -EIO for a register
writeable_reg refuses, so the driver would have failed at the first
response.

Not reachable today, as far as I can see: the driver registers no SDCA
interrupts and never calls into sdca_fdl.c.  It downloads its firmware
itself, request_firmware_nowait() plus its own container format in
tas2783_fw_ready(), and the BIOS on the machines I have describes no
Smart Amp SDCA function at all, so nothing populates the interrupt that
would drive the state machine.  But the Function does implement the FDL
Controls - the driver's defaults list 0x10 and 0x12 through 0x16 - so a
driver that later gains the state machine would walk into it, and the
list is not worth that.

The Control is still not cached in 2/2, on its own grounds: the device
sets its bits on its own schedule and sdca_fdl_process() reads the
Control to see them, so an answer from the cache would hide the device
half of the handshake.  Writable and volatile.

v2 of the two patches is posted as a series, since the second depends on
the first:

  https://lore.kernel.org/linux-sound/20260814094000.22118-1-andrey.golovko@gmail.com/

Thanks for catching it.

Andrey
