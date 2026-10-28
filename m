Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184164;
	b=Fh8fsBtouXtPqa7YoAC+RJk190mIKY6C6eTFznAqd4UtpFcoxzmvdbVJ66v0sD1r/8O/
	 LuKJvBDxuSOwp0FbZkWeVH3KYOT8K07DG8HzxnKG3tFQbIStcZ4epCze+knLsFlp60srI
	 7Dlj3LqkrL12n3zHXpbrBp+RZZqd3v2p/fIBGpkSlUiKFseqbxhXOifdOFRORPVqI3k2C
	 alHSMCFwAZwj18avwNtwpYzLNYu7dnNxwqeRU7xY2dWdfjojPPoTg0NVH14cdwHn0ZcK3
	 XOZBhyhDz9jlodi2XdOQbXaAtJ7gG24pu4lNiuT5lFuRu2ZgIKUdPVZjV7auNapG+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6tLbfq+cZnF/5nhM51bRIh+T/6W7SJLuUTl2FfRow+4=;
	b=xHVvNiHtUTit0dQZBh4Gz2YhFq5HSxCs0EcKXqYZv/pvBwv0UoKO8XXdC2pdkcokMu+z
	 VKFjpZS4cfnHc9F7fUfIdDrUK1/tSUnelIZkkYQFRHOu9ZwSWcL8T1k6tzBoQ0iyhmxQ0
	 qdiaHt1GXAAw6KvxZe+NCrxwE8v4Nu/+zugptl9UqPMHizPiVRfjfeiZBTQZTOWafuhEs
	 cp9lIQASnBAifuKCaeSNsPk5cftcRLea8NtJmTiBCAZNOVBpy/hdmXsrcWWc1+k+AqrXZ
	 2BJd70dFwHFMJp5vZTcmstYT2ibi1FJBronlY8GWJdgHjMgltUPCbPftebY9G3/jwWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvmYRTsO;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2984A606A32C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2984A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvmYRTsO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so1166585eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184163; x=1793788963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tLbfq+cZnF/5nhM51bRIh+T/6W7SJLuUTl2FfRow+4=;
        b=cvmYRTsO6ZCeiu7WOEjMntIFpn/wevrWu1dNqSQtOjB1tbyGo9TWg7SsTHAD9v9310
         w2giSBPR/A/sTN8ddsvj7A9GEBLzSiBdhCajKcSj9XAb5tW5Qj6WXKUcSwhBZ1WNzeqm
         QpHOM9/p8wqQ1tRZ0wGkUx5u5lDfD8Vm944+j1ygWINLvj2NgBY0Oshx0n/ftWw1g2DE
         fhl47EjH2TsRJj6lw1U2oNqqNIihhoVc3rZ1lfgn4FV4ikAKGq6dsruF6jzalUILjTGq
         z1EsD+ZMxWcbmTKRIe/XNaDAGNtSBGgexu/tkWs/v0LQZw6/Qk1Lazrzi7Twfwmczviq
         glSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184163; x=1793788963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tLbfq+cZnF/5nhM51bRIh+T/6W7SJLuUTl2FfRow+4=;
        b=X398mLJjPmiOX+5l/+S1tgowmGy8hSpGBPtzC3Ft7pZpnCmWq9uWlB9AK5I158SC1x
         QdRbQaBuNdwxa+tHRIGct/BooD3jqJMtPLf9rRZBFpPa+k/P1LYga9mYdkw9T2soLNMd
         pAeIN/8aeZxuKhC0Bl/xW6QRSjro4JtXDBrd0K/eIXd99jTiWio5lRdud9Zmwj2GcZ8z
         jX4Xqws4Suyjh1pK7TLSYzZQgBguC8zAkcSzbzzUtlf8Cb4muYek9NARYExySgKQqarF
         3D1fw+p+RcEMiG/7hazm9NxtkC5QR6tp4BFJbBeURPJKxF+qMzF9rp0Kn4b6Jf6gU3v7
         lVSw==
X-Forwarded-Encrypted: i=1; AKwUvBxvzZ8syx+gioNvNBXuUoyUrVnzK4YgIH/2gxdX1LB18aiD5G0St39zL52ZShjcDOy0xFcRJCtIsAiXvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJt1MjgdaFM6VwUmgcBoHK8t/k2Sz0fcDGGQJBDYKLBplduJksx
	HFSBZp8zxkpKlu0CHgsdFUQy6RpmUtN5OUE92Kmg8TuJpoF1xb9nuGdX
X-Gm-Gg: AYBFou1YUjXL8gMTijdgo0DL8CPksxSF4LisTlUXTrO8XncrJ1cNhPJQXkVZGaM31WZ
	Z4FkpzzaY/04YNE4R2m2RxcmV9eCyzqcr5O4u08ULfhIAdefGIEVe3+du7/9NGkKL8ZIZNLVpac
	VEsrz7HCUdiYLEbqf0WWP9l3UsNdyPwMonMGEUMOzSrw3e3goz2gECKWIuP8JUc95zJl2asfcmn
	v60H6CMhyEn3XjZexRvG8vRDobJ5b3LywX4GsHYDDrYVWs9h2Lp2Uz2SeHgfpdwNwwWZl+YEfcC
	s6TpEr69ERNhGxlGWpagyeVsuvmfm4l1/pXHW7v4N6mwXVT0EZm8OTXEWqXAOzIboRgpBGWNL1u
	47dIxd7AMa4aI3HWJUIHN+9ea8cNLp2uXS9Z5cSMOLvBKXVwS7DaPk7WfAPPazCrrSylhln1uJp
	A9to+aAlu0Zt31B2JYcldc+EvQ4be91IjGnXRlRena1QYe5fBw95lFE9l+rztGraBkCLOqpmMe2
	6YArQODhlG/dJ/QqaF7YFphevRK8yj51yvvypjt1EgA+3AjF9Kkf6pJE0U9yhR1WLM90vMehIBx
	Odj+LY9AcTqC0N2+SK4HGaYCXEpa0R9DAW7Q9sFwP/Eo/8WDeST4j+WiuW60hDE9TKBR6SAle1m
	Fd1iI0uaAqAGJUhvkZBw4dWSsykiXywCAt8G1mwGGquIm
X-Received: by 2002:a05:693c:41d7:20b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a20115c41mr2784532eec.0.1793184163100;
        Wed, 28 Oct 2026 03:42:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7531469eec.8.2026.10.28.03.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: img: img-i2s-in: Fix clock leak on probe failure
Date: Wed, 28 Oct 2026 17:42:22 +0700
Message-ID: <20261028104223.27007-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104223.27007-1-phucduc.bui@gmail.com>
References: <20261028104223.27007-1-phucduc.bui@gmail.com>
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

The error path of img_i2s_in_probe() only suspends the device by hand
when runtime PM is not enabled, and otherwise relies on the
asynchronous suspend request queued by pm_runtime_put(). The
pm_runtime_disable() call that follows cancels that request if it is
still pending, leaving the sys clock enabled. This happens in particular
when the reset control lookup returns -EPROBE_DEFER.

Disable runtime PM first and then suspend the device by hand if it is
not suspended, as img_i2s_in_dev_remove() does. On the -EPROBE_DEFER
path, use pm_runtime_put_noidle() instead of pm_runtime_put(), as there
is no point in queuing a suspend request that gets cancelled right away.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-i2s-in.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index a0c87e2a9b30..0c136dca186c 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -490,7 +490,7 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	if (IS_ERR(rst)) {
 		if (PTR_ERR(rst) == -EPROBE_DEFER) {
 			ret = -EPROBE_DEFER;
-			pm_runtime_put(&pdev->dev);
+			pm_runtime_put_noidle(&pdev->dev);
 			goto err_suspend;
 		}
 
@@ -534,8 +534,12 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	return 0;
 
 err_suspend:
-	if (!pm_runtime_enabled(&pdev->dev))
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_i2s_in_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

