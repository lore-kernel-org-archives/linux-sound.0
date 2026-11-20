Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135504;
	b=xZOnzAApSwEBoGl8tiUyNscw3z+FFUEr8eirqblXojSunFbgjEnBM6kNUPeeGSzBIDbI
	 PZqOV5Xu1LyEIWEfBZCglKcpjy/Crm4M5tbykS0MaRh8WY54rT0J/dT4S88YFtvwjjeJG
	 L90S8NEOlFZ6AY4vhsEeLXKtqs2pD0HuHMU+9by2f/rxhu88ehwpP4PQWezezwTI7hYxY
	 lXxfS1RUOyHBOoevhR2FaeIB/WocgOBlbH1j2dFq60+m5z0/SBr+PpaPT0187L9nnjnx6
	 Mjsou50ncoaoIzxjDfmaMoPZizG2N0QPWG7W5ZQmz1xHCQElI+W6kMP4+9LpoNKckgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
	b=5D4WX+PhVOHYkzmAEVZYsHfXvKiQB9OzJHoqL8FSyzG8szx1vAIv70ELsaAhRxeTwlP6
	 R+UTBR1+6ZyFZk/UZZero8IoNObK7yBMQn54NJHWB7e2hc0ftzPoelcUiMbSbAaxX3l/w
	 L5GWaUucbUnUIuzyS2ti5yKh/GHQGOEEf60uIf2vJTEutWEQqUoiHOFq1r7nvp7mR4Pjt
	 +Op3UGyhXy5Bsk2aVIZ5zGr5yiU8ijBLEzBFG5U4DM2T2r9J016ywY1N6n5I4hwZMrruU
	 cOkOM3fJPY41Dh4JvsaZaKldVfDnBixnGFprm4QsPnXTsFnwS/C1YyoFv2Dw3gGlsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS03fiE5;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249D60A2603
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 00:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3249D60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS03fiE5
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so240941f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135503; x=1795740303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
        b=qS03fiE5VkZqWNA1/yxpm91vGHIZJ+DOi/JE/3wB4sN4v1mg+HipK16bveShnc2y4s
         ML+nATfo+Qur5Ht2C4SECHFfAhGBmC9lUmWR6FY4rIo9W+iQJqS6FV993SRUmSSIAzp1
         pWtiI2F0N056+fe79cw7ECpLjVy4qhH1+3jirPGZwSyBAJL5m+btCynOWAYQWydJrVbv
         oeYyucmoZJzccUzT7ZwH5DK6ON4rcRY5eUOpf7UE9MiWWEKKnzNgg27/3YVtXqrM7cKB
         BK2Z1627WzdNs5K4dfaUQ42nrk4g+FpOl3wsu2KRpG6fANJO/Ra2zf81Z0tp5d2Ax+GT
         ECcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135503; x=1795740303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
        b=wa1iiicnF6jKSYX07KDxnJ314ztnyGXHBjVpE9NiOGtNyblEp7vAKX/GcuPmFO/YiV
         zddsUSRZFeofK8wFUmj5xf1LX7VLlt/lwUfMp4uMqeavOPEB2hKulrjCGKB2njSIjX/p
         6gV3e/gJlpZY8bFvyP5pAHKXuWsFMq6IvgrTs476W+Lwef/AsNflaksQUv98oLP9+O12
         P3j7+upe/ZkGB3S5K96k4x9feh5zVevaRYvSGOytwETsKR3mzxfeiR6bVuFtNooFJ2Yl
         OBmkvXXfPDmgCKF1hI+W73cDwgbKsOTi7mHcJs+x5vv9g6zC/0H5PJkuDt8XDnY1IEDH
         tG0Q==
X-Forwarded-Encrypted: i=1; AL+hErGKk5wqLawnqQ+LrxmLg5mjE7x851N3dAZ63pKjnzqJshvNMIt/ok8DihZ0GDj+NSQOryNRb6ABLdTeEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pn5786d3z34lg2lb9y8Gk/jKs9Z53+1DvWTtcn3xJ2hpEZwIX
	/fYGrQGMOLqmbJokEtjA1rcMuMv954COzjb6fI2wtvLFd4ax/bYwPn2c4blQJwajIkY=
X-Gm-Gg: AZFdTZf80ikcUM35IXdzQmPQPLEJGPxl2R4QWPd6WhWd4j2a3yydPC53x+uF5FoH/GA
	xJOb08KR2OCBpl9HtJYW3iEhSgKypTSpA8LyOMZT4yEN+waiOd0sihT3xwpmWDZ7H+n8wzn+/Fg
	piEzmBfQSqtAhpDidEkwGIiPmUsMC26/zhuyZksxvw7D/zVEdoq1gvXrI9I8/db3O8YnijYTgYU
	RGNxDoLkWBVC6BWrPiIFMEpc5nK0Z9tHZ5psX+GlYvz16c//YcHZ5BCO9tDMUQNqbI/GjIpkaJI
	n8UOkLu9QHiRRFFc4pt2LOUgErwBIBoC33Y6DgyOakKpgackigiJLQ3opmYC53Go6U1Ydg+Pz+X
	FeFML7ToWL2VfsRh0cScJXKYy65CRCYoQGBDisv1iS9OoTSm37FKLUhkNyecmEgJytqJGFCOtgm
	hcGY+bE6QuqXa/rAc41QDD1E+Uf3YiSpazE8zehu7MQ/R76n1FzLQuiWy+bV5m1krf/a3kLV7IQ
	iIUHDmU7j055xQkZXXde31rConsQnTFObWDRMxOcqbqy070qmhYSccji1QuhfZeuajznTva17qV
	vZjy3dHtBC5VqAVelruuAnEGyUWgtrFl/bR3Hg==
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr2035428f8f.9.1795135502648;
        Thu, 19 Nov 2026 16:45:02 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:02 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Fri, 20 Nov 2026 01:44:40 +0100
Message-ID: <20261120004442.1687225-3-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
References: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
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

On Sat, Jul 18, 2026 at 05:36:34PM +0200, Markus Elfring wrote:
> Under which circumstances would you become interested to apply a statement
> like "guard(mutex)(&tas2557->dev_lock);"?

tas2557_dev_read() and dev_lock are gone in v4; register access goes
through tas2781-comlib under tas_priv->codec_lock. v4 uses
guard(mutex) where the lock covers the whole function.

Gianluca
