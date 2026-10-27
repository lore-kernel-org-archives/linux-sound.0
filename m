Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097871;
	b=Ytp0WFCred+nmjsAle2TgMNYG+0i8JoTOToSOn/bLwy2JvxBXbk5B7g+6ctgjdiC2Q4A
	 08gGeZhbtgCFhOmAfYfU0HzOlM3IEjQbsW8erILHRhMBnOBO1K+UeqReEvIVRZHibdcBz
	 vJqiYewy1meAJGGufiYFEWN1K+XS5aS7yUez47iASh0+TTI+s0OZr9qsL5k27tOrjMDoQ
	 HMDNPNDP8BqttuS6HpgyrqXpPXR+zS75fhHvVJkbFsTI64GljqQRbV90FObMizVVnPaOT
	 pa+IJ9mPl8pnsC5gdCWnvJ5fSuU9SDpDZ7ODdLQ4WQdmiCFUvrL8Iq9JeXER8Sz7y5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lfF2Fhz8PNov0Sv4mkHLRYpaIAJtmVVrP/HsyAkwL3U=;
	b=Tt45t2jV6y+uY/skGLQKSCNnvCKzzEKiJpJi5pHfk5sII3I48rvL/zNyAhdLjLcby+rA
	 BkSZjvLBVqo+bbsbWyskbAn6nukLjapukMNUKvvI7elU/Cnr3Qirzx1ig0f1sD5T6ABCH
	 WXjg8MzbPHaVvo8YtSJmY5JWZMNJsbsUbpdUEJH5VhKqjh1h12KfCy6sbpC02grYijfR1
	 GL8Xmxr2NYOKwwlOjtCfUFsTf3zHyKJbsO1+Wfonl3pPvD/5RbqHVnkoXBHUbGvog+0bn
	 u00y/uHql7o143wmrqbJxyzxZjDb9shuk5fVQnwT4jTS+Btdvv+qNV1dl9b99jTCIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dd3NJWZW;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0E606A321
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dd3NJWZW
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e96502e447so34184395ad.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097869; x=1793702669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfF2Fhz8PNov0Sv4mkHLRYpaIAJtmVVrP/HsyAkwL3U=;
        b=Dd3NJWZWOqoPtlS3IVkJ53Ah5FQ4EgFOGvXmeqWtc0r+GCf53Zh9Vnt6MEJ95lKCnP
         ZPsP1oRRO3qAtd0AfrpPWLD+h6VfxIbK+bqsGo5htxtc/oRj5yRAkTmN+sgt4jKdi3Ch
         IJeNZrh+kLY1nmB6oAMq9FOPxs4sq5ADQojGdL5y0+vMiONZ6eC0Tu9eRL3Cf2mJspa0
         omrQ1JXArB8ob1Rbd5vsk0ArXRydiwsf8JrxidCDgd2SuS1lsNlcIhkj/jXI7nNH8gv1
         oKdw37QXTE6JEBR8JX19CTX0Y7T+dvo3YN9yUtQ1HE6+v07G4vwJigV72NIWq7MxOCnZ
         Vpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097869; x=1793702669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfF2Fhz8PNov0Sv4mkHLRYpaIAJtmVVrP/HsyAkwL3U=;
        b=YcO6yvHrzPj9R/XBXWZQ+jQw6Cgum6r01/rRJtpU5r2IpgqSO+gyAFJM3UB4LUnS2G
         AozqdDdKFxVtHfogS9gyknFY37TOcFadNzKY0DXohEjqevn3fZtLbC8K1DXnhcNAgFzy
         b69u2DNx6aPhRqCEmUd0vdq4CTEV6b5SiW1O/BaVFqT0pk8gbzJsXVxKD/Mj/ybaXMTx
         hIwOfI8j61I3QW8N2QVVjzxl9UJ7uh1rW/wGGJwoboxM5jrO0u2yST2jyaeC+pPablSy
         cb4jPvzVsPkTmJDnD0oaY8nQU1SsNjVOqaFOj8bS669JfvnF2eQ3ZkK6pOUcD278TkpL
         o7Xg==
X-Forwarded-Encrypted: i=1; AKwUvByO8Qs6d+V8JMgSpYvgGzIa1FFpFO31j60XPMr1lfdQv7rwsbw5TE1PM4NqvDC3Ja7U2Fc/PZVFkTjr0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKw+bpFlE1SAxdZs1DxJfq1JyKeDMchnlBg3XVag+Di9de7C7di
	54hUk63pW3GkWQZ30irZHdLXWjjoiTM3O7nbZbDlP5SqidyNXrigSlKn
X-Gm-Gg: AYBFou3U2GSUkjStnLYkyA3SFXj09/uWuS77TPminp4UEbFNm+Mah7gvh8UCOaZOyD7
	f8li/2f+Q22F5Ma/mS8GK//dY79SqWsst97hq3N8xffZocZByMHnn8Z9QmddhPEnQhGkJ1jroHd
	WQBCAT2IPSinwbg6+Rokzzii4RNjI9rz6IKY7hNTFk+xazD9BcmTMCFRIQkqWHnq63LiDbMH9Yl
	wvC1+fMr9qZSCjeiadiSjl+3r5GpxtXOSFKi/T/EpeiZU8cBCSw0t3v1WtAgGTg0A8M12ueK6xy
	JcN+UqeFpNGvBfybRlJjXOy7hPhtZE1Ey/X8B0Sgceqzru6dgpwR+oni1LH6ymstF/EV+kFsP5x
	N2AJRo51DUVcjhOEdxvKyCce35XYCE3yRd101PatR5fg3JMm9SyIVzFOkNY6pK0PWvrtjhRZ7+e
	IrNM+QRjQ4ZhTl5qOhnAkIeGmPME5vYncM0WNcyMvObO4I2K2tkfwWZmRBPUh905o6Bjy/SdYRT
	um9YQS/LZ9J5Q/C7WwLu/0uLnNqvlkvQ9JKbuSgDTnyJzOEjOQHBwUEvyBHHxm0jA87tQz1hVC+
	q+UTIg+TXXG5/+/h9FfIW3c6ynf5vtqiqB2VvvxKGQhZOrhFaiMblk2s/W0LJ57qwjJ/BqXj4eF
	WlU87nwuB7NRCucC2
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ea9c83f0acmr88449545ad.48.1793097869513;
        Tue, 27 Oct 2026 03:44:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm7187525ad.68.2026.10.27.03.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: img: Fix double clock disable on probe failure
Date: Tue, 27 Oct 2026 17:44:15 +0700
Message-ID: <20261027104417.7150-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

These patches fix double clock disable on probe failure in the IMG I2S 
and SPDIF output drivers by disabling runtime PM before checking 
the device's suspended state and manually suspending it.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: img: img-i2s-out: Fix double clock disable on probe failure
  ASoC: img: img-spdif-out: Fix double clock disable on probe failure

 sound/soc/img/img-i2s-out.c   | 4 ++++
 sound/soc/img/img-spdif-out.c | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.43.0

