Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DF1D5178
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788825; cv=none; b=ddE65SPRJCSIYoNNHGEKhWZTIDDEF7fxinER/WO994mjLwrF/m6E7KHHB2EYcEYyLCjzyYk9LtVGGaxLyNPV8k9zilHVFZocET8YwmNDO8M+35voy7us0mSfEEbJV/FOCP7KbyOlXHEwu6bQAF66OPqm+CfmW0PYkaWOl8uIkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788825; c=relaxed/simple;
	bh=oRA8P7OgKR+RKojresHirdztRDmntuo2xCLkSm5UiCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNDOTJID0z/AGll4hFqMN43xU+5xb4sDaiRqiQD0/C0RhnLhwlFxxYqVPadPR2kFn5F0K4HsmLQBB7S3Y+1B5E4IPum/RTUSQko389nePwQmOLZyhAmTY1xw0aobWEIoHxozpgGBNWCbvFYBjvgKdawXNA0/F6azgFIAAzs08gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELecssDl; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELecssDl"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c633984fbeeso1252428a12.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788824; x=1770393624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5u5KElOLVcaciKHLnGLaPQhBFyMx8jAhlLbcmr1sUA=;
        b=ELecssDlVNlAG8F3iN1qvjiyNPyMX3mvAHso+dPTOiu3so3DaU+DROv+fFV6DAoM4D
         K50Rgwl2QB0dBoFtb1yu8yXyFt7/HiHH685dDE4z2GkDtVQgpdm8BXaQlLNzPhnKqb5j
         mhphMFoBdJSZs1RCnJPKrJzoVJ17Qh8pPukbB219Cv24Rwcf9swYb7DcgWhYAI4In5cn
         jFNDTL8GI/wZl3ZpNJNoWf8kmlWjWb5NZF7TxVbofe0EPK4fMSGbGSlijwgKtkhYRyC/
         vH0yqgPvZs+3IWv1EUTjLhB4SU6h9VkqmCXzd/uEc6BDII0FsZkyYJwufAcT1Rudur7r
         VAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788824; x=1770393624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5u5KElOLVcaciKHLnGLaPQhBFyMx8jAhlLbcmr1sUA=;
        b=hvW+m7yvyNl1OtmqYwzIOdSlsxf7Stp0zLtZMAImfF/FqGgw+Z7Ifb1BnKilrAVjLb
         P768qC1pdZYS0j5+pG9dTBEYL0kLrGleO/cbsn2/5xt9Rjt7erzsCjNErbm8UTZ8WP0B
         aQQbUcgHrAWq+TEK7VGSI3f3WBb1DUb1y7GhrvigZ4ge/RbpQI0Qgfz2wEGusdKRwOi7
         B55Qme4KPtuBVApyXf1TMyHWU6yV5wuiPvg7oEPw1aejD7j+r92eMzkAj/wdgv5HSB3G
         u9x/mgOwzJU6+Q9KpU0QGK5sLAJ41p62nN6jEKRs6ewU7WQfuFYLN/soVhfhxqkOhKD6
         8h5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWkcKcz647TxxwWp7TVUCdeXwrBFkeN6o1mFZSCtvYC2pQz2PgWaSK2+84p/GKIeQi8dehPDjguWb5Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxjg8ElTKWQPsGoyV4dcZEkNK4IK0ISctUbkWmeNmBi4HbxGq7
	Bq7/+TPdjFehhgUuk1ZSEID9R2Iy0iljIqu6ICkDkCvkirqnoP1M2HqO
X-Gm-Gg: AZuq6aKQ/y1t3x79cSW2USurg20nqn0LcUkO44veayVTAKbKBwtDdlwNR9kC5p9X/zF
	7zRKodSeNezmhWWPmBbGQ+0j/ws1FNi8eBa6hYcoHOg5kqagIEsDSCaS7ebyJl3eRQI2cWUdOvU
	16Am/XwOcl7wkzIBFe39X4v9nipxEPGyH9wOMjTuIFdeOOycHV+bGsBsR/YV932s7NdD3nL5lyP
	XcfBBPw4Co4QMsK9fabtw56axXBmqkD4kHoYPYpbi5R7d+j1c8j3v6rVryZi6gReRcbSmhIwSyz
	ENslfY+IcYdHjpAZHlQ9l2EUUi02hoPcHwbcUFYMJLne0JvhaNb9WtnkxgWubVVISKH1WfGWlxe
	Vfoc8nbfBYPmn/ackFy/O6+M0JEoahGLw/bBFNxEUtmB9lyPrUrr/ftUEagkOFFl65OEF/HpJcX
	HrVDsIgJDPrO9HTSbFOUdB7ZxYb1l5uSnxj6QwJksQ16JkSXuMpkg98eXTRW08JRKoqW6+38I=
X-Received: by 2002:a17:902:f686:b0:2a7:cb46:7069 with SMTP id d9443c01a7336-2a8bd51b6cfmr68086995ad.25.1769788823507;
        Fri, 30 Jan 2026 08:00:23 -0800 (PST)
Received: from LAPTOP-LUFMQ4TC.localdomain (118-161-168-35.dynamic-ip.hinet.net. [118.161.168.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5df0desm82025645ad.82.2026.01.30.08.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:00:23 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 0/5] ASoC: es8328: error handling and resume fixes
Date: Sat, 31 Jan 2026 00:00:12 +0800
Message-Id: <20260130160017.2630-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129174733.6660-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the es8328 robustness series.

Changes since v1:
- Split the previous "set_dai_fmt() and resume()" patch into three patches:
  * Check and propagate errors in set_dai_fmt()
  * Use cached regmap on resume for regcache sync
  * Add error unwind in resume to avoid leaking enabled resources

No functional changes intended beyond improving reviewability by splitting
the patch.

Hsieh Hung-En (5):
  ASoC: es8328: Fix DAC deemphasis control handling
  ASoC: es8328: Propagate errors in set_bias_level()
  ASoC: es8328: Check errors in set_dai_fmt()
  ASoC: es8328: Use cached regmap on resume
  ASoC: es8328: Add error unwind in resume

 sound/soc/codecs/es8328.c | 116 ++++++++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 43 deletions(-)

-- 
2.34.1

