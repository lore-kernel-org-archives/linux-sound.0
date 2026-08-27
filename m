Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727546AA94
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854464; cv=none; b=djslnxw3VlfOAkmlqfv2BgkI64OtE7w5JmX+R9KAxPeX8NVPjCHSIDukQckQZLybU+UUnX/KivZObJW/ES8Ryli40F+CTfR2XXGDfb1ciWiW1xyR4m0704ngqZ3yhSVMqL5eTaKjmxdNV8lIDElDRDBHy3jFYaO2ZMKtIrRqWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854464; c=relaxed/simple;
	bh=W8X308jt+bvXYniV4DB7dpJR/uUmKnkQU1ppJ0MVFu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6UfzT7hoL3OxhjssSw2aDXdiz+2bGzH9CnYnVupJ5RPzbAWEkJfZAzql67yPJt+1zrd8/UZFu+NSWcLKO95wCcgh7xAT6EfpXHYXrqWs39HBbqkLT5fXlwX8nFr44gB/VSsOqT0+JAODS6AuTdBkjIR2kGH5RH+xcp+i5oWo24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ramWr+xO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ramWr+xO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e067e908so86414f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 11:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854461; x=1788459261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8X308jt+bvXYniV4DB7dpJR/uUmKnkQU1ppJ0MVFu0=;
        b=ramWr+xOYrjQE/9kj6ldXyQ9Cgu+Vm+7EDCbMij0HuYBpzFp3/rtyFwLbu6cQJTEGu
         Cdk4nJJ3J+JDaX5+b7VFTWnoLkXMTkmSquR69c5W22nnUM9q45j3JYRo2VuZ8Vl5JzCU
         wRnffMtceqb3ahgL11GSPSjH5zVd6CYlh6rc0ToeAYGCOmxkDLDhDL1FTka3PgYncXr7
         lQAUXwqNC2nLjbVRhdsJysPLuc6VIddqXKY5/qHf/eapP5Pzf65660fWbcnxmS0YDZM4
         NiOdPWQ2IYqA9eAnF1jOom4BGowpOSz71ToIOPqBNqhX/KFo7HeZsmr/XcV4ZdjvIOEE
         zZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854461; x=1788459261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8X308jt+bvXYniV4DB7dpJR/uUmKnkQU1ppJ0MVFu0=;
        b=UJ4mNqpE6JiN1TbeMKj79ZI2lU2XhNhWOxtx0GNrlTUVGpBanYh0mdAZKWsBli5F+D
         Svd7cbTeRC9SZq6vN+kIA0EQBOcy9DmLnJUGgBUgWwWcQEspWqRN31EjRkjMi1giaBzK
         vgyyEVKCK5qEltl7TFu2ngTOV0EaefRvjOFBh03SMt028SxQr4jGkRoXFD69d56Xn3XU
         LE8n2q/WcO6MoZ+Bds+pAmwHqPs/6mjiaetvp8rr2GKtujrq5eqejhUz/MS9UyXtpEeu
         qVUmpKtgbnOGNJ6m7R43ryDe8aTa36ZvQx08DPqjwIjeWYoodLhx65P96JyKA+0xQIGB
         Nr2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpFqyQ63ghQy2XZMu6oyQ7roMsDOF1hx+cP56hz7HqW/jquqh1hgRSzE/m7Y9sbpyjcsAO+QiAaIiTPmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n/5YsD3tyFKfct5ei7dolQAbCMD8Tmn2LM+2HTb5R95n1/DEiE
	exEqeAEziFjO0PHnzxvyO0v/KGpbD3vEyfCPF9wCstJ2ETcOhw3Ael1u
X-Gm-Gg: AR+sD103CkPhtV4Y089oQBHeDMVZeJJPAlXSzS0EsPxtmx0rNOhooHXRzft/NF0HLPw
	A8OVBgCiS166GhPoyDSyIE/P8uixMSKwI5m5WHPS7O7zUqi2VA/F3GFKgY43HbNWjUoPCswK1hZ
	sh5RTZ1jjx0RrbHjOxVWzP6XLddj3sZGmiMA9IUFIFGDjyqcSkJB2QtmJLzJUth9sJYYCG867BO
	Ijpnn6zPQXKGF22V8Pigf9LJoE2Ag/oubt2uSfshYFxFPQzwtewzu63JBGOb8Wim1xSiUQYvIUx
	uyZdMRjE9C10sJGzh2mhy2CD+VgrqgRJwCNGb+J+DxcZTt953Z5+S9um9HZZXpDpFstmicpJU6I
	PWQGiXGXeKA3n9eWQk7HEuHXebtZCxDAHlP2VgMOu8laFyyebC09rL6c2zSdSvJHnN59aAXOjub
	HYqcazpnJ5AcjFsHxmPJ6Vl+sFLO1Moog19P6AVkLw/zyHm5FyZa85Lt0CBZy9npqXqo6skBLfI
	L7WGMcggFBbpA1irrrwTeAxDodL7xLX0Pe9K9TAlXoeQfnYi/iHO0A=
X-Received: by 2002:a05:6000:4a0f:b0:482:e451:680c with SMTP id ffacd0b85a97d-482f79a7553mr1165103f8f.8.1787854461242;
        Thu, 27 Aug 2026 11:14:21 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm9643283f8f.33.2026.08.27.11.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:14:20 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 20:14:17 +0200
Message-ID: <20260827181417.2424376-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKWEGV667AyGDpz-mJn3phTOjKZeVTC+of0Zx_OUZr4H3+_jxA@mail.gmail.com>
References: <CAKWEGV667AyGDpz-mJn3phTOjKZeVTC+of0Zx_OUZr4H3+_jxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right, and I am sorry for dropping your ownership trailers in v4.

Both v5 patches now retain your Co-developed-by immediately followed by your
Signed-off-by, in addition to your copyright and the links to your original
implementation and v3 posting. You are also CC'd on the complete v5 series.

Thank you for continuing to help with this work.

Maurizio
