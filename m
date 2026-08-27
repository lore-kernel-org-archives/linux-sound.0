Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B09279907
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815572; cv=none; b=hkjRLSDKEmIjESrVSoAkasd5tQ8kO3+i0SD/dllweCzf+iQhp6s7pcs8uKot5JRRWNB1N7sMh52H9igqWgTr+mw69GfKqfZB0sU+VyeDXKyQ5HbIjG3QT8yEWdpUCOEx6W0yYzAFL7HX9F9x5OglYmLJzqtdIrfhojNKIEojuzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815572; c=relaxed/simple;
	bh=R2dVOVWitlq41IciP+E53pKe80rKTqLsCfZdLehVWlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwDHuuvvfjnvkqnLLYxNeTZB2MXAzqGAbzqMYCTGhEHhTJKW1FSF1duXb9ZU+52SBuW98vMCF8xxrHuFkH23D15skGLLgvHkpcyZ48nUAC04EpK3NKawqPsA3VdgoSdqnAqLc4/03ejo4Qez2hYoZQtnFm0t3r+DRVPs2zW8sBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbUL8dye; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbUL8dye"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so11659165e9.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815569; x=1788420369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2dVOVWitlq41IciP+E53pKe80rKTqLsCfZdLehVWlw=;
        b=rbUL8dyeMPltQAD910TezoAj/VhEe0Fj2xvluwmA5VuccU3Pt5FJtn47/chfxWYAdt
         nqvmdHznarHdObJaEYJ8sR/l5NsXqvxo+Zo+UpkZP3M2+kNt8/6EW6a26igCl9uXLn0Y
         KfOGHMc6V+xpKkw0kKl2sH1ENYHw8OwZe2jOsgkseJarV6CGWnq7VFk8XgM99sndvAnb
         /NiPqM4KoBT7tZ5ioNIfarRMQlgHVh8ORDfYh/iF4FBaNF4U8VesRV4vc1ACAFplGof/
         pFqFBrNkqVu8eDuN6Vp1EAX/Nrpxo/lrOY3W93lco40awWsZeOXgPP4O61c8aeV7UFKF
         /AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815569; x=1788420369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2dVOVWitlq41IciP+E53pKe80rKTqLsCfZdLehVWlw=;
        b=jzUEtz1gcu2e6a+tm1rmAyaFzPe3vk79ZfX3Zfv5/C9KCZvQEgJND2Ym3bHsLkNfD2
         qhQXNRK4mzuVkYVdpn6vV3vmo77A3frz7fBcnQcwyWXCqz6U4KY9BRtrSNDthBNrr+SH
         l8Xjzbaq0fBHT27av0sj1hYJaYZfG6KtlmCvQuEx4P4uUUm3vC8F2I0GbEIDla3o6c0f
         Rlb4bEt+mfFbtyoBNRC/zwNd9g0DTv/qsDk27HQSnupPs29N9Lph1+9M2MTTxD7jaMUF
         0ncd8Af9CFFn4EjvqJPhCux2AP7Suo+g+6CiseUaQQ5Vx99wVy9aVRTCEID7eTQlHBU0
         Jf+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1VhCqHBBbOCgMY3B+D2IpnJOQMGYmkPvWee47WqeE3UzCLk1jGt43tHtSju/YuublkfCxvvl/gHHqGA==@vger.kernel.org
X-Gm-Message-State: AFuF++kFUfbEUV288kLQ+aGqTmbW1efxg5Or5+Y6rIZBN9+jrG+HA1RP
	u373AYtHKVSOVBf0vAEqG3cSBjrdRWBOK3/6yV5DGEmQmeqyapQDteLEydTBwXZd
X-Gm-Gg: AR+sD11DJY5/7fY0crGvFA4EmjjWfrk3WcaRjFICiM1JAbGxFIPJxpY+ydenNEE1nve
	1I+OeCL6cqqafnx2rHV9cU0tfvFIvcIiYo/dWy5K2Jmd3Eh9FYya4A+ARMcg5R2I/GF+HvwgZHA
	/3i7IZYuwKKSRgLD5jYRU6JjNpRM4H9WrQTAgyhu2h1+xebaoGwxC3/i8oJ0AyB2ATEDkVWWAFP
	OIQk0+DkFJUQWryeHsetV4d2VtVp1/EnhKuGQ1jWBlolr2QxTsGyumzwYeSk6NLaAzteMbMQtWw
	dEvXknk0OPgvEN3voqp3PV5yMu7sLau9iDjQbPy/PS71BMt+Acbul3uwTQqCJWJhhyicjP0+eb1
	LBc93vkUM3opj2ToDgIkcfA4Yd4J7d/jVbDa+sR7m6qdART0S5G0W3eFy74lXtEqwBJoOLmhwqq
	MSGyTYn7xf3zpObNFX+s/ykqJKMSbuSjqPJyou+6pBY7Wt/qCW+9+nwzQFLtclLpW5WO/hbiZxt
	G4nvovL5Yj/slxCWf3oBq9TO2X9gynh/CpvQnwIDJdg
X-Received: by 2002:a05:600c:4692:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-499dc8306f2mr126425545e9.14.1787815569279;
        Thu, 27 Aug 2026 00:26:09 -0700 (PDT)
Received: from 1Z10 ([78.211.107.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm6695911f8f.27.2026.08.27.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:26:08 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 09:26:07 +0200
Message-ID: <20260827072607.1402351-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
References: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Cezary,

Thank you for the review. I addressed your feedback and sent the revised
v4 series here:

https://lore.kernel.org/linux-sound/20260827072517.1401173-1-mauriziocasciano7@gmail.com/

The driver is now named generically for Cherry Trail RT5677 systems,
uses per-device card, DAI-link and component copies, allocates the jack
separately with the device lifetime, and unwinds MCLK on the PLL and
sysclk error paths. I also documented the ASRC clock selections and
combined the complete SST/SOF machine entry into the series.

The v4 sources passed sparse and a clean kernel package build. They were
also tested on the Yoga Book YB1-X91L; playback and capture passed, and
the GNOME Settings speaker and microphone tests passed physical
verification.

Thanks,
Maurizio
