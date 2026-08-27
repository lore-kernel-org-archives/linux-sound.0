Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F636F915
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854436; cv=none; b=MzlSYrVTIYeCA/6rs6OhbsVv0LvwazXEc7kCINtQTmRLp3Qqv3pej+2mjmcCGv1148I6BMLw/l8l6EQM+FA9uwsEZrmHB8/Njbgnygzgu+uVvFdVPy63WcLIl+0sx6f/6Vm1nOTrO0o8JwHIuwkRb6+V87vQvlLKgEM8M48dSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854436; c=relaxed/simple;
	bh=9fjGgqTfcH5UmkgQ23yWI0k2iV507NzTO1K8KV7kOgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqVUtvEYL2Hbkv3RoIHFFnqFFvgyipTb1mZT2FQuWLqx9OaF0vazh3kHBK+ued5QqKvkE1GeAJ63YSI5f4xxy1zHIbPltUJEPG9B0A+zoeAAA8GuMkVwB8XQvU7UIePALJUY7g1CIXUevPRqTo9Y+CBQq8FRGVH1TUs05hdzhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYItOoaY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYItOoaY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8687630fso313215e9.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854433; x=1788459233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fjGgqTfcH5UmkgQ23yWI0k2iV507NzTO1K8KV7kOgI=;
        b=JYItOoaYCekh4/UsmK6IzcmdLj6IcR9bOzTycLGcTfXavqD9+f2i4RMnw/ZPYzaV4W
         V7jTjeEEBd92LvqElDYeiMZ23H1EbpVdmaE4015YXS6SDSrV/jkcUGpF6shaD3DJa0dr
         7n0SRoj86dzflsytQ58LbQqCpoCgW+Qf8qCLi6gZcNr4ksNW9993648TMfZYdHvGUf0O
         4ZQHB3PZjByRWBzKLWNM1ExC8tq7iZNhuC8gZSQe0x41xYj5cfghcGYW3qtJHw+HtZXW
         M0LtTRnhlTJ2w2DPLWsdgeBMsL78/optbApLus1muzBrJBz0tvohY6ivD/9KYVNbVtxz
         5HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854433; x=1788459233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fjGgqTfcH5UmkgQ23yWI0k2iV507NzTO1K8KV7kOgI=;
        b=oeUImXLpuCAvao4Ocd1CXC5HV07oe/bDLbnB1mMwqm+gxzqOz0HYYurGNBHL/ysauw
         Ourbkfa395zIPtkj+EzUkm8uvtPJOR0wf45GEaSlDu2r2MJNboAGcW2JlZJlSnxN5UEN
         zZbjGOyruqUR9bZD4tciShkJ40aAqAOyvWOByiFg110nW7sYb6daX5OsrV2Ni7kXPe1U
         xvcrzolOPQ8tp5B3/ByqYp3vMQODMsLQOYowBaXf0qo+BRYDT9DSgzy4nakWdi8evdKP
         gT2XPufFKqeJVSTjzX+/Niu7bwtKQzimEmySZApSkQblWkuQmjT8GzsPHKrh3OGQWdeA
         rYbA==
X-Forwarded-Encrypted: i=1; AHgh+RpM574MC3FI2B6YCjEHQh3fkJUcsXznHj3ajBlfaMhM3dVjMaN0/JSBQMB1aYYiIIWNvfZ/eLwFYgHofw==@vger.kernel.org
X-Gm-Message-State: AFuF++mStUiNE0KyVCxAskfDougkNDJ+RL/cIOPfhG81J9RSnqafiG8B
	C/DTlKwnAqruIQ+2V6WeMXSy3q0A/9pn6X4/zgsT59cHR7ukPpS1kcQN
X-Gm-Gg: AR+sD12HWRoQLQF2mdxWjgEPBsq3QIjw7oxYJBO2opq/QrYok5LY4fzqdoouusQ5Udp
	q1xZnm2FUXr2ci/XdVV+nyhCTqpkIr+5m1BqDLlJTBh7H1i2IItWEGEiwp+vJzW+qPferiHloKF
	2SqeV307/I2aY916vNkNT+S69h0M3KUQEB52Idiiav4w3T/1HXNEx6OQavcOHidDGQB9u7y97nH
	sETX9ugYQclGYRJGv3g7q6b9VyvxEWF/s1Oi97Fozdv8QOdt2C/1YI0jjdY9QC1n1z9PjFG2/to
	k0LVM9PVJZzRR8JtWVYQtcp7YUEqJ5u5BWc3l5ShNf/FFhb6vHzhkxZM04z8wt6ifyDg2Mj6Gg5
	CazUOeUDzjriKRGuCfZ0+1InMkn6XcCFWlgMbCESa7Gv0qujKMPxN5H1JOHb40JDwbTby5k7F5W
	r92xo71yOc25E0jTleWbQs91tn5wkubhdgqE0Z/7hkUF+8xvi1SrHHVOMQ3AUuXkhAadM1F3yOC
	eZBQNhUq7iEzNRM+6oZ+yr9WzeuRfm95+2S3SqH4maEVSNrXuVBgF4=
X-Received: by 2002:a05:600c:6748:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49b91c57449mr12695565e9.11.1787854433172;
        Thu, 27 Aug 2026 11:13:53 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm63879005e9.14.2026.08.27.11.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:13:52 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 20:13:49 +0200
Message-ID: <20260827181349.2423728-1-mauriziocasciano7@gmail.com>
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

You are right. Posting this as a new RFC, omitting Yauhen from CC, and not
making the relationship to his v3 explicit were mistakes.

I replaced the RFC with a versioned series based on Yauhen's work, restored
his copyright and provenance, and completed playback and capture validation
on the YB1-X91L. The follow-up v5 also restores Yauhen's Co-developed-by and
Signed-off-by trailers on both patches and addresses Mark's v4 review.

Thank you for pointing this out.

Maurizio
