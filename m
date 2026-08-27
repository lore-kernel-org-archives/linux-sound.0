Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A5339379
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816631; cv=none; b=j1g6CxgwU4nA/jD6nBon4SL/quvlANH6JgMHoT444qFjFzd8MWD0L+gyotac1YHnH/BNZsvmbo+WWbQR+FAZRPskbMqw1zuMqKWpc4iCkp7uMMihfRX96XA3fbgRVJngdVFvVYJAi4YmQ2ZX3wwUjkgeUDtIV17gTK2t+Ubkrjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816631; c=relaxed/simple;
	bh=Xevj5TRkEDm/ATw9jZmgzrjdvYzk28JGtOZh95gmagA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0TXqztoQlz6sdSw2uQE68/APX0kkjiRUXyKa0ly2cfjNRBp1qS6bICaEvZwjxI6AAN1dEenm4qTKdFmLpKMBdVQW5Id6jW2hkJhSf+uxD6YPUXTG42PL++DuwDWpR8Dtz9cqfcYkskKMAYXU8E63xLtL8HFvgUBVTVggBCKog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKq6hF+1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKq6hF+1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so820075e9.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787816628; x=1788421428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xevj5TRkEDm/ATw9jZmgzrjdvYzk28JGtOZh95gmagA=;
        b=LKq6hF+1JDmru3WJFrRh8mTml09EDLI1mRi5ivdj2paQnQ+42K5xcGCj85Ci7SNPMP
         kHrxWodr/WtYqbt1L15tjVviujwM7mtq2HkHxZPItrzBISRs1KUABnfY+/WTFSRfv1yW
         ms7MRPxoTdhL/KvzwKQzIXuOOIbV/Lrt3h4SuFqGJ8/9Y8rLenabzo0S7gy+LJ198pga
         A3MGqMvgsPgmChWoS1nlrm/NRpRhn2KxholdvI2NbmdvPg5CrJ+sd7yrarNmz+LsBm6C
         u/eDQcQZyc8MwTEiii7/OJZL8JNDgtR7Il0+yJySnccMVtc542Lw1ROHAGG4w+haVgdL
         mPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816628; x=1788421428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xevj5TRkEDm/ATw9jZmgzrjdvYzk28JGtOZh95gmagA=;
        b=KBkoXnbBq/O+H0MeQPtSx1vdo0Dmy7NeWYHDTRAIhxAtocc6AV9dGbSj7i9oSt8R5f
         A/mVpCqwqlUOCfzyPEhYBTFMCAZiMq7TfXWY5jsH0R1jrFdQeZ52kp+HhtydQbY3Lj2T
         3tpi3O/xpIrH8nfnmMehGVjcgmJwolmeXF5DpUFj4wsbY+BEpeX4074eoKNICiYpHSRV
         sD0qq2pmabh7nmlLEpLRLWq8FVd5G2B/oGGBjfPfBm8kAolz2weiModJgLv3kAf7Us8w
         jxkScUIIDyM9qlQh7H3zm3AtZ8GMeU8iFwrE1boUlBtRcnBDUuIu38l/7Q8nd3c5L8He
         mBZQ==
X-Forwarded-Encrypted: i=1; AHgh+RopVacc1llpI8U2vNkU5E+TtIsK4fdUIooAw1NFhkey7U9FIHPvyVCe1+9a24A3qO5LRiaaix1Qkz0owA==@vger.kernel.org
X-Gm-Message-State: AFuF++mRtPZ785q19YBTHMT8bmRJ/A3tlgeTDeoki61IZH/maAwvcKqe
	n7ATMwHosLcFFjie8wsUzvUuPb+9Stp97ia0LwN4Mj1pvPAznWv9wmKi
X-Gm-Gg: AR+sD12Z7kF46kcwtlpDseCuv+yR3BUDeyPsTjc4Y4LYIT4yzbK5R2tyxVFPxuVGYTI
	zLvsl2s+GY2X8Ra8GeDLR81o6a62H3XVUTMfGgqixfiqhdEtLFlE8EWVZ9wnJHWC1s8pe4LEPah
	KsIIR7DsYb5Iv8H1TZSJlXqfXo3Xi65ZKU79cDOeIyXrhrGp5KzpgiBQsclXHleTaYwH7zAg673
	l9HldHtKOrmViyeU2zyRhMVEOMtnfccz+qTmFzld7ED3EBMKP9D888ughl/tm0JfWH6bkfWeSK4
	iMBXdi6RtWSK4bpXUT5mZr+eWblHSMVWOFNO9npfunw4i5i0mpBtXpBD9Tj7Ubh6WncrjUPxoUg
	QlL2lsKu5L85zIX5nJKyiIQl3TsEmfSTi1TKbbXZMkh7SlyNKHtjYjcVbg2k06vqhdca5p59m3d
	539Un7QzGsGLiQOhLoX3A7ZtF5okCEs9mYlhaVtMaxwfV/AiZNBW/UcAx6K7plCVgNXhotknZe8
	ulPSw7plSsCXMPDMHG5BGV/j4NMokk6qupK3IfmLzmc
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr126972725e9.9.1787816628092;
        Thu, 27 Aug 2026 00:43:48 -0700 (PDT)
Received: from 1Z10 ([78.211.107.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm29175235e9.2.2026.08.27.00.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:43:47 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-sound@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 09:43:45 +0200
Message-ID: <20260827074345.1423410-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Liam's current MAINTAINERS address to Cc.

The v4 series is archived at:

https://lore.kernel.org/linux-sound/20260827072517.1401173-1-mauriziocasciano7@gmail.com/

Thanks,
Maurizio
