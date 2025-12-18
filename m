Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4A30DD2E
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054872; cv=none; b=NwOEDipTzhj6cjs4ty5PV8w1sipNuow5Wz0GE2Lm4D1P0pS2J+WDsGZNEfFEv3KFim4rtcIABPwKj3RflIth8DLCYtO1zL1mpEY2WJ0t4IfpXooEltyLYZXDjsHmeWhxXMFJ+WN52Nn5lOq+VjGVsH24F+tWat9WmqjT9nmIRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054872; c=relaxed/simple;
	bh=rfmBDxSL2uBg+nw/44jCY51xi8cWyCr1IHqQEe7M7Lw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYsZQT7TeOJc0WrLFb/3HLJ5daHBlwpWE6mf8pFDfKre8BnFbgB/RP3Nx+rbJ4SVjsywpWmQvOXlBe0UI9MvO9wzskW7uXTVPaSqF8NLt2uZgiiaUtvrxKyyKRimnGJ+cvo3ggzwdtpwXnNRboUPYIBMDby6UVTHxwceuBbitVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsWb2CSB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsWb2CSB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f30233d8aso6455755ad.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054867; x=1766659667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2h4wBX5s2YkJE1Ho8rSO5wuuz947hqkFTnohz/OHlI=;
        b=SsWb2CSBD0uLu/9XPgJdypUqMdqoZccob7/7+TRtNdKxKDXTdrKK8jEL/llLLhE4nt
         rE2CgL/n2b43loBj1usJ7/5Ljrt/xdaehXhYb2NAjbIfXHrnq0+xumcHcKlmo7SXnBxt
         94aqJc7+m59X29BuBaebY7tYNcQ0TkS5HAZrRJr5MyG0tqGwoH4l7NmR4Uj3DssPnYOv
         lVKUTS4LVGA0B03a8oaW41mDr2xHFDtjNvmODcPYVRxX8rM1PUv9WZ73Z7peo2ieC5wn
         34NA0lhgJYG6uoEwAJ75UUCe57oebrxS65Gm6ULnLC66nKbv0Jmr49lBGqsLzfa0q1yL
         cXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054867; x=1766659667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2h4wBX5s2YkJE1Ho8rSO5wuuz947hqkFTnohz/OHlI=;
        b=hcOZuyez9QAJYuPz1v6zWIfr5xDW0JB5LikcxoMlHpcxeaT5cBU8qL3WuivAvzk023
         T4VZOUib3Od8NoCEKkn/vHcDAEhdUxDU01dYi0KyDeeeWY4LCmtd/PZba6iatLqSqtJz
         KRCwhjrE9iggzEo/eF7wK1Mi0dpMZ5bFoHNOWZ9wqcwur/vNHHtnNNyQUhA26o+rrgbO
         ZZMkhD5cxfWjMYY1gmp4k/Gm1gPlgUDzGUTcND0ZNGl+Sde+NKJwdGK7j9yOOI+j6Vwe
         hNdeqOZgllqlUbVYGHLGoL4xiRuL9ZfSg34ux1WNKe/EpncdIhxUaZhN4K7C8t8sn3A/
         RbRg==
X-Forwarded-Encrypted: i=1; AJvYcCVmn5nt1d762EfIucnLjE2pKjkN/AINXsi7Ch7+QYFVxkQHrat0jn3nvkwk7Qm+/w/DJM7PVAdCLo1Qpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hp6HMydPmNUsQtkhCspc8aYNJ7qD7onc2li9/iZDtMVh0OUQ
	X4pf2o3lpLzAfb2uV5HjnZrY9BOJkdxiuGJCuT+hYdrLjXUziGmZ+G8s
X-Gm-Gg: AY/fxX5smGr7fR1/sV1sC3uUoENKI4Cg5zVXp+qwPAgrwWZnrBsLVoTN1fg2sEWw6Ke
	gv87NN3O94YFZ3/fwo2HXDcsMRDUrXYwvMS0EI3PUScUR0Fq6uE0nn2ozSjIfunM3TbOb8zUHo+
	1Gh02BrgowA0f85/NSMRCN8oZ1oUVxVMuvjXWhfeDgiJLvTsIRrNgGzc8AbcQ16lYlIA5npI/U3
	Sk1p9M3pUeQdGqtwt83An+Cx1senzEFB0RMTk+6rdNIULmuefo+P2ddWh1LvfS1OU1VkZ7aXmJG
	YqXQrKxZQGekz8nhObFeWjmRTQisuVsWvo7cnG7Krafx77+wXvEu03iWFnMuYhiGjx/XqbCf0P2
	z5Py5UUr29H1zbiPeA1XkxRoLZW5XZkzixWs5aBveFdqqETrtqe/JqpAvEJSPei/zckXsWjbOgu
	IE5BmNzawrDKd1x4mzmVFrESYO
X-Google-Smtp-Source: AGHT+IGdNzK/RTR5elTkZ8c3MxFiciAJNSLvL/WBaVWsxcJdfBpM9aNo6l3mZEvLo+kMJobLHKqspA==
X-Received: by 2002:a05:7022:e1c:b0:11e:354:32cb with SMTP id a92af1059eb24-11f34c39abemr21218133c88.49.1766054867436;
        Thu, 18 Dec 2025 02:47:47 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:75e7:7f40:e8b7:c3ce])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f473ebsm6772071c88.1.2025.12.18.02.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:47:46 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: fsl: imx-card: Do not force slot width to sample width
Date: Thu, 18 Dec 2025 07:47:36 -0300
Message-Id: <20251218104736.600794-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx-card currently sets the slot width to the physical sample width
for I2S links. This breaks controllers that use fixed-width slots
(e.g. 32-bit FIFO words), causing the unused bits in the slot to
contain undefined data when playing 16-bit streams.

Do not override the slot width in the machine driver and let the CPU
DAI select an appropriate default instead. This matches the behavior
of simple-audio-card and avoids embedding controller-specific policy
in the machine driver.

On an i.MX8MP-based board using SAI as the I2S master with 32-bit slots,
playing 16-bit audio resulted in spurious frequencies and an incorrect
SAI data waveform, as the slot width was forced to 16 bits. After this
change, audio artifacts are eliminated and the 16-bit samples correctly
occupy the first half of the 32-bit slot, with the remaining bits padded
with zeroes.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/imx-card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 28699d7b75ca..05b4e971a366 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -346,7 +346,6 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			      SND_SOC_DAIFMT_PDM;
 		} else {
 			slots = 2;
-			slot_width = params_physical_width(params);
 			fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
 			      SND_SOC_DAIFMT_I2S;
 		}
-- 
2.34.1

