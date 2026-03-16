Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F523ACEF8
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679680; cv=none; b=rKSoN8cn4I+TKrwldegsSOfB36glMGlxpeYPRdj3S8VvQpzPdNN839fRkhW+zL6dPEv7JHvjewiQjNUwTSANCB/S21RI6dHyk+cYGLWXMJljOm+p0yr0caIgW2IprcjePaBp+GwYFTfHh312csko1AzSn3dF7kcgK+BZHTB0mvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679680; c=relaxed/simple;
	bh=Giy+aQ/MUgKwGXRcJb3ewhXE1q/vA4e5T5rPRd1khz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJtApzej8Onr8RKDfBVWy9Jw9Cfj8G77VOfqyEBpEomttP25ATTcsGqYgxbERu3yhR30RtsHd6eS3xm8k+RpOZ2+hKnI18FESKbPVvFu6NIojQpDhDKIZMUBdOXXAO9cIYF1qOiTJhC3x7vs/6U0P6qP8lk2JGfEOuqUYcU8MWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeFtQ2lH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeFtQ2lH"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a15b44c3cso1833557b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773679679; x=1774284479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJWWa9+VjL5hCX50vEWoXauI1ey6XMA+HP/X2jflnZQ=;
        b=YeFtQ2lHHaeVE1pYZFbpnsOW+Wx5KePRsXYcC3duyO93rjoAjUmAJM2S1ieoxrzBvx
         +Ekp3BtxirpCUl/KGC58zMTKk3yx4F6iO0l+F+JAv89/AhZXDvLOWiPTC6hEZrdruy3y
         Kl2IJC4yUM1upG5PB/VmUI5Vo4DbQNhaLvSm4NffnyjkytnMXEzl3UeQs7I3SUix6o3W
         gAr1eJw1qO0T66hqFLBPRGneoztsOt71q5lY0IDnoBG/Cu2uZaqG/0Xj4YRYjYwP+tNh
         wr6Xo9u9RXNOhc0Ldu+JvROjC15lSrhNFz6y9v2tLF2lLsGY+iyEfIAVqd/9I1vAFq0J
         95FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773679679; x=1774284479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJWWa9+VjL5hCX50vEWoXauI1ey6XMA+HP/X2jflnZQ=;
        b=KWZc5YlpAxFNsskyrHpcDOtdIVZeIZ/bjZyDGbQdDTTiOZ4plbEkSrG4b3IcUzGDmi
         D4N5d2FGl4kcTM907xCvkK80yDVsItMgaa6O2wGqmiBubijygSRuTB5bOF0TaOjdWNMW
         leVBglC1nAc5ARy4Uz8QOARsRydDvlX7Rcl/qULSFXUGzNjW4plvfIt3lUSRw0rzinkZ
         CY9AOA2C6ffsXf1fvvCrYOMWOvfszuIt08iKTM0PaQy3DqfqnPMG4PlO7nWfLh7pRkNY
         WdLsTIqo58qaFrBUdZM5lv+HFfnmtQLhU/3LX+rGXC/UWUeql6UPmKjqj4RnKWBujg7o
         RBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxRgrMgxbPdwDks0DFhBJkqetMu3LVSRcHb/IXpgdHtt/r3DuuMXN/LxCkcAhyum/elsBXCyuKcgW/yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeFwc0u9dOj23rbzV7iSi9ETkr2qqJ4DdHYZhgO30+8N6m5Wm
	WvJ87IwACT3RYUtg91Vd70w6jibPhgJBVkw8gk+rCb90CQaq3FevaEIq
X-Gm-Gg: ATEYQzzEVA1nJdlC4Pt5SPlgO4w0kevMw/bgdJSqfGZclVifrrYETJNc6NHN7hn5TZz
	61QZIgWSyZHxVAq0M1Rma9McjDIIONx+ZwYKdB5xpZ5zN6wVBCJvsjo2kNsnt0NZlcrfw2oU6ma
	IHr8V3E469e15I2f6q7348EMJa0Yz/spgkaPvw3tjSsa8dkahKkcljo2g5eB+G7yPSiJ9J7Ea1+
	ssLRnsXmiYJ2XaLNuu+6uZ+mveQukimhG7tXZjkkSOkCCEWM9mFCXr6g+o/t+i2OS4+X+WvI592
	d8MJFAC/EIYrDTXSP3bDIfTKIztJ4lHRwhpEXje/uZ+7ShJ7A10mGXbcNf63wQlC5iMmcdsqipa
	+7bbjI7vbwtM4yOt+nmyS4Zd8Z/c3894zQQ+w39mRy/lzzWDdvTOPS9ODeew4i6KvcOok9DnLzN
	1n3DmhLp/d2Sa4Mxr61nzw
X-Received: by 2002:a05:6a00:896:b0:824:18cd:f2f6 with SMTP id d2e1a72fcca58-82a19941e34mr12397517b3a.59.1773679679150;
        Mon, 16 Mar 2026 09:47:59 -0700 (PDT)
Received: from archlinux ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072418e9sm14919333b3a.3.2026.03.16.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:47:58 -0700 (PDT)
From: Hasun Park <hasunpark@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	venkataprasad.potturu@amd.com,
	Hasun Park <hasunpark@gmail.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: amd: acp: PX13 ACP70 config and machine quirks
Date: Tue, 17 Mar 2026 01:47:31 +0900
Message-ID: <20260316164731.18720-1-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <177362009337.162791.6622780298534018366.b4-ty@kernel.org>
References: <177362009337.162791.6622780298534018366.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On Mon, 09 Mar 2026 00:16:51 +0900, hasunpark@gmail.com wrote:
>> ASoC: amd: acp: PX13 ACP70 config and machine quirks
>> 
>> From: Hasun Park <hasunpark@gmail.com>
>> 
>> Hi,
>> 
>> This series adds ACP70 platform quirks for ASUS ProArt PX13
>> (HN7306EA/HN7306EAC).
>> 
>> [...]
>
>Applied to
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0
>
>Thanks!

Hi Mark. I've done some clean up since that system does not require rt721 for dmic.

After preparing V2 patch series i realized some are already merged on for-next branch.

I'm not sure what should i prefer, send this v2 patch or
since this change is just for cleaning up and doesn't cause problem at function
so submit another patch for cleaning up.

I need your advice. Thanks
