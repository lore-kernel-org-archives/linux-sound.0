Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807977;
	b=hLL02dhoAWaq+/zI5yOzvZeJeWplJQU+k7kgsNUEjN3OqYm/HjyIlUsIh/wAEhmjIb1N
	 E48ITxnxBOVWqqDBswaavACbsl7KWu0VmTrMdQRPmlsvJ3q0ujx2K1X+er1O1fFm61adl
	 zeL57u3068odCeqKpCJT3soXeP4wC1OagQrWKepuLfgy1SOJmgHCoi6EGxEO7af7U1xyP
	 BxJjxiMnQFMlwICQX4Koos7vlfEDbWQcjH3Gje81giL1fOWY3zEWOeeZ7RoCpU07piP+J
	 0XRiwswya8Nz98ijBCTOs7th+sv6Qya262f9Y97txjJq1s4yU22HYrpUcxDVsqU0oRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yDFM3OH9coPHnXLmm96GcIlRNTlI+YDQ+IxTXn6YrWs=;
	b=k9VKwwdZC6zk8QlD+q9cKS1VWffVe6+bWdYbHVKPn6n7JGOOaeXXJAYbSC70YexOb6EC
	 ohSXNDf1ABK7pOTRF5u8UudGKetg8E3eBmE5WrY9XUKrvKGCBI3QYgDg+fXWySsAUqxUY
	 4EfgoeAzR4njW9Neo09WbfbJ6gx63tdg6IVh2GkWtjQ/0AGgVCYCqwt/PgQk8BTr0qczM
	 mYNdv5bxs88mDziDqMERLWKXQqYL/zRHBVplRyPF547f/Ukt+jXdrdUZp5RrRZMlJHRZE
	 pMCCfb0mCTwV8iSSCHZji6+/ltu6Dw+HPptF34SU6LN/xPPBbeAuZ5A9iIKazkfP2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urUMiGWt;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5607606D80A
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 15:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5607606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urUMiGWt
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d885929so716300f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807975; x=1794412775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDFM3OH9coPHnXLmm96GcIlRNTlI+YDQ+IxTXn6YrWs=;
        b=urUMiGWt1Hr8PhqWhR3fsS9H9vVLI5GgS7YP7e4IUiqEbNnvhuLfzyR0ahOqODdVm8
         77J1mn9vMPZjXcGIn0ZmYk+mpPk4ZskWXKitEjx2fEs3bHbpTOjE8G66n12NHv1GGCkF
         HVjeJpUawL7YnP9t6vVLkangul8UMaAjSmn7n8tEP/QiIZ42+ZtJLfIIKZLYvDuBIpeu
         71NgQ0ikE1zpKpqYMb35Io1cjdJNgq0inoB8MWnprvW/WsQ59awibX9BMNVta8jwxXOf
         KsfoUva4ws+mDhK5pZbFCcGtiWQbmelBFP7lwNL8mZUFHzsk8FLo5EUkpTYkZIy92JBt
         JVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807975; x=1794412775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDFM3OH9coPHnXLmm96GcIlRNTlI+YDQ+IxTXn6YrWs=;
        b=zep7lWBnwZw0YpG0M0F6u/5Mk4KpZ8Lv1hvYHlVVQXecGXuHw+GPjyxH/Y2NS4PANp
         QMp00GMomOSqu5TksZODOM0QvajyV38ejUblJCuyPyl2rIoOiQ7netBwZPBDRJr/wsoL
         YEP3/K5XW6GDqFjCQJYy4GTUlbibZhx+akf2Jx+lZ00cnJt2zdWq80QoI8BbOz9ZC4ac
         RhUoc81/WyOvE9lqHbGw7IocPp9xxlMpXATji/VuXLTyN7YiCxW+jDFI66Ji9SUKaZtc
         Yc7iDCYPni6cYupMYKKusGayCEQuZQmFaYlca7tp1Bg/rmDckZRhZySeCaMnEV1CwpSr
         03sg==
X-Forwarded-Encrypted: i=1; AKwUvBzsmIaeCyJEwEv9ReNzNDBPA2uvHTp/l46IFLO1a+0pwdf/43f/WAOrElAEsSOVAgIWpi+mVipsDaiZVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z96E1chH0k/i+ktiyQv/3M9ZGXqGaFRX9PBssVr/Go2elOjrG3q
	/em5wePrMDe9o9eVvcpwJpOyZ8XGSXSM4stOSi7nrt0YipySQJQEAq5y
X-Gm-Gg: AYBFou3D79iCHlIxGCf3jeRG34pUF2lZ6LVobuqHKojgnSlVMnnybp9Wc89ecE5hJGI
	ne0XqHXssDvAubWmoRkKmiy06zhmPPzk+RmXB0y6skM8U/rE3YDoOJVEMuxASMRPCF5rtb9EsTt
	RDJKplkgmkhToiKqz0pnR4wXKkrD8QYHopAKFnPB04Vokj0N5etZvEh6hQilnZJWY6E/mCstVf2
	vMV/9C5UQtBp7jQGutErM/7Ha5WefgQM3M6PoSbR6NuOBb8j6/0GRsrjrwFblWJWnwPdG5IpEMu
	AQ0GqagjDyzmCx1/GAqx7M4soNdNDwc9BlzsSubpCYj8yWeWUlYEt8Pt0rHP8bspJZ1ea9ZZVJr
	nZvmJZruuOFevxba3Ea94hU0mjvDbd6d9Pq+TTPRCatALByMTAfHksFHjLF2IzhrxNf5mXBAhX5
	SgQYK920TaH+L5InI3ZyqsT3QNHGjcPZe0Wb19ydXipMKxf/E7qXo9C65UyoNYx53cE600oikCM
	azFfCFoL4SYqhdqa4U8hV3JOcb7o9FmXkTmOkb438nAIo4JIGSrycGLWOxpXkb6oiMccgGo407A
	Hli7QMYylp5ZLDbA+Qab7DZORbaZmcln/+WXb7GB4w5wlQr6t71uya6p3vd8kCOoxmYndguNowH
	GPlt939Vy/3h39egyuQJerDtSeILgjIMe4jsOjcsZWlLWWP6QuQXI
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr398465925e9.21.1793807974840;
        Wed, 04 Nov 2026 07:59:34 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm140069925e9.12.2026.11.04.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:59:34 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	patches@opensource.cirrus.com
Subject: [PATCH v1 1/1] ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL
Date: Wed,  4 Nov 2026 16:58:32 +0100
Message-ID: <20261104155832.57738-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

From: Stefano Radaelli <stefano.r@variscite.com>

When switching SYSCLK from MCLK to FLL, DAPM may keep SYSCLK powered
and skip the PRE_PMU event that normally enables the FLL. This leaves
SYSCLK sourced from a disabled FLL and can cause playback to fail.

Enable FLL_OSC_ENA and FLL_ENA before selecting FLL as the SYSCLK
source when WM8904_CLK_SYS_ENA is already set.

On VAR-SOM-MX8X, playing audio at 48 kHz followed immediately by
8 kHz reproduced an I/O error when switching from MCLK to FLL.
With this change, playback succeeds.

Co-developed-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 sound/soc/codecs/wm8904.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 96d2e54a2c6a..efa108544927 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -338,6 +338,20 @@ static int wm8904_configure_clocking(struct snd_soc_component *component)
 		dev_dbg(component->dev, "Using %dHz FLL clock\n",
 			wm8904->fll_fout);
 
+		/* The SYSCLK may already be on; if source changes to FLL, ensure
+		 * FLL is enabled before selecting it as SYSCLK source.
+		 */
+		if (clock2 & WM8904_CLK_SYS_ENA) {
+			snd_soc_component_update_bits(component,
+						      WM8904_FLL_CONTROL_1,
+						      WM8904_FLL_OSC_ENA,
+						      WM8904_FLL_OSC_ENA);
+			snd_soc_component_update_bits(component,
+						      WM8904_FLL_CONTROL_1,
+						      WM8904_FLL_ENA,
+						      WM8904_FLL_ENA);
+		}
+
 		clock2 |= WM8904_SYSCLK_SRC;
 		rate = wm8904->fll_fout;
 		break;
-- 
2.47.3

