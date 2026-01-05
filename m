Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E82EBDD0;
	Mon,  5 Jan 2026 02:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.203.221.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767581569; cv=none; b=rQQ0r5HVgr5HBHfKdZIHdk7EuQ8A85dNF96EHBK/CeT7lDZbU0H3b+UlTH47GVfKZNs/rRWZo/m/Hx2JXaFZ5U1/7GWqg408R+gah5jJRU0u5V2hOKdxWYUUzQLEms5nL0W7SJm0j4kgv7M+HpJn9L8VjpVuoX1iUD8+cCakomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767581569; c=relaxed/simple;
	bh=I+p2kXXsP7IpiWWwmySXWCxbRExD53OdyEq1epRLdsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofW82dXLfSg35t6pe48kinF2tU6Z5I0pTTDaYPTbS38qZapMIdprdMqUUA+kQ6y/3j+Kb3yVUTTPWu9Ykcz8sz2Ljl6TQ7veJbr7ULQmhbgLRRBbU3gZ95w0NwGAHPgpzmXTxcCPL7b+tvz3phhXpo4yTxuUyrRTCF2W6w78bw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=S3PCPqvl; arc=none smtp.client-ip=159.203.221.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="S3PCPqvl"
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 4EB23E27A6;
	Sun,  4 Jan 2026 18:52:47 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ragx-Tyzw5j; Sun,  4 Jan 2026 18:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1767581566; bh=I+p2kXXsP7IpiWWwmySXWCxbRExD53OdyEq1epRLdsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S3PCPqvlEctzzKVcXhPGLtbuzO1twRKA9swFuaBXlu6If2eSSUbufX5XN//3rI1TQ
	 UnZJDd0pOjAVC305kboo8DRUl2F0K5lML1MHuEOO3lboouaxmbNpJhFvzki/E8yacT
	 VfKTwrrPWrTWv95ZnhstC95RwL3hZQy9N7+stiKRr/a3P/TZtnOE3wLhdzFVHT0gxQ
	 X25IS/JV3rwI+hDqaUuZz9I5pm1AjzmtwFCKqZG1XX8KqMCHkF9+YPucsjXTK1KCYY
	 ajdomNgZ+s6RY6gCQ/Ztd7Og38YNHmFE0PSAlYclHNdVyVUJyvuDPk4b6MSKl+QDO1
	 dgwQ9JD6EecYA==
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Mon, 05 Jan 2026 03:51:57 +0100
Subject: [PATCH 4/4] ASoC: wm8962: Don't mark WM8962_ADDITIONAL_CONTROL_4
 as volatile
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-wm8962-l5-fixes-v1-4-8e047171da2d@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=I+p2kXXsP7IpiWWwmySXWCxbRExD53OdyEq1epRLdsQ=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWyd0A4Ii/9KR8J7l5Kp88uaOZZHs4p3zA+W++
 6IfbKquxraJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVsndAAKCRDo8jXPO9vD
 /yLAD/4zDRRHhkugpIrd9Sn787B+8vg9jjSo5DA6qDigleTqwR4gIa6MW4xpwbilVCygq9x9p++
 UnW++BUGpt58r7o21/55wJhkw7gbeLbl8geYgRqhXvRKwRj3DguR7vttmQ/+fLj0kENKAPebk/c
 Tg7aURmfg0+QCCxzeZQSnqwIs+iPwTjAYlN6I+r84aOj106ec+jijyBJdhqO83EHbOUzcXMSCgE
 VjoxPEkNto3AxO3+ThNrxEeJNDTRao72ckAQobj4ecoy2BpR++lnWbC6/xnjciCMrrbnVIFxwiz
 pK4j9EOUNx4Zg18ZdAVY3aLIMwGcINCVnOozx2hugnAAI0JppG5KShuDVUsVe2j0C1nL9DvtpCS
 v7D7ol3vYF5bK+LTVSTnSgpDzYezq2X9ckQOoXo1evshJB2EFxJ/JZ5iL2iMkpUUPFp2pEV5EwX
 AFG7zBhK+kLmMoYwGZZ55A8OVidkXK8T74HWdO4jpXndUmeTdatiYTaF70uy1LRSO/EcW38HK8P
 kRYWRMo6BUFnob4Jxo0hzmjQvrtrBeGMZw6vdqMreUWZxQjCAYzn+98k/2U7e2Fw32KcI/tOFVl
 qzVdoU/i6WtdZq9jGesWfjcmUJseVJE31VPDi3PgqtxP8LuseF0UwoEy0Jv3waJUtQtWhIBS2HQ
 inN3kKgXnvQON9g==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

Only some bits of that register are actually volatile, so to prevent issues
with caching let's simply bypass the cache explicitly when we access these
particular bits.

This fixes mic-cfg value not being reapplied after runtime resume.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 sound/soc/codecs/wm8962.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index dd73b4dc1b97..22101284c095 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -793,7 +793,6 @@ static bool wm8962_volatile_register(struct device *dev, unsigned int reg)
 	case WM8962_CLOCKING1:
 	case WM8962_SOFTWARE_RESET:
 	case WM8962_THERMAL_SHUTDOWN_STATUS:
-	case WM8962_ADDITIONAL_CONTROL_4:
 	case WM8962_DC_SERVO_6:
 	case WM8962_INTERRUPT_STATUS_1:
 	case WM8962_INTERRUPT_STATUS_2:
@@ -3074,7 +3073,9 @@ static void wm8962_mic_work(struct work_struct *work)
 	int irq_pol = 0;
 	int reg;
 
+	regcache_cache_bypass(wm8962->regmap, true);
 	reg = snd_soc_component_read(component, WM8962_ADDITIONAL_CONTROL_4);
+	regcache_cache_bypass(wm8962->regmap, false);
 
 	if (reg & WM8962_MICDET_STS) {
 		status |= SND_JACK_MICROPHONE;

-- 
2.52.0

