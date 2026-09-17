Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A94AAC7C;
	Thu, 17 Sep 2026 22:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685496; cv=none; b=g+aP1NI345Zkt7PAAUIw1rXSKtC8iTlPW4/CaG0pD5p4HiUbkRTVrgSxg2fwaAeGrOdbuvyI9kBTMtb1WW3WWdzjvjl8m/SDBUc7T2l+u7jdYTG0pyJRuj2HHPJ8rmi8jyBMunIA6x+86Mhs5bkH8HSL3biLOvwPzz0U717vjKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685496; c=relaxed/simple;
	bh=NpfPxfF8SH5g13f6e29Ti/Hd3xnhPh/nrLdHWeVXBnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOA/Uphhwrytb+JfUTPLnK9kTUowqBi5q06kR1n9IfVyyGnWZWBa01Y1bclNuloIhdV2+3Fu5HVvmFdDUKhcxMp++/A3hM4ucB3MFN6n0R5WGCGAhhcbm0CcGdBiAAKxi7DsO+hUVYGr5UPxEudFUoH6ssQnSAxUbfzZotcbonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbQYRp/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbQYRp/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9A21F000FF;
	Thu, 17 Sep 2026 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685495;
	bh=LiJY0b9UitIddl2z6ljxixXtvef640VFhF+J8WsYzRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JbQYRp/FdZElIvzsqntWF3PmFHx05CSnnEHxQJ7TnSy7Xwcfu+3nj8alJGaAXXy2L
	 3I/GQWd6gdCHYakD89RhqnnQKgNqrz7tml578AuWXiX7ovGEl/8yLWMYTa3pdtedcl
	 UQxcFnQf731IywaKjiMMhK8ivNEJRLb7zdHdlrLy03f8nx2jpbreUmFevP3fpXPp6A
	 BVOnql9UcfOnoqtAfVr8reFfX7ve2oxVq67vuhobZuraPY+MJkY2fAQh8tU2bvRHEj
	 x9L5HzqGgIpBhYBv7s7KVv27fzmD2xY9quw25V1eYR9g9mCuaMrfkmGLH24i7+zck6
	 P4kAta/JDVAZQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:07 +0200
Subject: [PATCH v2 9/9] ARM: config: u8500: Enable audio graph card2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-9-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Replace the removed MOP500 machine-driver option with the generic audio
graph card2 used by the new Ux500 device tree descriptions.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 2fe25f5eb9a5..1015f9c3ef04 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -122,7 +122,7 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_UX500=y
-CONFIG_SND_SOC_UX500_MACH_MOP500=y
+CONFIG_SND_AUDIO_GRAPH_CARD2=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_UX500=y
 CONFIG_MUSB_PIO_ONLY=y

-- 
2.55.0

