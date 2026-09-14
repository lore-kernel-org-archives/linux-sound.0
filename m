Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC973BFE4D
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393323; cv=none; b=If0Y06jslVVxoQGU9gD7288a6ZzRs62nKWrJkdezDZgkTdqXJa/+OOCeo1+rTijlLezbE55lX95BN+R3U5kYzG0iwQEWNN90pcFExgsXKK6Xkrkf1prbWRe67mgOu+i0Cj3gAvKGPT6ywq+e6S33x1QaCIs1PnZmkmga1EYitq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393323; c=relaxed/simple;
	bh=PddB/J9MtdYNRVBKmIC2rQyphN1yaVNjGXFOy6TLFHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8ctrpBaBNevnGKm0g1eqsvVjWylfvRBwy0jWvDBvnV2MSBIqGTUeLdcFIjtpeWBRTu5fauHphAImBM3Ls6GDSHDSWDZsUVyo2k8FRK+ti38LW/5HD/08j5dM+uCyQX01JbWkFIwnU+ek/lPrs/lyd0qZbX8o//jcew+gP0mehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTOfUo6b; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTOfUo6b"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d82eso3295415ad.3
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393322; x=1789998122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PddB/J9MtdYNRVBKmIC2rQyphN1yaVNjGXFOy6TLFHI=;
        b=sTOfUo6byFjMoOmtCTEjE2sCm8r3Q0o7rmKpF5b2pDvKFgeOZRwb6dMVkAbyXItHtD
         EypDeDEHiFVA290NrYjc2/Fm8D863mXGP0L7jQ3gBoUAlOqi/w5dCNMHGS1TJL8As2x7
         x/mvupNB3g4P+HVwJz56tb8tA/pQcU5jjHiKmM0COdMVImfD7E5Z5MeqvTws7W1YzfNo
         AujjK+VAIwnvbB/qz9tezTK3+PEwOmAx/efp5pF4WgAPgHplRH3NSrnL1xsc792Faopv
         Qkf53r2YqUNxHRD8i6jULGTmXmQQhVbOyR4ks3mbNpsjeyxmXw4ujQtbCHecN0/CrP2i
         dl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393322; x=1789998122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PddB/J9MtdYNRVBKmIC2rQyphN1yaVNjGXFOy6TLFHI=;
        b=UV3o4vZdcusjRznodU81x+pRYjcy3hvQeEB4Wx1/icHpess9aDHuMNuhDSh68aN6cJ
         3eZlWw2+gjDl28yyfnBGEUfRTZmq3/wVkaxffmBlj17yiOyFBZwOBU8ILzOqfvCA7bAd
         lAEms4aEiitdirhm7ckYi4kT0ldxD7FuHwQmChnuVDF6ZMDuD8bDD+IVOPDeQxDJBNE1
         1Q+msrCCAklz5XpNQgalcRUNAdl10VJo059gmp8guV1gWTNQQSE+1GhzfR4ukck4nDeZ
         ONKldUBVypNmnrqkTj2kCMdEP2LrH32DLIW3+ogI9LpftTs6NuNBe1WqkjzdD5ttGAek
         FCAw==
X-Forwarded-Encrypted: i=1; AKwUvBzCvaqv4KKH6lSubbTUh48dxesnEfropq6cBj91Abe6qvYjFaeRawssg9Kckoo4c+Du1B3XOyHiba4XLg==@vger.kernel.org
X-Gm-Message-State: AFuF++m0/gZS3erIoEAYg1ceSJGl8zTWMPULj2PiHw9gNNddoZGDtqpq
	E+Rh9nb1TzOmAGrDJRN0S/wJJaB3ml64E8r5wDOJYW+JG2iarVAF76Rx
X-Gm-Gg: AYBFou0HK6p0z4txRWdDwkAmFpF21tXVbLoNQt/RA9wbutjPoaWg8esfAWJ5OINjtgu
	P67xu68ZqiPKbxBDn7dLiZmc5JlJLxS/v/Nn5NjrWlw1czmO896Cmcqzpek162oW26Qythvt47c
	NfGOENkiXuNRRYIdSPVKULlQCWxYwEmnFNZwD0VE37DSSxra4G5+AM5tiP+0omT7IoRzXCOLlPV
	9VAnlrRSXjDa1qid1w533PmzpvI6jHZX7FGoEDECWp2DzEQAVjtXX7IHXVz5haleqAm/LhoM0OZ
	oX1Inbo6Yeyb2cUH0JnlMs0iHMWp6RZ0yltDRp84OacDTsHAs7/UsnFB6M9qSUS61FHq9s7/3jI
	TXJf5xrCrbi8qEngHj3r1pc/G5/o6WcVH0h5Nyh98ho0+EOeIpBoFf4X/C8ttmryU54giCLPHnT
	UdbKO60pN2pLs9j2erkPh/SxGzh3A/J/xsrnfk204ykUge2QpMXPExuX7phwGddDCeybelRHe2b
	iM5MJ1tLfKbynlEgLPybDEYtxphKFRDdnegWDyVJtTl5q5SH3Hlz1I4FIa1QbisuXAFCyU7oM4V
	Wj6F1YljUuOBsW13uQxvdpqCThsT97w=
X-Received: by 2002:a17:903:4585:b0:2dd:190e:28b6 with SMTP id d9443c01a7336-2dd6c6e2812mr38152905ad.2.1789393321736;
        Mon, 14 Sep 2026 06:42:01 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff6e80sm48982875ad.78.2026.09.14.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:01 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: rf@opensource.cirrus.com,
	david.rhodes@cirrus.com
Cc: Navon John Lukose <navonjohnlukose@gmail.com>,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at dev_info() and dev_err()
Date: Mon, 14 Sep 2026 19:11:54 +0530
Message-ID: <20260914134154.1295196-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4621b455-9460-4f45-88d7-303b6243ad45@opensource.cirrus.com>
References: <20260914000308.108995-1-navonjohnlukose@gmail.com> <4621b455-9460-4f45-88d7-303b6243ad45@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14/09/2026 11:09 am, Richard Fitzgerald wrote:
> However, I can reword this to say that in most cases they
> indicate the same problem, though not necessarily.

That covers it, thanks!
