Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0647D44A
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854474; cv=none; b=hWjZ5BO2/R9MydGMiB1LAuCQCzJ/Azp1k9UILNRlPIT0HtzHs794eY0lpD7E14hUR5MWi7y2TBBOmP0ckrGwvyWym+G0P8l6OyuQyWdrMPvK0RIftNDxMQmELxcKrTHnz5ab4ZlxGVmFYMwvfd3KS5hOLTCvHZz4RugLDMOvpRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854474; c=relaxed/simple;
	bh=3IQXMKl218PannBxAxFOsd0Xh9anJurCy6kfS6SMLEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELqBdvj8r+sgqdFRYsBhUeorvTMdikdgnHE+TahCV/zFGFhKl/7omFiaz7JdKGzA7wr9gpb5kKOGT8sGrcOPwwtzOH0+yg+x5q4HGGc8P3dR1lkmKAmvabG/9ePEI+XvygTQvKGSsh81Dy3v2/4L14mJ1Aw7cKMLIZmTUbnQ/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R21+E5Wy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R21+E5Wy"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e4998d28so86357f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 11:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854471; x=1788459271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3IQXMKl218PannBxAxFOsd0Xh9anJurCy6kfS6SMLEg=;
        b=R21+E5WyEQoxB/juiO9DsJieZ66V8ZelCzJxs/PAHeGj3VLfMIyGgdDtABGOWfacDt
         qB+M+qntgfPpQN1ITkQDAA1RIlPoBVXPvPTQr6Nz27MPrame/PXDi9ZfpRFd5P0qQoUE
         y6qdtFcAvnRNCriSIwDbBs4jqwsrnI3jwqaG6gULOlFZ0vukDN1zGfyjfaVXjle0Czng
         wplmxqcqfW/ys/eSY/mKGa4b67Urd3lDBIJxJPOL0zUXRRTdiAqeRJNr13Sc62wRTVaF
         MtAr7YroWJtsoL0lFYAbkfOZSzLUY01SQ1Ltfp7DI1/5Cefft2yImQJXFStNPpej75t6
         6c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854471; x=1788459271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3IQXMKl218PannBxAxFOsd0Xh9anJurCy6kfS6SMLEg=;
        b=jvXJXfRMyl/DIRqNZia8fz4ITp2Pr7AUIDRQnNKTkKxloLnyYNyoRxyoOHEXfyv9lf
         tck2wYfD3sju/9shzfv43K7M62tbN5b/pZhtaskrLRMUL38d6rQ4V7UKxCh8q8vkQ0Qr
         EObl2PqdHkEDPmMF3DJluh52j4fegKOjQ4FCOcGoArqCNpBjGHzSa+/K5GZTEGyiTiDS
         0KusN7Mx+5o+k+gqtfPlwpo67w06fdz+xlSluMTzbkTICR4ykGDDXS/bLwIPduSz5KAL
         +AfKSfvje9C2OT/qXt8S7DwD1+azbo7GBFhEGJpsYwE2jLcTD7lZ81MOdvKVa9ACyCuZ
         Q18Q==
X-Forwarded-Encrypted: i=1; AHgh+RrVk5r3hsw5zA/JZnS2bykxGeh5DR09vpLWztu/q3aO5jVpo9RrecjvbBn9Gut7OHaGvWxhJBIf8g+P2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mkdIsZDu5iVjx/AyHD+eeeeoZZvjPcgWa4xuLpjKjRbTrw2lBW
	TYsSpxjcxK0QfWV4mChujkwhoJ9V5c5XED/1QQy0+YHMzlv3Nzv14h6b
X-Gm-Gg: AR+sD12R6E+i3rKoEt4ge76xPIfJ+TPhad1K0A2R6d4iL3sf0mCgbg0b167GGELqyEz
	LxZ8/yO41nfbkCvf6pi6K+A1P3AQMbuqyNfCDTx5aEYELykP26IwsSCOtLCYyYZhwx2/K8uMP12
	1c61WQr8phueYzjyWI9geW8Eu9u6Y3mjeyFvwLG2qMHHbAdFKRZRRVIeAfyAzQeNXsMUHZoubb8
	GYxkTEYTHwJnhNOiwh0wyxS8Ewh9j7DLZFPfHNL3DTGKfbdcXPvq0htE6uaRB5PKVhRCfdNTfIZ
	q1SDJfuqQKSX1aRcG6/l5Wg7gdzdmp5A8ucXqHJ832iZuIIlHHvNmFY0t0Ya0wnXZDD0J3pTPyH
	2a7ASBRL72GqO54yZKT7pZHtgb0YWPIEHNaG9fCn0w5e7yYEcRwNTnSBn9uX6sUYrBuBaVknfcV
	PijnJE0SVw2IqjWonKIJS0BRj2PYL+yjRG+hgcJ2ePwDHYJwZaoZVFYRmTersciktYUQ1QEvWfm
	Y6NZkYQSyDfbmYvIYjfsYSO3ntpbfQDNm8T8ScjmLIJfreNWe/OErY=
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-49b91c57d64mr11486265e9.15.1787854471407;
        Thu, 27 Aug 2026 11:14:31 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942366asm65174905e9.3.2026.08.27.11.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:14:30 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
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
Subject: Re: [PATCH v4 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine driver
Date: Thu, 27 Aug 2026 20:14:28 +0200
Message-ID: <20260827181428.2424693-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <901421b8-6e7b-404a-ba67-10c3166911f9@sirena.org.uk>
References: <901421b8-6e7b-404a-ba67-10c3166911f9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. Both points are fixed in v5.

The trailers are now one contiguous block with the Co-developed-by directly
followed by the corresponding Signed-off-by. The codec fixup now clears the
SNDRV_PCM_HW_PARAM_FORMAT mask before calling params_set_format() for S24_LE.

Maurizio
