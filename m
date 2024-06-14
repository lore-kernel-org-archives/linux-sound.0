Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85819ADBF
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382955; cv=none; b=drvY8U4gol0NW5okdOQFRwTtyOBcmIESxeus2DnFX9kBrsSLAE0JMypkU3ok0k8JMMqkwDDcflnyu4LwHb8MOIE/XSdOp0uYfuGigdEKyooUnjfYmeg7jODm4wdPicSNUefHy/zfDO/VaqAnpzyeCtx+EIrI1VMVL+/BO5nbXrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382955; c=relaxed/simple;
	bh=9Uv//PIDIhNFrEud7zayoVo2Y2+fPu69lRG3uydiDVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=etMDCdywLBIP5fuNlyHPQCxU7ipJQ/wwlB6uuXtgwEeogpe46De0kr8w/Vx9hK30wJXfMyT+WAwV0A5FHfQAyl04f6Xk+9o/T6kesexdOsBPaxsX/rcKsQoN7dF9ISAFWUB1sd320W3ppiPjAZEvne5TkJRs+fJMlSnZsRzNfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=FlN+Hvdt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="FlN+Hvdt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso3718024a12.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382952; x=1718987752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1mZ6Xg3BCF5HN9VBGCY2svS6vlfsx+tF7JIqIcFeQo=;
        b=FlN+HvdtSGBu3ZoVYasoq53tKWVh8YG5HPCcuazoJOxw/pH1eyhCVCBnvCjdwJk/Ku
         GkZQzH7xZDroCNXD38HmvPCLIEf6ui4J6GdeiqVYsiaLshSQdMXhrSCRMXVeKVLj9adu
         WNW8WRbgpectAczzvgBgISvFZi9GWvIFjcLA5vm8oKCtgERGWBRxZuNlkxarmMLA+uI1
         HKZN/0wBPDfDPk/bDL5OF1Mp3Ofq2OGBbIPbaujjH5N+kkmI60bRoL8rAf/jxdpKDBwF
         fyeuklTLvbvLw5U61r7FFD8O+ojKTxJtoTKucdiwqVb42xUedqI+Mlo47bTTrVBarFK9
         s2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382952; x=1718987752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1mZ6Xg3BCF5HN9VBGCY2svS6vlfsx+tF7JIqIcFeQo=;
        b=tonqQttFHYOhKrlRhQmiP1FIDvpdg7OwDdKFTh2zKYmZsRQaFdM0KxDwbWSaaO6wFu
         Mk5XsrOPTBhf+KVL92js4cX6GL0KHvb4elPxx1fns8edULNm7SFmdIzfgm1lH1QvFlkD
         cllXpWUq2SbTaooGE855xXbjn18IXQcjUHuvtbuaa6+0jNLBjK/y/ccCvBOaIZC8M4zg
         0XEPM4pwfn/c12KNyu0nqrbQEJ6T3dr4HctgFW9icRQsAabO9po6TggeDjw6xQ6sL7/e
         O+SGVdF1i27vssq/3tyWz5Fhua15kEo130hMSqaACtRrAvTLt84G/hAK5/0JLxmQxQLC
         11JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcJxBj1W1C9EVsCPqeJU3uLWQaNpegANzM2P++I2lCcufODdKmb3MRj1DH0tff1H4cHP34pXgtcxTV2bNwiMvURL/akHzhfDtbKqU=
X-Gm-Message-State: AOJu0Yz850NMQkBxjPkwxcO/nVGkfK1u4qUolO80TtBbKWzADVv0VJhl
	/yIizY9++owa+ocyJ5aq2sMGuQV0x5ujRxX23nCx2Q5xq1Z3Q78UDe/FWPzCEgA=
X-Google-Smtp-Source: AGHT+IFU7jz24QjE0aD7m2kTzDTqVT4xFAQAa5WztkGdzqrtdSmWclJ5lx57DK5AVkuZNzL75iIn+Q==
X-Received: by 2002:aa7:d298:0:b0:57c:c3db:2a5c with SMTP id 4fb4d7f45d1cf-57cc3db2c52mr1787153a12.10.1718382952002;
        Fri, 14 Jun 2024 09:35:52 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:51 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/4] ARM: dts: lpc32xx: Add missing properties for the i2s interfaces
Date: Fri, 14 Jun 2024 18:34:50 +0200
Message-Id: <20240614163500.386747-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'dma-vc-names' correspond to virtual pl08x dma channels declared in
the 'phy3250.c' platform file.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v3:
- Split previous commit for separate subsystems
- Add properties to match dt binding

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..bbd2b8b6963c 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -221,6 +221,10 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				dma-vc-names = "i2s0-tx", "i2s0-rx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -237,6 +241,10 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				dma-vc-names = "i2s1-tx", "i2s1-rx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.25.1

