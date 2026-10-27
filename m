Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097874;
	b=X2kT9EZwCxU1sikdaSNJPeYt37gtMUp7hXcbKMZzYvg8kdZD0LRU9MfmdjzXaiWnun1j
	 /oMz5dHrM9IeL546uTK5QXhZuGA7v/rz2kAEwCNEztUYX2i6rCl65RMjPQSkesFypAT+1
	 WIFkLKMQRx6hIWDPdj6YZxWvqhuPwQYSu2ZfMHn4xnE75Czg2VpkzJMlUBxHlcxgeD2zB
	 z7dhVriO8AQh+vmTa4UMEif8rPbSks8FJMEOJ31Y6Of+LTOqDKAKtffdvgNfai01epPzh
	 LUnj9hjkki4rMFPVa5ovjwSle1mAWaHlIIcS6v3+5Cr/UWHCxeiWn4FxY9UPRHdFd2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C8ZSmOOvazee2T+kPnFVJUYhcuIYJtaOIOdwT+PAc4g=;
	b=b936IBgU3KBwaBFhrM/Hpi/+dtVrToY6fPOXdNEy6otL6t8Y3NJyZlcwPaoEhiAgHXoW
	 371huhUOrAKdcExA0Kw+fE5XVjtKmcDkT52D42qh08ejr1WMilXogNs2W0ehn++AH3BDD
	 dKDPWi4ZhUNn1iv7GSDlfXRgEzOphNNhFSXTGM7RxmPSWUvXspGTK+pEa9M4hu0gb5968
	 iIAdjIg8n3zsTe1JNjMMDyzSxKpeburyeAew1KKyvyr50gTfECzpaFzYPtGvXf52Ka5JK
	 VfVER99NV931Lr6Lqx5eiaacF77fHUy1jdg8srDruFeMsDOg//yRDfGSlOtexKRQbcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YCee+efC;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A793606A321
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A793606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YCee+efC
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso655282a12.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097874; x=1793702674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8ZSmOOvazee2T+kPnFVJUYhcuIYJtaOIOdwT+PAc4g=;
        b=YCee+efCWlNsiz8MAXSD5IdiQkSIhmjwXA/O7QtM4uH6/cIWEZi8oDjwK9kIYDEfK0
         UwQPdClJKUN/Aq7P6YIUTcX+eP15P/SSNOgwzvwn+SrFUrJbLoCrs9MgZIyuMeRLMXyk
         mSJ6jaDnTPbn44v5G2/CEyQx390NYGBdyx5xYivSfQFNEDw6qvP4cY6EKprLdLOz2FpT
         WLvoapVtptJnpEsUSlXUSa1XDVoF9En8JWyezgK/RNEoX0vbBFxuDUmJGlfAWSmKCqVW
         PRa0Qots/UeKoC+B6KZLXM37zF6k86KKD6wh+sRDTjGsA2ZrO6jv9Bpfb81Mk4DzMiNY
         HP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097874; x=1793702674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8ZSmOOvazee2T+kPnFVJUYhcuIYJtaOIOdwT+PAc4g=;
        b=j2nnS1HjKXnv+TmjXFzvvnhIqMUiDPeArslckLJ3GoQYbCoJR0LCK79TGxheF6mnzJ
         CmQ417Dyf48NGnUpeY9iQMfjbFSVri8ib3DSoVRb9PGcvno4HX3DckYnjzDmaEK9wK+F
         5z2W94SfQT40HgZHcP6dabfyAFtHihfGbtEnqa+jxjkIeO3GrqP+hNZzFPNjo4m/mxzC
         Xt0K4dH3mGkSzw3nF8OT6+RnF5sp0tgZdD6GNF6Gbwj8Vu8Td9vWrSOZ+EcpAuvUmK+x
         +u05kXomFdomPPC1tkz4LLXw7ubOVjO4wpUn+y8MPHBXlYagK+N8OB1jDGE2STaaGvo+
         Bx3g==
X-Forwarded-Encrypted: i=1; AKwUvBw7T5jJC00VBzdfcU358xzGSVnm/5Sh6kkCYq5sjCZ3HAERTvPHepUjgCCKZLbSfPK8I3hTTnqmXq4EyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI6fCYy53znA8aAZ7a1QehD4eiu8OBXBM2YS9PO5ehvLjshm0ie
	NoJwcL0pk80HgPKkeGKR9B2GUGDGfJQJixyG8o7lc4TydJ5zVmmAnpPM
X-Gm-Gg: AYBFou0hEHzdSNmI8kOTOpONAyGWlvyMvsuOulFPcz0X/gZ6v1JVVihU2AuET0aC5My
	ZwFXssvfIkMu8QUeyg5mkIzrxcgD0PNn65Hat4u64Iy5Hk4CXeT6oVLHvPlrHUx4k9zu14C1uiu
	pjHKCSQ6oCKlqHkoB2J57lR47Xy2VA/S8yydVVoVi9A7n5tUlyfL3YQqadPuwKC0qPACLwA9JRy
	PhdcgA2RbmgK4RMxCS6icsNyEsDRkCSB8tjfGV3n6ZsymoJ8zfc1LscdIXy+10r+IcxgE4nVqXV
	o/SvravnCOYWN7f5dkZl/4ciOP502xVcIcf4Tsb9tqi6LO6kMh3DCaCJ4Ua1iIX19gChNThnKVp
	J+6c3FcibwjaMgkTD0JbAX2OxQffPTDKZ08EbIyHLOjU1OucSkbwtmfAQ7CZIQJoAcQSUsidBIe
	1amxZXr+1IFQ39XbCuazKyhiQ1l7EIQuEUybeI/jdpFhNyRHyViy7qzPh4d9EvgsAhaN3uasPBx
	8vYdn4X52GwG5cS9Ybbay8SOUYYP+KSFg5mT3BAF3nokpYotyAvvVeLYz11rahFWWL6YHGwTOZG
	bGH3vLfsPA3ay/54hH3nBk8pfNtphwTXI4r9TB4iioxLJYEsKCqNjddf9vP26DqRCyxXD74g5FA
	9HMwFJ07bg9lcKyNdFejhTqTpi313zqJEXbBrvOoxC/US
X-Received: by 2002:a17:90b:3143:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3adea9dca65mr7683767a91.13.1793097873811;
        Tue, 27 Oct 2026 03:44:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm7187525ad.68.2026.10.27.03.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: img: img-i2s-out: Fix double clock disable on probe failure
Date: Tue, 27 Oct 2026 17:44:16 +0700
Message-ID: <20261027104417.7150-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027104417.7150-1-phucduc.bui@gmail.com>
References: <20261027104417.7150-1-phucduc.bui@gmail.com>
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

If registering the component or the PCM fails, the error path of
img_i2s_out_probe() checks the runtime PM status and suspends the device
by hand before calling pm_runtime_disable(). By then, the asynchronous
suspend request queued by pm_runtime_put() may still be pending or
running, so the suspend callback can run twice and disable the ref and
sys clocks twice.

Disable runtime PM first, as img_i2s_out_dev_remove() does. This cancels
the suspend request queued by pm_runtime_put() if it is still pending,
or waits for it to finish if it is already running, so the status is
stable when checked and the suspend callback runs only once.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-i2s-out.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index caa7870dbec6..2aa8182d561d 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -535,8 +535,12 @@ static int img_i2s_out_probe(struct platform_device *pdev)
 	return 0;
 
 err_suspend:
+	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_i2s_out_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

