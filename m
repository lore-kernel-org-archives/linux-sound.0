Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03C536C246
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740610; cv=none; b=uA2xlT3feaEcN1NsBIiCP0IBJmHfjuZ7BDc0oPWvOhSUGPBYpAHaOGRDBeoYGC9HhwSn+b4XzNbaZdGxOfOwL0ydVgqFwYl2hYdAlFcefrST2SdcDVo5mBau3DQsDzz+RAF98F/SdxTBceAvukLNItlX+c+uaQv5l9GnyZ38UAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740610; c=relaxed/simple;
	bh=GHebTe5G7CtxFjuUCS9MwRFp7u787YUWK2Q8YSzn0h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1pLc9iSy751Unak+M9CdNSA7mqOr1CQEz5mvdNzXzoB62mgyFN5fnaKZGFoZf0ArxoDBTdv21tmCEhKssqpPQDGX2P4ZApVdFVZ/obc3t0eIV+exF4JjtMyUQ0ejM1vjZVfQ02Q8kJL5YBnqBLrQq5GDydqLtUQfSmyzDUMnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGtTCmkK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGtTCmkK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d83bf1077so490053766b.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761740607; x=1762345407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDFNzSZSOfNylxri3WZM3/PhA4N5a3TRvkg+xuhc0cY=;
        b=EGtTCmkK+O5AbJ0OrfL97xbKPG1YZbEl6fWoRYbbt6DLisXk/zQgbqQRVtyRSoVPTP
         avQvhrrLi1XXOH60dcZx7EjWNQTMoVx2Z627es3gKfVRQ63ioLXZT5jnlABGI5KeJnX7
         AzTeUUt6+3fq7esNdSkpYhC+Au8jN5NN9se8mmK3niyE3kOZW2BrdOwcW/DqfsXGYiS3
         kApjy6Tjydkc4lD6Ungxo2kUJWaoQvEVsAp5Bz/hhbuWyzxygURwUfVNI0yA5hVQmyR3
         kU/Xj4/4pdEk5SveSGhPVsZfnAvu+bVIuuYIKhFGpmbzc0LvNVmnwZe/ABZhBgodcrDm
         hWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740607; x=1762345407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDFNzSZSOfNylxri3WZM3/PhA4N5a3TRvkg+xuhc0cY=;
        b=E4KY7vlqAEkpIQT30dyRuJIo8+7ZK9f9T8BV6UzaJ+ewW2ofPwNli+eCGJmL5nPL7K
         DooxyWWQNP3OIa+zLu7XVTKI2akfTfamt6Gn93IAQ/z7BcxtNCzkhTHbg8LWPGrHuotc
         sBZy5avRSt2k8W9uJ4TDQVG9y0ULOTauZApqnq2CN9sr9pogTIY0XKitTksLMy28f9W1
         PjP7o/HfGK+rU7QehdFOU2cG+8VVcjKtSvAfQNX0+QXzJA80e11GibnrOr3qoTSNfIbp
         2Dazr/SpmH9+pBZc04eQ0hW6EM+WtQZJNbDQBQKBevAHNNpUqsPahWhul7Pt7q8TWsN2
         uMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtL8rFBM6TyO+wKonZrSGshCKWaFqP/nlkn4Y6tMoCbd2WBKVYq0FekgRH/mJTX3l5erpaYd4Ts+Tu3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEebVPANRO+9WzSCs04d1wkYvYJkEjWYiRd6ieBB6NVW/fPmzp
	CPctvz/+rHrmSrQ1S6TrJnVO09juyQf1/sSUNZZaii9KYcx2iCzOZsWY
X-Gm-Gg: ASbGnctVRC7kkeEFI6SKFZoKNQqq+Ri1KhXRz0HeR/VfTmcVSBiY0HNkbiqS0UXrzrb
	gUyLecjiFd7JggZsa0xACA0dT5PL8XhW5zuIzUOte5ilRP11uonQfI52LCjiWYDtIc+7P0EWREZ
	ftiKW+xCnHcOoF1cfY3pPobgjvwK35FU14HQsHzH/HQUE1ck6xRBR0aGsRVdvFLPD1cbCf9gsVn
	4kxYP53Vp7PTTXpKHhJ3JfM4VBJ07T8TmzMSmS3qZFdUL7ZwSdzCURX59ILq0DI9fq3Srwu2OGb
	b3Wne1mXom7CuvyKL19rQv2tEkFKbD3sxJl7YwSz8e/QKxpTbCujhH1M59Q3YMvM2LemY7CxwEM
	y74l1EG+EJ6u5LJSK/Z0A29fzyX5A9WMNo/LX8/H9WzMS3V+ms+k6kb9gcn/Sj2yRwTUoIQjj9P
	7d
X-Google-Smtp-Source: AGHT+IFZ92S7NaPGWXm45s0LWGTqMNYg+U+gNAWRIpECOO59GP6wM/kQVqXjgCnLzIvK7qpJfcLAlA==
X-Received: by 2002:a17:907:728f:b0:b3f:294c:2467 with SMTP id a640c23a62f3a-b703d2cdea2mr273434766b.10.1761740606866;
        Wed, 29 Oct 2025 05:23:26 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b704d7a9867sm39889766b.46.2025.10.29.05.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:23:26 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	dxu@dxuuu.xyz,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-kbuild@vger.kernel.org,
	linux-sound@vger.kernel.org,
	masahiroy@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com,
	sam@gentoo.org,
	thomas.weissschuh@linutronix.de
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 29 Oct 2025 15:23:21 +0300
Message-ID: <20251029122321.2872-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <878qgvgrk0.wl-tiwai@suse.de>
References: <878qgvgrk0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I just noticed (when debugging unrelated bug) another thing: whether audio
works depends on what initramfs
generator I use. "initramfs-tools" vs hand-written one. So it seems that
set of modules loaded by initramfs affects whether audio works.

-- 
Askar Safin
