Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D9036A35A;
	Wed,  8 Jul 2026 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504726; cv=none; b=Rr3TdyKlCrILjGECnJKR95i2Ms7/3bhZurmbxSnH52Jt9I9ir30Cz3FzM2Ru+QsTaLWXsYUeR0D7iEUzJDliw5TpfC1tywr+AIVw/sKg+oaMT99rrTSw4Nhacz2s4rSXJJBJgzUlt6ysndtO1M8vIfxWFtybUq/32CP1wOxN9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504726; c=relaxed/simple;
	bh=CeJ0et5lPg5l6NxwisPHPfHLqZEnPHf2oJWWzrVEwUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXalLIyUeOarCA1qZR4HLcG77/sGi66MzzSOsAnGd6sLRIvjyffUgsmVjPa61hEf5Br7Ej75pkRghbXGHZ1ngcvx9py5pIK/jxcGyu6b2srmwj9bmIfbhxovDmjatHbgSBdk/q1JEd9ywB+dM2QZEqR8OgnHZLRyA6lBkq5FPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWUgzKgV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWUgzKgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368DD1F000E9;
	Wed,  8 Jul 2026 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504724;
	bh=ue/tjciFsbBGN24GHDEczZfMiJwWLKV8TaHNRMHIMMI=;
	h=From:To:Cc:Subject:Date;
	b=aWUgzKgV2OYO54hbmvzLrkp4DnUdozERPxTSL75hNWq3514Hws0c2cvN5HNYfCAvg
	 fqa6G5tffzjJajx1JlPJ7hPZJuvRueGNUqOOMp+XwAsPZKtw0aix2xr4KkRR9cxRdS
	 8EolTmjsz5VnP3jn5Cg07uYZlbU6P0V1+v+8oczKtLsJfIcXCklaNJjf4FKe1C5/UO
	 2geDllEBpu66tslU2TrURA1+P5VPJv0l1OqWpnC8ytOifs4DCww6UYXajaXYH2fSZ4
	 h6ZVJs2UKuwDBJKkydFjO91Dr1bQyrivnlgSTv76x7mMzU2dhwiz09QEwKxjj58R3u
	 T/z0gC8oKduRw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: pm4125: Switch to irq_domain_create_linear()
Date: Wed,  8 Jul 2026 11:58:40 +0200
Message-ID: <20260708095840.385526-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
---
 sound/soc/codecs/pm4125.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 29655175ea28..674a2fbc4eda 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -5,6 +5,7 @@
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1295,7 +1296,7 @@ static const struct irq_domain_ops pm4125_domain_ops = {
 
 static int pm4125_irq_init(struct pm4125_priv *pm4125, struct device *dev)
 {
-	pm4125->virq = irq_domain_add_linear(NULL, 1, &pm4125_domain_ops, NULL);
+	pm4125->virq = irq_domain_create_linear(NULL, 1, &pm4125_domain_ops, NULL);
 	if (!(pm4125->virq)) {
 		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
 		return -EINVAL;
-- 
2.55.0

