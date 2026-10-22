Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667574;
	b=DwFVm0Yi3iuuVAx3SmYjoslLErPfKeVHsiADTtYFbZnKsU7cihMSbyIjWhkzR45mj/r6
	 WHREe08w4fxMFqeQ/7/ENsypqCgC0mA+mkfGDpp4yB0yMXDiJ4HthffW/K//jVXfbkS0s
	 rs9027+E+67NexPlDhyyZUKYqBi2GGwlmmGFhpr9YBtv6jVRazJksR1YoGFBRrqxesJ+L
	 eQl8jxV8EzyeIWq1spwxt35BYMfvXd8d8bIuiRmZJLBaBQ+NrFkOJM5lwAK3QRW7g8xSb
	 iNX/R/URX85lzlDEVCZZsqHlXrcepMDopq2I+UDTvsYwK9+doAZpn9ib2WY1OESUKyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
	b=kdFSL7RPeESz+gTGaL3Nue0mtv3gqONym7g0XE5gOe4XxgJRplzqWHAoqs+XfwkVoPZM
	 yRU2CCZlH6psVKPXOryQb5UzVHRvk9/ybaCHgxDHS7iC6qw1OrcrHbmv+vcb9yNdwxb4M
	 IR4/ykd4N4qBq/wSmicehRPiKDZ66+wOzHXex+2JgXvDzoGNqE4XWSE7ZAMlVdRaWr2sN
	 3/Mwd81HZjN9AjyKew+bAMqarAyJCH48KeSlEGUFj4UkPWC85zhyYlFPI8DzGYaj874sd
	 htTNcyKIuXmlBHn7aLc409k0zZjQ8ogcwnJTuwacEwP2SqX4w4UQ5dpgE3Fj15OAr6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTQ4KX2;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C7606A31D
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 11:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTQ4KX2
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35943f55c06so1030464eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667573; x=1793272373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
        b=ZcTQ4KX2ntDRRIv4SBZYFcVfL7jnVW4UQvhEXGWiWO2WaAXbf6L074aFxyEF5iD3VU
         4TFuic1S+pCJGiSI35lB4I7yYkRHGoOHkXdWSQQR4U3pV/n4zJyPtm5tJ9to/ZtLygIL
         le71bgQxKUPJ3MyAo6g+jM3qtoi2NVbf5Tu1U4XLU3wq22zUyKosor89B0sLXvg0yDIV
         3DGnLQGNFIpxfp8p3/AE3QP52gMje/KQmxEVfnDkaKCDVcPIHw+3dGzlspUpR5Wj1XX5
         GsY/RV6Ly2TXnB+77J5z05vj6zruUmcCqE0FNG9s5P/kBrLI+wnh5D1vQfOLRbScC5sV
         x3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667573; x=1793272373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
        b=oYvPKpMoyzUZwKRu80JFX7qHeVg+IinMzTVqCdSsOAixWbTM2NOT4DtQDjSBSlF4Hg
         073DxzmlocfeVttSebwFNR3va7Ow/srSQo4dvW9HckLb/SdCHPao9uRak5FX6QcFfw+M
         w57XnF9Te0mQXGb8tosH2p/nWokIx4tROycjPZj0M8CW1cS8LzeltBe07XI0WAsPLAxi
         SiyY4qQkrTnfFtLLj2eRmrgh1/F0V7hohmfwkGigxVdEHd9+EsYvCCpZFUsBNbWw+jZs
         naK+efhyzKVpmrJR0GPgSGafM3wsWIzcTRr7KDcDr5Kq9wFWx9IjDwW0akiDISHYqi8E
         vssw==
X-Forwarded-Encrypted: i=1; AKwUvBxaG6nMWrDCQtGurBuPyFL1M0AOYuGr7mwLQi6k/FrrC9051ivBVrb0RR/1dSDeotbSyQWdfEqcHg8NWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqCIDCfI5MVULEopVZvdRiX4hlBOJLskhX5+rZ34NNybqneulo
	pv5QyoxlKTJVLgGkkBWTdBPzsbjPu0jT7M4DxToJGxpn+Wu314oJWjJg
X-Gm-Gg: AYBFou3sSwI6SVEhP4jgdPAwdmdL5rIsXPK0KrCkogxgnGJf2bJUAHInMaFqxS1oxjF
	6SJ99luRWjrA4r3OvK0yhGPyHTAkKKDCZ9Og+7nFwbwtFjegyt0LdgaD0ZsEHDcQ1+085xerrXp
	FNlIhB334FVYc2iV7Qx2K4zya6QHyN3WyomI1IjMCVSVK4xhN96UehFQrJgSi6zvQ7SoeglWAVC
	JNGNybTncRBNGaLethtmItDDwdZHWB4rUYIxVGDbWhocrwebliEGzsQSbtryEZ7+oMwQ83V0kmN
	eEN/KDLBnhHcMvtOp0oYexu0jfcMAh8Bd2OUZROpCO2gpisutDjsPZ4ilM5UceKe8ZGAZZhPMNJ
	DrPA5t67YEevsp4hg8C33KuSpoDngKVyw34bKK5xtrYVpusMmMNLXVYTsqHwwHtF1Pv9YC1CS2+
	d4ulw4mLPCwAF0Jf5MhWgBAyhKpqlFxLOJVPV8/U1Su7nHCSGvG+NE9k8tYOaBYAzyZU7g1AzpT
	oWzFQPSQ+o1YJz00wnNqdggj538Yq6ycFzifhy2Y1e4cGpxV2ROYBrNoNwLk46E0dybyPqpRDNc
	LNQRZHBE7e3zbpiP48iBGbJjnSetdawAzX40709bfDoqZJ81NW44UwgU6lv1Lpfwh1SGmjovECE
	bFS3zIiGX1RT9
X-Received: by 2002:a05:7301:4392:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-368af6a28c6mr2581832eec.12.1792667572921;
        Thu, 22 Oct 2026 04:12:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:12:52 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/3] selftests: ALSA: pcmtest: Test error injection and pause
Date: Thu, 22 Oct 2026 20:12:41 +0900
Message-ID: <cover.1792660433.git.sammiee5311@gmail.com>
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

The pcmtest driver can return errors from its PCM callbacks and
supports pause, but the selftest covers neither. This series adds tests
for both.

Patch 1 moves the capture data check into a helper, so patch 3 can
reuse it. Patch 2 tests each inject_*_err parameter. Patch 3 tests
pausing a capture stream.

Tested on x86_64 with the sound/for-next driver, built for a 6.17 host.
All 10 tests pass in three runs. To check that the pause test catches
real bugs, I loaded two broken drivers. One keeps running on PAUSE_PUSH.
The other restarts the data on PAUSE_RELEASE. Only capture_pause fails
on each.

HyeongJun An (3):
  selftests: ALSA: pcmtest: Move the capture data check into a helper
  selftests: ALSA: pcmtest: Test errors from the PCM callbacks
  selftests: ALSA: pcmtest: Test pausing a capture stream

 .../selftests/alsa/test-pcmtest-driver.c      | 167 +++++++++++++++++-
 1 file changed, 158 insertions(+), 9 deletions(-)

-- 
2.43.0

