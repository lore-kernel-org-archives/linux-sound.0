Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595105;
	b=ISNMLfuhF1qPFYf2c0YI2m1ccB6xpgdOFpT/s7I4s06wDGoVh1dvuFSwJKKDo9XkZRhK
	 PyImDyMavSfHHEI2JwBKVgqtXiwzEggl6Jt1ADdQ1yJrvMsjRvezcsOWt8VTAKmswZklG
	 /1QEHnm8f/xx6RPCs3dQLVeOn7aNQT3VdLw7tI2IsY5IXboh5/ij+OXi9SESSInIMWDgO
	 UmOUoAthEk5Q91CJL2tZWG8zPwRdmRlWUZvHANIi6q+onZO+fm4KfaDtaAhVtzR3cNwLl
	 VGdUHM/5J7+m1F3pwpsmUKdOEESyU/L0MgEjiaShovb2UuEWsAo+AmkFDjQKm4kGk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0cPSZ2Db/3oxf+nJ3B+LuZEfDbqz7MLUc9BPmfdbovI=;
	b=DF/dDdqVRrKjTBLO6uZTsDX8I0s8l+rOnu0/TEVe7SlZi65MJrgOKocPho6hOVflwfDB
	 uiNJ3zKMq67S32gUH5d6A3jj8bi2WO2ZlFL4aluipBIQMiSpr9xDw2XVro97OhIN4Rw1J
	 1vwcFD62jGSGFfEr/bXXqCxSwLBzb6dBgMD9g/lFK6ZEG0zBKeCCDeOsButkaDO1V64KM
	 pPIhqr6Br2qP1Qe7uOxJbvuwR8iwyINa3MJ7dW0D8qGltpJTZKXbs5Ji/TWUf6bWVkTIg
	 H83MYhmeg6fI1tqRH9BiCtXB9RTWN3aHdBi4JWxBDuQzMeYhQkWtsaCZ9vP+bkpmTxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3OdydL+;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4477606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4477606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3OdydL+
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2545610eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595104; x=1796199904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cPSZ2Db/3oxf+nJ3B+LuZEfDbqz7MLUc9BPmfdbovI=;
        b=M3OdydL+osjgiJaltAAoiTaI9znp/ISlBskaK6mVpHjWGwP7TpvmKfIyh6rBerRNar
         Jhj6iwZRU7lAjrozAa5m1myP+ss/CE2rjAm/F+1QURh5qGmYKAVqF+aZd9bAxrTyfq90
         a0nYqxQTHh5STZHe9l14d+/ZUOUd/v6DY4gvsyu4mNPenVSa/+EGLYWcix6oh1qUOyEC
         Azk4ctfp71lAmtYDpYvampfPewlA29Phn9KTVGLeysON+pY+ispHiO1MoBfpSSF2ae1p
         EQu1zE57LD4oIzSczM6aRWHvbwA1pMSeIS4g/ETGOfYprQp4x5dWjLQgfkMqapRIYahq
         FUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595104; x=1796199904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cPSZ2Db/3oxf+nJ3B+LuZEfDbqz7MLUc9BPmfdbovI=;
        b=rd/QmMD01qgDOCRcaPsH3yxUxcfG2OyfVzmRwTj/7ja2edDS2NUe4CIoG+rCCNOM4g
         fnMvPHVrJkSwM3HwDU0MfLr7waL1roneJYqO922LVdxGniGa47LkT9NQONIZR216a20a
         jLalqX0zjdOdlbVpoULSyIQHhfSGncUtk3VsLEOgJGM0LD38t8sTYjEyXd3oOzueGb+0
         zNEWEl/T//Cnf6VKNDhdOFYZ7SvZxLBf9P/Ve0NsZ6hJvJoypxLJLPEE2tilrlH8GQKn
         DxLiTdESI5o/4NyCSYaisG/z9koU99D0ivV1rJWzTTFcY83Ws4S/0s4GRt4Q8CuEc7N6
         L+ZQ==
X-Forwarded-Encrypted: i=1; AL+hErHfW/1jL23fLyw+xYvKX0o7APBE8c1fr8URPMz8Cm+CvB8s8lcd4mPx6uOw8Vu5u0XJp1QHTNV2rs2o2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z91h+emy3YrIL82CK5lHthflBxWG9mlaSqKokzXtRxKDSJfBF/h
	1JijumfgZz2rvXrGpw2r2w9wwoqEEP4b9B2eh6+Ggd2a4A+DuxWauJCm
X-Gm-Gg: AZFdTZdiDzzRkMTWXVgtwfr4xbFQZVtX3ZO+jSGiG8p8jNgXfZYJWg3tQwQFNT7vcug
	k1Um6QTcEg4oBAEQ1Q6vPV455GPdES2QO8riZHqk26lezUHzR+NxZfimESwJUAoZ1C1B3OEdhnH
	5/9tWzDCi3NDjpsmGrgkv4OXsWw2jsctcgkEl1B9WSxFPE0eZTXnViyNAoB7YzJSM2BTS33paif
	mg3GhN4U8oLfD1kZWo4gb4i0GpbBMh8d//0FDe5o7JssCOHU+jSL+QWxL2C2tRVO/7t+JG38mk2
	PkFvpEuEfntPXaLVWfkregWmXhvH1+7vKqemSYqMD27jU9AKQwpU5M0Mf3izvt13BGe9TNdz6Oa
	jYEPeYbnd2JBpik/QPhx5hBC75IlD9Wnc6LpSQqeH7Qw935QzRU6jd+5nQiVvwzAb7fH0/7A05B
	GtleIK8DZiPDV7GL0jyGoop4MHXMSjIRRcVV6z25jxkbYYj8klAfgyrCu/rIPmBh4h17FHt8EG1
	hHlYcJlDCtM94fn+lrY/9SBdSlYOSdqiOE+Rj5gmdqLD8o5DS7epKgv28FT5Iv5O3jT9xjzPyn/
	lYNeHDAqrzAAeyzafMo2DYoxzNDH/nplPFyTcha5kysjiCAXmUA=
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-3856f65eccamr16725475eec.14.1795595103824;
        Wed, 25 Nov 2026 00:25:03 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm48576188eec.16.2026.11.25.00.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:25:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: Fix dynamic major number assignment
Date: Wed, 25 Nov 2026 08:24:40 +0000
Message-ID: <20261125082440.3841-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6bd8ijb.wl-tiwai@suse.de>
References: <87o6bd8ijb.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for your review.

I've updated the patch according to your suggestions. It now rejects major=0 before 
calling register_chrdev() and removes the redundant major and cards_limit variables, using 
snd_major and snd_ecards_limit directly with module_param_named().

Please review the updated version.

Best regards,
Sreeraj
