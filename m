Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429331;
	b=FuJb0IpGfVBUc2BXcY3JDqc4dhfkpHuMw+zqWkw24tixuWIK/BJDvqDsXYfrqqGdYmiA
	 mSvr531alQ44UVjVasClmy+BZZ4z6U/dHqz1K8XhVk7FY4E1cdfl4XvG9VwowjQbOkt+r
	 tylVFUS5x42kJxbslvSpYl2p3E8qAXBNYLn91/YXsSsYa7qt5GBed8he7R6rpGn7zC1ON
	 87Yu3o/QHdjCYxkoMpV6NvAGDl4taHX6x7d5VFRI6Qe14bIf93oD2NM8h73No6MomwJQs
	 7iRNNo0vNX51Jmh98R473FWf8H9zrExK82wnH0fcHnAsGQ5J2n7mwqovDhN2nPQab6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
	b=c3z2xNqOlcHRy290HNzZznuVA+mWEna8DN9+zBIDv7xmSCnFY1sDvm3lMAO8D0tORLW3
	 ZDC5VRWu3AAJUkLvO6XGu43p2PvmxLz7n+tSSnJGqlVYRCKsVRb6MIPZhxWGEsTTmdo4W
	 ShAEYv4n3m6/76/8sRSJusk2f+Fm+3uug+lIGr8liwzehmJ5yhhwC5yN0b7VoqrTgeCUF
	 AjQxUBuNQGDF5e+h5vfuhG7SjC8p6rrZIFXSrlXJNf/rjCuLO/dk/qxkDJTHwOuTOSj9G
	 OX948/8fp1iTnd/PuvbjLMJRcs5RD0HApnfuEYnPqipo1sQ2L79+I2msIUQTJ34Kbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ocTiixAb;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA360A260C
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 17:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBA360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ocTiixAb
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1426592a91.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429330; x=1793034130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
        b=ocTiixAbjoYtkjRsCv9M0YKgBpnrHWSeHIIkjyjbhquGpkRsl8UMyaFPwDR7MLhJsQ
         Sr7aMcUBEUqnEuXDZTr7qAlCFByQllvPI+WpqNSCaiRl1DMGhpyMv1xvzCx3lm4S9H5X
         lCoj6ec881I7WQBMs/cbTgGDwU+qt489uMT1RAWSppIEAofBa45rbSW9lH88afJ8CqqN
         4icg5rnrzIQuuc0CLuBpCSU2k6nnQ9YyrmGVy88bXEMqBuXHNKU7Xw2NPF5mSiO93LKI
         8lNQ/zcr+7p9S76HCBrrrKEV/XlQWo7Zvdck/r68ni4/VmUdZz9qdso13pocoPYfNRwR
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429330; x=1793034130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
        b=AUc3zGyQd4PBmSIJCQaPIDqrRxcDps+gVNo6uvAT1Z9zH3vEyis9vsTM6GvVSGjh9U
         jGVdb2ZR09IcAGgED01756/GxMnaHCjnWaFKLcS11i8CcnL5hCcK9ymkD0Wyp/1IdbKT
         9K8LFlVWDMb29dUuCpmDv8XiF5JqDtAMk8Fm5etLMoxNdjpN9QmG1gWjnX7hgI086HOD
         WcD8BQCdL6DUunyVyu2MZNhsxh6JisJCUR9tdXlc4QcDKShKPnNd3LADUsGQeH17AEO4
         P8cCRJeORebXap66NTOrH3YOsiVRwyD0GscVKk6nGYJWU6Rg+nnnVvUqo2cZk7WYr5Rw
         fUig==
X-Forwarded-Encrypted: i=1; AKwUvBxBLp8q9uP+h+D3xSbIvU+4GJlGfVpw74PXt++WPNJMbnpgpdfR48XyRI5GDqLLHcd2/iezcwLN++MfaQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7pS9A4Ul8yd/V8H8FJytZiGa/1TGVvfKZpTfyE+FSqeFD14Et
	RZ9jrLO2IagTfDn9VxmWokcCa2mzm4QU65oi7mYGenIe+eGe8dkxUQIBkSeOJ2qc2jk=
X-Gm-Gg: AYBFou0zPWJHpbUcEmnWKeqjcTFZ7ldC3aDGA596eCiic/BuCDVeeD9ePSTqsAOrSKG
	vEYXZn/mCGPd3hwPUPF9VU54BOTRrstz5TPioeTOoWY8FWqtjE4DoZqIqYA3iayjrmHBRgqZyxv
	pNhjqQJcKh+ggalIiz2lO4i0OIkKj6SWR5QK8m3ZTKZNtRwesMvRkyK/bHumcJ6XvX5Yh20fKYS
	aodmcVO11Fe96Ya21SLooeukZT1u5yGS2n8g2KEqZkw7RQMNyj+UdTobl29cds4jdoOJ5iTLDC/
	3txIJQk+0fVPzsLOtgqgW8UqOQFX18478wA8amiKH5N9tyPsRrMG0BbGzdGcPGZtgKn25LK4Z3y
	p+gtGPL+lOJM8zJamLx6t7n0Hvj+UqZihUweua/+HfKjOib0VDFU44PcxjebhcjvL2yANXEBKKR
	Q282T7EzWmHMotAY+XSQzsh0xEW8xbjgzdRpLj2lA2HDbGePfpqNC8099e28EpltAFySwkeooPS
	QHv/B/Ffk2YDuruzNrMz48LeuBIArj+y7jCo8Z4lmhok6a9PWXk02yUGXWgyB5JpJUGibtY
X-Received: by 2002:a17:90b:28c8:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3acef5f1ccdmr7554752a91.56.1792429330017;
        Mon, 19 Oct 2026 10:02:10 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4317511a12.17.2026.10.19.10.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:08 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soundwire: roll back failed master registration
Date: Tue, 20 Oct 2026 02:02:01 +0900
Message-ID: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
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

A failed master registration can leave partial port allocations in the
SoundWire core. The Qualcomm driver also ignores registration errors and
can retain reservations from a failed attempt, so hw_params may report
success with incomplete master registration.

Patch 1 makes core master port allocation atomic and restores the state
changed by failed configuration. Patch 2 depends on patch 1 and restores
the Qualcomm port bitmap before propagating the registration error.
Please apply the patches in this order.

Tested with ARM64 QEMU KUnit through real SoundWire registration APIs,
Qualcomm hw_params and the ASoC wrapper, using synthetic devices and
task-scoped allocation failure injection. The baseline and a return-only
alternative each pass 2 of 8 tests; the complete series passes all 8.
KASAN and lockdep were enabled. Product-only ARM64 LLVM W=1 SoundWire
object builds and strict checkpatch also pass. No physical Qualcomm
SoundWire hardware or audio playback/capture was tested.

Baek Kyu, Kim (2):
  soundwire: stream: roll back failed master registration
  soundwire: qcom: restore port reservations on registration failure

drivers/soundwire/qcom.c   | 26 ++++++++++++++------------
 drivers/soundwire/stream.c | 35 +++++++++++++++++++++++++++++------
 2 files changed, 43 insertions(+), 18 deletions(-)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
