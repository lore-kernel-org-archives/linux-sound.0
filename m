Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838948;
	b=QqRGOXVKE0kpgPQLbPq9PfkNlHnbse+yaLHf5bzNag0+TXrlI6dt1t44/iBLr93L6g4x
	 ZqDR2pfqGD/HwZTqhCAnreAo6VXhn6B/Pc/aMH5sETPQ16vf5Mzp9jTI5g5jcSeeh2gcf
	 tuoCl/pJWwezR+xpZT4T7YDEId7CG7MlGVC1V0toBWAOt5/kIvYsc+xbluzVT44HoiY8W
	 Uqen3N1KZMNMGXAr+23msvjZ/oZFXsl7J6fCKHETJBOgQmTb7NyH/j24Rywl6xll+4qSD
	 V5h2VM7VFzAicqwvYYNfqMQq6yaQAzKBGegIYdjqN5GolaslQMWLML+37r+DpuG0KAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ADMYCk3rFaWn5Xa2fjtzLl1HSNYpH0Tk9E9gqQzGpDw=;
	b=tHyhPqNyEDqmbenbq/wtOPUO+MklJUp+fK1sKOcz8WWgmcGHwI65RXyToywXC6mHmj2D
	 rH35hQHlgqmxK2Yerw440jZHBx9Pg8YysplaKxcG6BEXABhnnxOk8jTaTXTfSaBlTF7iJ
	 mJhKfzpHOL05ObiXrOI56kX/pwMHadc4rJKdbrrSYhA7JwX5eCwBAyHuIfC56lAhJKP9a
	 yNFwV7JVIGK7avcKg2eiwbUUTK3rwDiI/Db5P71dilbPyzihO4WRvSzlOuJVOdIsqOtdR
	 xdRvJzDNDepGxjBhduhvvo7PyBm00YAc0vzLvHsrXZjxO3aj7tHJHJCX3AxTrv7JaTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q+XnDi+N;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441B606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 10:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7441B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q+XnDi+N
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso2534477eec.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838947; x=1793443747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADMYCk3rFaWn5Xa2fjtzLl1HSNYpH0Tk9E9gqQzGpDw=;
        b=q+XnDi+NvR/kNZjBZtW2eNBZZOVJXQAHqCSHzBBPzu4TbeOt4VRHCudrncYL8EDF/5
         ZKm5JTsnc0Zy1IuB7WroqH6PMD6P1RgWZDEshwnLNk8cutI42vfipkm9gimGYKHbS2t1
         ImQLd477LTn5VlmUU9CzX2e6w5JWl9eDgsKxSJf3TdSWxRp5jkBC2mMccnqk3OzoHRf4
         tOOpaR55kY8u9Joc0OIR7DJ1t02e7g1Z+Lj1/26w8b5rDU9PBEVcpZyV0Xo6skqw4WO/
         BRxo0d3cTYPNCl3Q5sR4LVfuUCWoJ/mvHgxWdB2xKNQoNERUCplMMbgsEJVWq+uRDOKX
         55Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838947; x=1793443747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADMYCk3rFaWn5Xa2fjtzLl1HSNYpH0Tk9E9gqQzGpDw=;
        b=tQPdKFiaqiOq1z8OT8FKtMHrMusgiKikzWdkImSlNSBJUG9pMo8ZNmUaztX17fTnT2
         eew36Yvg2351weCkkiEwzBjlQywrYPpxN2aNOqPXCIMqVuBpHh421GRPDjq3WrxGBEf9
         wev2DsfsX0mMh/UqjrIBLnam9d8NovFworqMqp5rGo6l0IhLpyy2jgp0LHShelrrcx2e
         cqe1Hps4Mp+IvQSaHzWJHn8D7UvcEF5Gq9gh/iMOV3INq4nC4mDo9fNc1yQDrDr5pMps
         Mtpcb38l+CqSmr/9hXml+WW8fptQOcRxz1Lm8PVYukMu1JpxVawa42KovChtQ4fTCUUl
         UduQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq/n+zgsnY40WLzf0FV9Y4MMnxQwg+MfmI6X/OiLjE4MeTHGZII+hLEn58fMTtvGlKHlqgWRORkk9tSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJPxCfd094AlYW0AqyOQsG179v7Wwr7/48yolF4GamYhyK1Sghi
	3ipWv2m5j0G7nzi3vXbmhCrc6LrJQ1m2prJ+VJXGxhJVcRLYUwvcascN
X-Gm-Gg: AYBFou23ocfjqwyKF74cXZLW6q67CrBONtfuZFyoZsvKKKVBHM/LckBZb20YhUS8e3X
	Me1udKAErcIXdV+tUR9qJARa1A2oDQ9SoTs2B86i/Vuv/pxr8MOL2tDm8JNHkxW0KmEl4aFyiIg
	u+N8oVb8TdC0e+15+meitB05/BCzzwdvXk3tISByuPDuPt11XBZFckwgv92G6m0HhnyBPMbzVUK
	jI+aV11qAxv3k95cbKLqhCI3zLV6WPOOEisbXKOvJa1FLT5HQbdaYUbQ6MG5L5B26XvZCv0k51T
	EHzUeRt+zPPiLPQPQ8PE6MDrc51iXj5o5qKubdHwjPya/ao19DHV9V7cz1SXK5fAS1KCqCJUC+H
	5uwD/v803qHLa2sEr4h4VYen6iP7dRQ8uoRYCklDBvmz8t1uf6Em+R1PMJzJCBS6b6HkH5l7PQr
	IH0mcPewM40z/+8GHH3RSoecnPhuonqB0tHc1UbvOhgnUb1rbdinmszso/ki6KAe1yA2abGQUk1
	q7S+3NqkTl+I9IEvEn604mTvOFNuPNDfxq4qtaoXpLPh2/6p/Fu3xtRcJ8W9C/LtK+C+Y8MSASG
	qx1y0gH/8FunjmCBkh8T
X-Received: by 2002:a05:7300:8816:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-369e9306c7emr1874724eec.30.1792838947444;
        Sat, 24 Oct 2026 03:49:07 -0700 (PDT)
Received: from flipper.lan (2403-580b-35b2-8--9d8.ip6.aussiebb.net. [2403:580b:35b2:8::9d8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee72c0sm9300668eec.29.2026.10.24.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:49:06 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Sen Wang <sen@ti.com>,
	linux-sound@vger.kernel.org
Subject: tas2783-sdw: firmware names and I/V-sense capture on HP 8EA1
Date: Sat, 24 Oct 2026 20:49:01 +1000
Message-ID: <20261024104901.9731-1-kelvmod@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi Baojun,

Thanks for the TAS2783 firmware and the UCM profile. With kernel 7.3 the
speakers on my HP OmniBook X Flip 14 (board 8EA1, two TAS2783 on link 0,
uids 9 and C) now work in stereo.

Two small things:

1. linux-firmware commit 43cc9de7 ships 8EA1 (and 8EA2, 8EA4-8EA8, 9013,
   9014, 9015, 9026) only with four-field names, for example
   ti/audio/tas2783/8EA1-0-0-0x9.bin. tas2783-sdw.c in 7.3 and master
   still requests "%04X-%1X-%s%1X.bin", for example 8EA1-0-0x9.bin, so
   the firmware is not found without local symlinks. What does the third
   field mean? Should the driver build it, or should linux-firmware add
   three-field links?

2. The I/V-sense capture SDW0-PIN4-CAPTURE-SmartAmp cannot be opened:

     slave-tas2783 sdw:0:0:0102:0000:01:c: port 2 not supported for TX

   PipeWire probes every PCM at session start, so this logs about 120
   errors per boot. Is this capture expected to work on this board?

I am happy to test patches.

Thanks,
Kel
