Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com [209.85.128.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D254F1EE
	for <linux-sound@vger.kernel.org>; Fri, 24 May 2024 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575290; cv=none; b=AoN3H6C7rf7bCg+K+IwSpL2+oStrYlcD/ImV1h90TbzfIbiLWrDlEIWCwlMesnQut4eWsUNJDxyo3vjnO0t3X0hXORBytUHbMQQr3p2fqHCuKeeuMrib/y9d9rYPZUQNl5dSMlRld/Nx3dp6WcoNN/30XYxoD/YFj/cU3k7ttEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575290; c=relaxed/simple;
	bh=WfcHrNiYZ1rUh5ZyFbpbA7wYQtF/ZVKkB0GXxiX6I+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jR8kSxN3R272gOknyy920NAxF4DCsaWKDsc6BpCDyZS7Sb5zSTPAE68DiYKFL5LTcJgkUyDND01FqKw47yzr3ASqwlHMTWQ8uZCFESwNjPK5G7+UWRSRp10tKn229eRf9ZqjMd+hXG81EygUQyNFGU9hVa85ylOIGg9pdUttbu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=PkFhrdrF; arc=none smtp.client-ip=209.85.128.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PkFhrdrF"
Received: by mail-wm1-f100.google.com with SMTP id 5b1f17b1804b1-4202ca70270so41003305e9.3
        for <linux-sound@vger.kernel.org>; Fri, 24 May 2024 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1716575280; x=1717180080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0fkVyk6q1d4tTjNi28+nVqK2ri87Lnbs7bXh9cTiug=;
        b=PkFhrdrFb+AiyM15a76hUN6prD75vLmMi83hYQg8DWk/WIcJmQxY8RlDlSJmvlsBTQ
         +43M7KPxkgQ6AmGIsOmw+MXC0UizYZjztnZZX8blTe4Z0Xdes5YWghJA6X2m4G5Lv7TD
         quFElVJWGCFHWKjw/v4KOC1AUc3iB+qqBseWIZUX1FjcduWwsaaaPe+HMSDfnp4Um4Ze
         zD3xvxhkL24ppBib97+N4kXAKNwvtVys50gyqsgTd+Brq43cc1bJFDToOO/Ei7MeZg5s
         NmJmpmNPoO7WZDQMqnQWtwDw+sIosFIyEMCMu8ZbHMCYHs/GKPhuo+TXK7BF8hFWCGGS
         Lf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716575280; x=1717180080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0fkVyk6q1d4tTjNi28+nVqK2ri87Lnbs7bXh9cTiug=;
        b=s02V7byrNcnJ3CBw2PRgSNQgaltz4C4boq9D265HHbsAhwTwaw6EvR66UAj8qbzKZ4
         pCaq2MtCTMbGLZ7xt6CyryDDvN9fd7FgBGGG38UtHLhhUidG5XwGMmfnQzZXh41uP8/C
         Q+SY0g/nW+ugNIePM40ol8RLIgjM1X6kISgJ5pseMNUOgWlRMLQzG/0KWu2zkEbQ1p0b
         R0N1oFQA+9j+SxYbt0pcyEeT8ueHkjnJSFx/khriNYmZKPQmRim0ICJ/M4EiAen+4KUv
         Ae8kKk3ID5T6D3fGLfz8SE/srI+yUf4CIa+RS4daR9CxL7fsQxhdYaDznaY5t3bnaHL8
         p+dw==
X-Forwarded-Encrypted: i=1; AJvYcCUKtYanAAPwPJdqznhALIaZRdI8guj8BLGVy8M66w5ef53BOUYN4GsFTVOOb4eosFZWnCTsvA0LDxR0vUQMtiZ3zeIwN3c8JOqsSoo=
X-Gm-Message-State: AOJu0YwhtceYEUMmkQdWf7vjFjxpLT6oTV+SPafGGTdjf1PLg8QXOD36
	3Cndopg31eCiQIAh60aRtpnx35/ztUwnamdeeoysgc1Ny/WPYP2VGJvW/V8vE4UCdIt+v6VkeJH
	34rpNjYa5OFpc4DbnzKb62gVbjiK5+Zpg
X-Google-Smtp-Source: AGHT+IGBxnWkfl21ZWcAGGbY9pK5CCtvRZEInE2s9wbG2L53cMYgxcodxHXuIlPQ/f02qRVKa1ge9AFPlvFh
X-Received: by 2002:a05:600c:3152:b0:421:757:4d3e with SMTP id 5b1f17b1804b1-42108a40f7emr33721035e9.16.1716575280608;
        Fri, 24 May 2024 11:28:00 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-42100fb1394sm5457725e9.43.2024.05.24.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:28:00 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mmc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 16/18] drm/vc4: Use phys addresses for slave DMA config
Date: Fri, 24 May 2024 19:27:00 +0100
Message-Id: <20240524182702.1317935-17-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Phil Elwell <phil@raspberrypi.com>

Slave addresses for DMA are meant to be supplied as physical addresses
(contrary to what struct snd_dmaengine_dai_dma_data does).

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d30f8e8e8967..c2afd72bd96e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2696,7 +2696,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	struct platform_device *codec_pdev;
-	const __be32 *addr;
+	struct resource *iomem;
 	int index, len;
 	int ret;
 
@@ -2732,22 +2732,15 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 
 	/*
-	 * Get the physical address of VC4_HD_MAI_DATA. We need to retrieve
-	 * the bus address specified in the DT, because the physical address
-	 * (the one returned by platform_get_resource()) is not appropriate
-	 * for DMA transfers.
-	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
+	 * Get the physical address of VC4_HD_MAI_DATA.
 	 */
 	index = of_property_match_string(dev->of_node, "reg-names", "hd");
 	/* Before BCM2711, we don't have a named register range */
 	if (index < 0)
 		index = 1;
+	iomem = platform_get_resource(vc4_hdmi->pdev, IORESOURCE_MEM, index);
 
-	addr = of_get_address(dev->of_node, index, NULL, NULL);
-	if (!addr)
-		return -EINVAL;
-
-	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
+	vc4_hdmi->audio.dma_data.addr = iomem->start + mai_data->offset;
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	vc4_hdmi->audio.dma_data.maxburst = 2;
 
-- 
2.34.1

