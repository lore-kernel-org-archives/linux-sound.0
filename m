Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297553;
	b=KRfJqFSnKJ/KbCCkisjmR8QgrdA/H+9S+CyNRACCduLZmUopoMaqe8g3HJlwj0K4kvhP
	 Yz0MogNtnJdVhfkYg7gSXN6xsy5eTmRNt4jBKc06usoWNSfblbz/mp8rTRvNGUKj79HTG
	 vS0E7LwucOU3bw4u0EcQdHfzNckfs7wOqkrpRbc5QIenQ0NyJuF8lbURVGzAaVUvjECub
	 IXagKqvTioOsyetGjlXggJYY9TNomdJ7XRgtp2JpH7IGLUbTCxFsIkX9o47ovy0+Sar5d
	 wti2eMC+zQR+AYAQ2ey/F7Uxjia7iXdY4e5ZZc2KSR9EpWDVkjdO18esNHDZGGOY6fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HxK09xxN2287CuasdDaPYZTGt3qPRFw1gcuA14R7A5g=;
	b=1nExvRZo74kPNJkDB/IXrF+Xn4+fWkle+yRjlDYIMjwWezWgIOUaJ0kdX2Ro4h7IHAWo
	 5igi+dVT0eC5D7S9xVn0EYC6yF760Dd4dfRnmGxq0LyIeXfN3J9At1nYyeBjdXWK9/0Aj
	 FLj3/VlFtE33qUJ4bu582Xd47WmXXaRtIPYpI3gT7Fvp9/3hrJs4h7BbRaVCA/NBbqNUs
	 lES5CpJykLuZmmc76er6QHAFQpWMkGl5wXw+y8QlDT8sfxpkcL7iyuKKg/bv4cg3Bm3cY
	 aV4yIvK/fv5nHFSjtEIQP/GO25huqzoFQdO3e8cLc/kkHb/4SwzThMO1obS3U/0AxJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suj8vKis;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D17606A336
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D17606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suj8vKis
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2872608eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 23:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297552; x=1794902352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HxK09xxN2287CuasdDaPYZTGt3qPRFw1gcuA14R7A5g=;
        b=suj8vKisfeaqzOS5JiCAThSGRGDCktf4osaRC9YDApBn6xYoTckWsv3rSfNlKdtTSF
         2SNfd6amg9nx2D3v5dnZQfHXRYOuyg249gFgl7BdzwuFjL0TTgKBPD07fhTxfUTKi6bj
         9HQFvXPBDBQ7+aFT/4XXROlgm6RbBEXYknQKrr8qyhVglSIcrMrvTxWvU7ILWtM24TBJ
         1U5Js+2tkDOp+277U7aVd6u5rOsWFgkBGJkxyaonsZi97xV0vOpIzAws7/QwN2GjJBe1
         ue1c9vQKOAbS9Pmk3C6tiPJXFFpBSSJW5C4q23jcyBhn9nhXIjSlwT2oDEMEv0F8Dc1i
         xKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297552; x=1794902352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxK09xxN2287CuasdDaPYZTGt3qPRFw1gcuA14R7A5g=;
        b=LTOzL3vc7ZnCU5rGV2s7bqb4ly7Mml3vp0KwBFT0dBwYcbShsvF/HDi/ueIZ0wf5/P
         vmm3M0Mp7Unecspr88SwWucGXmafuu/OEci9hTsnyJHGAj243MKHRxBaPO7yFEXlMCbT
         0Rf1xR9WgSRlglMA/frBdsrWOnDYzXXacY605vFT3h/VIuwXFdlFR7bqD27zzAdstgyI
         gJyewJ690lwYqZkXAEst+FmuYjfqHu+rYGJ7/BlfCI4eMf0XFs1ngUrfjGb0zbZLhj4h
         DiOg+wWl/8kNK5T64wElLP+0SNfXJUj+6p9zbcn7J84RLtp5oeWFjD9IEMIBfjc/8Gnd
         kV2w==
X-Forwarded-Encrypted: i=1; AL+hErEvfPxUtPAeqIm5KYU28f5fE/ak/fvr47FOZPou9QKGZT0yMFdyRbu6ETNIgf2v+CfespaNtIcW7aP17g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lDkjKCBB3TEQgN1zfI1NWTayIQgHEJTeFFXNkvrwAc4igIjlv
	KuyPVKj6u7q2VlnZhxukXGpGmjRTZpH2LELPD0a/Abb4HF6h3JsZdlw0
X-Gm-Gg: AYBFou3HR/rqG5MFybATkMGvVqCfuvLtl/e1z89L1iGg0/DtnnstNjNuO2KGU5ZLW0P
	BYDHNjnOerHL+HDzrpRr4bbVyA7d71IB6bPG5YRq8v/k34lBV1X1nUHOa8ncmAm1ZjzC6wHigHK
	PZAPMecA3sJrXbnBb5XYhR9I9ZiQhwj34ldM8Ab6GYkxTobRGzoMSyD5t7wuy5DV0ry39lT1UgY
	Bkcsj5jEHl5R4jDdmEkMYb8GKemnNHID2f98BOZPZFcvhjf8ULyqQXy6Hi+ZOB9N6WDudW1C3YT
	K4sfziN0olr3b2Xld279LxbTKy16OWuPOuYGzKQj3smUDf75kBruWONJHh6FutXGoEIgFfe9ZeC
	l0Tg4rmMSc9Ua42r0FHaA/udXDF6m+iY8jlXFvoPqtcyccht7RC1oH1XQ+Nmy5T9FEZMqJO5CaT
	hdicTwJPZFESvqYn9szWG/QtXIXvA+DxxDX6uQOH69j9qu62zHG89TVP4ZlIGxEZFxbyA/SNW+M
	h976Z0wiSAtCZoPB8VH85Z6maI8A9J/4P5ZQX+sAEWo2eRy4wynW/pink2V+LKSZX8hXEq3qWmC
	O/PQRqShLCNW5MoJTUJCpeIejM6yXPZBx/d2pBrnBc5ewWuJCNNqaHFjNbhi42J64pBHPMPFsyu
	n9keKHZ6xAn2uI+CjmczPohiOIsm1wdwe/OAeggwa2vpl
X-Received: by 2002:a05:693c:394b:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37520713cbamr2941577eec.37.1794297551590;
        Mon, 09 Nov 2026 23:59:11 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm4498321eec.3.2026.11.09.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:59:11 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: fsl_sai: Improve error handling
Date: Tue, 10 Nov 2026 14:58:39 +0700
Message-ID: <20261110075841.12104-1-phucduc.bui@gmail.com>
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

This series includes two follow-up changes for the FSL SAI driver,
covering hardware reset handling and dataline configuration
error reporting.

Complie-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
  ASoC: fsl_sai: Report dataline configuration read errors

 sound/soc/fsl/fsl_sai.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.43.0

