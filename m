Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEAF41D10D
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529688; cv=none; b=KFt5wbHWUU/MQ+liAprNoRbVUSe9nP9Saou2vLf8PPnUgo094YHSBZMtcV0nDkJ1l377c5eW7xl7J5TGo+j4zcGabTwoOBmQHqAULIqY8evpOH2ZkzhdR/rAT5GoCV1TkGXkpOMCqobUX6cw7f55HQT2ov/C+7nwG5I69XCPftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529688; c=relaxed/simple;
	bh=oEXbhprboarVKGeFczIsGRUibvpUIcZwpj9JQYo+kYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THZ4MXShmMVKSIWhqY1xlA4lDNSqUUoAHKdhBysgjFqeYBD2qaRWEAOARj8nJ0Yf0M3rd5340cN9QpMkUyOyc4OGLGpW/SWJjDDvMl/hC8k8/QP92U6BR3dSmGYexHWq974PItydjIA5imzYj6+LwO1CV7byaReJaR45L0XI+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlvz4SjM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlvz4SjM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso11110825ad.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529684; x=1787134484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=;
        b=rlvz4SjMW8ayMhejBzsxfnS84bfmovE03nXm1GL5cI60j3Rvb4SBoxPjUkMbSt5w7f
         8L065rTKKuS5XlY2LEScpOabqgJjn2M0/hkpj91Hv2me5IsJr7gNLm2qseR65FxtN+Jt
         pES8E7OqeeBpHWGzEMHVdY2GISKz9RCb22KBWtypqVujL8kRs6MYIhDx1T1hbYguCq0P
         3qUvePEuOMxU+gzI3BMPAW4o+AH+03g0Sa6Psff8GJpeYNJQg77HemwY1scvpfIzSXkM
         Gy1y6K7x3+1pxGcjSdxqjeLJwqO2C3oxHGT2LLKZzlLEIcf3KfNe5YutXtFb53pYTn8N
         oTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529684; x=1787134484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=;
        b=g+/CJQHMHHMEanPahr0IP4nNC9rzbrldLRAteSA0m7f3u7F1uojXFrz6J4zBS1j3g9
         mhP1sAdqtOm9wPajlyxPvkAvtYzP3O7ltfh+3I/LhrKprBKyCVMez1vtnhaXVlYhKlOO
         +EVcl30XULhktyYdfjZvDdc0zNe6n6Ygp0PAqNNeZz8udfceCfiggHW6tCBONe6YPHUZ
         tH+Z0IfGAO8lDSJDcZbktH8iVGUnq2Jd0k0H62sPDflw8d0m9LBuAy0IBNYQ5jktyMj5
         6/z/NB/M/4HVG7belo1uh8zyDpDAcVhJaLClb0gOfr+Lnqnu+SzF6sa67xVk2AUPNrUO
         1faw==
X-Forwarded-Encrypted: i=1; AHgh+Rr78G/evTrkyhpajtDYy7hBzSxD9wTn4luDJRL7iOlzh+vmks4D3lHgfj4dDCq09EdRSXNj/o7Ty6H8lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCiQSFQDRrPGVoXBb20zhi2bomrVcvQcDwZI103HHFH8Hhdqj
	eQIwdQ5cWuIgK62YWNOZj8miZNvquEV0J62y1pMlnajlw/pPpQyzrUNd
X-Gm-Gg: AR+sD12guFRpLztesChf0fx5WV/ccmXYfwM2APfKb8Xn1nJNtrNJj2kGh1CnVKpbcEp
	F3My9y2sU1By7bWWu5gRiBHqD/3lcfFMc9GXepcpmTuYbk9i1B+fDqDp3QQxgqyTZdupffcVHxX
	xyCgDp9ilz64FvMAxrbU8C9Aaqp9Kp4laS5eXyrCxGb6mGeaRkRyvTGs0nzFnS08GYWRA3GzqNn
	yQNfKNiDUkntpozdI3WwHIY0THz7SqEAF1wsGd3yFQ9yEndeXmw778AKQspkWxYSWbPLD3x2o/s
	3/ZHJ7+WDGVnQCO1djnLuYVd168ToZeq+2PrYY6jBeUReufFqlXX/uomG9Iqe39wZ06sF61Xbj7
	i1xSphgdJDvmQ2LZm0aTm7oESnWYXHiDzW5qY0VR+ARKYipCresbuogLkXdeB+X30c6gOdqmm0W
	fsY0cCREcMm+sW3dn/oFUzgHjMDJwbzGa78GOQJNJku2OwH/mNr2VvJ42F3pcKxltZ0pUet5flX
	Mjve+c6SLLs7yeQArVLGH1jJRR2cqhbfnNVPK2FFb6K8R0Cx3HimloleOKdiSGD6dZ6D9yugsiJ
	rxcY
X-Received: by 2002:a17:903:11c6:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d3452f5c1cmr45156165ad.8.1786529684542;
        Wed, 12 Aug 2026 03:14:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: mxs: Improve probe error handling
Date: Wed, 12 Aug 2026 17:14:15 +0700
Message-ID: <20260812101418.37966-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling in the MXS ASoC drivers.
Use dev_err_probe() where appropriate and remove redundant dev_err() calls
when the corresponding errors are already reported by the called functions
or further down the call chain.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (3):
  ASoC: mxs-saif: Use dev_err_probe() for error handling
  ASoC: mxs-saif: Drop redundant probe error messages
  ASoC: mxs-sgtl5000: Drop redundant probe error messages

 sound/soc/mxs/mxs-saif.c     | 21 ++++++---------------
 sound/soc/mxs/mxs-sgtl5000.c |  2 --
 2 files changed, 6 insertions(+), 17 deletions(-)

-- 
2.43.0

