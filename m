Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184174;
	b=CXy/5FJHv0CW/Y+B4VXyepsbjnDefA9B1Ebk1CyEDjb8fy99xWSLJnWSw7GHNSz79x6v
	 U2Kr+zIdBF7mZv/pVhvDm19SUlUCuRy/Fwh92fmSGPCVWu4Hfq6Jx+3SCpxvXjHL1d5H8
	 yjWrn9yL4vzrH5qiy/Rgi0ndzugVg3rQsyCbjeFvnpR/+7REyEv/X4QOv8UDtzbyoOOU6
	 oQEnADO9fglStFa4ukPHe/qBGhXz4VIWlQgXbopVsT5IsNg5dbZC64+R7A++BmePU2Ime
	 GpBfudS+ZE2kPzieEJHmmHKsyzlYh9P8XJwThLKqvHwpMKRAfuOoRlE/Ls8RwWofc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CHKlt9EiCZBoeJAf8lBIIGBUp/VrvuHtQnHUB1Jp6wo=;
	b=Q8XKNGz2z6STU4Crn5z7iOLobmlT0zE3c/OP72/bnrKqPJZtcT5pKQj3FxhNS60IQE1b
	 JM07+oInEBuA7lHVVZsgG2nyAuRfrpYWNK7ZyT5pHDXfVkazC9xXntVXcvKpUJ3v8Hc38
	 LhnPeFUJIGm/oIUu4BGBt1anSm+9xpKAXutX3+DtNwTDamQdWX5bCQL8Ric44Gk/zwwZ1
	 bxxc4Khek9wIoqwu/zjZcXynQgb++4ornOFAb9ZH4b3Yg5MWrynpz5phNHtTvdps1NyqF
	 vPSd1HH4Jp3UgZbd6JMScAbR61g73p2ffHTw/FOrmbzySOs3tUGyKe5U2vHjklwnvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0L04td+;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402BB606A324
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 402BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0L04td+
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso943290eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184173; x=1793788973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHKlt9EiCZBoeJAf8lBIIGBUp/VrvuHtQnHUB1Jp6wo=;
        b=t0L04td+ucOxAZJqC2/wwirF8OMhgrmv3OjGzBf3vaZM7KhCerUIlyH1p2bythR+nW
         0HmnFOW3cOg6+KQO0FV4BezZNPYBXy5g6X36aE5F0+BwPHOFMkTXn2KMz+TTPktegUDH
         nIMZ6C9yBZCDAeezY+bH0mgd2gMGdaU2aOL4rf/0/e3bbGrp2j03Kygqp/wXEZI2PLXd
         O64tQYlqxGho7LlVy+rqBn3QubURgRlVZdHBvkZnn1hTZ/mqa34vnBh6iZsCfqOIticU
         Jwq1t9ttrVwsC2YwOQjJucaBzXY3IcYBZwbFhOeC5kMvXYt/c9ILTXkbDDcN6tJThxPX
         j1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184173; x=1793788973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHKlt9EiCZBoeJAf8lBIIGBUp/VrvuHtQnHUB1Jp6wo=;
        b=RRMLlkPruDuG+SwR0PCgaHuhhkZq6Qu2da4DTmm7iwgwxYIRjp/frU4qT2Xk4xGZPH
         uJ/vPuvOmq33qQIWyikLFqxXLWK+B71r5HMuKsTZmnjIxPxk4L2uie6cfRny3q+2gX/p
         o/QoPfFKKJBwoEhP/45TFj9DFDesKSp1IJTDUhakgUZWCn/PTm216xxW3HxrBvR48WN2
         Rt4hf8x/ZSn55waEnvgoTyT+YawKScmGO60tuYj6a24RR0doquA1Lb4nPw9RSEIR3p12
         Ru5m3qfx7i0/u59O+/lvXHL3iygJifX6L0pK2zhegboaKI6bdfZDgwOP1cnx+bsBedrx
         XYnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqO2OYwezYJTC636tcblJLrZAtdG08BciJBzkFIiqVYWP2J0a7lqqtqfMdynqQrfGUmkyCf65Vq2tvhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8tIUi5gO497FoYthSR8UtJ9JyFLU93IJKT9pDvY5DU1Q2q3hq
	FHkG9kcXLfi5gIHEWFG2wPwL9Nmxx5dnVXISiLdeKtJ1ZUnZIBRN7lZk
X-Gm-Gg: AYBFou1tlpfEdv7XHxz0/ZGOfnVaXRUORStZJ4OqJgHwF7mCu07/5Rft6fm6t6wLIjz
	s0GiSVvfQqaQ76s5ky3YY30LmCUtfJovzMRjywtuDubTtDr11Htm4H5U7NxkF55Dzkr1zIhq9u1
	QJdYSB8KhEsfLuWcoH1Yytd89A/Z231EPOp5fiEuNgqMzizdbf3uXR9ibHMaV0TVSZIXTLqscJW
	Kh9atrlKgyp7lsID2mV3atkmqbGBOIysukm+tCN6j5gJ3X/9PJn0fffPXPPoKaMitXh+5M2Xe9h
	1wx60Yx1yYst54KRopaKxgPSaoEnWPXRjIafHk6gkcxhZX8wgRhON/YW+kN2KQOf0l1aWSIiseQ
	5WvxZCcXMfS7YQQ3tcviRCNOePFooI7TmPked7eNfcbMJZh3mbCOHARWizqZKGej0WNrwWbgqYi
	ePL4BlhE3KEna52ubVmAwZcy/6JfYibvcOdaES1uhEEAIWsPKicgG92fqNVMZ0HHAO/Irzw3KKX
	a+jlLa3DP3mmZ8WE/GJvUiuEsFKJk65NX4wEm56rohLjsCcsG8cME17+7lCh0wRZ9/4mnbDnt1q
	sMFnrYqHhtBQ3+nh/yo40ufWx02LgE/OrVXozHxXadm4JyDHL0NDixJ0T6nTCf6rJuF0FPysHBH
	lEJwmYR7lPNoqZ4Kk2BlugXIlDo0IQcKDKgOcS4QIew3a
X-Received: by 2002:a05:7300:d209:b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a201080b4mr3009186eec.23.1793184173342;
        Wed, 28 Oct 2026 03:42:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7531469eec.8.2026.10.28.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: img: img-spdif-in: Fix clock leak on probe failure
Date: Wed, 28 Oct 2026 17:42:23 +0700
Message-ID: <20261028104223.27007-3-phucduc.bui@gmail.com>
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

The error path of img_spdif_in_probe() only suspends the device by hand
when runtime PM is not enabled, and otherwise relies on the asynchronous
suspend request queued by pm_runtime_put(). The pm_runtime_disable()
call that follows cancels that request if it is still pending, leaving
the sys clock enabled. This happens in particular when the reset
control lookup returns -EPROBE_DEFER.

Disable runtime PM first and then suspend the device by hand if it is
not suspended, as img_spdif_in_dev_remove() does. On the -EPROBE_DEFER
path, call pm_runtime_put_noidle() directly and drop the err_pm_put
label, as there is no point in queuing a suspend request that gets
cancelled right away.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-spdif-in.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index b630644f20cc..d60eb1da4ecd 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -722,7 +722,8 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 	if (IS_ERR(rst)) {
 		if (PTR_ERR(rst) == -EPROBE_DEFER) {
 			ret = -EPROBE_DEFER;
-			goto err_pm_put;
+			pm_runtime_put_noidle(&pdev->dev);
+			goto err_suspend;
 		}
 		dev_dbg(dev, "No top level reset found\n");
 		img_spdif_in_writel(spdif, IMG_SPDIF_IN_SOFT_RESET_MASK,
@@ -763,11 +764,13 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(&pdev->dev);
 err_suspend:
-	if (!pm_runtime_enabled(&pdev->dev))
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_spdif_in_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

